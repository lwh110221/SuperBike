/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : supbike

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 05/06/2024 18:52:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_bike
-- ----------------------------
DROP TABLE IF EXISTS `t_bike`;
CREATE TABLE `t_bike`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(11, 2) NULL DEFAULT NULL,
  `brand` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sales` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `classification` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci PACK_KEYS = 1 ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_bike
-- ----------------------------
INSERT INTO `t_bike` VALUES (1, 'TCR Advanced SL 0 - DA', 80800.00, 'Giant', 0, 80, '全新PCR一脉相承Giant公路车家族的基因，经过市场验证的OverDrive内走方案，搭配上精雕细琢，简洁精炼的外观造型。巨值、巨快、巨好骑！', '公路车', 'static/img/TCR Advanced SL 0 - DA.jpg');
INSERT INTO `t_bike` VALUES (2, 'Fastroad 16', 1598.00, 'Giant', 0, 80, 'Fastroad系列16款公路自行车，32寸，轻便皮实耐造', '公路车', 'static/img/Fastroad16.jpg');
INSERT INTO `t_bike` VALUES (3, 'ATX-660', 1799.00, 'Giant', 0, 80, '捷安特atx系列入门山地自行车，32速变速，铝合金车架', '山地车', 'static/img/ATX-660.jpg');
INSERT INTO `t_bike` VALUES (4, 'XTC820', 3998.00, 'Giant', 0, 80, '全新XTC系列山地自行车', '山地车', 'static/img/xtc820.jpg');
INSERT INTO `t_bike` VALUES (5, 'Rc-2000', 1999.00, '迪卡侬', 0, 80, '轻便型山地自行车', '公路车', 'static/img/xdsjpg.jpg');
INSERT INTO `t_bike` VALUES (6, 'Camp GX200', 1920.00, 'Camp', 0, 80, '坎普公路自行车', '公路车', 'static/img/GX200.jpg');

-- ----------------------------
-- Table structure for t_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart`  (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `product_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of t_cart
-- ----------------------------

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` date NULL DEFAULT NULL,
  `price` decimal(11, 2) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_order_item
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item`;
CREATE TABLE `t_order_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `price` decimal(11, 2) NULL DEFAULT NULL,
  `total_price` decimal(11, 2) NULL DEFAULT NULL,
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adminornot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'no',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', 'admin', 'lwh110221@outlook.com', '昆明', '啊啊啊', '11111', 'yes');
INSERT INTO `t_user` VALUES (2, 'yuchao', '123456', 'yuchao@163.com', '萨格', '劳达', '113455', 'no');
INSERT INTO `t_user` VALUES (3, 'songjm', '123456', 'sjm@qq.com', '洛杉矶', 'sss', '12345777', 'no');
INSERT INTO `t_user` VALUES (4, 'gege', '123456', 'haogege@outlook.com', '云南昆明', 'admin', '12345555', 'no');

-- ----------------------------
-- Triggers structure for table t_order_item
-- ----------------------------
DROP TRIGGER IF EXISTS `fill_user_info`;
delimiter ;;
CREATE TRIGGER `fill_user_info` BEFORE INSERT ON `t_order_item` FOR EACH ROW BEGIN
  DECLARE user_address VARCHAR(200);
  DECLARE user_phone VARCHAR(11);
  DECLARE user_receiver VARCHAR(255);

  -- 根据 order_id 取得 user_id，再找到相应的用户信息
  SELECT t_user.address, t_user.phone, t_user.receiver INTO user_address, user_phone, user_receiver
  FROM t_user
  JOIN t_order ON t_user.id = t_order.user_id
  WHERE t_order.order_id = NEW.order_id;

  -- 将找到的用户信息设置到新插入的记录中
  SET NEW.address = user_address;
  SET NEW.phone = user_phone;
  SET NEW.receiver = user_receiver;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
