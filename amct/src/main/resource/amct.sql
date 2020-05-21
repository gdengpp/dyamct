/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : amct

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2020-05-21 23:43:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for common_dept_info
-- ----------------------------
DROP TABLE IF EXISTS `common_dept_info`;
CREATE TABLE `common_dept_info` (
  `dept_id` varchar(64) NOT NULL,
  `dept_name` varchar(64) DEFAULT NULL,
  `dept_code` varchar(64) DEFAULT NULL,
  `dept_order` varchar(64) DEFAULT NULL,
  `dept_pid` varchar(64) DEFAULT NULL,
  `dept_remark` text,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of common_dept_info
-- ----------------------------
INSERT INTO `common_dept_info` VALUES ('1', '综合部', 'zhb', '1', '0', '随机添加测试部门');

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
INSERT INTO `common_menu_info` VALUES ('6', 'dict', '字典管理', null, null, 'common/dict.jsp', null, '16', '1', '1');
INSERT INTO `common_menu_info` VALUES ('7', null, '登录日志', null, null, 'common/login_log.jsp', null, '15', '1', '1');

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
  `user_dept_id` int(11) DEFAULT '1' COMMENT '所属部门',
  `user_order` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`user_id`,`login_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of common_user_info
-- ----------------------------
INSERT INTO `common_user_info` VALUES ('1', 'sysadmin', 'admin', '35eYI0FHG08c862ab1cb9a4ca15af65f3dd696', null, null, null, '0', '1', '1');

-- ----------------------------
-- Table structure for common_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `common_user_login_log`;
CREATE TABLE `common_user_login_log` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `login_account` varchar(64) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of common_user_login_log
-- ----------------------------

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
