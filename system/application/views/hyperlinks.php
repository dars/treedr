<img src="<?=$title_img?>">
<div class="page_content">
<?php
echo "<table class='list_tb'>";
foreach($data as $r):
echo "<tr><td><a href='".site_url('service/info/'.$r->content)."' target='_blank'>".$r->title."</a></td></tr>";
endforeach;
echo "</table>";
?>
</div>