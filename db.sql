/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : authbase

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 10/06/2022 09:37:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for SYONLINE
-- ----------------------------
DROP TABLE IF EXISTS `SYONLINE`;
CREATE TABLE `SYONLINE`  (
  `ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `CREATEDATETIME` datetime NULL DEFAULT NULL,
  `IP` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `LOGINNAME` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `TYPE` varchar(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of SYONLINE
-- ----------------------------
INSERT INTO `SYONLINE` VALUES ('0c69d762-af59-4f12-bd36-ea7b8af99e78', '2022-05-22 12:00:43', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('0e7da881-7b39-45bd-bfec-41a568c4f9af', '2022-05-22 09:40:26', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('0fa0908b-a9f3-4f01-9297-a124baa83755', '2022-05-18 16:01:37', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('1655743a-c50c-49d2-bc1e-03be60fd7c12', '2022-05-22 09:42:21', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('1813a3f7-4a69-4090-85eb-a454df5cf678', '2022-06-08 11:12:45', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('1e022cad-38d3-4f86-8636-a13e36f514ab', '2022-06-08 11:11:17', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('2042a1e1-b953-4315-abb1-a4824c0c7b35', '2022-06-08 11:11:13', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('21cc2f68-d2bd-449b-aa83-2fc48f482187', '2022-06-10 00:35:10', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('2db49057-349e-49d7-a42e-a09a2ec05a09', '2022-05-22 09:42:31', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('2ec4552a-8e85-43f7-b80c-e7c770bffab3', '2022-05-22 09:41:31', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('30196021-2423-458b-b72e-3db1fc959c79', '2022-05-14 20:36:36', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('30602de4-33e7-48e6-baee-f8f6a573d508', '2022-05-22 09:40:41', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('3557ac09-8298-445c-bb27-7babeac95462', '2022-06-10 00:27:47', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('4c27ef37-8acd-412c-934b-3f779fcfb3d4', '2022-05-25 10:48:50', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('4ee9e9cb-90fb-4970-9f5e-a3ca9ea1c654', '2022-05-25 00:42:44', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('61f7ef20-daac-41e9-b439-bbe09b34e825', '2022-06-09 22:27:40', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('6ce4da2f-0833-40d3-bd8b-fe42146b05c6', '2022-05-15 18:16:59', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('72ce76e3-d025-43f6-83b9-458b74ad3c33', '2022-05-25 00:42:41', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('734aeec9-e371-4f2f-9046-9b2daefa2370', '2022-05-25 10:48:59', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('76071a92-e2fb-4c45-8a71-f44a70d0dd8e', '2022-05-22 09:22:26', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('76a3b3de-cb8c-4c03-a47a-ba61ee6296f1', '2022-05-28 11:59:41', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('76c7109c-af8c-4375-bb65-0f17cd2446dd', '2022-05-22 09:23:30', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('789fb284-14d4-47a7-b5d8-8a99b49ce7ac', '2022-06-10 00:25:44', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('7acf2f14-0594-4e15-8596-e4a5190a6228', '2022-05-29 22:57:36', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('80de6227-9a7e-45c5-a093-ca4950a8fc7d', '2022-05-22 09:40:38', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('83d2f4e9-f3e5-4242-bbf7-978428f19849', '2022-06-08 11:12:26', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('8455c194-84aa-405b-b1d8-4ff6d2cb7d84', '2022-05-22 09:22:15', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('8e13f90a-0875-4da7-863c-48dad3886415', '2022-05-22 09:23:20', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('93bbb856-f242-46b4-b246-15e650bb78fb', '2022-05-22 09:41:42', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('9a9f73b7-814c-40a2-ae7b-99c112c59068', '2022-05-22 09:40:51', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('9bbd086a-6869-4839-a3ef-d54e01f4ee41', '2022-05-27 08:42:15', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('9d5178da-359a-4491-a053-ff78d24311e6', '2022-05-22 12:00:38', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('afc2e04a-78a5-451f-9a1d-ce22d14b6478', '2022-05-21 08:58:47', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('b07a8877-cb98-4e44-b03c-ecf77f6e3aa9', '2022-05-18 16:01:35', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('badd62db-75f7-4c99-a649-548b18171d1d', '2022-05-22 09:40:16', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('c378da61-4e3f-4ccb-8653-e8a3829ab13b', '2022-06-10 00:27:49', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('c409ede4-02b5-42e1-a56f-4c6ea5f38abe', '2022-05-22 09:43:23', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('c741837f-da2a-4230-8b57-51914023dfa5', '2022-05-18 10:21:32', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('cdaebb6f-64a4-45a9-98b1-7f7a27c049a7', '2022-05-22 09:40:51', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('d1c21a0b-2387-48a5-98dc-9f7f59de5049', '2022-05-22 09:22:26', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('da041fd0-f6fc-4211-8cf9-5b3de65dd678', '2022-05-28 20:58:08', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('dc2e40ab-f748-48e3-b88b-d97ae7251502', '2022-06-08 10:41:31', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('de70466a-4441-4488-aa05-6b412782a562', '2022-05-22 09:39:46', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('e29415a5-7597-4d28-8876-d8388ed99af8', '2022-06-10 00:35:07', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('e38a4bc6-ec6e-41c7-94bd-ed34e58acdee', '2022-06-10 00:25:25', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('e5459bbe-aead-420f-a13b-b11e7a41d022', '2022-05-22 09:30:52', '127.0.0.1', 'admin', '1');
INSERT INTO `SYONLINE` VALUES ('e61373c3-4440-47f5-a57c-8a49a78b33ad', '2022-05-18 16:12:00', '127.0.0.1', 'admin', '0');
INSERT INTO `SYONLINE` VALUES ('f76feb30-30db-4bec-a0a0-b45b9da88550', '2022-05-18 16:12:02', '127.0.0.1', 'admin', '1');

-- ----------------------------
-- Table structure for SYORGANIZATION
-- ----------------------------
DROP TABLE IF EXISTS `SYORGANIZATION`;
CREATE TABLE `SYORGANIZATION`  (
  `ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `ADDRESS` varchar(200) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `CODE` varchar(200) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `CREATEDATETIME` datetime NULL DEFAULT NULL,
  `ICONCLS` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `NAME` varchar(200) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `SEQ` int NULL DEFAULT NULL,
  `UPDATEDATETIME` datetime NULL DEFAULT NULL,
  `SYORGANIZATION_ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `LEADER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `PHONE` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_acf7qlb04quthktalwx8c7q69`(`SYORGANIZATION_ID`) USING BTREE,
  CONSTRAINT `FK_acf7qlb04quthktalwx8c7q69` FOREIGN KEY (`SYORGANIZATION_ID`) REFERENCES `SYORGANIZATION` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of SYORGANIZATION
-- ----------------------------
INSERT INTO `SYORGANIZATION` VALUES ('0', NULL, NULL, '2016-11-28 10:34:54', 'ext-icon-bricks', '总部', 100, '2016-11-28 10:35:12', NULL, NULL, NULL, NULL);
INSERT INTO `SYORGANIZATION` VALUES ('5477d9a9-e41e-485f-bb08-697e8facef88', NULL, NULL, '2022-05-22 09:59:33', NULL, '南京分公司', 1, '2022-05-24 23:43:51', '0', 'dd', '18905189016', 'ss@ada.com');
INSERT INTO `SYORGANIZATION` VALUES ('ce627e90-57d6-4ed4-a789-1f3dd467ae7d', NULL, NULL, '2022-05-24 23:54:10', NULL, '上海分公司', 2, '2022-05-24 23:56:21', '0', 'jack', NULL, NULL);

-- ----------------------------
-- Table structure for SYORGANIZATION_SYRESOURCE
-- ----------------------------
DROP TABLE IF EXISTS `SYORGANIZATION_SYRESOURCE`;
CREATE TABLE `SYORGANIZATION_SYRESOURCE`  (
  `SYRESOURCE_ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `SYORGANIZATION_ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  PRIMARY KEY (`SYORGANIZATION_ID`, `SYRESOURCE_ID`) USING BTREE,
  INDEX `FK_acpjp8a7fjo0cnn02eb0ia6uf`(`SYORGANIZATION_ID`) USING BTREE,
  INDEX `FK_m4mfglk7odi78d8pk9pif44vc`(`SYRESOURCE_ID`) USING BTREE,
  CONSTRAINT `FK_acpjp8a7fjo0cnn02eb0ia6uf` FOREIGN KEY (`SYORGANIZATION_ID`) REFERENCES `SYORGANIZATION` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_m4mfglk7odi78d8pk9pif44vc` FOREIGN KEY (`SYRESOURCE_ID`) REFERENCES `SYRESOURCE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of SYORGANIZATION_SYRESOURCE
-- ----------------------------

-- ----------------------------
-- Table structure for SYRESOURCE
-- ----------------------------
DROP TABLE IF EXISTS `SYRESOURCE`;
CREATE TABLE `SYRESOURCE`  (
  `ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `CREATEDATETIME` datetime NULL DEFAULT NULL,
  `DESCRIPTION` varchar(200) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `ICONCLS` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `NAME` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `SEQ` int NULL DEFAULT NULL,
  `TARGET` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `UPDATEDATETIME` datetime NULL DEFAULT NULL,
  `PATH` varchar(200) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `URL` varchar(200) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `PERMS` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '权限标识',
  `SYRESOURCE_ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `SYRESOURCETYPE_ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_n8kk2inhw4y4gax3nra2etfup`(`SYRESOURCE_ID`) USING BTREE,
  INDEX `FK_93qfpiiuk3rwb32gc5mcmmlgh`(`SYRESOURCETYPE_ID`) USING BTREE,
  CONSTRAINT `FK_93qfpiiuk3rwb32gc5mcmmlgh` FOREIGN KEY (`SYRESOURCETYPE_ID`) REFERENCES `SYRESOURCETYPE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_n8kk2inhw4y4gax3nra2etfup` FOREIGN KEY (`SYRESOURCE_ID`) REFERENCES `SYRESOURCE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of SYRESOURCE
-- ----------------------------
INSERT INTO `SYRESOURCE` VALUES ('27fda67f-61d1-4fe6-8eea-d796a848ab67', '2022-05-28 12:54:39', NULL, 'edit', '参数设置', 6, '', '2022-05-28 12:54:39', 'config', 'system/config/index', 'system:config:list', 'xtgl', '3');
INSERT INTO `SYRESOURCE` VALUES ('37ac3cd3-560b-49b3-ae86-96d1963e9db6', '2022-05-28 12:55:59', NULL, NULL, '参数修改', 3, NULL, '2022-05-28 12:55:59', NULL, NULL, 'system:config:edit', '27fda67f-61d1-4fe6-8eea-d796a848ab67', '1');
INSERT INTO `SYRESOURCE` VALUES ('4621e9f8-e7c6-4c2b-8172-3d8c8ea75371', '2022-05-28 12:55:24', NULL, NULL, '参数新增', 2, NULL, '2022-05-28 12:55:24', NULL, NULL, 'system:config:add', '27fda67f-61d1-4fe6-8eea-d796a848ab67', '1');
INSERT INTO `SYRESOURCE` VALUES ('726c7c1e-06f8-4c3e-b9e1-95778a430c07', '2022-05-28 12:51:16', NULL, NULL, '字典查询', 1, NULL, '2022-05-28 12:51:16', NULL, NULL, 'system:dict:query', 'ffb8cf26-1049-43ee-9dd5-16e5742ce9d5', '1');
INSERT INTO `SYRESOURCE` VALUES ('b95cae69-6389-4ebc-b613-bee7aac5f730', '2022-05-28 12:52:26', NULL, NULL, '字典修改', 3, NULL, '2022-05-28 12:52:26', NULL, NULL, 'system:dict:edit', 'ffb8cf26-1049-43ee-9dd5-16e5742ce9d5', '1');
INSERT INTO `SYRESOURCE` VALUES ('cc7ff599-a588-40b3-951d-ce9dd2490482', '2022-05-28 12:53:26', NULL, NULL, '字典导出', 5, NULL, '2022-05-28 12:53:26', NULL, NULL, 'system:dict:export', 'ffb8cf26-1049-43ee-9dd5-16e5742ce9d5', '1');
INSERT INTO `SYRESOURCE` VALUES ('cssc', '2022-05-28 12:56:23', NULL, NULL, '参数删除', 4, NULL, '2022-05-28 12:56:23', NULL, NULL, 'system:config:remove', '27fda67f-61d1-4fe6-8eea-d796a848ab67', '1');
INSERT INTO `SYRESOURCE` VALUES ('d60df8ae-86ee-4879-b9b9-2fe79f146d31', '2022-05-28 12:55:02', NULL, NULL, '参数查询', 1, NULL, '2022-05-28 12:55:02', NULL, NULL, 'system:config:query', '27fda67f-61d1-4fe6-8eea-d796a848ab67', '1');
INSERT INTO `SYRESOURCE` VALUES ('dd41b52b-272c-49ac-b045-b05392890a8d', '2022-05-28 12:56:49', NULL, NULL, '参数导出', 5, NULL, '2022-05-28 12:56:49', NULL, NULL, 'system:config:export', '27fda67f-61d1-4fe6-8eea-d796a848ab67', '1');
INSERT INTO `SYRESOURCE` VALUES ('edc3358e-b9c5-462f-8a70-7b1c7d7f2c26', '2022-05-28 12:51:53', NULL, NULL, '字典新增', 2, NULL, '2022-05-28 12:51:53', NULL, NULL, 'system:dict:add', 'ffb8cf26-1049-43ee-9dd5-16e5742ce9d5', '1');
INSERT INTO `SYRESOURCE` VALUES ('ffb8cf26-1049-43ee-9dd5-16e5742ce9d5', '2022-05-28 12:50:37', NULL, 'dict', '字典管理', 5, '', '2022-05-28 12:50:37', 'dict', 'system/dict/index', 'system:dict:list', 'xtgl', '3');
INSERT INTO `SYRESOURCE` VALUES ('jgbj', '2015-08-25 10:34:53', '编辑机构', 'ext-icon-bullet_wrench', '编辑机构', 2, '', '2022-05-25 00:39:56', NULL, '/base/syorganization!update', 'system:dept:edit', 'jggl', '1');
INSERT INTO `SYRESOURCE` VALUES ('jgck', '2015-08-25 10:34:53', '查看机构', 'ext-icon-bullet_wrench', '查看机构', 4, '', '2015-08-25 10:34:53', NULL, '/base/syorganization!getById', 'system:dept:query', 'jggl', '1');
INSERT INTO `SYRESOURCE` VALUES ('jggl', '2015-08-25 10:34:53', '管理系统中用户的机构', 'tree', '机构管理', 4, '', '2022-05-25 00:40:04', 'dept', 'system/dept/index', 'system:dept:list', 'xtgl', '0');
INSERT INTO `SYRESOURCE` VALUES ('jglb', '2015-08-25 10:34:53', '查询机构列表', 'ext-icon-bullet_wrench', '机构列表', 0, '', '2016-11-28 14:09:52', NULL, '/base/syorganization!treeGrid', 'system:dept:list', 'jggl', '1');
INSERT INTO `SYRESOURCE` VALUES ('jgsc', '2015-08-25 10:34:53', '删除机构', 'ext-icon-bullet_wrench', '删除机构', 3, '', '2015-08-25 10:34:53', NULL, '/base/syorganization!delete', 'system:dept:remove', 'jggl', '1');
INSERT INTO `SYRESOURCE` VALUES ('jgsq', '2015-08-25 10:34:53', '机构授权', 'ext-icon-bullet_wrench', '机构授权', 5, '', '2015-08-25 10:34:53', NULL, '/base/syorganization!grant', NULL, 'jggl', '1');
INSERT INTO `SYRESOURCE` VALUES ('jgtj', '2015-08-25 10:34:53', '添加机构', 'ext-icon-bullet_wrench', '添加机构', 1, '', '2015-08-25 10:34:53', NULL, '/base/syorganization!save', 'system:dept:add', 'jggl', '1');
INSERT INTO `SYRESOURCE` VALUES ('jsbj', '2015-08-25 10:34:53', '编辑角色', 'ext-icon-bullet_wrench', '编辑角色', 2, '', '2015-08-25 10:34:53', NULL, '/base/syrole!update', 'system:role:edit', 'jsgl', '1');
INSERT INTO `SYRESOURCE` VALUES ('jsck', '2015-08-25 10:34:53', '查看角色', 'ext-icon-bullet_wrench', '查看角色', 4, '', '2015-08-25 10:34:53', NULL, '/base/syrole!getById', 'system:role:query', 'jsgl', '1');
INSERT INTO `SYRESOURCE` VALUES ('jsgl', '2015-08-25 10:34:53', '管理系统中用户的角色', 'peoples', '角色管理', 2, '', '2015-08-25 10:34:53', 'role', 'system/role/index', 'system:role:list', 'xtgl', '0');
INSERT INTO `SYRESOURCE` VALUES ('jslb', '2015-08-25 10:34:53', '查询角色列表', 'ext-icon-bullet_wrench', '角色列表', 0, '', '2015-08-25 10:34:53', NULL, '/base/syrole!grid', 'system:role:list', 'jsgl', '1');
INSERT INTO `SYRESOURCE` VALUES ('jssc', '2015-08-25 10:34:53', '删除角色', 'ext-icon-bullet_wrench', '删除角色', 3, '', '2015-08-25 10:34:53', NULL, '/base/syrole!delete', 'system:role:remove', 'jsgl', '1');
INSERT INTO `SYRESOURCE` VALUES ('jssq', '2015-08-25 10:34:53', '角色授权', 'ext-icon-bullet_wrench', '角色授权', 5, '', '2015-08-25 10:34:53', NULL, '/base/syrole!grant', NULL, 'jsgl', '1');
INSERT INTO `SYRESOURCE` VALUES ('jstj', '2015-08-25 10:34:53', '添加角色', 'ext-icon-bullet_wrench', '添加角色', 1, '', '2015-08-25 10:34:53', NULL, '/base/syrole!save', 'system:role:add', 'jsgl', '1');
INSERT INTO `SYRESOURCE` VALUES ('online', '2015-08-25 10:34:53', '监控用户登录、注销', 'ext-icon-chart_line', '登录历史', 1, '', '2022-06-10 00:53:22', 'logininfor', 'monitor/logininfor/index', 'monitor:logininfor:list', 'xtjk', '0');
INSERT INTO `SYRESOURCE` VALUES ('onlineGrid', '2015-08-25 10:34:53', '用户登录、注销历史记录列表', 'ext-icon-bullet_wrench', '用户登录历史列表', 1, '', '2022-05-28 13:16:37', NULL, '/base/syonline!grid', 'monitor:logininfor:list', 'online', '1');
INSERT INTO `SYRESOURCE` VALUES ('xtgl', '2015-08-25 10:34:53', '管理系统的资源、角色、机构、用户等信息', 'system', '系统管理', 1, '', '2022-05-28 13:16:12', '/system', NULL, NULL, NULL, '3');
INSERT INTO `SYRESOURCE` VALUES ('xtjk', '2015-08-25 10:34:53', '监控系统运行情况等信息', 'monitor', '系统监控', 2, '', '2022-06-10 00:48:47', '/system/log', '', '', NULL, '0');
INSERT INTO `SYRESOURCE` VALUES ('yhbj', '2015-08-25 10:34:53', '编辑用户', 'ext-icon-bullet_wrench', '编辑用户', 2, '', '2015-08-25 10:34:53', NULL, '/base/syuser!update', 'system:user:edit', 'yhgl', '1');
INSERT INTO `SYRESOURCE` VALUES ('yhck', '2015-08-25 10:34:53', '查看用户', 'ext-icon-bullet_wrench', '查看用户', 4, '', '2015-08-25 10:34:53', NULL, '/base/syuser!getById', 'system:user:query', 'yhgl', '1');
INSERT INTO `SYRESOURCE` VALUES ('yhgl', '2015-08-25 10:34:53', '管理系统中用户的用户', 'user', '用户管理', 1, '', '2022-05-25 00:48:17', 'user', 'system/user/index', 'system:user:list', 'xtgl', '0');
INSERT INTO `SYRESOURCE` VALUES ('yhjg', '2015-08-25 10:34:53', '编辑用户机构', 'ext-icon-bullet_wrench', '用户机构', 6, '', '2015-08-25 10:34:53', NULL, '/base/syuser!grantOrganization', 'system:dept:edit', 'yhgl', '1');
INSERT INTO `SYRESOURCE` VALUES ('yhjs', '2015-08-25 10:34:53', '编辑用户角色', 'ext-icon-bullet_wrench', '用户角色', 5, '', '2015-08-25 10:34:53', NULL, '/base/syuser!grantRole', 'system:role:edit', 'yhgl', '1');
INSERT INTO `SYRESOURCE` VALUES ('yhlb', '2015-08-25 10:34:53', '查询用户列表', 'ext-icon-bullet_wrench', '用户列表', 0, '', '2015-08-25 10:34:53', NULL, '/base/syuser!grid', 'system:user:list', 'yhgl', '1');
INSERT INTO `SYRESOURCE` VALUES ('yhsc', '2015-08-25 10:34:53', '删除用户', 'ext-icon-bullet_wrench', '删除用户', 3, '', '2015-08-25 10:34:53', NULL, '/base/syuser!delete', 'system:user:remove', 'yhgl', '1');
INSERT INTO `SYRESOURCE` VALUES ('yhtj', '2015-08-25 10:34:53', '添加用户', 'ext-icon-bullet_wrench', '添加用户', 1, '', '2015-08-25 10:34:53', NULL, '/base/syuser!save', 'system:user:add', 'yhgl', '1');
INSERT INTO `SYRESOURCE` VALUES ('zdsc', '2022-05-28 12:52:58', NULL, NULL, '字典删除', 4, NULL, '2022-05-28 12:52:58', NULL, NULL, 'system:dict:remove', 'ffb8cf26-1049-43ee-9dd5-16e5742ce9d5', '1');
INSERT INTO `SYRESOURCE` VALUES ('zybj', '2015-08-25 10:34:53', '编辑资源', 'ext-icon-bullet_wrench', '编辑资源', 2, '', '2015-08-25 10:34:53', NULL, '/base/syresource!update', 'system:menu:edit', 'zygl', '1');
INSERT INTO `SYRESOURCE` VALUES ('zyck', '2015-08-25 10:34:53', '查看资源', 'ext-icon-bullet_wrench', '查看资源', 4, '', '2015-08-25 10:34:53', NULL, '/base/syresource!getById', 'system:menu:query', 'zygl', '1');
INSERT INTO `SYRESOURCE` VALUES ('zygl', '2015-08-25 10:34:53', '管理系统的资源', 'tree-table', '资源管理', 3, '', '2022-05-25 00:48:32', 'menu', 'system/menu/index', 'system:menu:list', 'xtgl', '0');
INSERT INTO `SYRESOURCE` VALUES ('zylb', '2015-08-25 10:34:53', '查询资源', 'ext-icon-bullet_wrench', '资源列表', 0, '', '2015-08-25 10:34:53', NULL, '/base/syresource!treeGrid', 'system:menu:query', 'zygl', '1');
INSERT INTO `SYRESOURCE` VALUES ('zysc', '2015-08-25 10:34:53', '删除资源', 'ext-icon-bullet_wrench', '删除资源', 3, '', '2015-08-25 10:34:53', NULL, '/base/syresource!delete', 'system:menu:remove', 'zygl', '1');
INSERT INTO `SYRESOURCE` VALUES ('zytj', '2015-08-25 10:34:53', '添加资源', 'ext-icon-bullet_wrench', '添加资源', 1, '', '2015-08-25 10:34:53', NULL, '/base/syresource!save', 'system:menu:add', 'zygl', '1');

-- ----------------------------
-- Table structure for SYRESOURCETYPE
-- ----------------------------
DROP TABLE IF EXISTS `SYRESOURCETYPE`;
CREATE TABLE `SYRESOURCETYPE`  (
  `ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `CREATEDATETIME` datetime NULL DEFAULT NULL,
  `DESCRIPTION` varchar(200) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `NAME` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `UPDATEDATETIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of SYRESOURCETYPE
-- ----------------------------
INSERT INTO `SYRESOURCETYPE` VALUES ('0', '2015-08-25 10:34:53', '菜单类型会显示在系统首页左侧菜单中', '菜单', '2015-08-25 10:34:53');
INSERT INTO `SYRESOURCETYPE` VALUES ('1', '2015-08-25 10:34:53', '功能类型不会显示在系统首页左侧菜单中', '功能', '2015-08-25 10:34:53');
INSERT INTO `SYRESOURCETYPE` VALUES ('3', '2022-05-15 10:27:08', NULL, '目录', '2022-05-15 10:27:18');

-- ----------------------------
-- Table structure for SYROLE
-- ----------------------------
DROP TABLE IF EXISTS `SYROLE`;
CREATE TABLE `SYROLE`  (
  `ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `CREATEDATETIME` datetime NULL DEFAULT NULL,
  `DESCRIPTION` varchar(200) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `ICONCLS` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `NAME` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `SEQ` int NULL DEFAULT NULL,
  `UPDATEDATETIME` datetime NULL DEFAULT NULL,
  `ROLEKEY` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `DATASCOPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of SYROLE
-- ----------------------------
INSERT INTO `SYROLE` VALUES ('0', '2015-08-25 10:34:53', '拥有系统所有权限', NULL, '超管', 0, '2022-06-10 00:27:23', 'superadmin', '1');
INSERT INTO `SYROLE` VALUES ('19f00d46-8f1b-45b5-b7b7-6197d7b8cb33', '2016-11-28 14:24:00', NULL, NULL, '管理员', 100, '2022-06-10 00:27:41', 'admin', '1');
INSERT INTO `SYROLE` VALUES ('f4e1b151-a171-4705-9154-503a046cb72a', '2022-05-29 13:29:38', NULL, NULL, '只读用户', 1, '2022-06-10 00:13:55', 'readonly', '2');

-- ----------------------------
-- Table structure for SYROLE_SYORGANIZATION
-- ----------------------------
DROP TABLE IF EXISTS `SYROLE_SYORGANIZATION`;
CREATE TABLE `SYROLE_SYORGANIZATION`  (
  `SYROLE_ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `SYORGANIZATION_ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  PRIMARY KEY (`SYORGANIZATION_ID`, `SYROLE_ID`) USING BTREE,
  INDEX `FK_kkrartsovl2frhfvriqdi7jwl`(`SYORGANIZATION_ID`) USING BTREE,
  INDEX `FK_r139h669pg4ts6mbvn3ip5472`(`SYROLE_ID`) USING BTREE,
  CONSTRAINT `SYROLE_SYORGANIZATION_ibfk_1` FOREIGN KEY (`SYORGANIZATION_ID`) REFERENCES `SYORGANIZATION` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `SYROLE_SYORGANIZATION_ibfk_2` FOREIGN KEY (`SYROLE_ID`) REFERENCES `SYROLE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SYROLE_SYORGANIZATION
-- ----------------------------
INSERT INTO `SYROLE_SYORGANIZATION` VALUES ('f4e1b151-a171-4705-9154-503a046cb72a', '5477d9a9-e41e-485f-bb08-697e8facef88');

-- ----------------------------
-- Table structure for SYROLE_SYRESOURCE
-- ----------------------------
DROP TABLE IF EXISTS `SYROLE_SYRESOURCE`;
CREATE TABLE `SYROLE_SYRESOURCE`  (
  `SYROLE_ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `SYRESOURCE_ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  PRIMARY KEY (`SYRESOURCE_ID`, `SYROLE_ID`) USING BTREE,
  INDEX `FK_kkrartsovl2frhfvriqdi7jwl`(`SYRESOURCE_ID`) USING BTREE,
  INDEX `FK_r139h669pg4ts6mbvn3ip5472`(`SYROLE_ID`) USING BTREE,
  CONSTRAINT `FK_kkrartsovl2frhfvriqdi7jwl` FOREIGN KEY (`SYRESOURCE_ID`) REFERENCES `SYRESOURCE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_r139h669pg4ts6mbvn3ip5472` FOREIGN KEY (`SYROLE_ID`) REFERENCES `SYROLE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of SYROLE_SYRESOURCE
-- ----------------------------
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', '27fda67f-61d1-4fe6-8eea-d796a848ab67');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('f4e1b151-a171-4705-9154-503a046cb72a', '27fda67f-61d1-4fe6-8eea-d796a848ab67');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', '37ac3cd3-560b-49b3-ae86-96d1963e9db6');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', '4621e9f8-e7c6-4c2b-8172-3d8c8ea75371');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', '726c7c1e-06f8-4c3e-b9e1-95778a430c07');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('f4e1b151-a171-4705-9154-503a046cb72a', '726c7c1e-06f8-4c3e-b9e1-95778a430c07');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'b95cae69-6389-4ebc-b613-bee7aac5f730');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'cc7ff599-a588-40b3-951d-ce9dd2490482');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'cssc');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'd60df8ae-86ee-4879-b9b9-2fe79f146d31');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('f4e1b151-a171-4705-9154-503a046cb72a', 'd60df8ae-86ee-4879-b9b9-2fe79f146d31');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'dd41b52b-272c-49ac-b045-b05392890a8d');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'edc3358e-b9c5-462f-8a70-7b1c7d7f2c26');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'ffb8cf26-1049-43ee-9dd5-16e5742ce9d5');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('f4e1b151-a171-4705-9154-503a046cb72a', 'ffb8cf26-1049-43ee-9dd5-16e5742ce9d5');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'jgbj');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'jgck');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'jggl');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('f4e1b151-a171-4705-9154-503a046cb72a', 'jggl');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'jglb');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('f4e1b151-a171-4705-9154-503a046cb72a', 'jglb');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'jgsc');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'jgsq');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'jgtj');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'jsbj');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'jsck');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'jsgl');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('f4e1b151-a171-4705-9154-503a046cb72a', 'jsgl');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'jslb');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('f4e1b151-a171-4705-9154-503a046cb72a', 'jslb');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'jssc');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'jssq');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'jstj');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'online');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'onlineGrid');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'xtgl');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('f4e1b151-a171-4705-9154-503a046cb72a', 'xtgl');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'xtjk');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'yhbj');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'yhck');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'yhgl');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('f4e1b151-a171-4705-9154-503a046cb72a', 'yhgl');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'yhjg');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'yhjs');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'yhlb');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('f4e1b151-a171-4705-9154-503a046cb72a', 'yhlb');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'yhsc');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'yhtj');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'zdsc');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'zybj');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'zyck');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'zygl');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('f4e1b151-a171-4705-9154-503a046cb72a', 'zygl');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'zylb');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('f4e1b151-a171-4705-9154-503a046cb72a', 'zylb');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'zysc');
INSERT INTO `SYROLE_SYRESOURCE` VALUES ('0', 'zytj');

-- ----------------------------
-- Table structure for SYS_CONFIG
-- ----------------------------
DROP TABLE IF EXISTS `SYS_CONFIG`;
CREATE TABLE `SYS_CONFIG`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of SYS_CONFIG
-- ----------------------------
INSERT INTO `SYS_CONFIG` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-05-14 14:04:21', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `SYS_CONFIG` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-05-14 14:04:21', '', NULL, '初始化密码 123456');
INSERT INTO `SYS_CONFIG` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-05-14 14:04:21', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `SYS_CONFIG` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2022-05-14 14:04:21', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `SYS_CONFIG` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-05-14 14:04:21', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for SYS_DICT_DATA
-- ----------------------------
DROP TABLE IF EXISTS `SYS_DICT_DATA`;
CREATE TABLE `SYS_DICT_DATA`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE,
  INDEX `dict_type`(`dict_type`) USING BTREE,
  CONSTRAINT `SYS_DICT_DATA_ibfk_1` FOREIGN KEY (`dict_type`) REFERENCES `SYS_DICT_TYPE` (`dict_type`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of SYS_DICT_DATA
-- ----------------------------
INSERT INTO `SYS_DICT_DATA` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '性别男');
INSERT INTO `SYS_DICT_DATA` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '性别女');
INSERT INTO `SYS_DICT_DATA` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '性别未知');
INSERT INTO `SYS_DICT_DATA` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '显示菜单');
INSERT INTO `SYS_DICT_DATA` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '隐藏菜单');
INSERT INTO `SYS_DICT_DATA` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '正常状态');
INSERT INTO `SYS_DICT_DATA` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '停用状态');
INSERT INTO `SYS_DICT_DATA` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '正常状态');
INSERT INTO `SYS_DICT_DATA` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '停用状态');
INSERT INTO `SYS_DICT_DATA` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '默认分组');
INSERT INTO `SYS_DICT_DATA` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '系统分组');
INSERT INTO `SYS_DICT_DATA` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '系统默认是');
INSERT INTO `SYS_DICT_DATA` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '系统默认否');
INSERT INTO `SYS_DICT_DATA` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '通知');
INSERT INTO `SYS_DICT_DATA` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '公告');
INSERT INTO `SYS_DICT_DATA` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '正常状态');
INSERT INTO `SYS_DICT_DATA` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '关闭状态');
INSERT INTO `SYS_DICT_DATA` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '新增操作');
INSERT INTO `SYS_DICT_DATA` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '修改操作');
INSERT INTO `SYS_DICT_DATA` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '删除操作');
INSERT INTO `SYS_DICT_DATA` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '授权操作');
INSERT INTO `SYS_DICT_DATA` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '导出操作');
INSERT INTO `SYS_DICT_DATA` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '导入操作');
INSERT INTO `SYS_DICT_DATA` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '强退操作');
INSERT INTO `SYS_DICT_DATA` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '生成操作');
INSERT INTO `SYS_DICT_DATA` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '清空操作');
INSERT INTO `SYS_DICT_DATA` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '正常状态');
INSERT INTO `SYS_DICT_DATA` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '停用状态');
INSERT INTO `SYS_DICT_DATA` VALUES (100, 0, '登录', '1', 'sys_login_type', NULL, 'default', NULL, '0', 'admin', '2022-06-10 00:29:31', 'admin', '2022-06-10 00:29:58', NULL);
INSERT INTO `SYS_DICT_DATA` VALUES (101, 1, '注销', '0', 'sys_login_type', NULL, 'default', NULL, '0', 'admin', '2022-06-10 00:29:48', NULL, '2022-06-10 00:29:48', NULL);

-- ----------------------------
-- Table structure for SYS_DICT_TYPE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_DICT_TYPE`;
CREATE TABLE `SYS_DICT_TYPE`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of SYS_DICT_TYPE
-- ----------------------------
INSERT INTO `SYS_DICT_TYPE` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '用户性别列表');
INSERT INTO `SYS_DICT_TYPE` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '菜单状态列表');
INSERT INTO `SYS_DICT_TYPE` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '系统开关列表');
INSERT INTO `SYS_DICT_TYPE` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '任务状态列表');
INSERT INTO `SYS_DICT_TYPE` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '任务分组列表');
INSERT INTO `SYS_DICT_TYPE` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '系统是否列表');
INSERT INTO `SYS_DICT_TYPE` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '通知类型列表');
INSERT INTO `SYS_DICT_TYPE` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '通知状态列表');
INSERT INTO `SYS_DICT_TYPE` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '操作类型列表');
INSERT INTO `SYS_DICT_TYPE` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '登录状态列表');
INSERT INTO `SYS_DICT_TYPE` VALUES (11, '登录日志类型', 'sys_login_type', '0', 'admin', '2022-06-10 00:28:26', 'admin', '2022-06-10 00:28:26', NULL);

-- ----------------------------
-- Table structure for SYUSER
-- ----------------------------
DROP TABLE IF EXISTS `SYUSER`;
CREATE TABLE `SYUSER`  (
  `ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `AGE` int NULL DEFAULT NULL,
  `CREATEDATETIME` datetime NULL DEFAULT NULL,
  `LOGINNAME` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `NAME` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `PHOTO` varchar(200) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `PWD` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `SEX` varchar(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `UPDATEDATETIME` datetime NULL DEFAULT NULL,
  `EMPLOYDATE` datetime NULL DEFAULT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `PHONENUMBER` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `UK_eiov1gsncrds3rean3dmu822p`(`LOGINNAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of SYUSER
-- ----------------------------
INSERT INTO `SYUSER` VALUES ('0', 30, '2015-08-25 10:34:54', 'admin', 'admin', '', 'e10adc3949ba59abbe56e057f20f883e', '1', '2022-06-08 11:04:52', NULL, 'test@test.com', '18988888888');
INSERT INTO `SYUSER` VALUES ('0f21b40c-5323-46e5-9200-0364eab3481e', NULL, '2022-05-29 09:28:57', 'test', 'test', NULL, 'e10adc3949ba59abbe56e057f20f883e', '0', '2022-06-10 09:19:56', '2022-05-29 09:28:57', 'test@test.com', '18988888888');

-- ----------------------------
-- Table structure for SYUSER_SYORGANIZATION
-- ----------------------------
DROP TABLE IF EXISTS `SYUSER_SYORGANIZATION`;
CREATE TABLE `SYUSER_SYORGANIZATION`  (
  `SYUSER_ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `SYORGANIZATION_ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  PRIMARY KEY (`SYORGANIZATION_ID`, `SYUSER_ID`) USING BTREE,
  INDEX `FK_14ewqc5wtscac0dd5rswrm5j2`(`SYORGANIZATION_ID`) USING BTREE,
  INDEX `FK_63bdmtxwlk259id13rp4iryy`(`SYUSER_ID`) USING BTREE,
  CONSTRAINT `FK_14ewqc5wtscac0dd5rswrm5j2` FOREIGN KEY (`SYORGANIZATION_ID`) REFERENCES `SYORGANIZATION` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_63bdmtxwlk259id13rp4iryy` FOREIGN KEY (`SYUSER_ID`) REFERENCES `SYUSER` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of SYUSER_SYORGANIZATION
-- ----------------------------
INSERT INTO `SYUSER_SYORGANIZATION` VALUES ('0', '0');
INSERT INTO `SYUSER_SYORGANIZATION` VALUES ('346e8333-b644-4939-8b06-f23654963c6a', '0');
INSERT INTO `SYUSER_SYORGANIZATION` VALUES ('0f21b40c-5323-46e5-9200-0364eab3481e', '5477d9a9-e41e-485f-bb08-697e8facef88');

-- ----------------------------
-- Table structure for SYUSER_SYROLE
-- ----------------------------
DROP TABLE IF EXISTS `SYUSER_SYROLE`;
CREATE TABLE `SYUSER_SYROLE`  (
  `SYUSER_ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `SYROLE_ID` varchar(36) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  PRIMARY KEY (`SYROLE_ID`, `SYUSER_ID`) USING BTREE,
  INDEX `FK_j7iwtgslc2esrjx0ptieleoko`(`SYROLE_ID`) USING BTREE,
  INDEX `FK_1pi4p5h4y5ghbs5f4gdlgn620`(`SYUSER_ID`) USING BTREE,
  CONSTRAINT `FK_1pi4p5h4y5ghbs5f4gdlgn620` FOREIGN KEY (`SYUSER_ID`) REFERENCES `SYUSER` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_j7iwtgslc2esrjx0ptieleoko` FOREIGN KEY (`SYROLE_ID`) REFERENCES `SYROLE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of SYUSER_SYROLE
-- ----------------------------
INSERT INTO `SYUSER_SYROLE` VALUES ('0', '0');
INSERT INTO `SYUSER_SYROLE` VALUES ('0', '19f00d46-8f1b-45b5-b7b7-6197d7b8cb33');
INSERT INTO `SYUSER_SYROLE` VALUES ('346e8333-b644-4939-8b06-f23654963c6a', '19f00d46-8f1b-45b5-b7b7-6197d7b8cb33');
INSERT INTO `SYUSER_SYROLE` VALUES ('0', 'f4e1b151-a171-4705-9154-503a046cb72a');

SET FOREIGN_KEY_CHECKS = 1;
