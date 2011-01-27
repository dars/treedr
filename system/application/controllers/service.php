<?php
class Service extends Controller{
	function __construct(){parent::Controller();}
	function index(){
		$this->db->where('type_id',5);
		$this->db->order_by('id','DESC');
		$query = $this->db->get('nodes');
		$data = array();
		$data['data'] = $query->result();
		$data['title_img'] = site_url("public/images/main/03service/title.jpg");
		$pdata['page_title'] = '服務項目';
		$pdata['page_content'] = $this->parser->parse('service',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
	function info(){
		$id = $this->uri->segment(3);
		$this->db->where('id',$id);
		$query = $this->db->get('nodes');
		$data = $query->row_array();
		$data['title_img'] = site_url("public/images/main/03service/title.jpg");
		$data['con'] = 'service';
		$pdata['page_title'] = '服務項目';
		$pdata['page_content'] = $this->parser->parse('service_info',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
}