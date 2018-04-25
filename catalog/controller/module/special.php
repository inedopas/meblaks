<?php
class ControllerModuleSpecial extends Controller {
	public function index($setting) {
		$this->document->addStyle('catalog/view/javascript/promotionlabelpro/style.css');
		$this->load->language('module/special');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$filter_data = array(
			'sort'  => 'pd.name',
			'order' => 'ASC',
			'start' => 0,
			'limit' => $setting['limit']
		);
// халява
		$data['breadcrumbs'] = array();
		
		if (file_exists('catalog/view/theme/default/js/countdown/jquery.countdown_' . $this->language->get('code') . '.js')) {
			$this->document->addScript('catalog/view/theme/default/js/countdown/jquery.countdown_' . $this->language->get('code') . '.js');
			} else {
			$this->document->addScript('catalog/view/theme/default/js/countdown/jquery.countdown_en.js');
			}
			$this->load->language('common/cosyone');
			$data['text_category_expire'] = $this->language->get('text_category_expire');
			$data['cosyone_category_thumb'] = $this->config->get('cosyone_category_thumb');
			$data['cosyone_grid_category'] = $this->config->get('cosyone_grid_category');
			$data['cosyone_category_refine'] = $this->config->get('cosyone_category_refine');
			$data['cosyone_category_per_row'] = $this->config->get('cosyone_category_per_row');
			$data['cosyone_rollover_effect'] = $this->config->get('cosyone_rollover_effect');
			$data['cosyone_percentage_sale_badge'] = $this->config->get('cosyone_percentage_sale_badge');
			$cosyone_quicklook = $this->config->get('cosyone_text_ql');
			if(empty($cosyone_quicklook[$this->language->get('code')])) {
				$data['cosyone_text_ql'] = false;
			} else if (isset($cosyone_quicklook[$this->language->get('code')])) {
				$data['cosyone_text_ql'] = html_entity_decode($cosyone_quicklook[$this->language->get('code')], ENT_QUOTES, 'UTF-8');
			}
			$data['cosyone_brand'] = $this->config->get('cosyone_brand');
			$data['cosyone_product_countdown'] = $this->config->get('cosyone_product_countdown');
			$data['cosyone_product_hurry'] = $this->config->get('cosyone_product_hurry');
			$data['cosyone_default_view'] = $this->config->get('cosyone_default_view');

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		// халява
		$results = $this->model_catalog_product->getProductSpecials($filter_data);
		$this->load->model('catalog/promotion_label_product');
shuffle ($results);
		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}	
				$labels = array();
$labels = $this->model_catalog_promotion_label_product->getProductLabel($result['product_id']);
	// Cosyone custom code starts	
					    if ((float)$result['special']) {
						  $sales_percantage = ((($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')))-($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax'))))/(($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')))/100));
						  } else {
						  $sales_percantage = false;
						  }
						  if ((float)$result['special']) {
					  $special_info = $this->model_catalog_product->getSpecialPriceEnd($result['product_id']);
					  $special_date_end = strtotime($special_info['date_end']) - time();
					  } else {
					  $special_date_end = false;
					  }
						  $images = $this->model_catalog_product->getProductImages($result['product_id']);
				  if(isset($images[0]['image']) && !empty($images[0]['image'])){
				  $images =$images[0]['image'];
				} else {
						  $images = false;
						  }
				// cosyone end

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'sku'         => (empty($result['sku'])) ? '' : $this->language->get('text_sku') .' '. $result['sku'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'attribute_groups' => $this->model_catalog_product->getProductAttributes($result['product_id']),
					'price'       => $price,

					'special'     => $special,
					// Cosyone custom code starts	
			  'sales_percantage' => number_format($sales_percantage, 0, ',', '.'),
			  'special_date_end' => $special_date_end,
			  'stock_quantity' => sprintf($this->language->get('text_category_stock_quantity'), (int)$result['quantity']),
			  'brand_name'		=> $result['manufacturer'],
			  'thumb_hover'  => $this->model_tool_image->resize($images, $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height')),
			  // Cosyone custom code ends
					'tax'         => $tax,
					'rating'      => $rating,
					'labels'	  => $labels,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/special.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/special.tpl', $data);
			} else {
				return $this->load->view('default/template/module/special.tpl', $data);
			}
		}
	}
}