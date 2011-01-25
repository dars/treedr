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
}