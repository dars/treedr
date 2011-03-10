<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>加州國際 - {page_title}</title>
<link rel="shortcut icon" href="<?=site_url('public/images/favicon.ico')?>" type="image/x-icon" />
<script type="text/javascript">
<!--
function MM_preloadImages() { //v3.0
	var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
		var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
		if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_swapImgRestore() { //v3.0
	var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_findObj(n, d) { //v4.01
	var p,i,x;	if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
		d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
	var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
 	if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<link rel="stylesheet" href="<?=site_url('public/css/jquery.fancybox-1.3.4.css');?>">
<script src="<?=site_url('public/js/jquery-1.4.4.min.js')?>"></script>
<script src="<?=site_url('public/js/jquery-ui-1.8.7.min.js')?>"></script>
<script src="<?=site_url('public/js/jquery.easing-1.3.pack.js')?>"></script>
<script src="<?=site_url('public/js/jquery.fancybox-1.3.4.pack.js')?>"></script>
<script src="<?=site_url('public/js/jquery.mousewheel-3.0.4.pack.js')?>"></script>
<script>
var tmp_id;
$(function(){
	$('a[rel=fancy_group]').fancybox({
		'titlePosition':'inside'
	});
	$('.main_nav a').hover(function(){
		if(typeof tmp_id !== 'undefined'){
			$('#sub_nav_'+tmp_id).css('display','none');
		}
		tmp_id = this.className.split('_')[2];
		$('#sub_nav_'+tmp_id).css('display','block');
	});
});
</script>
<style type="text/css">
<!--
@import url("<?=site_url('public/css/css-index.css')?>");
body {
	background-color: #FFFFFF;
	font-family: Arial, Helvetica, sans-serif;
}
-->
</style>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('<?=site_url('public/images/b01-b.jpg')?>','<?=site_url('public/images/b02-b.jpg')?>','<?=site_url('public/images/b03-b.jpg')?>','<?=site_url('public/images/b04-b.jpg')?>','<?=site_url('public/images/b05-b.jpg')?>','<?=site_url('public/images/b06-b.jpg')?>','<?=site_url('public/images/b07-b.jpg')?>')">
<table width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td height="131" align="center" background="<?=site_url('public/images/back-pic01.jpg')?>"><table width="900" cellspacing="0" cellpadding="0">
			<tr>
				<td width="298"><img src="<?=site_url('public/images/logo.jpg')?>" width="298" height="131"></td>
				<td><table width="602" cellspacing="0" cellpadding="0">
					<tr>
						<td height="41" align="right"><span class="link01">
							<a href="<?=site_url('nodes/aboutus')?>" class="link01">首頁</a> ︱ 
							<a href="<?=site_url('nodes/aboutus');?>" class="link01">關於我們</a> ︱ 
							<a href="<?=site_url('links')?>" class="link01">友善連結</a> ︱ 
							<a href="mailto:hksl.ab@msa.hinet.net" class="link01">聯絡我們</a> ︱ 
							<a href="<?=site_url('sitemap')?>" class="link01">網站地圖</a> ︱ 
							<a href="<?=site_url('nodes/relevant')?>" class="link01">相關規定法令</a>
						</span>　</td>
					</tr>
					<tr>
						<td height="59"><table width="602" cellspacing="0" cellpadding="0" class="main_nav">
							<tr>
								<td width="87"><a class="main_nav_1" href="<?=site_url('news')?>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<?=site_url('public/images/b01-b.jpg')?>',1)"><img src="<?=site_url('public/images/b01.jpg')?>" name="Image2" width="87" height="59" border="0"></a></td>
								<td width="88"><a class="main_nav_5" href="<?=site_url('service')?>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','<?=site_url('public/images/b02-b.jpg')?>',1)"><img src="<?=site_url('public/images/b02.jpg')?>" name="Image3" width="88" height="59" border="0"></a></td>
								<td width="85"><a class="main_nav_6" href="<?=site_url('defending')?>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','<?=site_url('public/images/b03-b.jpg')?>',1)"><img src="<?=site_url('public/images/b03.jpg')?>" name="Image4" width="85" height="59" border="0"></a></td>
								<td width="87"><a class="main_nav_7" href="<?=site_url('projects')?>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<?=site_url('public/images/b04-b.jpg')?>',1)"><img src="<?=site_url('public/images/b04.jpg')?>" name="Image5" width="87" height="59" border="0"></a></td>
								<td width="87"><a class="main_nav_8" href="<?=site_url('events')?>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','<?=site_url('public/images/b05-b.jpg')?>',1)"><img src="<?=site_url('public/images/b05.jpg')?>" name="Image6" width="87" height="59" border="0"></a></td>
								<td width="85"><a class="main_nav_2" href="<?=site_url('knowledge')?>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image7','','<?=site_url('public/images/b06-b.jpg')?>',1)"><img src="<?=site_url('public/images/b06.jpg')?>" name="Image7" width="85" height="59" border="0"></a></td>
								<td><a href="<?=site_url('faq')?>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image8','','<?=site_url('public/images/b07-b.jpg')?>',1)"><img src="<?=site_url('public/images/b07.jpg')?>" name="Image8" width="83" height="59" border="0"></a></td>
							</tr>
						</table></td>
					</tr>
					<tr>
						<td height="31"><table width="500" cellspacing="0" cellpadding="0">
							<tr>
								<td><?php $this->load->model('list_taxo_model');?></td>
							</tr>
						</table></td>
					</tr>
				</table></td>
			</tr>
		</table></td>
	</tr>
	<tr>
		<td align="center"><table width="900" cellspacing="0" cellpadding="0">
			<tr>
				<td><img src="<?=site_url('public/images/m-pic.jpg')?>" width="900" height="261"></td>
			</tr>
			<tr>
				<td height="150">{page_content}</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><img src="<?=site_url('public/images/m-pic01.jpg')?>" width="900" height="154"></td>
			</tr>
			<tr>
				<td height="20" align="center" class="link01">
					<a href="<?=site_url('nodes/aboutus')?>" class="link01">首頁</a> ∣ 
					<a href="<?=site_url('news')?>" class="link01">最新消息</a> ∣ 
					<a href="<?=site_url('nodes/aboutus');?>" class="link01">關於我們</a> ∣ 
					<a href="<?=site_url('service')?>" class="link01">服務項目</a> ∣ 
					<a href="<?=site_url('defending')?>" class="link01">樹木醫生</a> ∣ 
					<a href="<?=site_url('projects')?>" class="link01">專案展示</a> ∣ 
					<a href="<?=site_url('events')?>" class="link01">活動講座</a> ∣ 
					<a href="<?=site_url('knowledge')?>" class="link01">樹木知識</a> ∣ 
					<a href="<?=site_url('faq')?>" class="link01">我要提問</a> ∣ 
					<a href="<?=site_url('nodes/relevant')?>" class="link01">相關規定法令</a> ∣ 
					<a href="<?=site_url('links')?>" class="link01">友善連結</a> ∣ 
					<a href="mailto:hksl.ab@msa.hinet.net" class="link01">聯絡我們</a> ∣ 
					<a href="<?=site_url('sitemap')?>" class="link01">網站地圖</a></td>
			</tr>
			<tr>
				<td height="80" align="center"><span class="copyright">加州國際股份有限公司　2011 &copy; 版權所有</span><br>
					<span class="copyright1">10052臺北市中正區林森南路59號B1　TEL：02-2396-1234　FAX：02-2396-3312　E-mail：hksl.ab@msa.hinet.net<br>
					B1F., No.59, Linsen S. Rd., Zhongzheng Dist., Taipei City 10052, Taiwan (R.O.C.)</span></td>
			</tr>
			<tr>
				<td height="20"><img src="<?=site_url('public/images/1pix.gif')?>" width="1" height="1"></td>
			</tr>
		</table></td>
	</tr>
</table>
<p id="page_render_time"><br />Page rendered in {elapsed_time} seconds</p>
</body>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2037884-9']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</html>