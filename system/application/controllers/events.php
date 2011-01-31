<?php
class Events extends Controller{
	function __construct(){parent::Controller();}
	function index(){
		$this->db->select('a.*,b.name as tname');
		$this->db->join('taxonomy as b','a.t_id = b.id','left');
		$this->db->where('a.type_id',8);
		$this->db->order_by('a.id','DESC');
		$query = $this->db->get('nodes as a');
		$data = array();
		$data['data'] = $query->result();
		$data['con'] = 'events';
		$data['title_img'] = site_url("public/images/main/06event/title.jpg");
		$pdata['page_title'] = '活動講座';
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
		$data['title_img'] = site_url("public/images/main/06event/title.jpg");
		$data['con'] = 'events';
		$this->db->where('n_id',$id);
		$data['scount'] = $this->db->count_all_results('signup');
		$pdata['page_title'] = '活動講座';
		$pdata['page_content'] = $this->parser->parse('events_info',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
	function signup(){
		$tmp_time = date('Y-m-d H:i:s');
		$this->db->set('name',$this->input->post('name'));
		$this->db->set('tel',$this->input->post('tel'));
		$this->db->set('email',$this->input->post('email'));
		$this->db->set('n_id',$this->input->post('n_id'));
		$this->db->set('created',$tmp_time);
		$this->db->insert('signup');
		$this->session->set_flashdata('notify','<div class="session_notify">您的提問已儲存，我們將會儘快答覆您</div>');
		redirect('events/info/'.$this->input->post('n_id'));
	}
}