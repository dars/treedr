<?php
class Admin extends Controller{
	function __construct(){parent::Controller();}
	function index(){
		$data = array();
		$pdata = array();
		$this->parser->parse('layout/admin',$pdata);
	}
	function ckupload(){
		$config['upload_path']='public/files/ckfiles/';
		$config['allowed_types']='gif|jpg|jpeg|png|bmp|pdf|doc|xls|txt|rtf';
		$config['max_size']='1000';
		$config['max_width']='0';
		$config['max_height']='0';
		$config['encrypt_name']=true;
		$config['remove_spaces']=true;
		$this->load->library('upload',$config);
		$upload = $this->upload->do_upload('upload');
		
		$data=$this->upload->data();
		echo '<script type="text/javascript">';
		echo 'var CKEDITOR_CurrentDialog = (window.parent.CKEDITOR.dialog.getCurrent());';
		echo 'CKEDITOR_CurrentDialog.selectPage("info");';
		echo 'CKEDITOR_CurrentDialog.getContentElement("info", "txtUrl").focus();';
		echo 'CKEDITOR_CurrentDialog.setValueOf("info", "txtUrl", "'.site_url('public/files/ckfiles/'.$data['file_name']).'");';
		echo '</script>';
	}
	function aboutus(){
		$this->db->where('type_id',3);
		$query = $this->db->get('nodes');
		$res = new stdClass();
		$res->root = $query->result();
		echo json_encode($res);
	}
	function au_save(){
		$tmp = array();
		$tmp['content'] = $this->input->post('content');
		$tmp['modified'] = date('Y-m-d H:i:s');
		$this->db->where('id',$this->input->post('id'));
		$this->db->update('nodes',$tmp);
		echo '{"success":true}';
	}
	function relevant(){
		$this->db->where('type_id',4);
		$query = $this->db->get('nodes');
		$res = new stdClass();
		$res->root = $query->result();
		echo json_encode($res);
	}
	function relevant_save(){
		$tmp = array();
		$tmp['content'] = $this->input->post('content');
		$tmp['modified'] = date('Y-m-d H:i:s');
		$this->db->where('id',$this->input->post('id'));
		$this->db->update('nodes',$tmp);
		echo '{"success":true}';
	}
	function taxo_list(){
		$type_id = $this->uri->segment(3);
		$this->db->where('type_id',$type_id);
		$this->db->or_where('type_id',0);
		$this->db->order_by('weight','ASC');
		$query = $this->db->get('taxonomy');
		$res = new stdClass();
		$res->root = $query->result();
		echo json_encode($res);
	}
	function taxo_delete(){
		$id = $this->input->post('id');
		if($id != 1){	# 不得刪除未分類
			$this->db->where('id',$id);
			$this->db->delete('taxonomy');
			$this->db->where('t_id',$id);
			$tmp['t_id'] = 1;
			$this->db->update('nodes',$tmp);
		}
		echo '{"success":true}';
	}
	function news(){
		$this->db->select("a.*,b.name as tname");
		$this->db->join('taxonomy as b','a.t_id = b.id','left');
		$this->db->where('a.type_id',1);
		$this->db->order_by('a.id','DESC');
		$query = $this->db->get('nodes as a');
		$res = new stdClass();
		$res->root = $query->result();
		echo json_encode($res);
	}
	function news_save(){
		$tmp = array();
		$tmp['title'] = $this->input->post('title');
		$tmp['content'] = $this->input->post('content');
		$tmp['type_id'] = 1;
		$this->load->model('taxo_model');
		$tmp['t_id'] = $this->taxo_model->chk_taxo($this->input->post('t_id'),1);
		$tmp_time = date('Y-m-d H:i:s');
		$tmp['modified'] = $tmp_time;
		if($this->input->post('id')){
			$this->db->where('id',$this->input->post('id'));
			$this->db->update('nodes',$tmp);
		}else{
			$tmp['created'] = $tmp_time;
			$this->db->insert('nodes',$tmp);
		}
		echo '{"success":true}';
	}
	function nodes_destory(){
		$ids = $this->input->post('foo');
		foreach($ids as $i):
			$this->db->where('id',$i);
			$this->db->delete('nodes');
		endforeach;
		echo '{"success":true}';
	}
	function service(){
		$this->db->where('a.type_id',5);
		$this->db->order_by('a.id','DESC');
		$query = $this->db->get('nodes as a');
		$res = new stdClass();
		$res->root = $query->result();
		echo json_encode($res);
	}
	function service_save(){
		$tmp = array();
		$tmp['title'] = $this->input->post('title');
		$tmp['content'] = $this->input->post('content');
		$tmp['type_id'] = 5;
		$tmp_time = date('Y-m-d H:i:s');
		$tmp['modified'] = $tmp_time;
		if($this->input->post('id')){
			$this->db->where('id',$this->input->post('id'));
			$this->db->update('nodes',$tmp);
		}else{
			$tmp['created'] = $tmp_time;
			$this->db->insert('nodes',$tmp);
		}
		echo '{"success":true}';
	}
	function defending(){
		$this->db->select('a.*,b.name as tname');
		$this->db->join('taxonomy as b','a.t_id = b.id','left');
		$this->db->where('a.type_id',6);
		$this->db->order_by('a.id','DESC');
		$query = $this->db->get('nodes as a');
		$res = new stdClass();
		$res->root = $query->result();
		echo json_encode($res);
	}
	function defending_save(){
		$tmp = array();
		$tmp['title'] = $this->input->post('title');
		$tmp['content'] = $this->input->post('content');
		$tmp['type_id'] = 6;
		$this->load->model('taxo_model');
		$tmp['t_id'] = $this->taxo_model->chk_taxo($this->input->post('t_id'),6);
		$tmp_time = date('Y-m-d H:i:s');
		$tmp['modified'] = $tmp_time;
		if($this->input->post('id')){
			$this->db->where('id',$this->input->post('id'));
			$this->db->update('nodes',$tmp);
		}else{
			$tmp['created'] = $tmp_time;
			$this->db->insert('nodes',$tmp);
		}
		echo '{"success":true}';
	}
	function projects(){
		$this->db->select('a.*,b.name as tname');
		$this->db->join('taxonomy as b','a.t_id = b.id','left');
		$this->db->order_by('a.id','DESC');
		$query = $this->db->get('projects as a');
		$res = new stdClass();
		$res->root = $query->result();
		echo json_encode($res);
	}
	function projects_save(){
		$tmp = array();
		$tmp['title'] = $this->input->post('title');
		$tmp['name'] = $this->input->post('name');
		$tmp['content'] = $this->input->post('content');
		$tmp['years'] = $this->input->post('years');
		$this->load->model('taxo_model');
		$tmp['t_id'] = $this->taxo_model->chk_taxo($this->input->post('t_id'),7);
		$tmp_time = date('Y-m-d H:i:s');
		$tmp['modified'] = $tmp_time;
		if($this->input->post('id')){
			$this->db->where('id',$this->input->post('id'));
			$this->db->update('projects',$tmp);
		}else{
			$tmp['created'] = $tmp_time;
			$this->db->insert('projects',$tmp);
		}
		echo '{"success":true}';
	}
	function images_upload(){
		$config['upload_path'] = 'public/files/images/';
		$config['allowed_types'] = 'gif|jpg|jpeg|png|bmp';
		$config['overwrite'] = false;
		$config['encrypt_name'] = true;
		$this->load->library('upload',$config);
		$this->upload->initialize($config);
		$img_name = "";
		if($this->upload->do_upload('img')){
			$data=$this->upload->data();
			$config = array();
			$config['image_library'] = 'gd2';
			$config['source_image']	= $data['full_path'];
			$config['create_thumb'] = FALSE;
			$config['maintain_ratio'] = TRUE;
			$config['width'] = 500;
			$config['height'] = 500;
			$this->load->library('image_lib',$config); 
			$this->image_lib->initialize($config);
			$this->image_lib->resize();
			$img_name = $data['file_name'];
		}
		if(!empty($img_name)){
			$tmp['name'] = $img_name;
			$tmp['type'] = 'pix';
			$tmp['n_id'] = $this->input->post('n_id');
			$tmp['created'] = date('Y-m-d H:i:s');
			$this->db->insert('files',$tmp);
		}
		echo '{"success":true}';
	}
	function images_list(){
		$this->db->where('type','pix');
		$this->db->where('n_id',$this->input->post('n_id'));
		$this->db->order_by('id','DESC');
		$query = $this->db->get('files');
		$res = new stdClass();
		$res->root = $query->result();
		echo json_encode($res);
	}
	function images_destory(){
		foreach($this->input->post('foo') as $id):
			$this->db->where('id',$id);
			$this->db->delete('files');
		endforeach;
		echo '{"success":true}';
	}
	function images_set_main(){
		$this->db->where('n_id',$this->input->post('n_id'));
		$this->db->where('type','pix');
		$this->db->set('main',0);
		$this->db->update('files');
		$this->db->where('id',$this->input->post('id'));
		$this->db->where('type','pix');
		$this->db->set('main',1);
		$this->db->update('files');
		echo '{"success":true}';
	}
	function knowledge(){
		$this->db->select('a.*,b.name as tname');
		$this->db->join('taxonomy as b','a.t_id = b.id','left');
		$this->db->where('a.type_id',2);
		$this->db->order_by('a.id','DESC');
		$query = $this->db->get('nodes as a');
		$res = new stdClass();
		$res->root = $query->result();
		echo json_encode($res);
	}
	function knowledge_save(){
		$tmp = array();
		$tmp['title'] = $this->input->post('title');
		$tmp['content'] = $this->input->post('content');
		$tmp['type_id'] = 2;
		$this->load->model('taxo_model');
		$tmp['t_id'] = $this->taxo_model->chk_taxo($this->input->post('t_id'),2);
		$tmp_time = date('Y-m-d H:i:s');
		$tmp['modified'] = $tmp_time;
		if($this->input->post('id')){
			$this->db->where('id',$this->input->post('id'));
			$this->db->update('nodes',$tmp);
		}else{
			$tmp['created'] = $tmp_time;
			$this->db->insert('nodes',$tmp);
		}
		echo '{"success":true}';
	}
	function hyperlinks(){
		$this->db->where('a.type_id',10);
		$this->db->order_by('a.id','DESC');
		$query = $this->db->get('nodes as a');
		$res = new stdClass();
		$res->root = $query->result();
		echo json_encode($res);
	}
	function hyperlinks_save(){
		$tmp = array();
		$tmp['title'] = $this->input->post('title');
		$tmp['content'] = $this->input->post('content');
		$tmp['type_id'] = 10;
		$tmp_time = date('Y-m-d H:i:s');
		$tmp['modified'] = $tmp_time;
		if($this->input->post('id')){
			$this->db->where('id',$this->input->post('id'));
			$this->db->update('nodes',$tmp);
		}else{
			$tmp['created'] = $tmp_time;
			$this->db->insert('nodes',$tmp);
		}
		echo '{"success":true}';
	}
	function faq(){
		$this->db->select("a.*,b.name as tname");
		$this->db->join('taxonomy as b','a.t_id = b.id','left');
		$this->db->where('a.type_id',9);
		$this->db->order_by('a.id','DESC');
		$query = $this->db->get('nodes as a');
		$res = new stdClass();
		$res->root = $query->result();
		echo json_encode($res);
	}
	function faq_save(){
		$tmp = array();
		$tmp['title'] = $this->input->post('title');
		$tmp['content'] = $this->input->post('content');
		$tmp['type_id'] = 9;
		$this->load->model('taxo_model');
		$tmp['t_id'] = $this->taxo_model->chk_taxo($this->input->post('t_id'),9);
		$tmp_time = date('Y-m-d H:i:s');
		$tmp['modified'] = $tmp_time;
		if($this->input->post('id')){
			$this->db->where('id',$this->input->post('id'));
			$this->db->update('nodes',$tmp);
		}else{
			$tmp['created'] = $tmp_time;
			$this->db->insert('nodes',$tmp);
		}
		echo '{"success":true}';
	}
	function events(){
		$this->db->select("a.*,b.name as tname");
		$this->db->join('taxonomy as b','a.t_id = b.id','left');
		$this->db->where('a.type_id',8);
		$this->db->order_by('a.id','DESC');
		$query = $this->db->get('nodes as a');
		$res = new stdClass();
		$res->root = $query->result();
		echo json_encode($res);
	}
	function events_save(){
		$tmp = array();
		$tmp['title'] = $this->input->post('title');
		$tmp['content'] = $this->input->post('content');
		$tmp['type_id'] = 8;
		$this->load->model('taxo_model');
		$tmp['t_id'] = $this->taxo_model->chk_taxo($this->input->post('t_id'),8);
		$tmp_time = date('Y-m-d H:i:s');
		$tmp['modified'] = $tmp_time;
		if($this->input->post('id')){
			$this->db->where('id',$this->input->post('id'));
			$this->db->update('nodes',$tmp);
		}else{
			$tmp['created'] = $tmp_time;
			$this->db->insert('nodes',$tmp);
		}
		echo '{"success":true}';
	}
}