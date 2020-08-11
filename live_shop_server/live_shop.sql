/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50645
 Source Host           : localhost:3306
 Source Schema         : live_shop

 Target Server Type    : MySQL
 Target Server Version : 50645
 File Encoding         : 65001

 Date: 11/08/2020 17:12:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_update_by` datetime(0) NULL DEFAULT NULL,
  `last_update_time` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `loginname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `passwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `salt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加密盐',
  `status` tinyint(255) NOT NULL DEFAULT 0 COMMENT '状态 0：禁用 1：正常',
  `del_flag` tinyint(255) NOT NULL DEFAULT 0 COMMENT '是否被删除 -1：已删除 0：正常',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `sex` bit(1) NOT NULL DEFAULT b'1' COMMENT '性别',
  `birth` date NULL DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '这个人很懒什么都没有留下来' COMMENT '用户的个性签名',
  `location_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '中国' COMMENT '用户所在城市',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '不会降龙的乔峰', '1446778774', '1234', NULL, '2020-07-17 12:16:29', '2020-07-30 17:01:49', '2020-07-17 12:16:29', 'http://118.25.130.181/data/00/00/rBEADl8j2a6AMUAfAAC7SmqwtG0986.jpg', NULL, 0, 0, 'm18779334084@163.com', '18779334084', b'1', '2020-07-30', '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (2, NULL, NULL, NULL, NULL, '2020-07-17 14:22:25', NULL, '2020-07-17 14:22:25', NULL, NULL, 0, 0, NULL, NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (3, 'baadad', NULL, NULL, NULL, '2020-07-30 16:58:57', NULL, '2020-07-30 16:58:57', NULL, NULL, 0, 0, NULL, '18779334084', b'1', '2020-07-30', '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (4, 'xiao', NULL, NULL, NULL, '2020-07-30 16:59:55', NULL, '2020-07-30 16:59:55', NULL, NULL, 0, 0, NULL, '18779334084', b'1', '2020-07-30', '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (5, 'xiao', NULL, NULL, NULL, '2020-07-30 17:03:19', NULL, '2020-07-30 17:03:19', NULL, NULL, 0, 0, NULL, '18779334084', b'1', '2020-07-30', '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (6, 'xiao', NULL, NULL, NULL, '2020-07-30 17:03:35', NULL, '2020-07-30 17:03:35', NULL, NULL, 0, 0, NULL, '18779334084', b'1', '2020-07-30', '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (7, 'xiao', NULL, NULL, NULL, '2020-07-30 17:04:04', NULL, '2020-07-30 17:04:04', NULL, NULL, 0, 0, NULL, '18779334084', b'1', '2020-07-30', '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (8, NULL, '745567172@qq.com', NULL, NULL, '2020-07-31 16:41:37', NULL, '2020-07-31 16:41:37', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (9, '乔峰', NULL, NULL, NULL, '2020-07-31 16:42:23', NULL, '2020-07-31 16:42:23', 'http://118.25.130.181/data/00/00/rBEADl8j2XCANRzNAAC7SmqwtG0802.jpg', NULL, 0, 0, NULL, '15970356433', b'1', '2017-07-31', '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (10, '乔峰', NULL, NULL, NULL, '2020-07-31 16:43:27', NULL, '2020-07-31 16:43:27', 'http://118.25.130.181/data/00/00/rBEADl8j2a6AMUAfAAC7SmqwtG0986.jpg', NULL, 0, 0, NULL, '15970356433', b'1', '2017-07-31', '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (11, '乔峰', NULL, NULL, NULL, '2020-07-31 16:48:31', NULL, '2020-07-31 16:48:31', '118.25.130.181/data/00/00/rBEADl8j2t2AbgAPAAArUOsiBNw115.jpg', NULL, 0, 0, NULL, '15970356433', b'1', '2017-07-31', '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (12, '乔峰', NULL, NULL, NULL, '2020-07-31 16:59:30', NULL, '2020-07-31 16:59:30', '118.25.130.181/data/00/00/rBEADl8j3XCAacfuAAC7SmqwtG0107.jpg', NULL, 0, 0, NULL, '15970356433', b'1', '2017-07-31', '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (13, NULL, '745567172@qq.com', NULL, NULL, '2020-08-03 12:21:50', NULL, '2020-08-03 12:21:50', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (14, NULL, '745567172@qq.com', NULL, NULL, '2020-08-03 12:24:00', NULL, '2020-08-03 12:24:00', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (15, NULL, '745567172@qq.com', NULL, NULL, '2020-08-03 13:51:41', NULL, '2020-08-03 13:51:41', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (16, NULL, '745567172@qq.com', NULL, NULL, '2020-08-10 11:22:08', NULL, '2020-08-10 11:22:08', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (17, NULL, '745567172@qq.com', NULL, NULL, '2020-08-10 11:22:39', NULL, '2020-08-10 11:22:39', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (18, NULL, '745567172@qq.com', NULL, NULL, '2020-08-11 09:43:11', NULL, '2020-08-11 09:43:11', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (19, NULL, '745567172@qq.com', NULL, NULL, '2020-08-11 10:04:25', NULL, '2020-08-11 10:04:25', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (20, NULL, '745567172@qq.com', NULL, NULL, '2020-08-11 11:01:47', NULL, '2020-08-11 11:01:47', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (21, NULL, '745567172@qq.com', NULL, NULL, '2020-08-11 11:44:38', NULL, '2020-08-11 11:44:38', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (22, '每分每秒', '745567172@qq.com', NULL, NULL, '2020-08-11 14:36:07', NULL, '2020-08-11 14:36:07', '118.25.130.181/data/00/00/rBEADl8yPF2AHKsEAAArUOsiBNw463.jpg', NULL, 0, 0, NULL, '15970356433', b'0', '2017-09-01', '这个让人很懒，什么都没有留下dg', '中国');
INSERT INTO `customer` VALUES (23, '每分每秒', NULL, NULL, NULL, '2020-08-11 14:41:11', NULL, '2020-08-11 14:41:11', '118.25.130.181/data/00/00/rBEADl8yPYaASasHAAArUOsiBNw981.jpg', NULL, 0, 0, NULL, '15970356433', b'0', '2017-09-01', '这个让人很懒，什么都没有留下dg', '中国');
INSERT INTO `customer` VALUES (24, NULL, '745567172@qq.com', NULL, NULL, '2020-08-11 14:55:28', NULL, '2020-08-11 14:55:28', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (25, NULL, '745567172@qq.com', NULL, NULL, '2020-08-11 15:05:58', NULL, '2020-08-11 15:05:58', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (26, NULL, '745567172@qq.com', NULL, NULL, '2020-08-11 15:21:39', NULL, '2020-08-11 15:21:39', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (27, 'Miss Wu', NULL, '7758521', 'email', '2020-08-11 15:32:15', 'email', '2020-08-11 15:32:15', 'http://118.25.130.181/data/00/00/rBEADl8ySYGAKgl3AAC7SmqwtG0022.jpg', NULL, 0, 0, '745567172@qq.com', '15370356433', b'0', '2013-08-01', '我爱昵', '中国');
INSERT INTO `customer` VALUES (28, 'Miss Wu', '745567172@qq.com', '7758521', 'email', '2020-08-11 15:33:37', 'email', '2020-08-11 15:33:37', 'http://118.25.130.181/data/00/00/rBEADl8ySdCAd4HCAAC7SmqwtG0986.jpg', NULL, 0, 0, '745567172@qq.com', '15370356433', b'0', '2013-08-01', '我爱昵', '中国');
INSERT INTO `customer` VALUES (29, NULL, '745567172@qq.com', NULL, NULL, '2020-08-11 16:11:26', NULL, '2020-08-11 16:11:26', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (30, NULL, '745567172@qq.com', NULL, NULL, '2020-08-11 16:16:27', NULL, '2020-08-11 16:16:27', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (31, NULL, '745567172@qq.com', NULL, NULL, '2020-08-11 16:19:19', NULL, '2020-08-11 16:19:19', NULL, NULL, 0, 0, '745567172@qq.com', NULL, b'1', NULL, '这个人很懒什么都没有留下来', '中国');
INSERT INTO `customer` VALUES (32, 'Mr Xiao', 'm18779334084@163.com', '731fcac05393269c61b4c7d405e678cd', 'email', '2020-08-11 16:22:07', 'email', '2020-08-11 16:22:07', 'http://118.25.130.181/data/00/00/rBEADl8yVS-AEn7eAAC7SmqwtG0426.jpg', NULL, 0, 0, 'm18779334084@163.com', '15840566432', b'0', '2019-11-15', '我爱你吴艳', '北京市-北京城区-丰台区');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级部门，一级部门ID为0',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(255) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据值',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签名',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(255) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NULL DEFAULT NULL COMMENT '执行时间（毫秒）',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 294 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@b65fa6c', 8810, '192.168.179.1', NULL, '2020-07-17 10:32:20', NULL, '2020-07-17 10:32:20');
INSERT INTO `log` VALUES (2, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@b65fa6c', 12926, '192.168.179.1', NULL, '2020-07-17 10:33:11', NULL, '2020-07-17 10:33:11');
INSERT INTO `log` VALUES (3, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@b65fa6c', 5401, '192.168.179.1', NULL, '2020-07-17 11:01:48', NULL, '2020-07-17 11:01:48');
INSERT INTO `log` VALUES (4, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@b65fa6c', 5445, '192.168.179.1', NULL, '2020-07-17 11:02:13', NULL, '2020-07-17 11:02:13');
INSERT INTO `log` VALUES (5, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@263b0bd3', 2349, '192.168.179.1', NULL, '2020-07-17 11:17:23', NULL, '2020-07-17 11:17:23');
INSERT INTO `log` VALUES (6, NULL, '发送邮件验证用户注册', 'validateEmail', 'org.apache.catalina.util.ParameterMap@5bed786d', 25644, '192.168.179.1', NULL, '2020-07-17 12:05:01', NULL, '2020-07-17 12:05:01');
INSERT INTO `log` VALUES (7, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@5bed786d', 529, '192.168.179.1', NULL, '2020-07-17 12:07:07', NULL, '2020-07-17 12:07:07');
INSERT INTO `log` VALUES (8, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@1d865de9', 854, '192.168.179.1', NULL, '2020-07-17 12:09:28', NULL, '2020-07-17 12:09:28');
INSERT INTO `log` VALUES (9, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@14c70497', 945, '192.168.179.1', NULL, '2020-07-17 12:15:03', NULL, '2020-07-17 12:15:03');
INSERT INTO `log` VALUES (10, NULL, '验证码不正确，请核实邮件后重新输入', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@14c70497', 31580, '192.168.179.1', NULL, NULL, NULL, '2020-07-17 12:15:26');
INSERT INTO `log` VALUES (11, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@14c70497', 7581, '192.168.179.1', NULL, NULL, NULL, '2020-07-17 12:16:29');
INSERT INTO `log` VALUES (12, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@14c70497', 127, '192.168.179.1', NULL, '2020-07-17 12:25:27', NULL, '2020-07-17 12:25:27');
INSERT INTO `log` VALUES (13, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@55961a7a', 1606, '192.168.179.1', NULL, '2020-07-17 14:22:25', NULL, '2020-07-17 14:22:25');
INSERT INTO `log` VALUES (14, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@227334b2', 67910, '192.168.179.1', NULL, '2020-07-17 14:58:27', NULL, '2020-07-17 14:58:27');
INSERT INTO `log` VALUES (15, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@227334b2', 124, '192.168.179.1', NULL, '2020-07-17 15:04:11', NULL, '2020-07-17 15:04:11');
INSERT INTO `log` VALUES (16, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@227334b2', 16315, '192.168.179.1', NULL, '2020-07-17 15:07:21', NULL, '2020-07-17 15:07:21');
INSERT INTO `log` VALUES (17, NULL, '邮件已发出，请注意查收', 'validateEmail', 'org.apache.catalina.util.ParameterMap@787c5be8', 34018, '192.168.179.1', NULL, '2020-07-17 16:52:13', NULL, '2020-07-17 16:52:13');
INSERT INTO `log` VALUES (18, NULL, '邮件已发出，请注意查收', 'validateEmail', 'org.apache.catalina.util.ParameterMap@2e582fe8', 32614, '192.168.179.1', NULL, '2020-07-17 16:54:32', NULL, '2020-07-17 16:54:32');
INSERT INTO `log` VALUES (19, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4987af22', 6114, '127.0.0.1', NULL, '2020-07-20 11:21:00', NULL, '2020-07-20 11:21:00');
INSERT INTO `log` VALUES (20, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4987af22', 813, '127.0.0.1', NULL, '2020-07-20 11:46:53', NULL, '2020-07-20 11:46:53');
INSERT INTO `log` VALUES (21, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@1b85254f', 4154, '127.0.0.1', NULL, '2020-07-21 11:43:25', NULL, '2020-07-21 11:43:25');
INSERT INTO `log` VALUES (22, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@1b85254f', 1008, '127.0.0.1', NULL, '2020-07-21 11:45:23', NULL, '2020-07-21 11:45:23');
INSERT INTO `log` VALUES (23, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@1b85254f', 123, '127.0.0.1', NULL, '2020-07-21 11:45:51', NULL, '2020-07-21 11:45:51');
INSERT INTO `log` VALUES (24, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@1b85254f', 154, '127.0.0.1', NULL, '2020-07-21 11:46:12', NULL, '2020-07-21 11:46:12');
INSERT INTO `log` VALUES (25, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@1b85254f', 104, '127.0.0.1', NULL, '2020-07-21 12:11:23', NULL, '2020-07-21 12:11:23');
INSERT INTO `log` VALUES (26, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@1b85254f', 117, '127.0.0.1', NULL, '2020-07-21 15:28:28', NULL, '2020-07-21 15:28:28');
INSERT INTO `log` VALUES (27, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@1b85254f', 167, '127.0.0.1', NULL, '2020-07-21 15:28:40', NULL, '2020-07-21 15:28:40');
INSERT INTO `log` VALUES (28, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@1b85254f', 175, '127.0.0.1', NULL, '2020-07-21 16:11:51', NULL, '2020-07-21 16:11:51');
INSERT INTO `log` VALUES (29, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@1b85254f', 128, '127.0.0.1', NULL, '2020-07-21 16:11:56', NULL, '2020-07-21 16:11:56');
INSERT INTO `log` VALUES (30, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@1b85254f', 1133, '127.0.0.1', NULL, '2020-07-21 16:13:27', NULL, '2020-07-21 16:13:27');
INSERT INTO `log` VALUES (31, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@1b85254f', 728, '127.0.0.1', NULL, '2020-07-21 16:13:44', NULL, '2020-07-21 16:13:44');
INSERT INTO `log` VALUES (32, NULL, '邮件已发出，请注意查收', 'validateEmail', 'org.apache.catalina.util.ParameterMap@351d74e0', 10703, '192.168.179.1', NULL, '2020-07-22 16:02:23', NULL, '2020-07-22 16:02:23');
INSERT INTO `log` VALUES (33, NULL, '邮件已发出，请注意查收', 'validateEmail', 'org.apache.catalina.util.ParameterMap@351d74e0', 5774, '192.168.179.1', NULL, '2020-07-22 16:03:59', NULL, '2020-07-22 16:03:59');
INSERT INTO `log` VALUES (34, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@351d74e0', 997, '192.168.179.1', NULL, '2020-07-22 16:08:09', NULL, '2020-07-22 16:08:09');
INSERT INTO `log` VALUES (35, NULL, '邮件已发出，请注意查收', 'validateEmail', 'org.apache.catalina.util.ParameterMap@351d74e0', 5801, '192.168.179.1', NULL, '2020-07-22 16:08:31', NULL, '2020-07-22 16:08:31');
INSERT INTO `log` VALUES (36, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@289d6e99', 4155, '192.168.179.1', NULL, '2020-07-22 16:16:05', NULL, '2020-07-22 16:16:05');
INSERT INTO `log` VALUES (37, NULL, '验证码不正确，请核实邮件后重新输入', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@4f81c19c', 21530, '192.168.179.1', NULL, '2020-07-22 16:27:17', NULL, '2020-07-22 16:27:17');
INSERT INTO `log` VALUES (38, NULL, '验证码不正确，请核实邮件后重新输入', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 27453, '192.168.179.1', NULL, '2020-07-22 16:28:38', NULL, '2020-07-22 16:28:38');
INSERT INTO `log` VALUES (39, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 715, '192.168.179.1', NULL, '2020-07-22 16:30:43', NULL, '2020-07-22 16:30:43');
INSERT INTO `log` VALUES (40, NULL, '验证码不正确，请核实邮件后重新输入', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 13949, '192.168.179.1', NULL, '2020-07-22 16:31:02', NULL, '2020-07-22 16:31:02');
INSERT INTO `log` VALUES (41, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 110, '192.168.179.1', NULL, '2020-07-22 16:37:19', NULL, '2020-07-22 16:37:19');
INSERT INTO `log` VALUES (42, NULL, '验证码不正确，请核实邮件后重新输入', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 349, '192.168.179.1', NULL, '2020-07-22 16:38:12', NULL, '2020-07-22 16:38:12');
INSERT INTO `log` VALUES (43, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 115, '192.168.179.1', NULL, '2020-07-22 16:42:33', NULL, '2020-07-22 16:42:33');
INSERT INTO `log` VALUES (44, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 95, '192.168.179.1', NULL, '2020-07-22 16:43:46', NULL, '2020-07-22 16:43:46');
INSERT INTO `log` VALUES (45, NULL, '邮件已发出，请注意查收', 'validateEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 14047, '192.168.179.1', NULL, '2020-07-22 16:44:24', NULL, '2020-07-22 16:44:24');
INSERT INTO `log` VALUES (46, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 16464, '192.168.179.1', NULL, '2020-07-22 16:45:22', NULL, '2020-07-22 16:45:22');
INSERT INTO `log` VALUES (47, NULL, '验证码不正确，请核实邮件后重新输入', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 92, '192.168.179.1', NULL, '2020-07-22 16:48:12', NULL, '2020-07-22 16:48:12');
INSERT INTO `log` VALUES (48, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 95, '192.168.179.1', NULL, '2020-07-22 16:48:30', NULL, '2020-07-22 16:48:30');
INSERT INTO `log` VALUES (49, NULL, '验证码不正确，请核实邮件后重新输入', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 6004, '192.168.179.1', NULL, '2020-07-22 16:50:43', NULL, '2020-07-22 16:50:43');
INSERT INTO `log` VALUES (50, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 129, '192.168.179.1', NULL, '2020-07-22 16:51:16', NULL, '2020-07-22 16:51:16');
INSERT INTO `log` VALUES (51, NULL, '验证码不正确，请核实邮件后重新输入', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 88, '192.168.179.1', NULL, '2020-07-22 16:51:58', NULL, '2020-07-22 16:51:58');
INSERT INTO `log` VALUES (52, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 103, '192.168.179.1', NULL, '2020-07-22 16:52:49', NULL, '2020-07-22 16:52:49');
INSERT INTO `log` VALUES (53, NULL, '请输入正确的邮箱', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 80, '192.168.179.1', NULL, '2020-07-22 16:53:35', NULL, '2020-07-22 16:53:35');
INSERT INTO `log` VALUES (54, NULL, '请输入正确的邮箱', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 78, '192.168.179.1', NULL, '2020-07-22 16:53:43', NULL, '2020-07-22 16:53:43');
INSERT INTO `log` VALUES (55, NULL, '请输入正确的邮箱', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 93, '192.168.179.1', NULL, '2020-07-22 16:54:04', NULL, '2020-07-22 16:54:04');
INSERT INTO `log` VALUES (56, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 117, '192.168.179.1', NULL, '2020-07-22 16:54:27', NULL, '2020-07-22 16:54:27');
INSERT INTO `log` VALUES (57, NULL, '请输入正确的邮箱', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 81, '192.168.179.1', NULL, '2020-07-22 16:55:11', NULL, '2020-07-22 16:55:11');
INSERT INTO `log` VALUES (58, NULL, '请输入正确的邮箱', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 122, '192.168.179.1', NULL, '2020-07-22 16:59:53', NULL, '2020-07-22 16:59:53');
INSERT INTO `log` VALUES (59, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 103, '192.168.179.1', NULL, '2020-07-22 17:01:34', NULL, '2020-07-22 17:01:34');
INSERT INTO `log` VALUES (60, NULL, '验证码不正确，请核实邮件后重新输入', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 109, '192.168.179.1', NULL, '2020-07-22 17:02:55', NULL, '2020-07-22 17:02:55');
INSERT INTO `log` VALUES (61, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 128, '192.168.179.1', NULL, '2020-07-22 17:03:09', NULL, '2020-07-22 17:03:09');
INSERT INTO `log` VALUES (62, NULL, '验证码不正确，请核实邮件后重新输入', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 135, '192.168.179.1', NULL, '2020-07-22 17:03:40', NULL, '2020-07-22 17:03:40');
INSERT INTO `log` VALUES (63, NULL, '验证码不正确，请核实邮件后重新输入', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 391, '192.168.179.1', NULL, '2020-07-22 17:04:08', NULL, '2020-07-22 17:04:08');
INSERT INTO `log` VALUES (64, NULL, '验证码不正确，请核实邮件后重新输入', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@54bf1ad6', 76, '192.168.179.1', NULL, '2020-07-22 17:04:20', NULL, '2020-07-22 17:04:20');
INSERT INTO `log` VALUES (65, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@77fc5278', 6023, '192.168.179.1', NULL, '2020-07-23 10:15:20', NULL, '2020-07-23 10:15:20');
INSERT INTO `log` VALUES (66, NULL, '邮件已发出，请注意查收', 'validateEmail', 'org.apache.catalina.util.ParameterMap@77fc5278', 20243, '192.168.179.1', NULL, '2020-07-23 10:16:24', NULL, '2020-07-23 10:16:24');
INSERT INTO `log` VALUES (67, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@77fc5278', 174, '192.168.179.1', NULL, '2020-07-23 10:18:33', NULL, '2020-07-23 10:18:33');
INSERT INTO `log` VALUES (68, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@77fc5278', 127, '192.168.179.1', NULL, '2020-07-23 10:19:05', NULL, '2020-07-23 10:19:05');
INSERT INTO `log` VALUES (69, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@77fc5278', 115, '192.168.179.1', NULL, '2020-07-23 10:19:15', NULL, '2020-07-23 10:19:15');
INSERT INTO `log` VALUES (70, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@77fc5278', 131, '192.168.179.1', NULL, '2020-07-23 11:15:16', NULL, '2020-07-23 11:15:16');
INSERT INTO `log` VALUES (71, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@77fc5278', 85, '192.168.179.1', NULL, '2020-07-23 11:16:30', NULL, '2020-07-23 11:16:30');
INSERT INTO `log` VALUES (72, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@77fc5278', 97, '192.168.179.1', NULL, '2020-07-23 11:27:05', NULL, '2020-07-23 11:27:05');
INSERT INTO `log` VALUES (73, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@77fc5278', 123, '192.168.179.1', NULL, '2020-07-23 11:27:26', NULL, '2020-07-23 11:27:26');
INSERT INTO `log` VALUES (74, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@77fc5278', 118, '192.168.179.1', NULL, '2020-07-23 11:33:19', NULL, '2020-07-23 11:33:19');
INSERT INTO `log` VALUES (75, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@77fc5278', 125, '192.168.179.1', NULL, '2020-07-23 11:33:38', NULL, '2020-07-23 11:33:38');
INSERT INTO `log` VALUES (76, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@77fc5278', 118, '192.168.179.1', NULL, '2020-07-23 11:37:40', NULL, '2020-07-23 11:37:40');
INSERT INTO `log` VALUES (77, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@77fc5278', 144, '192.168.179.1', NULL, '2020-07-23 11:40:00', NULL, '2020-07-23 11:40:00');
INSERT INTO `log` VALUES (78, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@77fc5278', 131, '192.168.179.1', NULL, '2020-07-23 11:40:41', NULL, '2020-07-23 11:40:41');
INSERT INTO `log` VALUES (79, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@77fc5278', 111, '192.168.179.1', NULL, '2020-07-23 12:03:15', NULL, '2020-07-23 12:03:15');
INSERT INTO `log` VALUES (80, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@77fc5278', 1158, '192.168.179.1', NULL, '2020-07-23 12:03:57', NULL, '2020-07-23 12:03:57');
INSERT INTO `log` VALUES (81, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@77fc5278', 104, '192.168.179.1', NULL, '2020-07-23 12:07:51', NULL, '2020-07-23 12:07:51');
INSERT INTO `log` VALUES (82, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@77fc5278', 83, '192.168.179.1', NULL, '2020-07-23 12:18:09', NULL, '2020-07-23 12:18:09');
INSERT INTO `log` VALUES (83, NULL, '验证码不正确，请核实邮件后重新输入', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@77fc5278', 107, '192.168.179.1', NULL, '2020-07-23 12:18:18', NULL, '2020-07-23 12:18:18');
INSERT INTO `log` VALUES (84, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@77fc5278', 103, '192.168.179.1', NULL, '2020-07-23 12:18:24', NULL, '2020-07-23 12:18:24');
INSERT INTO `log` VALUES (85, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@77fc5278', 88, '192.168.179.1', NULL, '2020-07-23 12:24:35', NULL, '2020-07-23 12:24:35');
INSERT INTO `log` VALUES (86, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@77fc5278', 100, '192.168.179.1', NULL, '2020-07-23 12:24:50', NULL, '2020-07-23 12:24:50');
INSERT INTO `log` VALUES (87, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@77fc5278', 431, '192.168.179.1', NULL, '2020-07-23 12:25:16', NULL, '2020-07-23 12:25:16');
INSERT INTO `log` VALUES (88, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@77fc5278', 90, '192.168.179.1', NULL, '2020-07-23 12:25:32', NULL, '2020-07-23 12:25:32');
INSERT INTO `log` VALUES (89, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@77fc5278', 100, '192.168.179.1', NULL, '2020-07-23 12:26:05', NULL, '2020-07-23 12:26:05');
INSERT INTO `log` VALUES (90, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@77fc5278', 90, '192.168.179.1', NULL, '2020-07-23 12:26:18', NULL, '2020-07-23 12:26:18');
INSERT INTO `log` VALUES (91, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@77fc5278', 95, '192.168.179.1', NULL, '2020-07-23 12:29:32', NULL, '2020-07-23 12:29:32');
INSERT INTO `log` VALUES (92, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@77fc5278', 114, '192.168.179.1', NULL, '2020-07-23 12:29:37', NULL, '2020-07-23 12:29:37');
INSERT INTO `log` VALUES (93, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@77fc5278', 113, '192.168.179.1', NULL, '2020-07-23 12:30:20', NULL, '2020-07-23 12:30:20');
INSERT INTO `log` VALUES (94, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 3252, '192.168.179.1', NULL, '2020-07-23 16:16:13', NULL, '2020-07-23 16:16:13');
INSERT INTO `log` VALUES (95, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 117, '192.168.179.1', NULL, '2020-07-23 16:16:42', NULL, '2020-07-23 16:16:42');
INSERT INTO `log` VALUES (96, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 298, '192.168.179.1', NULL, '2020-07-23 16:18:00', NULL, '2020-07-23 16:18:00');
INSERT INTO `log` VALUES (97, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 125, '192.168.179.1', NULL, '2020-07-23 16:22:50', NULL, '2020-07-23 16:22:50');
INSERT INTO `log` VALUES (98, NULL, '验证码不正确，请核实邮件后重新输入', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 93, '192.168.179.1', NULL, '2020-07-23 16:22:58', NULL, '2020-07-23 16:22:58');
INSERT INTO `log` VALUES (99, NULL, '验证码不正确，请核实邮件后重新输入', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 93, '192.168.179.1', NULL, '2020-07-23 16:23:09', NULL, '2020-07-23 16:23:09');
INSERT INTO `log` VALUES (100, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 247, '192.168.179.1', NULL, '2020-07-23 16:23:13', NULL, '2020-07-23 16:23:13');
INSERT INTO `log` VALUES (101, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 102, '192.168.179.1', NULL, '2020-07-23 16:29:09', NULL, '2020-07-23 16:29:09');
INSERT INTO `log` VALUES (102, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 1084, '192.168.179.1', NULL, '2020-07-23 16:31:29', NULL, '2020-07-23 16:31:29');
INSERT INTO `log` VALUES (103, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 114, '192.168.179.1', NULL, '2020-07-23 16:35:39', NULL, '2020-07-23 16:35:39');
INSERT INTO `log` VALUES (104, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 87, '192.168.179.1', NULL, '2020-07-23 16:36:51', NULL, '2020-07-23 16:36:51');
INSERT INTO `log` VALUES (105, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 94, '192.168.179.1', NULL, '2020-07-23 16:37:49', NULL, '2020-07-23 16:37:49');
INSERT INTO `log` VALUES (106, NULL, '请输入正确的邮箱', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 98, '192.168.179.1', NULL, '2020-07-23 16:38:40', NULL, '2020-07-23 16:38:40');
INSERT INTO `log` VALUES (107, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 109, '192.168.179.1', NULL, '2020-07-23 16:39:39', NULL, '2020-07-23 16:39:39');
INSERT INTO `log` VALUES (108, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 99, '192.168.179.1', NULL, '2020-07-23 16:40:40', NULL, '2020-07-23 16:40:40');
INSERT INTO `log` VALUES (109, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 214, '192.168.179.1', NULL, '2020-07-23 16:41:21', NULL, '2020-07-23 16:41:21');
INSERT INTO `log` VALUES (110, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 125, '192.168.179.1', NULL, '2020-07-23 16:41:46', NULL, '2020-07-23 16:41:46');
INSERT INTO `log` VALUES (111, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 134, '192.168.179.1', NULL, '2020-07-23 16:45:48', NULL, '2020-07-23 16:45:48');
INSERT INTO `log` VALUES (112, NULL, '请输入正确的邮箱', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 77, '192.168.179.1', NULL, '2020-07-23 16:46:17', NULL, '2020-07-23 16:46:17');
INSERT INTO `log` VALUES (113, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 136, '192.168.179.1', NULL, '2020-07-23 16:47:52', NULL, '2020-07-23 16:47:52');
INSERT INTO `log` VALUES (114, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 121, '192.168.179.1', NULL, '2020-07-23 16:48:31', NULL, '2020-07-23 16:48:31');
INSERT INTO `log` VALUES (115, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 114, '192.168.179.1', NULL, '2020-07-23 16:50:43', NULL, '2020-07-23 16:50:43');
INSERT INTO `log` VALUES (116, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 133, '192.168.179.1', NULL, '2020-07-23 16:51:19', NULL, '2020-07-23 16:51:19');
INSERT INTO `log` VALUES (117, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 327, '192.168.179.1', NULL, '2020-07-23 17:04:55', NULL, '2020-07-23 17:04:55');
INSERT INTO `log` VALUES (118, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 119, '192.168.179.1', NULL, '2020-07-23 17:05:41', NULL, '2020-07-23 17:05:41');
INSERT INTO `log` VALUES (119, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 124, '192.168.179.1', NULL, '2020-07-23 17:10:20', NULL, '2020-07-23 17:10:20');
INSERT INTO `log` VALUES (120, NULL, '请输入正确的邮箱', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 121, '192.168.179.1', NULL, '2020-07-23 17:11:15', NULL, '2020-07-23 17:11:15');
INSERT INTO `log` VALUES (121, NULL, '请输入正确的邮箱', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7f3a9caa', 134, '192.168.179.1', NULL, '2020-07-23 17:11:31', NULL, '2020-07-23 17:11:31');
INSERT INTO `log` VALUES (122, NULL, '邮件已发出，请注意查收', 'validateEmail', 'org.apache.catalina.util.ParameterMap@57682df9', 16558, '192.168.179.1', NULL, '2020-07-23 17:13:05', NULL, '2020-07-23 17:13:05');
INSERT INTO `log` VALUES (123, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@66b75eaf', 154, '192.168.179.1', NULL, '2020-07-23 17:14:22', NULL, '2020-07-23 17:14:22');
INSERT INTO `log` VALUES (124, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@66b75eaf', 133, '192.168.179.1', NULL, '2020-07-23 17:14:26', NULL, '2020-07-23 17:14:26');
INSERT INTO `log` VALUES (125, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@66b75eaf', 134, '192.168.179.1', NULL, '2020-07-23 17:14:28', NULL, '2020-07-23 17:14:28');
INSERT INTO `log` VALUES (126, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@66b75eaf', 131, '192.168.179.1', NULL, '2020-07-23 17:14:31', NULL, '2020-07-23 17:14:31');
INSERT INTO `log` VALUES (127, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@66b75eaf', 76, '192.168.179.1', NULL, '2020-07-23 17:14:33', NULL, '2020-07-23 17:14:33');
INSERT INTO `log` VALUES (128, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@66b75eaf', 115, '192.168.179.1', NULL, '2020-07-23 17:14:35', NULL, '2020-07-23 17:14:35');
INSERT INTO `log` VALUES (129, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@66b75eaf', 101, '192.168.179.1', NULL, '2020-07-23 17:15:01', NULL, '2020-07-23 17:15:01');
INSERT INTO `log` VALUES (130, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@66b75eaf', 87, '192.168.179.1', NULL, '2020-07-23 17:15:16', NULL, '2020-07-23 17:15:16');
INSERT INTO `log` VALUES (131, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@66b75eaf', 112, '192.168.179.1', NULL, '2020-07-23 17:15:18', NULL, '2020-07-23 17:15:18');
INSERT INTO `log` VALUES (132, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@66b75eaf', 158, '192.168.179.1', NULL, '2020-07-23 17:15:24', NULL, '2020-07-23 17:15:24');
INSERT INTO `log` VALUES (133, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@66b75eaf', 483, '192.168.179.1', NULL, '2020-07-23 17:16:10', NULL, '2020-07-23 17:16:10');
INSERT INTO `log` VALUES (134, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@66b75eaf', 151, '192.168.179.1', NULL, '2020-07-23 17:16:14', NULL, '2020-07-23 17:16:14');
INSERT INTO `log` VALUES (135, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@66b75eaf', 91, '192.168.179.1', NULL, '2020-07-23 17:16:20', NULL, '2020-07-23 17:16:20');
INSERT INTO `log` VALUES (136, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@66b75eaf', 120, '192.168.179.1', NULL, '2020-07-23 17:16:27', NULL, '2020-07-23 17:16:27');
INSERT INTO `log` VALUES (137, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7de7be09', 104, '192.168.179.1', NULL, '2020-07-24 10:20:55', NULL, '2020-07-24 10:20:55');
INSERT INTO `log` VALUES (138, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7de7be09', 125, '192.168.179.1', NULL, '2020-07-24 10:25:22', NULL, '2020-07-24 10:25:22');
INSERT INTO `log` VALUES (139, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7de7be09', 111, '192.168.179.1', NULL, '2020-07-24 10:26:35', NULL, '2020-07-24 10:26:35');
INSERT INTO `log` VALUES (140, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4d17a588', 106, '192.168.179.1', NULL, '2020-07-24 10:29:49', NULL, '2020-07-24 10:29:49');
INSERT INTO `log` VALUES (141, NULL, '邮件已发出，请注意查收', 'validateEmail', 'org.apache.catalina.util.ParameterMap@7d884170', 16202, '192.168.179.1', NULL, '2020-07-24 10:35:24', NULL, '2020-07-24 10:35:24');
INSERT INTO `log` VALUES (142, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7d884170', 100, '192.168.179.1', NULL, '2020-07-24 11:09:36', NULL, '2020-07-24 11:09:36');
INSERT INTO `log` VALUES (143, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7d884170', 7884, '192.168.179.1', NULL, '2020-07-24 11:09:55', NULL, '2020-07-24 11:09:55');
INSERT INTO `log` VALUES (144, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7d884170', 145, '192.168.179.1', NULL, '2020-07-24 11:10:35', NULL, '2020-07-24 11:10:35');
INSERT INTO `log` VALUES (145, NULL, '请输入正确的邮箱', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7d884170', 457, '192.168.179.1', NULL, '2020-07-24 11:10:54', NULL, '2020-07-24 11:10:54');
INSERT INTO `log` VALUES (146, NULL, '请输入正确的邮箱', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7d884170', 102, '192.168.179.1', NULL, '2020-07-24 11:12:08', NULL, '2020-07-24 11:12:08');
INSERT INTO `log` VALUES (147, NULL, '请输入正确的邮箱', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7d884170', 90, '192.168.179.1', NULL, '2020-07-24 11:12:18', NULL, '2020-07-24 11:12:18');
INSERT INTO `log` VALUES (148, NULL, '请输入正确的邮箱', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7d884170', 85, '192.168.179.1', NULL, '2020-07-24 11:13:01', NULL, '2020-07-24 11:13:01');
INSERT INTO `log` VALUES (149, NULL, '邮件已发出，请注意查收', 'validateEmail', 'org.apache.catalina.util.ParameterMap@7d884170', 14981, '192.168.179.1', NULL, '2020-07-24 11:13:25', NULL, '2020-07-24 11:13:25');
INSERT INTO `log` VALUES (150, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7d884170', 158, '192.168.179.1', NULL, '2020-07-24 11:15:17', NULL, '2020-07-24 11:15:17');
INSERT INTO `log` VALUES (151, NULL, '邮件已发出，请注意查收', 'validateEmail', 'org.apache.catalina.util.ParameterMap@7d884170', 18626, '192.168.179.1', NULL, '2020-07-24 11:15:53', NULL, '2020-07-24 11:15:53');
INSERT INTO `log` VALUES (152, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7d884170', 100, '192.168.179.1', NULL, '2020-07-24 11:19:19', NULL, '2020-07-24 11:19:19');
INSERT INTO `log` VALUES (153, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7d884170', 196, '192.168.179.1', NULL, '2020-07-24 11:21:45', NULL, '2020-07-24 11:21:45');
INSERT INTO `log` VALUES (154, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@7d884170', 231, '192.168.179.1', NULL, '2020-07-24 11:30:50', NULL, '2020-07-24 11:30:50');
INSERT INTO `log` VALUES (155, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@7d884170', 92, '192.168.179.1', NULL, '2020-07-24 11:31:02', NULL, '2020-07-24 11:31:02');
INSERT INTO `log` VALUES (156, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a4507d5', 8171, '192.168.179.1', NULL, '2020-07-27 15:21:59', NULL, '2020-07-27 15:21:59');
INSERT INTO `log` VALUES (157, NULL, '邮件已发出，请注意查收', 'validateEmail', 'org.apache.catalina.util.ParameterMap@4a4507d5', 12572, '192.168.179.1', NULL, '2020-07-27 15:22:46', NULL, '2020-07-27 15:22:46');
INSERT INTO `log` VALUES (158, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@4a4507d5', 688, '192.168.179.1', NULL, '2020-07-27 15:23:09', NULL, '2020-07-27 15:23:09');
INSERT INTO `log` VALUES (159, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a4507d5', 267, '192.168.179.1', NULL, '2020-07-27 15:39:28', NULL, '2020-07-27 15:39:28');
INSERT INTO `log` VALUES (160, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a4507d5', 1219, '192.168.179.1', NULL, '2020-07-27 16:10:17', NULL, '2020-07-27 16:10:17');
INSERT INTO `log` VALUES (161, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@3355e0df', 160, '192.168.179.1', NULL, '2020-07-27 16:10:18', NULL, '2020-07-27 16:10:18');
INSERT INTO `log` VALUES (162, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@4a4507d5', 546, '192.168.179.1', NULL, '2020-07-27 16:10:32', NULL, '2020-07-27 16:10:32');
INSERT INTO `log` VALUES (163, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@4a4507d5', 1050, '192.168.179.1', NULL, '2020-07-27 16:11:45', NULL, '2020-07-27 16:11:45');
INSERT INTO `log` VALUES (164, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a4507d5', 330, '192.168.179.1', NULL, '2020-07-27 16:18:29', NULL, '2020-07-27 16:18:29');
INSERT INTO `log` VALUES (165, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@4a4507d5', 72, '192.168.179.1', NULL, '2020-07-27 16:18:41', NULL, '2020-07-27 16:18:41');
INSERT INTO `log` VALUES (166, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a4507d5', 172, '192.168.179.1', NULL, '2020-07-27 17:16:47', NULL, '2020-07-27 17:16:47');
INSERT INTO `log` VALUES (167, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a4507d5', 272, '192.168.179.1', NULL, '2020-07-28 10:56:24', NULL, '2020-07-28 10:56:24');
INSERT INTO `log` VALUES (168, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 93, '192.168.179.1', NULL, '2020-07-28 10:58:37', NULL, '2020-07-28 10:58:37');
INSERT INTO `log` VALUES (169, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 248, '192.168.179.1', NULL, '2020-07-28 10:59:29', NULL, '2020-07-28 10:59:29');
INSERT INTO `log` VALUES (170, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 177, '192.168.179.1', NULL, '2020-07-28 11:19:08', NULL, '2020-07-28 11:19:08');
INSERT INTO `log` VALUES (171, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 136, '192.168.179.1', NULL, '2020-07-28 11:22:44', NULL, '2020-07-28 11:22:44');
INSERT INTO `log` VALUES (172, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 446, '192.168.179.1', NULL, '2020-07-28 11:23:13', NULL, '2020-07-28 11:23:13');
INSERT INTO `log` VALUES (173, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 134, '192.168.179.1', NULL, '2020-07-28 14:51:17', NULL, '2020-07-28 14:51:17');
INSERT INTO `log` VALUES (174, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 146, '192.168.179.1', NULL, '2020-07-28 14:51:18', NULL, '2020-07-28 14:51:18');
INSERT INTO `log` VALUES (175, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 127, '192.168.179.1', NULL, '2020-07-28 15:00:13', NULL, '2020-07-28 15:00:13');
INSERT INTO `log` VALUES (176, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 101, '192.168.179.1', NULL, '2020-07-28 15:02:32', NULL, '2020-07-28 15:02:32');
INSERT INTO `log` VALUES (177, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 113, '192.168.179.1', NULL, '2020-07-28 15:02:33', NULL, '2020-07-28 15:02:33');
INSERT INTO `log` VALUES (178, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 1149, '192.168.179.1', NULL, '2020-07-29 11:52:36', NULL, '2020-07-29 11:52:36');
INSERT INTO `log` VALUES (179, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 153, '192.168.179.1', NULL, '2020-07-29 11:52:39', NULL, '2020-07-29 11:52:39');
INSERT INTO `log` VALUES (180, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 134, '192.168.179.1', NULL, '2020-07-29 11:55:09', NULL, '2020-07-29 11:55:09');
INSERT INTO `log` VALUES (181, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 128, '192.168.179.1', NULL, '2020-07-29 12:02:34', NULL, '2020-07-29 12:02:34');
INSERT INTO `log` VALUES (182, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 190, '192.168.179.1', NULL, '2020-07-29 12:05:22', NULL, '2020-07-29 12:05:22');
INSERT INTO `log` VALUES (183, NULL, '请输入正确的邮箱', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 33210, '192.168.179.1', NULL, '2020-07-29 14:18:19', NULL, '2020-07-29 14:18:19');
INSERT INTO `log` VALUES (184, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 8716, '192.168.179.1', NULL, '2020-07-29 14:19:03', NULL, '2020-07-29 14:19:03');
INSERT INTO `log` VALUES (185, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 7709, '192.168.179.1', NULL, '2020-07-29 14:19:25', NULL, '2020-07-29 14:19:25');
INSERT INTO `log` VALUES (186, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 220, '192.168.179.1', NULL, '2020-07-29 15:06:43', NULL, '2020-07-29 15:06:43');
INSERT INTO `log` VALUES (187, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 151, '192.168.179.1', NULL, '2020-07-29 15:09:34', NULL, '2020-07-29 15:09:34');
INSERT INTO `log` VALUES (188, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 161, '192.168.179.1', NULL, '2020-07-29 15:52:03', NULL, '2020-07-29 15:52:03');
INSERT INTO `log` VALUES (189, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 387, '192.168.179.1', NULL, '2020-07-29 15:52:47', NULL, '2020-07-29 15:52:47');
INSERT INTO `log` VALUES (190, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 179, '192.168.179.1', NULL, '2020-07-29 15:54:36', NULL, '2020-07-29 15:54:36');
INSERT INTO `log` VALUES (191, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 580, '192.168.179.1', NULL, '2020-07-29 15:59:19', NULL, '2020-07-29 15:59:19');
INSERT INTO `log` VALUES (192, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 181, '192.168.179.1', NULL, '2020-07-29 16:19:51', NULL, '2020-07-29 16:19:51');
INSERT INTO `log` VALUES (193, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 219, '192.168.179.1', NULL, '2020-07-29 16:39:36', NULL, '2020-07-29 16:39:36');
INSERT INTO `log` VALUES (194, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 197, '192.168.179.1', NULL, '2020-07-29 16:58:13', NULL, '2020-07-29 16:58:13');
INSERT INTO `log` VALUES (195, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@75fe570b', 155, '192.168.179.1', NULL, '2020-07-29 17:00:08', NULL, '2020-07-29 17:00:08');
INSERT INTO `log` VALUES (196, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 88, '192.168.179.1', NULL, '2020-07-29 17:00:44', NULL, '2020-07-29 17:00:44');
INSERT INTO `log` VALUES (197, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 329, '192.168.179.1', NULL, '2020-07-30 09:53:42', NULL, '2020-07-30 09:53:42');
INSERT INTO `log` VALUES (198, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 91, '192.168.179.1', NULL, '2020-07-30 09:54:11', NULL, '2020-07-30 09:54:11');
INSERT INTO `log` VALUES (199, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@75fe570b', 226, '192.168.179.1', NULL, '2020-07-30 10:19:24', NULL, '2020-07-30 10:19:24');
INSERT INTO `log` VALUES (200, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@274ff8ce', 145, '192.168.179.1', NULL, '2020-07-30 10:23:27', NULL, '2020-07-30 10:23:27');
INSERT INTO `log` VALUES (201, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@a8af28', 222, '192.168.179.1', NULL, '2020-07-30 11:02:36', NULL, '2020-07-30 11:02:36');
INSERT INTO `log` VALUES (202, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@a8af28', 245, '192.168.179.1', NULL, '2020-07-30 11:04:41', NULL, '2020-07-30 11:04:41');
INSERT INTO `log` VALUES (203, NULL, NULL, 'profile', NULL, 31836, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `log` VALUES (204, NULL, NULL, 'profile', NULL, 13284, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `log` VALUES (205, NULL, NULL, 'profile', NULL, 6795, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `log` VALUES (206, NULL, NULL, 'profile', NULL, 7209, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `log` VALUES (207, NULL, NULL, 'profile', NULL, 17507, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `log` VALUES (208, NULL, NULL, 'profile', NULL, 14928497, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `log` VALUES (209, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@2dd336a2', 3580, '192.168.179.1', NULL, '2020-07-30 16:47:20', NULL, '2020-07-30 16:47:20');
INSERT INTO `log` VALUES (210, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@2dd336a2', 388, '192.168.179.1', NULL, '2020-07-30 16:47:47', NULL, '2020-07-30 16:47:47');
INSERT INTO `log` VALUES (211, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@ecd90d5', 166, '192.168.179.1', NULL, '2020-07-30 16:51:11', NULL, '2020-07-30 16:51:11');
INSERT INTO `log` VALUES (212, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@ecd90d5', 111, '192.168.179.1', NULL, '2020-07-30 16:52:31', NULL, '2020-07-30 16:52:31');
INSERT INTO `log` VALUES (213, NULL, '修改失败', 'profile', 'Customer [id=null, nickname=baadad, loginname=null, passwd=null, createBy=null, createTime=null, lastUpdateBy=null, lastUpdateTime=null, avatar=null, salt=null, status=null, delFlag=null, email=null, mobile=18779334084, sex=true, birth=Thu Jul 30 00:00:00 CST 2020]', 10848, '192.168.179.1', NULL, '2020-07-30 16:53:44', NULL, '2020-07-30 16:53:44');
INSERT INTO `log` VALUES (214, NULL, '修改失败', 'profile', 'Customer [id=null, nickname=baadad, loginname=null, passwd=null, createBy=null, createTime=Thu Jul 30 16:57:08 CST 2020, lastUpdateBy=null, lastUpdateTime=Thu Jul 30 16:57:08 CST 2020, avatar=null, salt=null, status=null, delFlag=null, email=null, mobile=18779334084, sex=true, birth=Thu Jul 30 00:00:00 CST 2020]', 35760, '192.168.179.1', NULL, '2020-07-30 16:57:08', NULL, '2020-07-30 16:57:08');
INSERT INTO `log` VALUES (215, NULL, '修改成功', 'profile', 'Customer [id=null, nickname=baadad, loginname=null, passwd=null, createBy=null, createTime=Thu Jul 30 16:58:57 CST 2020, lastUpdateBy=null, lastUpdateTime=Thu Jul 30 16:58:57 CST 2020, avatar=null, salt=null, status=null, delFlag=null, email=null, mobile=18779334084, sex=true, birth=Thu Jul 30 00:00:00 CST 2020]', 12309, '192.168.179.1', NULL, '2020-07-30 16:58:57', NULL, '2020-07-30 16:58:57');
INSERT INTO `log` VALUES (216, NULL, '修改成功', 'profile', 'Customer [id=null, nickname=xiao, loginname=null, passwd=null, createBy=null, createTime=Thu Jul 30 16:59:54 CST 2020, lastUpdateBy=null, lastUpdateTime=Thu Jul 30 16:59:54 CST 2020, avatar=null, salt=null, status=null, delFlag=null, email=null, mobile=18779334084, sex=true, birth=Thu Jul 30 00:00:00 CST 2020]', 41, '192.168.179.1', NULL, '2020-07-30 16:59:55', NULL, '2020-07-30 16:59:55');
INSERT INTO `log` VALUES (217, NULL, '修改成功', 'profile', 'Customer [id=null, nickname=xiao, loginname=null, passwd=null, createBy=null, createTime=Thu Jul 30 17:03:19 CST 2020, lastUpdateBy=null, lastUpdateTime=Thu Jul 30 17:03:19 CST 2020, avatar=null, salt=null, status=null, delFlag=null, email=null, mobile=18779334084, sex=true, birth=Thu Jul 30 00:00:00 CST 2020]', 80, '192.168.179.1', NULL, '2020-07-30 17:03:19', NULL, '2020-07-30 17:03:19');
INSERT INTO `log` VALUES (218, NULL, '修改成功', 'profile', 'Customer [id=null, nickname=xiao, loginname=null, passwd=null, createBy=null, createTime=Thu Jul 30 17:03:34 CST 2020, lastUpdateBy=null, lastUpdateTime=Thu Jul 30 17:03:34 CST 2020, avatar=null, salt=null, status=null, delFlag=null, email=null, mobile=18779334084, sex=true, birth=Thu Jul 30 00:00:00 CST 2020]', 34, '192.168.179.1', NULL, '2020-07-30 17:03:35', NULL, '2020-07-30 17:03:35');
INSERT INTO `log` VALUES (219, NULL, '修改成功', 'profile', 'Customer [id=null, nickname=xiao, loginname=null, passwd=null, createBy=null, createTime=Thu Jul 30 17:04:03 CST 2020, lastUpdateBy=null, lastUpdateTime=Thu Jul 30 17:04:03 CST 2020, avatar=null, salt=null, status=null, delFlag=null, email=null, mobile=18779334084, sex=true, birth=Thu Jul 30 00:00:00 CST 2020]', 41, '192.168.179.1', NULL, '2020-07-30 17:04:04', NULL, '2020-07-30 17:04:04');
INSERT INTO `log` VALUES (220, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@71c5e7bf', 21515, '192.168.179.1', NULL, '2020-07-31 14:16:42', NULL, '2020-07-31 14:16:42');
INSERT INTO `log` VALUES (221, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@481bd6ac', 1076, '192.168.179.1', NULL, '2020-07-31 16:41:37', NULL, '2020-07-31 16:41:37');
INSERT INTO `log` VALUES (222, NULL, '修改成功', 'profile', 'Customer [id=null, nickname=乔峰, loginname=null, passwd=null, createBy=null, createTime=Fri Jul 31 16:42:22 CST 2020, lastUpdateBy=null, lastUpdateTime=Fri Jul 31 16:42:22 CST 2020, avatar=http://118.25.130.181/data/00/00/rBEADl8j2XCANRzNAAC7SmqwtG0802.jpg, salt=null, status=null, delFlag=null, email=null, mobile=15970356433, sex=true, birth=Mon Jul 31 00:00:00 CST 2017]', 17334, '192.168.179.1', NULL, '2020-07-31 16:42:23', NULL, '2020-07-31 16:42:23');
INSERT INTO `log` VALUES (223, NULL, '修改成功', 'profile', 'Customer [id=null, nickname=乔峰, loginname=null, passwd=null, createBy=null, createTime=Fri Jul 31 16:43:27 CST 2020, lastUpdateBy=null, lastUpdateTime=Fri Jul 31 16:43:27 CST 2020, avatar=http://118.25.130.181/data/00/00/rBEADl8j2a6AMUAfAAC7SmqwtG0986.jpg, salt=null, status=null, delFlag=null, email=null, mobile=15970356433, sex=true, birth=Mon Jul 31 00:00:00 CST 2017]', 1327, '192.168.179.1', NULL, '2020-07-31 16:43:27', NULL, '2020-07-31 16:43:27');
INSERT INTO `log` VALUES (224, NULL, '修改成功', 'profile', 'Customer [id=null, nickname=乔峰, loginname=null, passwd=null, createBy=null, createTime=Fri Jul 31 16:48:31 CST 2020, lastUpdateBy=null, lastUpdateTime=Fri Jul 31 16:48:31 CST 2020, avatar=118.25.130.181/data/00/00/rBEADl8j2t2AbgAPAAArUOsiBNw115.jpg, salt=null, status=null, delFlag=null, email=null, mobile=15970356433, sex=true, birth=Mon Jul 31 00:00:00 CST 2017]', 1067, '192.168.179.1', NULL, '2020-07-31 16:48:31', NULL, '2020-07-31 16:48:31');
INSERT INTO `log` VALUES (225, NULL, '修改成功', 'profile', 'Customer [id=null, nickname=乔峰, loginname=null, passwd=null, createBy=null, createTime=Fri Jul 31 16:59:29 CST 2020, lastUpdateBy=null, lastUpdateTime=Fri Jul 31 16:59:29 CST 2020, avatar=118.25.130.181/data/00/00/rBEADl8j3XCAacfuAAC7SmqwtG0107.jpg, salt=null, status=null, delFlag=null, email=null, mobile=15970356433, sex=true, birth=Mon Jul 31 00:00:00 CST 2017]', 1582, '192.168.179.1', NULL, '2020-07-31 16:59:30', NULL, '2020-07-31 16:59:30');
INSERT INTO `log` VALUES (226, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@2cfb2dea', 2346, '192.168.179.1', NULL, '2020-08-03 12:19:28', NULL, '2020-08-03 12:19:28');
INSERT INTO `log` VALUES (227, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@2cfb2dea', 1845, '192.168.179.1', NULL, '2020-08-03 12:21:50', NULL, '2020-08-03 12:21:50');
INSERT INTO `log` VALUES (228, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@2cfb2dea', 151, '192.168.179.1', NULL, '2020-08-03 12:24:00', NULL, '2020-08-03 12:24:00');
INSERT INTO `log` VALUES (229, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@595c0811', 491, '192.168.179.1', NULL, '2020-08-03 13:51:41', NULL, '2020-08-03 13:51:41');
INSERT INTO `log` VALUES (230, '1446778774', '获得用户信息成功', 'getInfo', '1', 18910, '127.0.0.1', '1446778774', '2020-08-03 14:53:55', '1446778774', '2020-08-03 14:53:55');
INSERT INTO `log` VALUES (231, '1446778774', '获得用户信息成功', 'getInfo', '1', 16, '127.0.0.1', '1446778774', '2020-08-03 14:57:29', '1446778774', '2020-08-03 14:57:29');
INSERT INTO `log` VALUES (232, '1446778774', '获得用户信息成功', 'getInfo', '1', 5, '127.0.0.1', '1446778774', '2020-08-03 14:58:00', '1446778774', '2020-08-03 14:58:00');
INSERT INTO `log` VALUES (233, '1446778774', '获得用户信息成功', 'getInfo', '1', 21, '127.0.0.1', '1446778774', '2020-08-03 16:05:36', '1446778774', '2020-08-03 16:05:36');
INSERT INTO `log` VALUES (234, '1446778774', '获得用户信息成功', 'getInfo', '1', 8, '127.0.0.1', '1446778774', '2020-08-03 16:15:11', '1446778774', '2020-08-03 16:15:11');
INSERT INTO `log` VALUES (235, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@efc439b', 4619, '192.168.179.1', NULL, '2020-08-04 12:14:41', NULL, '2020-08-04 12:14:41');
INSERT INTO `log` VALUES (236, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@efc439b', 182, '192.168.179.1', NULL, '2020-08-04 14:15:49', NULL, '2020-08-04 14:15:49');
INSERT INTO `log` VALUES (237, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@efc439b', 453, '192.168.179.1', NULL, '2020-08-04 16:07:00', NULL, '2020-08-04 16:07:00');
INSERT INTO `log` VALUES (238, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@318df31e', 3564, '192.168.179.1', NULL, '2020-08-05 09:28:22', NULL, '2020-08-05 09:28:22');
INSERT INTO `log` VALUES (239, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@318df31e', 239, '192.168.179.1', NULL, '2020-08-05 10:21:37', NULL, '2020-08-05 10:21:37');
INSERT INTO `log` VALUES (240, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@318df31e', 992, '127.0.0.1', NULL, '2020-08-05 10:28:07', NULL, '2020-08-05 10:28:07');
INSERT INTO `log` VALUES (241, '1446778774', '获得用户信息成功', 'getInfo', '1', 60799, '127.0.0.1', '1446778774', '2020-08-05 11:36:56', '1446778774', '2020-08-05 11:36:56');
INSERT INTO `log` VALUES (242, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a15400d', 14470, '192.168.179.1', NULL, '2020-08-05 12:19:05', NULL, '2020-08-05 12:19:05');
INSERT INTO `log` VALUES (243, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a15400d', 130, '192.168.179.1', NULL, '2020-08-05 12:20:48', NULL, '2020-08-05 12:20:48');
INSERT INTO `log` VALUES (244, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a15400d', 105, '192.168.179.1', NULL, '2020-08-05 12:21:01', NULL, '2020-08-05 12:21:01');
INSERT INTO `log` VALUES (245, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a15400d', 110, '192.168.179.1', NULL, '2020-08-05 12:21:54', NULL, '2020-08-05 12:21:54');
INSERT INTO `log` VALUES (246, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a15400d', 130, '192.168.179.1', NULL, '2020-08-05 12:23:58', NULL, '2020-08-05 12:23:58');
INSERT INTO `log` VALUES (247, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a15400d', 114, '192.168.179.1', NULL, '2020-08-05 12:24:06', NULL, '2020-08-05 12:24:06');
INSERT INTO `log` VALUES (248, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a15400d', 311, '192.168.179.1', NULL, '2020-08-05 14:25:00', NULL, '2020-08-05 14:25:00');
INSERT INTO `log` VALUES (249, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a15400d', 131, '192.168.179.1', NULL, '2020-08-05 14:32:14', NULL, '2020-08-05 14:32:14');
INSERT INTO `log` VALUES (250, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a15400d', 108, '192.168.179.1', NULL, '2020-08-05 14:41:10', NULL, '2020-08-05 14:41:10');
INSERT INTO `log` VALUES (251, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a15400d', 127, '192.168.179.1', NULL, '2020-08-05 14:41:59', NULL, '2020-08-05 14:41:59');
INSERT INTO `log` VALUES (252, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a15400d', 121, '192.168.179.1', NULL, '2020-08-05 15:03:56', NULL, '2020-08-05 15:03:56');
INSERT INTO `log` VALUES (253, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a15400d', 128, '192.168.179.1', NULL, '2020-08-05 15:08:01', NULL, '2020-08-05 15:08:01');
INSERT INTO `log` VALUES (254, NULL, '获取验证码', 'captcha', '{click=[Ljava.lang.String;@32516b11}', 3575, '127.0.0.1', NULL, '2020-08-10 10:11:26', NULL, '2020-08-10 10:11:26');
INSERT INTO `log` VALUES (255, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4728bae9', 225, '192.168.179.1', NULL, '2020-08-10 11:17:33', NULL, '2020-08-10 11:17:33');
INSERT INTO `log` VALUES (256, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4728bae9', 169, '192.168.179.1', NULL, '2020-08-10 11:17:41', NULL, '2020-08-10 11:17:41');
INSERT INTO `log` VALUES (257, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@4728bae9', 185, '192.168.179.1', NULL, '2020-08-10 11:22:08', NULL, '2020-08-10 11:22:08');
INSERT INTO `log` VALUES (258, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@4728bae9', 141, '192.168.179.1', NULL, '2020-08-10 11:22:39', NULL, '2020-08-10 11:22:39');
INSERT INTO `log` VALUES (259, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@69b47b36', 4992, '127.0.0.1', NULL, '2020-08-11 09:36:16', NULL, '2020-08-11 09:36:16');
INSERT INTO `log` VALUES (260, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@69b47b36', 108, '192.168.179.1', NULL, '2020-08-11 09:41:39', NULL, '2020-08-11 09:41:39');
INSERT INTO `log` VALUES (261, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@69b47b36', 261, '192.168.179.1', NULL, '2020-08-11 09:43:11', NULL, '2020-08-11 09:43:11');
INSERT INTO `log` VALUES (262, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@69b47b36', 166, '192.168.179.1', NULL, '2020-08-11 10:04:25', NULL, '2020-08-11 10:04:25');
INSERT INTO `log` VALUES (263, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@69b47b36', 119, '192.168.179.1', NULL, '2020-08-11 11:00:56', NULL, '2020-08-11 11:00:56');
INSERT INTO `log` VALUES (264, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@69b47b36', 178, '192.168.179.1', NULL, '2020-08-11 11:01:47', NULL, '2020-08-11 11:01:47');
INSERT INTO `log` VALUES (265, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@69b47b36', 134, '192.168.179.1', NULL, '2020-08-11 11:37:00', NULL, '2020-08-11 11:37:00');
INSERT INTO `log` VALUES (266, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@69b47b36', 109, '192.168.179.1', NULL, '2020-08-11 11:43:33', NULL, '2020-08-11 11:43:33');
INSERT INTO `log` VALUES (267, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@69b47b36', 179, '192.168.179.1', NULL, '2020-08-11 11:44:38', NULL, '2020-08-11 11:44:38');
INSERT INTO `log` VALUES (268, NULL, '修改成功', 'profile', 'cn.jjvu.xiao.pojo.Customer@7e97b002', 21385, '192.168.179.1', NULL, '2020-08-11 14:36:07', NULL, '2020-08-11 14:36:07');
INSERT INTO `log` VALUES (269, NULL, '修改成功', 'profile', 'cn.jjvu.xiao.pojo.Customer@7ba9b2ae', 237, '192.168.179.1', NULL, '2020-08-11 14:41:11', NULL, '2020-08-11 14:41:11');
INSERT INTO `log` VALUES (270, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@746a2411', 214, '192.168.179.1', NULL, '2020-08-11 14:55:28', NULL, '2020-08-11 14:55:28');
INSERT INTO `log` VALUES (271, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@746a2411', 4273, '192.168.179.1', NULL, '2020-08-11 15:05:47', NULL, '2020-08-11 15:05:47');
INSERT INTO `log` VALUES (272, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@746a2411', 192, '192.168.179.1', NULL, '2020-08-11 15:05:58', NULL, '2020-08-11 15:05:58');
INSERT INTO `log` VALUES (273, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@746a2411', 111, '192.168.179.1', NULL, '2020-08-11 15:21:22', NULL, '2020-08-11 15:21:22');
INSERT INTO `log` VALUES (274, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@746a2411', 144, '192.168.179.1', NULL, '2020-08-11 15:21:39', NULL, '2020-08-11 15:21:39');
INSERT INTO `log` VALUES (275, NULL, '修改成功', 'profile', 'cn.jjvu.xiao.pojo.Customer@8ca753d', 2448, '192.168.179.1', NULL, '2020-08-11 15:32:15', NULL, '2020-08-11 15:32:15');
INSERT INTO `log` VALUES (276, '745567172@qq.com', '修改成功', 'profile', 'cn.jjvu.xiao.pojo.Customer@9c2844f', 431, '192.168.179.1', '745567172@qq.com', '2020-08-11 15:33:37', '745567172@qq.com', '2020-08-11 15:33:37');
INSERT INTO `log` VALUES (277, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4ec9c182', 6149, '192.168.179.1', NULL, '2020-08-11 16:03:46', NULL, '2020-08-11 16:03:46');
INSERT INTO `log` VALUES (278, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@4ec9c182', 260, '192.168.179.1', NULL, '2020-08-11 16:11:26', NULL, '2020-08-11 16:11:26');
INSERT INTO `log` VALUES (279, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@f9343e', 825, '192.168.179.1', NULL, '2020-08-11 16:16:08', NULL, '2020-08-11 16:16:08');
INSERT INTO `log` VALUES (280, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@f9343e', 181, '192.168.179.1', NULL, '2020-08-11 16:16:27', NULL, '2020-08-11 16:16:27');
INSERT INTO `log` VALUES (281, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@f9343e', 138, '192.168.179.1', NULL, '2020-08-11 16:18:43', NULL, '2020-08-11 16:18:43');
INSERT INTO `log` VALUES (282, NULL, '注册成功', 'registerByEmail', 'org.apache.catalina.util.ParameterMap@f9343e', 221, '192.168.179.1', NULL, '2020-08-11 16:19:19', NULL, '2020-08-11 16:19:19');
INSERT INTO `log` VALUES (283, 'm18779334084@163.com', '修改成功', 'profile', 'cn.jjvu.xiao.pojo.Customer@405a56f7', 926, '192.168.179.1', '745567172@qq.com', '2020-08-11 16:22:07', '745567172@qq.com', '2020-08-11 16:22:07');
INSERT INTO `log` VALUES (284, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@4a040e3', 1876, '127.0.0.1', NULL, '2020-08-11 16:43:20', NULL, '2020-08-11 16:43:20');
INSERT INTO `log` VALUES (285, NULL, '登录成功', 'login', '登录账号：m18779334084@163.com密码：745567172', 199, '127.0.0.1', NULL, '2020-08-11 16:46:32', NULL, '2020-08-11 16:46:32');
INSERT INTO `log` VALUES (286, NULL, '登录成功', 'login', '登录账号：m18779334084@163.com密码：7758521', 161, '127.0.0.1', NULL, '2020-08-11 16:46:53', NULL, '2020-08-11 16:46:53');
INSERT INTO `log` VALUES (287, NULL, '登录成功', 'login', '登录账号：m18779334084@163.com密码：7758521', 23204, '127.0.0.1', NULL, '2020-08-11 16:47:38', NULL, '2020-08-11 16:47:38');
INSERT INTO `log` VALUES (288, NULL, '登录成功', 'login', '登录账号：m18779334084@163.com密码：7758521', 40243, '127.0.0.1', NULL, '2020-08-11 16:49:52', NULL, '2020-08-11 16:49:52');
INSERT INTO `log` VALUES (289, NULL, '登录成功', 'login', '登录账号：m18779334084@163.com密码：7758521', 122, '127.0.0.1', NULL, '2020-08-11 16:51:57', NULL, '2020-08-11 16:51:57');
INSERT INTO `log` VALUES (290, NULL, '登录成功', 'login', '登录账号：m18779334084@163.com密码：7758521', 5200, '127.0.0.1', NULL, '2020-08-11 16:52:29', NULL, '2020-08-11 16:52:29');
INSERT INTO `log` VALUES (291, NULL, '登录成功', 'login', '登录账号：m18779334084@163.com密码：7758521', 2721, '127.0.0.1', NULL, '2020-08-11 16:53:07', NULL, '2020-08-11 16:53:07');
INSERT INTO `log` VALUES (292, NULL, '获取验证码', 'captcha', 'org.apache.catalina.util.ParameterMap@1c750c09', 1758, '127.0.0.1', NULL, '2020-08-11 16:55:30', NULL, '2020-08-11 16:55:30');
INSERT INTO `log` VALUES (293, 'm18779334084@163.com', '获得用户信息成功', 'getInfo', 'm18779334084@163.com', 57, '127.0.0.1', 'm18779334084@163.com', '2020-08-11 16:59:13', 'm18779334084@163.com', '2020-08-11 16:59:13');

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录状态',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES (1, '慕夏', '0', '127.0.0.1', '1', '2020-06-22 09:59:36', '1', '2020-06-22 09:59:36');
INSERT INTO `login_log` VALUES (2, '慕夏', '0', '127.0.0.1', '1', '2020-06-22 10:10:04', '1', '2020-06-22 10:10:04');
INSERT INTO `login_log` VALUES (3, '慕夏', '0', '127.0.0.1', '1', '2020-06-22 13:58:59', '1', '2020-06-22 13:58:59');
INSERT INTO `login_log` VALUES (4, '慕夏', '0', '192.168.179.1', '1', '2020-06-22 16:34:08', '1', '2020-06-22 16:34:08');
INSERT INTO `login_log` VALUES (5, '慕夏', '0', '192.168.179.1', '1', '2020-06-22 16:39:27', '1', '2020-06-22 16:39:27');
INSERT INTO `login_log` VALUES (6, '慕夏', '0', '192.168.179.1', '1', '2020-07-15 12:00:51', '1', '2020-07-15 12:00:51');
INSERT INTO `login_log` VALUES (7, '慕夏', '0', '127.0.0.1', '1', '2020-07-15 14:55:02', '1', '2020-07-15 14:55:02');
INSERT INTO `login_log` VALUES (8, '慕夏', '0', '127.0.0.1', '1', '2020-07-15 15:13:30', '1', '2020-07-15 15:13:30');
INSERT INTO `login_log` VALUES (9, '慕夏', '0', '192.168.179.1', '1', '2020-07-15 16:19:23', '1', '2020-07-15 16:19:23');
INSERT INTO `login_log` VALUES (10, '慕夏', '0', '192.168.179.1', '1', '2020-07-15 17:16:31', '1', '2020-07-15 17:16:31');
INSERT INTO `login_log` VALUES (11, '慕夏', '0', '192.168.179.1', '1', '2020-07-15 17:21:26', '1', '2020-07-15 17:21:26');
INSERT INTO `login_log` VALUES (12, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 08:36:16', '1', '2020-07-16 08:36:16');
INSERT INTO `login_log` VALUES (13, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 08:40:37', '1', '2020-07-16 08:40:37');
INSERT INTO `login_log` VALUES (14, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 08:46:35', '1', '2020-07-16 08:46:35');
INSERT INTO `login_log` VALUES (15, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 08:47:16', '1', '2020-07-16 08:47:16');
INSERT INTO `login_log` VALUES (16, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 08:59:17', '1', '2020-07-16 08:59:17');
INSERT INTO `login_log` VALUES (17, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 09:00:25', '1', '2020-07-16 09:00:25');
INSERT INTO `login_log` VALUES (18, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 09:01:31', '1', '2020-07-16 09:01:31');
INSERT INTO `login_log` VALUES (19, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 09:02:36', '1', '2020-07-16 09:02:36');
INSERT INTO `login_log` VALUES (20, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 09:03:44', '1', '2020-07-16 09:03:44');
INSERT INTO `login_log` VALUES (21, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 09:23:17', '1', '2020-07-16 09:23:17');
INSERT INTO `login_log` VALUES (22, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 09:23:59', '1', '2020-07-16 09:23:59');
INSERT INTO `login_log` VALUES (23, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 10:04:05', '1', '2020-07-16 10:04:05');
INSERT INTO `login_log` VALUES (24, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 10:05:18', '1', '2020-07-16 10:05:18');
INSERT INTO `login_log` VALUES (25, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 10:07:45', '1', '2020-07-16 10:07:45');
INSERT INTO `login_log` VALUES (26, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 10:09:10', '1', '2020-07-16 10:09:10');
INSERT INTO `login_log` VALUES (27, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 10:26:23', '1', '2020-07-16 10:26:23');
INSERT INTO `login_log` VALUES (28, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 11:03:40', '1', '2020-07-16 11:03:40');
INSERT INTO `login_log` VALUES (29, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 11:06:57', '1', '2020-07-16 11:06:57');
INSERT INTO `login_log` VALUES (30, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 11:08:43', '1', '2020-07-16 11:08:43');
INSERT INTO `login_log` VALUES (31, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 11:11:04', '1', '2020-07-16 11:11:04');
INSERT INTO `login_log` VALUES (32, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 14:54:38', '1', '2020-07-16 14:54:38');
INSERT INTO `login_log` VALUES (33, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 15:27:12', '1', '2020-07-16 15:27:12');
INSERT INTO `login_log` VALUES (34, '慕夏', '0', '192.168.179.1', '1', '2020-07-16 16:06:51', '1', '2020-07-16 16:06:51');
INSERT INTO `login_log` VALUES (35, '慕夏', '0', '127.0.0.1', '1', '2020-07-20 11:21:22', '1', '2020-07-20 11:21:22');
INSERT INTO `login_log` VALUES (36, '慕夏', '0', '127.0.0.1', '1', '2020-07-20 11:47:26', '1', '2020-07-20 11:47:26');
INSERT INTO `login_log` VALUES (37, '慕夏', '0', '127.0.0.1', '1', '2020-07-20 11:47:28', '1', '2020-07-20 11:47:28');
INSERT INTO `login_log` VALUES (38, '慕夏', '0', '192.168.179.1', '1', '2020-07-28 15:02:50', '1', '2020-07-28 15:02:50');
INSERT INTO `login_log` VALUES (39, '慕夏', '0', '192.168.179.1', '1', '2020-07-29 11:53:03', '1', '2020-07-29 11:53:03');
INSERT INTO `login_log` VALUES (40, '慕夏', '0', '192.168.179.1', '1', '2020-07-29 12:06:12', '1', '2020-07-29 12:06:12');
INSERT INTO `login_log` VALUES (41, '慕夏', '0', '192.168.179.1', '1', '2020-07-29 15:06:55', '1', '2020-07-29 15:06:55');
INSERT INTO `login_log` VALUES (42, '慕夏', '0', '192.168.179.1', '1', '2020-07-29 15:07:00', '1', '2020-07-29 15:07:00');
INSERT INTO `login_log` VALUES (43, '慕夏', '0', '192.168.179.1', '1', '2020-07-29 15:07:31', '1', '2020-07-29 15:07:31');
INSERT INTO `login_log` VALUES (44, '慕夏', '0', '192.168.179.1', '1', '2020-08-04 12:14:53', '1', '2020-08-04 12:14:53');
INSERT INTO `login_log` VALUES (45, '慕夏', '0', '192.168.179.1', '1', '2020-08-04 14:16:33', '1', '2020-08-04 14:16:33');
INSERT INTO `login_log` VALUES (46, '慕夏', '0', '192.168.179.1', '1', '2020-08-04 16:12:14', '1', '2020-08-04 16:12:14');
INSERT INTO `login_log` VALUES (47, '慕夏', '0', '192.168.179.1', '1', '2020-08-04 16:12:46', '1', '2020-08-04 16:12:46');
INSERT INTO `login_log` VALUES (48, '慕夏', '0', '192.168.179.1', '1', '2020-08-05 09:28:35', '1', '2020-08-05 09:28:35');
INSERT INTO `login_log` VALUES (49, '慕夏', '0', '192.168.179.1', '1', '2020-08-05 10:26:45', '1', '2020-08-05 10:26:45');
INSERT INTO `login_log` VALUES (50, '慕夏', '0', '127.0.0.1', '1', '2020-08-05 10:28:17', '1', '2020-08-05 10:28:17');
INSERT INTO `login_log` VALUES (51, '慕夏', '0', '192.168.179.1', '1', '2020-08-05 12:19:15', '1', '2020-08-05 12:19:15');
INSERT INTO `login_log` VALUES (52, '慕夏', '0', '192.168.179.1', '1', '2020-08-05 12:21:08', '1', '2020-08-05 12:21:08');
INSERT INTO `login_log` VALUES (53, '慕夏', '0', '192.168.179.1', '1', '2020-08-05 12:22:08', '1', '2020-08-05 12:22:08');
INSERT INTO `login_log` VALUES (54, '慕夏', '0', '192.168.179.1', '1', '2020-08-05 12:23:23', '1', '2020-08-05 12:23:23');
INSERT INTO `login_log` VALUES (55, '慕夏', '0', '192.168.179.1', '1', '2020-08-05 12:24:11', '1', '2020-08-05 12:24:11');
INSERT INTO `login_log` VALUES (56, '慕夏', '0', '192.168.179.1', '1', '2020-08-05 14:25:20', '1', '2020-08-05 14:25:20');
INSERT INTO `login_log` VALUES (57, '慕夏', '0', '192.168.179.1', '1', '2020-08-05 14:32:36', '1', '2020-08-05 14:32:36');
INSERT INTO `login_log` VALUES (58, '慕夏', '0', '192.168.179.1', '1', '2020-08-05 14:41:22', '1', '2020-08-05 14:41:22');
INSERT INTO `login_log` VALUES (59, '慕夏', '0', '192.168.179.1', '1', '2020-08-05 14:42:12', '1', '2020-08-05 14:42:12');
INSERT INTO `login_log` VALUES (60, '慕夏', '0', '192.168.179.1', '1', '2020-08-05 15:04:10', '1', '2020-08-05 15:04:10');
INSERT INTO `login_log` VALUES (61, '慕夏', '0', '192.168.179.1', '1', '2020-08-05 15:04:18', '1', '2020-08-05 15:04:18');
INSERT INTO `login_log` VALUES (62, '慕夏', '0', '192.168.179.1', '1', '2020-08-05 15:05:33', '1', '2020-08-05 15:05:33');
INSERT INTO `login_log` VALUES (63, '慕夏', '0', '192.168.179.1', '1', '2020-08-05 15:08:17', '1', '2020-08-05 15:08:17');
INSERT INTO `login_log` VALUES (64, '慕夏', '0', '127.0.0.1', '1', '2020-08-10 10:14:32', '1', '2020-08-10 10:14:32');
INSERT INTO `login_log` VALUES (65, '慕夏', '0', '192.168.179.1', '1', '2020-08-10 11:17:59', '1', '2020-08-10 11:17:59');
INSERT INTO `login_log` VALUES (66, '慕夏', '0', '192.168.179.1', '1', '2020-08-10 11:18:15', '1', '2020-08-10 11:18:15');
INSERT INTO `login_log` VALUES (67, '慕夏', '0', '192.168.179.1', '1', '2020-08-10 11:18:27', '1', '2020-08-10 11:18:27');
INSERT INTO `login_log` VALUES (68, '慕夏', '0', '127.0.0.1', '1', '2020-08-11 09:36:49', '1', '2020-08-11 09:36:49');
INSERT INTO `login_log` VALUES (69, '慕夏', '0', '192.168.179.1', '1', '2020-08-11 09:41:53', '1', '2020-08-11 09:41:53');
INSERT INTO `login_log` VALUES (70, '慕夏', '0', '127.0.0.1', '1', '2020-08-11 16:55:44', '1', '2020-08-11 16:55:44');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID：一级菜单为0',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权',
  `type` int(255) NULL DEFAULT NULL COMMENT '类型：0：目录，1：菜单，2：按钮',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `order_num` int(255) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(255) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(255) NULL DEFAULT NULL COMMENT '是否已经被删除，-1：已删除，0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role_dept
-- ----------------------------
DROP TABLE IF EXISTS `role_dept`;
CREATE TABLE `role_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` bigint(255) NULL DEFAULT NULL COMMENT '角色编号',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门编号',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `nick_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `passwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加密盐',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `status` tinyint(255) NULL DEFAULT NULL COMMENT '状态 0：禁用 1：正常',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门编号',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(255) NULL DEFAULT NULL COMMENT '是否被删除 -1：已删除 0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'xiao', '慕夏', 'http://118.25.130.181/data/00/00/rBEADl8j2a6AMUAfAAC7SmqwtG0986.jpg', '731fcac05393269c61b4c7d405e678cd', '1', 'm18779334084@163.com', '18779334084', NULL, NULL, NULL, '2020-06-02 13:51:41', 'xiao', '2020-06-02 13:51:47', NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色ID',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` datetime(0) NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
