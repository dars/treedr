<?php
class Sitemap extends Controller{
	function __construct(){parent::Controller();}
	function index(){
		$data['title_img'] = site_url("public/images/main/12sitmap/title.jpg");
		$pdata['page_title'] = "網站地圖";
		$pdata['page_content'] = $this->parser->parse('sitemap',$data,true);
		$this->parser->parse('layout/main',$pdata);
	}
}