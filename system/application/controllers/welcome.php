<?php

class Welcome extends Controller {
	function Welcome(){parent::Controller();}
	
	function index(){
		$data = array();
		$pdata = array();
		$pdata['page_title']='首頁';
		$pdata['page_content'] = $this->parser->parse('welcome_message',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
}

/* End of file welcome.php */
/* Location: ./system/application/controllers/welcome.php */