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
  `customer_id` int(8) unsigned zerofill NOT NULL,
  `address_id` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `province` varchar(255) DEFAULT NULL,
  `consignee` varchar(255) NOT NULL,
  `consignee_phone` varchar(255) NOT NULL,
  `consignee_sex` varchar(10) DEFAULT NULL,
  `house_no` varchar(255) NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `tag` varchar(10) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `township` varchar(255) DEFAULT NULL,
  `deleted` int(1) DEFAULT '0',
  PRIMARY KEY (`address_id`) USING BTREE,
  KEY `customer_id` (`customer_id`,`address_id`) USING BTREE,
  KEY `address_id` (`address_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10031 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (00000001,00001,'上海市','lzh','18721522908','M','999',30.82764,121.50648,'学校','上海市','奉贤区','海思路','海湾镇',0),(00000001,00002,'上海市','Johnny','18721517889','M','999',30.82764,121.50648,'学校','上海市','奉贤区','海思路','海湾镇',0),(00000001,00003,'上海市','shl','18817669250','M','130号',31.141382,121.421251,'学校','上海市','徐汇区','梅陇路','凌云路街道',1),(10000004,10004,'上海市','测试','18888888888','M','111号',31.141382,121.421251,'学校','上海市','徐汇区','梅陇路','凌云路街道',0),(00000004,10007,'北京市','1231','18246686562','F','48',116.397499,39.908722,'家','北京市','东城区','','',1),(00000004,10008,'北京市','草','5225258556','M','48',116.397499,39.908722,'学校','北京市','东城区','','',0),(00000001,10009,'上海市','111','18817669250','M','130号',31.141382,121.421251,'学校','上海市','徐汇区区','梅陇路','凌云路街道',1),(00000001,10010,'上海市','lzh','18817669250','M','130号',31.141382,121.421251,'学校','上海市','徐汇区区','梅陇路','凌云路街道',1),(00000001,10011,'上海市','shl','18817669250','M','130号',31.141382,121.421251,'学校','上海市','徐汇区区','梅陇路','凌云路街道',0),(00000001,10012,'上海市','Johnny','18817669250','M','112',121.437866,31.19919,'学校','上海市','徐汇区','','',0),(00000004,10013,'北京市','草啊','48121548','','125',116.416357,39.928353,'学校','北京市','东城区','','',0),(00000003,10014,'河北省','','','','',115.517862,40.415343,'','张家口市','怀来县','','',0),(00000007,10015,'上海市','A','17326712293','NULL','1号401',121.504628,30.833288,'学校','上海市','奉贤区','海','',0),(00000001,10022,'陕西省','Johnny','18721517889','M','11号楼',110.170889,36.040934,'公司','延安市','宜川县','','',0),(00000007,10023,'浙江省','σ','17326712293','NULL','466454',121.612152,29.895532,'公司','宁波市','鄞州区','','',0),(00000004,10024,'安徽省','原穴','452637518','F','152',117.4761,31.889848,'学校','合肥市','肥东县','','',1),(00000004,10025,'安徽省','袁学','18297913123','NULL','523',117.558962,31.843172,'学校','合肥市','肥东县','','',1),(00000004,10026,'安徽省','原穴','18297963452','F','12',117.4761,31.889848,'学校','合肥市','肥东县','','',0),(00000004,10027,'安徽省','袁学','18297913123','F','45',117.558962,31.843172,'学校','合肥市','肥东县','','',1),(00000004,10028,'安徽省','袁学','18297913123','F','12',117.558962,31.843172,'学校','合肥市','肥东县','','',0),(00000004,10029,'安徽省','废人','15246785','F','12',117.558962,31.843172,'学校','合肥市','肥东县','','',0),(00000002,10030,'上海市','zhen','18721522908','NULL','611',121.437866,31.19919,'学校','上海市','徐汇区','','',0);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads` (
  `id` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `product` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `activate` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (00000001,1,'00000001',NULL,'product',_binary ''),(00000002,NULL,'00000002','https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.6.76c275b2SrScxd&id=611326515771&skuId=4370850677099&user_id=1777552687&cat_id=2&is_b=1&rn=5f158987a20dcd76e7c4619a7f6c20b6','url',_binary ''),(00000003,2,'00000003',NULL,'product',_binary '\0'),(00000004,3,'00000004',NULL,'product',_binary ''),(00000005,4,'00000005',NULL,'product',_binary ''),(00000006,5,'00000006',NULL,'product',_binary '');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
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
  `date_joined` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$nq2Oak4CQppj$z4HNfoJ2plXWw9ql5Q0EbLFZrzhqow0FOwgpfvgPVWk=','2020-06-20 07:33:14.063195',1,'shl','','','sshhhll@sina.com',1,1,'2020-06-20 07:30:10.456368'),(2,'pbkdf2_sha256$150000$6q0YVuSMtcws$CRcSBMzMfQnfv5S4sqg7cyInVcByIDJ8WX5sXujXO2c=','2020-06-20 07:32:48.129428',1,'1','','','',1,1,'2020-06-20 07:32:00.000000'),(3,'pbkdf2_sha256$150000$VZ6XEf3M7eMa$B5Ms678cKo8iLiO6sDmow79H0jMbYCG4qwdSmknT43I=',NULL,1,'2','','','',1,1,'2020-06-20 07:33:00.000000'),(4,'pbkdf2_sha256$150000$nO0R3GPAeXlE$4rL0vZcKp2JSFes8iSDGIVynL2rU80fZwNuEg/Zxl8U=',NULL,1,'3','','','',1,1,'2020-06-20 07:33:00.000000'),(5,'pbkdf2_sha256$150000$VwP88rrshynG$OCkFJMWH/T2cObHFnLtRAu5N/rn/1fqdHAQSYt9y2XA=','2020-06-21 08:38:33.167893',1,'4','','','',1,1,'2020-06-20 07:34:00.000000'),(6,'pbkdf2_sha256$150000$FWBuUTO9ud1w$+P10X9jQfSS9TMdyuQVb25c7HduXMImTibJD5SDBmls=',NULL,1,'5','','','',1,1,'2020-06-20 07:34:00.000000');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryman`
--

LOCK TABLES `deliveryman` WRITE;
/*!40000 ALTER TABLE `deliveryman` DISABLE KEYS */;
INSERT INTO `deliveryman` VALUES (00000001,'01','1'),(00000002,'01','1'),(00000003,'01','1'),(00000004,'02','1'),(00000005,'02','1');
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
  `action_time` datetime(6) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-06-20 07:32:00.625124','2','1',1,'[{\"added\": {}}]',4,1),(2,'2020-06-20 07:32:23.531417','2','1',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]',4,1),(3,'2020-06-20 07:33:35.255064','3','2',1,'[{\"added\": {}}]',4,1),(4,'2020-06-20 07:33:42.948478','3','2',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]',4,1),(5,'2020-06-20 07:33:58.669391','4','3',1,'[{\"added\": {}}]',4,1),(6,'2020-06-20 07:34:04.315791','4','3',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]',4,1),(7,'2020-06-20 07:34:16.932395','5','4',1,'[{\"added\": {}}]',4,1),(8,'2020-06-20 07:34:23.718324','5','4',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]',4,1),(9,'2020-06-20 07:34:37.284479','6','5',1,'[{\"added\": {}}]',4,1),(10,'2020-06-20 07:34:42.037756','6','5',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]',4,1),(11,'2020-06-21 08:38:48.845854','40','Order object (40)',3,'',12,5),(12,'2020-06-21 08:38:48.850050','39','Order object (39)',3,'',12,5),(13,'2020-06-21 08:38:48.853960','38','Order object (38)',3,'',12,5),(14,'2020-06-21 08:38:48.858327','37','Order object (37)',3,'',12,5),(15,'2020-06-21 08:38:48.865149','36','Order object (36)',3,'',12,5),(16,'2020-06-21 08:38:48.868412','35','Order object (35)',3,'',12,5),(17,'2020-06-21 08:38:48.872435','34','Order object (34)',3,'',12,5),(18,'2020-06-21 08:39:00.336282','33','Order object (33)',3,'',12,5),(19,'2020-06-21 08:39:00.350131','32','Order object (32)',3,'',12,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'AddressAPI','address'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'CartAPI','shoppingcart'),(5,'contenttypes','contenttype'),(12,'Fresh_market_online','order'),(9,'GoodsAPI','goods'),(7,'LoginAPI','user'),(6,'sessions','session'),(8,'UserInfoAPI','user');
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
  `applied` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-05-15 08:18:31.504376'),(2,'auth','0001_initial','2020-05-15 08:18:32.388127'),(3,'admin','0001_initial','2020-05-15 08:18:35.730317'),(4,'admin','0002_logentry_remove_auto_add','2020-05-15 08:18:36.293381'),(5,'admin','0003_logentry_add_action_flag_choices','2020-05-15 08:18:36.312900'),(6,'contenttypes','0002_remove_content_type_name','2020-05-15 08:18:37.053844'),(7,'auth','0002_alter_permission_name_max_length','2020-05-15 08:18:37.413014'),(8,'auth','0003_alter_user_email_max_length','2020-05-15 08:18:37.781939'),(9,'auth','0004_alter_user_username_opts','2020-05-15 08:18:37.829765'),(10,'auth','0005_alter_user_last_login_null','2020-05-15 08:18:38.113881'),(11,'auth','0006_require_contenttypes_0002','2020-05-15 08:18:38.131453'),(12,'auth','0007_alter_validators_add_error_messages','2020-05-15 08:18:38.161703'),(13,'auth','0008_alter_user_username_max_length','2020-05-15 08:18:38.517947'),(14,'auth','0009_alter_user_last_name_max_length','2020-05-15 08:18:39.238722'),(15,'auth','0010_alter_group_name_max_length','2020-05-15 08:18:39.740383'),(16,'auth','0011_update_proxy_permissions','2020-05-15 08:18:39.830175'),(17,'sessions','0001_initial','2020-05-15 08:18:39.959982'),(18,'LoginAPI','0001_initial','2020-05-15 08:21:57.014082'),(19,'AddressAPI','0001_initial','2020-05-28 02:58:13.229111'),(20,'CartAPI','0001_initial','2020-05-28 02:58:13.287054'),(21,'GoodsAPI','0001_initial','2020-05-28 02:58:13.298913'),(22,'UserInfoAPI','0001_initial','2020-05-28 02:58:13.304951'),(23,'AddressAPI','0002_delete_address','2020-05-28 08:01:19.088105'),(24,'CartAPI','0002_delete_shoppingcart','2020-05-28 08:01:19.127132'),(25,'GoodsAPI','0002_delete_goods','2020-05-28 08:01:19.149274'),(26,'LoginAPI','0002_delete_user','2020-05-28 08:01:19.176953'),(27,'UserInfoAPI','0002_delete_user','2020-05-28 08:01:19.190066');
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
  `expire_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  KEY `django_session_expire_date_a5c62663` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('en3evo6cwcod97ujxwt8t0qus3ingy7k','MzU2ZTNmZGExZWFlNzVlNzA5NDliM2Q2NjZhZjBlYjBlMGU3MjI4Njp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjhiZWUwYjc5MzFlOTI4MTUzM2I0MGE3NDhmNmQyOTMzNWQyOGIwIn0=','2020-07-05 08:38:33.173221');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `goods_id` int(10) NOT NULL AUTO_INCREMENT,
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
  `discount` float(10,2) NOT NULL COMMENT '折扣',
  `subtitle` varchar(255) DEFAULT NULL,
  `distribution` varchar(255) DEFAULT NULL,
  `promotion` varchar(255) DEFAULT NULL,
  `tags_type` varchar(255) DEFAULT NULL,
  `tags_content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goods_id`) USING BTREE,
  UNIQUE KEY `goods_index` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'奉贤鲜嫩多汁小牛肉','肉禽蛋品','g',60.00,'01',90,'上海市奉贤区','一包','包','冷藏',500,1.00,'产于奉贤某养牛场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#BF197D','热卖'),(2,'奉贤新鲜美味羊肉','肉禽蛋品','g',56.00,'01',95,'上海市奉贤','一包','包','冷藏',500,1.00,'产于奉贤某养羊场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#BF197D','热卖'),(3,'奉贤香甜翠绿大葱','水果蔬菜','g',3.00,'01',55,'上海市奉贤区','一包','包','冷藏',500,1.00,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#BF197D','热卖'),(4,'奉贤有品有质好猪肉','肉禽蛋品','g',48.00,'01',95,'上海市奉贤区','一包','包','冷藏',500,0.50,'产于奉贤某养猪场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#5D2781','史前最低'),(5,'奉贤唇齿留香鸡翅根','肉禽蛋品','g',18.00,'01',80,'上海市奉贤区','一包','包','冷藏',500,0.50,'产于奉贤某养鸡场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#5D2781','史前最低'),(6,'奉贤美味可口鸡翅中','肉禽蛋品','g',22.00,'01',95,'上海市奉贤区','一包','包','冷藏',500,0.50,'产于奉贤某养鸡场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#5D2781','史前最低'),(7,'奉贤多汁美味小鸡腿','肉禽蛋品','g',20.00,'01',95,'上海市奉贤区','一包','包','冷藏',500,1.00,'产于奉贤某养鸡场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#BF197D','热卖'),(8,'奉贤减肥必备鸡胸肉','肉禽蛋品','g',28.00,'01',80,'上海市奉贤区','一包','包','冷藏',500,0.88,'产于奉贤某养鸡场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#BF197D','热卖'),(9,'奉贤好吃多汁大鸭腿','肉禽蛋品','g',15.00,'01',80,'上海市奉贤区','一包','包','冷藏',500,0.88,'产于奉贤某养鸭场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#BF197D','热卖'),(10,'奉贤美味鸭胗','肉禽蛋品','g',34.00,'01',95,'上海市奉贤区','一包','包','冷藏',500,1.00,'产于奉贤某养鸭场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#BF197D','热卖'),(11,'奉贤新鲜鸭血','肉禽蛋品','g',8.50,'01',80,'上海市奉贤区','一包','包','冷藏',500,0.88,'产于奉贤某养鸭场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#BF197D','热卖'),(12,'奉贤妙不可言鸭肉','肉禽蛋品','g',26.00,'01',90,'上海市奉贤区','一包','包','冷藏',500,1.00,'产于奉贤某养鸭场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#BF197D','热卖'),(13,'奉贤弹滑爽口鹌鹑蛋','肉禽蛋品','g',8.50,'01',90,'上海市奉贤区','一箱','箱','冷藏',500,1.00,'产于奉贤某鹌鹑养殖场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#BF197D','热卖'),(14,'奉贤无添加健康土鸡蛋','肉禽蛋品','g',19.00,'01',95,'上海市奉贤区','一箱','箱','冷藏',500,1.00,'产于奉贤某养鸡场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#BF197D','热卖'),(15,'奉贤清香脆爽生菜','水果蔬菜','g',7.20,'01',90,'上海市奉贤区','一包','包','冷藏',500,0.50,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#5D2781','史前最低'),(16,'奉贤新鲜四季豆','水果蔬菜','g',12.00,'01',90,'上海市奉贤区','一包','包','冷藏',500,0.50,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#5D2781','史前最低'),(17,'奉贤翠绿可口荷兰豆','水果蔬菜','g',15.00,'01',95,'上海市奉贤区','一包','包','冷藏',500,0.50,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#5D2781','史前最低'),(18,'奉贤清新脆嫩芸豆','水果蔬菜','g',12.80,'01',90,'上海市奉贤区','一包','包','冷藏',500,0.50,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#5D2781','史前最低'),(19,'奉贤鲜嫩可口鸡毛菜','水果蔬菜','g',6.40,'01',95,'上海市奉贤区','一包','包','冷藏',500,1.00,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#BF197D','热卖'),(20,'奉贤新鲜清香菠菜','水果蔬菜','g',10.50,'01',90,'上海市奉贤区','一包','包','冷藏',500,0.88,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#BF197D','热卖'),(21,'奉贤清新爽口空心菜','水果蔬菜','g',12.80,'01',90,'上海市奉贤区','一包','包','冷藏',500,0.88,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#BF197D','热卖'),(22,'奉贤清爽脆滑油麦菜','水果蔬菜','g',7.50,'01',90,'上海市奉贤区','一包','包','冷藏',500,1.00,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF0000','爆款'),(23,'奉贤清新杭白菜','水果蔬菜','g',5.80,'01',95,'上海市奉贤区','一包','包','冷藏',500,1.00,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF0000','爆款'),(24,'奉贤新鲜健康上海青','水果蔬菜','g',3.20,'01',90,'上海市奉贤区','一包','包','冷藏',500,0.88,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF0000','爆款'),(25,'奉贤好吃好看彩椒','水果蔬菜','g',10.00,'01',80,'上海市奉贤区','一包','包','冷藏',500,1.00,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF0000','爆款'),(26,'奉贤香辣提鲜小米椒','水果蔬菜','g',19.50,'01',80,'上海市奉贤区','一包','包','冷藏',500,0.88,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF0000','爆款'),(27,'奉贤脆爽微辣青椒','水果蔬菜','g',7.50,'01',85,'上海市奉贤区','一包','包','冷藏',500,0.88,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF0000','爆款'),(28,'奉贤圆润饱满大米','米面粮油','g',6.80,'01',90,'上海市奉贤区','一包','包','冷藏',500,0.88,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF0000','爆款'),(29,'奉贤皮薄肉厚红豆','米面粮油','g',12.80,'01',90,'上海市奉贤区','一包','包','冷藏',500,1.00,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF0000','爆款'),(30,'奉贤粒粒饱满黄豆','米面粮油','g',18.00,'01',90,'上海市奉贤区','一包','包','冷藏',500,0.90,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(31,'奉贤清热解暑绿豆','米面粮油','g',12.50,'01',95,'上海市奉贤区','一包','包','冷藏',500,0.90,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(32,'奉贤鲜嫩可口上海青','水果蔬菜','g',3.20,'01',100,'上海市奉贤区','一包','包','冷藏',500,0.90,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(33,'奉贤新鲜直采彩椒','水果蔬菜','g',10.00,'01',80,'上海市奉贤区','一包','包','冷藏',500,0.90,'产于奉贤某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(34,'奉贤质嫩爽口牛肉粒','肉禽蛋品','g',60.00,'01',90,'上海市奉贤区','一包','包','冷藏',500,0.90,'产于奉贤某养牛场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(35,'奉贤肉质鲜嫩小羊排','肉禽蛋品','g',56.00,'01',95,'上海市奉贤区','一包','包','冷藏',500,0.90,'产于奉贤某养羊场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(36,'奉贤冷鲜精选猪肉','肉禽蛋品','g',48.00,'01',95,'上海市奉贤区','一包','包','冷藏',500,0.90,'产于奉贤某养猪场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(37,'奉贤美味不腻鸡翅根','肉禽蛋品','g',18.00,'01',80,'上海市奉贤区','一包','包','冷藏',500,0.90,'产于奉贤某养鸡场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(38,'奉贤肉嫩味鲜鸡翅中','肉禽蛋品','g',22.00,'01',95,'上海市奉贤区','一包','包','冷藏',500,0.90,'产于奉贤某养鸡场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(39,'奉贤肉香浓郁大鸡腿','肉禽蛋品','g',20.00,'01',95,'上海市奉贤区','一包','包','冷藏',500,0.90,'产于奉贤某养鸡场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','',''),(40,'奉贤鲜嫩香醇鸡胸肉','肉禽蛋品','g',28.00,'01',80,'上海市奉贤区','一包','包','冷藏',500,0.90,'产于奉贤某养鸡场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','',''),(41,'松江饱满晶莹长香米','米面粮油','g',6.80,'01',90,'上海市松江区','一包','包','冷藏',500,0.90,'产于松江某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','',''),(42,'松江软嫩清香上海青','水果蔬菜','g',3.20,'01',100,'上海市松江区','一包','包','冷藏',500,0.90,'产于松江某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','',''),(43,'松江肉质鲜嫩大鸡腿','肉禽蛋品','g',20.00,'01',95,'上海市松江区','一包','包','冷藏',500,0.90,'产于松江某养鸡场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','',''),(44,'松江营养丰富鹌鹑蛋','肉禽蛋品','g',8.50,'01',90,'上海市松江区','一箱','箱','冷藏',500,0.90,'产于松江某鹌鹑养殖场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(45,'松江美味新鲜小羊排','肉禽蛋品','g',56.00,'01',95,'上海市松江区','一包','包','冷藏',500,0.90,'产于松江某养羊场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(46,'浦东清香饱满五常米','米面粮油','g',6.80,'01',90,'上海市浦东新区','一包','包','冷藏',500,0.90,'产于浦东某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(47,'浦东新鲜可口上海青','水果蔬菜','g',3.20,'01',100,'上海市浦东新区','一包','包','冷藏',500,0.90,'产于浦东某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(48,'浦东鲜嫩多汁大鸡腿','肉禽蛋品','g',20.00,'01',95,'上海市浦东新区','一包','包','冷藏',500,0.90,'产于浦东某养鸡场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(49,'浦东新鲜营养鹌鹑蛋','肉禽蛋品','g',8.50,'01',90,'上海市浦东新区','一箱','箱','冷藏',500,0.90,'产于浦东某鹌鹑养殖场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(50,'浦东火锅必备羊肉卷','肉禽蛋品','g',56.00,'01',95,'上海市浦东新区','一包','包','冷藏',500,0.90,'产于浦东某养羊场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(51,'青浦晶莹饱满大米','米面粮油','g',6.80,'01',90,'上海市青浦区','一包','包','冷藏',500,0.90,'产于青浦某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(52,'青浦翠绿可口上海青','水果蔬菜','g',3.20,'01',100,'上海市青浦区','一包','包','冷藏',500,0.90,'产于青浦某农场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(53,'青浦肉质鲜嫩大鸡腿','肉禽蛋品','g',20.00,'01',95,'上海市青浦区','一包','包','冷藏',500,0.90,'产于青浦某养鸡场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(54,'青浦营养丰富鹌鹑蛋','肉禽蛋品','g',8.50,'01',90,'上海市青浦区','一箱','箱','冷藏',500,0.90,'产于青浦某鹌鹑养殖场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(55,'青浦优质新鲜羊排','肉禽蛋品','g',56.00,'01',95,'上海市青浦区','一包','包','冷藏',500,0.90,'产于青浦某养羊场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(56,'宁波精挑鲜活基围虾','水产海鲜','g',40.00,'01',40,'上海市奉贤区','一份','包','冷冻',500,0.90,'产于宁波某水产养殖场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐'),(57,'奉贤均衡营养鲜牛奶','鲜奶乳品','g',10.00,'01',80,'上海市奉贤区','一瓶','瓶','冷藏',500,0.90,'产于奉贤某养牛场','包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。','端午节期间专享产品，每人每天购买不超过一件，享受此优惠','#FF4900','推荐');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=525 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (0000000001,1,'牛肉','2020-06-01 15:45:45'),(0000000002,2,'肉','2020-06-16 03:56:47'),(0000000003,2,'肉','2020-06-16 03:56:58'),(0000000004,2,'牛肉','2020-06-16 03:57:32'),(0000000005,2,'牛肉','2020-06-16 03:58:16'),(0000000006,2,'牛肉','2020-06-16 03:59:03'),(0000000007,2,'牛肉','2020-06-16 04:00:58'),(0000000008,2,'牛肉','2020-06-16 04:01:06'),(0000000009,2,'牛肉','2020-06-16 04:01:46'),(0000000010,2,'牛肉','2020-06-16 04:02:35'),(0000000011,2,'牛肉','2020-06-16 04:03:50'),(0000000012,2,'牛肉','2020-06-16 06:32:34'),(0000000013,3,'','2020-06-16 12:12:02'),(0000000014,3,'','2020-06-16 12:20:11'),(0000000015,3,'','2020-06-16 12:21:07'),(0000000016,3,'','2020-06-16 12:21:57'),(0000000017,3,'','2020-06-16 12:22:31'),(0000000018,3,'','2020-06-16 12:39:11'),(0000000019,3,'','2020-06-16 12:39:50'),(0000000020,3,'肉','2020-06-16 12:42:38'),(0000000021,3,'肉','2020-06-16 12:43:27'),(0000000022,3,'肉','2020-06-16 12:44:18'),(0000000023,3,'肉','2020-06-16 12:44:24'),(0000000024,3,'肉','2020-06-16 12:48:53'),(0000000025,3,'','2020-06-16 12:49:40'),(0000000026,3,'','2020-06-16 13:03:01'),(0000000027,3,'','2020-06-16 13:04:24'),(0000000028,3,'','2020-06-16 13:05:48'),(0000000029,3,'','2020-06-16 13:06:12'),(0000000030,3,'','2020-06-16 13:21:57'),(0000000031,3,'','2020-06-16 13:30:38'),(0000000032,3,'','2020-06-16 13:32:34'),(0000000033,3,'','2020-06-16 13:32:45'),(0000000034,3,'','2020-06-16 13:33:08'),(0000000035,3,'','2020-06-16 13:37:36'),(0000000036,3,'','2020-06-16 14:01:53'),(0000000037,3,'','2020-06-16 14:01:55'),(0000000038,3,'','2020-06-16 14:01:57'),(0000000039,3,'','2020-06-16 14:01:57'),(0000000040,3,'','2020-06-16 14:01:59'),(0000000041,3,'','2020-06-16 14:02:31'),(0000000042,3,'','2020-06-16 14:05:21'),(0000000043,3,'','2020-06-16 14:05:23'),(0000000044,3,'','2020-06-16 14:13:43'),(0000000045,3,'','2020-06-16 14:13:45'),(0000000046,3,'','2020-06-16 14:13:52'),(0000000047,3,'','2020-06-16 14:13:54'),(0000000048,3,'','2020-06-16 14:17:59'),(0000000049,3,'','2020-06-16 14:21:14'),(0000000050,3,'','2020-06-16 14:22:23'),(0000000051,3,'','2020-06-16 14:22:33'),(0000000052,3,'','2020-06-16 14:30:03'),(0000000053,3,'','2020-06-16 14:30:07'),(0000000054,3,'','2020-06-16 14:30:07'),(0000000055,3,'','2020-06-16 14:30:10'),(0000000056,3,'','2020-06-16 14:30:10'),(0000000057,3,'','2020-06-16 14:32:07'),(0000000058,3,'','2020-06-16 14:32:09'),(0000000059,3,'','2020-06-16 14:32:10'),(0000000060,3,'','2020-06-16 14:32:12'),(0000000061,3,'','2020-06-16 14:32:15'),(0000000062,3,'','2020-06-16 14:32:17'),(0000000063,3,'','2020-06-16 14:32:20'),(0000000064,3,'','2020-06-16 14:32:23'),(0000000065,3,'','2020-06-16 14:32:47'),(0000000066,3,'','2020-06-16 14:32:49'),(0000000067,3,'','2020-06-16 14:32:51'),(0000000068,3,'','2020-06-16 14:32:52'),(0000000069,3,'','2020-06-16 14:32:53'),(0000000070,3,'','2020-06-16 14:32:56'),(0000000071,3,'','2020-06-16 14:32:58'),(0000000072,3,'','2020-06-16 14:32:59'),(0000000073,3,'','2020-06-16 14:33:00'),(0000000074,3,'','2020-06-16 14:33:03'),(0000000075,3,'','2020-06-16 14:33:06'),(0000000076,3,'','2020-06-16 14:33:09'),(0000000077,3,'','2020-06-16 14:33:09'),(0000000078,3,'','2020-06-16 14:33:22'),(0000000079,3,'','2020-06-16 14:33:23'),(0000000080,3,'','2020-06-16 14:33:27'),(0000000081,3,'','2020-06-16 14:33:27'),(0000000082,3,'','2020-06-16 14:33:33'),(0000000083,3,'','2020-06-16 14:33:38'),(0000000084,3,'','2020-06-16 14:33:47'),(0000000085,3,'','2020-06-16 14:34:42'),(0000000086,3,'','2020-06-16 14:35:44'),(0000000087,3,'','2020-06-16 14:35:50'),(0000000088,3,'','2020-06-16 14:35:58'),(0000000089,3,'','2020-06-16 14:36:16'),(0000000090,3,'','2020-06-16 14:36:19'),(0000000091,3,'','2020-06-16 14:36:19'),(0000000092,3,'','2020-06-16 14:36:23'),(0000000093,3,'','2020-06-16 14:36:26'),(0000000094,3,'','2020-06-16 14:36:27'),(0000000095,3,'','2020-06-16 14:36:29'),(0000000096,3,'','2020-06-16 14:38:07'),(0000000097,3,'','2020-06-16 14:38:10'),(0000000098,3,'','2020-06-16 14:38:10'),(0000000099,3,'','2020-06-16 14:38:36'),(0000000100,3,'','2020-06-16 14:38:38'),(0000000101,3,'','2020-06-16 14:38:43'),(0000000102,3,'','2020-06-16 14:38:45'),(0000000103,3,'','2020-06-16 14:38:48'),(0000000104,3,'','2020-06-16 14:38:50'),(0000000105,3,'','2020-06-16 14:38:54'),(0000000106,3,'','2020-06-16 14:39:13'),(0000000107,3,'','2020-06-16 14:39:15'),(0000000108,3,'','2020-06-16 14:39:18'),(0000000109,3,'','2020-06-16 14:39:51'),(0000000110,3,'','2020-06-16 14:40:04'),(0000000111,3,'','2020-06-16 14:40:04'),(0000000112,3,'','2020-06-16 14:43:27'),(0000000113,3,'','2020-06-16 14:43:29'),(0000000114,3,'','2020-06-16 14:43:33'),(0000000115,3,'','2020-06-16 14:43:36'),(0000000116,3,'','2020-06-16 14:43:38'),(0000000117,3,'','2020-06-16 14:43:43'),(0000000118,3,'','2020-06-16 14:43:52'),(0000000119,3,'','2020-06-16 14:43:56'),(0000000120,3,'','2020-06-16 14:43:57'),(0000000121,3,'','2020-06-16 14:44:15'),(0000000122,3,'','2020-06-16 14:44:18'),(0000000123,3,'','2020-06-16 14:44:25'),(0000000124,3,'','2020-06-16 14:58:19'),(0000000125,3,'','2020-06-16 14:58:30'),(0000000126,3,'','2020-06-16 14:58:40'),(0000000127,3,'','2020-06-16 14:58:43'),(0000000128,3,'','2020-06-16 15:06:56'),(0000000129,3,'','2020-06-16 15:07:00'),(0000000130,3,'','2020-06-16 15:07:05'),(0000000131,3,'','2020-06-16 15:07:05'),(0000000132,3,'','2020-06-16 15:07:10'),(0000000133,3,'','2020-06-16 15:07:11'),(0000000134,3,'','2020-06-16 15:07:13'),(0000000135,3,'','2020-06-16 15:07:14'),(0000000136,3,'','2020-06-16 15:07:16'),(0000000137,3,'','2020-06-16 15:07:20'),(0000000138,3,'','2020-06-16 15:07:20'),(0000000139,3,'','2020-06-16 15:07:22'),(0000000140,3,'','2020-06-16 15:07:23'),(0000000141,3,'','2020-06-16 15:07:35'),(0000000142,3,'','2020-06-16 15:07:39'),(0000000143,3,'','2020-06-16 15:07:41'),(0000000144,3,'','2020-06-16 15:07:42'),(0000000145,3,'','2020-06-16 15:07:57'),(0000000146,3,'','2020-06-16 15:07:57'),(0000000147,3,'','2020-06-16 15:29:44'),(0000000148,3,'','2020-06-16 15:29:46'),(0000000149,3,'','2020-06-16 15:29:50'),(0000000150,3,'','2020-06-16 15:29:52'),(0000000151,3,'','2020-06-16 15:29:53'),(0000000152,3,'','2020-06-16 15:30:07'),(0000000153,3,'','2020-06-16 15:30:09'),(0000000154,3,'','2020-06-16 15:30:13'),(0000000155,3,'','2020-06-16 15:30:14'),(0000000156,3,'','2020-06-16 15:31:01'),(0000000157,3,'','2020-06-16 15:31:03'),(0000000158,3,'','2020-06-16 15:31:23'),(0000000159,3,'','2020-06-16 15:31:33'),(0000000160,3,'','2020-06-16 15:32:02'),(0000000161,3,'','2020-06-16 15:32:03'),(0000000162,3,'','2020-06-16 15:32:13'),(0000000163,3,'','2020-06-16 15:32:14'),(0000000164,3,'','2020-06-16 15:32:14'),(0000000165,3,'','2020-06-16 15:35:56'),(0000000166,3,'','2020-06-16 15:35:57'),(0000000167,3,'','2020-06-16 15:35:59'),(0000000168,3,'','2020-06-16 15:36:00'),(0000000169,3,'','2020-06-16 15:36:28'),(0000000170,3,'','2020-06-16 15:36:30'),(0000000171,3,'','2020-06-16 15:36:30'),(0000000172,3,'','2020-06-16 15:36:41'),(0000000173,3,'','2020-06-16 15:36:43'),(0000000174,3,'','2020-06-16 15:36:45'),(0000000175,3,'','2020-06-16 15:36:48'),(0000000176,3,'','2020-06-16 15:36:50'),(0000000177,3,'','2020-06-16 15:36:56'),(0000000178,3,'','2020-06-16 15:36:59'),(0000000179,3,'','2020-06-16 15:37:01'),(0000000180,3,'','2020-06-16 15:37:03'),(0000000181,3,'','2020-06-16 15:37:04'),(0000000182,3,'','2020-06-16 15:37:45'),(0000000183,3,'','2020-06-16 15:37:47'),(0000000184,3,'','2020-06-16 15:37:49'),(0000000185,3,'','2020-06-16 15:37:49'),(0000000186,3,'','2020-06-16 15:39:43'),(0000000187,3,'','2020-06-16 15:42:41'),(0000000188,3,'','2020-06-16 15:43:06'),(0000000189,3,'','2020-06-16 15:43:09'),(0000000190,3,'','2020-06-16 15:44:01'),(0000000191,3,'','2020-06-16 15:44:02'),(0000000192,3,'','2020-06-16 15:44:18'),(0000000193,3,'','2020-06-16 15:46:55'),(0000000194,3,'','2020-06-16 15:46:57'),(0000000195,3,'','2020-06-16 15:47:00'),(0000000196,3,'','2020-06-16 15:47:03'),(0000000197,3,'','2020-06-16 15:47:05'),(0000000198,3,'','2020-06-16 15:47:09'),(0000000199,3,'','2020-06-16 15:47:11'),(0000000200,3,'','2020-06-16 15:47:14'),(0000000201,3,'','2020-06-16 15:47:48'),(0000000202,3,'','2020-06-16 15:47:51'),(0000000203,3,'','2020-06-16 15:47:53'),(0000000204,3,'','2020-06-16 15:47:56'),(0000000205,3,'','2020-06-16 15:47:57'),(0000000206,3,'','2020-06-16 15:48:17'),(0000000207,3,'','2020-06-16 15:48:19'),(0000000208,3,'','2020-06-16 15:48:20'),(0000000209,3,'','2020-06-16 15:48:32'),(0000000210,3,'','2020-06-16 15:48:34'),(0000000211,3,'','2020-06-16 15:48:35'),(0000000212,4,'','2020-06-16 15:51:02'),(0000000213,4,'','2020-06-16 15:51:13'),(0000000214,4,'','2020-06-16 15:51:25'),(0000000215,4,'','2020-06-16 15:51:38'),(0000000216,3,'','2020-06-16 15:51:44'),(0000000217,3,'','2020-06-16 15:51:44'),(0000000218,3,'','2020-06-16 15:51:48'),(0000000219,3,'','2020-06-16 15:51:48'),(0000000220,3,'','2020-06-16 15:52:42'),(0000000221,3,'','2020-06-16 15:54:06'),(0000000222,3,'','2020-06-16 15:54:09'),(0000000223,3,'','2020-06-16 15:55:06'),(0000000224,3,'','2020-06-16 15:55:12'),(0000000225,3,'','2020-06-16 15:55:14'),(0000000226,3,'','2020-06-16 15:55:14'),(0000000227,4,'','2020-06-16 16:03:29'),(0000000228,4,'','2020-06-16 16:04:16'),(0000000229,3,'','2020-06-16 16:13:31'),(0000000230,3,'','2020-06-16 16:16:55'),(0000000231,4,'','2020-06-16 16:17:47'),(0000000232,3,'牛','2020-06-16 16:18:12'),(0000000233,3,'牛','2020-06-16 16:18:19'),(0000000234,3,'牛','2020-06-16 16:18:22'),(0000000235,3,'牛','2020-06-16 16:19:33'),(0000000236,3,'牛','2020-06-16 16:21:26'),(0000000237,3,'牛','2020-06-16 16:21:36'),(0000000238,3,'牛','2020-06-16 16:21:37'),(0000000239,3,'牛','2020-06-16 16:21:38'),(0000000240,3,'牛','2020-06-16 16:22:01'),(0000000241,3,'牛','2020-06-16 16:22:36'),(0000000242,3,'牛','2020-06-16 16:25:23'),(0000000243,3,'牛','2020-06-16 16:25:30'),(0000000244,3,'牛','2020-06-16 16:25:37'),(0000000245,3,'牛','2020-06-16 16:27:52'),(0000000246,3,'牛','2020-06-16 16:30:50'),(0000000247,3,'牛','2020-06-16 16:30:54'),(0000000248,3,'牛','2020-06-16 16:31:00'),(0000000249,3,'牛','2020-06-16 16:31:32'),(0000000250,3,'牛','2020-06-16 16:31:37'),(0000000251,3,'牛','2020-06-16 16:31:41'),(0000000252,3,'奶','2020-06-16 16:32:02'),(0000000253,3,'牛','2020-06-16 16:33:22'),(0000000254,3,'','2020-06-16 16:34:02'),(0000000255,3,'','2020-06-16 16:34:05'),(0000000256,3,'','2020-06-16 16:34:10'),(0000000257,3,'','2020-06-16 16:34:46'),(0000000258,3,'','2020-06-16 16:34:48'),(0000000259,3,'','2020-06-16 16:34:51'),(0000000260,3,'','2020-06-16 16:34:54'),(0000000261,3,'','2020-06-16 16:35:16'),(0000000262,3,'','2020-06-16 16:35:17'),(0000000263,3,'','2020-06-16 16:35:19'),(0000000264,3,'','2020-06-16 16:35:52'),(0000000265,3,'','2020-06-16 16:35:56'),(0000000266,3,'','2020-06-16 16:35:59'),(0000000267,3,'','2020-06-16 16:36:01'),(0000000268,3,'','2020-06-16 16:36:05'),(0000000269,3,'','2020-06-16 16:36:07'),(0000000270,3,'','2020-06-16 16:36:10'),(0000000271,3,'','2020-06-16 16:36:12'),(0000000272,3,'','2020-06-16 16:36:18'),(0000000273,3,'','2020-06-16 16:36:21'),(0000000274,4,'','2020-06-16 16:39:35'),(0000000275,4,'','2020-06-16 16:39:59'),(0000000276,4,'','2020-06-16 16:40:03'),(0000000277,4,'','2020-06-16 16:40:07'),(0000000278,4,'','2020-06-16 16:40:10'),(0000000279,4,'','2020-06-16 16:40:20'),(0000000280,4,'','2020-06-16 16:40:22'),(0000000281,4,'','2020-06-16 16:40:25'),(0000000282,4,'','2020-06-16 16:40:30'),(0000000283,4,'','2020-06-16 16:40:32'),(0000000284,4,'','2020-06-16 16:40:37'),(0000000285,4,'','2020-06-16 16:41:29'),(0000000286,4,'','2020-06-16 16:44:21'),(0000000287,4,'','2020-06-16 16:44:24'),(0000000288,4,'','2020-06-16 16:45:02'),(0000000289,4,'','2020-06-16 16:45:08'),(0000000290,4,'','2020-06-16 16:45:10'),(0000000291,4,'','2020-06-16 16:46:57'),(0000000292,4,'','2020-06-16 16:47:10'),(0000000293,4,'','2020-06-16 16:47:13'),(0000000294,4,'','2020-06-16 16:47:13'),(0000000295,4,'','2020-06-16 16:47:16'),(0000000296,4,'','2020-06-16 16:47:19'),(0000000297,4,'','2020-06-16 16:47:19'),(0000000298,4,'','2020-06-16 16:47:21'),(0000000299,4,'','2020-06-16 16:47:36'),(0000000300,4,'','2020-06-16 16:47:39'),(0000000301,4,'','2020-06-16 16:47:39'),(0000000302,4,'','2020-06-16 16:47:41'),(0000000303,4,'','2020-06-16 16:47:41'),(0000000304,4,'','2020-06-16 16:47:46'),(0000000305,4,'','2020-06-16 16:47:50'),(0000000306,4,'','2020-06-16 16:48:15'),(0000000307,4,'','2020-06-16 16:48:18'),(0000000308,4,'','2020-06-16 16:48:22'),(0000000309,4,'','2020-06-16 16:48:40'),(0000000310,4,'','2020-06-16 16:48:43'),(0000000311,4,'','2020-06-16 16:48:46'),(0000000312,4,'','2020-06-16 16:48:49'),(0000000313,4,'','2020-06-16 16:48:50'),(0000000314,4,'','2020-06-16 16:48:55'),(0000000315,4,'','2020-06-16 16:51:54'),(0000000316,4,'','2020-06-16 16:51:57'),(0000000317,4,'','2020-06-16 16:52:00'),(0000000318,4,'','2020-06-16 16:52:00'),(0000000319,4,'','2020-06-16 16:52:02'),(0000000320,4,'','2020-06-16 16:52:04'),(0000000321,4,'','2020-06-16 16:52:10'),(0000000322,4,'','2020-06-16 16:52:11'),(0000000323,4,'','2020-06-16 16:52:13'),(0000000324,4,'','2020-06-16 16:52:17'),(0000000325,4,'','2020-06-16 16:52:20'),(0000000326,4,'','2020-06-16 16:52:22'),(0000000327,4,'','2020-06-16 16:52:25'),(0000000328,3,'','2020-06-16 16:57:05'),(0000000329,3,'','2020-06-16 16:57:09'),(0000000330,4,'','2020-06-16 16:57:11'),(0000000331,4,'','2020-06-16 16:57:24'),(0000000332,4,'','2020-06-16 16:57:31'),(0000000333,4,'','2020-06-16 16:57:36'),(0000000334,4,'','2020-06-16 16:57:38'),(0000000335,4,'','2020-06-16 16:57:39'),(0000000336,4,'','2020-06-16 16:57:39'),(0000000337,4,'','2020-06-16 16:57:41'),(0000000338,4,'','2020-06-16 16:57:42'),(0000000339,4,'','2020-06-16 16:57:44'),(0000000340,3,'','2020-06-16 16:57:48'),(0000000341,3,'','2020-06-16 16:57:53'),(0000000342,4,'','2020-06-16 16:57:57'),(0000000343,4,'','2020-06-16 16:57:58'),(0000000344,4,'','2020-06-16 16:58:06'),(0000000345,3,'','2020-06-16 16:58:09'),(0000000346,3,'','2020-06-16 16:58:18'),(0000000347,4,'','2020-06-16 16:58:55'),(0000000348,4,'','2020-06-16 16:58:56'),(0000000349,4,'','2020-06-16 16:58:58'),(0000000350,4,'','2020-06-16 16:59:02'),(0000000351,4,'','2020-06-16 16:59:03'),(0000000352,4,'','2020-06-16 16:59:15'),(0000000353,4,'','2020-06-16 16:59:19'),(0000000354,4,'','2020-06-16 16:59:19'),(0000000355,4,'','2020-06-16 16:59:22'),(0000000356,4,'','2020-06-16 16:59:22'),(0000000357,4,'','2020-06-16 16:59:25'),(0000000358,4,'','2020-06-16 16:59:29'),(0000000359,4,'','2020-06-16 16:59:29'),(0000000360,4,'','2020-06-16 16:59:31'),(0000000361,4,'','2020-06-16 16:59:35'),(0000000362,4,'','2020-06-16 16:59:37'),(0000000363,4,'','2020-06-16 16:59:40'),(0000000364,4,'','2020-06-16 16:59:42'),(0000000365,3,'','2020-06-16 17:00:59'),(0000000366,3,'','2020-06-16 17:01:02'),(0000000367,3,'','2020-06-16 17:02:23'),(0000000368,3,'','2020-06-16 17:05:58'),(0000000369,4,'','2020-06-18 10:24:55'),(0000000370,4,'','2020-06-18 10:25:00'),(0000000371,4,'','2020-06-18 10:25:03'),(0000000372,4,'','2020-06-18 10:25:05'),(0000000373,4,'','2020-06-18 10:25:09'),(0000000374,4,'','2020-06-18 10:25:12'),(0000000375,4,'','2020-06-18 10:25:14'),(0000000376,4,'','2020-06-18 10:25:57'),(0000000377,4,'','2020-06-18 10:35:01'),(0000000378,4,'','2020-06-18 10:35:04'),(0000000379,4,'','2020-06-18 10:35:08'),(0000000380,4,'','2020-06-18 10:45:09'),(0000000381,4,'','2020-06-20 07:41:10'),(0000000382,4,'','2020-06-20 07:56:29'),(0000000383,4,'','2020-06-20 07:59:13'),(0000000384,4,'','2020-06-20 07:59:16'),(0000000385,4,'','2020-06-20 07:59:17'),(0000000386,4,'','2020-06-20 07:59:20'),(0000000387,4,'','2020-06-20 07:59:22'),(0000000388,3,'','2020-06-20 09:23:04'),(0000000389,3,'','2020-06-20 09:23:05'),(0000000390,4,'','2020-06-20 09:30:38'),(0000000391,4,'','2020-06-20 09:30:52'),(0000000392,4,'','2020-06-20 09:31:07'),(0000000393,4,'','2020-06-20 09:31:11'),(0000000394,4,'','2020-06-20 09:31:16'),(0000000395,4,'','2020-06-20 09:31:16'),(0000000396,4,'','2020-06-20 09:31:19'),(0000000397,4,'','2020-06-20 09:31:23'),(0000000398,4,'','2020-06-20 09:48:11'),(0000000399,4,'','2020-06-20 09:48:29'),(0000000400,4,'','2020-06-20 09:49:58'),(0000000401,4,'','2020-06-20 09:49:59'),(0000000402,4,'','2020-06-20 09:50:10'),(0000000403,4,'','2020-06-20 09:50:12'),(0000000404,4,'','2020-06-20 09:50:17'),(0000000405,3,'','2020-06-20 09:53:49'),(0000000406,4,'','2020-06-20 09:56:05'),(0000000407,4,'','2020-06-20 09:57:13'),(0000000408,4,'','2020-06-20 09:57:18'),(0000000409,4,'','2020-06-20 09:57:19'),(0000000410,3,'','2020-06-20 10:01:11'),(0000000411,3,'','2020-06-20 10:02:58'),(0000000412,4,'','2020-06-20 11:15:27'),(0000000413,4,'','2020-06-20 11:15:59'),(0000000414,4,'','2020-06-20 11:16:09'),(0000000415,4,'','2020-06-20 11:28:00'),(0000000416,4,'','2020-06-20 11:28:14'),(0000000417,4,'','2020-06-20 11:39:41'),(0000000418,4,'','2020-06-20 11:39:41'),(0000000419,4,'','2020-06-20 11:39:44'),(0000000420,4,'','2020-06-20 11:39:46'),(0000000421,4,'','2020-06-20 11:39:46'),(0000000422,4,'','2020-06-20 11:39:48'),(0000000423,4,'','2020-06-20 11:39:52'),(0000000424,4,'','2020-06-20 11:39:54'),(0000000425,4,'','2020-06-20 11:39:57'),(0000000426,4,'','2020-06-20 11:39:59'),(0000000427,4,'','2020-06-20 11:40:02'),(0000000428,4,'','2020-06-20 11:40:04'),(0000000429,4,'','2020-06-20 11:40:05'),(0000000430,3,'肉','2020-06-20 11:45:08'),(0000000431,3,'肉','2020-06-20 11:45:15'),(0000000432,3,'肉','2020-06-20 11:46:45'),(0000000433,3,'肉','2020-06-20 11:46:54'),(0000000434,3,'牛','2020-06-20 11:47:05'),(0000000435,3,'鸡','2020-06-20 11:47:42'),(0000000436,3,'鸡','2020-06-20 11:48:24'),(0000000437,3,'鸡','2020-06-20 11:48:29'),(0000000438,3,'鸡','2020-06-20 11:48:35'),(0000000439,3,'鸡','2020-06-20 11:50:22'),(0000000440,3,'鸡','2020-06-20 11:50:32'),(0000000441,3,'鸡','2020-06-20 11:50:43'),(0000000442,3,'鸡','2020-06-20 11:50:53'),(0000000443,3,'鸡','2020-06-20 11:51:14'),(0000000444,3,'鸡','2020-06-20 11:51:22'),(0000000445,3,'','2020-06-20 11:53:01'),(0000000446,4,'','2020-06-20 11:53:20'),(0000000447,4,'','2020-06-20 11:53:23'),(0000000448,3,'','2020-06-20 11:53:40'),(0000000449,4,'','2020-06-20 11:54:47'),(0000000450,4,'','2020-06-20 11:59:41'),(0000000451,4,'','2020-06-20 11:59:47'),(0000000452,4,'','2020-06-20 12:00:38'),(0000000453,4,'','2020-06-20 12:16:24'),(0000000454,4,'','2020-06-20 12:16:28'),(0000000455,4,'','2020-06-20 14:00:49'),(0000000456,4,'','2020-06-20 14:01:12'),(0000000457,4,'','2020-06-20 15:02:58'),(0000000458,4,'','2020-06-20 15:03:59'),(0000000459,4,'肉','2020-06-20 15:04:08'),(0000000460,4,'肉','2020-06-20 15:04:16'),(0000000461,4,'','2020-06-20 15:12:12'),(0000000462,4,'','2020-06-20 15:12:37'),(0000000463,4,'','2020-06-20 15:15:35'),(0000000464,4,'','2020-06-20 15:21:18'),(0000000465,3,'','2020-06-20 15:38:50'),(0000000466,3,'','2020-06-20 15:39:01'),(0000000467,3,'','2020-06-20 15:39:05'),(0000000468,3,'','2020-06-20 15:39:06'),(0000000469,3,'','2020-06-20 15:39:08'),(0000000470,3,'','2020-06-20 15:39:12'),(0000000471,3,'','2020-06-20 15:39:15'),(0000000472,4,'','2020-06-20 15:39:27'),(0000000473,4,'','2020-06-20 15:39:35'),(0000000474,4,'','2020-06-20 15:40:38'),(0000000475,3,'','2020-06-20 15:40:38'),(0000000476,3,'','2020-06-20 15:40:38'),(0000000477,3,'','2020-06-20 15:40:38'),(0000000478,3,'','2020-06-20 15:40:38'),(0000000479,4,'','2020-06-20 15:41:00'),(0000000480,3,'','2020-06-20 15:42:14'),(0000000481,4,'','2020-06-20 15:59:28'),(0000000482,4,'','2020-06-20 15:59:46'),(0000000483,4,'','2020-06-20 16:00:55'),(0000000484,4,'','2020-06-20 16:00:59'),(0000000485,4,'','2020-06-20 16:01:07'),(0000000486,4,'','2020-06-20 16:01:15'),(0000000487,4,'','2020-06-20 16:01:22'),(0000000488,4,'','2020-06-20 16:01:26'),(0000000489,4,'','2020-06-20 16:02:04'),(0000000490,4,'','2020-06-20 16:02:05'),(0000000491,4,'','2020-06-20 16:02:10'),(0000000492,4,'','2020-06-20 16:02:14'),(0000000493,4,'','2020-06-20 16:07:36'),(0000000494,4,'','2020-06-20 16:07:40'),(0000000495,4,'','2020-06-20 16:08:15'),(0000000496,4,'','2020-06-20 16:08:21'),(0000000497,4,'','2020-06-20 16:09:07'),(0000000498,1,'','2020-06-21 08:21:41'),(0000000499,1,'','2020-06-21 08:24:21'),(0000000500,1,'','2020-06-21 08:31:56'),(0000000501,1,'','2020-06-21 08:36:34'),(0000000502,1,'','2020-06-21 08:37:38'),(0000000503,1,'','2020-06-21 08:37:54'),(0000000504,1,'','2020-06-21 08:40:42'),(0000000505,1,'','2020-06-21 08:43:33'),(0000000506,1,'','2020-06-21 08:44:05'),(0000000507,1,'','2020-06-21 08:44:29'),(0000000508,4,'','2020-06-21 10:22:43'),(0000000509,4,'','2020-06-21 10:22:46'),(0000000510,4,'','2020-06-21 10:22:49'),(0000000511,4,'','2020-06-21 10:22:52'),(0000000512,4,'','2020-06-21 10:43:36'),(0000000513,4,'','2020-06-21 10:43:37'),(0000000514,7,'','2020-06-21 11:09:44'),(0000000515,7,'','2020-06-21 11:09:45'),(0000000516,7,'','2020-06-21 11:09:48'),(0000000517,7,'','2020-06-21 11:09:49'),(0000000518,7,'','2020-06-21 11:09:58'),(0000000519,7,'','2020-06-21 11:09:59'),(0000000520,4,'','2020-06-22 00:47:22'),(0000000521,4,'','2020-06-22 00:47:26'),(0000000522,4,'','2020-06-22 00:47:28'),(0000000523,4,'','2020-06-22 00:47:31'),(0000000524,4,'','2020-06-22 00:47:31');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `customer_id` int(8) unsigned zerofill NOT NULL,
  `deliveryman_id` int(8) unsigned zerofill DEFAULT NULL,
  `create_order_time` datetime DEFAULT NULL,
  `receive_order_time` datetime DEFAULT NULL,
  `finish_order_time` datetime DEFAULT NULL,
  `order_status` int(11) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `address_id` int(5) unsigned zerofill NOT NULL,
  `warehouse_id` varchar(10) NOT NULL,
  `display_status` bit(1) DEFAULT b'0',
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE KEY `order_index` (`order_id`) USING BTREE,
  KEY `deliveryman_fk` (`deliveryman_id`) USING BTREE,
  KEY `address_fk` (`customer_id`,`address_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (000000000001,00000001,00000001,'2020-06-06 18:12:32','2020-06-21 10:53:38','2020-06-21 08:57:37',4,'00000001',00002,'01',_binary '\0',NULL),(000000000002,00000005,00000002,'2020-06-06 20:52:10',NULL,NULL,1,'00000002',00001,'01',_binary '\0',NULL),(000000000003,00000005,00000002,'2020-06-08 21:52:10',NULL,NULL,1,'00000003',00002,'01',_binary '\0',NULL),(000000000004,00000002,00000003,'2020-05-06 20:52:10',NULL,NULL,1,'00000004',00001,'01',_binary '\0',NULL),(000000000005,00000003,00000005,'2020-05-28 10:22:13',NULL,NULL,0,'00000005',00001,'02',_binary '\0',NULL),(000000000006,00000004,00000003,'2020-06-06 22:12:04',NULL,NULL,0,'00000006',10006,'01',_binary '\0',NULL),(000000000013,00000004,00000001,'2020-06-07 10:29:05','2020-06-22 05:53:08',NULL,4,'00000013',10007,'01',_binary '\0',NULL),(000000000014,00000004,00000002,'2020-06-16 16:47:09',NULL,NULL,3,'',00002,'01',NULL,'nice'),(000000000015,00000002,00000002,'2020-06-16 16:49:41','2020-06-22 06:47:58','2020-06-22 06:47:48',4,'',00002,'01',NULL,'nice'),(000000000016,00000002,00000002,'2020-06-16 16:50:28',NULL,NULL,1,'',00002,'01',NULL,'nice'),(000000000017,00000002,00000002,'2020-06-16 16:52:53',NULL,NULL,1,'',00002,'01',NULL,'nice'),(000000000018,00000002,00000002,'2020-06-16 16:54:37',NULL,NULL,1,'',00002,'01',NULL,'nice'),(000000000019,00000002,00000002,'2020-06-16 17:06:45',NULL,NULL,1,'',00002,'01',NULL,'nice'),(000000000020,00000002,00000002,'2020-06-16 17:07:43',NULL,NULL,1,'',00002,'01',NULL,'nice'),(000000000021,00000004,00000004,'2020-06-18 10:43:33',NULL,NULL,4,'',10005,'02',NULL,'就是这个备注'),(000000000022,00000004,00000004,'2020-06-20 11:28:06','2020-06-21 10:45:29',NULL,4,'',10005,'01',NULL,'就是这个备注'),(000000000026,00000004,00000004,'2020-06-20 15:15:46',NULL,NULL,1,'',10013,'01',NULL,'就是这个备注'),(000000000030,00000004,00000004,'2020-06-20 15:20:40',NULL,NULL,0,'',10008,'01',NULL,'就是这个备注'),(000000000041,00000004,00000004,'2020-06-21 10:39:06',NULL,NULL,0,'',10008,'01',NULL,'就是这个备注'),(000000000042,00000004,00000004,'2020-06-21 10:39:46',NULL,NULL,0,'',10008,'01',NULL,'就是这个备注'),(000000000043,00000004,00000004,'2020-06-21 10:40:16',NULL,'2020-06-22 00:45:23',2,'',10008,'01',NULL,'就是这个备注'),(000000000044,00000007,00000007,'2020-06-21 03:38:18','2020-06-21 05:24:37','2020-06-21 12:49:30',4,'',10015,'01',NULL,'就是这个备注'),(000000000045,00000007,00000007,'2020-06-21 04:36:13','2020-06-21 05:21:48','2020-06-21 12:49:41',4,'',10015,'01',NULL,'就是这个备注'),(000000000046,00000007,00000007,'2020-06-21 04:39:07','2020-06-21 05:21:50','2020-06-21 12:50:28',4,'',10015,'01',NULL,'就是这个备注'),(000000000047,00000007,00000007,'2020-06-21 04:48:30','2020-06-21 05:21:51','2020-06-21 12:51:13',4,'',10015,'01',NULL,'就是这个备注'),(000000000048,00000007,00000007,'2020-06-21 04:52:15','2020-06-21 05:21:53','2020-06-21 12:52:17',4,'',10015,'01',NULL,'就是这个备注'),(000000000049,00000001,00000001,'2020-06-21 04:53:44','2020-06-21 07:04:23','2020-06-21 04:53:46',4,'',00001,'01',NULL,'就是这个备注'),(000000000050,00000007,00000007,'2020-06-21 04:53:53','2020-06-21 05:24:55','2020-06-21 04:53:54',4,'',10015,'01',NULL,'就是这个备注'),(000000000051,00000007,00000007,'2020-06-21 04:58:49','2020-06-21 05:25:02','2020-06-21 05:01:41',4,'',10015,'01',NULL,'就是这个备注'),(000000000052,00000004,00000004,'2020-06-21 05:05:21','2020-06-22 07:21:28','2020-06-22 05:18:28',4,'',10008,'01',NULL,'就是这个备注'),(000000000053,00000004,00000004,'2020-06-21 05:07:19',NULL,'2020-06-22 05:26:24',2,'',10008,'01',NULL,'就是这个备注'),(000000000054,00000007,00000007,'2020-06-21 05:26:22','2020-06-21 05:30:22','2020-06-21 05:28:04',4,'',10015,'01',NULL,'就是这个备注'),(000000000066,00000001,00000001,'2020-06-22 04:19:08',NULL,'2020-06-22 04:19:12',2,'',00001,'01',NULL,'就是这个备注'),(000000000067,00000004,00000001,'2020-06-22 05:17:15',NULL,'2020-06-22 05:25:29',2,'',10008,'01',NULL,'就是这个备注'),(000000000068,00000004,00000001,'2020-06-22 05:26:54',NULL,'2020-06-22 06:44:00',2,'',10008,'01',NULL,'就是这个备注'),(000000000069,00000001,00000001,'2020-06-22 06:01:11',NULL,'2020-06-22 06:01:13',2,'',00001,'01',NULL,'就是这个备注'),(000000000070,00000004,00000001,'2020-06-22 06:16:07',NULL,'2020-06-22 06:16:11',2,'',10008,'01',NULL,'就是这个备注'),(000000000071,00000004,00000001,'2020-06-22 06:16:49',NULL,'2020-06-22 06:16:51',2,'',10008,'01',NULL,'就是这个备注');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(12) NOT NULL,
  `goods_id` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`order_id`) USING BTREE,
  KEY `order_details_index` (`order_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1,'1',1),(2,2,'1',1),(3,6,'2',1),(4,13,'3',1),(5,13,'1',1),(6,14,'1',1),(7,15,'2',1),(8,6,'3',1),(9,21,'3',1),(10,23,'27',1),(11,23,'3',1),(12,24,'14',1),(13,25,'13',1),(14,26,'10',1),(15,27,'13',1),(16,27,'14',1),(17,27,'27',1),(18,28,'32',1),(19,29,'5',1),(20,30,'3',1),(21,31,'35',1),(22,32,'51',1),(23,33,'1',3),(24,33,'2',1),(25,41,'51',1),(26,42,'37',1),(27,43,'8',1),(28,44,'15',1),(29,45,'15',1),(30,45,'8',1),(31,46,'38',1),(32,48,'15',1),(33,48,'22',1),(34,48,'26',1),(35,48,'38',1),(36,48,'8',1),(37,49,'2',1),(38,50,'16',1),(39,52,'37',1),(40,53,'35',1),(41,55,'1',3),(42,55,'10',1),(43,57,'50',1),(44,57,'35',1),(45,58,'35',1),(46,58,'50',1),(47,66,'48',1),(48,66,'6',1),(49,67,'14',39),(50,68,'30',8),(51,69,'49',1),(52,70,'37',1),(53,71,'41',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,'2020-06-06 18:12:32',60.00,1.00,'1','1','2',1),(2,'2020-06-06 20:52:10',60.00,1.00,'1','1','2',1),(3,'2020-06-06 20:52:10',56.00,1.00,'1','2','1',1),(4,'2020-06-08 21:52:10',3.00,1.00,'1','3','2',1),(5,'2020-05-06 20:52:10',60.00,1.00,'1','1','2',1),(6,'2020-05-06 20:52:10',60.00,1.00,'1','1','2',1),(7,'2020-05-28 10:22:13',58.00,1.00,'1','2','2',1),(8,'2020-06-06 22:12:04',3.00,1.00,'1','3','1',1);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recycle`
--

DROP TABLE IF EXISTS `recycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recycle` (
  `user_id` int(8) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address_id` int(5) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `consignee` varchar(45) DEFAULT NULL,
  `consignee_phone` varchar(45) DEFAULT NULL,
  `consignee_sex` varchar(45) DEFAULT NULL,
  `house_no` varchar(45) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `tag` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `district` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `order_id` varchar(32) NOT NULL,
  `deliveryman_id` int(8) DEFAULT NULL,
  `warehouse_id` varchar(45) DEFAULT NULL,
  `finish_order_time` varchar(45) DEFAULT NULL,
  `remarks` varchar(45) NOT NULL,
  `goods_id` varchar(45) DEFAULT NULL,
  `quantity` int(8) DEFAULT NULL,
  `order_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recycle`
--

LOCK TABLES `recycle` WRITE;
/*!40000 ALTER TABLE `recycle` DISABLE KEYS */;
INSERT INTO `recycle` VALUES (4,'18888888888',4,'上海市','测试','18888888888','M','111号','121.421251','31.141382','学校','上海市','徐汇区','梅陇路','2',1,'10','2020-05-28 22:53:57+00:00','1','1',4,'1');
/*!40000 ALTER TABLE `recycle` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (00000000000000000001,'2020-03-20 14:35:53','2020-03-22 14:35:57','10','10','1');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (00000004,'1',1),(00000004,'43',1),(00000004,'49',1),(00000005,'18',6),(00000005,'3',3),(00000005,'6',6),(00000007,'29',1),(00000007,'4',1);
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
  `head_image_id` varchar(32) DEFAULT '11111111111',
  `nickname` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `money` double DEFAULT '1000',
  PRIMARY KEY (`user_id`,`phone`) USING BTREE,
  UNIQUE KEY `login_phone` (`phone`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (00000001,'1','199941fyq','M','18721517889','11111111111','贝拉','MTU5MzA0MTQwMC45MjIzOTMzOjBmYTgxNWE2ZmNkMmM3NTZkMWQxODE2NTIzOWRkMTJhZTc0NTE0YmQ=',1105.75),(00000002,'1','18721522908','M','18721522908','18721522908','lzh','MTU5MzAzODgxNS44MTM0Mjo3NjliOWMyZDQ3MDg0ODg1ZWYwMzY5OGNhZjEwYzQwYzg0YjIxOTg5',874),(00000003,'1','18817669250','M','18817669250','11111111111','shl','MTU5MzAyNTgwOC41NDE3MzE0OjAzOWU2MWQ5YTcxM2FkZjA5Njg1M2RlMjJkNjczODZiYWJmNjEyZjQ=',1000),(00000004,'1','1234567890','F','18297913123','6369095844405523050','Cofalconer','MTU5MzA0MDg3OS4zNzQ3NzI1Ojc5YmIyZmUzZWFiMGYzZmRmYWFlYmFmNzM5OWM4ZDk5Y2QxZDBkYWM=',9818.079999999998),(00000005,'1','13122387285','M','13122387285','11111111111','pyl',NULL,1000),(00000006,'','',NULL,'13289638466',NULL,NULL,'MTU5Mjc0MTI0Mi45OTAxNDQ6MDU4ZjJjYTk1ZjYyN2QxZjI2YTNmZTAyZTYyMTY0OTMxOWZmOGIyMA==',NULL),(00000007,'','fan87902055',NULL,'17326712293','7114412997715117256',NULL,'MTU5Mjc0OTcyOC4zNTM1NjE2OmU1MTkwYTVhZjJlOWZjMDc4MzFmNzRlYTIwNTE5OWM3YmYzYzJmZTE=',789.66);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES ('01','上海市奉贤区海思路',00000001,'鲜着呢-奉贤'),('02','上海市徐汇区',00000002,'鲜着呢-徐汇'),('03','上海市松江区',00000003,'鲜着呢-松江'),('04','上海市浦东新区',00000004,'鲜着呢-浦东'),('05','上海市青浦区',00000005,'鲜着呢-青浦');
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

-- Dump completed on 2020-06-22 15:31:45
