<?php
class ModelModuleReviews extends Model 
{		
	public function getLatestReviews($limit = 5, $category_id = 0) {
		return $this->getReviews($limit, $category_id, FALSE, FALSE);
	}
	
	public function getRandomReviews($limit = 5, $category_id = 0) {
		return $this->getReviews($limit, $category_id, TRUE, FALSE);
	}
	
	public function getCheckedReviews($limit = 5, $category_id = 0) {
		return $this->getReviews($limit, $category_id, FALSE, TRUE);
	}

	private function getReviews($limit, $category_id, $isRandom, $isChecked) {
		$sql_statement_where = " WHERE 
		p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND 
		p.date_available <= NOW() 
		AND p.status = '1' AND
		r.status = '1' AND
		pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ";

		$sql_statement_order = $isRandom ? " ORDER BY RAND() " : " ORDER BY date_added DESC " ;
		
		$sql_statement_order = $isChecked ? " AND r.checked = '1'" : "ORDER BY date_added DESC ";
		$sql_statement_limit = " LIMIT " . (int)$limit;

		$sql_statement  = " SELECT * FROM ( ";
		
		$sql_statement_base  = " SELECT DISTINCT r.*, pd.name, p.price, p.image ";
		$sql_statement_base .= " FROM " . DB_PREFIX . "review r ";
		$sql_statement_base .= " LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) ";
		$sql_statement_base .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) ";
		$sql_statement_base .= " LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) ";
		$sql_statement_base .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";

		if ( $category_id != 0 ) {
			$sql_statement .= " ( ";
			$sql_statement .= ($sql_statement_base . $sql_statement_where);
			$sql_statement .= " AND p2c.category_id = '" . (int)$category_id . "' ";
			$sql_statement .= ($sql_statement_order . $sql_statement_limit);
			$sql_statement .= " ) ";
			$sql_statement .= " UNION ALL " ;
		}
		
		$sql_statement .= " ( ";
		$sql_statement .= ($sql_statement_base . $sql_statement_where);
		$sql_statement .= " AND p2c.category_id != '" . (int)$category_id . "' ";
		$sql_statement .= ($sql_statement_order . $sql_statement_limit);
		$sql_statement .= " ) ";

		$sql_statement .= " ) a ";
		$sql_statement .= $sql_statement_limit;

		$query = $this->db->query($sql_statement);	

		return $query->rows;
	}
}
?>