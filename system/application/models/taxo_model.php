<?php
class Taxo_model extends Model{
	function __construct(){parent::Model();}
	function chk_taxo($id,$type_id){
		$this->db->where('id',$id);
		$this->db->where('type_id',$type_id);
		if($this->db->count_all_results('taxonomy')>0){
			//echo 'Take 1<br>';
			return $id;
		}else{
			//echo 'Take 2<br>';
			$tmp = array();
			$tmp['name'] = $id;
			$tmp['type_id'] = $type_id;
			$this->db->insert('taxonomy',$tmp);
			return $this->db->insert_id();
		}
	}
}