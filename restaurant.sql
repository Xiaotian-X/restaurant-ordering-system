/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : restaurant

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 13/07/2023 08:47:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for r_category
-- ----------------------------
DROP TABLE IF EXISTS `r_category`;
CREATE TABLE `r_category`  (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '菜品种类id',
  `category_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜名',
  `del` int NOT NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of r_category
-- ----------------------------
INSERT INTO `r_category` VALUES (1, '川菜', 0);
INSERT INTO `r_category` VALUES (2, '鲁菜', 0);
INSERT INTO `r_category` VALUES (3, '闽菜', 0);
INSERT INTO `r_category` VALUES (4, '粤菜', 0);
INSERT INTO `r_category` VALUES (5, '浙菜', 0);

-- ----------------------------
-- Table structure for r_desk
-- ----------------------------
DROP TABLE IF EXISTS `r_desk`;
CREATE TABLE `r_desk`  (
  `desk_id` int NOT NULL AUTO_INCREMENT COMMENT '餐桌id',
  `desk_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '餐桌号',
  `people_count` int NULL DEFAULT NULL COMMENT '餐桌座位数',
  `idle_status` int NULL DEFAULT 0 COMMENT '空闲状态(0空闲，1有人，2待清理)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`desk_id`) USING BTREE,
  UNIQUE INDEX `desk_code`(`desk_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of r_desk
-- ----------------------------
INSERT INTO `r_desk` VALUES (33, '1', 4, 1, '2023-07-06 09:27:10', '2023-07-11 11:25:40', 0);
INSERT INTO `r_desk` VALUES (34, '2', 4, 2, '2023-07-06 09:27:14', NULL, 0);
INSERT INTO `r_desk` VALUES (35, '3', 8, 0, '2023-07-06 09:27:19', '2023-07-11 11:25:43', 0);
INSERT INTO `r_desk` VALUES (36, '4', 6, 0, '2023-07-06 09:27:25', NULL, 0);
INSERT INTO `r_desk` VALUES (37, '5', 8, 0, '2023-07-06 09:27:32', NULL, 0);
INSERT INTO `r_desk` VALUES (38, '6', 8, 2, '2023-07-06 09:27:37', NULL, 0);
INSERT INTO `r_desk` VALUES (39, '7', 4, 2, '2023-07-06 09:27:42', NULL, 0);
INSERT INTO `r_desk` VALUES (40, '8', 4, 1, '2023-07-06 09:27:47', NULL, 0);
INSERT INTO `r_desk` VALUES (41, '9', 12, 0, '2023-07-06 09:27:54', NULL, 0);
INSERT INTO `r_desk` VALUES (42, '10', 12, 0, '2023-07-06 09:27:58', NULL, 0);
INSERT INTO `r_desk` VALUES (43, '11', 12, 1, '2023-07-06 09:28:02', NULL, 0);

-- ----------------------------
-- Table structure for r_goods
-- ----------------------------
DROP TABLE IF EXISTS `r_goods`;
CREATE TABLE `r_goods`  (
  `goods_id` int NOT NULL AUTO_INCREMENT COMMENT '菜品id',
  `goods_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜名',
  `category_id` int NOT NULL COMMENT '菜品类别',
  `img_small_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜的小图片地址',
  `img_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜的大图片地址',
  `img_circle_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜的轮播图地址',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '菜的详细介绍',
  `cost` decimal(20, 2) NULL DEFAULT NULL COMMENT '制作成本',
  `price` decimal(20, 2) NULL DEFAULT NULL COMMENT '价格',
  `discount` decimal(20, 2) NULL DEFAULT 1.00 COMMENT '折扣',
  `store_count` bigint NULL DEFAULT 0 COMMENT '库存表',
  `sold_count` bigint NULL DEFAULT 0 COMMENT '总销量',
  `type_state` int NULL DEFAULT 1 COMMENT '类型状态(1普通菜，2新菜，3热菜)',
  `sold_state` int NULL DEFAULT 0 COMMENT '销售状态(0在售,1已售完)',
  `putaway_status` int NULL DEFAULT 0 COMMENT '菜品上架状态(0下架，1上架)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`goods_id`) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `r_goods_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `r_category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of r_goods
-- ----------------------------
INSERT INTO `r_goods` VALUES (3, '家常口水鸡', 1, NULL, '/image/c87048d7-2b87-4be0-bf65-9a3f7286b1a4.jpg', '', '家常口水鸡家常口水鸡家常口水鸡', 10.00, 30.80, 1.00, 2, 17, 1, 0, 1, '2023-07-05 16:55:13', '2023-07-06 21:19:47', 1);
INSERT INTO `r_goods` VALUES (4, '冬枣凤尾虾', 3, NULL, '/image/7b989992-008d-45cc-8019-8dc239559c4f.jpg', '', '冬枣凤尾虾冬枣凤尾虾冬枣凤尾虾冬枣凤尾虾', 30.00, 98.00, 1.00, 0, 20, 2, 0, 0, '2023-07-05 14:26:19', '2023-07-06 08:57:00', 1);
INSERT INTO `r_goods` VALUES (5, '火腿蒸鲈鱼', 5, NULL, '/image/a013629e-def0-4ae9-b68e-8b4e7bb5398d.jpg', '', '火腿蒸鲈鱼火腿蒸鲈鱼火腿蒸鲈鱼火腿蒸鲈鱼火腿蒸鲈鱼', 30.00, 100.00, 1.00, 11, 20, 1, 0, 1, '2023-07-05 13:53:07', '2023-07-06 21:11:15', 0);
INSERT INTO `r_goods` VALUES (6, '虾籽扒菇参', 3, NULL, '/image/cdbcc568-04f1-4b2f-bbee-e301a505eba8.jpg', NULL, '虾籽扒菇参虾籽扒菇参虾籽扒菇参虾籽扒菇参虾籽扒菇参', 40.00, 168.00, 1.00, 21, 7, 1, 0, 1, '2023-07-05 14:11:54', '2023-07-07 21:11:03', 0);
INSERT INTO `r_goods` VALUES (7, '吊炉叉烧', 4, NULL, '/image/0272564d-7e0e-4dd4-ae45-bbaca606efad.jpg', '', '吊炉叉烧吊炉叉烧吊炉叉烧吊炉叉烧吊炉叉烧', 17.80, 48.00, 1.00, 54, 46, 3, 0, 1, '2023-07-05 14:15:09', '2023-07-06 16:45:26', 0);
INSERT INTO `r_goods` VALUES (8, '老妈蹄花', 1, NULL, '/image/6b078a5b-0ed8-4f91-bf4e-6a64139b28e0.jpg', '', '扒酿蹄筋扒酿蹄筋扒酿蹄筋扒酿蹄筋扒酿蹄筋扒酿蹄筋', 25.00, 68.80, 1.00, 19, 15, 1, 0, 1, '2023-07-05 14:16:16', '2023-07-06 10:47:01', 0);
INSERT INTO `r_goods` VALUES (9, '正宗洋葱回锅肉', 1, NULL, '/image/b7b9bf19-b0e9-4b22-91c9-e6563c4b3282.jpg', '', '正宗洋葱回锅肉正宗洋葱回锅肉正宗洋葱回锅肉', 8.00, 23.80, 1.00, 200, 11, 1, 0, 1, '2023-07-05 14:32:57', '2023-07-06 14:23:30', 0);
INSERT INTO `r_goods` VALUES (10, '鲜虾肠粉', 4, NULL, '/image/62738ae7-886c-4c30-8fed-f24e91d5ee76.jpg', '', '鲜虾肠粉鲜虾肠粉鲜虾肠粉鲜虾肠粉鲜虾肠粉', 23.00, 67.00, 1.00, 7, 26, 1, 0, 1, '2023-07-05 23:35:03', '2023-07-08 16:41:48', 0);
INSERT INTO `r_goods` VALUES (11, '秘制叉烧', 3, NULL, '/image/4ae7ef67-c839-44ca-b410-1c9f11db1399.jpg', '', '秘制叉烧秘制叉烧秘制叉烧秘制叉烧秘制叉烧秘制叉烧秘制叉烧秘制叉烧秘制叉烧秘制叉烧', 17.90, 69.00, 1.00, 10, 11, 1, 0, 1, '2023-07-05 23:40:10', '2023-07-07 10:32:21', 0);
INSERT INTO `r_goods` VALUES (12, '锅巴肉片', 1, NULL, '/image/443a94a9-5429-473a-90f0-cde578446d93.jpg', NULL, '锅巴肉片锅巴肉片锅巴肉片锅巴肉片', 8.00, 22.40, 1.00, 68, 20, 2, 0, 1, '2023-07-05 10:29:51', '2023-07-07 17:00:07', 0);
INSERT INTO `r_goods` VALUES (13, '水煮鱼片', 1, NULL, '/image/2552d8d4-003a-4c7d-a158-1307c8cc8d24.jpg', NULL, '水煮鱼片水煮鱼片水煮鱼片水煮鱼片', 13.00, 40.00, 1.00, 9, 11, 1, 0, 1, '2023-07-05 10:34:47', NULL, 0);
INSERT INTO `r_goods` VALUES (14, '香辣毛血旺', 1, NULL, '/image/ba59bdac-113d-424e-b502-078acfd37e8d.jpg', NULL, '香辣毛血旺香辣毛血旺香辣毛血旺香辣毛血旺香辣毛血旺', 18.00, 48.00, 1.00, 10, 20, 1, 0, 1, '2023-07-05 10:35:36', NULL, 0);
INSERT INTO `r_goods` VALUES (15, '鱼香肉丝', 1, NULL, '/image/c27d77fa-d41b-44d5-9fc5-bc52619a252d.jpg', NULL, '鱼香肉丝鱼香肉丝鱼香肉丝', 8.00, 22.00, 1.00, 28, 12, 1, 0, 1, '2023-07-05 10:36:25', NULL, 0);
INSERT INTO `r_goods` VALUES (16, '荷包加吉鱼', 2, NULL, '/image/d692d2e7-39b1-4ba9-a4f8-db8d8d6d9b72.jpg', NULL, '鲫鱼荷包蛋鲫鱼荷包蛋鲫鱼荷包蛋鲫鱼荷包蛋', 18.00, 48.00, 1.00, 9, 11, 1, 0, 1, '2023-07-05 10:38:02', '2023-07-06 23:42:50', 0);
INSERT INTO `r_goods` VALUES (17, '蒜泥拌白肉', 2, NULL, '/image/ea359d93-1060-49e5-9598-14dec7643130.jpg', NULL, '蒜泥拌白肉蒜泥拌白肉蒜泥拌白肉蒜泥拌白肉蒜泥拌白肉蒜泥拌白肉', 15.00, 28.00, 1.00, 8, 6, 1, 0, 1, '2023-07-05 10:38:54', NULL, 0);
INSERT INTO `r_goods` VALUES (18, '油焖春笋', 5, NULL, '/image/8f5ac298-b725-4f62-9eda-3046016fd82b.jpg', NULL, '油焖春笋油焖春笋油焖春笋油焖春笋', 6.00, 12.00, 1.00, 1, 18, 1, 0, 1, '2023-07-05 10:39:48', NULL, 0);
INSERT INTO `r_goods` VALUES (19, '大蒜烧鸡肫', 2, NULL, '/image/014d36e2-5ea3-4f1a-80b6-2dff4b22498a.jpg', NULL, '大蒜烧鸡肫大蒜烧鸡肫大蒜烧鸡肫大蒜烧鸡肫', 21.00, 40.00, 1.00, 11, 21, 3, 0, 1, '2023-07-05 16:37:32', NULL, 0);
INSERT INTO `r_goods` VALUES (20, '白扒鱼翅', 2, NULL, '/image/7f706523-9d69-418b-a541-f73f09796821.jpg', NULL, '白扒鱼翅白扒鱼翅白扒鱼翅白扒鱼翅白扒鱼翅白扒鱼翅白扒鱼翅白扒鱼翅', 30.00, 189.00, 1.00, 54, 11, 3, 0, 1, '2023-07-05 23:38:03', '2023-07-07 23:38:22', 0);
INSERT INTO `r_goods` VALUES (21, '板栗蘑菇炒螺花', 2, NULL, '/image/001d635b-d16d-45ae-a21d-3d92dc7e3d5a.jpg', NULL, '板栗蘑菇炒螺花板栗蘑菇炒螺花板栗蘑菇炒螺花板栗蘑菇炒螺花板栗蘑菇炒螺花', 46.00, 168.00, 1.00, 30, 13, 2, 0, 1, '2023-07-05 23:39:27', NULL, 0);
INSERT INTO `r_goods` VALUES (22, '大肠炖豆腐', 2, NULL, '/image/95f51e70-3544-46b2-9cab-8632c56ae9cd.jpg', NULL, '大肠炖豆腐大肠炖豆腐大肠炖豆腐大肠炖豆腐大肠炖豆腐大肠炖豆腐大肠炖豆腐大肠炖豆腐', 18.00, 58.00, 1.00, 6, 11, 1, 0, 1, '2023-07-05 23:40:36', NULL, 0);
INSERT INTO `r_goods` VALUES (23, '济南把子肉', 2, NULL, '/image/81bda1b0-fc37-4d6c-8e4a-7f6749db140e.jpg', NULL, '济南把子肉济南把子肉济南把子肉济南把子肉', 26.80, 68.00, 1.00, 36, 4, 1, 0, 1, '2023-07-05 23:41:34', NULL, 0);
INSERT INTO `r_goods` VALUES (24, '鲫鱼荷包蛋', 2, NULL, '/image/3e88a351-1388-4efa-83da-790ffb3e82f0.jpg', NULL, '鲫鱼荷包蛋鲫鱼荷包蛋鲫鱼荷包蛋鲫鱼荷包蛋鲫鱼荷包蛋鲫鱼荷包蛋鲫鱼荷包蛋', 18.00, 39.00, 1.00, 63, 15, 1, 0, 1, '2023-07-05 23:43:36', NULL, 0);
INSERT INTO `r_goods` VALUES (25, '烤鱼', 2, NULL, '/image/d65f568d-a8c4-439f-bb47-6e59abcd9bee.jpg', NULL, '烤鱼烤鱼烤鱼烤鱼烤鱼烤鱼烤鱼烤鱼烤鱼烤鱼烤鱼烤鱼', 23.00, 76.00, 1.00, 9, 4, 1, 0, 1, '2023-07-05 23:44:21', NULL, 0);
INSERT INTO `r_goods` VALUES (26, '黄瓜汆里脊片', 2, NULL, '/image/97ae84ee-27d9-4c09-8a25-5d76ff8f28ae.jpg', NULL, '黄瓜汆里脊片黄瓜汆里脊片黄瓜汆里脊片黄瓜汆里脊片黄瓜汆里脊片黄瓜汆里脊片黄瓜汆里脊片', 28.00, 68.00, 1.00, 15, 10, 1, 0, 1, '2023-07-05 23:44:58', NULL, 0);
INSERT INTO `r_goods` VALUES (27, '蒜爆肉', 2, NULL, '/image/1b2aff29-653e-46eb-922a-f0a385cfd852.jpg', NULL, '蒜爆肉蒜爆肉蒜爆肉蒜爆肉蒜爆肉蒜爆肉蒜爆肉', 18.00, 38.00, 1.00, 30, 4, 1, 0, 1, '2023-07-05 23:46:09', NULL, 0);
INSERT INTO `r_goods` VALUES (28, '奶汤鸡脯', 2, NULL, '/image/02189ede-cc89-4996-9c80-9e7742bab471.jpg', NULL, '奶汤鸡脯奶汤鸡脯奶汤鸡脯奶汤鸡脯', 24.00, 48.00, 1.00, 11, 1, 2, 0, 1, '2023-07-05 23:48:07', '2023-07-06 14:54:03', 0);
INSERT INTO `r_goods` VALUES (29, '蒜香炒梭蟹', 2, NULL, '/image/d5ba4308-fe6b-443c-b0c3-88c9718c1f03.jpg', NULL, '蒜香炒梭蟹蒜香炒梭蟹蒜香炒梭蟹蒜香炒梭蟹蒜香炒梭蟹蒜香炒梭蟹', 67.00, 268.00, 1.00, 33, 1, 1, 0, 1, '2023-07-05 23:48:44', NULL, 0);
INSERT INTO `r_goods` VALUES (30, '糖酥丸子', 2, NULL, '/image/6aa734c2-ef98-4676-b958-31b91a6aed70.jpg', NULL, '糖酥丸子糖酥丸子糖酥丸子糖酥丸子', 20.00, 58.00, 1.00, 8, 4, 1, 0, 1, '2023-07-05 23:49:17', '2023-07-07 23:49:33', 0);
INSERT INTO `r_goods` VALUES (31, '香菜拌毛蛤', 2, NULL, '/image/023117f7-1c99-4fee-9a97-4f928c0c508c.jpg', NULL, '香菜拌毛蛤香菜拌毛蛤香菜拌毛蛤香菜拌毛蛤香菜拌毛蛤香菜拌毛蛤', 45.00, 149.00, 1.00, 18, 1, 1, 0, 1, '2023-07-05 23:50:26', NULL, 0);
INSERT INTO `r_goods` VALUES (32, '龙珠凤翅', 3, NULL, '/image/9b80a2e7-88a5-4ca6-b284-a0faf4eee34c.jpg', NULL, '龙珠凤翅龙珠凤翅龙珠凤翅龙珠凤翅龙珠凤翅龙珠凤翅龙珠凤翅龙珠凤翅', 34.00, 98.00, 1.00, 0, 7, 3, 1, 1, '2023-07-05 23:52:03', NULL, 0);
INSERT INTO `r_goods` VALUES (33, '酸梅爪尖', 3, NULL, '/image/036dc8ae-76be-4871-9a81-ec1c5595832f.jpg', NULL, '酸梅爪尖酸梅爪尖酸梅爪尖酸梅爪尖酸梅爪尖酸梅爪尖酸梅爪尖酸梅爪尖酸梅爪尖', 34.00, 98.00, 1.00, 27, 9, 2, 0, 1, '2023-07-05 23:53:02', NULL, 0);
INSERT INTO `r_goods` VALUES (34, '焖糟羊肉', 3, NULL, '/image/6b908329-b036-4f8a-a6be-a7feeab827f1.jpg', NULL, '焖糟羊肉焖糟羊肉焖糟羊肉焖糟羊肉焖糟羊肉焖糟羊肉焖糟羊肉焖糟羊肉焖糟羊肉焖糟羊肉', 68.00, 288.00, 1.00, 5, 11, 3, 0, 1, '2023-07-05 23:53:44', NULL, 0);
INSERT INTO `r_goods` VALUES (35, '青蒜烧晶鱼', 3, NULL, '/image/becf890b-c45c-4de1-a0b6-fdef5b0ed321.jpg', NULL, '青蒜烧晶鱼青蒜烧晶鱼青蒜烧晶鱼青蒜烧晶鱼青蒜烧晶鱼青蒜烧晶鱼', 54.00, 149.00, 1.00, 8, 11, 1, 0, 1, '2023-07-05 23:54:17', NULL, 0);
INSERT INTO `r_goods` VALUES (36, '群鲜荟萃', 3, NULL, '/image/5dfe7ff5-f93c-4aeb-aa8b-9795f6db97d7.jpg', NULL, '群鲜荟萃群鲜荟萃群鲜荟萃群鲜荟萃群鲜荟萃群鲜荟萃群鲜荟萃群鲜荟萃', 39.00, 87.00, 1.00, 16, 15, 1, 0, 1, '2023-07-05 23:54:49', NULL, 0);
INSERT INTO `r_goods` VALUES (37, '绒鸡炖刺参', 3, NULL, '/image/6a1b5cba-7026-42ee-83dc-4093ce3caa7f.jpg', NULL, '绒鸡炖刺参绒鸡炖刺参绒鸡炖刺参绒鸡炖刺参绒鸡炖刺参绒鸡炖刺参绒鸡炖刺参', 67.00, 187.00, 1.00, 52, 24, 3, 0, 1, '2023-07-05 23:55:57', '2023-07-07 17:00:14', 0);
INSERT INTO `r_goods` VALUES (38, '软炸虾糕', 3, NULL, '/image/276cbeac-5d84-4ac8-87cd-36b42ca433c9.jpg', NULL, '软炸虾糕软炸虾糕软炸虾糕软炸虾糕', 28.00, 68.00, 1.00, 21, 11, 1, 0, 1, '2023-07-05 23:56:26', NULL, 0);
INSERT INTO `r_goods` VALUES (39, '三鲜酿南瓜', 3, NULL, '/image/85400711-7793-48fe-9cec-64181b0839f7.jpg', NULL, '三鲜酿南瓜三鲜酿南瓜三鲜酿南瓜三鲜酿南瓜三鲜酿南瓜', 10.00, 18.00, 1.00, 22, 18, 1, 0, 1, '2023-07-05 23:56:54', NULL, 0);
INSERT INTO `r_goods` VALUES (40, '东坡肉', 5, NULL, '/image/4b1901b7-4d73-40d3-84b8-dc00f7b7231a.jpg', NULL, '东坡肉东坡肉东坡肉东坡肉东坡肉东坡肉东坡肉东坡肉东坡肉东坡肉东坡肉东坡肉', 23.00, 48.00, 1.00, 31, 14, 3, 0, 1, '2023-07-06 08:58:54', NULL, 0);
INSERT INTO `r_goods` VALUES (41, '桂花糯米藕', 5, NULL, '/image/eb8aca12-69e8-419d-a504-da7e61df77fb.jpg', NULL, '桂花糯米藕桂花糯米藕桂花糯米藕桂花糯米藕桂花糯米藕桂花糯米藕桂花糯米藕', 8.00, 16.00, 1.00, 37, 2, 1, 0, 1, '2023-07-06 08:59:44', NULL, 0);
INSERT INTO `r_goods` VALUES (42, '花雕熏鱼', 5, NULL, '/image/9a9afc42-42d9-438d-aab8-efe65553d588.jpg', NULL, '花雕熏鱼花雕熏鱼花雕熏鱼花雕熏鱼花雕熏鱼花雕熏鱼花雕熏鱼花雕熏鱼花雕熏鱼', 18.00, 36.00, 1.00, 41, 2, 1, 0, 1, '2023-07-06 09:01:13', NULL, 0);
INSERT INTO `r_goods` VALUES (43, '花菇石鸡', 5, NULL, '/image/34392bc6-89c4-4fcd-96c0-ef945df6d499.jpg', NULL, '花菇石鸡花菇石鸡花菇石鸡花菇石鸡花菇石鸡花菇石鸡', 32.00, 69.00, 1.00, 40, 3, 1, 0, 1, '2023-07-06 09:01:54', NULL, 0);
INSERT INTO `r_goods` VALUES (44, '江南卤鸭', 5, NULL, '/image/491945b9-08f4-4cc3-8e90-7fc8081d7ddd.jpg', NULL, '江南卤鸭、江南卤鸭江南卤鸭江南卤鸭江南卤鸭江南卤鸭江南卤鸭江南卤鸭江南卤鸭', 21.00, 54.00, 1.00, 21, 11, 3, 0, 1, '2023-07-06 09:03:02', NULL, 0);
INSERT INTO `r_goods` VALUES (45, '叫花鸡', 5, NULL, '/image/280bf22a-3beb-4117-b08c-95d67e8846f8.jpg', NULL, '叫花鸡叫花鸡叫花鸡叫花鸡叫花鸡叫花鸡叫花鸡叫花鸡叫花鸡叫花鸡', 23.00, 54.00, 1.00, 60, 5, 1, 0, 1, '2023-07-06 09:04:24', NULL, 0);
INSERT INTO `r_goods` VALUES (46, '梅干菜炒豇豆', 5, NULL, '/image/f3222459-f1d3-4734-99ed-c96285d71802.jpg', NULL, '梅干菜炒豇豆梅干菜炒豇豆梅干菜炒豇豆梅干菜炒豇豆梅干菜炒豇豆梅干菜炒豇豆梅干菜炒豇豆梅干菜炒豇豆', 5.00, 12.00, 1.00, 36, 7, 1, 0, 1, '2023-07-06 09:04:57', NULL, 0);
INSERT INTO `r_goods` VALUES (47, '梅酱配炸响铃', 5, NULL, '/image/be57df1c-4a18-4be5-8377-16f9a49fb44b.jpg', NULL, '梅酱配炸响铃梅酱配炸响铃梅酱配炸响铃梅酱配炸响铃梅酱配炸响铃梅酱配炸响铃梅酱配炸响铃梅酱配炸响铃', 23.00, 49.00, 1.00, 74, 4, 1, 0, 1, '2023-07-06 09:05:33', NULL, 0);
INSERT INTO `r_goods` VALUES (48, '酸甜酥香的酥焖鲫鱼', 5, NULL, '/image/7254542c-0c62-489c-a131-7dec898b63f6.jpg', NULL, '酸甜酥香的酥焖鲫鱼酸甜酥香的酥焖鲫鱼酸甜酥香的酥焖鲫鱼酸甜酥香的酥焖鲫鱼酸甜酥香的酥焖鲫鱼', 18.00, 39.00, 1.00, 54, 0, 1, 0, 1, '2023-07-06 09:06:17', NULL, 0);
INSERT INTO `r_goods` VALUES (49, '油爆大虾', 5, NULL, '/image/6f333622-6578-4071-a116-f3b175079510.jpg', NULL, '油爆大虾油爆大虾油爆大虾油爆大虾油爆大虾油爆大虾油爆大虾油爆大虾油爆大虾油爆大虾油爆大虾', 45.00, 89.00, 1.00, 20, 3, 3, 0, 1, '2023-07-06 09:07:03', NULL, 0);
INSERT INTO `r_goods` VALUES (50, '腌笃鲜', 5, NULL, '/image/178dc6a4-ee23-4f2d-b730-7d59ffd65e6b.jpg', NULL, '腌笃鲜.腌笃鲜.腌笃鲜.腌笃鲜.腌笃鲜.腌笃鲜.腌笃鲜.腌笃鲜.腌笃鲜.', 34.00, 68.00, 1.00, 23, 0, 1, 0, 1, '2023-07-06 09:07:34', NULL, 0);
INSERT INTO `r_goods` VALUES (51, '香辣酸菜肉片', 1, NULL, '/image/872788fc-a067-4a1a-b88b-cec831369cc5.jpg', NULL, '香辣酸菜肉片香辣酸菜肉片香辣酸菜肉片香辣酸菜肉片香辣酸菜肉片香辣酸菜肉片香辣酸菜肉片', 32.00, 69.00, 1.00, 31, 1, 1, 0, 1, '2023-07-06 09:09:01', NULL, 0);
INSERT INTO `r_goods` VALUES (52, '白灼虾', 4, NULL, '/image/f1911eec-b730-4433-b39a-236fa625f688.jpg', NULL, '白灼虾白灼虾白灼虾白灼虾白灼虾白灼虾白灼虾白灼虾白灼虾白灼虾', 24.00, 45.00, 1.00, 28, 4, 1, 0, 1, '2023-07-06 09:10:56', '2023-07-08 09:23:02', 0);
INSERT INTO `r_goods` VALUES (53, '彩椒炒牛肉', 4, NULL, '/image/5999d201-1445-49e3-a2f2-280603b5ddb1.jpg', NULL, '彩椒炒牛肉彩椒炒牛肉彩椒炒牛肉彩椒炒牛肉彩椒炒牛肉彩椒炒牛肉', 32.00, 78.00, 1.00, 63, 4, 2, 0, 1, '2023-07-06 09:11:35', NULL, 0);
INSERT INTO `r_goods` VALUES (54, '豉汁蒸鳗鱼', 4, NULL, '/image/b59292cc-c71c-4596-b360-f71c9b34210c.jpg', NULL, '豉汁蒸鳗鱼豉汁蒸鳗鱼豉汁蒸鳗鱼豉汁蒸鳗鱼豉汁蒸鳗鱼豉汁蒸鳗鱼豉汁蒸鳗鱼', 54.00, 129.00, 1.00, 22, 1, 3, 0, 1, '2023-07-06 09:12:05', '2023-07-08 09:22:59', 0);
INSERT INTO `r_goods` VALUES (55, '油面筋炒丝瓜', 4, NULL, '/image/b15df0a6-4a0d-4c73-96f5-24a4283d6bd6.jpg', NULL, '油面筋炒丝瓜油面筋炒丝瓜油面筋炒丝瓜油面筋炒丝瓜油面筋炒丝瓜油面筋炒丝瓜油面筋炒丝瓜油面筋炒丝瓜油面筋炒丝瓜油面筋炒丝瓜油面筋炒丝瓜油面筋炒丝瓜油面筋炒丝瓜', 9.00, 16.00, 1.00, 28, 4, 1, 0, 1, '2023-07-06 09:12:53', NULL, 0);
INSERT INTO `r_goods` VALUES (56, '蒜蓉豆豉蒸排骨', 4, NULL, '/image/45ab6aca-72c1-4fd0-93d9-29e899b27628.jpg', NULL, '蒜蓉豆豉蒸排骨蒜蓉豆豉蒸排骨蒜蓉豆豉蒸排骨蒜蓉豆豉蒸排骨', 34.00, 58.00, 1.00, 17, 4, 1, 0, 1, '2023-07-06 09:13:28', NULL, 0);
INSERT INTO `r_goods` VALUES (57, '香辣炒红薯粉', 4, NULL, '/image/2e468728-8529-471c-a8e1-89b9aeda0cab.jpg', NULL, '香辣炒红薯粉香辣炒红薯粉香辣炒红薯粉香辣炒红薯粉香辣炒红薯粉香辣炒红薯粉香辣炒红薯粉', 7.80, 12.00, 1.00, 51, 3, 1, 0, 1, '2023-07-06 09:13:58', NULL, 0);
INSERT INTO `r_goods` VALUES (58, '磷虾肠粉', 4, NULL, '/image/50cf064c-5525-42bf-b85c-e5024e741905.jpg', NULL, '磷虾肠粉磷虾肠粉磷虾肠粉磷虾肠粉磷虾肠粉磷虾肠粉磷虾肠粉', 18.00, 38.00, 1.00, 52, 2, 1, 0, 1, '2023-07-06 09:14:38', '2023-07-08 09:23:07', 0);
INSERT INTO `r_goods` VALUES (59, '冯先生家常叉烧', 4, NULL, '/image/577f5599-55cb-4b8d-85b6-4987fd35f48a.jpg', NULL, '冯先生家常叉烧冯先生家常叉烧冯先生家常叉烧冯先生家常叉烧冯先生家常叉烧冯先生家常叉烧冯先生家常叉烧冯先生家常叉烧冯先生家常叉烧冯先生家常叉烧', 32.00, 79.00, 1.00, 54, 0, 1, 0, 1, '2023-07-06 09:15:19', NULL, 0);
INSERT INTO `r_goods` VALUES (60, '蚝油玉米鸡肉丁', 4, NULL, '/image/31daf548-39c3-4ecb-bb03-76c18170aa6c.jpg', NULL, '蚝油玉米鸡肉丁蚝油玉米鸡肉丁蚝油玉米鸡肉丁蚝油玉米鸡肉丁', 13.00, 24.00, 1.00, 43, 0, 1, 0, 1, '2023-07-06 09:16:28', NULL, 0);
INSERT INTO `r_goods` VALUES (61, '红糟叉烧', 4, NULL, '/image/4565da9a-38ae-4ca8-b40f-d4fd0e827a7a.jpg', NULL, '红糟叉烧红糟叉烧红糟叉烧红糟叉烧红糟叉烧红糟叉烧红糟叉烧红糟叉烧红糟叉烧红糟叉烧', 21.00, 48.00, 1.00, 31, 1, 2, 0, 1, '2023-07-06 09:17:01', NULL, 0);
INSERT INTO `r_goods` VALUES (62, '南瓜蒸排骨', 4, NULL, '/image/840355c1-e9df-49e5-b305-083dcbc0bae7.jpg', NULL, '南瓜蒸排骨南瓜蒸排骨南瓜蒸排骨南瓜蒸排骨南瓜蒸排骨南瓜蒸排骨南瓜蒸排骨南瓜蒸排骨南瓜蒸排骨', 21.00, 58.00, 1.00, 24, 0, 1, 0, 1, '2023-07-06 09:17:39', NULL, 0);
INSERT INTO `r_goods` VALUES (63, '牛油果青酱海鲜意粉', 4, NULL, '/image/3059038f-0da4-46e2-a105-6bcd6e2e79e9.jpg', NULL, '牛油果青酱海鲜意粉牛油果青酱海鲜意粉牛油果青酱海鲜意粉牛油果青酱海鲜意粉牛油果青酱海鲜意粉牛油果青酱海鲜意粉牛油果青酱海鲜意粉牛油果青酱海鲜意粉', 14.00, 28.00, 1.00, 27, 1, 1, 0, 1, '2023-07-06 09:18:11', '2023-07-08 09:22:52', 0);
INSERT INTO `r_goods` VALUES (64, '宫保鸡丁', 1, NULL, '/image/ad7493af-dc36-4833-b7ad-508143f0a84e.jpg', NULL, '宫保鸡丁宫保鸡丁宫保鸡丁宫保鸡丁宫保鸡丁宫保鸡丁宫保鸡丁宫保鸡丁宫保鸡丁', 23.00, 689.00, 1.00, 34, 0, 2, 0, 1, '2023-07-06 09:34:31', NULL, 0);

-- ----------------------------
-- Table structure for r_member
-- ----------------------------
DROP TABLE IF EXISTS `r_member`;
CREATE TABLE `r_member`  (
  `member_id` bigint NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `member_code` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '会员号（用手机号做会员号）',
  `m_name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '顾客姓名',
  `m_gender` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `m_birthday` date NULL DEFAULT NULL COMMENT '生日',
  `m_phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '电话',
  `mc_id` int NOT NULL DEFAULT 1 COMMENT '会员类型id外键',
  `total_money` double(11, 3) NULL DEFAULT 0.000 COMMENT '该会员总消费金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`member_id`) USING BTREE,
  UNIQUE INDEX `member_code`(`member_code` ASC) USING BTREE,
  INDEX `mc_id`(`mc_id` ASC) USING BTREE,
  CONSTRAINT `r_member_ibfk_1` FOREIGN KEY (`mc_id`) REFERENCES `r_merber_category` (`mc_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of r_member
-- ----------------------------
INSERT INTO `r_member` VALUES (28, '15723177077', '余鹏', '男', '2002-06-15', '15723177077', 16, 3024.890, '2023-07-06 09:42:25', NULL, 0);
INSERT INTO `r_member` VALUES (29, '11111111111', '123', '女', '2001-06-18', '11111111111', 16, 0.000, '2023-07-06 09:49:14', NULL, 0);
INSERT INTO `r_member` VALUES (30, '15523540600', '22', '女', '2023-07-06', '15523540600', 15, 740.880, '2023-07-06 14:46:39', NULL, 0);

-- ----------------------------
-- Table structure for r_merber_category
-- ----------------------------
DROP TABLE IF EXISTS `r_merber_category`;
CREATE TABLE `r_merber_category`  (
  `mc_id` int NOT NULL AUTO_INCREMENT COMMENT '会员类型id',
  `mc_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '类型名称',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '享有折扣',
  `amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '会员需达到的消费金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`mc_id`) USING BTREE,
  UNIQUE INDEX `mc_name`(`mc_name` ASC) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of r_merber_category
-- ----------------------------
INSERT INTO `r_merber_category` VALUES (15, 'vip1', 0.98, 0.00, '2023-07-06 09:26:06', '2023-07-06 09:45:09', 0);
INSERT INTO `r_merber_category` VALUES (16, 'vip2', 0.90, 1000.00, '2023-07-06 09:26:32', NULL, 0);
INSERT INTO `r_merber_category` VALUES (17, 'vip3', 0.83, 10000.00, '2023-07-10 11:29:59', NULL, 0);

-- ----------------------------
-- Table structure for r_order
-- ----------------------------
DROP TABLE IF EXISTS `r_order`;
CREATE TABLE `r_order`  (
  `order_id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单号',
  `desk_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '餐桌号',
  `member_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '会员号',
  `user_id` bigint NULL DEFAULT NULL COMMENT '收银员id',
  `total_cost` decimal(10, 2) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '总成本',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '该订单总金额',
  `total_profit` decimal(10, 2) NULL DEFAULT NULL COMMENT '总利润',
  `actual_pay` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际支付金额',
  `must_pay` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额',
  `change_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '找零',
  `discount_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '打折金额',
  `people_num` int NULL DEFAULT 0 COMMENT '就餐人数',
  `pay_status` int NULL DEFAULT 0 COMMENT '支付状态(0未支付，1已支付))',
  `finish_status` int NULL DEFAULT 0 COMMENT '上菜是否完成（0未完成，1完成）',
  `over_status` int NULL DEFAULT 0 COMMENT '订单是否结束即已支付已上菜完毕(0未结束，1已结束）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of r_order
-- ----------------------------
INSERT INTO `r_order` VALUES (77, '2023-0703-1623-20', '6', NULL, 2, 00000114.80, 445.00, 330.20, 1000.00, 445.00, 555.00, 0.00, 4, 1, 1, 1, '2023-07-03 16:23:20', NULL, 1);
INSERT INTO `r_order` VALUES (78, '2023-0706-0937-37', '1', '15723177077', 2, 00000253.90, 789.00, 495.65, 789.00, 749.55, 0.00, 39.45, 10, 1, 1, 1, '2023-07-06 09:37:38', NULL, 0);
INSERT INTO `r_order` VALUES (79, '2023-0706-1421-54', '6', '15723177077', 2, 00000278.70, 701.00, 408.28, 700.00, 686.98, 13.02, 14.02, 8, 1, 1, 1, '2023-07-06 14:21:54', NULL, 0);
INSERT INTO `r_order` VALUES (80, '2023-0706-1441-54', '7', '15523540600', 2, 00000225.80, 756.00, 515.08, 750.00, 740.88, 9.12, 15.12, 6, 1, 1, 1, '2023-07-06 14:41:55', NULL, 0);
INSERT INTO `r_order` VALUES (81, '2023-0706-2100-51', '1', NULL, 2, 00000232.80, 593.00, 360.20, 789.00, 593.00, 196.00, 0.00, 8, 1, 1, 1, '2023-07-06 21:00:51', NULL, 0);
INSERT INTO `r_order` VALUES (82, '2023-0710-1115-47', '2', '15723177077', 2, 00000111.80, 334.40, 189.16, 400.00, 300.96, 99.04, 33.44, 4, 1, 1, 1, '2023-07-10 11:15:48', NULL, 0);
INSERT INTO `r_order` VALUES (83, '2023-0710-1126-04', '3', '15723177077', 2, 00000142.80, 406.00, 222.60, 555.00, 365.40, 149.00, 40.60, 8, 1, 1, 1, '2023-07-10 11:26:05', NULL, 0);
INSERT INTO `r_order` VALUES (84, '2023-0712-1639-47', '3', NULL, 2, 00000126.80, 329.00, 202.20, 789.00, 329.00, 460.00, 0.00, 5, 1, 0, 0, '2023-07-12 16:39:47', NULL, 0);

-- ----------------------------
-- Table structure for r_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `r_order_detail`;
CREATE TABLE `r_order_detail`  (
  `od_id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单明细id',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `goods_id` int NOT NULL COMMENT '菜品id',
  `count` int NOT NULL DEFAULT 1 COMMENT '菜的数量',
  `status` int NULL DEFAULT 0 COMMENT '菜的状态(0未制作，1正在制作，2制作完成，3上菜完成)',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '制菜说明',
  `del` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`od_id`) USING BTREE,
  INDEX `order_id`(`order_id` ASC) USING BTREE,
  INDEX `goods_id`(`goods_id` ASC) USING BTREE,
  CONSTRAINT `r_order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `r_order` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `r_order_detail_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `r_goods` (`goods_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of r_order_detail
-- ----------------------------
INSERT INTO `r_order_detail` VALUES (1, 77, 7, 1, 3, NULL, 1);
INSERT INTO `r_order_detail` VALUES (2, 77, 19, 1, 3, NULL, 1);
INSERT INTO `r_order_detail` VALUES (3, 77, 20, 1, 3, NULL, 1);
INSERT INTO `r_order_detail` VALUES (4, 77, 21, 1, 3, NULL, 1);
INSERT INTO `r_order_detail` VALUES (5, 78, 19, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (6, 78, 40, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (7, 78, 49, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (8, 78, 34, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (9, 78, 6, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (10, 78, 36, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (11, 78, 11, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (12, 79, 11, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (13, 79, 37, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (14, 79, 38, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (15, 79, 7, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (16, 79, 10, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (17, 79, 55, 2, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (18, 79, 47, 2, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (19, 79, 46, 3, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (20, 79, 40, 2, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (21, 80, 20, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (22, 80, 34, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (23, 80, 49, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (24, 80, 44, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (25, 80, 40, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (26, 80, 19, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (27, 80, 7, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (28, 81, 7, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (29, 81, 19, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (30, 81, 44, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (31, 81, 37, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (32, 81, 45, 2, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (33, 81, 44, 2, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (34, 81, 16, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (35, 82, 7, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (36, 82, 40, 2, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (37, 82, 12, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (38, 82, 6, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (39, 83, 7, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (40, 83, 40, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (41, 83, 5, 2, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (42, 83, 44, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (43, 83, 41, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (44, 83, 13, 1, 3, NULL, 0);
INSERT INTO `r_order_detail` VALUES (45, 84, 7, 1, 2, NULL, 0);
INSERT INTO `r_order_detail` VALUES (46, 84, 19, 1, 2, NULL, 0);
INSERT INTO `r_order_detail` VALUES (47, 84, 37, 1, 2, NULL, 0);
INSERT INTO `r_order_detail` VALUES (48, 84, 44, 1, 2, NULL, 0);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `menu_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单名',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父节点id',
  `parent_ids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '祖先节点id集',
  `is_show` int NULL DEFAULT NULL COMMENT '是否显示（0不显示，1显示）',
  `permission` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限',
  `menu_href` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单链接',
  `menu_icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `weight` int NULL DEFAULT NULL COMMENT '菜单权重',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单描述',
  `del` int NULL DEFAULT 0 COMMENT '删除标志(0未删除，1删除)',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '订单管理', 0, '', 1, '', NULL, 'layui-icon-form', 50000, '', 0);
INSERT INTO `sys_menu` VALUES (2, '订单列表', 1, '1,', 1, 'orderManage:view', '/order/list.html', NULL, 8000, NULL, 0);
INSERT INTO `sys_menu` VALUES (3, '修改', 2, '1,2', 0, 'orderManage:edit', NULL, NULL, 7900, NULL, 0);
INSERT INTO `sys_menu` VALUES (4, '查询', 2, '1,2', 0, 'orderManage:view', NULL, NULL, 7800, NULL, 0);
INSERT INTO `sys_menu` VALUES (5, '菜谱管理', 0, NULL, 1, '', '', 'layui-icon-read', 60000, NULL, 0);
INSERT INTO `sys_menu` VALUES (6, '菜品列表', 5, '5,', 1, 'goodsManage:view', '/goods/list.html', NULL, 7700, NULL, 0);
INSERT INTO `sys_menu` VALUES (7, '添加菜品', 5, '5,', 1, 'goodsManage:view', '', NULL, 7600, NULL, 1);
INSERT INTO `sys_menu` VALUES (8, '修改', 6, '5,6', 0, 'goodsManage:edit', NULL, NULL, 7500, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, '查询', 6, '5,6', 0, 'goodsManage:view', NULL, NULL, 7400, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, '种类列表', 5, '5,', 1, 'goodsTypes:view', '/goodscategory/list.html', NULL, 7300, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, '添加种类', 5, '5,', 1, 'goodsTypes:edit', '', NULL, 7200, NULL, 1);
INSERT INTO `sys_menu` VALUES (12, '修改', 10, '5,10', 0, 'goodsTypes:edit', NULL, NULL, 7100, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, '查询', 10, '5,10', 0, 'goodsTypes:view', NULL, NULL, 7000, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, '会员管理', 0, NULL, 1, '', NULL, 'layui-icon-username', 70000, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, '会员列表', 14, '14,', 1, 'memberManage:view', '/member/list.html', NULL, 6900, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, '修改', 15, '14,15', 0, 'memberManage:edit', NULL, NULL, 6800, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, '查询', 15, '14,15', 0, 'memberManage:view', NULL, NULL, 6700, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, '会员类型列表', 14, '14,', 1, 'memberTypes:view', '/membercategory/list.html', NULL, 6600, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, '添加会员种类', 14, '14,', 1, 'memberTypes:edit', '', NULL, 6500, NULL, 1);
INSERT INTO `sys_menu` VALUES (20, '修改', 18, '14,18', 0, 'memberTypes:edit', NULL, NULL, 6400, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, '查询', 18, '14,18', 0, 'memberTypes:view', NULL, NULL, 6300, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, '员工管理', 0, NULL, 1, '', NULL, 'layui-icon-user', 80000, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, '员工列表', 22, '22,', 1, 'userManage:view', '/user/userlist.html', NULL, 6200, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, '添加员工', 22, '22,', 1, 'userManage:edit', '/user/adduser.html', NULL, 6100, NULL, 1);
INSERT INTO `sys_menu` VALUES (25, '修改', 23, '22,23', 0, 'userManage:edit', NULL, NULL, 6000, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, '查询', 23, '22,23', 0, 'userManage:view ', NULL, NULL, 5900, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, '销售管理', 0, NULL, 1, '', NULL, 'layui-icon-cart-simple', 40000, NULL, 0);
INSERT INTO `sys_menu` VALUES (28, '销量统计', 27, '27,', 1, 'salesVolume:view', '/analysis/salesVolume.html', NULL, 5800, NULL, 0);
INSERT INTO `sys_menu` VALUES (29, '查询', 28, '27,28', 0, 'salesVolume:view', NULL, NULL, 5700, NULL, 0);
INSERT INTO `sys_menu` VALUES (30, '交易记录', 27, '27,', 1, 'tranRecords:view', '/sold/tranRecordsList.html', NULL, 5600, NULL, 0);
INSERT INTO `sys_menu` VALUES (31, '查询', 30, '27,30', 0, 'tranRecords:view', NULL, NULL, 5500, NULL, 0);
INSERT INTO `sys_menu` VALUES (32, '制菜上菜管理', 0, NULL, 1, '', NULL, 'layui-icon-release', 30000, NULL, 0);
INSERT INTO `sys_menu` VALUES (33, '制菜任务列表', 32, '32,', 1, 'cooking:view', '/service/cookTask.html', NULL, 5400, NULL, 0);
INSERT INTO `sys_menu` VALUES (34, '编辑', 33, '32,33', 0, 'cooking:edit', NULL, NULL, 5300, NULL, 0);
INSERT INTO `sys_menu` VALUES (35, '上菜任务列表', 32, '32,', 1, 'serving:view', '/service/servingTask.html', NULL, 5200, NULL, 0);
INSERT INTO `sys_menu` VALUES (36, '编辑', 35, '32,35', 0, 'serving:edit', NULL, NULL, 5100, NULL, 0);
INSERT INTO `sys_menu` VALUES (37, '桌位上菜情况列表', 32, '32,', 1, 'deskServing:view', '/service/dssList.html', NULL, 5000, NULL, 0);
INSERT INTO `sys_menu` VALUES (38, '查询', 37, '32,37', 0, 'deskServing:view', NULL, NULL, 4900, NULL, 0);
INSERT INTO `sys_menu` VALUES (39, '桌位管理', 0, NULL, 1, '', '', 'layui-icon-circle', 20000, NULL, 0);
INSERT INTO `sys_menu` VALUES (40, '桌位列表', 39, '39,', 1, 'deskManage:view', '/desk/list.html', NULL, 4800, NULL, 0);
INSERT INTO `sys_menu` VALUES (41, '添加桌位', 39, '39,', 1, 'deskManage:edit', '', NULL, 4700, NULL, 1);
INSERT INTO `sys_menu` VALUES (42, '编辑', 40, '39,40', 0, 'deskManage:edit', NULL, NULL, 4600, NULL, 0);
INSERT INTO `sys_menu` VALUES (43, '查询', 40, '39,40', 0, 'deskManage:view', NULL, NULL, 4500, NULL, 0);
INSERT INTO `sys_menu` VALUES (44, '收银业务', 0, NULL, 1, '', '', 'layui-icon-rmb', 10000, NULL, 0);
INSERT INTO `sys_menu` VALUES (45, '收款', 44, '44,', 1, 'counter:view', '/counter/counterPage.html', NULL, 4400, NULL, 0);
INSERT INTO `sys_menu` VALUES (47, '删除', 15, '14,15', 1, 'manage:del', NULL, NULL, 6310, NULL, 0);
INSERT INTO `sys_menu` VALUES (48, '销售统计', 27, '27，', 1, 'salesStatistics:view', '/analysis/salesStatistics.html', NULL, 5850, NULL, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `role_name`(`role_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '经理', '2023-06-30 15:58:21', NULL, 0);
INSERT INTO `sys_role` VALUES (2, '厨师', '2023-06-30 16:10:32', NULL, 0);
INSERT INTO `sys_role` VALUES (3, '服务员', '2023-07-01 10:00:41', NULL, 0);
INSERT INTO `sys_role` VALUES (4, '收银员', '2023-07-01 15:20:10', NULL, 0);
INSERT INTO `sys_role` VALUES (5, '顾客', '2023-07-02 11:01:09', NULL, 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` bigint NOT NULL COMMENT '功能菜单id',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `menu_id`(`menu_id` ASC) USING BTREE,
  CONSTRAINT `sys_role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (4, 2);
INSERT INTO `sys_role_menu` VALUES (4, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (4, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (2, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (2, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (2, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (2, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (2, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (4, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (4, 15);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (4, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (4, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (1, 21);
INSERT INTO `sys_role_menu` VALUES (1, 22);
INSERT INTO `sys_role_menu` VALUES (1, 23);
INSERT INTO `sys_role_menu` VALUES (1, 24);
INSERT INTO `sys_role_menu` VALUES (1, 25);
INSERT INTO `sys_role_menu` VALUES (1, 26);
INSERT INTO `sys_role_menu` VALUES (1, 27);
INSERT INTO `sys_role_menu` VALUES (4, 27);
INSERT INTO `sys_role_menu` VALUES (1, 28);
INSERT INTO `sys_role_menu` VALUES (1, 29);
INSERT INTO `sys_role_menu` VALUES (1, 30);
INSERT INTO `sys_role_menu` VALUES (4, 30);
INSERT INTO `sys_role_menu` VALUES (1, 31);
INSERT INTO `sys_role_menu` VALUES (4, 31);
INSERT INTO `sys_role_menu` VALUES (1, 32);
INSERT INTO `sys_role_menu` VALUES (2, 32);
INSERT INTO `sys_role_menu` VALUES (3, 32);
INSERT INTO `sys_role_menu` VALUES (1, 33);
INSERT INTO `sys_role_menu` VALUES (2, 33);
INSERT INTO `sys_role_menu` VALUES (2, 34);
INSERT INTO `sys_role_menu` VALUES (1, 35);
INSERT INTO `sys_role_menu` VALUES (3, 35);
INSERT INTO `sys_role_menu` VALUES (3, 36);
INSERT INTO `sys_role_menu` VALUES (1, 37);
INSERT INTO `sys_role_menu` VALUES (3, 37);
INSERT INTO `sys_role_menu` VALUES (1, 38);
INSERT INTO `sys_role_menu` VALUES (3, 38);
INSERT INTO `sys_role_menu` VALUES (1, 39);
INSERT INTO `sys_role_menu` VALUES (3, 39);
INSERT INTO `sys_role_menu` VALUES (1, 40);
INSERT INTO `sys_role_menu` VALUES (3, 40);
INSERT INTO `sys_role_menu` VALUES (1, 41);
INSERT INTO `sys_role_menu` VALUES (1, 42);
INSERT INTO `sys_role_menu` VALUES (1, 43);
INSERT INTO `sys_role_menu` VALUES (3, 43);
INSERT INTO `sys_role_menu` VALUES (4, 44);
INSERT INTO `sys_role_menu` VALUES (4, 45);
INSERT INTO `sys_role_menu` VALUES (1, 47);
INSERT INTO `sys_role_menu` VALUES (1, 48);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `login_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录账户',
  `password` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `email` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `gender` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `login_code`(`login_code` ASC) USING BTREE,
  UNIQUE INDEX `id_number`(`id_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '15723177071', 'yp123456', '大锦鲤', '15723177071', '995102209@qq.com', '男', '2000-05-26', '500115200206154100', '重庆一区', '2023-07-05 16:16:14', '2023-07-06 09:44:19', 0);
INSERT INTO `sys_user` VALUES (2, '15723177072', '123456', '收银员A', '15723177072', '995102201@qq.com', '男', '2000-06-24', '500115200206154101', '重庆一区', '2023-07-06 10:20:32', '2023-07-06 09:44:57', 0);
INSERT INTO `sys_user` VALUES (3, '15723177073', '123456', '厨师A', '15723177073', '995102202@qq.com', '男', '1975-01-16', '500115200206154102', '重庆一区', '2023-07-06 11:23:03', '2023-07-06 09:44:33', 0);
INSERT INTO `sys_user` VALUES (4, '15723177074', '123456', '服务员A', '15723177074', '995102203@qq.com', '男', '2001-07-28', '500115200206154103', '四川一区', '2023-07-06 14:24:56', '2023-07-06 09:44:47', 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户id',
  `role_id` int NOT NULL COMMENT '角色id',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id` ASC) USING BTREE,
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (3, 2);
INSERT INTO `sys_user_role` VALUES (4, 3);
INSERT INTO `sys_user_role` VALUES (2, 4);

SET FOREIGN_KEY_CHECKS = 1;
