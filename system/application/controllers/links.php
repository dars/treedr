<?php
class Links extends Controller{
	function __construct(){parent::Controller();}
	function index(){
		$this->db->where('type_id',10);
		$this->db->order_by('id','DESC');
		$query = $this->db->get('nodes');
		$data = array();
		$data['data'] = $query->result();
		$data['title_img'] = site_url("public/images/main/10link/title.jpg");
		$pdata['page_title'] = '友善連結';
		$pdata['page_content'] = $this->parser->parse('hyperlinks',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
}