-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: xzn
-- ------------------------------------------------------
-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `customer_id` int(8) NOT NULL,
  `address_id` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `province` varchar(255) DEFAULT NULL,
  `consignee` varchar(255) NOT NULL,
  `consignee_phone` varchar(255) NOT NULL,
  `consignee_sex` varchar(10) DEFAULT NULL,
  `house_no` varchar(255) NOT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `tag` varchar(10) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`address_id`,`customer_id`,`house_no`) USING BTREE,
  KEY `customer_id` (`customer_id`,`address_id`) USING BTREE,
  KEY `address_id` (`address_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,00001,'上海市','lzh','18721522908','M','999',NULL,NULL,'学校','上海市','奉贤区','海思路'),(1,00002,'上海市','Johnny','18721517889','M','999','30.827640','121.506480','学校','上海市','奉贤去','海思路'),(1,00003,'上海市','shl','18817669250','M','130号','31.141382','121.421251','学校','上海市','徐汇区区','梅陇路');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add user',8,'add_user'),(30,'Can change user',8,'change_user'),(31,'Can delete user',8,'delete_user'),(32,'Can view user',8,'view_user'),(33,'Can add goods',9,'add_goods'),(34,'Can change goods',9,'change_goods'),(35,'Can delete goods',9,'delete_goods'),(36,'Can view goods',9,'view_goods'),(37,'Can add address',10,'add_address'),(38,'Can change address',10,'change_address'),(39,'Can delete address',10,'delete_address'),(40,'Can view address',10,'view_address'),(41,'Can add shopping cart',11,'add_shoppingcart'),(42,'Can change shopping cart',11,'change_shoppingcart'),(43,'Can delete shopping cart',11,'delete_shoppingcart'),(44,'Can view shopping cart',11,'view_shoppingcart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`) USING BTREE,
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`) USING BTREE,
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryman`
--

DROP TABLE IF EXISTS `deliveryman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveryman` (
  `deliveryman_id` int(8) unsigned zerofill NOT NULL,
  `warehouse_id` varchar(20) DEFAULT NULL,
  `taking_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`deliveryman_id`) USING BTREE,
  KEY `d_warehouse_fk` (`warehouse_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryman`
--

LOCK TABLES `deliveryman` WRITE;
/*!40000 ALTER TABLE `deliveryman` DISABLE KEYS */;
INSERT INTO `deliveryman` VALUES (00000001,'1','1');
/*!40000 ALTER TABLE `deliveryman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'AddressAPI','address'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'CartAPI','shoppingcart'),(5,'contenttypes','contenttype'),(9,'GoodsAPI','goods'),(7,'LoginAPI','user'),(6,'sessions','session'),(8,'UserInfoAPI','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-05-15 08:18:31.504376'),(2,'auth','0001_initial','2020-05-15 08:18:32.388127'),(3,'admin','0001_initial','2020-05-15 08:18:35.730317'),(4,'admin','0002_logentry_remove_auto_add','2020-05-15 08:18:36.293381'),(5,'admin','0003_logentry_add_action_flag_choices','2020-05-15 08:18:36.312900'),(6,'contenttypes','0002_remove_content_type_name','2020-05-15 08:18:37.053844'),(7,'auth','0002_alter_permission_name_max_length','2020-05-15 08:18:37.413014'),(8,'auth','0003_alter_user_email_max_length','2020-05-15 08:18:37.781939'),(9,'auth','0004_alter_user_username_opts','2020-05-15 08:18:37.829765'),(10,'auth','0005_alter_user_last_login_null','2020-05-15 08:18:38.113881'),(11,'auth','0006_require_contenttypes_0002','2020-05-15 08:18:38.131453'),(12,'auth','0007_alter_validators_add_error_messages','2020-05-15 08:18:38.161703'),(13,'auth','0008_alter_user_username_max_length','2020-05-15 08:18:38.517947'),(14,'auth','0009_alter_user_last_name_max_length','2020-05-15 08:18:39.238722'),(15,'auth','0010_alter_group_name_max_length','2020-05-15 08:18:39.740383'),(16,'auth','0011_update_proxy_permissions','2020-05-15 08:18:39.830175'),(17,'sessions','0001_initial','2020-05-15 08:18:39.959982'),(18,'LoginAPI','0001_initial','2020-05-15 08:21:57.014082'),(19,'AddressAPI','0001_initial','2020-05-28 02:58:13.229111'),(20,'CartAPI','0001_initial','2020-05-28 02:58:13.287054'),(21,'GoodsAPI','0001_initial','2020-05-28 02:58:13.298913'),(22,'UserInfoAPI','0001_initial','2020-05-28 02:58:13.304951');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  KEY `django_session_expire_date_a5c62663` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `goods_id` varchar(10) NOT NULL,
  `goods_name` varchar(20) DEFAULT NULL,
  `goods_type` varchar(10) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `price` float(10,2) DEFAULT '0.00',
  `warehouse_id` varchar(20) DEFAULT NULL,
  `stock` float(10,0) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL COMMENT '产地',
  `specification` varchar(255) NOT NULL COMMENT '规格',
  `packaging` varchar(255) DEFAULT NULL COMMENT '包装',
  `stockway` varchar(255) DEFAULT NULL COMMENT '储存方式',
  `weight` double NOT NULL COMMENT '重量',
  `discount` float(10,0) NOT NULL COMMENT '折扣',
  `subtitle` varchar(255) DEFAULT NULL,
  `distribution` varchar(255) DEFAULT NULL,
  `promotion` varchar(255) DEFAULT NULL,
  `tags_type` varchar(255) DEFAULT NULL,
  `tags_content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goods_id`) USING BTREE,
  UNIQUE KEY `goods_index` (`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES ('1','牛肉','肉类','g',60.00,'01',80,'上海市奉贤','一包','包','冷藏',500,1,'产于奉贤某养牛场','包邮，全程冷链运输，1.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享\r\n受此优惠','cheap','8.8折');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` varchar(32) NOT NULL,
  `customer_id` int(8) unsigned zerofill NOT NULL,
  `deliveryman_id` int(8) unsigned zerofill DEFAULT NULL,
  `create_order_time` datetime DEFAULT NULL,
  `receive_order_time` datetime DEFAULT NULL,
  `finish_order_time` datetime DEFAULT NULL,
  `order_status` varchar(10) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `address_id` int(5) unsigned zerofill NOT NULL,
  `warehouse_id` varchar(10) NOT NULL,
  `display_status` bit(1) DEFAULT b'0',
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE KEY `order_index` (`order_id`) USING BTREE,
  KEY `deliveryman_fk` (`deliveryman_id`) USING BTREE,
  KEY `address_fk` (`customer_id`,`address_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('1',00000001,00000001,'2020-03-12 14:33:44','2020-03-05 14:33:48','2020-03-14 14:33:51','1','1',00001,'10',_binary '','1');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  `goods_id` varchar(10) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`order_id`) USING BTREE,
  KEY `order_details_index` (`order_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,'1','1','1');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_time` datetime DEFAULT NULL,
  `buying_price` decimal(10,2) NOT NULL,
  `buying_number` decimal(10,2) NOT NULL,
  `purchase_status` varchar(10) DEFAULT NULL,
  `goods_id` varchar(10) NOT NULL,
  `warehouse_id` varchar(20) NOT NULL,
  `guarantee_period` tinyint(4) NOT NULL,
  PRIMARY KEY (`purchase_id`) USING BTREE,
  UNIQUE KEY `purchase_index` (`purchase_id`) USING BTREE,
  KEY `goods_fk` (`goods_id`) USING BTREE,
  KEY `warehouse_fk` (`warehouse_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,'2020-03-19 14:35:04',1.00,1.00,'1','1','1',1);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `schedule_id` int(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `schedule_start_time` datetime DEFAULT NULL,
  `schedule_finish_time` datetime DEFAULT NULL,
  `from` varchar(20) DEFAULT NULL,
  `to` varchar(20) DEFAULT NULL,
  `schedule_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`) USING BTREE,
  KEY `from_fk` (`from`) USING BTREE,
  KEY `to_fk` (`to`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (00000000000000000001,'2020-03-20 14:35:53','2020-03-11 14:35:57','10','10','1');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_detail`
--

DROP TABLE IF EXISTS `schedule_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_detail` (
  `schedule_id` int(20) unsigned zerofill NOT NULL,
  `goods_id` varchar(10) NOT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`,`goods_id`) USING BTREE,
  KEY `s_goods_fk` (`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_detail`
--

LOCK TABLES `schedule_detail` WRITE;
/*!40000 ALTER TABLE `schedule_detail` DISABLE KEYS */;
INSERT INTO `schedule_detail` VALUES (00000000000000000001,'1',1);
/*!40000 ALTER TABLE `schedule_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_cart` (
  `customer_id` int(8) unsigned zerofill NOT NULL,
  `goods_id` varchar(10) NOT NULL,
  `quantity` int(8) DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`goods_id`) USING BTREE,
  KEY `cart_goods_fk` (`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (00000001,'1',3);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `user_type` varchar(10) NOT NULL,
  `password` varchar(32) NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `head_image_id` varchar(32) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`phone`) USING BTREE,
  UNIQUE KEY `login_phone` (`phone`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (00000001,'1','199941','M','18721517889','1','Johnny','MTU5MDY0MTA0NC4wODQxNjI3OjNhNDhjOTVlNGQxN2QzYmM1NDA1M2Q0NjE3ODg1ZTZlMDM0YjAzOTA='),(00000002,'1','18721522908','M','18721522908','1','lzh','MTU5MDY0MDU4Ny44MjIzMzkzOmY4ZTI5MDFhODI0YWQ1NjFmMGQxZDZmM2Y2YTRmNmE4OWExYjFmMGM=');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `warehose_id` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `admin_id` int(8) unsigned zerofill NOT NULL,
  `warehouse_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`warehose_id`) USING BTREE,
  UNIQUE KEY `warehouse_index` (`warehose_id`) USING BTREE,
  KEY `admin_fk` (`admin_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES ('01','上海市奉贤区海思路',00000001,'鲜着呢-奉贤'),('02','上海市徐汇区',00000001,'鲜着呢-徐汇');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-28 11:50:53
