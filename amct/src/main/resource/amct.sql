/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : amct

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2020-05-20 21:18:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for common_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `common_menu_info`;
CREATE TABLE `common_menu_info` (
  `menu_id` varchar(64) NOT NULL,
  `menu_code` varchar(64) DEFAULT NULL,
  `menu_name` varchar(64) DEFAULT NULL,
  `menu_nav` varchar(64) DEFAULT NULL,
  `menu_remark` varchar(512) DEFAULT NULL COMMENT '菜单说明',
  `menu_url` varchar(64) DEFAULT NULL,
  `menu_cls` varchar(64) DEFAULT NULL COMMENT '菜单图标',
  `menu_order` int(11) DEFAULT NULL,
  `menu_pid` varchar(64) DEFAULT '0' COMMENT '上级菜单(0:顶级菜单)',
  `menu_status` int(11) DEFAULT NULL COMMENT '菜单状态（0：禁用；1：启用）',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of common_menu_info
-- ----------------------------
INSERT INTO `common_menu_info` VALUES ('1', 'cols', '控制台', '控制台', '控制台', 'common/console.jsp', null, '1', '0', '1');
INSERT INTO `common_menu_info` VALUES ('2', 'menu', '菜单管理', '控制台>菜单管理', '菜单管理', 'common/menu.jsp', null, '11', '1', '1');
INSERT INTO `common_menu_info` VALUES ('3', null, '人员管理', '控制台>用户管理', '用户管理', 'common/user.jsp', null, '12', '1', '1');
INSERT INTO `common_menu_info` VALUES ('4', null, '角色管理', '控制台>角色管理', '角色管理', 'common/role.jsp', null, '13', '1', '1');
INSERT INTO `common_menu_info` VALUES ('5', 'dept', '部门管理', null, null, 'common/dept.jsp', null, '14', '1', '1');
INSERT INTO `common_menu_info` VALUES ('6', 'dict', '字典管理', null, null, 'common/dict.jsp', null, '15', '1', '1');
INSERT INTO `common_menu_info` VALUES ('7', null, '登录日志', null, null, 'common/login_log.jsp', null, '16', '1', '1');

-- ----------------------------
-- Table structure for common_role_info
-- ----------------------------
DROP TABLE IF EXISTS `common_role_info`;
CREATE TABLE `common_role_info` (
  `role_id` varchar(64) NOT NULL,
  `role_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `role_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `role_status` int(8) DEFAULT NULL,
  `role_order` int(11) DEFAULT NULL COMMENT '排序',
  `role_remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_role_info
-- ----------------------------
INSERT INTO `common_role_info` VALUES ('1', 'sysadmin', 'admin', '1', '1', '超级管理员');

-- ----------------------------
-- Table structure for common_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `common_role_menu`;
CREATE TABLE `common_role_menu` (
  `id` varchar(64) NOT NULL,
  `role_id` varchar(64) DEFAULT NULL,
  `menu_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of common_role_menu
-- ----------------------------
INSERT INTO `common_role_menu` VALUES ('1', '1', '1');
INSERT INTO `common_role_menu` VALUES ('2', '1', '2');
INSERT INTO `common_role_menu` VALUES ('3', '1', '3');
INSERT INTO `common_role_menu` VALUES ('4', '1', '4');
INSERT INTO `common_role_menu` VALUES ('5', '1', '5');
INSERT INTO `common_role_menu` VALUES ('6', '1', '6');
INSERT INTO `common_role_menu` VALUES ('7', '1', '7');
INSERT INTO `common_role_menu` VALUES ('8', '1', '8');

-- ----------------------------
-- Table structure for common_user_info
-- ----------------------------
DROP TABLE IF EXISTS `common_user_info`;
CREATE TABLE `common_user_info` (
  `user_id` varchar(64) NOT NULL,
  `user_name` varchar(64) NOT NULL,
  `login_account` varchar(64) NOT NULL,
  `login_password` varchar(64) NOT NULL,
  `user_email` varchar(64) DEFAULT NULL,
  `user_phone` varchar(64) DEFAULT NULL,
  `user_status` int(11) DEFAULT NULL COMMENT '账号状态',
  `user_sex` int(11) DEFAULT NULL COMMENT '用户性别（1:男性，0:女性）',
  `user_dept_id` int(11) DEFAULT NULL COMMENT '所属部门',
  `user_order` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`user_id`,`login_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of common_user_info
-- ----------------------------
INSERT INTO `common_user_info` VALUES ('1', 'sysadmin', 'admin', '35eYI0FHG08c862ab1cb9a4ca15af65f3dd696', null, null, null, '1', null, '1');

-- ----------------------------
-- Table structure for common_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `common_user_login_log`;
CREATE TABLE `common_user_login_log` (
  `id` varchar(64) NOT NULL,
  `login_account` varchar(64) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of common_user_login_log
-- ----------------------------
INSERT INTO `common_user_login_log` VALUES ('046443b8-6699-4597-b39b-5c2406bca8fe', 'admin', '2020-05-09 16:53:18');
INSERT INTO `common_user_login_log` VALUES ('0c5d9451-bf2f-4b0d-a8ac-3299d60fb39e', 'admin', '2020-05-09 14:05:00');
INSERT INTO `common_user_login_log` VALUES ('143ea125-8524-4eb9-bf3b-5e6f43d5ac84', 'admin', '2020-05-18 12:29:30');
INSERT INTO `common_user_login_log` VALUES ('21a528e0-d415-4445-ae23-34a3f1342e5e', 'admin', '2020-05-13 15:28:21');
INSERT INTO `common_user_login_log` VALUES ('2b8a404c-e814-46e9-a437-f00ea55e1f8f', 'admin', '2020-05-08 15:15:30');
INSERT INTO `common_user_login_log` VALUES ('31dd5b00-b0a9-403c-b5c3-ee8a2577d2d7', 'admin', '2020-05-15 13:56:48');
INSERT INTO `common_user_login_log` VALUES ('5d12c269-ce66-4eec-a04d-d1327b0e5223', 'admin', '2020-05-20 13:46:34');
INSERT INTO `common_user_login_log` VALUES ('67017ad0-fd91-412c-88d2-7cc185c2b19b', 'admin', '2020-05-20 16:56:04');
INSERT INTO `common_user_login_log` VALUES ('73c7c2cc-8304-43b4-82c6-1f73e1eda571', 'admin', '2020-05-09 10:58:34');
INSERT INTO `common_user_login_log` VALUES ('78271304-fbd6-40bd-bfd4-5df8d840ae42', 'admin', '2020-05-20 16:55:28');
INSERT INTO `common_user_login_log` VALUES ('8ff53e64-6592-4a1e-918d-cf22b0e8a6d2', 'admin', '2020-05-12 15:48:06');
INSERT INTO `common_user_login_log` VALUES ('98a8966e-53b7-4e9a-87cc-26a577f51884', 'admin', '2020-05-15 11:12:54');
INSERT INTO `common_user_login_log` VALUES ('a21d0391-d65a-4cca-a500-ad3b694973f8', 'admin', '2020-05-15 15:32:46');
INSERT INTO `common_user_login_log` VALUES ('a44e83a4-3d3b-441e-9006-a908e06191db', 'admin', '2020-05-13 15:05:54');
INSERT INTO `common_user_login_log` VALUES ('b01933d3-c5f3-498f-af54-6c0fe61aaa88', 'admin', '2020-05-15 09:38:01');
INSERT INTO `common_user_login_log` VALUES ('b1aeed74-0bed-4a33-9243-3f6d7b65ba0d', 'admin', '2020-05-18 11:43:01');
INSERT INTO `common_user_login_log` VALUES ('b52a2e4c-4c5d-458f-a8c8-529a0862a533', 'admin', '2020-05-20 11:09:07');
INSERT INTO `common_user_login_log` VALUES ('b87eee1b-e7f6-4efa-9b86-439aa0e76b56', 'admin', '2020-05-08 17:36:26');
INSERT INTO `common_user_login_log` VALUES ('bc9b60d8-f3d9-4d61-a2c4-e8358551e6ad', 'admin', '2020-05-20 16:03:23');
INSERT INTO `common_user_login_log` VALUES ('c6cee8ca-9d9c-4365-8e36-f317452d711d', 'admin', '2020-05-20 09:58:23');
INSERT INTO `common_user_login_log` VALUES ('c754f21e-1dfd-4ff5-8dc3-584c4d580d9b', 'admin', '2020-05-10 12:06:32');
INSERT INTO `common_user_login_log` VALUES ('ce6fa110-796c-4666-9b12-f4d5f564ae01', 'admin', '2020-05-09 10:11:54');
INSERT INTO `common_user_login_log` VALUES ('d2ce17bd-7ea2-4cff-a5f4-9ebbd08898e6', 'admin', '2020-05-11 09:22:09');
INSERT INTO `common_user_login_log` VALUES ('e71a60b5-9d44-407c-ab1d-46ff30da8255', 'admin', '2020-05-18 09:10:43');
INSERT INTO `common_user_login_log` VALUES ('f26879f2-b558-4a67-88fa-7473ecde3776', 'admin', '2020-05-08 17:33:07');
INSERT INTO `common_user_login_log` VALUES ('f3be5e86-d0ff-410c-8344-910cb67a5032', 'admin', '2020-05-18 14:36:22');
INSERT INTO `common_user_login_log` VALUES ('f51f5dcc-48d6-495a-89ac-2b730df2abbd', 'admin', '2020-04-27 17:23:45');
INSERT INTO `common_user_login_log` VALUES ('fc0164b0-9d37-47c1-91ca-48a97653bb78', 'admin', '2020-05-18 13:56:28');

-- ----------------------------
-- Table structure for common_user_role
-- ----------------------------
DROP TABLE IF EXISTS `common_user_role`;
CREATE TABLE `common_user_role` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_user_role
-- ----------------------------
INSERT INTO `common_user_role` VALUES ('1', '1', '1');
