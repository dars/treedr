<?php
class Projects extends Controller{
	function __construct(){parent::Controller();}
	function index(){
		$this->db->select('a.*,b.name as tname,c.name as cname');
		$this->db->join('taxonomy as b','a.t_id=b.id','left');
		$this->db->join('files as c','c.n_id=a.id and c.main=1','left');
		if($this->uri->segment(3)){
			$this->db->where('a.t_id',$this->uri->segment(3));
		}
		$query = $this->db->get('projects as a');
		$data =array();
		$data['data'] = $query->result();
		$data['title_img'] = site_url("public/images/main/05reference/title.jpg");
		$pdata['page_title'] = '專案展示';
		$pdata['page_content'] = $this->parser->parse('projects',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
	function info(){
		$id = $this->uri->segment(3);
		$this->db->select('a.*,b.name as tname,c.name as cname');
		$this->db->join('taxonomy as b','a.t_id=b.id','left');
		$this->db->join('files as c','c.n_id=a.id and c.main=1','left');
		$this->db->where('a.id',$id);
		$query = $this->db->get('projects as a');
		$data = $query->row_array();
		$data['title_img'] = site_url("public/images/main/05reference/title.jpg");
		$this->db->where('type','pix');
		$this->db->where('n_id',$id);
		$query = $this->db->get('files');
		$data['pix'] = $query->result();
		$data['con'] = 'projects';
		$pdata['page_title'] = '專案展示';
		$pdata['page_content'] = $this->parser->parse('projects_info',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
}