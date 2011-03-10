<?php
class Faq extends Controller{
	function __construct(){parent::Controller();}
	function index(){
		$this->db->select('a.*,b.name as tname');
		$this->db->join('taxonomy as b','a.t_id = b.id','left');
		$this->db->where('a.type_id',9);
		$this->db->where("a.content <>'' ");
		$this->db->order_by('a.id','DESC');
		$query = $this->db->get('nodes as a');
		$data = array();
		$data['data'] = $query->result();
		$data['con'] = 'faq';
		$data['title_img'] = site_url("public/images/main/08faq/title.jpg");
		$pdata['page_title'] = '我要提問';
		$pdata['page_content'] = $this->parser->parse('faq',$data,true);
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
		$pdata['page_content'] = $this->parser->parse('faq_info',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
	function post(){
		$data['title_img'] = site_url("public/images/main/08faq/title.jpg");
		$pdata['page_title'] = '新增使用者提問';
		$pdata['page_content'] = $this->parser->parse('faq_add',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
	function add_post(){
		$this->db->set('title','「'.$this->input->post('name').'的提問」'.$this->input->post('title'));
		$tmp_time = date('Y-m-d H:i:s');
		$this->db->set('created',$tmp_time);
		$this->db->set('modified',$tmp_time);
		$this->db->set('type_id',9);
		$this->db->set('t_id',20);
		$this->db->insert('nodes');
		$this->session->set_flashdata('notify','<div class="session_notify">您的提問已儲存，我們將會儘快答覆您</div>');
		redirect('faq/index');
	}
}