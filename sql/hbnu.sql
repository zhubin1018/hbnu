/*
 Navicat Premium Data Transfer

 Source Server         : bin
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : localhost:3306
 Source Schema         : hbnu

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 07/02/2020 20:45:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for coursegrade
-- ----------------------------
DROP TABLE IF EXISTS `coursegrade`;
CREATE TABLE `coursegrade`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NULL DEFAULT NULL,
  `tid` int(11) NULL DEFAULT NULL,
  `addgrade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `agrade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bgrade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `proportion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subtract` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stuLoginAccount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ssex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `course` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `tid`(`tid`) USING BTREE,
  CONSTRAINT `coursegrade_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `coursegrade_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coursegrade
-- ----------------------------
INSERT INTO `coursegrade` VALUES (1, 1, 1, '24', '90', '60', '72', '0.4', '0', '2016112020301', '男', '周杰伦', '说唱与中国风', '狗蛋1');
INSERT INTO `coursegrade` VALUES (3, 4, 2, '222', '60', '30', '42', '0.4', '0', '2016112020405', '男', '罗志祥', '街舞的十八般武艺', '王一博1');
INSERT INTO `coursegrade` VALUES (6, 5, 2, '222', '222', '10', '222', '0.4', '0', '2016112020405', '男', '罗志祥', '街舞的十八般武艺', '王一博2');
INSERT INTO `coursegrade` VALUES (7, 6, 2, '222', '222', '10', '222', '0.4', '0', '2016112020405', '男', '罗志祥', '街舞的十八般武艺', '王一博3');
INSERT INTO `coursegrade` VALUES (11, 2, 2, '222', '222', '10', '222', '0.4', '0', '2016112020405', '男', '罗志祥', '街舞的十八般武艺', '王一博4');
INSERT INTO `coursegrade` VALUES (13, 3, 2, '222', '222', '10', '222', '0.4', '0', '6666', '男', '罗志祥', '街舞的十八般武艺', '王一博666');
INSERT INTO `coursegrade` VALUES (14, 7, 2, '222', '222', '10', '222', '0.4', '0', '9999', '男', '罗志祥', '街舞的十八般武艺', '王一博999');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ssex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tid` int(11) NULL DEFAULT NULL,
  `loginAccount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `tid`(`tid`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '狗蛋', '男', 4, '2016112020301', '123456');
INSERT INTO `student` VALUES (2, '小灰灰', '女', 3, '2016112020302', '123456');
INSERT INTO `student` VALUES (3, '王一博', '男', 1, '2016112020403', '123456');
INSERT INTO `student` VALUES (4, '易烊千玺', '男', 2, '2016112020404', '123456');
INSERT INTO `student` VALUES (5, '沙溢', '女', 4, '2016112020505', '123456');
INSERT INTO `student` VALUES (6, '王二狗', '女', 2, '2016112020506', '123456');
INSERT INTO `student` VALUES (7, '张伟', '男', 2, '2016112020507', '123456');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `course` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginAccount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '周杰伦', '说唱与中国风', '1996112020001', '123465');
INSERT INTO `teacher` VALUES (2, '罗志祥', '街舞的十八般武艺', '1996112020002', '123456');
INSERT INTO `teacher` VALUES (3, '沈腾', '喜剧论', '1996112020003', '123456');
INSERT INTO `teacher` VALUES (4, '徐峥', '发型设计', '1996112020004', '123456');
INSERT INTO `teacher` VALUES (5, '张艺兴', '街舞的十八般武艺', '1996112020005', '123456');

SET FOREIGN_KEY_CHECKS = 1;
