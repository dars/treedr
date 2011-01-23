<?php
class Nodes extends Controller{
	function __construct(){parent::Controller();}
	function aboutus(){
		$this->db->where('node_type','關於我們');
		$query = $this->db->get('nodes');
		$data = $query->row_array();
		$data['title_img'] = site_url('public/images/main/02about/title.jpg');
		$pdata['page_title'] = '關於我們';
		$pdata['page_content'] = $this->parser->parse('nodes',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
	function relevant(){
		$this->db->where('node_type','相關法令');
		$query = $this->db->get('nodes');
		$data = $query->row_array();
		$data['title_img'] = site_url('public/images/main/09relevant/title.jpg');
		$pdata['page_title'] = '相關規定法令';
		$pdata['page_content'] = $this->parser->parse('nodes',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
}