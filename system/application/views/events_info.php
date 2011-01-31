<script type="text/javascript">
$(function(){
	$('#form1').submit(function(){
		if($('#name').val() === ''){
			alert('請填入聯絡姓名');
			return false;
		}else if($('#tel').val() === ''){
			alert('請填入聯絡電話');
			return false;
		}else{
			return true;
		}
		return false;
	});
	setTimeout(function(){$('.session_notify').fadeOut(1000)},2000);
});
</script>
<img src="<?=$title_img?>">
<div class="page_content">
<?=$this->session->flashdata('notify');?>
<h2>[{tname}] {title}</h2>
{content}
<form method="post" name="form1" id="form1" action="<?=site_url('events/signup')?>">
<table id="signup_tb">
	<tr><th colspan=2 id="signup_title">報名表單</th></tr>
	<tr>
		<th>聯絡姓名</th>
		<td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<th>聯絡電話</th>
		<td><input type="text" name="tel" id="tel"></td>
	</tr>
	<tr>
		<th>Email</th>
		<td><input type="text" name="email" id="email"></td>
	</tr>
	<tr>
		<td colspan=2 class="actions">
			<span class="scount">目前已報名人數：{scount}</span>
			<input type="hidden" name="n_id" value="<?=$this->uri->segment(3)?>">
			<button type="submit" id="sub_btn">確認報名</button>
		</td>
	</tr>
</table>
</form>
<div class="actions"><a href="<?=site_url($con)?>">返回上一層</a></div>
</div>