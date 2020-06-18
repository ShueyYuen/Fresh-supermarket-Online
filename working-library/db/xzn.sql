/*
 Navicat Premium Data Transfer

 Source Server         : Johnny
 Source Server Type    : MySQL
 Source Server Version : 100121
 Source Host           : localhost:3306
 Source Schema         : xzn

 Target Server Type    : MySQL
 Target Server Version : 100121
 File Encoding         : 65001

 Date: 18/06/2020 15:32:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `customer_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `address_id` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consignee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `consignee_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `consignee_sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `house_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `longitude` double NULL DEFAULT NULL,
  `latitude` double NULL DEFAULT NULL,
  `tag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`address_id`, `customer_id`, `house_no`) USING BTREE,
  INDEX `customer_id`(`customer_id`, `address_id`) USING BTREE,
  INDEX `address_id`(`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10005 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (00000001, 00001, '上海市', 'lzh', '18721522908', 'M', '999', 30.82764, 121.50648, '学校', '上海市', '奉贤区', '海思路');
INSERT INTO `address` VALUES (00000002, 00001, '上海市', 'lzh', '18721525908', 'M', '999', 30.82764, 121.50648, '学校', '上海市', '奉贤区', '海思路');
INSERT INTO `address` VALUES (00000003, 00001, '上海市', 'shl', '18817669250', 'M', '130号', 31.141382, 121.421251, '学校', '上海市', '徐汇区', '梅陇路');
INSERT INTO `address` VALUES (00000004, 00001, '上海市', 'yx', '18297913123', 'M', '999', 30.82764, 121.50648, '学校', '上海市', '奉贤区', '海思路');
INSERT INTO `address` VALUES (00000005, 00001, '上海市', 'pyl', '13122387285', 'M', '999', 30.82764, 121.50648, '学校', '上海市', '奉贤区', '海思路');
INSERT INTO `address` VALUES (00000001, 00002, '上海市', 'Johnny', '18721517889', 'M', '999', 30.82764, 121.50648, '学校', '上海市', '奉贤区', '海思路');
INSERT INTO `address` VALUES (00000004, 00002, '上海市', 'yx', '18297913123', 'M', '130', 31.141382, 121.421251, '学校', '上海市', '徐汇区', '梅陇路');
INSERT INTO `address` VALUES (00000005, 00002, '上海市', 'pyl', '13122387285', 'M', '130', 31.141382, 121.421251, '学校', '上海市', '徐汇区', '梅陇路');
INSERT INTO `address` VALUES (00000001, 00003, '上海市', 'shl', '18817669250', 'M', '130号', 31.141382, 121.421251, '学校', '上海市', '徐汇区', '梅陇路');
INSERT INTO `address` VALUES (10000004, 10004, '上海市', '测试', '18888888888', 'M', '111号', 31.141382, 121.421251, '学校', '上海市', '徐汇区', '梅陇路');

-- ----------------------------
-- Table structure for ads
-- ----------------------------
DROP TABLE IF EXISTS `ads`;
CREATE TABLE `ads`  (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `product` int(11) NULL DEFAULT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activate` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ads
-- ----------------------------
INSERT INTO `ads` VALUES (00000001, 1, '00000001', NULL, 'product', b'1');
INSERT INTO `ads` VALUES (00000002, NULL, '00000002', 'https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.6.76c275b2SrScxd&id=611326515771&skuId=4370850677099&user_id=1777552687&cat_id=2&is_b=1&rn=5f158987a20dcd76e7c4619a7f6c20b6', 'url', b'1');
INSERT INTO `ads` VALUES (00000003, 2, '00000003', NULL, 'product', b'0');
INSERT INTO `ads` VALUES (00000004, 3, '00000004', NULL, 'product', b'1');
INSERT INTO `ads` VALUES (00000005, 4, '00000005', NULL, 'product', b'1');
INSERT INTO `ads` VALUES (00000006, 5, '00000006', NULL, 'product', b'1');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add user', 7, 'add_user');
INSERT INTO `auth_permission` VALUES (26, 'Can change user', 7, 'change_user');
INSERT INTO `auth_permission` VALUES (27, 'Can delete user', 7, 'delete_user');
INSERT INTO `auth_permission` VALUES (28, 'Can view user', 7, 'view_user');
INSERT INTO `auth_permission` VALUES (29, 'Can add user', 8, 'add_user');
INSERT INTO `auth_permission` VALUES (30, 'Can change user', 8, 'change_user');
INSERT INTO `auth_permission` VALUES (31, 'Can delete user', 8, 'delete_user');
INSERT INTO `auth_permission` VALUES (32, 'Can view user', 8, 'view_user');
INSERT INTO `auth_permission` VALUES (33, 'Can add goods', 9, 'add_goods');
INSERT INTO `auth_permission` VALUES (34, 'Can change goods', 9, 'change_goods');
INSERT INTO `auth_permission` VALUES (35, 'Can delete goods', 9, 'delete_goods');
INSERT INTO `auth_permission` VALUES (36, 'Can view goods', 9, 'view_goods');
INSERT INTO `auth_permission` VALUES (37, 'Can add address', 10, 'add_address');
INSERT INTO `auth_permission` VALUES (38, 'Can change address', 10, 'change_address');
INSERT INTO `auth_permission` VALUES (39, 'Can delete address', 10, 'delete_address');
INSERT INTO `auth_permission` VALUES (40, 'Can view address', 10, 'view_address');
INSERT INTO `auth_permission` VALUES (41, 'Can add shopping cart', 11, 'add_shoppingcart');
INSERT INTO `auth_permission` VALUES (42, 'Can change shopping cart', 11, 'change_shoppingcart');
INSERT INTO `auth_permission` VALUES (43, 'Can delete shopping cart', 11, 'delete_shoppingcart');
INSERT INTO `auth_permission` VALUES (44, 'Can view shopping cart', 11, 'view_shoppingcart');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for deliveryman
-- ----------------------------
DROP TABLE IF EXISTS `deliveryman`;
CREATE TABLE `deliveryman`  (
  `deliveryman_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `warehouse_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `taking_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`deliveryman_id`) USING BTREE,
  INDEX `d_warehouse_fk`(`warehouse_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of deliveryman
-- ----------------------------
INSERT INTO `deliveryman` VALUES (00000001, '1', '1');
INSERT INTO `deliveryman` VALUES (00000002, '1', '1');
INSERT INTO `deliveryman` VALUES (00000003, '1', '1');
INSERT INTO `deliveryman` VALUES (00000004, '1', '1');
INSERT INTO `deliveryman` VALUES (00000005, '1', '1');
INSERT INTO `deliveryman` VALUES (00000006, '1', '1');
INSERT INTO `deliveryman` VALUES (00000007, '1', '1');
INSERT INTO `deliveryman` VALUES (00000008, '1', '1');
INSERT INTO `deliveryman` VALUES (00000009, '1', '1');
INSERT INTO `deliveryman` VALUES (00000010, '1', '1');
INSERT INTO `deliveryman` VALUES (00000011, '2', '1');
INSERT INTO `deliveryman` VALUES (00000012, '2', '1');
INSERT INTO `deliveryman` VALUES (00000013, '2', '1');
INSERT INTO `deliveryman` VALUES (00000014, '2', '1');
INSERT INTO `deliveryman` VALUES (00000015, '2', '1');
INSERT INTO `deliveryman` VALUES (00000016, '2', '1');
INSERT INTO `deliveryman` VALUES (00000017, '2', '1');
INSERT INTO `deliveryman` VALUES (00000018, '2', '1');
INSERT INTO `deliveryman` VALUES (00000019, '2', '1');
INSERT INTO `deliveryman` VALUES (00000020, '2', '1');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (10, 'AddressAPI', 'address');
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (11, 'CartAPI', 'shoppingcart');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (9, 'GoodsAPI', 'goods');
INSERT INTO `django_content_type` VALUES (7, 'LoginAPI', 'user');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'UserInfoAPI', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-05-15 08:18:31.504376');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-05-15 08:18:32.388127');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-05-15 08:18:35.730317');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-05-15 08:18:36.293381');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-05-15 08:18:36.312900');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2020-05-15 08:18:37.053844');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2020-05-15 08:18:37.413014');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2020-05-15 08:18:37.781939');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2020-05-15 08:18:37.829765');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2020-05-15 08:18:38.113881');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2020-05-15 08:18:38.131453');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2020-05-15 08:18:38.161703');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2020-05-15 08:18:38.517947');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2020-05-15 08:18:39.238722');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2020-05-15 08:18:39.740383');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2020-05-15 08:18:39.830175');
INSERT INTO `django_migrations` VALUES (17, 'sessions', '0001_initial', '2020-05-15 08:18:39.959982');
INSERT INTO `django_migrations` VALUES (18, 'LoginAPI', '0001_initial', '2020-05-15 08:21:57.014082');
INSERT INTO `django_migrations` VALUES (19, 'AddressAPI', '0001_initial', '2020-05-28 02:58:13.229111');
INSERT INTO `django_migrations` VALUES (20, 'CartAPI', '0001_initial', '2020-05-28 02:58:13.287054');
INSERT INTO `django_migrations` VALUES (21, 'GoodsAPI', '0001_initial', '2020-05-28 02:58:13.298913');
INSERT INTO `django_migrations` VALUES (22, 'UserInfoAPI', '0001_initial', '2020-05-28 02:58:13.304951');
INSERT INTO `django_migrations` VALUES (23, 'AddressAPI', '0002_delete_address', '2020-05-28 08:01:19.088105');
INSERT INTO `django_migrations` VALUES (24, 'CartAPI', '0002_delete_shoppingcart', '2020-05-28 08:01:19.127132');
INSERT INTO `django_migrations` VALUES (25, 'GoodsAPI', '0002_delete_goods', '2020-05-28 08:01:19.149274');
INSERT INTO `django_migrations` VALUES (26, 'LoginAPI', '0002_delete_user', '2020-05-28 08:01:19.176953');
INSERT INTO `django_migrations` VALUES (27, 'UserInfoAPI', '0002_delete_user', '2020-05-28 08:01:19.190066');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float(10, 2) NULL DEFAULT 0.00,
  `warehouse_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stock` float(10, 0) NULL DEFAULT NULL,
  `origin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产地',
  `specification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格',
  `packaging` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包装',
  `stockway` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '储存方式',
  `weight` double NOT NULL COMMENT '重量',
  `discount` float(10, 0) NOT NULL COMMENT '折扣',
  `subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distribution` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tags_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tags_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`goods_id`) USING BTREE,
  UNIQUE INDEX `goods_index`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '牛肉', '肉禽蛋品', 'g', 60.00, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养牛场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (2, '羊肉', '肉禽蛋品', 'g', 56.00, '02', 95, '上海市奉贤', '一包', '包', '冷藏', 500, 1, '产于奉贤某养羊场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', '');
INSERT INTO `goods` VALUES (3, '大葱', '水果蔬菜', 'g', 3.00, '02', 55, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (4, '猪肉', '肉禽蛋品', 'g', 48.00, '02', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养猪场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (5, '鸡翅根', '肉禽蛋品', 'g', 18.00, '02', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (6, '鸡翅中', '肉禽蛋品', 'g', 22.00, '02', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (7, '鸡腿', '肉禽蛋品', 'g', 20.00, '02', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (8, '鸡肉', '肉禽蛋品', 'g', 28.00, '02', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (9, '鸭腿', '肉禽蛋品', 'g', 15.00, '02', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸭场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (10, '鸭胗', '肉禽蛋品', 'g', 34.00, '02', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸭场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (11, '鸭血', '肉禽蛋品', 'g', 8.50, '02', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸭场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (12, '鸭肉', '肉禽蛋品', 'g', 26.00, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸭场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (13, '鹌鹑蛋', '肉禽蛋品', 'g', 8.50, '02', 90, '上海市奉贤区', '一箱', '箱', '冷藏', 500, 1, '产于奉贤某鹌鹑养殖场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (14, '土鸡蛋', '肉禽蛋品', 'g', 19.00, '02', 95, '上海市奉贤区', '一箱', '箱', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (15, '生菜', '水果蔬菜', 'g', 7.20, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (16, '四季豆', '水果蔬菜', 'g', 12.00, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (17, '荷兰豆', '水果蔬菜', 'g', 15.00, '02', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (18, '芸豆', '水果蔬菜', 'g', 12.80, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (19, '鸡毛菜', '水果蔬菜', 'g', 6.40, '02', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (20, '菠菜', '水果蔬菜', 'g', 10.50, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (21, '空心菜', '水果蔬菜', 'g', 12.80, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (22, '油麦菜', '水果蔬菜', 'g', 7.50, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (23, '杭白菜', '水果蔬菜', 'g', 5.80, '02', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (24, '上海青', '水果蔬菜', 'g', 3.20, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (25, '彩椒', '水果蔬菜', 'g', 10.00, '02', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (26, '小米椒', '水果蔬菜', 'g', 19.50, '02', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (27, '虎皮椒', '水果蔬菜', 'g', 7.50, '02', 85, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (28, '大米', '米面粮油', 'g', 6.80, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (29, '红豆', '米面粮油', 'g', 12.80, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (30, '黄豆', '米面粮油', 'g', 18.00, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (31, '绿豆', '米面粮油', 'g', 12.50, '01', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (32, '上海青', '水果蔬菜', 'g', 3.20, '01', 100, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (33, '彩椒', '水果蔬菜', 'g', 10.00, '01', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (34, '牛肉', '肉禽蛋品', 'g', 60.00, '01', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养牛场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (35, '羊肉', '肉禽蛋品', 'g', 56.00, '01', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养羊场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', '');
INSERT INTO `goods` VALUES (36, '猪肉', '肉禽蛋品', 'g', 48.00, '01', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养猪场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (37, '鸡翅根', '肉禽蛋品', 'g', 18.00, '01', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (38, '鸡翅中', '肉禽蛋品', 'g', 22.00, '01', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (39, '鸡腿', '肉禽蛋品', 'g', 20.00, '01', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (40, '鸡肉', '肉禽蛋品', 'g', 28.00, '01', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (41, '大米', '米面粮油', 'g', 6.80, '03', 90, '上海市松江区', '一包', '包', '冷藏', 500, 1, '产于松江某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (42, '上海青', '水果蔬菜', 'g', 3.20, '03', 100, '上海市松江区', '一包', '包', '冷藏', 500, 1, '产于松江某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (43, '鸡腿', '肉禽蛋品', 'g', 20.00, '03', 95, '上海市松江区', '一包', '包', '冷藏', 500, 1, '产于松江某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (44, '鹌鹑蛋', '肉禽蛋品', 'g', 8.50, '03', 90, '上海市松江区', '一箱', '箱', '冷藏', 500, 1, '产于松江某鹌鹑养殖场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (45, '羊肉', '肉禽蛋品', 'g', 56.00, '03', 95, '上海市松江区', '一包', '包', '冷藏', 500, 1, '产于松江某养羊场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', '');
INSERT INTO `goods` VALUES (46, '大米', '米面粮油', 'g', 6.80, '01', 90, '上海市浦东新区', '一包', '包', '冷藏', 500, 1, '产于浦东某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (47, '上海青', '水果蔬菜', 'g', 3.20, '04', 100, '上海市浦东新区', '一包', '包', '冷藏', 500, 1, '产于浦东某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (48, '鸡腿', '肉禽蛋品', 'g', 20.00, '04', 95, '上海市浦东新区', '一包', '包', '冷藏', 500, 1, '产于浦东某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (49, '鹌鹑蛋', '肉禽蛋品', 'g', 8.50, '04', 90, '上海市浦东新区', '一箱', '箱', '冷藏', 500, 1, '产于浦东某鹌鹑养殖场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (50, '羊肉', '肉禽蛋品', 'g', 56.00, '04', 95, '上海市浦东新区', '一包', '包', '冷藏', 500, 1, '产于浦东某养羊场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', '');
INSERT INTO `goods` VALUES (51, '大米', '米面粮油', 'g', 6.80, '05', 90, '上海市青浦区', '一包', '包', '冷藏', 500, 1, '产于青浦某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (52, '上海青', '水果蔬菜', 'g', 3.20, '05', 100, '上海市青浦区', '一包', '包', '冷藏', 500, 1, '产于青浦某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (53, '鸡腿', '肉禽蛋品', 'g', 20.00, '05', 95, '上海市青浦区', '一包', '包', '冷藏', 500, 1, '产于青浦某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (54, '鹌鹑蛋', '肉禽蛋品', 'g', 8.50, '05', 90, '上海市青浦区', '一箱', '箱', '冷藏', 500, 1, '产于青浦某鹌鹑养殖场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (55, '羊肉', '肉禽蛋品', 'g', 56.00, '05', 95, '上海市青浦区', '一包', '包', '冷藏', 500, 1, '产于青浦某养羊场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', '');
INSERT INTO `goods` VALUES (56, '基围虾', '水产海鲜', 'g', 40.00, '01', 40, '上海市奉贤区', '一份', NULL, '冷冻', 500, 1, '产于宁波某水产养殖场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES (57, '鲜牛奶', '鲜奶乳品', 'g', 10.00, '01', 80, '上海市奉贤区', '一瓶', NULL, '冷藏', 500, 1, '产于奉贤某养牛场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 369 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (0000000001, 1, '牛肉', '2020-06-01 15:45:45');
INSERT INTO `history` VALUES (0000000002, 2, '肉', '2020-06-16 03:56:47');
INSERT INTO `history` VALUES (0000000003, 2, '肉', '2020-06-16 03:56:58');
INSERT INTO `history` VALUES (0000000004, 2, '牛肉', '2020-06-16 03:57:32');
INSERT INTO `history` VALUES (0000000005, 2, '牛肉', '2020-06-16 03:58:16');
INSERT INTO `history` VALUES (0000000006, 2, '牛肉', '2020-06-16 03:59:03');
INSERT INTO `history` VALUES (0000000007, 2, '牛肉', '2020-06-16 04:00:58');
INSERT INTO `history` VALUES (0000000008, 2, '牛肉', '2020-06-16 04:01:06');
INSERT INTO `history` VALUES (0000000009, 2, '牛肉', '2020-06-16 04:01:46');
INSERT INTO `history` VALUES (0000000010, 2, '牛肉', '2020-06-16 04:02:35');
INSERT INTO `history` VALUES (0000000011, 2, '牛肉', '2020-06-16 04:03:50');
INSERT INTO `history` VALUES (0000000012, 2, '牛肉', '2020-06-16 06:32:34');
INSERT INTO `history` VALUES (0000000013, 3, '', '2020-06-16 12:12:02');
INSERT INTO `history` VALUES (0000000014, 3, '', '2020-06-16 12:20:11');
INSERT INTO `history` VALUES (0000000015, 3, '', '2020-06-16 12:21:07');
INSERT INTO `history` VALUES (0000000016, 3, '', '2020-06-16 12:21:57');
INSERT INTO `history` VALUES (0000000017, 3, '', '2020-06-16 12:22:31');
INSERT INTO `history` VALUES (0000000018, 3, '', '2020-06-16 12:39:11');
INSERT INTO `history` VALUES (0000000019, 3, '', '2020-06-16 12:39:50');
INSERT INTO `history` VALUES (0000000020, 3, '肉', '2020-06-16 12:42:38');
INSERT INTO `history` VALUES (0000000021, 3, '肉', '2020-06-16 12:43:27');
INSERT INTO `history` VALUES (0000000022, 3, '肉', '2020-06-16 12:44:18');
INSERT INTO `history` VALUES (0000000023, 3, '肉', '2020-06-16 12:44:24');
INSERT INTO `history` VALUES (0000000024, 3, '肉', '2020-06-16 12:48:53');
INSERT INTO `history` VALUES (0000000025, 3, '', '2020-06-16 12:49:40');
INSERT INTO `history` VALUES (0000000026, 3, '', '2020-06-16 13:03:01');
INSERT INTO `history` VALUES (0000000027, 3, '', '2020-06-16 13:04:24');
INSERT INTO `history` VALUES (0000000028, 3, '', '2020-06-16 13:05:48');
INSERT INTO `history` VALUES (0000000029, 3, '', '2020-06-16 13:06:12');
INSERT INTO `history` VALUES (0000000030, 3, '', '2020-06-16 13:21:57');
INSERT INTO `history` VALUES (0000000031, 3, '', '2020-06-16 13:30:38');
INSERT INTO `history` VALUES (0000000032, 3, '', '2020-06-16 13:32:34');
INSERT INTO `history` VALUES (0000000033, 3, '', '2020-06-16 13:32:45');
INSERT INTO `history` VALUES (0000000034, 3, '', '2020-06-16 13:33:08');
INSERT INTO `history` VALUES (0000000035, 3, '', '2020-06-16 13:37:36');
INSERT INTO `history` VALUES (0000000036, 3, '', '2020-06-16 14:01:53');
INSERT INTO `history` VALUES (0000000037, 3, '', '2020-06-16 14:01:55');
INSERT INTO `history` VALUES (0000000038, 3, '', '2020-06-16 14:01:57');
INSERT INTO `history` VALUES (0000000039, 3, '', '2020-06-16 14:01:57');
INSERT INTO `history` VALUES (0000000040, 3, '', '2020-06-16 14:01:59');
INSERT INTO `history` VALUES (0000000041, 3, '', '2020-06-16 14:02:31');
INSERT INTO `history` VALUES (0000000042, 3, '', '2020-06-16 14:05:21');
INSERT INTO `history` VALUES (0000000043, 3, '', '2020-06-16 14:05:23');
INSERT INTO `history` VALUES (0000000044, 3, '', '2020-06-16 14:13:43');
INSERT INTO `history` VALUES (0000000045, 3, '', '2020-06-16 14:13:45');
INSERT INTO `history` VALUES (0000000046, 3, '', '2020-06-16 14:13:52');
INSERT INTO `history` VALUES (0000000047, 3, '', '2020-06-16 14:13:54');
INSERT INTO `history` VALUES (0000000048, 3, '', '2020-06-16 14:17:59');
INSERT INTO `history` VALUES (0000000049, 3, '', '2020-06-16 14:21:14');
INSERT INTO `history` VALUES (0000000050, 3, '', '2020-06-16 14:22:23');
INSERT INTO `history` VALUES (0000000051, 3, '', '2020-06-16 14:22:33');
INSERT INTO `history` VALUES (0000000052, 3, '', '2020-06-16 14:30:03');
INSERT INTO `history` VALUES (0000000053, 3, '', '2020-06-16 14:30:07');
INSERT INTO `history` VALUES (0000000054, 3, '', '2020-06-16 14:30:07');
INSERT INTO `history` VALUES (0000000055, 3, '', '2020-06-16 14:30:10');
INSERT INTO `history` VALUES (0000000056, 3, '', '2020-06-16 14:30:10');
INSERT INTO `history` VALUES (0000000057, 3, '', '2020-06-16 14:32:07');
INSERT INTO `history` VALUES (0000000058, 3, '', '2020-06-16 14:32:09');
INSERT INTO `history` VALUES (0000000059, 3, '', '2020-06-16 14:32:10');
INSERT INTO `history` VALUES (0000000060, 3, '', '2020-06-16 14:32:12');
INSERT INTO `history` VALUES (0000000061, 3, '', '2020-06-16 14:32:15');
INSERT INTO `history` VALUES (0000000062, 3, '', '2020-06-16 14:32:17');
INSERT INTO `history` VALUES (0000000063, 3, '', '2020-06-16 14:32:20');
INSERT INTO `history` VALUES (0000000064, 3, '', '2020-06-16 14:32:23');
INSERT INTO `history` VALUES (0000000065, 3, '', '2020-06-16 14:32:47');
INSERT INTO `history` VALUES (0000000066, 3, '', '2020-06-16 14:32:49');
INSERT INTO `history` VALUES (0000000067, 3, '', '2020-06-16 14:32:51');
INSERT INTO `history` VALUES (0000000068, 3, '', '2020-06-16 14:32:52');
INSERT INTO `history` VALUES (0000000069, 3, '', '2020-06-16 14:32:53');
INSERT INTO `history` VALUES (0000000070, 3, '', '2020-06-16 14:32:56');
INSERT INTO `history` VALUES (0000000071, 3, '', '2020-06-16 14:32:58');
INSERT INTO `history` VALUES (0000000072, 3, '', '2020-06-16 14:32:59');
INSERT INTO `history` VALUES (0000000073, 3, '', '2020-06-16 14:33:00');
INSERT INTO `history` VALUES (0000000074, 3, '', '2020-06-16 14:33:03');
INSERT INTO `history` VALUES (0000000075, 3, '', '2020-06-16 14:33:06');
INSERT INTO `history` VALUES (0000000076, 3, '', '2020-06-16 14:33:09');
INSERT INTO `history` VALUES (0000000077, 3, '', '2020-06-16 14:33:09');
INSERT INTO `history` VALUES (0000000078, 3, '', '2020-06-16 14:33:22');
INSERT INTO `history` VALUES (0000000079, 3, '', '2020-06-16 14:33:23');
INSERT INTO `history` VALUES (0000000080, 3, '', '2020-06-16 14:33:27');
INSERT INTO `history` VALUES (0000000081, 3, '', '2020-06-16 14:33:27');
INSERT INTO `history` VALUES (0000000082, 3, '', '2020-06-16 14:33:33');
INSERT INTO `history` VALUES (0000000083, 3, '', '2020-06-16 14:33:38');
INSERT INTO `history` VALUES (0000000084, 3, '', '2020-06-16 14:33:47');
INSERT INTO `history` VALUES (0000000085, 3, '', '2020-06-16 14:34:42');
INSERT INTO `history` VALUES (0000000086, 3, '', '2020-06-16 14:35:44');
INSERT INTO `history` VALUES (0000000087, 3, '', '2020-06-16 14:35:50');
INSERT INTO `history` VALUES (0000000088, 3, '', '2020-06-16 14:35:58');
INSERT INTO `history` VALUES (0000000089, 3, '', '2020-06-16 14:36:16');
INSERT INTO `history` VALUES (0000000090, 3, '', '2020-06-16 14:36:19');
INSERT INTO `history` VALUES (0000000091, 3, '', '2020-06-16 14:36:19');
INSERT INTO `history` VALUES (0000000092, 3, '', '2020-06-16 14:36:23');
INSERT INTO `history` VALUES (0000000093, 3, '', '2020-06-16 14:36:26');
INSERT INTO `history` VALUES (0000000094, 3, '', '2020-06-16 14:36:27');
INSERT INTO `history` VALUES (0000000095, 3, '', '2020-06-16 14:36:29');
INSERT INTO `history` VALUES (0000000096, 3, '', '2020-06-16 14:38:07');
INSERT INTO `history` VALUES (0000000097, 3, '', '2020-06-16 14:38:10');
INSERT INTO `history` VALUES (0000000098, 3, '', '2020-06-16 14:38:10');
INSERT INTO `history` VALUES (0000000099, 3, '', '2020-06-16 14:38:36');
INSERT INTO `history` VALUES (0000000100, 3, '', '2020-06-16 14:38:38');
INSERT INTO `history` VALUES (0000000101, 3, '', '2020-06-16 14:38:43');
INSERT INTO `history` VALUES (0000000102, 3, '', '2020-06-16 14:38:45');
INSERT INTO `history` VALUES (0000000103, 3, '', '2020-06-16 14:38:48');
INSERT INTO `history` VALUES (0000000104, 3, '', '2020-06-16 14:38:50');
INSERT INTO `history` VALUES (0000000105, 3, '', '2020-06-16 14:38:54');
INSERT INTO `history` VALUES (0000000106, 3, '', '2020-06-16 14:39:13');
INSERT INTO `history` VALUES (0000000107, 3, '', '2020-06-16 14:39:15');
INSERT INTO `history` VALUES (0000000108, 3, '', '2020-06-16 14:39:18');
INSERT INTO `history` VALUES (0000000109, 3, '', '2020-06-16 14:39:51');
INSERT INTO `history` VALUES (0000000110, 3, '', '2020-06-16 14:40:04');
INSERT INTO `history` VALUES (0000000111, 3, '', '2020-06-16 14:40:04');
INSERT INTO `history` VALUES (0000000112, 3, '', '2020-06-16 14:43:27');
INSERT INTO `history` VALUES (0000000113, 3, '', '2020-06-16 14:43:29');
INSERT INTO `history` VALUES (0000000114, 3, '', '2020-06-16 14:43:33');
INSERT INTO `history` VALUES (0000000115, 3, '', '2020-06-16 14:43:36');
INSERT INTO `history` VALUES (0000000116, 3, '', '2020-06-16 14:43:38');
INSERT INTO `history` VALUES (0000000117, 3, '', '2020-06-16 14:43:43');
INSERT INTO `history` VALUES (0000000118, 3, '', '2020-06-16 14:43:52');
INSERT INTO `history` VALUES (0000000119, 3, '', '2020-06-16 14:43:56');
INSERT INTO `history` VALUES (0000000120, 3, '', '2020-06-16 14:43:57');
INSERT INTO `history` VALUES (0000000121, 3, '', '2020-06-16 14:44:15');
INSERT INTO `history` VALUES (0000000122, 3, '', '2020-06-16 14:44:18');
INSERT INTO `history` VALUES (0000000123, 3, '', '2020-06-16 14:44:25');
INSERT INTO `history` VALUES (0000000124, 3, '', '2020-06-16 14:58:19');
INSERT INTO `history` VALUES (0000000125, 3, '', '2020-06-16 14:58:30');
INSERT INTO `history` VALUES (0000000126, 3, '', '2020-06-16 14:58:40');
INSERT INTO `history` VALUES (0000000127, 3, '', '2020-06-16 14:58:43');
INSERT INTO `history` VALUES (0000000128, 3, '', '2020-06-16 15:06:56');
INSERT INTO `history` VALUES (0000000129, 3, '', '2020-06-16 15:07:00');
INSERT INTO `history` VALUES (0000000130, 3, '', '2020-06-16 15:07:05');
INSERT INTO `history` VALUES (0000000131, 3, '', '2020-06-16 15:07:05');
INSERT INTO `history` VALUES (0000000132, 3, '', '2020-06-16 15:07:10');
INSERT INTO `history` VALUES (0000000133, 3, '', '2020-06-16 15:07:11');
INSERT INTO `history` VALUES (0000000134, 3, '', '2020-06-16 15:07:13');
INSERT INTO `history` VALUES (0000000135, 3, '', '2020-06-16 15:07:14');
INSERT INTO `history` VALUES (0000000136, 3, '', '2020-06-16 15:07:16');
INSERT INTO `history` VALUES (0000000137, 3, '', '2020-06-16 15:07:20');
INSERT INTO `history` VALUES (0000000138, 3, '', '2020-06-16 15:07:20');
INSERT INTO `history` VALUES (0000000139, 3, '', '2020-06-16 15:07:22');
INSERT INTO `history` VALUES (0000000140, 3, '', '2020-06-16 15:07:23');
INSERT INTO `history` VALUES (0000000141, 3, '', '2020-06-16 15:07:35');
INSERT INTO `history` VALUES (0000000142, 3, '', '2020-06-16 15:07:39');
INSERT INTO `history` VALUES (0000000143, 3, '', '2020-06-16 15:07:41');
INSERT INTO `history` VALUES (0000000144, 3, '', '2020-06-16 15:07:42');
INSERT INTO `history` VALUES (0000000145, 3, '', '2020-06-16 15:07:57');
INSERT INTO `history` VALUES (0000000146, 3, '', '2020-06-16 15:07:57');
INSERT INTO `history` VALUES (0000000147, 3, '', '2020-06-16 15:29:44');
INSERT INTO `history` VALUES (0000000148, 3, '', '2020-06-16 15:29:46');
INSERT INTO `history` VALUES (0000000149, 3, '', '2020-06-16 15:29:50');
INSERT INTO `history` VALUES (0000000150, 3, '', '2020-06-16 15:29:52');
INSERT INTO `history` VALUES (0000000151, 3, '', '2020-06-16 15:29:53');
INSERT INTO `history` VALUES (0000000152, 3, '', '2020-06-16 15:30:07');
INSERT INTO `history` VALUES (0000000153, 3, '', '2020-06-16 15:30:09');
INSERT INTO `history` VALUES (0000000154, 3, '', '2020-06-16 15:30:13');
INSERT INTO `history` VALUES (0000000155, 3, '', '2020-06-16 15:30:14');
INSERT INTO `history` VALUES (0000000156, 3, '', '2020-06-16 15:31:01');
INSERT INTO `history` VALUES (0000000157, 3, '', '2020-06-16 15:31:03');
INSERT INTO `history` VALUES (0000000158, 3, '', '2020-06-16 15:31:23');
INSERT INTO `history` VALUES (0000000159, 3, '', '2020-06-16 15:31:33');
INSERT INTO `history` VALUES (0000000160, 3, '', '2020-06-16 15:32:02');
INSERT INTO `history` VALUES (0000000161, 3, '', '2020-06-16 15:32:03');
INSERT INTO `history` VALUES (0000000162, 3, '', '2020-06-16 15:32:13');
INSERT INTO `history` VALUES (0000000163, 3, '', '2020-06-16 15:32:14');
INSERT INTO `history` VALUES (0000000164, 3, '', '2020-06-16 15:32:14');
INSERT INTO `history` VALUES (0000000165, 3, '', '2020-06-16 15:35:56');
INSERT INTO `history` VALUES (0000000166, 3, '', '2020-06-16 15:35:57');
INSERT INTO `history` VALUES (0000000167, 3, '', '2020-06-16 15:35:59');
INSERT INTO `history` VALUES (0000000168, 3, '', '2020-06-16 15:36:00');
INSERT INTO `history` VALUES (0000000169, 3, '', '2020-06-16 15:36:28');
INSERT INTO `history` VALUES (0000000170, 3, '', '2020-06-16 15:36:30');
INSERT INTO `history` VALUES (0000000171, 3, '', '2020-06-16 15:36:30');
INSERT INTO `history` VALUES (0000000172, 3, '', '2020-06-16 15:36:41');
INSERT INTO `history` VALUES (0000000173, 3, '', '2020-06-16 15:36:43');
INSERT INTO `history` VALUES (0000000174, 3, '', '2020-06-16 15:36:45');
INSERT INTO `history` VALUES (0000000175, 3, '', '2020-06-16 15:36:48');
INSERT INTO `history` VALUES (0000000176, 3, '', '2020-06-16 15:36:50');
INSERT INTO `history` VALUES (0000000177, 3, '', '2020-06-16 15:36:56');
INSERT INTO `history` VALUES (0000000178, 3, '', '2020-06-16 15:36:59');
INSERT INTO `history` VALUES (0000000179, 3, '', '2020-06-16 15:37:01');
INSERT INTO `history` VALUES (0000000180, 3, '', '2020-06-16 15:37:03');
INSERT INTO `history` VALUES (0000000181, 3, '', '2020-06-16 15:37:04');
INSERT INTO `history` VALUES (0000000182, 3, '', '2020-06-16 15:37:45');
INSERT INTO `history` VALUES (0000000183, 3, '', '2020-06-16 15:37:47');
INSERT INTO `history` VALUES (0000000184, 3, '', '2020-06-16 15:37:49');
INSERT INTO `history` VALUES (0000000185, 3, '', '2020-06-16 15:37:49');
INSERT INTO `history` VALUES (0000000186, 3, '', '2020-06-16 15:39:43');
INSERT INTO `history` VALUES (0000000187, 3, '', '2020-06-16 15:42:41');
INSERT INTO `history` VALUES (0000000188, 3, '', '2020-06-16 15:43:06');
INSERT INTO `history` VALUES (0000000189, 3, '', '2020-06-16 15:43:09');
INSERT INTO `history` VALUES (0000000190, 3, '', '2020-06-16 15:44:01');
INSERT INTO `history` VALUES (0000000191, 3, '', '2020-06-16 15:44:02');
INSERT INTO `history` VALUES (0000000192, 3, '', '2020-06-16 15:44:18');
INSERT INTO `history` VALUES (0000000193, 3, '', '2020-06-16 15:46:55');
INSERT INTO `history` VALUES (0000000194, 3, '', '2020-06-16 15:46:57');
INSERT INTO `history` VALUES (0000000195, 3, '', '2020-06-16 15:47:00');
INSERT INTO `history` VALUES (0000000196, 3, '', '2020-06-16 15:47:03');
INSERT INTO `history` VALUES (0000000197, 3, '', '2020-06-16 15:47:05');
INSERT INTO `history` VALUES (0000000198, 3, '', '2020-06-16 15:47:09');
INSERT INTO `history` VALUES (0000000199, 3, '', '2020-06-16 15:47:11');
INSERT INTO `history` VALUES (0000000200, 3, '', '2020-06-16 15:47:14');
INSERT INTO `history` VALUES (0000000201, 3, '', '2020-06-16 15:47:48');
INSERT INTO `history` VALUES (0000000202, 3, '', '2020-06-16 15:47:51');
INSERT INTO `history` VALUES (0000000203, 3, '', '2020-06-16 15:47:53');
INSERT INTO `history` VALUES (0000000204, 3, '', '2020-06-16 15:47:56');
INSERT INTO `history` VALUES (0000000205, 3, '', '2020-06-16 15:47:57');
INSERT INTO `history` VALUES (0000000206, 3, '', '2020-06-16 15:48:17');
INSERT INTO `history` VALUES (0000000207, 3, '', '2020-06-16 15:48:19');
INSERT INTO `history` VALUES (0000000208, 3, '', '2020-06-16 15:48:20');
INSERT INTO `history` VALUES (0000000209, 3, '', '2020-06-16 15:48:32');
INSERT INTO `history` VALUES (0000000210, 3, '', '2020-06-16 15:48:34');
INSERT INTO `history` VALUES (0000000211, 3, '', '2020-06-16 15:48:35');
INSERT INTO `history` VALUES (0000000212, 4, '', '2020-06-16 15:51:02');
INSERT INTO `history` VALUES (0000000213, 4, '', '2020-06-16 15:51:13');
INSERT INTO `history` VALUES (0000000214, 4, '', '2020-06-16 15:51:25');
INSERT INTO `history` VALUES (0000000215, 4, '', '2020-06-16 15:51:38');
INSERT INTO `history` VALUES (0000000216, 3, '', '2020-06-16 15:51:44');
INSERT INTO `history` VALUES (0000000217, 3, '', '2020-06-16 15:51:44');
INSERT INTO `history` VALUES (0000000218, 3, '', '2020-06-16 15:51:48');
INSERT INTO `history` VALUES (0000000219, 3, '', '2020-06-16 15:51:48');
INSERT INTO `history` VALUES (0000000220, 3, '', '2020-06-16 15:52:42');
INSERT INTO `history` VALUES (0000000221, 3, '', '2020-06-16 15:54:06');
INSERT INTO `history` VALUES (0000000222, 3, '', '2020-06-16 15:54:09');
INSERT INTO `history` VALUES (0000000223, 3, '', '2020-06-16 15:55:06');
INSERT INTO `history` VALUES (0000000224, 3, '', '2020-06-16 15:55:12');
INSERT INTO `history` VALUES (0000000225, 3, '', '2020-06-16 15:55:14');
INSERT INTO `history` VALUES (0000000226, 3, '', '2020-06-16 15:55:14');
INSERT INTO `history` VALUES (0000000227, 4, '', '2020-06-16 16:03:29');
INSERT INTO `history` VALUES (0000000228, 4, '', '2020-06-16 16:04:16');
INSERT INTO `history` VALUES (0000000229, 3, '', '2020-06-16 16:13:31');
INSERT INTO `history` VALUES (0000000230, 3, '', '2020-06-16 16:16:55');
INSERT INTO `history` VALUES (0000000231, 4, '', '2020-06-16 16:17:47');
INSERT INTO `history` VALUES (0000000232, 3, '牛', '2020-06-16 16:18:12');
INSERT INTO `history` VALUES (0000000233, 3, '牛', '2020-06-16 16:18:19');
INSERT INTO `history` VALUES (0000000234, 3, '牛', '2020-06-16 16:18:22');
INSERT INTO `history` VALUES (0000000235, 3, '牛', '2020-06-16 16:19:33');
INSERT INTO `history` VALUES (0000000236, 3, '牛', '2020-06-16 16:21:26');
INSERT INTO `history` VALUES (0000000237, 3, '牛', '2020-06-16 16:21:36');
INSERT INTO `history` VALUES (0000000238, 3, '牛', '2020-06-16 16:21:37');
INSERT INTO `history` VALUES (0000000239, 3, '牛', '2020-06-16 16:21:38');
INSERT INTO `history` VALUES (0000000240, 3, '牛', '2020-06-16 16:22:01');
INSERT INTO `history` VALUES (0000000241, 3, '牛', '2020-06-16 16:22:36');
INSERT INTO `history` VALUES (0000000242, 3, '牛', '2020-06-16 16:25:23');
INSERT INTO `history` VALUES (0000000243, 3, '牛', '2020-06-16 16:25:30');
INSERT INTO `history` VALUES (0000000244, 3, '牛', '2020-06-16 16:25:37');
INSERT INTO `history` VALUES (0000000245, 3, '牛', '2020-06-16 16:27:52');
INSERT INTO `history` VALUES (0000000246, 3, '牛', '2020-06-16 16:30:50');
INSERT INTO `history` VALUES (0000000247, 3, '牛', '2020-06-16 16:30:54');
INSERT INTO `history` VALUES (0000000248, 3, '牛', '2020-06-16 16:31:00');
INSERT INTO `history` VALUES (0000000249, 3, '牛', '2020-06-16 16:31:32');
INSERT INTO `history` VALUES (0000000250, 3, '牛', '2020-06-16 16:31:37');
INSERT INTO `history` VALUES (0000000251, 3, '牛', '2020-06-16 16:31:41');
INSERT INTO `history` VALUES (0000000252, 3, '奶', '2020-06-16 16:32:02');
INSERT INTO `history` VALUES (0000000253, 3, '牛', '2020-06-16 16:33:22');
INSERT INTO `history` VALUES (0000000254, 3, '', '2020-06-16 16:34:02');
INSERT INTO `history` VALUES (0000000255, 3, '', '2020-06-16 16:34:05');
INSERT INTO `history` VALUES (0000000256, 3, '', '2020-06-16 16:34:10');
INSERT INTO `history` VALUES (0000000257, 3, '', '2020-06-16 16:34:46');
INSERT INTO `history` VALUES (0000000258, 3, '', '2020-06-16 16:34:48');
INSERT INTO `history` VALUES (0000000259, 3, '', '2020-06-16 16:34:51');
INSERT INTO `history` VALUES (0000000260, 3, '', '2020-06-16 16:34:54');
INSERT INTO `history` VALUES (0000000261, 3, '', '2020-06-16 16:35:16');
INSERT INTO `history` VALUES (0000000262, 3, '', '2020-06-16 16:35:17');
INSERT INTO `history` VALUES (0000000263, 3, '', '2020-06-16 16:35:19');
INSERT INTO `history` VALUES (0000000264, 3, '', '2020-06-16 16:35:52');
INSERT INTO `history` VALUES (0000000265, 3, '', '2020-06-16 16:35:56');
INSERT INTO `history` VALUES (0000000266, 3, '', '2020-06-16 16:35:59');
INSERT INTO `history` VALUES (0000000267, 3, '', '2020-06-16 16:36:01');
INSERT INTO `history` VALUES (0000000268, 3, '', '2020-06-16 16:36:05');
INSERT INTO `history` VALUES (0000000269, 3, '', '2020-06-16 16:36:07');
INSERT INTO `history` VALUES (0000000270, 3, '', '2020-06-16 16:36:10');
INSERT INTO `history` VALUES (0000000271, 3, '', '2020-06-16 16:36:12');
INSERT INTO `history` VALUES (0000000272, 3, '', '2020-06-16 16:36:18');
INSERT INTO `history` VALUES (0000000273, 3, '', '2020-06-16 16:36:21');
INSERT INTO `history` VALUES (0000000274, 4, '', '2020-06-16 16:39:35');
INSERT INTO `history` VALUES (0000000275, 4, '', '2020-06-16 16:39:59');
INSERT INTO `history` VALUES (0000000276, 4, '', '2020-06-16 16:40:03');
INSERT INTO `history` VALUES (0000000277, 4, '', '2020-06-16 16:40:07');
INSERT INTO `history` VALUES (0000000278, 4, '', '2020-06-16 16:40:10');
INSERT INTO `history` VALUES (0000000279, 4, '', '2020-06-16 16:40:20');
INSERT INTO `history` VALUES (0000000280, 4, '', '2020-06-16 16:40:22');
INSERT INTO `history` VALUES (0000000281, 4, '', '2020-06-16 16:40:25');
INSERT INTO `history` VALUES (0000000282, 4, '', '2020-06-16 16:40:30');
INSERT INTO `history` VALUES (0000000283, 4, '', '2020-06-16 16:40:32');
INSERT INTO `history` VALUES (0000000284, 4, '', '2020-06-16 16:40:37');
INSERT INTO `history` VALUES (0000000285, 4, '', '2020-06-16 16:41:29');
INSERT INTO `history` VALUES (0000000286, 4, '', '2020-06-16 16:44:21');
INSERT INTO `history` VALUES (0000000287, 4, '', '2020-06-16 16:44:24');
INSERT INTO `history` VALUES (0000000288, 4, '', '2020-06-16 16:45:02');
INSERT INTO `history` VALUES (0000000289, 4, '', '2020-06-16 16:45:08');
INSERT INTO `history` VALUES (0000000290, 4, '', '2020-06-16 16:45:10');
INSERT INTO `history` VALUES (0000000291, 4, '', '2020-06-16 16:46:57');
INSERT INTO `history` VALUES (0000000292, 4, '', '2020-06-16 16:47:10');
INSERT INTO `history` VALUES (0000000293, 4, '', '2020-06-16 16:47:13');
INSERT INTO `history` VALUES (0000000294, 4, '', '2020-06-16 16:47:13');
INSERT INTO `history` VALUES (0000000295, 4, '', '2020-06-16 16:47:16');
INSERT INTO `history` VALUES (0000000296, 4, '', '2020-06-16 16:47:19');
INSERT INTO `history` VALUES (0000000297, 4, '', '2020-06-16 16:47:19');
INSERT INTO `history` VALUES (0000000298, 4, '', '2020-06-16 16:47:21');
INSERT INTO `history` VALUES (0000000299, 4, '', '2020-06-16 16:47:36');
INSERT INTO `history` VALUES (0000000300, 4, '', '2020-06-16 16:47:39');
INSERT INTO `history` VALUES (0000000301, 4, '', '2020-06-16 16:47:39');
INSERT INTO `history` VALUES (0000000302, 4, '', '2020-06-16 16:47:41');
INSERT INTO `history` VALUES (0000000303, 4, '', '2020-06-16 16:47:41');
INSERT INTO `history` VALUES (0000000304, 4, '', '2020-06-16 16:47:46');
INSERT INTO `history` VALUES (0000000305, 4, '', '2020-06-16 16:47:50');
INSERT INTO `history` VALUES (0000000306, 4, '', '2020-06-16 16:48:15');
INSERT INTO `history` VALUES (0000000307, 4, '', '2020-06-16 16:48:18');
INSERT INTO `history` VALUES (0000000308, 4, '', '2020-06-16 16:48:22');
INSERT INTO `history` VALUES (0000000309, 4, '', '2020-06-16 16:48:40');
INSERT INTO `history` VALUES (0000000310, 4, '', '2020-06-16 16:48:43');
INSERT INTO `history` VALUES (0000000311, 4, '', '2020-06-16 16:48:46');
INSERT INTO `history` VALUES (0000000312, 4, '', '2020-06-16 16:48:49');
INSERT INTO `history` VALUES (0000000313, 4, '', '2020-06-16 16:48:50');
INSERT INTO `history` VALUES (0000000314, 4, '', '2020-06-16 16:48:55');
INSERT INTO `history` VALUES (0000000315, 4, '', '2020-06-16 16:51:54');
INSERT INTO `history` VALUES (0000000316, 4, '', '2020-06-16 16:51:57');
INSERT INTO `history` VALUES (0000000317, 4, '', '2020-06-16 16:52:00');
INSERT INTO `history` VALUES (0000000318, 4, '', '2020-06-16 16:52:00');
INSERT INTO `history` VALUES (0000000319, 4, '', '2020-06-16 16:52:02');
INSERT INTO `history` VALUES (0000000320, 4, '', '2020-06-16 16:52:04');
INSERT INTO `history` VALUES (0000000321, 4, '', '2020-06-16 16:52:10');
INSERT INTO `history` VALUES (0000000322, 4, '', '2020-06-16 16:52:11');
INSERT INTO `history` VALUES (0000000323, 4, '', '2020-06-16 16:52:13');
INSERT INTO `history` VALUES (0000000324, 4, '', '2020-06-16 16:52:17');
INSERT INTO `history` VALUES (0000000325, 4, '', '2020-06-16 16:52:20');
INSERT INTO `history` VALUES (0000000326, 4, '', '2020-06-16 16:52:22');
INSERT INTO `history` VALUES (0000000327, 4, '', '2020-06-16 16:52:25');
INSERT INTO `history` VALUES (0000000328, 3, '', '2020-06-16 16:57:05');
INSERT INTO `history` VALUES (0000000329, 3, '', '2020-06-16 16:57:09');
INSERT INTO `history` VALUES (0000000330, 4, '', '2020-06-16 16:57:11');
INSERT INTO `history` VALUES (0000000331, 4, '', '2020-06-16 16:57:24');
INSERT INTO `history` VALUES (0000000332, 4, '', '2020-06-16 16:57:31');
INSERT INTO `history` VALUES (0000000333, 4, '', '2020-06-16 16:57:36');
INSERT INTO `history` VALUES (0000000334, 4, '', '2020-06-16 16:57:38');
INSERT INTO `history` VALUES (0000000335, 4, '', '2020-06-16 16:57:39');
INSERT INTO `history` VALUES (0000000336, 4, '', '2020-06-16 16:57:39');
INSERT INTO `history` VALUES (0000000337, 4, '', '2020-06-16 16:57:41');
INSERT INTO `history` VALUES (0000000338, 4, '', '2020-06-16 16:57:42');
INSERT INTO `history` VALUES (0000000339, 4, '', '2020-06-16 16:57:44');
INSERT INTO `history` VALUES (0000000340, 3, '', '2020-06-16 16:57:48');
INSERT INTO `history` VALUES (0000000341, 3, '', '2020-06-16 16:57:53');
INSERT INTO `history` VALUES (0000000342, 4, '', '2020-06-16 16:57:57');
INSERT INTO `history` VALUES (0000000343, 4, '', '2020-06-16 16:57:58');
INSERT INTO `history` VALUES (0000000344, 4, '', '2020-06-16 16:58:06');
INSERT INTO `history` VALUES (0000000345, 3, '', '2020-06-16 16:58:09');
INSERT INTO `history` VALUES (0000000346, 3, '', '2020-06-16 16:58:18');
INSERT INTO `history` VALUES (0000000347, 4, '', '2020-06-16 16:58:55');
INSERT INTO `history` VALUES (0000000348, 4, '', '2020-06-16 16:58:56');
INSERT INTO `history` VALUES (0000000349, 4, '', '2020-06-16 16:58:58');
INSERT INTO `history` VALUES (0000000350, 4, '', '2020-06-16 16:59:02');
INSERT INTO `history` VALUES (0000000351, 4, '', '2020-06-16 16:59:03');
INSERT INTO `history` VALUES (0000000352, 4, '', '2020-06-16 16:59:15');
INSERT INTO `history` VALUES (0000000353, 4, '', '2020-06-16 16:59:19');
INSERT INTO `history` VALUES (0000000354, 4, '', '2020-06-16 16:59:19');
INSERT INTO `history` VALUES (0000000355, 4, '', '2020-06-16 16:59:22');
INSERT INTO `history` VALUES (0000000356, 4, '', '2020-06-16 16:59:22');
INSERT INTO `history` VALUES (0000000357, 4, '', '2020-06-16 16:59:25');
INSERT INTO `history` VALUES (0000000358, 4, '', '2020-06-16 16:59:29');
INSERT INTO `history` VALUES (0000000359, 4, '', '2020-06-16 16:59:29');
INSERT INTO `history` VALUES (0000000360, 4, '', '2020-06-16 16:59:31');
INSERT INTO `history` VALUES (0000000361, 4, '', '2020-06-16 16:59:35');
INSERT INTO `history` VALUES (0000000362, 4, '', '2020-06-16 16:59:37');
INSERT INTO `history` VALUES (0000000363, 4, '', '2020-06-16 16:59:40');
INSERT INTO `history` VALUES (0000000364, 4, '', '2020-06-16 16:59:42');
INSERT INTO `history` VALUES (0000000365, 3, '', '2020-06-16 17:00:59');
INSERT INTO `history` VALUES (0000000366, 3, '', '2020-06-16 17:01:02');
INSERT INTO `history` VALUES (0000000367, 3, '', '2020-06-16 17:02:23');
INSERT INTO `history` VALUES (0000000368, 3, '', '2020-06-16 17:05:58');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(12) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `customer_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `deliveryman_id` int(8) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `create_order_time` datetime(0) NULL DEFAULT NULL,
  `receive_order_time` datetime(0) NULL DEFAULT NULL,
  `finish_order_time` datetime(0) NULL DEFAULT NULL,
  `order_status` int(11) NOT NULL,
  `payment_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address_id` int(5) UNSIGNED ZEROFILL NOT NULL,
  `warehouse_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `display_status` bit(1) NULL DEFAULT b'0',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `order_index`(`order_id`) USING BTREE,
  INDEX `deliveryman_fk`(`deliveryman_id`) USING BTREE,
  INDEX `address_fk`(`customer_id`, `address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (000000000001, 00000001, 00000011, '2020-06-06 18:12:32', NULL, NULL, 1, '00000001', 00002, '02', b'0', NULL);
INSERT INTO `order` VALUES (000000000002, 00000005, 00000012, '2020-06-06 20:52:10', NULL, NULL, 1, '00000002', 00001, '02', b'0', NULL);
INSERT INTO `order` VALUES (000000000003, 00000005, 00000002, '2020-06-08 21:52:10', NULL, NULL, 1, '00000003', 00002, '01', b'0', NULL);
INSERT INTO `order` VALUES (000000000004, 00000002, 00000013, '2020-05-06 20:52:10', NULL, NULL, 2, '00000004', 00001, '02', b'0', NULL);
INSERT INTO `order` VALUES (000000000005, 00000003, 00000015, '2020-05-28 10:22:13', NULL, NULL, 1, '00000005', 00001, '02', b'0', NULL);
INSERT INTO `order` VALUES (000000000006, 00000004, 00000013, '2020-06-06 22:12:04', NULL, NULL, 1, '00000006', 00001, '02', b'0', NULL);
INSERT INTO `order` VALUES (000000000013, 00000001, 00000001, '2020-06-07 10:29:05', NULL, NULL, 1, '00000013', 00001, '01', b'0', NULL);
INSERT INTO `order` VALUES (000000000014, 00000002, 00000002, '2020-06-16 16:47:09', NULL, NULL, 1, '', 00002, '01', NULL, 'nice');
INSERT INTO `order` VALUES (000000000015, 00000002, 00000002, '2020-06-16 16:49:41', NULL, NULL, 1, '', 00002, '01', NULL, 'nice');
INSERT INTO `order` VALUES (000000000016, 00000002, 00000002, '2020-06-16 16:50:28', NULL, NULL, 1, '', 00002, '01', NULL, 'nice');
INSERT INTO `order` VALUES (000000000017, 00000002, 00000002, '2020-06-16 16:52:53', NULL, NULL, 1, '', 00002, '01', NULL, 'nice');
INSERT INTO `order` VALUES (000000000018, 00000002, 00000002, '2020-06-16 16:54:37', NULL, NULL, 1, '', 00002, '01', NULL, 'nice');
INSERT INTO `order` VALUES (000000000019, 00000002, 00000002, '2020-06-16 17:06:45', NULL, NULL, 1, '', 00002, '01', NULL, 'nice');
INSERT INTO `order` VALUES (000000000020, 00000002, 00000002, '2020-06-16 17:07:43', NULL, NULL, 1, '', 00002, '01', NULL, 'nice');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(12) NOT NULL,
  `goods_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `order_id`) USING BTREE,
  INDEX `order_details_index`(`order_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, 1, '1', 1);
INSERT INTO `order_detail` VALUES (2, 2, '1', 1);
INSERT INTO `order_detail` VALUES (3, 2, '2', 1);
INSERT INTO `order_detail` VALUES (4, 3, '3', 1);
INSERT INTO `order_detail` VALUES (5, 4, '1', 1);
INSERT INTO `order_detail` VALUES (6, 5, '1', 1);
INSERT INTO `order_detail` VALUES (7, 6, '2', 1);
INSERT INTO `order_detail` VALUES (8, 6, '3', 1);

-- ----------------------------
-- Table structure for purchase
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase`  (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_time` datetime(0) NULL DEFAULT NULL,
  `buying_price` decimal(10, 2) NOT NULL,
  `buying_number` decimal(10, 2) NOT NULL,
  `purchase_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `guarantee_period` tinyint(4) NOT NULL,
  PRIMARY KEY (`purchase_id`) USING BTREE,
  UNIQUE INDEX `purchase_index`(`purchase_id`) USING BTREE,
  INDEX `goods_fk`(`goods_id`) USING BTREE,
  INDEX `warehouse_fk`(`warehouse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of purchase
-- ----------------------------
INSERT INTO `purchase` VALUES (1, '2020-06-06 18:12:32', 60.00, 1.00, '1', '1', '2', 1);
INSERT INTO `purchase` VALUES (2, '2020-06-06 20:52:10', 60.00, 1.00, '1', '1', '2', 1);
INSERT INTO `purchase` VALUES (3, '2020-06-06 20:52:10', 56.00, 1.00, '1', '2', '1', 1);
INSERT INTO `purchase` VALUES (4, '2020-06-08 21:52:10', 3.00, 1.00, '1', '3', '2', 1);
INSERT INTO `purchase` VALUES (5, '2020-05-06 20:52:10', 60.00, 1.00, '1', '1', '2', 1);
INSERT INTO `purchase` VALUES (6, '2020-05-06 20:52:10', 60.00, 1.00, '1', '1', '2', 1);
INSERT INTO `purchase` VALUES (7, '2020-05-28 10:22:13', 58.00, 1.00, '1', '2', '2', 1);
INSERT INTO `purchase` VALUES (8, '2020-06-06 22:12:04', 3.00, 1.00, '1', '3', '1', 1);

-- ----------------------------
-- Table structure for recycle
-- ----------------------------
DROP TABLE IF EXISTS `recycle`;
CREATE TABLE `recycle`  (
  `user_id` int(8) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_id` int(5) NULL DEFAULT NULL,
  `province` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consignee` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consignee_phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consignee_sex` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `house_no` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tag` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `district` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `street` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deliveryman_id` int(8) NULL DEFAULT NULL,
  `warehouse_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finish_order_time` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goods_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` int(8) NULL DEFAULT NULL,
  `order_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of recycle
-- ----------------------------
INSERT INTO `recycle` VALUES (4, '18888888888', 4, '上海市', '测试', '18888888888', 'M', '111号', '121.421251', '31.141382', '学校', '上海市', '徐汇区', '梅陇路', '2', 1, '10', '2020-05-28 22:53:57+00:00', '1', '1', 4, '1');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `schedule_id` int(20) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `schedule_start_time` datetime(0) NULL DEFAULT NULL,
  `schedule_finish_time` datetime(0) NULL DEFAULT NULL,
  `from` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `schedule_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_id`) USING BTREE,
  INDEX `from_fk`(`from`) USING BTREE,
  INDEX `to_fk`(`to`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES (00000000000000000001, '2020-03-20 14:35:53', '2020-03-22 14:35:57', '10', '10', '1');

-- ----------------------------
-- Table structure for schedule_detail
-- ----------------------------
DROP TABLE IF EXISTS `schedule_detail`;
CREATE TABLE `schedule_detail`  (
  `schedule_id` int(20) UNSIGNED ZEROFILL NOT NULL,
  `goods_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_id`, `goods_id`) USING BTREE,
  INDEX `s_goods_fk`(`goods_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of schedule_detail
-- ----------------------------
INSERT INTO `schedule_detail` VALUES (00000000000000000001, '1', 1);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `customer_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `goods_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(8) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`, `goods_id`) USING BTREE,
  INDEX `cart_goods_fk`(`goods_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (00000001, '1', 3);
INSERT INTO `shopping_cart` VALUES (00000001, '2', 1);
INSERT INTO `shopping_cart` VALUES (00000002, '1', 1);
INSERT INTO `shopping_cart` VALUES (00000003, '15', 2);
INSERT INTO `shopping_cart` VALUES (00000004, '27', 1);
INSERT INTO `shopping_cart` VALUES (00000004, '32', 1);
INSERT INTO `shopping_cart` VALUES (00000004, '6', 1);
INSERT INTO `shopping_cart` VALUES (00000005, '18', 6);
INSERT INTO `shopping_cart` VALUES (00000005, '3', 3);
INSERT INTO `shopping_cart` VALUES (00000005, '6', 6);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `user_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `head_image_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '11111111111',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` double NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `phone`) USING BTREE,
  UNIQUE INDEX `login_phone`(`phone`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (00000001, '1', '199941fyq', 'M', '18721517889', '11111111111', 'Johnny', 'MTU5MjQ2Nzg0NS44NTEzOTkyOjI0Zjk3MWVkNWQwNjI3NmY4OTFjYzYxMmJkNzYwNDZlMWMwZTcwNmQ=', 1000);
INSERT INTO `user` VALUES (00000002, '1', '18721522908', 'M', '18721522908', '11111111111', 'lzh', 'MTU5MjMyOTU0My4yMDY3ODgzOjQwMjdmMjBiNjI5Mjc5YzVmN2EzNTQ4N2FjYzRmZmU1N2U4OWU4YzI=', 940);
INSERT INTO `user` VALUES (00000003, '1', '18817669250', 'M', '18817669250', '11111111111', 'shl', 'MTU5MjMyNzQ4Mi4wMjEzMTg6ZGI3ZDEwN2UwNTg4MTUzZDc2M2E5ZjRlODI4ZjU5NWIyNGExMDU2ZQ==', 1000);
INSERT INTO `user` VALUES (00000004, '1', '18297913123', 'M', '18297913123', '11111111111', 'yx', 'MTU5MjMyOTE2My40NTM4NTM2OmJhMGM1MWNiYTMzMjVmYzgyNmNlMTYwNzM5MWU4YzBkYTNmMGJmOTg=', 1100);
INSERT INTO `user` VALUES (00000005, '1', '13122387285', 'M', '13122387285', '11111111111', 'pyl', NULL, 1000);

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse`  (
  `warehose_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `warehouse_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`warehose_id`) USING BTREE,
  UNIQUE INDEX `warehouse_index`(`warehose_id`) USING BTREE,
  INDEX `admin_fk`(`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES ('01', '上海市奉贤区海思路', 00000001, '鲜着呢-奉贤');
INSERT INTO `warehouse` VALUES ('02', '上海市徐汇区', 00000002, '鲜着呢-徐汇');
INSERT INTO `warehouse` VALUES ('03', '上海市松江区', 00000003, '鲜着呢-松江');
INSERT INTO `warehouse` VALUES ('04', '上海市浦东新区', 00000004, '鲜着呢-浦东');
INSERT INTO `warehouse` VALUES ('05', '上海市青浦区', 00000005, '鲜着呢-青浦');

SET FOREIGN_KEY_CHECKS = 1;
