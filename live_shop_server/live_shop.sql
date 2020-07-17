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

 Date: 17/07/2020 17:22:46
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
  `last_update_by` datetime(0) NULL DEFAULT NULL COMMENT '修改人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `salt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加密盐',
  `status` tinyint(255) NOT NULL DEFAULT 0 COMMENT '状态 0：禁用 1：正常',
  `del_flag` tinyint(255) NOT NULL DEFAULT 0 COMMENT '是否被删除 -1：已删除 0：正常',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `sex` bit(1) NOT NULL DEFAULT b'1' COMMENT '性别',
  `birth` date NULL DEFAULT NULL COMMENT '生日',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, NULL, NULL, NULL, NULL, '2020-07-17 12:16:29', NULL, '2020-07-17 12:16:29', NULL, NULL, 0, 0, NULL, NULL, b'1', NULL);
INSERT INTO `customer` VALUES (2, NULL, NULL, NULL, NULL, '2020-07-17 14:22:25', NULL, '2020-07-17 14:22:25', NULL, NULL, 0, 0, NULL, NULL, b'1', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

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
INSERT INTO `user` VALUES (1, 'xiao', '慕夏', NULL, '731fcac05393269c61b4c7d405e678cd', '1', 'm18779334084@163.com', '18779334084', NULL, NULL, NULL, '2020-06-02 13:51:41', 'xiao', '2020-06-02 13:51:47', NULL);

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
