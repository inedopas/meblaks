<?php
class Cache {

private $ssl = 'http_';
    
	private $cache;

	public function __construct($driver, $expire = 3600) {
		if ((isset($_SERVER['HTTPS']) && ($_SERVER['HTTPS'] == 'on' || $_SERVER['HTTPS'] == '1' || $_SERVER['HTTPS'])) || (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && (strtolower($_SERVER['HTTP_X_FORWARDED_PROTO']) == 'https') || (!empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on'))) {
			$this->ssl = 'https_';
		}
		$class = 'Cache\\' . $driver;

		if (class_exists($class)) {
			$this->cache = new $class($expire);
		} else {
			exit('Error: Could not load cache driver ' . $driver . ' cache!');
		}
	}

	public function get($key) {

		$key = $this->ssl.$key;
    
		return $this->cache->get($key);
	}

	public function set($key, $value) {

		$key = $this->ssl.$key;
    
		return $this->cache->set($key, $value);
	}

	public function delete($key) {

		$key = $this->ssl.$key;
    
		return $this->cache->delete($key);
	}
}
