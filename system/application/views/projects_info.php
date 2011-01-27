<img src="<?=$title_img?>">
<div class="page_content">
<h2>{title}</h2>
<h3>{tname} - {name}</h3>
{content}
<div class="project_pix">
<?php
if(count($pix)>0){
	foreach($pix as $p):
		echo "<a href='".site_url('public/files/images/'.$p->name)."' rel='fancy_group'><img src='".site_url('public/files/images/'.$p->name)."'></a>";
	endforeach;
}
?>
<div class="clear"></div>
</div>
<div class="actions"><a href="<?=site_url($con)?>">返回上一層</a></div>
</div>