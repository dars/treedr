<img src="<?=$title_img?>">
<div class="page_content">
<?php
echo "<table class='list_tb'>";
$i=0;
$col = 2;
foreach($data as $r):
	if($i%$col == 0){
		echo "<tr><td>";
	}else{
		echo "<td style='width:50%;'>";
	}
	if(!empty($r->cname)){
		echo "<div class='thumb-img'><img src='".site_url('public/files/images/'.$r->cname)."'></div>";
	}else{
		echo "<div class='thumb-img'><img src='".site_url('public/images/no-image.png')."'></div>";
	}
	echo "<div class='taxo_name'>".$r->tname." - ".$r->name."</div>";
	echo "<a href='".site_url('projects/info/'.$r->id)."'>".$r->title."</a>";	
	echo "<div class='summary'>".mb_substr(strip_tags($r->content),0,60,'utf8')."<a href='".site_url('projects/info/'.$r->id)."'>...more</a></div>";
	echo "<div style='clear:both;'></div>";
	echo "</td>";
	if($i%$col == ($col-1)){
		echo "</tr>";
	}
	$i++;
endforeach;
if($i%$col == ($col-1)){
	echo "<td>&nbsp;</td></tr>";
}
/*
if($i%$col == 2){
	echo "</tr>";
}
*/
echo "</table>";
?>
</div>