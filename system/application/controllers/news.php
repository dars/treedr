<?php
class News extends Controller{
	function __construct(){parent::Controller();}
	function index(){
		$this->db->select('a.*,b.name as tname');
		$this->db->join('taxonomy as b','a.t_id = b.id','left');
		$this->db->where('a.type_id',1);
		$this->db->order_by('a.id','DESC');
		$query = $this->db->get('nodes as a');
		$data = array();
		$data['data'] = $query->result();
		$data['con'] = 'news';
		$data['title_img'] = site_url("public/images/main/01news/title.jpg");
		$pdata['page_title'] = '最新消息';
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
		$data['title_img'] = site_url("public/images/main/01news/title.jpg");
		$data['con'] = 'news';
		$pdata['page_title'] = '最新消息';
		$pdata['page_content'] = $this->parser->parse('news_info',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
}