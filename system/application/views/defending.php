<img src="<?=$title_img?>">
<div class="page_content">
<?php
echo "<table class='list_tb'>";
foreach($data as $r):
echo "<tr><td>";
echo "<a href='".site_url('defending/info/'.$r->id)."'>".$r->title."</a>";
echo "<div class='summary'>".mb_substr(strip_tags($r->content),0,100,'utf8')."<a href='".site_url('defending/info/'.$r->id)."'>...more</a></div>";
echo "</td></tr>";
endforeach;
echo "</table>";
?>
</div>