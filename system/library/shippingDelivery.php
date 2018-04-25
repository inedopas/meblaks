<?php
/*
  *******************************************************************************
  *  Module: Shipping method "Delivery"
  *  
  *  Web-site: http://opencart-modules.com
  *  Email: dev.dashko@gmail.com
  *  © Leonid Dashko
  *
  *  Below source-code or any part of the source-code cannot be resold or distributed.
  ******************************************************************************
*/

class shippingDelivery
{
    private $db;
    private $config;
    private $cache;
    private $data             = array();
    private $lang             = "ru-RU";
    private $delivery_api_url = 'http://www.delivery-auto.com/api/Public/';

    public function __construct($registry)
    {
        $this->db     = $registry->get('db');
        $this->config = $registry->get('config');
        $this->cache  = $registry->get('cache');
    }

    public function updateCities()
    {
        $areas = $this->apiGet('GetAreasList?fl_all=1');

        if ($areas != false) {
            $sql_values = array();

            $this->db->query("TRUNCATE TABLE `" . DB_PREFIX . "shipping_delivery_cities`");

            $sql = "INSERT INTO `" . DB_PREFIX . "shipping_delivery_cities` (`city_id`, `name`, `region_id`, `is_warehouse`) VALUES
            ";

            foreach ($areas as $area) {
                if ($area->IsWarehouse == true) {
                    $area->IsWarehouse = 1;
                } else {
                    $area->IsWarehouse = 0;
                }

                $sql_values[] = "('" . $area->id . "', '" . $area->name . "', '" . $area->RegionId . "', " . $area->IsWarehouse . ")";
            }

            $sql .= implode(", ", $sql_values);
            $sql .= ";";

            $this->db->query($sql);

            if ($this->cache->get('delivery_cities')) {
                $this->cache->delete('delivery_cities');
            }

            return array("success" => "Города успешно обновлены. <b>Всего городов:</b> " . count($areas));
        } else {
            return array("errors" => "Ошибка получения данных от сервера \"Delivery-auto\"");
        }
    }

    // Обновляем отделения
    public function updateWarehouses()
    {
        $warehouses_list = array();
        $result          = false;
        $cities          = $this->getCities();

        if (!empty($cities)) {
            foreach ($cities as $city) {
                // Получаем информацию по складам в каждом городе
                $warehouses = $this->getWarehousesList($city['city_id']);

                if ($warehouses != false) {
                    foreach ($warehouses as $warehouse) {
                        $warehouse_info = $this->getWarehousesInfo($warehouse->id);

                        // Сохраняем данные о складах для дальнейшего добавления их в БД
                        $warehouses_list[$warehouse_info->id] = array(
                            'name'           => $warehouse_info->name,
                            'address'        => $warehouse_info->address,
                            'city_id'        => $city['city_id'],
                            'operating_time' => $warehouse_info->operatingTime,
                            'phone'          => $warehouse_info->Phone,
                            'latitude'       => $warehouse_info->latitude,
                            'longitude'      => $warehouse_info->longitude,
                        );
                    }
                }
            }

            if (!empty($warehouses_list)) {
                $result = $this->updateWarehousesQuery($warehouses_list);
            }

            if ($this->cache->get('delivery_warehouses')) {
                $this->cache->delete('delivery_warehouses');
            }

        }

        if ($result) {
            return true;
        } else {
            return false;
        }

    }

    // Выполняем запрос в локальной БД на обновление складов
    public function updateWarehousesQuery($warehouses_list)
    {
        $sql_values = array();

        $this->db->query("TRUNCATE TABLE `" . DB_PREFIX . "shipping_delivery_warehouses`");

        $sql = "INSERT INTO `" . DB_PREFIX . "shipping_delivery_warehouses` (`warehouse_id`, `name`, `address`, `city_id`, `operating_time`, `phone`, `latitude`, `longitude`) VALUES ";

        foreach ($warehouses_list as $warehouse_id => $warehouse) {
            $sql_values[] = "('" . $warehouse_id . "', '" . $warehouse['name'] . "', '" . $warehouse['address'] . "', '" . $warehouse['city_id'] . "', '" . $warehouse['operating_time'] . "', '" . $warehouse['phone'] . "', '" . $warehouse['latitude'] . "', '" . $warehouse['longitude'] . "')";
        }

        $sql .= implode(", ", $sql_values);
        $sql .= ";";

        // $query =
        $this->db->query($sql);

        return true;
    }

    // Получаем "список представительств" в указаном городе
    public function getWarehousesList($city_id)
    {
        return $this->apiGet('GetWarehousesList?CityId=' . $city_id);
    }

    // Получаем информацию по конкретному складу
    public function getWarehousesInfo($warehouse_id)
    {
        return $this->apiGet('GetWarehousesInfo?WarehousesId=' . $warehouse_id);
    }

    // Расчитываем стоимость доставки
    public function calculateShippingCost($data = array())
    {
        $data_string = json_encode($data);

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'http://www.delivery-auto.com/api/Public/PostReceiptCalculate');
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Content-Length: ' . strlen($data_string))
        );

        $result = curl_exec($ch);
        curl_close($ch);

        return json_decode($result);
    }

    // Получаем информацию через API
    public function apiGet($url_param)
    {
        $res = false; // Результат получения информации

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->delivery_api_url . $url_param . '&culture=' . $this->lang);
        curl_setopt($ch, CURLOPT_POST, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($ch);
        curl_close($ch);

        $res = json_decode($result);

        if (isset($res->status) && $res->data != null) {
            return $res->data;
        } else {
            return false;
        }
    }

    // Получаем все города в которых возможна достака Delivery
    public function getCities()
    {
        $product_data = $this->cache->get('delivery_cities');

        if (!$product_data) {
            $product_data = array();
            $query        = $this->db->query("SELECT * FROM `" . DB_PREFIX . "shipping_delivery_cities` WHERE is_warehouse = 1 ORDER BY name ASC");

            $product_data = $query->rows;
            $this->cache->set('delivery_cities', $product_data);
        }

        return $product_data;
    }

    // Получаем все склады по названию склада
    public function getWarehousesByCityName($warehouse_name)
    {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "shipping_delivery_warehouses` WHERE name LIKE '%" . $this->db->escape($warehouse_name) . "%' ORDER BY name ASC"); // LIMIT 15
        return $query->rows;
    }

    // Получаем все склады в городе по id
    public function getWarehousesByCityId($city_id)
    {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "shipping_delivery_warehouses` WHERE city_id = '" . $this->db->escape($city_id) . "' ORDER BY name ASC");
        return $query->rows;
    }

    // Получаем все склады
    public function getAllWarehouses()
    {
        $product_data = $this->cache->get('delivery_warehouses');

        if (!$product_data) {
            $product_data = array();
            $query        = $this->db->query("SELECT * FROM `" . DB_PREFIX . "shipping_delivery_warehouses` ORDER BY name ASC");

            $product_data = $query->rows;
            $this->cache->set('delivery_warehouses', $product_data);
        }

        return $product_data;
    }

    public function getAllWarehousesForJS()
    {
        $warehouses = $this->getAllWarehouses();

        if (!empty($warehouses)) {
            return json_encode($warehouses);
        }
    }

    // Обновить дату последнего обновления баз
    public function updateLastDateUpdateDB()
    {
        $today = date("d/m/Y");

        $this->db->query("DELETE FROM `" . DB_PREFIX . "setting` WHERE `key` = 'delivery_db_last_update'");
        $this->db->query("INSERT INTO `" . DB_PREFIX . "setting` SET store_id = '0', `code` = 'delivery_db', `key` = 'delivery_db_last_update', `value` = '" . $today . "'");
    }

}
