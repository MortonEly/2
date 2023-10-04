/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : weather

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 04/06/2023 18:35:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_city
-- ----------------------------
DROP TABLE IF EXISTS `tb_city`;
CREATE TABLE `tb_city`  (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_city
-- ----------------------------
INSERT INTO `tb_city` VALUES (1, '烟台', '54765');
INSERT INTO `tb_city` VALUES (2, '北京', '54511');
INSERT INTO `tb_city` VALUES (3, '海口', '59758');
INSERT INTO `tb_city` VALUES (4, '上海', '58362');

-- ----------------------------
-- Table structure for tb_menus
-- ----------------------------
DROP TABLE IF EXISTS `tb_menus`;
CREATE TABLE `tb_menus`  (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `menu_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_order` int NULL DEFAULT NULL,
  `menu_level` int NULL DEFAULT NULL,
  `menu_parent_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_url` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_menus
-- ----------------------------
INSERT INTO `tb_menus` VALUES (1, '01', '系统管理', 1, 1, NULL, NULL);
INSERT INTO `tb_menus` VALUES (2, '02', '用户管理', 2, 1, NULL, NULL);
INSERT INTO `tb_menus` VALUES (3, '03', '城市管理', 3, 1, NULL, NULL);
INSERT INTO `tb_menus` VALUES (4, '04', '添加用户', 1, 2, '02', NULL);
INSERT INTO `tb_menus` VALUES (5, '05', '用户列表', 2, 2, '02', NULL);
INSERT INTO `tb_menus` VALUES (6, '06', '添加城市', 1, 2, '03', NULL);
INSERT INTO `tb_menus` VALUES (7, '07', '城市列表', 2, 2, '03', NULL);
INSERT INTO `tb_menus` VALUES (8, '08', '天气预报', 3, 2, '03', NULL);

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu`  (
  `role_id` int NULL DEFAULT NULL,
  `menu_id` int NULL DEFAULT NULL,
  INDEX `fk_rm_roleId`(`role_id` ASC) USING BTREE,
  INDEX `fk_rm_menuId`(`menu_id` ASC) USING BTREE,
  CONSTRAINT `fk_rm_menuId` FOREIGN KEY (`menu_id`) REFERENCES `tb_menus` (`menu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rm_roleId` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES (1, 1);
INSERT INTO `tb_role_menu` VALUES (1, 2);
INSERT INTO `tb_role_menu` VALUES (1, 3);
INSERT INTO `tb_role_menu` VALUES (1, 4);
INSERT INTO `tb_role_menu` VALUES (1, 5);
INSERT INTO `tb_role_menu` VALUES (1, 6);
INSERT INTO `tb_role_menu` VALUES (1, 7);
INSERT INTO `tb_role_menu` VALUES (1, 8);
INSERT INTO `tb_role_menu` VALUES (2, 2);
INSERT INTO `tb_role_menu` VALUES (2, 3);
INSERT INTO `tb_role_menu` VALUES (2, 5);
INSERT INTO `tb_role_menu` VALUES (2, 6);
INSERT INTO `tb_role_menu` VALUES (2, 7);
INSERT INTO `tb_role_menu` VALUES (2, 8);
INSERT INTO `tb_role_menu` VALUES (3, 3);
INSERT INTO `tb_role_menu` VALUES (3, 7);
INSERT INTO `tb_role_menu` VALUES (3, 8);

-- ----------------------------
-- Table structure for tb_roles
-- ----------------------------
DROP TABLE IF EXISTS `tb_roles`;
CREATE TABLE `tb_roles`  (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_roles
-- ----------------------------
INSERT INTO `tb_roles` VALUES (1, '超级管理员', '具有系统最高权限');
INSERT INTO `tb_roles` VALUES (2, '管理员', '普通管理权限');
INSERT INTO `tb_roles` VALUES (3, '业务员', '只能查看');

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role`  (
  `user_id` int NULL DEFAULT NULL,
  `role_id` int NULL DEFAULT NULL,
  INDEX `fk_ur_userId`(`user_id` ASC) USING BTREE,
  INDEX `fk_ur_roleId`(`role_id` ASC) USING BTREE,
  CONSTRAINT `fk_ur_roleId` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ur_userId` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
INSERT INTO `tb_user_role` VALUES (1, 1);
INSERT INTO `tb_user_role` VALUES (2, 2);
INSERT INTO `tb_user_role` VALUES (3, 3);

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_pwd` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES (1, 'zhangsan', '123456');
INSERT INTO `tb_users` VALUES (2, 'lisi', '123456');
INSERT INTO `tb_users` VALUES (3, 'admin', '123456');

SET FOREIGN_KEY_CHECKS = 1;
