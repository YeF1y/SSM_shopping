/*
 Navicat Premium Data Transfer

 Source Server         : java web
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : s_ttgshop_ms

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 14/06/2023 12:52:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123', '商家', '男', 22, '498465');
INSERT INTO `admin` VALUES (3, 'sss', '123', '商家', '男', 33, '54645678');
INSERT INTO `admin` VALUES (4, 'test', '123', '商家', NULL, 0, NULL);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminId` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `type_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 1, 'quse', 'picture/30.jpg', 'picture/31.jpg', 'picture/32.jpg', 489, '阿迪达斯正品晒黑', 44, 1);
INSERT INTO `goods` VALUES (2, 1, '耐克', 'picture/04.jpg', 'picture/05.jpg', 'picture/06.jpg', 999, '耐克正品十点多', 635, 2);
INSERT INTO `goods` VALUES (3, 1, '特步', 'picture/50.jpg', 'picture/51.jpg', 'picture/52.jpg', 342, '特步正品时候', 231, 1);
INSERT INTO `goods` VALUES (4, 1, 'naike', 'picture/07.jpg', 'picture/08.jpg', 'picture/09.jpg', 231, '欧文7代胡搜大红我弄上的', 319, 2);
INSERT INTO `goods` VALUES (5, 1, '黎宁', 'picture/33.jpg', 'picture/34.jpg', 'picture/35.jpg', 2313, '李宁跑鞋官方正品', 31, 1);
INSERT INTO `goods` VALUES (6, 1, '安踏', 'picture/101.jpg', 'picture/102.jpg', 'picture/103.jpg', 233, '安踏跑鞋管犯罪感横盘', 4212, 1);
INSERT INTO `goods` VALUES (7, 1, 'aj', 'picture/01.jpg', 'picture/02.jpg', 'picture/03.jpg', 434, 'aj男鞋官方正品', 230, 2);
INSERT INTO `goods` VALUES (8, 1, '欧文', 'picture/10.jpg', 'picture/11.jpg', 'picture/12.jpg', 2332, '欧文6', 2323, 2);
INSERT INTO `goods` VALUES (9, 1, '三叶草', 'picture/ad.jpg', 'picture/ad1.jpg', 'picture/ad2.jpg', 2323, '阿迪达斯官网三叶草', 23, 1);
INSERT INTO `goods` VALUES (10, 1, '花花公子', 'picture/hh.jpg', 'picture/hh1.jpg', 'picture/hh2.jpg', 3232, '花花公子官方男鞋', 23, 1);

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `order_id` int(11) NULL DEFAULT NULL,
  `good_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1, 200, 1, 2, 2);
INSERT INTO `items` VALUES (2, 600, 1, 3, 4);
INSERT INTO `items` VALUES (3, 600, 1, 4, 4);
INSERT INTO `items` VALUES (4, 600, 2, 5, 4);
INSERT INTO `items` VALUES (5, 489, 1, 3, 1);
INSERT INTO `items` VALUES (6, 489, 1, 4, 1);
INSERT INTO `items` VALUES (7, 2313, 2, 5, 5);
INSERT INTO `items` VALUES (8, 231, 2, 5, 4);
INSERT INTO `items` VALUES (9, 434, 2, 5, 7);
INSERT INTO `items` VALUES (10, 233, 1, 6, 6);
INSERT INTO `items` VALUES (11, 489, 1, 6, 1);
INSERT INTO `items` VALUES (12, 2313, 1, 6, 5);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `paytype` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `systime` datetime(0) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (3, 489, 1, 2, 1, '林宝贝', '687546', '山东济南', '2023-06-12 13:26:26', 2);
INSERT INTO `orders` VALUES (4, 489, 1, 2, 1, '陈纪龙', '13505041380', '集美大学', '2023-06-12 13:29:26', 11);
INSERT INTO `orders` VALUES (5, 5956, 6, 2, 1, '陈纪龙', '13505041380', '集美大学', '2023-06-12 14:44:43', 11);
INSERT INTO `orders` VALUES (6, 3035, 3, 1, 0, NULL, NULL, NULL, '2023-06-12 14:45:02', 11);

-- ----------------------------
-- Table structure for tops
-- ----------------------------
DROP TABLE IF EXISTS `tops`;
CREATE TABLE `tops`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(255) NULL DEFAULT NULL,
  `good_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tops
-- ----------------------------
INSERT INTO `tops` VALUES (6, 1, 6);
INSERT INTO `tops` VALUES (7, 2, 6);
INSERT INTO `tops` VALUES (8, 1, 10);
INSERT INTO `tops` VALUES (9, 2, 10);
INSERT INTO `tops` VALUES (10, 2, 9);
INSERT INTO `tops` VALUES (17, 2, 7);
INSERT INTO `tops` VALUES (18, 2, 8);
INSERT INTO `tops` VALUES (19, 2, 4);
INSERT INTO `tops` VALUES (20, 2, 1);
INSERT INTO `tops` VALUES (21, 2, 5);
INSERT INTO `tops` VALUES (22, 1, 5);
INSERT INTO `tops` VALUES (23, 1, 8);
INSERT INTO `tops` VALUES (26, 2, 9);

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES (1, '跑步鞋');
INSERT INTO `types` VALUES (2, '篮球鞋');
INSERT INTO `types` VALUES (3, '帆布鞋');
INSERT INTO `types` VALUES (4, '猫粮');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (3, 'mmm', '123', '1112222', '11222', '11');
INSERT INTO `users` VALUES (9, 'liuxiao', '123', '吴京', '165131', '465465');
INSERT INTO `users` VALUES (10, 'www', '123', '林老板', '16516', '56464');
INSERT INTO `users` VALUES (14, 'YeFly', '321', '陈纪龙', '136546', '231231');

SET FOREIGN_KEY_CHECKS = 1;
