/*
 Navicat Premium Data Transfer

 Source Server         : 202068
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : xznfin

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 09/06/2020 13:36:34
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
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`address_id`, `customer_id`, `house_no`) USING BTREE,
  INDEX `customer_id`(`customer_id`, `address_id`) USING BTREE,
  INDEX `address_id`(`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (00000001, 00001, '上海市', 'lzh', '18721522908', 'M', '999', '30.827640', '121.506480', '学校', '上海市', '奉贤区', '海思路');
INSERT INTO `address` VALUES (00000002, 00001, '上海市', 'lzh', '18721525908', 'M', '999', '30.827640', '121.506480', '学校', '上海市', '奉贤区', '海思路');
INSERT INTO `address` VALUES (00000003, 00001, '上海市', 'shl', '18817669250', 'M', '130号', '31.141382', '121.421251', '学校', '上海市', '徐汇区', '梅陇路');
INSERT INTO `address` VALUES (00000004, 00001, '上海市', 'yx', '18297913123', 'M', '999', '30.827640', '121.506480', '学校', '上海市', '奉贤区', '海思路');
INSERT INTO `address` VALUES (00000005, 00001, '上海市', 'pyl', '13122387285', 'M', '999', '30.827640', '121.506480', '学校', '上海市', '奉贤区', '海思路');
INSERT INTO `address` VALUES (00000001, 00002, '上海市', 'Johnny', '18721517889', 'M', '999', '30.827640', '121.506480', '学校', '上海市', '奉贤区', '海思路');
INSERT INTO `address` VALUES (00000004, 00002, '上海市', 'yx', '18297913123', 'M', '130', '31.141382', '121.421251', '学校', '上海市', '徐汇区', '梅陇路');
INSERT INTO `address` VALUES (00000005, 00002, '上海市', 'pyl', '13122387285', 'M', '130', '31.141382', '121.421251', '学校', '上海市', '徐汇区', '梅陇路');
INSERT INTO `address` VALUES (00000001, 00003, '上海市', 'shl', '18817669250', 'M', '130号', '31.141382', '121.421251', '学校', '上海市', '徐汇区', '梅陇路');
INSERT INTO `address` VALUES (10000004, 10004, '上海市', '测试', '18888888888', 'M', '111号', '31.141382', '121.421251', '学校', '上海市', '徐汇区', '梅陇路');

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
  `date_joined` datetime(6) NULL,
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
  `action_time` datetime(6) NULL,
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
  `applied` datetime(6) NULL,
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
  `expire_date` datetime(6) NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '牛肉', '肉类', 'g', 60.00, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养牛场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('10', '鸭胗', '禽类', 'g', 34.00, '02', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸭场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('11', '鸭血', '禽类', 'g', 8.50, '02', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸭场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('12', '鸭肉', '禽类', 'g', 26.00, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸭场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('13', '鹌鹑蛋', '蛋类', 'g', 8.50, '02', 90, '上海市奉贤区', '一箱', '箱', '冷藏', 500, 1, '产于奉贤某鹌鹑养殖场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('14', '土鸡蛋', '蛋类', 'g', 19.00, '02', 95, '上海市奉贤区', '一箱', '箱', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('15', '生菜', '蔬菜', 'g', 7.20, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('16', '四季豆', '蔬菜', 'g', 12.00, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('17', '荷兰豆', '蔬菜', 'g', 15.00, '02', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('18', '芸豆', '蔬菜', 'g', 12.80, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('19', '鸡毛菜', '蔬菜', 'g', 6.40, '02', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('2', '羊肉', '肉类', 'g', 56.00, '02', 95, '上海市奉贤', '一包', '包', '冷藏', 500, 1, '产于奉贤某养羊场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', '');
INSERT INTO `goods` VALUES ('20', '菠菜', '蔬菜', 'g', 10.50, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('21', '空心菜', '蔬菜', 'g', 12.80, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('22', '油麦菜', '蔬菜', 'g', 7.50, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('23', '杭白菜', '蔬菜', 'g', 5.80, '02', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('24', '上海青', '蔬菜', 'g', 3.20, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('25', '彩椒', '蔬菜', 'g', 10.00, '02', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('26', '小米椒', '蔬菜', 'g', 19.50, '02', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('27', '虎皮椒', '蔬菜', 'g', 7.50, '02', 85, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('28', '大米', '五谷杂粮', 'g', 6.80, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('29', '红豆', '五谷杂粮', 'g', 12.80, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('3', '大葱', '蔬菜', 'g', 3.00, '02', 55, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('30', '黄豆', '五谷杂粮', 'g', 18.00, '02', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('31', '绿豆', '五谷杂粮', 'g', 12.50, '01', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('32', '上海青', '蔬菜', 'g', 3.20, '01', 100, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('33', '彩椒', '蔬菜', 'g', 10.00, '01', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('34', '牛肉', '肉类', 'g', 60.00, '01', 90, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养牛场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('35', '羊肉', '肉类', 'g', 56.00, '01', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养羊场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', '');
INSERT INTO `goods` VALUES ('36', '猪肉', '肉类', 'g', 48.00, '01', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养猪场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('37', '鸡翅根', '禽类', 'g', 18.00, '01', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('38', '鸡翅中', '禽类', 'g', 22.00, '01', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('39', '鸡腿', '禽类', 'g', 20.00, '01', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('4', '猪肉', '肉类', 'g', 48.00, '02', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养猪场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('40', '鸡肉', '禽类', 'g', 28.00, '01', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('41', '大米', '五谷杂粮', 'g', 6.80, '03', 90, '上海市松江区', '一包', '包', '冷藏', 500, 1, '产于松江某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('42', '上海青', '蔬菜', 'g', 3.20, '03', 100, '上海市松江区', '一包', '包', '冷藏', 500, 1, '产于松江某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('43', '鸡腿', '禽类', 'g', 20.00, '03', 95, '上海市松江区', '一包', '包', '冷藏', 500, 1, '产于松江某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('44', '鹌鹑蛋', '蛋类', 'g', 8.50, '03', 90, '上海市松江区', '一箱', '箱', '冷藏', 500, 1, '产于松江某鹌鹑养殖场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('45', '羊肉', '肉类', 'g', 56.00, '03', 95, '上海市松江区', '一包', '包', '冷藏', 500, 1, '产于松江某养羊场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', '');
INSERT INTO `goods` VALUES ('46', '大米', '五谷杂粮', 'g', 6.80, '04', 90, '上海市浦东新区', '一包', '包', '冷藏', 500, 1, '产于浦东某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('47', '上海青', '蔬菜', 'g', 3.20, '04', 100, '上海市浦东新区', '一包', '包', '冷藏', 500, 1, '产于浦东某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('48', '鸡腿', '禽类', 'g', 20.00, '04', 95, '上海市浦东新区', '一包', '包', '冷藏', 500, 1, '产于浦东某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('49', '鹌鹑蛋', '蛋类', 'g', 8.50, '04', 90, '上海市浦东新区', '一箱', '箱', '冷藏', 500, 1, '产于浦东某鹌鹑养殖场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('5', '鸡翅根', '禽类', 'g', 18.00, '02', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('50', '羊肉', '肉类', 'g', 56.00, '04', 95, '上海市浦东新区', '一包', '包', '冷藏', 500, 1, '产于浦东某养羊场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', '');
INSERT INTO `goods` VALUES ('51', '大米', '五谷杂粮', 'g', 6.80, '05', 90, '上海市青浦区', '一包', '包', '冷藏', 500, 1, '产于青浦某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('52', '上海青', '蔬菜', 'g', 3.20, '05', 100, '上海市青浦区', '一包', '包', '冷藏', 500, 1, '产于青浦某农场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('53', '鸡腿', '禽类', 'g', 20.00, '05', 95, '上海市青浦区', '一包', '包', '冷藏', 500, 1, '产于青浦某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('54', '鹌鹑蛋', '蛋类', 'g', 8.50, '05', 90, '上海市青浦区', '一箱', '箱', '冷藏', 500, 1, '产于青浦某鹌鹑养殖场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('55', '羊肉', '肉类', 'g', 56.00, '05', 95, '上海市青浦区', '一包', '包', '冷藏', 500, 1, '产于青浦某养羊场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', '');
INSERT INTO `goods` VALUES ('6', '鸡翅中', '禽类', 'g', 22.00, '02', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('7', '鸡腿', '禽类', 'g', 20.00, '02', 95, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('8', '鸡肉', '禽类', 'g', 28.00, '02', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸡场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);
INSERT INTO `goods` VALUES ('9', '鸭腿', '禽类', 'g', 15.00, '02', 80, '上海市奉贤区', '一包', '包', '冷藏', 500, 1, '产于奉贤某养鸭场', '包邮，全程冷链运输，2.5小时内送达， 因交通情况派送或许有延迟。', '端午节期间专享产品，每人每天购买不超过一件，享\n受此优惠', 'hot', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (0000000001, 1, '牛肉', '2020-06-01 15:45:45');

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
  `order_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payment_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address_id` int(5) UNSIGNED ZEROFILL NOT NULL,
  `warehouse_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `display_status` bit(1) NULL DEFAULT b'0',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `order_index`(`order_id`) USING BTREE,
  INDEX `deliveryman_fk`(`deliveryman_id`) USING BTREE,
  INDEX `address_fk`(`customer_id`, `address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (000000000001, 00000001, 00000011, '2020-06-06 18:12:32', NULL, NULL, '1', '00000001', 00002, '02', b'0', NULL);
INSERT INTO `order` VALUES (000000000002, 00000005, 00000012, '2020-06-06 20:52:10', NULL, NULL, '1', '00000002', 00001, '02', b'0', NULL);
INSERT INTO `order` VALUES (000000000003, 00000005, 00000002, '2020-06-08 21:52:10', NULL, NULL, '1', '00000003', 00002, '01', b'0', NULL);
INSERT INTO `order` VALUES (000000000004, 00000002, 00000013, '2020-05-06 20:52:10', NULL, NULL, '1', '00000004', 00001, '02', b'0', NULL);
INSERT INTO `order` VALUES (000000000005, 00000003, 00000015, '2020-05-28 10:22:13', NULL, NULL, '1', '00000005', 00001, '02', b'0', NULL);
INSERT INTO `order` VALUES (000000000006, 00000004, 00000013, '2020-06-06 22:12:04', NULL, NULL, '1', '00000006', 00001, '02', b'0', NULL);
INSERT INTO `order` VALUES (000000000013, 00000001, 00000001, '2020-06-07 10:29:05', NULL, NULL, '1', '00000013', 00001, '01', NULL, NULL);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goods_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `order_id`) USING BTREE,
  INDEX `order_details_index`(`order_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, '000000000001', '1', 1);
INSERT INTO `order_detail` VALUES (2, '000000000002', '1', 1);
INSERT INTO `order_detail` VALUES (3, '000000000002', '2', 1);
INSERT INTO `order_detail` VALUES (4, '000000000003', '3', 1);
INSERT INTO `order_detail` VALUES (5, '000000000004', '1', 1);
INSERT INTO `order_detail` VALUES (6, '000000000005', '1', 1);
INSERT INTO `order_detail` VALUES (7, '000000000006', '2', 1);
INSERT INTO `order_detail` VALUES (8, '000000000006', '3', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
INSERT INTO `shopping_cart` VALUES (00000004, '20', 3);
INSERT INTO `shopping_cart` VALUES (00000004, '31', 5);
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
  PRIMARY KEY (`user_id`, `phone`) USING BTREE,
  UNIQUE INDEX `login_phone`(`phone`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (00000001, '1', '199941', 'M', '18721517889', '11111111111', 'Johnny', 'MTU5MTUzMTQ5Ny4zMTgyNjgzOjM2MzZlMWQ5M2I0MDg5NTY1OGNhYWM2N2YyMTg0YWVjZjQyZmIxMzI=');
INSERT INTO `user` VALUES (00000002, '1', '18721522908', 'M', '18721522908', '11111111111', 'lzh', NULL);
INSERT INTO `user` VALUES (00000003, '1', '18817669250', 'M', '18817669250', '11111111111', 'shl', NULL);
INSERT INTO `user` VALUES (00000004, '1', '18297913123', 'M', '18297913123', '11111111111', 'yx', NULL);
INSERT INTO `user` VALUES (00000005, '1', '13122387285', 'M', '13122387285', '11111111111', 'pyl', NULL);

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
