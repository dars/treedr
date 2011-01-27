# Sequel Pro dump
# Version 2492
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.1.44)
# Database: treedr
# Generation Time: 2011-01-27 13:39:52 +0800
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `files`;

CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `n_id` int(11) DEFAULT NULL,
  `main` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` (`id`,`name`,`created`,`type`,`n_id`,`main`)
VALUES
	(1,'c36d3a5a07615e30387406ced38aec8f.jpeg',NULL,'pix',1,1),
	(3,'33e1b1993f9be90572fd816d2dea5e1d.jpeg','2011-01-26 18:24:13','pix',1,0);

/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table nodes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nodes`;

CREATE TABLE `nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `type_id` varchar(5) DEFAULT NULL,
  `t_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
INSERT INTO `nodes` (`id`,`title`,`content`,`created`,`modified`,`type_id`,`t_id`)
VALUES
	(1,NULL,'<p>\n	<strong><span style=\"color: rgb(0, 128, 0);\"><span style=\"font-size: 14px;\">加州國際股份有限公司成立簡歷：</span></span></strong></p>\n<table align=\"left\" border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 517px; height: 286px;\">\n	<tbody>\n		<tr>\n			<td style=\"width: 35px;\">\n				<img alt=\"\" src=\"http://localhost/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國80年 籌備</span></span></td>\n		</tr>\n		<tr>\n			<td>\n				<img alt=\"\" src=\"http://localhost/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國83年 成立 加州國際股份有限公司</span></span></td>\n		</tr>\n		<tr>\n			<td>\n				<img alt=\"\" src=\"http://localhost/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國83年-迄今 執行景觀綠美化工程</span></span></td>\n		</tr>\n		<tr>\n			<td>\n				<img alt=\"\" src=\"http://localhost/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國95年 接受樹木褐根病防治講習及辦理相關防治作業</span></span></td>\n		</tr>\n		<tr>\n			<td>\n				<img alt=\"\" src=\"http://localhost/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國96年-迄今 執行台北市樹木褐根病防治作業</span></span></td>\n		</tr>\n		<tr>\n			<td>\n				<img alt=\"\" src=\"http://localhost/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國97年 樹木褐根病防治檢驗流程及檢體檢驗標誌之製作技術轉移</span></span></td>\n		</tr>\n		<tr>\n			<td>\n				<img alt=\"\" src=\"http://localhost/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國98年 樹木外科手術之施作流程技術轉移</span></span></td>\n		</tr>\n		<tr>\n			<td>\n				<img alt=\"\" src=\"http://localhost/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國99年 實驗室成立</span></span></td>\n		</tr>\n	</tbody>\n</table>\n<p>\n	&nbsp;</p>\n','2011-01-23 23:34:05','2011-01-23 23:34:05','3',NULL),
	(2,NULL,'<p>\n	bala..bala..bala..bala..bala..bala..</p>\n<p>\n	bala..bala..bala..bala..</p>\n<p>\n	bala..bala..bala..bala..</p>\n<p>\n	bala..bala..</p>\n','2011-01-23 23:34:05','2011-01-24 02:49:53','4',NULL),
	(3,'上臉書po旅遊計畫 送環遊世界80天','<p>\n	〔自由時報記者李文儀／台北報導〕「環遊世界八十天」不只是十九世紀法國作家凡爾納的小說，二十一世紀可是有航空公司捧著免費機票、飯店及最高達台幣八十四萬元的零用錢讓你花，只要上臉書Facebook提出旅遊計畫，就有機會獲得八十天內暢遊世界的大獎。有背包客說：「簡直是澳洲島主的翻版，超級好康，不參加，對不起父母！」<br />\n	<br />\n	大獎總價值超過150萬<br />\n	<br />\n	國泰航空在Facebook推出「暢遊世界八十日」大賽，只限台灣、日本、加拿大、印尼、印度、南非、英國、美國、香港、荷蘭、新加坡、澳洲等十二個國家地區居民報名，十八歲以上、在三月六日前上臉書說個「讚」，並上傳旅遊計畫短片、照片或文章就可參賽。<br />\n	<br />\n	傳短片、照片或文章<br />\n	<br />\n	國泰航空企業傳訊部副理侯恩錫說，目前已經有上百人報名，參賽者須使用英文，影片限三十到六十秒，文字在兩百字以內；將先選出八位入圍者，獲得免費機票及三晚住宿、每天港幣六百元（三天約台幣六千七百元）零用錢，四月十二日到十四日到香港面試，遊覽香港熱門景點一天，再以社群網絡Twitter上傳照片做最後角逐。<br />\n	<br />\n	目前已上百人報名<br />\n	<br />\n	大獎得主將在五月二日出爐，可獲得六月一日到八月三十一日間的任何八十天，無限次搭乘國泰及港龍航空的經濟艙，每個航點提供三晚住宿，每次旅程可獲得每天最多港幣二千八百元（台幣約一萬零四百四十六元）的餐飲及交通等消費津貼，還有環球旅遊保險，得獎者必須在環遊世界的期間，每天上傳照片及短片到臉書分享。<br />\n	<br />\n	五月二日產生得主<br />\n	<br />\n	目前正在日本打工度假的背包客林仁正說：「有人願意出錢請我玩，一定要報名試試！」一般環遊世界機票若停五個點，就要至少八、九萬元，希望獲獎能去復活島等南美洲或南太平洋等偏遠景點，因為大城市較常有特價機票或廉價航空。自稱「流浪廚師」，已到澳洲、英國等多國打工的他說，將用自己的廚藝長才，提出到陌生人家中料理、換取免費住宿的旅遊計畫。<br />\n	<br />\n	澳洲佬規劃蜜月旅行<br />\n	<br />\n	目前已上傳的參賽計畫中，一位新加坡人表態要照著小說走，從倫敦開啟環遊世界之旅；有一位四十九歲的澳洲佬說，自己沒護照、從未出過國，將和女友結婚，把環遊世界當成蜜月之旅。</p>\n','2011-01-26 15:02:24','2011-01-26 15:02:24','1',3),
	(4,'花博安檢門 只用過2次','<p>\n	台北市花博安檢門採購合約擺烏龍!台北市警局砸了340多萬，跟廠商租用20套金屬探測電子安檢門，準備在重量級貴賓蒞臨時，裝設在場館入口，不過廠商投訴，340多萬的合約只執行了40萬元，花博開幕到現在，安檢門只用過2次。<br />\n	<br />\n	一般民眾逛花博，進出場館，可能從沒見過什麼安檢門，但是陳雲林來參觀的時候可不一樣，高規格的禮遇，台北市警局還特地架了安檢門。<br />\n	<br />\n	台北市警局砸342萬8571元，向廠商租用20套安檢門設備，還要求每次100人的教育訓練，離譜的是，340多萬的合約，到現在只執行了30萬。<br />\n	<br />\n	花博把責任全推到警察局身上，廠商向議員投訴，覺得根本被耍，更叫人質疑的是，安檢門裝設的標準還有使用的時機何在，警察局一定要給業者合理的交代。</p>\n','2011-01-26 15:23:20','2011-01-26 15:23:20','1',3),
	(5,'與新北市府合作 朱團籌設淡水打擊樂文化園區','<p>\n	<img alt=\"\" src=\"http://192.168.1.131/~Dars/treedr/public/files/ckfiles/44960e6e3344e145ce4905d0d195e6a3.jpg\" style=\"width: 320px; height: 213px; float: left; margin: 5px;\" />朱宗慶打擊樂團與新北市政府合作，預計2年後，在面積約0.7公頃的市定古蹟「淡水海關碼頭」，成立「淡水海關碼頭文化教育園區」，未來則定名為「淡水打擊樂文化園區」，使用期為 50年，將做為創作排練、行政營運、教育推廣與藝術休閒等用途，興建可容納300人的排練室、學員宿舍、景觀餐廳，以及一座擊樂博物館。<br />\n	<br />\n	朱宗慶表示，在國外，法國政府也提供空間讓史特拉斯堡打擊樂團做為排練室，並培訓年輕打擊樂家，「但是，淡水打擊樂文化園區規模更大」，朱宗慶表示，「我們預期擊樂園區將對國際產生影響，有這樣一個地方供團員排練與創作，朱宗慶打擊樂團未來的演出也將更密集。」</p>\n','2011-01-26 15:27:35','2011-01-26 20:16:21','1',5),
	(6,'2011年大學學科能力測驗 1月27日登場','<div class=\"w\">\n	<div id=\"ynwsartcontent\">\n		<p>\n			100學年度學科能力測驗即將在1月27、28日登場，全國14萬6300名考生分在30個考區、84個分區、3550個試場應試。大考中心表示，今日(26日)下午2時至4時，開放各考場供考生查看試場座位，</p>\n		<p>\n			大學入學中心主任洪冬桂呼籲考生，記得在開放時段事先到場察看，以免應試當天跑錯試場。洪冬桂說：『(原音)今年<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110126/58/2lh40.html?\" id=\"yui-gen10\" title=\"學測\"><span>學測</span></a>有很大的改變，考生可以提早5分鐘入場，預備鈴響時，這是一個很大的改變，但進考場坐定後，千萬不能用手翻閱題本，但要用眼睛去看(確認)桌上試題本的號碼是不是就是准考證上的號碼(相符)。』</p>\n		<p>\n			另外，今年學測英文作文首次採電腦螢幕閱卷，非選擇題的部分，需要使用黑色墨水筆書寫，不可用鉛筆，電腦才可清楚掃描；選擇題答案卡部分還是需使用2B鉛筆劃記。</p>\n		<p>\n			洪冬桂也提醒，最近<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110126/58/2lh40.html?\" id=\"yui-gen11\" title=\"天氣\"><span>天氣</span></a>特別寒冷，可以攜帶暖暖包、口罩、圍巾等保暖衣物，但要配合監考教師檢查；如果需要吃藥喝水，也要事先和監考人員報備。她特別提醒考生，兩天學測都是上班日，考生最好提早出門，交通路線要事先規劃。</p>\n	</div>\n</div>\n','2011-01-26 21:52:32','2011-01-26 21:52:32','5',NULL),
	(7,'大學學測 週四週五平常日登場','<div class=\"w\">\n	<div id=\"ynwsartcontent\">\n		<p>\n			今14點起看考場</p>\n		<p>\n			〔<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110126/78/2lgfz.html?\" id=\"yui-gen10\" title=\"自由時報\"><span>自由時報</span></a>記者蘇孟娟／台中報導〕大學<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110126/78/2lgfz.html?\" id=\"yui-gen11\" title=\"學測\"><span>學測</span></a>廿七、廿八日登場，今年台中一、二考區有一萬三二三三人報考，分別將在六個考場應考，考生今日下午兩點起可查看考場，試務人員特別提醒今年考試日期訂在平常日，請考生務必查看考場，考試當天並提早出門，以免塞車影響考試時間。</p>\n		<p>\n			台中一考區試務由逢甲大學負責，共有六九三三人報考，分在逢甲大學、文華高中及台中二中考場應考；台中二考區試務由東海大學負責，共六三○○人報考，分在新民高中、台中一中及居仁國中考場應考。</p>\n		<p>\n			上班車潮加應考人潮 考生宜提早出門</p>\n		<p>\n			今 年特殊考場設在逢甲大學，共有廿八名特殊考生報考；試務人員指出，今日下午兩點到四點各考場開放考生查看座位，試務人員特別提醒考生，今年學測兩天考試日 期為週四與週五，均是正常上班日，上午第一節考試時間是九點十五分打預備鈴，九點廿分起開考，考生務必提早出門，以免遭遇上班車潮塞車影響考試。</p>\n		<p>\n			試務人員指出，尤其包括台中一中、新民高中及台中二中考場位置相近，屆時大量應考人潮加上上班車潮，恐讓附近交通流量大增，考生最好注意趕考出發時間；此外，也提醒考生務必提早查看考場，以免跑錯考場又要趕時間影響應考。</p>\n		<p>\n			大學學測廿七日登場，首日考國文、數學及社會科，廿八日考英文、自然科。</p>\n	</div>\n</div>\n','2011-01-26 21:53:09','2011-01-26 21:53:09','5',NULL),
	(8,'「綠黨」滿15歲 備戰立委轉大人','<p>\n	<img alt=\"\" src=\"http://l.yimg.com/o/xp/einfo/20110126/11/2472183354.jpg\" style=\"width: 320px; height: 217px; float: left; margin: 5px;\" />本報2011年1月26日台北訊，特約記者康杰修報導</p>\n<p>\n	成立於1996年的國際環保政黨綠黨，昨（25日）正式成立滿15年，雖然沒有 舉辦正式的黨慶活動，也沒有主流媒體報導，但熱情的網友留言還是把綠黨的粉絲團及官方帳號灌爆，祝福綠黨生日快樂。綠黨秘書長張宏林為綠黨許下生日願望， 希望2012年能夠號召五十萬個地球防衛隊員，將政黨票投給綠黨，讓綠黨順利進入立法院，在兩大黨的惡鬥之下的台灣，能有一個扮演說公道話，真正為弱勢發 聲，不為反對而反對的第三勢力。</p>\n<p>\n	綠黨是台灣唯一的國際政黨，與世界各國綠黨串連，主張環境保護、生態平衡、注重草根民主、堅持社會平等與世界和平等核心價值，僅在成立當年當選過一席國大代表，後來就失去鎂光燈，直到2006年<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110126/109/2lgvh.html?\" id=\"yui-gen0\" title=\"台北市\"><span>台北市</span></a>議員選舉，超過百位知名部落客串聯聲援，綠黨才逐漸打開知名度，獲得以年輕人為主的民眾支持，在去年底的<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110126/109/2lgvh.html?\" id=\"yui-gen1\" title=\"五都選舉\"><span>五都選舉</span></a>一舉獲得2.3%的選票。</p>\n<p>\n	對於綠黨的未來發展，張宏林坦言隱憂不少，雖然因國光石化、<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110126/109/2lgvh.html?\" id=\"yui-gen2\" title=\"慈濟\"><span>慈濟</span></a>內 湖開發案等環保議題持續發酵，再加上馬政府忽視環境保護，讓綠黨的知名度及能見有所提升。但綠黨的未來發展還是面臨許多考驗，除了知名度還是不夠，民眾常 把綠黨誤認為他黨外，基層組織發展及資金問題也讓綠黨面臨非常大的挑戰，與資金充裕的大黨相較，雖然目前一個月只需要不到二十萬左右的運作經費，卻還是每 個月都面臨沒錢付薪水與房租的窘境。</p>\n<p>\n	張宏林表示，綠黨已經開始積極備戰2012初的立委選舉，目標是突破5%得票門檻，搶下立委席次，近期 將積極串連所有關心環保、勞工及其他議題的民間團體，也會開始發展基層組織，除了已有萬人加入的臉書粉絲團之外( http://www.facebook.com/TaiwanGreenParty&nbsp;)，也會於各縣市成立支黨部，呼籲認同理念的民眾可以踴躍入黨，並 捐款支持台灣政治的新力量。</p>\n<p>\n	綠黨小額捐款：https://ecbank.com.tw/donate/greenparty。</p>\n','2011-01-26 21:54:16','2011-01-26 21:54:16','5',NULL),
	(9,'寒流一波波/流感重症高峰 上週暴增134例','<p>\n	<img alt=\"\" src=\"http://l.yimg.com/o/xp/libertytimes/20110126/04/4034610760.jpg\" style=\"width: 319px; height: 212px; margin: 5px; float: left;\" />〔<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110126/78/2lgcd.html?\" id=\"yui-gen10\" title=\"自由時報\"><span>自由時報</span></a>記者王昶閔／台北報導〕寒流一波接一波，流感疫情進入高峰，肺炎鏈球菌同步發威。</p>\n<p>\n	上週國內流感重症暴增一百三十四例、包含五例死亡；流感易併發肺炎鏈球菌感染，<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110126/78/2lgcd.html?\" id=\"yui-gen11\" title=\"台大\"><span>台大</span></a>、長庚等院肺炎病例激增，多位幼童出現膿胸，還有人開刀切除部分肺葉，最近甚至出現今年首例肺炎鏈球菌死亡病例，死者是一名高屏區八十歲老翁。</p>\n<p>\n	目前國內主要流行<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110126/78/2lgcd.html?\" id=\"yui-gen12\" title=\"H1N1\"><span>H1N1</span></a>新流感，上週新增一百三十四例流感重症，其中一百二十六例是H1N1新流感，比例高達九成多。</p>\n<p>\n	兒童肺炎病例數量也激增</p>\n<p>\n	林口長庚<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110126/78/2lgcd.html?\" id=\"yui-gen13\" title=\"兒童\"><span>兒童</span></a>醫院院長林奏延進一步表示，最近兒童肺炎病例的數量與嚴重度，都是歷年來首見。該院最近三週來，收治七十二例肺炎病例，其中十一例病情複雜嚴重，包括肋膜積水、膿胸、壞死性肺炎，年紀最小僅一歲一個月，最大十六歲。</p>\n<p>\n	其中一名兩歲四個月男童，發燒五天後住院，右上肺、中肺化膿潰爛，上週五開刀切除右肺；一名五歲男童，因感染H3N2後，引發肺炎鏈球菌感染，同樣造成壞死性肺炎，用藥物溶解胸部膿液。</p>\n<p>\n	台大小兒感染科主任黃立民指出，該院最近也收到不少兒童肺炎個案，病情惡化快速，一、兩天就住進加護病房，大多是先遭流感病毒或呼吸道融合病毒感染，併發細菌性肺炎，其中又以肺炎鏈球菌為大宗，兒童應接種肺炎鏈球菌<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110126/78/2lgcd.html?\" id=\"yui-gen14\" title=\"疫苗\"><span>疫苗</span></a>，可防範流感重症。</p>\n<p>\n	疾管局暫時放寬使用克流感</p>\n<p>\n	根據衛生署傳染病諮詢委員會專家建議，此刻接種流感疫苗已緩不濟急，防疫得開始仰賴抗病毒藥物（<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110126/78/2lgcd.html?\" id=\"yui-gen15\" title=\"克流感\"><span>克流感</span></a>、瑞樂沙等），因此，疾管局加配五萬人份抗病毒藥物到全國兩百家設有急診的醫院，以因應過年期間的醫療需求。</p>\n<p>\n	即日起到二月底前，疾管局也暫時放寬公費抗病毒藥物使用限制，將「持續高燒四十八小時」、「流感患者家中共同成員有類流感症狀者」納入。</p>\n<p>\n	疾管局副局長林頂表示，很多醫師至今仍以為快篩陽性才能用藥，事實上，只要符合用藥標準，均可以開立抗病毒藥物，呼籲醫師不要延遲用藥，目前國內共有五百家醫療院所，有配置公費克流感。</p>\n','2011-01-26 22:36:59','2011-01-26 15:11:22','6',9),
	(10,'「樹木銀行」成墳場? 移植老樹死光光','<p>\n	<img alt=\"\" src=\"http://l.yimg.com/o/xp/einfo/20110125/11/7857153.jpg\" style=\"width: 320px; height: 240px; margin: 5px; float: left;\" />本報2011年1月25日台北訊，特約記者康杰修報導</p>\n<p>\n	為了讓都市開發被移植的老樹有個新家，<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110125/109/2lel3.html?\" id=\"yui-gen0\" title=\"台中市\"><span>台中市</span></a>一年多前設立樹木銀行，不過原本美意是要保育老樹及綠化市容，卻曾被民眾在<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110125/109/2lel3.html?\" id=\"yui-gen1\" title=\"部落格\"><span>部落格</span></a>踢 爆，施工廠商為了樹木銀行興建施工，不但砍除原本在該地的雜樹林，施工廠商還挖走整個山坡的土石；曾為台中市執行2010年度樹木保護計畫的園藝專家藍梁 文指出，台中市幾年前就曾於旱溪東路附近設立樹木銀行，移植阻礙到道路開發黑板樹，不過他最近探勘，卻發現當時移植的黑板樹已經幾乎死光，儼然成為老樹的 墳場。</p>\n<p>\n	藍梁文指出，以專業角度來看，台中市府移植老樹的方法非常粗暴，不但根部埋太深，也沒有固定澆水，比較像是「棄置」，看起來根本就沒 打算讓老樹活下去。綠黨召集人潘翰聲表示，台中市樹木銀行的狀況並不是特例，近年來各縣市為了都市或道路開發移植老樹是常有的事，一般人以為沒有砍樹就 好，其實「砍樹是公開斬首示眾，移樹則是換個地方凌遲」。至於樹木銀行，讓老樹遭受兩次移植也不見得是好事。</p>\n<p>\n	以<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110125/109/2lel3.html?\" id=\"yui-gen2\" title=\"台北市\"><span>台北市</span></a>來說，<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110125/109/2lel3.html?\" id=\"yui-gen3\" title=\"郝龍斌\"><span>郝龍斌</span></a>上任之後這四五年，包括信義線等<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110125/109/2lel3.html?\" id=\"yui-gen4\" title=\"捷運\"><span>捷運</span></a>工程、大巨蛋、<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110125/109/2lel3.html?\" id=\"yui-gen5\" title=\"花博\"><span>花博</span></a>等 開發案就移植了一萬棵老樹。因為技術總有極限，目前老樹移植的存活率極低，移植幾乎就等於是宣判死刑，例如其中最具爭議的松山菸廠老樹，移植到寶湖國中預 定地的樹木銀行才短短幾個月內就枯死三分之一以上，甚至市議員要去現勘的前一天，還藉故有褐根病「焚屍滅跡」不願公開檢視死亡的老樹樹齡是否超過五十年， 讓許多民眾在綠黨粉絲團痛罵市府是老樹殺手。</p>\n<p>\n	潘翰聲表示，目前各縣市多有樹木保護自治條例，但限於地方自治法規的層級較低，無法給予較高的罰則與保障，如果綠黨2012年立委選舉能順利進入立法院，將推動「樹木保護法」的立法，讓保護老樹不再是口號。</p>\n','2011-01-26 22:37:52','2011-01-26 15:11:31','6',7),
	(11,'黃石公園超級火山蠢動 美三分之二國土恐遭吞噬？','<div class=\"w\">\n	<div id=\"ynwsartcontent\">\n		<p>\n			〔編譯魏國金／綜合報導〕科學家發現，美國黃石公園下的超級火山自2004年以來，以破紀錄的速度隆起，萬一噴發，其威力將是1980年聖海倫斯 火山爆發的1000倍，將使得1610公里範圍內的大地堆積厚達3米的火山灰等物質，其產生的有毒氣體將使3分之2的美國不適居住，數以百萬計的民眾將被 迫大遷徙。</p>\n		<p>\n			沉睡64萬年 2004年起隆起加速</p>\n		<p>\n			英國每日郵報報導，在過去210萬年間，黃石公園的巨大火山口已噴發過3次，最近一次的大噴發是發生在64萬年前。監測該火山活動的研究人員認為，它可能會有另一次噴發。</p>\n		<p>\n			他們說，公園底下的這座世界最大的超級火山自2004年以來上升速度驚人，光是最近3年，每年上升達7.6公分。這是1923年開始進行監測以來，隆起速度最快的紀錄。</p>\n		<p>\n			如果該火山真的爆發，其威力將使去年4月噴發、造成全球空中交通混亂的冰島艾雅法拉火山相形見絀。不過由於缺乏資料，科學家無法預測這座超級火山何時噴發。</p>\n		<p>\n			猶他大學黃石公園的火山專家史密斯率領的研究團隊發現，地底岩漿庫充滿熔岩，他說︰「因為它涵蓋的地區如此廣大，而隆起速率如此之高。一開始我們擔心它朝向爆發發展，但當我們看到岩漿在10公里深之處，就鬆了口氣，如果在2、3公里處，就令人非常憂心。」</p>\n		<p>\n			在 黃石公園內，地表下644公里處是所謂的岩漿「熱點」，岩漿會上升達地下48公里處，同時擴散到直徑483公里範圍內。就在這裡的上方，坐落著這座沉睡的 超級火山；觀測人員認為，目前在地下10公里處，不斷擴大的岩漿庫可能是造成近期異常隆起之因。他們也持續關注一團約洛杉磯大小，被擠壓入火山的煎餅形狀 的熔岩。</p>\n		<p>\n			鑑於這個極端情形，讓研究人員難以確定黃石公園的地下將發生何事，或者何時發生。</p>\n		<p>\n			最近一次小噴發 7萬年前</p>\n		<p>\n			該公園的超級火山於64萬年以來，歷經約30次的較小噴發，最近一次的小噴發發生在7萬年前。美國地質學家德蘇里辛說，若不是岩漿的地熱作用，現在黃石公園不會冒出這麼多熱氣，從7萬年前的上次噴發以來，整個黃石公園會成為一片冷石。</p>\n	</div>\n</div>\n','2011-01-26 22:38:24','2011-01-26 15:11:38','6',6),
	(12,'Yahoo','http://www.yahoo.com.tw','2011-01-26 19:24:36','2011-01-26 19:24:36','10',NULL),
	(13,'PCHome','http://www.pchome.com.tw','2011-01-26 19:24:51','2011-01-26 19:24:51','10',NULL),
	(14,'Yaｍ番薯藤','http://www.yam.com.tw','2011-01-26 19:25:06','2011-01-26 19:25:06','10',NULL),
	(15,'雅虎拍賣','http://bid.yahoo.com.tw','2011-01-26 19:25:22','2011-01-26 19:25:22','10',NULL),
	(16,'第一次開課','<p>\n	<img alt=\"\" src=\"http://l.yimg.com/o/xp/cna/20110127/08/1373469224.jpg\" style=\"width: 120px; height: 160px; margin: 5px; float: left;\" />宏達電暨威盛董事長王雪紅入主香港老牌無線電視台TVB。香港傳媒集團電視廣播（TVB）昨（26）日晚間9時公告，公司大股東邵氏兄弟公司所擁有的26%股權，將全數售給王雪紅參與的投資集團，該集團將成為TVB最大股東。</p>\n','2011-01-27 05:09:16','2011-01-27 05:09:16','8',21),
	(17,'Janet達人打包教戰 旅遊法寶大公開','<p>\n	<img alt=\"\" src=\"http://l.yimg.com/o/xp/nextmedia/20110127/06/3484386359.jpg\" style=\"width: 200px; height: 133px; margin: 5px; float: left;\" />【張瑞振╱台北報導】過年假期是國人旅遊旺季，出國帶什麼東西最有幫助？《瘋台灣》主持人Janet和搭檔Nadia因經常到國外出外景而成為旅遊達人，她們不管在身體健康、心靈、收納和工作上，出國都有萬全準備，以備不時之需。</p>\n<p>\n	出國最忌諱生病，Janet曾獲准申請進入德州聖安東尼奧醫學院，後來雖因故休學，但這段經歷讓她出國很重視醫藥方面物品，必定會帶小透明包，內有治感冒藥、頭痛、止瀉、暈車、暈船、燒燙傷和脫水等藥物，有如小型醫藥箱。</p>\n<p>\n	帶簡易洗鼻壺 灌鹽水防感冒</p>\n<p>\n	她甚至自備針筒，原來有次赴<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110127/143/2lixv.html?\" id=\"yui-gen10\" title=\"印度\"><span>印度</span></a>偏遠地區旅行，因生病到醫院就診，但她看到髒針筒後當場打退堂鼓，忍到回台灣再就醫，經過這次不舒服的經驗，她之後出國都帶專用針筒出國。</p>\n<p>\n	Nadia不喜歡吃藥，若出國，感冒上身，她會將混著鹽巴的熱水裝在簡易洗鼻壺裡，然後將鹽水從一鼻孔灌入，鹽水再從另一鼻孔流出，有清鼻之用，Janet戲稱也試過這東西，鹽水卻從她眼晴裡流出。</p>\n<p>\n	Janet 建議出國攜物愈簡便愈好，最好能一物多用，如快乾毛巾，5分鐘即乾，好折疊還能當枕頭；收納袋1組有大、中、小共3袋，將衣物放入袋中捲起來壓出空氣，可 減少空間還能防水，由她阿嬤親手縫製的大型絲袋，功能有如睡袋，她笑說：「睡進去時，記得要脫光光喔，因為絲接觸皮膚會產生保暖作用。」</p>\n<p>\n	旅遊若遇衰事很掃興，Janet出國必帶一隻小型大頭狗偶，該狗偶是9年前姊姊送她的禮物，她認為這是她的吉祥物，Nadia則會帶一個印度檀香神像，沒有宗教信仰的她說：「只要遇到不好、困難或要挑戰的事情，我都會跟神像說說，保平安啦！」</p>\n<p>\n	出國5守則保平安</p>\n<p>\n	★財物證件隨身帶：Janet都將小額金錢、護照、<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110127/143/2lixv.html?\" id=\"yui-gen11\" title=\"信用卡\"><span>信用卡</span></a>、照片等放在霹靂袋內，綁在內褲腰上，以褲頭遮住</p>\n<p>\n	★要備齊重要藥品：將感冒、止瀉、暈車、暈船、防脫水等重要藥品放在小型透明袋中，生病時可以派上用場</p>\n<p>\n	★偽裝外型以避險：Nadia建議可將自己頭髮以圍巾包住，裝成一位老婆婆，比較不易被男子察覺而被侵犯</p>\n<p>\n	★外出要告知友人：若外出，Janet建議一定要告訴至少一位朋友你的目的地，或與一群同伴隨行，避免落單</p>\n<p>\n	★玩樂先觀察環境：在國外到Bar玩樂，Nadia建議不要只喝酒，出發前可吃點麵包墊肚子，避免空腹喝醉</p>\n','2011-01-27 05:12:32','2011-01-27 05:12:32','2',22);

/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `name` varchar(100) DEFAULT NULL,
  `years` varchar(50) DEFAULT NULL,
  `t_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`id`,`title`,`content`,`name`,`years`,`t_id`,`created`,`modified`)
VALUES
	(1,'QQQQQ','<p>\n	bala..</p>\n<p>\n	bala..</p>\n<p>\n	bala..</p>\n<p>\n	bala..</p>\n<p>\n	bala..</p>\n','WWWWW','2009',13,'2011-01-26 18:17:52','2011-01-26 21:13:56'),
	(2,'樹木植晶片 山老鼠有贓難銷','<div class=\"w\">\n	<div id=\"ynwsartcontent\">\n		<p>\n			中國時報【潘建志／屏東報導】</p>\n		<p>\n			不只<a class=\"ynwsyq yqclass\" href=\"http://tw.news.yahoo.com/article/url/d/a/110124/4/2lbu6.html?\" id=\"yui-gen0\" title=\"寵物\"><span>寵物</span></a>要植入晶片，樹木也要植入晶片。屏東林區管理處為了要杜絕被盜挖林木的銷贓管道，將晶片植入國有林地的珍貴樹種中，以後只要在市場上發現這些「贓樹」，就能輕易地辨識是從何處盜採，更容易將山老鼠甚至是購買者定罪，更具嚇阻作用。</p>\n		<p>\n			屏東林管處首先選定植入晶片的地區是恆春半島。恆春半島因為落山風強勁，樹木在強風吹襲下形成遒勁獨特的造型，特有的樹瘤、樹溝更讓其身價不凡，市場上非常搶手。加上恆春的山脈海拔低，交通方便，盜採及運輸容易，因此山老鼠特別猖獗。</p>\n		<p>\n			警方估計恆春地區專業的山老鼠集團就多達十多個，集團成員最多十數人，盜挖工具齊全，以報廢車或贓車改裝成山林越野車，遇到警察就棄車逃逸。山老鼠在山林中熟門熟路，還會自己開小路，以無線電相互聯繫，機動性很高，和警方及林務人員大玩捉迷藏。</p>\n		<p>\n			因此屏東林管處今年引進新科技，和猖獗的山老鼠宣戰，作法是將區內珍貴的園藝樹種及林木植入晶片。林政課長張智強說，首先將區內的樹木拍照、定位座標建立基本資料庫，接著將一個已編碼，二吋釘子大小般的晶片打鑽進樹中，再加以密合。</p>\n		<p>\n			之後若這棵樹木被偷，在銷贓市場上被發現，就能輕易地辨別是在何處盜採，有助於將盜木者定罪。張智強說，以往警方或林務人員抓到山老鼠，往往要大費周章查出是在何處盜木，即便山老鼠供出盜木地點，現場因為樹根和挖洞不符，檢察官也無法起訴，讓人氣結。</p>\n		<p>\n			有了這套系統後，就能輕易找出盜木地點，也更證據確鑿讓山老鼠無法狡賴。另外以往都只能定山老鼠的罪，無法將購買者制罪，有了這套系統，購買者也無法脫罪。因為有買賣才有盜採，從買賣源頭阻斷，才能有效防止盜木事件發生。</p>\n		<p>\n			目前晶片已植入恆春半島一萬多棵樹中。張智強說，和被盜木損失相比，晶片花費只是一點點，所以只要經費許可，就盡量幫樹木植入晶片，多少沒有上限。而其他地區的重要林木，也都會陸續進執行。</p>\n	</div>\n</div>\n','Yahoo','2009',14,'2011-01-26 21:20:30','2011-01-26 21:20:46');

/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table taxonomy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taxonomy`;

CREATE TABLE `taxonomy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `weight` float NOT NULL DEFAULT '0',
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

LOCK TABLES `taxonomy` WRITE;
/*!40000 ALTER TABLE `taxonomy` DISABLE KEYS */;
INSERT INTO `taxonomy` (`id`,`name`,`weight`,`type_id`)
VALUES
	(1,'未分類',999,0),
	(3,'旅遊消息',0,1),
	(5,'藝文消息',0,1),
	(6,'認識樹木褐根病',0,6),
	(7,'褐根病診斷流程',0,6),
	(8,'褐根病防治流程',0,6),
	(9,'樹木外科防治',0,6),
	(13,'樹木病蟲害防治',0,7),
	(14,'樹木褐根病防治',0,7),
	(15,'景觀綠美化工程',0,7),
	(21,'知識講談',0,8),
	(20,'使用者的提問',0,9),
	(22,'旅遊小知識',0,2);

/*!40000 ALTER TABLE `taxonomy` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` (`id`,`name`)
VALUES
	(1,'最新消息'),
	(2,'樹木知識'),
	(3,'關於我們'),
	(4,'相關法令'),
	(5,'服務項目'),
	(6,'樹木醫生'),
	(7,'專案展示'),
	(8,'活動講座'),
	(9,'我要提問'),
	(10,'友善連結');

/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
