<?php
class ModelShippingCitylinkche extends Model {
	function getQuote($address) {
		$this->load->language('shipping/citylinkche');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('citylinkche_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if (!$this->config->get('citylinkche_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$cost = 50;
			$weight = $this->cart->getWeight();
			$cart_total = $this->cart->getTotal();
			$rates = explode(',', $this->config->get('citylinkche_rate'));

			/*foreach ($rates as $rate) {
				$data = explode(':', $rate);

				if ($data[0] >= $weight) {
					if (isset($data[1])) {
						$cost = $data[1];
					}

					break;
				}
			}

*/
			if ($cart_total >= 1000){
			(float)$cost=0.00001;
			}

			$quote_data = array();

			if ((float)$cost) {
				$quote_data['citylinkche'] = array(
					'code'         => 'citylinkche.citylinkche',
					'title'        => $this->language->get('text_description').'  (' . $this->language->get('text_weight') . ' ' . $this->weight->format($cart_total,null) . 'грн)',
					'cost'         => $cost,
					'tax_class_id' => $this->config->get('citylinkche_tax_class_id'),
					'text'         => $this->currency->format($this->tax->calculate($cost, $this->config->get('citylinkche_tax_class_id'), $this->config->get('config_tax')))
				);

				$method_data = array(
					'code'       => 'citylinkche',
					'title'      => $this->language->get('text_title'),
					'description'=> $this->language->get('text_description'),
					'quote'      => $quote_data,
					'sort_order' => $this->config->get('citylinkche_sort_order'),
					'error'      => false
				);
			}
		}

		return $method_data;
	}
}
