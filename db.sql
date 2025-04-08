-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.29 - MySQL Community Server - GPL
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  12.0.0.6468
-- --------------------------------------------------------


-- 导出 authbase 的数据库结构
CREATE DATABASE IF NOT EXISTS `authbase`
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
USE `authbase`;

-- 导出  表 authbase.SYONLINE 结构
CREATE TABLE IF NOT EXISTS `SYONLINE` (
  `ID` varchar(36)  NOT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `IP` varchar(100)  DEFAULT NULL,
  `LOGINNAME` varchar(100)  DEFAULT NULL,
  `TYPE` varchar(1)  DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ;

-- 正在导出表  authbase.SYONLINE 的数据：~2 rows (大约)
INSERT INTO `SYONLINE` (`ID`, `CREATEDATETIME`, `IP`, `LOGINNAME`, `TYPE`) VALUES
	('0c69d762-af59-4f12-bd36-ea7b8af99e78', '2022-05-22 12:00:43', '127.0.0.1', 'admin', '1'),
	('48c530fa-0a73-4c1c-b0de-adec5c4a3447', '2023-05-16 19:49:12', '127.0.0.1', 'admin', '1');

-- 导出  表 authbase.SYORGANIZATION 结构
CREATE TABLE IF NOT EXISTS `SYORGANIZATION` (
  `ID` varchar(36)  NOT NULL,
  `ADDRESS` varchar(200)  DEFAULT NULL,
  `CODE` varchar(200)  DEFAULT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `ICONCLS` varchar(100)  DEFAULT NULL,
  `NAME` varchar(200)  DEFAULT NULL,
  `SEQ` int DEFAULT NULL,
  `UPDATEDATETIME` datetime DEFAULT NULL,
  `SYORGANIZATION_ID` varchar(36)  DEFAULT NULL,
  `LEADER` varchar(20)  DEFAULT NULL COMMENT '负责人',
  `PHONE` varchar(11)  DEFAULT NULL COMMENT '联系电话',
  `EMAIL` varchar(50)  DEFAULT NULL COMMENT '邮箱',
  `STATUS` varchar(10) DEFAULT '0',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `FK_acf7qlb04quthktalwx8c7q69` (`SYORGANIZATION_ID`) USING BTREE,
  CONSTRAINT `FK_acf7qlb04quthktalwx8c7q69` FOREIGN KEY (`SYORGANIZATION_ID`) REFERENCES `SYORGANIZATION` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ;

-- 正在导出表  authbase.SYORGANIZATION 的数据：~3 rows (大约)
INSERT INTO `SYORGANIZATION` (`ID`, `ADDRESS`, `CODE`, `CREATEDATETIME`, `ICONCLS`, `NAME`, `SEQ`, `UPDATEDATETIME`, `SYORGANIZATION_ID`, `LEADER`, `PHONE`, `EMAIL`, `STATUS`) VALUES
	('0', NULL, NULL, '2016-11-28 10:34:54', 'ext-icon-bricks', '总部', 100, '2016-11-28 10:35:12', NULL, NULL, NULL, NULL, '0'),
	('5477d9a9-e41e-485f-bb08-697e8facef88', NULL, NULL, '2022-05-22 09:59:33', NULL, '南京分公司', 1, '2023-05-16 19:52:10', '0', 'dd', '18905189016', 'ss@ada.com', '0'),
	('ce627e90-57d6-4ed4-a789-1f3dd467ae7d', NULL, NULL, '2022-05-24 23:54:10', NULL, '上海分公司', 2, '2022-05-24 23:56:21', '0', 'jack', NULL, NULL, '0');


-- 导出  表 authbase.SYRESOURCETYPE 结构
CREATE TABLE IF NOT EXISTS `SYRESOURCETYPE` (
  `ID` varchar(36)  NOT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(200)  DEFAULT NULL,
  `NAME` varchar(100)  NOT NULL,
  `UPDATEDATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ;

-- 正在导出表  authbase.SYRESOURCETYPE 的数据：~3 rows (大约)
INSERT INTO `SYRESOURCETYPE` (`ID`, `CREATEDATETIME`, `DESCRIPTION`, `NAME`, `UPDATEDATETIME`) VALUES
	('0', '2015-08-25 10:34:53', '菜单类型会显示在系统首页左侧菜单中', '菜单', '2015-08-25 10:34:53'),
	('1', '2015-08-25 10:34:53', '功能类型不会显示在系统首页左侧菜单中', '功能', '2015-08-25 10:34:53'),
	('3', '2022-05-15 10:27:08', NULL, '目录', '2022-05-15 10:27:18');

-- 导出  表 authbase.SYRESOURCE 结构
CREATE TABLE IF NOT EXISTS `SYRESOURCE` (
  `ID` varchar(36)  NOT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(200)  DEFAULT NULL,
  `ICONCLS` varchar(100)  DEFAULT NULL,
  `NAME` varchar(100)  NOT NULL,
  `SEQ` int DEFAULT NULL,
  `TARGET` varchar(100)  DEFAULT NULL,
  `UPDATEDATETIME` datetime DEFAULT NULL,
  `PATH` varchar(200)  DEFAULT NULL,
  `URL` varchar(200)  DEFAULT NULL,
  `PERMS` varchar(100)  DEFAULT NULL COMMENT '权限标识',
  `SYRESOURCE_ID` varchar(36)  DEFAULT NULL,
  `SYRESOURCETYPE_ID` varchar(36)  DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT '0',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `FK_n8kk2inhw4y4gax3nra2etfup` (`SYRESOURCE_ID`) USING BTREE,
  KEY `FK_93qfpiiuk3rwb32gc5mcmmlgh` (`SYRESOURCETYPE_ID`) USING BTREE,
  CONSTRAINT `FK_93qfpiiuk3rwb32gc5mcmmlgh` FOREIGN KEY (`SYRESOURCETYPE_ID`) REFERENCES `SYRESOURCETYPE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_n8kk2inhw4y4gax3nra2etfup` FOREIGN KEY (`SYRESOURCE_ID`) REFERENCES `SYRESOURCE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ;

-- 正在导出表  authbase.SYRESOURCE 的数据：~44 rows (大约)
INSERT INTO `SYRESOURCE` (`ID`, `CREATEDATETIME`, `DESCRIPTION`, `ICONCLS`, `NAME`, `SEQ`, `TARGET`, `UPDATEDATETIME`, `PATH`, `URL`, `PERMS`, `SYRESOURCE_ID`, `SYRESOURCETYPE_ID`, `STATUS`) VALUES
	('xtgl', '2015-08-25 10:34:53', '管理系统的资源、角色、机构、用户等信息', 'system', '系统管理', 1, '', '2023-05-16 20:03:02', '/system', NULL, NULL, NULL, '3', '0'),
	('jggl', '2015-08-25 10:34:53', '管理系统中用户的机构', 'tree', '机构管理', 4, '', '2022-05-25 00:40:04', 'dept', 'system/dept/index', 'system:dept:list', 'xtgl', '0', '0'),
	('jgbj', '2015-08-25 10:34:53', '编辑机构', 'ext-icon-bullet_wrench', '编辑机构', 2, '', '2022-05-25 00:39:56', NULL, '/base/syorganization!update', 'system:dept:edit', 'jggl', '1', '0'),
	('jgck', '2015-08-25 10:34:53', '查看机构', 'ext-icon-bullet_wrench', '查看机构', 4, '', '2015-08-25 10:34:53', NULL, '/base/syorganization!getById', 'system:dept:query', 'jggl', '1', '0'),
	('jglb', '2015-08-25 10:34:53', '查询机构列表', 'ext-icon-bullet_wrench', '机构列表', 0, '', '2016-11-28 14:09:52', NULL, '/base/syorganization!treeGrid', 'system:dept:list', 'jggl', '1', '0'),
	('jgsc', '2015-08-25 10:34:53', '删除机构', 'ext-icon-bullet_wrench', '删除机构', 3, '', '2015-08-25 10:34:53', NULL, '/base/syorganization!delete', 'system:dept:remove', 'jggl', '1', '0'),
	('jgsq', '2015-08-25 10:34:53', '机构授权', 'ext-icon-bullet_wrench', '机构授权', 5, '', '2015-08-25 10:34:53', NULL, '/base/syorganization!grant', NULL, 'jggl', '1', '0'),
	('jgtj', '2015-08-25 10:34:53', '添加机构', 'ext-icon-bullet_wrench', '添加机构', 1, '', '2015-08-25 10:34:53', NULL, '/base/syorganization!save', 'system:dept:add', 'jggl', '1', '0'),
	('jsgl', '2015-08-25 10:34:53', '管理系统中用户的角色', 'peoples', '角色管理', 2, '', '2015-08-25 10:34:53', 'role', 'system/role/index', 'system:role:list', 'xtgl', '0', '0'),
	('jsbj', '2015-08-25 10:34:53', '编辑角色', 'ext-icon-bullet_wrench', '编辑角色', 2, '', '2015-08-25 10:34:53', NULL, '/base/syrole!update', 'system:role:edit', 'jsgl', '1', '0'),
	('jsck', '2015-08-25 10:34:53', '查看角色', 'ext-icon-bullet_wrench', '查看角色', 4, '', '2015-08-25 10:34:53', NULL, '/base/syrole!getById', 'system:role:query', 'jsgl', '1', '0'),
	('jslb', '2015-08-25 10:34:53', '查询角色列表', 'ext-icon-bullet_wrench', '角色列表', 0, '', '2015-08-25 10:34:53', NULL, '/base/syrole!grid', 'system:role:list', 'jsgl', '1', '0'),
	('jssc', '2015-08-25 10:34:53', '删除角色', 'ext-icon-bullet_wrench', '删除角色', 3, '', '2015-08-25 10:34:53', NULL, '/base/syrole!delete', 'system:role:remove', 'jsgl', '1', '0'),
	('jssq', '2015-08-25 10:34:53', '角色授权', 'ext-icon-bullet_wrench', '角色授权', 5, '', '2015-08-25 10:34:53', NULL, '/base/syrole!grant', NULL, 'jsgl', '1', '0'),
	('jstj', '2015-08-25 10:34:53', '添加角色', 'ext-icon-bullet_wrench', '添加角色', 1, '', '2015-08-25 10:34:53', NULL, '/base/syrole!save', 'system:role:add', 'jsgl', '1', '0'),
	('xtjk', '2015-08-25 10:34:53', '监控系统运行情况等信息', 'monitor', '系统监控', 2, '', '2022-06-10 00:48:47', '/system/log', '', '', NULL, '0', '0'),
	('online', '2015-08-25 10:34:53', '监控用户登录、注销', 'ext-icon-chart_line', '登录历史', 1, '', '2022-06-10 00:53:22', 'logininfor', 'monitor/logininfor/index', 'monitor:logininfor:list', 'xtjk', '0', '0'),
	('onlineGrid', '2015-08-25 10:34:53', '用户登录、注销历史记录列表', 'ext-icon-bullet_wrench', '用户登录历史列表', 1, '', '2022-05-28 13:16:37', NULL, '/base/syonline!grid', 'monitor:logininfor:list', 'online', '1', '0'),
	('yhgl', '2015-08-25 10:34:53', '管理系统中用户的用户', 'user', '用户管理', 1, '', '2023-05-16 20:08:40', 'user', 'system/user/index', 'system:user:list', 'xtgl', '0', '0'),
	('yhbj', '2015-08-25 10:34:53', '编辑用户', 'ext-icon-bullet_wrench', '编辑用户', 2, '', '2015-08-25 10:34:53', NULL, '/base/syuser!update', 'system:user:edit', 'yhgl', '1', '0'),
	('yhck', '2015-08-25 10:34:53', '查看用户', 'ext-icon-bullet_wrench', '查看用户', 4, '', '2015-08-25 10:34:53', NULL, '/base/syuser!getById', 'system:user:query', 'yhgl', '1', '0'),
	('yhjg', '2015-08-25 10:34:53', '编辑用户机构', 'ext-icon-bullet_wrench', '用户机构', 6, '', '2015-08-25 10:34:53', NULL, '/base/syuser!grantOrganization', 'system:dept:edit', 'yhgl', '1', '0'),
	('yhjs', '2015-08-25 10:34:53', '编辑用户角色', 'ext-icon-bullet_wrench', '用户角色', 5, '', '2015-08-25 10:34:53', NULL, '/base/syuser!grantRole', 'system:role:edit', 'yhgl', '1', '0'),
	('yhlb', '2015-08-25 10:34:53', '查询用户列表', 'ext-icon-bullet_wrench', '用户列表', 0, '', '2015-08-25 10:34:53', NULL, '/base/syuser!grid', 'system:user:list', 'yhgl', '1', '0'),
	('yhsc', '2015-08-25 10:34:53', '删除用户', 'ext-icon-bullet_wrench', '删除用户', 3, '', '2015-08-25 10:34:53', NULL, '/base/syuser!delete', 'system:user:remove', 'yhgl', '1', '0'),
	('yhtj', '2015-08-25 10:34:53', '添加用户', 'ext-icon-bullet_wrench', '添加用户', 1, '', '2015-08-25 10:34:53', NULL, '/base/syuser!save', 'system:user:add', 'yhgl', '1', '0'),
	('zygl', '2015-08-25 10:34:53', '管理系统的资源', 'tree-table', '资源管理', 3, '', '2022-05-25 00:48:32', 'menu', 'system/menu/index', 'system:menu:list', 'xtgl', '0', '0'),
	('zybj', '2015-08-25 10:34:53', '编辑资源', 'ext-icon-bullet_wrench', '编辑资源', 2, '', '2015-08-25 10:34:53', NULL, '/base/syresource!update', 'system:menu:edit', 'zygl', '1', '0'),
	('zyck', '2015-08-25 10:34:53', '查看资源', 'ext-icon-bullet_wrench', '查看资源', 4, '', '2015-08-25 10:34:53', NULL, '/base/syresource!getById', 'system:menu:query', 'zygl', '1', '0'),
	('zylb', '2015-08-25 10:34:53', '查询资源', 'ext-icon-bullet_wrench', '资源列表', 0, '', '2015-08-25 10:34:53', NULL, '/base/syresource!treeGrid', 'system:menu:query', 'zygl', '1', '0'),
	('zysc', '2015-08-25 10:34:53', '删除资源', 'ext-icon-bullet_wrench', '删除资源', 3, '', '2015-08-25 10:34:53', NULL, '/base/syresource!delete', 'system:menu:remove', 'zygl', '1', '0'),
	('zytj', '2015-08-25 10:34:53', '添加资源', 'ext-icon-bullet_wrench', '添加资源', 1, '', '2015-08-25 10:34:53', NULL, '/base/syresource!save', 'system:menu:add', 'zygl', '1', '0'),
	('27fda67f-61d1-4fe6-8eea-d796a848ab67', '2022-05-28 12:54:39', NULL, 'edit', '参数设置', 6, '', '2022-05-28 12:54:39', 'config', 'system/config/index', 'system:config:list', 'xtgl', '3', '0'),
	('37ac3cd3-560b-49b3-ae86-96d1963e9db6', '2022-05-28 12:55:59', NULL, NULL, '参数修改', 3, NULL, '2022-05-28 12:55:59', NULL, NULL, 'system:config:edit', '27fda67f-61d1-4fe6-8eea-d796a848ab67', '1', '0'),
	('4621e9f8-e7c6-4c2b-8172-3d8c8ea75371', '2022-05-28 12:55:24', NULL, NULL, '参数新增', 2, NULL, '2022-05-28 12:55:24', NULL, NULL, 'system:config:add', '27fda67f-61d1-4fe6-8eea-d796a848ab67', '1', '0'),
	('cssc', '2022-05-28 12:56:23', NULL, NULL, '参数删除', 4, NULL, '2022-05-28 12:56:23', NULL, NULL, 'system:config:remove', '27fda67f-61d1-4fe6-8eea-d796a848ab67', '1', '0'),
	('d60df8ae-86ee-4879-b9b9-2fe79f146d31', '2022-05-28 12:55:02', NULL, NULL, '参数查询', 1, NULL, '2022-05-28 12:55:02', NULL, NULL, 'system:config:query', '27fda67f-61d1-4fe6-8eea-d796a848ab67', '1', '0'),
	('dd41b52b-272c-49ac-b045-b05392890a8d', '2022-05-28 12:56:49', NULL, NULL, '参数导出', 5, NULL, '2022-05-28 12:56:49', NULL, NULL, 'system:config:export', '27fda67f-61d1-4fe6-8eea-d796a848ab67', '1', '0'),
	('ffb8cf26-1049-43ee-9dd5-16e5742ce9d5', '2022-05-28 12:50:37', NULL, 'dict', '字典管理', 5, '', '2022-05-28 12:50:37', 'dict', 'system/dict/index', 'system:dict:list', 'xtgl', '3', '0'),
	('726c7c1e-06f8-4c3e-b9e1-95778a430c07', '2022-05-28 12:51:16', NULL, NULL, '字典查询', 1, NULL, '2022-05-28 12:51:16', NULL, NULL, 'system:dict:query', 'ffb8cf26-1049-43ee-9dd5-16e5742ce9d5', '1', '0'),
	('b95cae69-6389-4ebc-b613-bee7aac5f730', '2022-05-28 12:52:26', NULL, NULL, '字典修改', 3, NULL, '2022-05-28 12:52:26', NULL, NULL, 'system:dict:edit', 'ffb8cf26-1049-43ee-9dd5-16e5742ce9d5', '1', '0'),
	('cc7ff599-a588-40b3-951d-ce9dd2490482', '2022-05-28 12:53:26', NULL, NULL, '字典导出', 5, NULL, '2022-05-28 12:53:26', NULL, NULL, 'system:dict:export', 'ffb8cf26-1049-43ee-9dd5-16e5742ce9d5', '1', '0'),
	('zdsc', '2022-05-28 12:52:58', NULL, NULL, '字典删除', 4, NULL, '2022-05-28 12:52:58', NULL, NULL, 'system:dict:remove', 'ffb8cf26-1049-43ee-9dd5-16e5742ce9d5', '1', '0'),
	('edc3358e-b9c5-462f-8a70-7b1c7d7f2c26', '2022-05-28 12:51:53', NULL, NULL, '字典新增', 2, NULL, '2022-05-28 12:51:53', NULL, NULL, 'system:dict:add', 'ffb8cf26-1049-43ee-9dd5-16e5742ce9d5', '1', '0');

-- 导出  表 authbase.SYORGANIZATION_SYRESOURCE 结构
CREATE TABLE IF NOT EXISTS `SYORGANIZATION_SYRESOURCE` (
  `SYRESOURCE_ID` varchar(36)  NOT NULL,
  `SYORGANIZATION_ID` varchar(36)  NOT NULL,
  PRIMARY KEY (`SYORGANIZATION_ID`,`SYRESOURCE_ID`) USING BTREE,
  KEY `FK_acpjp8a7fjo0cnn02eb0ia6uf` (`SYORGANIZATION_ID`) USING BTREE,
  KEY `FK_m4mfglk7odi78d8pk9pif44vc` (`SYRESOURCE_ID`) USING BTREE,
  CONSTRAINT `FK_acpjp8a7fjo0cnn02eb0ia6uf` FOREIGN KEY (`SYORGANIZATION_ID`) REFERENCES `SYORGANIZATION` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_m4mfglk7odi78d8pk9pif44vc` FOREIGN KEY (`SYRESOURCE_ID`) REFERENCES `SYRESOURCE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ;

-- 正在导出表  authbase.SYORGANIZATION_SYRESOURCE 的数据：~0 rows (大约)

-- 导出  表 authbase.SYROLE 结构
CREATE TABLE IF NOT EXISTS `SYROLE` (
  `ID` varchar(36)  NOT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(200)  DEFAULT NULL,
  `ICONCLS` varchar(100)  DEFAULT NULL,
  `NAME` varchar(100)  NOT NULL,
  `SEQ` int DEFAULT NULL,
  `UPDATEDATETIME` datetime DEFAULT NULL,
  `ROLEKEY` varchar(100)  NOT NULL COMMENT '角色权限字符串',
  `DATASCOPE` char(1)  DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `STATUS` varchar(10) DEFAULT '0',
  PRIMARY KEY (`ID`) USING BTREE
) ;

-- 正在导出表  authbase.SYROLE 的数据：~3 rows (大约)
INSERT INTO `SYROLE` (`ID`, `CREATEDATETIME`, `DESCRIPTION`, `ICONCLS`, `NAME`, `SEQ`, `UPDATEDATETIME`, `ROLEKEY`, `DATASCOPE`, `STATUS`) VALUES
	('0', '2015-08-25 10:34:53', '拥有系统所有权限', NULL, '超管', 0, '2022-06-10 00:27:23', 'superadmin', '1', '0'),
	('19f00d46-8f1b-45b5-b7b7-6197d7b8cb33', '2016-11-28 14:24:00', NULL, NULL, '管理员', 100, '2022-06-10 00:27:41', 'admin', '1', '0'),
	('f4e1b151-a171-4705-9154-503a046cb72a', '2022-05-29 13:29:38', NULL, NULL, '只读用户', 1, '2022-06-10 00:13:55', 'readonly', '2', '0');

-- 导出  表 authbase.SYROLE_SYORGANIZATION 结构
CREATE TABLE IF NOT EXISTS `SYROLE_SYORGANIZATION` (
  `SYROLE_ID` varchar(36)  NOT NULL,
  `SYORGANIZATION_ID` varchar(36)  NOT NULL,
  PRIMARY KEY (`SYORGANIZATION_ID`,`SYROLE_ID`) USING BTREE,
  KEY `FK_kkrartsovl2frhfvriqdi7jwl` (`SYORGANIZATION_ID`) USING BTREE,
  KEY `FK_r139h669pg4ts6mbvn3ip5472` (`SYROLE_ID`) USING BTREE,
  CONSTRAINT `SYROLE_SYORGANIZATION_ibfk_1` FOREIGN KEY (`SYORGANIZATION_ID`) REFERENCES `SYORGANIZATION` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `SYROLE_SYORGANIZATION_ibfk_2` FOREIGN KEY (`SYROLE_ID`) REFERENCES `SYROLE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ;

-- 正在导出表  authbase.SYROLE_SYORGANIZATION 的数据：~1 rows (大约)
INSERT INTO `SYROLE_SYORGANIZATION` (`SYROLE_ID`, `SYORGANIZATION_ID`) VALUES
	('f4e1b151-a171-4705-9154-503a046cb72a', '5477d9a9-e41e-485f-bb08-697e8facef88');

-- 导出  表 authbase.SYROLE_SYRESOURCE 结构
CREATE TABLE IF NOT EXISTS `SYROLE_SYRESOURCE` (
  `SYROLE_ID` varchar(36)  NOT NULL,
  `SYRESOURCE_ID` varchar(36)  NOT NULL,
  PRIMARY KEY (`SYRESOURCE_ID`,`SYROLE_ID`) USING BTREE,
  KEY `FK_kkrartsovl2frhfvriqdi7jwl` (`SYRESOURCE_ID`) USING BTREE,
  KEY `FK_r139h669pg4ts6mbvn3ip5472` (`SYROLE_ID`) USING BTREE,
  CONSTRAINT `FK_kkrartsovl2frhfvriqdi7jwl` FOREIGN KEY (`SYRESOURCE_ID`) REFERENCES `SYRESOURCE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_r139h669pg4ts6mbvn3ip5472` FOREIGN KEY (`SYROLE_ID`) REFERENCES `SYROLE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ;

-- 正在导出表  authbase.SYROLE_SYRESOURCE 的数据：~57 rows (大约)
INSERT INTO `SYROLE_SYRESOURCE` (`SYROLE_ID`, `SYRESOURCE_ID`) VALUES
	('0', '27fda67f-61d1-4fe6-8eea-d796a848ab67'),
	('f4e1b151-a171-4705-9154-503a046cb72a', '27fda67f-61d1-4fe6-8eea-d796a848ab67'),
	('0', '37ac3cd3-560b-49b3-ae86-96d1963e9db6'),
	('0', '4621e9f8-e7c6-4c2b-8172-3d8c8ea75371'),
	('0', '726c7c1e-06f8-4c3e-b9e1-95778a430c07'),
	('f4e1b151-a171-4705-9154-503a046cb72a', '726c7c1e-06f8-4c3e-b9e1-95778a430c07'),
	('0', 'b95cae69-6389-4ebc-b613-bee7aac5f730'),
	('0', 'cc7ff599-a588-40b3-951d-ce9dd2490482'),
	('0', 'cssc'),
	('0', 'd60df8ae-86ee-4879-b9b9-2fe79f146d31'),
	('f4e1b151-a171-4705-9154-503a046cb72a', 'd60df8ae-86ee-4879-b9b9-2fe79f146d31'),
	('0', 'dd41b52b-272c-49ac-b045-b05392890a8d'),
	('0', 'edc3358e-b9c5-462f-8a70-7b1c7d7f2c26'),
	('0', 'ffb8cf26-1049-43ee-9dd5-16e5742ce9d5'),
	('f4e1b151-a171-4705-9154-503a046cb72a', 'ffb8cf26-1049-43ee-9dd5-16e5742ce9d5'),
	('0', 'jgbj'),
	('0', 'jgck'),
	('0', 'jggl'),
	('f4e1b151-a171-4705-9154-503a046cb72a', 'jggl'),
	('0', 'jglb'),
	('f4e1b151-a171-4705-9154-503a046cb72a', 'jglb'),
	('0', 'jgsc'),
	('0', 'jgsq'),
	('0', 'jgtj'),
	('0', 'jsbj'),
	('0', 'jsck'),
	('0', 'jsgl'),
	('f4e1b151-a171-4705-9154-503a046cb72a', 'jsgl'),
	('0', 'jslb'),
	('f4e1b151-a171-4705-9154-503a046cb72a', 'jslb'),
	('0', 'jssc'),
	('0', 'jssq'),
	('0', 'jstj'),
	('0', 'online'),
	('0', 'onlineGrid'),
	('0', 'xtgl'),
	('f4e1b151-a171-4705-9154-503a046cb72a', 'xtgl'),
	('0', 'xtjk'),
	('0', 'yhbj'),
	('0', 'yhck'),
	('0', 'yhgl'),
	('f4e1b151-a171-4705-9154-503a046cb72a', 'yhgl'),
	('0', 'yhjg'),
	('0', 'yhjs'),
	('0', 'yhlb'),
	('f4e1b151-a171-4705-9154-503a046cb72a', 'yhlb'),
	('0', 'yhsc'),
	('0', 'yhtj'),
	('0', 'zdsc'),
	('0', 'zybj'),
	('0', 'zyck'),
	('0', 'zygl'),
	('f4e1b151-a171-4705-9154-503a046cb72a', 'zygl'),
	('0', 'zylb'),
	('f4e1b151-a171-4705-9154-503a046cb72a', 'zylb'),
	('0', 'zysc'),
	('0', 'zytj');

-- 导出  表 authbase.SYS_CONFIG 结构
CREATE TABLE IF NOT EXISTS `SYS_CONFIG` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100)  DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100)  DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500)  DEFAULT '' COMMENT '参数键值',
  `config_type` char(1)  DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64)  DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64)  DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500)  DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
);

-- 正在导出表  authbase.SYS_CONFIG 的数据：~5 rows (大约)
INSERT INTO `SYS_CONFIG` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-05-14 14:04:21', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
	(2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-05-14 14:04:21', '', NULL, '初始化密码 123456'),
	(3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-05-14 14:04:21', '', NULL, '深色主题theme-dark，浅色主题theme-light'),
	(4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2022-05-14 14:04:21', '', NULL, '是否开启验证码功能（true开启，false关闭）'),
	(5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-05-14 14:04:21', '', NULL, '是否开启注册用户功能（true开启，false关闭）');


-- 导出  表 authbase.SYS_DICT_TYPE 结构
CREATE TABLE IF NOT EXISTS `SYS_DICT_TYPE` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100)  DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100)  DEFAULT '' COMMENT '字典类型',
  `status` char(1)  DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64)  DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64)  DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500)  DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
);

-- 正在导出表  authbase.SYS_DICT_TYPE 的数据：~11 rows (大约)
INSERT INTO `SYS_DICT_TYPE` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '用户性别列表'),
	(2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '菜单状态列表'),
	(3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '系统开关列表'),
	(4, '任务状态', 'sys_job_status', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '任务状态列表'),
	(5, '任务分组', 'sys_job_group', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '任务分组列表'),
	(6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '系统是否列表'),
	(7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '通知类型列表'),
	(8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '通知状态列表'),
	(9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '操作类型列表'),
	(10, '系统状态', 'sys_common_status', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '登录状态列表'),
	(11, '登录日志类型', 'sys_login_type', '0', 'admin', '2022-06-10 00:28:26', 'admin', '2022-06-10 00:28:26', NULL);


-- 导出  表 authbase.SYS_DICT_DATA 结构
CREATE TABLE IF NOT EXISTS `SYS_DICT_DATA` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100)  DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100)  DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100)  DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100)  DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100)  DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1)  DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1)  DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64)  DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64)  DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500)  DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE,
  KEY `dict_type` (`dict_type`) USING BTREE,
  CONSTRAINT `SYS_DICT_DATA_ibfk_1` FOREIGN KEY (`dict_type`) REFERENCES `SYS_DICT_TYPE` (`dict_type`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- 正在导出表  authbase.SYS_DICT_DATA 的数据：~30 rows (大约)
INSERT INTO `SYS_DICT_DATA` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '性别男'),
	(2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '性别女'),
	(3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '性别未知'),
	(4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '显示菜单'),
	(5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '隐藏菜单'),
	(6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '正常状态'),
	(7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '停用状态'),
	(8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '正常状态'),
	(9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '停用状态'),
	(10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '默认分组'),
	(11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '系统分组'),
	(12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '系统默认是'),
	(13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '系统默认否'),
	(14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '通知'),
	(15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '公告'),
	(16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '正常状态'),
	(17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:20', '', NULL, '关闭状态'),
	(18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '新增操作'),
	(19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '修改操作'),
	(20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '删除操作'),
	(21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '授权操作'),
	(22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '导出操作'),
	(23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '导入操作'),
	(24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '强退操作'),
	(25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '生成操作'),
	(26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '清空操作'),
	(27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '正常状态'),
	(28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-05-14 14:04:21', '', NULL, '停用状态'),
	(100, 0, '登录', '1', 'sys_login_type', NULL, 'default', NULL, '0', 'admin', '2022-06-10 00:29:31', 'admin', '2022-06-10 00:29:58', NULL),
	(101, 1, '注销', '0', 'sys_login_type', NULL, 'default', NULL, '0', 'admin', '2022-06-10 00:29:48', NULL, '2022-06-10 00:29:48', NULL);

-- 导出  表 authbase.SYUSER 结构
CREATE TABLE IF NOT EXISTS `SYUSER` (
  `ID` varchar(36)  NOT NULL,
  `AGE` int DEFAULT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `LOGINNAME` varchar(100)  NOT NULL,
  `NAME` varchar(100)  DEFAULT NULL,
  `PHOTO` varchar(200)  DEFAULT NULL,
  `PWD` varchar(100)  DEFAULT NULL,
  `SEX` varchar(1)  DEFAULT NULL,
  `UPDATEDATETIME` datetime DEFAULT NULL,
  `EMPLOYDATE` datetime DEFAULT NULL,
  `EMAIL` varchar(50)  DEFAULT '' COMMENT '用户邮箱',
  `PHONENUMBER` varchar(11)  DEFAULT '' COMMENT '手机号码',
  `STATUS` varchar(10) DEFAULT '0',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `UK_eiov1gsncrds3rean3dmu822p` (`LOGINNAME`) USING BTREE
) ;

-- 正在导出表  authbase.SYUSER 的数据：~2 rows (大约)
INSERT INTO `SYUSER` (`ID`, `AGE`, `CREATEDATETIME`, `LOGINNAME`, `NAME`, `PHOTO`, `PWD`, `SEX`, `UPDATEDATETIME`, `EMPLOYDATE`, `EMAIL`, `PHONENUMBER`, `STATUS`) VALUES
	('0', 30, '2015-08-25 10:34:54', 'admin', 'admin', '', 'e10adc3949ba59abbe56e057f20f883e', '1', '2022-06-08 11:04:52', NULL, 'test@test.com', '18988888888', '0'),
	('0f21b40c-5323-46e5-9200-0364eab3481e', NULL, '2022-05-29 09:28:57', 'test', 'test', NULL, 'e10adc3949ba59abbe56e057f20f883e', '0', '2022-06-10 09:19:56', '2022-05-29 09:28:57', 'test@test.com', '18988888888', '0');

-- 导出  表 authbase.SYUSER_SYORGANIZATION 结构
CREATE TABLE IF NOT EXISTS `SYUSER_SYORGANIZATION` (
  `SYUSER_ID` varchar(36)  NOT NULL,
  `SYORGANIZATION_ID` varchar(36)  NOT NULL,
  PRIMARY KEY (`SYORGANIZATION_ID`,`SYUSER_ID`) USING BTREE,
  KEY `FK_14ewqc5wtscac0dd5rswrm5j2` (`SYORGANIZATION_ID`) USING BTREE,
  KEY `FK_63bdmtxwlk259id13rp4iryy` (`SYUSER_ID`) USING BTREE,
  CONSTRAINT `FK_14ewqc5wtscac0dd5rswrm5j2` FOREIGN KEY (`SYORGANIZATION_ID`) REFERENCES `SYORGANIZATION` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_63bdmtxwlk259id13rp4iryy` FOREIGN KEY (`SYUSER_ID`) REFERENCES `SYUSER` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ;

-- 正在导出表  authbase.SYUSER_SYORGANIZATION 的数据：~3 rows (大约)
INSERT INTO `SYUSER_SYORGANIZATION` (`SYUSER_ID`, `SYORGANIZATION_ID`) VALUES
	('0', '0'),
	('0f21b40c-5323-46e5-9200-0364eab3481e', '5477d9a9-e41e-485f-bb08-697e8facef88');

-- 导出  表 authbase.SYUSER_SYROLE 结构
CREATE TABLE IF NOT EXISTS `SYUSER_SYROLE` (
  `SYUSER_ID` varchar(36)  NOT NULL,
  `SYROLE_ID` varchar(36)  NOT NULL,
  PRIMARY KEY (`SYROLE_ID`,`SYUSER_ID`) USING BTREE,
  KEY `FK_j7iwtgslc2esrjx0ptieleoko` (`SYROLE_ID`) USING BTREE,
  KEY `FK_1pi4p5h4y5ghbs5f4gdlgn620` (`SYUSER_ID`) USING BTREE,
  CONSTRAINT `FK_1pi4p5h4y5ghbs5f4gdlgn620` FOREIGN KEY (`SYUSER_ID`) REFERENCES `SYUSER` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_j7iwtgslc2esrjx0ptieleoko` FOREIGN KEY (`SYROLE_ID`) REFERENCES `SYROLE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ;

-- 正在导出表  authbase.SYUSER_SYROLE 的数据：~4 rows (大约)
INSERT INTO `SYUSER_SYROLE` (`SYUSER_ID`, `SYROLE_ID`) VALUES
	('0', '0'),
	('0', '19f00d46-8f1b-45b5-b7b7-6197d7b8cb33'),
	('0', 'f4e1b151-a171-4705-9154-503a046cb72a');

-- authbase.syoperationlog definition

CREATE TABLE `syoperationlog` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `OPERATION_NAME` varchar(100) NOT NULL,
  `METHOD` varchar(10) DEFAULT NULL,
  `PATH` varchar(200) NOT NULL,
  `PARAMS` text,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `OPERATOR` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

