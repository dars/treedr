<?php
class List_taxo_model extends Model{
	function __construct(){
		parent::Model();
		$this->db->where('id > 1');
		$this->db->order_by('type_id','ASC');
		$query = $this->db->get('taxonomy');
		$res = $query->result();
		$tmp = 0;
		foreach($res as $r):
			if($tmp != $r->type_id){
				if($tmp != 0){
					echo "</ul>";
				}
				echo "<ul class='sub_nav' id='sub_nav_".$r->type_id."'>";
				$tmp = $r->type_id;
			}
			switch($r->type_id){
				case 1:
					$taxo_name='news';
					break;
				case 5:
					$taxo_name='service';
					break;
				case 6:
					$taxo_name='defending';
					break;
				case 7:
					$taxo_name='projects';
					break;
				case 8:
					$taxo_name='events';
					break;
				case 2:
					$taxo_name='knowledge';
					break;
				case 9:
					$taxo_name='faq';
					break;
			}
			echo "<li><a href='".site_url($taxo_name.'/index/'.$r->id)."'>";
			echo $r->name;
			echo "</a></li>";
		endforeach;
		echo "</ul>";
		echo "<dis style='clear:both;'>&nbsp;</div>";
	}
}