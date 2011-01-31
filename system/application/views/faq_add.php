<script type="text/javascript">
$(function(){
	$('#form1').submit(function(){
		if($('#name').val() === ''){
			alert('請填入姓名');
			return false;
		}else if($('#title').val() === ''){
			alert('請填入問題內容');
			return false;
		}else{
			return true;
		}
		return false;
	});
});
</script>
<img src="<?=$title_img?>">
<div class="page_content">
<form method="post" name="form1" id="form1" action="<?=site_url('faq/add_post')?>">
<table id="faq_tb">
	<tr>
		<th>姓名</th><td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<th colspan=2>問題內容</th>
	</tr>
	<tr>
		<td colspan=2>
			<textarea name="title" id="title"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan=2 class="actions"><button type="submit" id="sub_btn">確認送出</button></td>
	</tr>
</table>
</form>
<a href="<?=site_url('faq')?>">返回上一頁</a>
</div>