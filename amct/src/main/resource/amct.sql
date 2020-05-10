/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : amct

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2020-05-10 12:00:45
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
  `menu_pid` varchar(64) DEFAULT NULL COMMENT '上级菜单',
  `menu_status` int(11) DEFAULT NULL COMMENT '菜单状态（0：禁用；1：启用）',
  `menu_type` int(11) DEFAULT NULL COMMENT '菜单类别（1：顶部菜单；2：左侧菜单）',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of common_menu_info
-- ----------------------------
INSERT INTO `common_menu_info` VALUES ('1', 'cols', '控制台', '控制台', '控制台', 'common/console.jsp', null, '1', '0', '1', '1');
INSERT INTO `common_menu_info` VALUES ('2', null, '菜单管理', '控制台>菜单管理', '菜单管理', 'common/menu.jsp', null, '13', '0', '1', '2');
INSERT INTO `common_menu_info` VALUES ('3', null, '用户管理', '控制台>用户管理', '用户管理', 'common/user.jsp', null, '12', '2', '1', '2');
INSERT INTO `common_menu_info` VALUES ('4', null, '角色管理', '控制台>角色管理', '角色管理', 'common/role.jsp', null, '11', '0', '1', '2');

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
INSERT INTO `common_user_info` VALUES ('1', 'sysadmin', 'admin', 'admin', null, null, null, null, null, '1');

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
INSERT INTO `common_user_login_log` VALUES ('2b8a404c-e814-46e9-a437-f00ea55e1f8f', 'admin', '2020-05-08 15:15:30');
INSERT INTO `common_user_login_log` VALUES ('73c7c2cc-8304-43b4-82c6-1f73e1eda571', 'admin', '2020-05-09 10:58:34');
INSERT INTO `common_user_login_log` VALUES ('b87eee1b-e7f6-4efa-9b86-439aa0e76b56', 'admin', '2020-05-08 17:36:26');
INSERT INTO `common_user_login_log` VALUES ('ce6fa110-796c-4666-9b12-f4d5f564ae01', 'admin', '2020-05-09 10:11:54');
INSERT INTO `common_user_login_log` VALUES ('f26879f2-b558-4a67-88fa-7473ecde3776', 'admin', '2020-05-08 17:33:07');
INSERT INTO `common_user_login_log` VALUES ('f51f5dcc-48d6-495a-89ac-2b730df2abbd', 'admin', '2020-04-27 17:23:45');

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
