/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : amct

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2020-05-29 09:39:31
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
-- Table structure for common_icon_info
-- ----------------------------
DROP TABLE IF EXISTS `common_icon_info`;
CREATE TABLE `common_icon_info` (
  `id` varchar(64) NOT NULL,
  `icon_class` varchar(64) DEFAULT NULL COMMENT '图标路径',
  `icon_name` varchar(32) DEFAULT NULL,
  `icon_code` varchar(32) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '图标说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图标表，用来存放展示的图标提供给用户选择';

-- ----------------------------
-- Records of common_icon_info
-- ----------------------------
INSERT INTO `common_icon_info` VALUES ('013f2f53-0fc3-48d1-9b3a-507111335092', 'layui-icon layui-icon-praise', '赞', '&#xe6c6;', 'layui-icon-praise');
INSERT INTO `common_icon_info` VALUES ('03ed8548-0d66-4b37-92c9-5e6924d04136', 'layui-icon layui-icon-template-1', '模板', '&#xe656;', 'layui-icon-template-1');
INSERT INTO `common_icon_info` VALUES ('04f74fe5-7075-46a1-b0aa-8ff13550c169', 'layui-icon layui-icon-login-wechat', '微信', '&#xe677;', 'layui-icon-login-wechat');
INSERT INTO `common_icon_info` VALUES ('06291d76-1f62-4270-b60b-525f61f53e55', 'layui-icon layui-icon-face-smile-b', '表情-笑-粗', '&#xe650;', 'layui-icon-face-smile-b');
INSERT INTO `common_icon_info` VALUES ('084164ec-5cc9-4bfb-8349-975528f76c91', 'layui-icon layui-icon-login-weibo', '微博', '&#xe675;', 'layui-icon-login-weibo');
INSERT INTO `common_icon_info` VALUES ('08d59d54-8264-4177-8c5e-9e9496d36492', 'layui-icon layui-icon-login-qq', 'QQ', '&#xe676;', 'layui-icon-login-qq');
INSERT INTO `common_icon_info` VALUES ('09101d93-a682-47a3-b2d3-910b5f65d858', 'layui-icon layui-icon-senior', '高级', '&#xe674;', 'layui-icon-senior');
INSERT INTO `common_icon_info` VALUES ('095ef9f7-3c22-4b34-b4f4-f90610cbb465', 'layui-icon layui-icon-align-left', '左对齐', '&#xe649;', 'layui-icon-align-left');
INSERT INTO `common_icon_info` VALUES ('0d54c704-c7b6-4847-ae93-832d787b09ae', 'layui-icon layui-icon-download-circle', '下载-圆圈', '&#xe601;', 'layui-icon-download-circle');
INSERT INTO `common_icon_info` VALUES ('0ff37332-db37-4205-8b53-fd1e0b572282', 'layui-icon layui-icon-play', '播放', '&#xe652;', 'layui-icon-play');
INSERT INTO `common_icon_info` VALUES ('10d016a5-23a5-4891-9466-373511edf9fb', 'layui-icon layui-icon-circle-dot', '圆点', '&#xe617;', 'layui-icon-circle-dot');
INSERT INTO `common_icon_info` VALUES ('11ff8ece-bc60-4b6f-8ec1-d65956fe93d9', 'layui-icon layui-icon-cart-simple', '购物车', '&#xe698;', 'layui-icon-cart-simple');
INSERT INTO `common_icon_info` VALUES ('13c5a1ae-a846-4a50-aa89-6d1eb819016b', 'layui-icon layui-icon-note', '便签', '&#xe66e;', 'layui-icon-note');
INSERT INTO `common_icon_info` VALUES ('166c13cb-dfc4-4ce4-bd99-b8c25b7c87c3', 'layui-icon layui-icon-templeate-1', '选择模板', '&#xe630;', 'layui-icon-templeate-1');
INSERT INTO `common_icon_info` VALUES ('166ce803-fd31-4ef3-9454-6c95a54834ab', 'layui-icon layui-icon-diamond', '钻石-等级', '&#xe735;', 'layui-icon-diamond');
INSERT INTO `common_icon_info` VALUES ('175d839d-eae4-4608-89a0-033b2026447a', 'layui-icon layui-icon-voice', '语音-声音', '&#xe688;', 'layui-icon-voice');
INSERT INTO `common_icon_info` VALUES ('1dd4a6a6-6d59-4f6a-beb6-015c1eb280fb', 'layui-icon layui-icon-cellphone', '手机', ' &#xe678;', 'layui-icon-cellphone');
INSERT INTO `common_icon_info` VALUES ('205a6f9f-33d6-4dc2-a9db-bb82d961223c', 'layui-icon layui-icon-help', '帮助', '&#xe607;', 'layui-icon-help');
INSERT INTO `common_icon_info` VALUES ('22b1ce90-dd5f-4ed1-bd20-06e25fdeefbf', 'layui-icon layui-icon-fonts-clear', '文字格式化', '&#xe639;', 'layui-icon-fonts-clear');
INSERT INTO `common_icon_info` VALUES ('26be0fa6-abb1-4c36-9972-d951f9941c4e', 'layui-icon layui-icon-tree', '树', '&#xe62e;', 'layui-icon-tree');
INSERT INTO `common_icon_info` VALUES ('2bc51c79-e71e-4661-a47f-c23ae295c4a4', 'layui-icon layui-icon-home', '主页', '&#xe68e;', 'layui-icon-home');
INSERT INTO `common_icon_info` VALUES ('2c05708b-c0b4-4bdd-b881-ed6c2410163b', 'layui-icon layui-icon-upload', '上传-实心', '&#xe67c;', 'layui-icon-upload');
INSERT INTO `common_icon_info` VALUES ('303f31ab-3133-41a5-92c8-1cae3a2aa4ff', 'layui-icon layui-icon-headset', '音频-耳机', '&#xe6fc;', 'layui-icon-headset');
INSERT INTO `common_icon_info` VALUES ('33b9a98f-7bae-4a02-8e56-630a4e6ae780', 'layui-icon layui-icon-tips', '提示说明', '&#xe702;', 'layui-icon-tips');
INSERT INTO `common_icon_info` VALUES ('38747dbd-a2d5-4c40-bfb0-a867908dcbdb', 'layui-icon layui-icon-close', '关闭-空心', '&#x1006;', 'layui-icon-close');
INSERT INTO `common_icon_info` VALUES ('3b5b23e2-c67f-446c-917e-7f3394beeef7', 'layui-icon layui-icon-layouts', '布局', '&#xe632;', 'layui-icon-layouts');
INSERT INTO `common_icon_info` VALUES ('3e4040b1-b5a3-40a4-8db1-d30567129b6c', 'layui-icon layui-icon-survey', '调查', '&#xe6b2;', 'layui-icon-survey');
INSERT INTO `common_icon_info` VALUES ('419d0986-45e8-46ad-af3c-21c3a982f214', 'layui-icon layui-icon-up', '箭头 向上', '&#xe619;', 'layui-icon-up');
INSERT INTO `common_icon_info` VALUES ('43f607f5-9fc2-4970-b9cf-c14885b0c7f6', 'layui-icon layui-icon-close-fill', '关闭-实心', '&#x1007;', 'layui-icon-close-fill');
INSERT INTO `common_icon_info` VALUES ('44101e6e-6bf2-4145-8df5-f289b8dd2344', 'layui-icon layui-icon-rate-solid', '星星-实心', '&#xe67a;', 'layui-icon-rate-solid');
INSERT INTO `common_icon_info` VALUES ('4522f13e-e081-4bd0-8696-f28f50305902', 'layui-icon layui-icon-shrink-right', '右向左伸缩菜单', '&#xe668;', 'layui-icon-shrink-right');
INSERT INTO `common_icon_info` VALUES ('46e436da-1774-4260-b2f4-160a6d662f3e', 'layui-icon layui-icon-set-fill', '设置-实心', '&#xe614;', 'layui-icon-set-fill');
INSERT INTO `common_icon_info` VALUES ('490b79b5-7536-4e39-9011-d488168fda81', 'layui-icon layui-icon-align-right', '右对齐', '&#xe648;', 'layui-icon-align-right');
INSERT INTO `common_icon_info` VALUES ('49969ddf-e6f8-4246-8262-6912f5f86777', 'layui-icon layui-icon-notice', '消息-通知', '&#xe667;', 'layui-icon-notice');
INSERT INTO `common_icon_info` VALUES ('4aaad4be-52e7-4c7f-bde4-6895f00880dc', 'layui-icon layui-icon-location', '位置-地图', '&#xe715;', 'layui-icon-location');
INSERT INTO `common_icon_info` VALUES ('4ad409ac-57c9-4b1f-b227-b9158064f6db', 'layui-icon layui-icon-search', '搜索', '&#xe615;', 'layui-icon-search');
INSERT INTO `common_icon_info` VALUES ('4e5b7cee-c562-4949-97a7-0425484781fe', 'layui-icon layui-icon-rate', '星星-空心', '&#xe67b;', 'layui-icon-rate');
INSERT INTO `common_icon_info` VALUES ('4e91a2a1-b5c4-462b-904c-9c1cdafd9a19', 'layui-icon layui-icon-set', '设置-空心', '&#xe716;', 'layui-icon-set');
INSERT INTO `common_icon_info` VALUES ('4e9d65c0-7056-41b7-a881-6dc85ceeeb8f', 'layui-icon layui-icon-file', '文件', '&#xe621;', 'layui-icon-file');
INSERT INTO `common_icon_info` VALUES ('507f832b-1dd8-4fe3-a849-37785336dd92', 'layui-icon layui-icon-left', '箭头 向左', '&#xe603;', 'layui-icon-left');
INSERT INTO `common_icon_info` VALUES ('59707f8d-ef2d-4b31-b256-cc6bf2ba6fa2', 'layui-icon layui-icon-website', '网站', '&#xe7ae;', 'layui-icon-website');
INSERT INTO `common_icon_info` VALUES ('597f7809-a845-46d7-950b-e1304e94e139', 'layui-icon layui-icon-return', '返回', '&#xe65c;', 'layui-icon-return');
INSERT INTO `common_icon_info` VALUES ('59d647af-4303-4bd8-902b-c618fce73448', 'layui-icon layui-icon-form', '表单', '&#xe63c;', 'layui-icon-form');
INSERT INTO `common_icon_info` VALUES ('5a5275a6-c600-4261-abef-f4bc4c191b25', 'layui-icon layui-icon-auz', '授权', '&#xe672;', 'layui-icon-auz');
INSERT INTO `common_icon_info` VALUES ('5ab2dff3-df67-4749-9aaa-918b66875ea3', 'layui-icon layui-icon-female', '女', '&#xe661;', 'layui-icon-female');
INSERT INTO `common_icon_info` VALUES ('5adb820c-f1af-46a6-a584-a302bda51584', 'layui-icon layui-icon-fonts-code', '代码', '&#xe64e;', 'layui-icon-fonts-code');
INSERT INTO `common_icon_info` VALUES ('5bd0c261-1885-41fa-9ce8-fa157a6a8fd1', 'layui-icon layui-icon-edit', '编辑', '&#xe642;', 'layui-icon-edit');
INSERT INTO `common_icon_info` VALUES ('5e2d4ee0-a790-4d3c-9aa6-69cba6b03a74', 'layui-icon layui-icon-link', '链接', '&#xe64c;', 'layui-icon-link');
INSERT INTO `common_icon_info` VALUES ('5f699e59-55cd-46fb-86ef-42978bf1161d', 'layui-icon layui-icon-camera-fill', '相机-实心', '&#xe65d;', 'layui-icon-camera-fill');
INSERT INTO `common_icon_info` VALUES ('604563b5-e847-4b6d-bc6d-a7bcd1cf0a8e', 'layui-icon layui-icon-triangle-r', '右三角', '&#xe623;', 'layui-icon-triangle-r');
INSERT INTO `common_icon_info` VALUES ('613feeff-6f99-444e-88e4-5fdf1e2f57b6', 'layui-icon layui-icon-refresh-3', '刷新-粗', '&#xe9aa;', 'layui-icon-refresh-3');
INSERT INTO `common_icon_info` VALUES ('62a29451-bc8b-4e8c-b8de-9b70a185ba2b', 'layui-icon layui-icon-right', '箭头 向右', '&#xe602;', 'layui-icon-right');
INSERT INTO `common_icon_info` VALUES ('65f3ead8-e0d2-42ce-803f-bd8db70d368e', 'layui-icon layui-icon-friends', '好友', '&#xe612;', 'layui-icon-friends');
INSERT INTO `common_icon_info` VALUES ('6679d8df-a14c-47b0-a83c-dc703bbb32c8', 'layui-icon layui-icon-down', '箭头 向下', '&#xe61a;', 'layui-icon-down');
INSERT INTO `common_icon_info` VALUES ('66ef5b3e-3009-4e2e-9940-7532b48b6a76', 'layui-icon layui-icon-face-cry', '表情-哭泣', '&#xe69c;', 'layui-icon-face-cry');
INSERT INTO `common_icon_info` VALUES ('67f70833-ea75-43fb-b531-eb7ae3642948', 'layui-icon layui-icon-fonts-strong', '字体加粗', '&#xe62b;', 'layui-icon-fonts-strong');
INSERT INTO `common_icon_info` VALUES ('6b9f4bfb-67be-42a9-8824-bbefa62b2edb', 'layui-icon layui-icon-radio', '单选框-选中', '&#xe643;', 'layui-icon-radio');
INSERT INTO `common_icon_info` VALUES ('6c69f6c5-acd6-44dd-9675-62946e191f0f', 'layui-icon layui-icon-water', '水 下雨', '&#xe636;', 'layui-icon-water');
INSERT INTO `common_icon_info` VALUES ('6de14b63-0795-4dbf-8a15-413d47ff862c', 'layui-icon layui-icon-component', '组件', '&#xe857;', 'layui-icon-component');
INSERT INTO `common_icon_info` VALUES ('6fe75d1c-dd1d-4660-aea2-a4a22ed449c4', 'layui-icon layui-icon-loading-1', 'loading', '&#xe63e;', 'layui-icon-loading-1');
INSERT INTO `common_icon_info` VALUES ('7023ae70-eaa4-4cdc-9ecf-e608a2722479', 'layui-icon layui-icon-face-smile-fine', '表情-笑-细体', '&#xe60c;', 'layui-icon-face-smile-fine');
INSERT INTO `common_icon_info` VALUES ('75b45f4a-2d77-4064-8556-6f25a1f9f419', 'layui-icon layui-icon-group', '群组', '&#xe613;', 'layui-icon-group');
INSERT INTO `common_icon_info` VALUES ('75f05ed7-09f4-4f6a-b574-b653c8002261', 'layui-icon layui-icon-theme', '主题', '&#xe66a;', 'layui-icon-theme');
INSERT INTO `common_icon_info` VALUES ('766fe839-7a64-4bd3-b6d3-9f88bddde12b', 'layui-icon layui-icon-camera', '相机-空心', '&#xe660;', 'layui-icon-camera');
INSERT INTO `common_icon_info` VALUES ('7682823b-0040-4f50-888e-c5cfeae1ea7e', 'layui-icon layui-icon-fire', '火', '&#xe756;', 'layui-icon-fire');
INSERT INTO `common_icon_info` VALUES ('771a153c-32e5-4486-afc5-508855981976', 'layui-icon layui-icon-pause', '暂停', '&#xe651;', 'layui-icon-pause');
INSERT INTO `common_icon_info` VALUES ('7c4a4aea-3898-4a77-81a7-a317b7a12425', 'layui-icon layui-icon-circle', '单选框-候选', '&#xe63f;', 'layui-icon-circle');
INSERT INTO `common_icon_info` VALUES ('7e045436-4556-4f77-8069-595b8e9dc04d', 'layui-icon layui-icon-upload-circle', '上传-圆圈', '&#xe62f;', 'layui-icon-upload-circle');
INSERT INTO `common_icon_info` VALUES ('7f0cfbd5-cf24-41bf-93c2-bfde70ba4a06', 'layui-icon layui-icon-chart-screen', '图标 报表 屏幕', '&#xe629;', 'layui-icon-chart-screen');
INSERT INTO `common_icon_info` VALUES ('80f26cb9-6cee-4bd5-9d67-92827c11d6f8', 'layui-icon layui-icon-logout', '退出/注销', '&#xe682;', 'layui-icon-logout');
INSERT INTO `common_icon_info` VALUES ('850a2eaf-5873-42c6-b131-8addfcc9cfdd', 'layui-icon layui-icon-fonts-del', '删除线', '&#xe64f;', 'layui-icon-fonts-del');
INSERT INTO `common_icon_info` VALUES ('88186bcf-9f77-4ff9-8133-82901340b14b', 'layui-icon layui-icon-male', '男', '&#xe662;', 'layui-icon-male');
INSERT INTO `common_icon_info` VALUES ('8a9bc945-cb98-4a4c-8bce-809e65bfc8d8', 'layui-icon layui-icon-unlink', '删除链接', '&#xe64d;', 'layui-icon-unlink');
INSERT INTO `common_icon_info` VALUES ('8b8b3e88-9c28-427e-8c91-6772faa199ad', 'layui-icon layui-icon-chat', '客服', '&#xe606;', 'layui-icon-chat');
INSERT INTO `common_icon_info` VALUES ('8ffe876a-780f-4dd2-9835-52c109a69405', 'layui-icon layui-icon-prev-circle', '翻页', '&#xe633;', 'layui-icon-prev-circle');
INSERT INTO `common_icon_info` VALUES ('911be484-f748-4997-801f-9c004d82c025', 'layui-icon layui-icon-release', '发布 纸飞机', '&#xe609;', 'layui-icon-release');
INSERT INTO `common_icon_info` VALUES ('9605efe4-e1a9-4059-afc4-34737772be8f', 'layui-icon layui-icon-add-circle-fine  ', '添加-圆圈-细体', '&#xe608;', 'layui-icon-add-circle-fine  ');
INSERT INTO `common_icon_info` VALUES ('961e6122-e94a-45ae-b482-0ee442fb065f', 'layui-icon layui-icon-code-circle', '代码-圆圈', '&#xe635;', 'layui-icon-code-circle');
INSERT INTO `common_icon_info` VALUES ('9a1f692d-00fb-4f69-a28c-124a982ae0d0', 'layui-icon layui-icon-template', '模板', '&#xe663;', 'layui-icon-template');
INSERT INTO `common_icon_info` VALUES ('9a2f3d07-bb7a-4e2a-882c-715f980853d6', 'layui-icon layui-icon-more', '菜单-水平', '&#xe65f;', 'layui-icon-more');
INSERT INTO `common_icon_info` VALUES ('9b9bebd1-27c2-47e1-84fe-d6b608c45e93', 'layui-icon layui-icon-tabs', 'Tabs 选项卡', '&#xe62a;', 'layui-icon-tabs');
INSERT INTO `common_icon_info` VALUES ('9bb58a99-8d3b-4319-b7e7-93b37fc0eeeb', 'layui-icon layui-icon-about', '关于', '&#xe60b;', 'layui-icon-about');
INSERT INTO `common_icon_info` VALUES ('9c2a470c-297a-49cc-893d-d94b40a12b40', 'layui-icon layui-icon-refresh-1', '刷新', '&#xe666;', 'layui-icon-refresh-1');
INSERT INTO `common_icon_info` VALUES ('9c5587d4-7e0e-4017-9cca-6d028cf722b1', 'layui-icon layui-icon-align-center', '居中对齐', '&#xe647;', 'layui-icon-align-center');
INSERT INTO `common_icon_info` VALUES ('9d4f493f-30d5-4aa0-a3da-faf65cb95ec7', 'layui-icon layui-icon-refresh', '刷新', '&#xe669;', 'layui-icon-refresh');
INSERT INTO `common_icon_info` VALUES ('9e7a27bf-a08d-4f29-8cf1-bdc963a123d9', 'layui-icon layui-icon-layer', '窗口', '&#xe638;', 'layui-icon-layer');
INSERT INTO `common_icon_info` VALUES ('a0d986f7-b282-47a8-9fd2-8e64e617ccb0', 'layui-icon layui-icon-404', '404', '&#xe61c;', 'layui-icon-404');
INSERT INTO `common_icon_info` VALUES ('a3a5daac-0549-47e8-902a-7d62af91cfd4', 'layui-icon layui-icon-date', '日期', '&#xe637;', 'layui-icon-date');
INSERT INTO `common_icon_info` VALUES ('a444da2c-6d82-4262-a3e4-afe716b467c0', 'layui-icon layui-icon-loading', 'loading', '&#xe63d;', 'layui-icon-loading');
INSERT INTO `common_icon_info` VALUES ('a4fb7e65-8109-4370-90cc-873751484b1b', 'layui-icon layui-icon-carousel', '轮播组图', '&#xe634;', 'layui-icon-carousel');
INSERT INTO `common_icon_info` VALUES ('a6e0bf55-34d1-4c1c-8ee2-3df3e778f48f', 'layui-icon layui-icon-read', '办公-阅读', '&#xe705;', 'layui-icon-read');
INSERT INTO `common_icon_info` VALUES ('a6f1978f-03a0-4035-9373-a6d210b8652f', 'layui-icon layui-icon-upload-drag', '上传-空心-拖拽', '&#xe681;', 'layui-icon-upload-drag');
INSERT INTO `common_icon_info` VALUES ('a817f66d-9fd7-4970-8901-1b43cae66307', 'layui-icon layui-icon-video', '视频', '&#xe6ed;', 'layui-icon-video');
INSERT INTO `common_icon_info` VALUES ('a835318e-e99f-4aca-b6cf-cb380d47bc27', 'layui-icon layui-icon-menu-fill', '菜单 隐身 实心', '&#xe60f;', 'layui-icon-menu-fill');
INSERT INTO `common_icon_info` VALUES ('a8c66606-83b4-4ecb-984a-0a613d8fdc84', 'layui-icon layui-icon-triangle-d', '下三角', '&#xe625;', 'layui-icon-triangle-d');
INSERT INTO `common_icon_info` VALUES ('ab280c69-9c6d-4f48-adaa-3f201bbe84d2', 'layui-icon layui-icon-set-sm', '设置-小型', '&#xe620;', 'layui-icon-set-sm');
INSERT INTO `common_icon_info` VALUES ('aca7649b-8ffc-49eb-8e24-1453d51c9512', 'layui-icon layui-icon-dollar', '金额-美元', '&#xe659;', 'layui-icon-dollar');
INSERT INTO `common_icon_info` VALUES ('aeec26ac-d7d5-4142-a235-30427bff9cfc', 'layui-icon layui-icon-engine', '引擎', '&#xe628;', 'layui-icon-engine');
INSERT INTO `common_icon_info` VALUES ('af33e5fa-b27a-4276-8c4a-f6bb49e4dc0b', 'layui-icon layui-icon-add-1', '添加', '&#xe654;', 'layui-icon-add-1');
INSERT INTO `common_icon_info` VALUES ('b0128b12-8df1-40b5-907d-8ae19a97fbe9', 'layui-icon layui-icon-table', '表格', '&#xe62d;', 'layui-icon-table');
INSERT INTO `common_icon_info` VALUES ('b4f11180-e76c-4bbe-b7a5-7cbf898851d1', 'layui-icon layui-icon-log', '记录', '&#xe60e;', 'layui-icon-log');
INSERT INTO `common_icon_info` VALUES ('b5494651-5e87-461b-9fe9-a92fe6f95d90', 'layui-icon layui-icon-find-fill', '发现-实心', '&#xe670;', 'layui-icon-find-fill');
INSERT INTO `common_icon_info` VALUES ('b80c9029-3451-4b9e-8a42-a58efca8633a', 'layui-icon layui-icon-ok-circle', '正确', '&#x1005;', 'layui-icon-ok-circle');
INSERT INTO `common_icon_info` VALUES ('b82c4270-6331-4623-8f50-d8cc5ad5c025', 'layui-icon layui-icon-delete', '删除', '&#xe640;', 'layui-icon-delete');
INSERT INTO `common_icon_info` VALUES ('bbc240d7-3d3a-4f19-952d-7ffa33f77a32', 'layui-icon layui-icon-password', '密码', '&#xe673;', 'layui-icon-password');
INSERT INTO `common_icon_info` VALUES ('bd49f217-28f2-46cd-ae4b-49a0eba8dc92', 'layui-icon layui-icon-add-circle', '添加-圆圈', '&#xe61f;', 'layui-icon-add-circle');
INSERT INTO `common_icon_info` VALUES ('bdb55ef8-4bb5-42a8-94b5-b5682ece6b8d', 'layui-icon layui-icon-more-vertical', '菜单-垂直', '&#xe671;', 'layui-icon-more-vertical');
INSERT INTO `common_icon_info` VALUES ('bf5cff21-a121-4f72-9156-1bbfd6be093f', 'layui-icon layui-icon-top', 'top 置顶', '&#xe604;', 'layui-icon-top');
INSERT INTO `common_icon_info` VALUES ('c0ec12f5-13e9-47f3-8f4c-d2315e0b745d', 'layui-icon layui-icon-star-fill', '收藏-实心', '&#xe658;', 'layui-icon-star-fill');
INSERT INTO `common_icon_info` VALUES ('c3c1dba2-5cd5-472e-921b-326b31530030', 'layui-icon layui-icon-fonts-u', '字体-下划线', '&#xe646;', 'layui-icon-fonts-u');
INSERT INTO `common_icon_info` VALUES ('c620e72f-56d2-4997-be7e-0e13b795883f', 'layui-icon layui-icon-console', '控制台', '&#xe665;', 'layui-icon-console');
INSERT INTO `common_icon_info` VALUES ('c6e615a6-3176-46db-9879-71295d42b795', 'layui-icon layui-icon-spread-left', '左向右伸缩菜单', '&#xe66b;', 'layui-icon-spread-left');
INSERT INTO `common_icon_info` VALUES ('c9ae28cc-3be3-49fe-bd88-bf73c4cb1b4c', 'layui-icon layui-icon-reply-fill', '回复 评论 实心', '&#xe611;', 'layui-icon-reply-fill');
INSERT INTO `common_icon_info` VALUES ('cba33ea8-1a34-47a9-8ced-14a161b1b99f', 'layui-icon layui-icon-next', '下一页', '&#xe65b;', 'layui-icon-next');
INSERT INTO `common_icon_info` VALUES ('ce831a54-eb41-4445-ba2d-25287d3a9c40', 'layui-icon layui-icon-star', '收藏-空心', '&#xe600;', 'layui-icon-star');
INSERT INTO `common_icon_info` VALUES ('d19b7bd5-41c9-469e-ba59-9c5c78a2b648', 'layui-icon layui-icon-prev', '上一页', '&#xe65a;', 'layui-icon-prev');
INSERT INTO `common_icon_info` VALUES ('d2095e47-45ad-43a8-a7d7-951ce77c4442', 'layui-icon layui-icon-chart', '图表', '&#xe62c;', 'layui-icon-chart');
INSERT INTO `common_icon_info` VALUES ('d2324037-3db2-4845-a1f7-09b637861477', 'layui-icon layui-icon-util', '工具', '&#xe631;', 'layui-icon-util');
INSERT INTO `common_icon_info` VALUES ('d25ad79c-19a1-401b-8887-a973288ac135', 'layui-icon layui-icon-tread', '踩', '&#xe6c5;', 'layui-icon-tread');
INSERT INTO `common_icon_info` VALUES ('d2c4623c-1d2d-4a6f-a087-6e75a9679576', 'layui-icon layui-icon-face-smile', '表情-微笑', '&#xe6af;', 'layui-icon-face-smile');
INSERT INTO `common_icon_info` VALUES ('d595bae6-2519-45ee-8358-a2f8fbb029d3', 'layui-icon layui-icon-vercode  ', '验证码', '&#xe679;', 'layui-icon-vercode');
INSERT INTO `common_icon_info` VALUES ('d76715ff-1351-4009-b9c9-0167cb9d629c', 'layui-icon layui-icon-cart', '购物车', '&#xe657;', 'layui-icon-cart');
INSERT INTO `common_icon_info` VALUES ('da31e536-31c4-44d2-8ec3-6b954a76698f', 'layui-icon layui-icon-picture-fine', '图片-细体', '&#xe60d;', 'layui-icon-picture-fine');
INSERT INTO `common_icon_info` VALUES ('dba9bb86-563c-4a09-8d70-ab6626e8ca5c', 'layui-icon layui-icon-rate-half', '半星', '&#xe6c9;', 'layui-icon-rate-half');
INSERT INTO `common_icon_info` VALUES ('dbc2cf36-93b1-4aa8-9685-88df04794f02', 'layui-icon layui-icon-rmb', '金额-人民币', '&#xe65e;', 'layui-icon-rmb');
INSERT INTO `common_icon_info` VALUES ('ddf4a581-a64f-47dd-a439-60c8ad8679aa', 'layui-icon layui-icon-list', '列表', '&#xe60a;', 'layui-icon-list');
INSERT INTO `common_icon_info` VALUES ('de6f2f71-b165-49d9-93fd-fe12afb13db2', 'layui-icon layui-icon-flag', '旗帜', '&#xe66c;', 'layui-icon-flag');
INSERT INTO `common_icon_info` VALUES ('e452b2a3-a428-4eb7-beb2-5dc0992d1ac0', 'layui-icon layui-icon-user', '用户', '&#xe770;', 'layui-icon-user');
INSERT INTO `common_icon_info` VALUES ('e474755e-093b-452c-8362-aaed394023ae', 'layui-icon layui-icon-username', '用户名', '&#xe66f;', 'layui-icon-username');
INSERT INTO `common_icon_info` VALUES ('e73abca2-6ee1-491a-bf19-7d520e0da1eb', 'layui-icon layui-icon-ok', '对 OK', '&#xe605;', 'layui-icon-ok');
INSERT INTO `common_icon_info` VALUES ('e874b622-17b5-4ed4-a57d-cbcb7dc54a01', 'layui-icon layui-icon-cellphone-fine', '手机-细体', '&#xe63b;', 'layui-icon-cellphone-fine');
INSERT INTO `common_icon_info` VALUES ('e9911731-6900-44a2-800b-1413ab8368ff', 'layui-icon layui-icon-snowflake', '雪花', '&#xe6b1;', 'layui-icon-snowflake');
INSERT INTO `common_icon_info` VALUES ('ea85ca68-cd6b-4adc-b2e0-30ff03557e69', 'layui-icon layui-icon-fonts-html', 'HTML', '&#xe64b;', 'layui-icon-fonts-html');
INSERT INTO `common_icon_info` VALUES ('ebf95b4e-6b49-43bd-ac71-b3e99ae8e023', 'layui-icon layui-icon-share', '分享', '&#xe641;', 'layui-icon-share');
INSERT INTO `common_icon_info` VALUES ('ec099ca8-6fdb-4510-9f99-07e3d756675f', 'layui-icon layui-icon-dialogue', '聊天 对话 沟通', '&#xe63a;', 'layui-icon-dialogue');
INSERT INTO `common_icon_info` VALUES ('ed97ca04-9aff-42be-bc3a-9adfebe1e575', 'layui-icon layui-icon-speaker', '消息-通知-喇叭', '&#xe645;', 'layui-icon-speaker');
INSERT INTO `common_icon_info` VALUES ('f4713f64-5371-4ddd-a461-2f0682482442', 'layui-icon layui-icon-face-surprised', '表情-惊讶', '&#xe664;', 'layui-icon-face-surprised');
INSERT INTO `common_icon_info` VALUES ('f5dbc7bf-2a5b-49c1-b205-b9d8658f4f76', 'layui-icon layui-icon-app', '应用', '&#xe653;', 'layui-icon-app');
INSERT INTO `common_icon_info` VALUES ('f78331ac-99cf-4ef8-93fa-9757f2600a71', 'layui-icon layui-icon-fonts-i', '字体-斜体', '&#xe644;', 'layui-icon-fonts-i');
INSERT INTO `common_icon_info` VALUES ('f950b758-0760-461e-ab92-2c4e811bb689', 'layui-icon layui-icon-picture', '图片', '&#xe64a;', 'layui-icon-picture');
INSERT INTO `common_icon_info` VALUES ('fd95edf5-f416-4586-a9b8-a1868ed3576b', 'layui-icon layui-icon-file-b', '文件-粗', '&#xe655;', 'layui-icon-file-b');

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
  `menu_cls` varchar(64) DEFAULT '' COMMENT '菜单图标',
  `menu_order` int(11) DEFAULT NULL,
  `menu_pid` varchar(64) DEFAULT '0' COMMENT '上级菜单(0:顶级菜单)',
  `menu_status` int(11) DEFAULT NULL COMMENT '菜单状态（0：禁用；1：启用）',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of common_menu_info
-- ----------------------------
INSERT INTO `common_menu_info` VALUES ('1', 'cols', '控制台', '控制台', '控制台', 'common/console.jsp', '&#xe665;', '1', '0', '1');
INSERT INTO `common_menu_info` VALUES ('2', 'menu', '菜单管理', '控制台>菜单管理', '菜单管理', 'common/menu.jsp', '&#xe656;', '11', '1', '1');
INSERT INTO `common_menu_info` VALUES ('3', 'user', '人员管理', '控制台>用户管理', '用户管理', 'common/user.jsp', '&#xe770;', '12', '1', '1');
INSERT INTO `common_menu_info` VALUES ('4', 'role', '角色管理', '控制台>角色管理', '角色管理', 'common/role.jsp', '&#xe66f;', '13', '1', '1');
INSERT INTO `common_menu_info` VALUES ('5', 'dept', '部门管理', '', '', 'common/dept.jsp', '&#xe630;', '14', '1', '1');
INSERT INTO `common_menu_info` VALUES ('7', 'log', '登录日志', '', '', 'common/login_log.jsp', '&#xe60e;', '15', '1', '1');
INSERT INTO `common_menu_info` VALUES ('8', 'tb', '图标库', '', '', 'common/icon.jsp', '&#xe650;', '17', '1', '1');

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
INSERT INTO `common_role_info` VALUES ('1', 'sysadmin', 'admin', '1', '2', '超级管理员');
INSERT INTO `common_role_info` VALUES ('2', 'deploy', 'test', '1', '1', 'test');

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
INSERT INTO `common_role_menu` VALUES ('10769146-c9a1-4d1a-a562-40e42de088ed', '2', '3');
INSERT INTO `common_role_menu` VALUES ('2f2952aa-a52f-4d4f-8c52-3c8ad0bf66d9', '1', '4');
INSERT INTO `common_role_menu` VALUES ('30fcaef9-99aa-4669-beae-19f2688f0e55', '1', '7');
INSERT INTO `common_role_menu` VALUES ('40b8a434-a1f1-4859-8b8e-eba98258bcf7', '1', '5');
INSERT INTO `common_role_menu` VALUES ('51e6a30e-a831-4e51-8f6d-07212963d4f2', '1', '3');
INSERT INTO `common_role_menu` VALUES ('9b724a4d-48ba-48ce-8226-df04d9f5906d', '1', '8');
INSERT INTO `common_role_menu` VALUES ('ac9e2265-167f-4a21-bdd3-23814561be14', '1', '2');
INSERT INTO `common_role_menu` VALUES ('ba616b75-31a1-4ca9-89c6-a6ec9a39809b', '2', '1');
INSERT INTO `common_role_menu` VALUES ('bc012c11-47ac-4c49-9286-912eb69c2996', '2', '4');
INSERT INTO `common_role_menu` VALUES ('c858c658-a0f3-4268-b5ea-585a86184c4b', '2', '2');
INSERT INTO `common_role_menu` VALUES ('d347c74f-344c-4331-9514-c9209a1fc994', '2', '5');
INSERT INTO `common_role_menu` VALUES ('f6859018-c7f7-444f-a704-962b4897a167', '1', '1');

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
  `user_dept_id` varchar(64) DEFAULT '1' COMMENT '所属部门',
  `user_order` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`user_id`,`login_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of common_user_info
-- ----------------------------
INSERT INTO `common_user_info` VALUES ('1', 'sysadmin', 'admin', 'c5aXH8F26a3ccc15123d10d4d58849b9cc88a7', 'xxxx', '15692719375', '1', '1', '1', '1');
INSERT INTO `common_user_info` VALUES ('756364e9-1e08-410c-94ec-4f9ae917528b', 'dengpp', 'dengpp', 'd01R7J48Rb62d8d662def054cd38ff45762f18', '', '15692719375', '1', '1', '1', '2');

-- ----------------------------
-- Table structure for common_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `common_user_login_log`;
CREATE TABLE `common_user_login_log` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `login_account` varchar(64) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of common_user_login_log
-- ----------------------------
INSERT INTO `common_user_login_log` VALUES ('1', 'admin', '2020-05-22 15:54:38');
INSERT INTO `common_user_login_log` VALUES ('2', 'admin', '2020-05-22 16:57:18');
INSERT INTO `common_user_login_log` VALUES ('3', 'admin', '2020-05-22 17:05:06');
INSERT INTO `common_user_login_log` VALUES ('4', 'admin', '2020-05-22 17:19:39');
INSERT INTO `common_user_login_log` VALUES ('5', 'dengpp', '2020-05-22 17:25:01');
INSERT INTO `common_user_login_log` VALUES ('6', 'dengpp', '2020-05-22 17:27:45');
INSERT INTO `common_user_login_log` VALUES ('7', 'admin', '2020-05-22 17:28:02');
INSERT INTO `common_user_login_log` VALUES ('8', 'admin', '2020-05-23 16:25:40');
INSERT INTO `common_user_login_log` VALUES ('9', 'admin', '2020-05-23 16:28:47');
INSERT INTO `common_user_login_log` VALUES ('10', 'admin', '2020-05-23 16:45:37');
INSERT INTO `common_user_login_log` VALUES ('11', 'admin', '2020-05-23 16:47:14');
INSERT INTO `common_user_login_log` VALUES ('12', 'admin', '2020-05-23 20:48:02');
INSERT INTO `common_user_login_log` VALUES ('13', 'admin', '2020-05-23 21:28:44');
INSERT INTO `common_user_login_log` VALUES ('14', 'admin', '2020-05-23 23:28:33');
INSERT INTO `common_user_login_log` VALUES ('15', 'admin', '2020-05-23 23:29:35');
INSERT INTO `common_user_login_log` VALUES ('16', 'admin', '2020-05-24 21:03:28');
INSERT INTO `common_user_login_log` VALUES ('17', 'admin', '2020-05-24 21:27:59');
INSERT INTO `common_user_login_log` VALUES ('18', 'admin', '2020-05-24 21:43:16');
INSERT INTO `common_user_login_log` VALUES ('19', 'admin', '2020-05-24 21:47:02');
INSERT INTO `common_user_login_log` VALUES ('20', 'admin', '2020-05-24 21:58:36');
INSERT INTO `common_user_login_log` VALUES ('21', 'admin', '2020-05-24 22:17:54');
INSERT INTO `common_user_login_log` VALUES ('22', 'admin', '2020-05-24 22:25:31');
INSERT INTO `common_user_login_log` VALUES ('23', 'admin', '2020-05-24 22:30:11');
INSERT INTO `common_user_login_log` VALUES ('24', 'dengpp', '2020-05-24 22:32:05');
INSERT INTO `common_user_login_log` VALUES ('25', 'admin', '2020-05-25 09:19:01');
INSERT INTO `common_user_login_log` VALUES ('26', 'admin', '2020-05-25 13:40:27');
INSERT INTO `common_user_login_log` VALUES ('27', 'dengpp', '2020-05-25 14:34:28');
INSERT INTO `common_user_login_log` VALUES ('28', 'dengpp', '2020-05-26 09:21:54');
INSERT INTO `common_user_login_log` VALUES ('29', 'admin', '2020-05-26 09:42:40');
INSERT INTO `common_user_login_log` VALUES ('30', 'admin', '2020-05-26 15:58:57');
INSERT INTO `common_user_login_log` VALUES ('31', 'admin', '2020-05-26 16:01:16');
INSERT INTO `common_user_login_log` VALUES ('32', 'admin', '2020-05-26 16:08:40');
INSERT INTO `common_user_login_log` VALUES ('33', 'admin', '2020-05-26 16:12:53');
INSERT INTO `common_user_login_log` VALUES ('34', 'admin', '2020-05-26 16:14:26');
INSERT INTO `common_user_login_log` VALUES ('35', 'admin', '2020-05-27 09:28:59');
INSERT INTO `common_user_login_log` VALUES ('36', 'admin', '2020-05-27 09:39:06');
INSERT INTO `common_user_login_log` VALUES ('37', 'dengpp', '2020-05-27 09:39:38');
INSERT INTO `common_user_login_log` VALUES ('38', 'admin', '2020-05-27 09:40:18');
INSERT INTO `common_user_login_log` VALUES ('39', 'admin', '2020-05-27 10:05:48');
INSERT INTO `common_user_login_log` VALUES ('40', 'admin', '2020-05-27 10:15:39');
INSERT INTO `common_user_login_log` VALUES ('41', 'admin', '2020-05-27 14:03:22');

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
INSERT INTO `common_user_role` VALUES ('a72f78ce-0915-4075-960d-a0befa23d908', '1', '1');
INSERT INTO `common_user_role` VALUES ('ef55e9d6-b220-4272-a977-5097219734db', '756364e9-1e08-410c-94ec-4f9ae917528b', '2');
