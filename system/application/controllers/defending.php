<?php
class Defending extends Controller{
	function __construct(){parent::Controller();}
	function index(){
		$this->db->where('type_id',6);
		if($this->uri->segment(3)){
			$this->db->where('t_id',$this->uri->segment(3));
		}
		$this->db->order_by('id','DESC');
		$query = $this->db->get('nodes');
		$data = array();
		$data['data'] = $query->result();
		$data['title_img'] = site_url("public/images/main/04defending/title.jpg");
		$pdata['page_title'] = '樹木醫生';
		$pdata['page_content'] = $this->parser->parse('defending',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
	function info(){
		$id = $this->uri->segment(3);
		$this->db->where('id',$id);
		$query = $this->db->get('nodes');
		$data = $query->row_array();
		$data['title_img'] = site_url("public/images/main/04defending/title.jpg");
		$data['con'] = 'defending';
		$pdata['page_title'] = '樹木醫生';
		$pdata['page_content'] = $this->parser->parse('service_info',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
}