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
		$config['allowed_types']='gif|jpg|jpeg|png|bmp';
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
		echo 'CKEDITOR_CurrentDialog.selectPage(\'info\');';
		echo 'CKEDITOR_CurrentDialog.getContentElement(\'info\', \'txtUrl\').focus();';
		echo 'CKEDITOR_CurrentDialog.setValueOf(\'info\', \'txtUrl\', \''.site_url('public/files/ckfiles/'.$data['file_name']).'\');';
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
		$this->db->where('id',$id);
		$this->db->delete('taxonomy');
		$this->db->where('t_id',$id);
		$tmp['t_id'] = 1;
		$this->db->update('nodes',$tmp);
		echo '{"success":true}';
	}
	function news(){
		$this->db->select("a.*,b.name as tname");
		$this->db->join('taxonomy as b','a.t_id = b.id');
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