# Sequel Pro dump
# Version 2492
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.1.44)
# Database: treedr
# Generation Time: 2011-01-24 12:35:37 +0800
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table nodes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nodes`;

CREATE TABLE `nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `node_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
INSERT INTO `nodes` (`id`,`title`,`content`,`created`,`modified`,`node_type`)
VALUES
	(1,NULL,'<p>\n	<strong><span style=\"color: rgb(0, 128, 0);\"><span style=\"font-size: 14px;\">加州國際股份有限公司成立簡歷：</span></span></strong></p>\n<table align=\"left\" border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 517px; height: 286px;\">\n	<tbody>\n		<tr>\n			<td style=\"width: 35px;\">\n				<img alt=\"\" src=\"http://192.168.1.131/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國80年 籌備</span></span></td>\n		</tr>\n		<tr>\n			<td>\n				<img alt=\"\" src=\"http://192.168.1.131/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國83年 成立 加州國際股份有限公司</span></span></td>\n		</tr>\n		<tr>\n			<td>\n				<img alt=\"\" src=\"http://192.168.1.131/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國83年-迄今 執行景觀綠美化工程</span></span></td>\n		</tr>\n		<tr>\n			<td>\n				<img alt=\"\" src=\"http://192.168.1.131/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國95年 接受樹木褐根病防治講習及辦理相關防治作業</span></span></td>\n		</tr>\n		<tr>\n			<td>\n				<img alt=\"\" src=\"http://192.168.1.131/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國96年-迄今 執行台北市樹木褐根病防治作業</span></span></td>\n		</tr>\n		<tr>\n			<td>\n				<img alt=\"\" src=\"http://192.168.1.131/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國97年 樹木褐根病防治檢驗流程及檢體檢驗標誌之製作技術轉移</span></span></td>\n		</tr>\n		<tr>\n			<td>\n				<img alt=\"\" src=\"http://192.168.1.131/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國98年 樹木外科手術之施作流程技術轉移</span></span></td>\n		</tr>\n		<tr>\n			<td>\n				<img alt=\"\" src=\"http://192.168.1.131/~Dars/treedr/public/files/ckfiles/fe98ad1ab21b1001f5eeb99fcdb50e71.jpg\" style=\"width: 30px; height: 30px;\" /></td>\n			<td>\n				<span style=\"color: rgb(0, 0, 0);\"><span style=\"font-size: 14px;\">民國99年 實驗室成立</span></span></td>\n		</tr>\n	</tbody>\n</table>\n<p>\n	&nbsp;</p>\n','2011-01-23 23:34:05','2011-01-23 23:34:05','關於我們'),
	(2,NULL,'<p>\n	bala..bala..bala..bala..bala..bala..</p>\n<p>\n	bala..bala..bala..bala..</p>\n<p>\n	bala..bala..bala..bala..</p>\n<p>\n	bala..bala..</p>\n','2011-01-23 23:34:05','2011-01-24 02:49:53','相關法令');

/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
