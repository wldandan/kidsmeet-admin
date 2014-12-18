# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.16)
# Database: kidsmeet
# Generation Time: 2014-12-13 08:59:01 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ckeditor_assets
# ------------------------------------------------------------

CREATE TABLE `ckeditor_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `data_file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `assetable_id` int(11) DEFAULT NULL,
  `assetable_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ckeditor_assetable_type` (`assetable_type`,`type`,`assetable_id`),
  KEY `idx_ckeditor_assetable` (`assetable_type`,`assetable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ckeditor_assets` WRITE;
/*!40000 ALTER TABLE `ckeditor_assets` DISABLE KEYS */;

INSERT INTO `ckeditor_assets` (`id`, `agent_id`, `event_id`, `data_file_name`, `data_content_type`, `data_file_size`, `assetable_id`, `assetable_type`, `type`, `width`, `height`, `created_at`, `updated_at`)
VALUES
	(2,5,NULL,'img_20130707_104419.jpg','image/jpeg',1130406,NULL,NULL,'Ckeditor::Picture',NULL,NULL,'2014-11-22 07:08:44','2014-11-22 07:08:44'),
	(3,5,NULL,'IMG_20130707_115358.jpg','image/jpeg',924326,NULL,NULL,'Ckeditor::Picture',NULL,NULL,'2014-11-22 08:07:31','2014-11-26 04:44:10'),
	(4,5,NULL,'img_20130707_103724.jpg','image/jpeg',1118672,NULL,NULL,'Ckeditor::Picture',NULL,NULL,'2014-11-26 01:54:38','2014-11-26 01:54:38'),
	(5,5,NULL,'img_20130707_104220.jpg','image/jpeg',988191,NULL,NULL,'Ckeditor::Picture',NULL,NULL,'2014-11-26 04:04:32','2014-11-26 04:04:32'),
	(6,NULL,NULL,'img_20130712_092859.jpg','image/jpeg',987375,NULL,NULL,'Ckeditor::Picture',NULL,NULL,'2014-11-26 04:05:06','2014-11-26 04:05:06'),
	(7,NULL,NULL,'img_20131003_172208.jpg','image/jpeg',1185249,NULL,NULL,'Ckeditor::Picture',NULL,NULL,'2014-11-26 04:05:50','2014-11-26 04:05:50'),
	(8,NULL,1,'img_20131012_110932.jpg','image/jpeg',2056203,NULL,NULL,'Ckeditor::Picture',NULL,NULL,'2014-11-26 04:06:57','2014-11-26 04:06:57'),
	(9,NULL,NULL,'img_20131116_121838.jpg','image/jpeg',1407464,NULL,NULL,'Ckeditor::Picture',NULL,NULL,'2014-11-26 04:07:59','2014-11-26 04:07:59'),
	(10,NULL,2,'img_20130707_103724.jpg','image/jpeg',1118672,NULL,NULL,'Ckeditor::Picture',NULL,NULL,'2014-11-26 04:47:25','2014-11-26 04:47:25'),
	(12,5,3,'1.jpg','image/jpeg',108214,NULL,NULL,'Ckeditor::Picture',NULL,NULL,'2014-12-09 14:38:34','2014-12-09 14:38:34'),
	(13,5,2,'烘培_1.jpg','image/jpeg',108214,NULL,NULL,'Ckeditor::Picture',NULL,NULL,'2014-12-09 14:47:35','2014-12-13 02:48:04'),
	(14,5,1,'8.pic_hd.jpg','image/jpeg',39367,NULL,NULL,'Ckeditor::Picture',NULL,NULL,'2014-12-09 16:28:05','2014-12-13 02:47:36'),
	(15,1,11,'3.jpg','image/jpeg',71459,NULL,NULL,'Ckeditor::Picture',NULL,NULL,'2014-12-10 15:58:49','2014-12-10 15:58:49'),
	(24,NULL,5,'1.jpg','image/jpeg',108214,NULL,NULL,'Ckeditor::Picture',770,428,'2014-12-13 03:43:02','2014-12-13 03:43:02'),
	(25,NULL,3,'2.jpg','image/jpeg',348834,NULL,NULL,'Ckeditor::Picture',770,427,'2014-12-13 03:43:05','2014-12-13 03:43:05'),
	(26,NULL,5,'3.jpg','image/jpeg',71459,NULL,NULL,'Ckeditor::Picture',770,428,'2014-12-13 03:43:09','2014-12-13 03:43:09'),
	(27,NULL,5,'4.jpg','image/jpeg',99219,NULL,NULL,'Ckeditor::Picture',770,428,'2014-12-13 03:43:11','2014-12-13 03:43:11'),
	(29,NULL,5,'img_1595.jpg','image/jpeg',496845,NULL,NULL,'Ckeditor::Picture',1632,1224,'2014-12-13 04:14:11','2014-12-13 04:14:11'),
	(30,NULL,4,'2.jpg','image/jpeg',348834,NULL,NULL,'Ckeditor::Picture',770,427,'2014-12-13 08:14:58','2014-12-13 08:14:58'),
	(31,NULL,12,'4.jpg','image/jpeg',99219,NULL,NULL,'Ckeditor::Picture',770,428,'2014-12-13 08:16:37','2014-12-13 08:16:37');

/*!40000 ALTER TABLE `ckeditor_assets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
