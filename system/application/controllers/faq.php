<?php
class Faq extends Controller{
	function __construct(){parent::Controller();}
	function index(){
		$this->db->select('a.*,b.name as tname');
		$this->db->join('taxonomy as b','a.t_id = b.id','left');
		$this->db->where('a.type_id',9);
		$this->db->order_by('a.id','DESC');
		$query = $this->db->get('nodes as a');
		$data = array();
		$data['data'] = $query->result();
		$data['con'] = 'faq';
		$data['title_img'] = site_url("public/images/main/08faq/title.jpg");
		$pdata['page_title'] = '我要提問';
		$pdata['page_content'] = $this->parser->parse('news',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
	function info(){
		$id = $this->uri->segment(3);
		$this->db->select('a.*,b.name as tname');
		$this->db->join('taxonomy as b','a.t_id = b.id','left');
		$this->db->where('a.id',$id);
		$query = $this->db->get('nodes as a');
		$data = $query->row_array();
		$data['title_img'] = site_url("public/images/main/08faq/title.jpg");
		$data['con'] = 'faq';
		$pdata['page_title'] = '我要提問';
		$pdata['page_content'] = $this->parser->parse('news_info',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
}