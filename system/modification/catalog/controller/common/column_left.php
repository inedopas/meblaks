<?php
class ControllerCommonColumnLeft extends Controller {

        public function __construct($registry) {
          parent::__construct($registry);

          if (!$registry->get('vie_module_groups')) {
            $positions = array(
              'vie_ht' => 'Header Top',
              'vie_menu' => 'Menu',
              'vie_promo' => 'Promotion',
              'vie_ft' => 'Footer Top',
              'vie_fct' => 'Footer Content Top',
              'vie_fcb' => 'Footer Content Bottom',
              'vie_fb' => 'Footer Bottom'
            );

            $module_groups = array();

            foreach ($positions as $position => $name) {
              if (!isset($module_groups[$position])) {
                $module_groups[$position] = array();
              }

              $module_groups[$position] = $this->getModulesByPosition($position);
            }

            $registry->set('vie_module_groups', $module_groups);
          }
        }

        protected function getModulesByPosition($position) {
          $this->load->model('design/layout');
          $this->load->model('extension/module');
          
          if (isset($this->request->get['route'])) {
            $route = (string)$this->request->get['route'];
          } else {
            $route = 'common/home';
          }

          $layout_id = 0;

          if ($route == 'product/category' && isset($this->request->get['path'])) {
            $this->load->model('catalog/category');
            
            $path = explode('_', (string)$this->request->get['path']);

            $layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));
          }

          if ($route == 'product/product' && isset($this->request->get['product_id'])) {
            $this->load->model('catalog/product');
            
            $layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
          }

          if ($route == 'information/information' && isset($this->request->get['information_id'])) {
            $this->load->model('catalog/information');
            
            $layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
          }

          if (!$layout_id) {
            $layout_id = $this->model_design_layout->getLayout($route);
          }

          if (!$layout_id) {
            $layout_id = $this->config->get('config_layout_id');
          }
          
          $module_data = array();   
          
          $modules = $this->model_design_layout->getLayoutModules($layout_id, $position);

          foreach ($modules as $module) {
            $part = explode('.', $module['code']);
            
            if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
              $module_data[] = $this->load->controller('module/' . $part[0]);
            }
            
            if (isset($part[1])) {
              $setting_info = $this->model_extension_module->getModule($part[1]);
              
              if ($setting_info && $setting_info['status']) {
                $module_data[] = $this->load->controller('module/' . $part[0], $setting_info);
              }
            }
          }

          return $module_data;
        }        
      
	public function index() {
		$this->load->model('design/layout');

		if (isset($this->request->get['route'])) {
			$route = (string)$this->request->get['route'];
		} else {
			$route = 'common/home';
		}

		$layout_id = 0;

		if ($route == 'product/category' && isset($this->request->get['path'])) {
			$this->load->model('catalog/category');

			$path = explode('_', (string)$this->request->get['path']);

			$layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));
		}

		if ($route == 'product/product' && isset($this->request->get['product_id'])) {
			$this->load->model('catalog/product');

			$layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
		}

		if ($route == 'information/information' && isset($this->request->get['information_id'])) {
			$this->load->model('catalog/information');

			$layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
		}

		if (!$layout_id) {
			$layout_id = $this->model_design_layout->getLayout($route);
		}

		if (!$layout_id) {
			$layout_id = $this->config->get('config_layout_id');
		}

		$this->load->model('extension/module');

		$data['modules'] = array();

		$modules = $this->model_design_layout->getLayoutModules($layout_id, 'column_left');

		foreach ($modules as $module) {
			$part = explode('.', $module['code']);

			
				if( $part[0] == 'mega_filter' ) {
					if( ! isset( $part[1] ) ) {
						continue;
					}
				
					$mfp_setting = $this->config->get($part[0] . '_module');
					$mfp_setting['_idx'] = $part[1];
					$mfp_setting['position'] = $module['position'];
				
					if( NULL != ( $mfp = $this->load->controller('module/' . $part[0], $mfp_setting) ) ) {
						$data['modules'][] = $mfp;
					}
				} else if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
			
				$data['modules'][] = $this->load->controller('module/' . $part[0]);
			}

			if (isset($part[1])) {
				$setting_info = $this->model_extension_module->getModule($part[1]);

				if ($setting_info && $setting_info['status']) {
					$data['modules'][] = $this->load->controller('module/' . $part[0], $setting_info);
				}
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/column_left.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/column_left.tpl', $data);
		} else {
			return $this->load->view('default/template/common/column_left.tpl', $data);
		}
	}
}