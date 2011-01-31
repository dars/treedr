<script type="text/javascript">
$(function(){
	setTimeout(function(){$('.session_notify').fadeOut(1000)},2000);
});
</script>
<img src="<?=$title_img?>">
<div class="page_content">
<?=$this->session->flashdata('notify');?>
<a href="<?=site_url('faq/post');?>">新增提問</a>
<?php
echo "<table class='list_tb'>";
foreach($data as $r):
echo "<tr><td>";
echo "<a href='".site_url($con.'/info/'.$r->id)."'>[".$r->tname."] ".$r->title."</a>";
echo "<div class='summary'>".mb_substr(strip_tags($r->content),0,100,'utf8')."<a href='".site_url($con.'/info/'.$r->id)."'>...more</a></div>";
echo "</td></tr>";
endforeach;
echo "</table>";
?>
</div>