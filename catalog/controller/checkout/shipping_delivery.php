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

class ControllerCheckoutShippingDelivery extends Controller
{
    public function __construct($registry)
    {
        require_once DIR_SYSTEM . 'library/shippingDelivery.php';
        $registry->set('shipping_delivery', new ShippingDelivery($registry));

        parent::__construct($registry);
    }

    // Search by warehouse name
    public function index()
    {
        $warehouse_name = "";
        $this->response->addHeader('Content-Type: application/json');

        if (isset($this->request->get['warehouse_name'])) {
            $warehouse_name = $this->db->escape($this->request->get['warehouse_name']);
        }

        if (strlen($warehouse_name) >= 2) {
            $warehouses = $this->shipping_delivery->getWarehousesByCityName($warehouse_name);

            $this->response->setOutput(json_encode($warehouses));
        }
    }

    // Метод доступен по ссылке - /index.php?route=checkout/shipping_delivery/update_warehouses
    public function update_warehouses()
    {
        $today                   = date('d/m/Y');
        $min_bd_date_update      = date('d/m/Y');
        $delivery_db_last_update = $this->config->get('delivery_db_last_update');

        if (!isset($delivery_db_last_update)) {
            $delivery_db_last_update = $today;
        } else {
            // Обновление разрешено только минимум после 3-х дней
            // с даты последнего обновления
            $date = DateTime::createFromFormat('d/m/Y', $delivery_db_last_update);
            $date->modify('+3 days');
            $min_bd_date_update = $date->format('d/m/Y');
        }

        if ($min_bd_date_update <= $today) {

            $result = $this->shipping_delivery->updateCities();

            if (isset($result['error'])) {
                echo "Errors occurred during execution updating cities";
            } else {
                // Ограничивыем время выполнение скрипта до 180 seconds = 3 minutes
                // И засекаем время выполнения скрипта
                ini_set('max_execution_time', 180);

                $time_start = microtime(true);
                $result     = $this->shipping_delivery->updateWarehouses();
                $time_end   = microtime(true);

                $execution_time = ($time_end - $time_start) / 60;
                $execution_time = '<b>Time execution:</b> ' . substr($execution_time, 0, 4) . ' Mins.';

                if ($result) {
                    echo "Warehouses were updated successfully. " . $execution_time;

                    // Обновляем дату посл. обновления
                    $this->shipping_delivery->updateLastDateUpdateDB();
                } else {
                    echo "Errors occurred during execution updating warehouses.";
                }
            }

        } else {
            echo "<br>Today is <b>" . $today . "</b><br>";
            echo "Last Delivery's db update was <b>" . $delivery_db_last_update . "</b><br> ";
            echo "Min interval between updates is <b><i>3 days</i></b>. <br><br>";
            echo "Next update can possibly be since <b>" . $min_bd_date_update . "</b>.";
        }
    }

    public function cities()
    {
        $city_name = "";
        $this->response->addHeader('Content-Type: application/json');

        if (isset($this->request->get['city_name'])) {
            $city_name = $this->db->escape($this->request->get['city_name']);
        }

        if (strlen($city_name) >= 2) {
            $cities = $this->shipping_delivery->getWarehousesByCityName($city_name);

            $this->response->setOutput(json_encode($cities));
        }
    }

}
