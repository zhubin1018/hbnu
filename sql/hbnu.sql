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

 Date: 11/02/2020 10:26:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for checkobj
-- ----------------------------
DROP TABLE IF EXISTS `checkobj`;
CREATE TABLE `checkobj`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateObj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sid` int(11) NULL DEFAULT NULL,
  `tid` int(11) NULL DEFAULT NULL,
  `beiZhu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `tid`(`tid`) USING BTREE,
  CONSTRAINT `checkobj_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `checkobj_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of checkobj
-- ----------------------------
INSERT INTO `checkobj` VALUES (40, '2020年2月9日17时1分', 4, 2, '请假');
INSERT INTO `checkobj` VALUES (41, '2020年2月9日18时51分', 4, 2, '缺勤扣5分');
INSERT INTO `checkobj` VALUES (45, '2020年2月9日19时6分', 1, 1, '缺勤扣10分');
INSERT INTO `checkobj` VALUES (46, '2020年2月9日19时28分', 5, 2, '缺勤扣5分');
INSERT INTO `checkobj` VALUES (47, '2020年2月9日19时28分', 3, 2, '缺勤扣15分');
INSERT INTO `checkobj` VALUES (48, '2020年2月9日19时28分', 4, 2, '已到');
INSERT INTO `checkobj` VALUES (49, '2020年2月9日19时28分', 7, 2, '已到');
INSERT INTO `checkobj` VALUES (50, '2020年2月9日20时19分', 4, 2, '已到');
INSERT INTO `checkobj` VALUES (51, '2020年2月9日20时19分', 7, 2, '已到');
INSERT INTO `checkobj` VALUES (52, '2020年2月9日20时19分', 6, 2, '已到');
INSERT INTO `checkobj` VALUES (53, '2020年2月9日20时19分', 8, 2, '已到');
INSERT INTO `checkobj` VALUES (54, '2020年2月9日20时19分', 9, 2, '已到');
INSERT INTO `checkobj` VALUES (55, '2020年2月9日20时19分', 10, 2, '已到');
INSERT INTO `checkobj` VALUES (56, '2020年2月9日20时19分', 11, 2, '已到');
INSERT INTO `checkobj` VALUES (57, '2020年2月9日20时19分', 12, 2, '已到');
INSERT INTO `checkobj` VALUES (58, '2020年2月9日20时19分', 13, 2, '已到');
INSERT INTO `checkobj` VALUES (59, '2020年2月9日20时19分', 14, 2, '已到');
INSERT INTO `checkobj` VALUES (60, '2020年2月9日20时19分', 15, 2, '已到');
INSERT INTO `checkobj` VALUES (61, '2020年2月9日20时19分', 16, 2, '已到');
INSERT INTO `checkobj` VALUES (62, '2020年2月9日20时19分', 17, 2, '已到');
INSERT INTO `checkobj` VALUES (63, '2020年2月9日20时19分', 18, 2, '已到');
INSERT INTO `checkobj` VALUES (64, '2020年2月9日20时19分', 19, 2, '已到');
INSERT INTO `checkobj` VALUES (65, '2020年2月9日20时19分', 20, 2, '已到');
INSERT INTO `checkobj` VALUES (66, '2020年2月9日20时19分', 21, 2, '已到');
INSERT INTO `checkobj` VALUES (67, '2020年2月9日20时19分', 22, 2, '已到');
INSERT INTO `checkobj` VALUES (68, '2020年2月9日20时19分', 23, 2, '已到');
INSERT INTO `checkobj` VALUES (69, '2020年2月9日20时19分', 24, 2, '已到');
INSERT INTO `checkobj` VALUES (70, '2020年2月9日20时19分', 25, 2, '已到');
INSERT INTO `checkobj` VALUES (71, '2020年2月9日20时', 4, 2, '已到');
INSERT INTO `checkobj` VALUES (72, '2020年2月9日20时', 7, 2, '已到');
INSERT INTO `checkobj` VALUES (73, '2020年2月9日20时', 8, 2, '已到');
INSERT INTO `checkobj` VALUES (74, '2020年02月09日10时', 4, 2, '已到');
INSERT INTO `checkobj` VALUES (75, '2020年02月09日10时', 7, 2, '已到');
INSERT INTO `checkobj` VALUES (76, '2020年02月09日10时', 6, 2, '缺勤扣5分');
INSERT INTO `checkobj` VALUES (77, '2020年02月09日10时', 8, 2, '已到');
INSERT INTO `checkobj` VALUES (78, '2020年02月09日10时', 9, 2, '请假');
INSERT INTO `checkobj` VALUES (79, '2020年02月09日10时', 10, 2, '已到');
INSERT INTO `checkobj` VALUES (80, '2020年02月09日10时', 11, 2, '已到');
INSERT INTO `checkobj` VALUES (81, '2020年02月09日10时', 12, 2, '已到');
INSERT INTO `checkobj` VALUES (82, '2020年02月09日10时', 13, 2, '已到');
INSERT INTO `checkobj` VALUES (83, '2020年02月09日10时', 14, 2, '请假');
INSERT INTO `checkobj` VALUES (84, '2020年02月09日10时', 15, 2, '已到');
INSERT INTO `checkobj` VALUES (85, '2020年02月09日10时', 16, 2, '已到');
INSERT INTO `checkobj` VALUES (86, '2020年02月09日10时', 17, 2, '已到');
INSERT INTO `checkobj` VALUES (87, '2020年02月09日10时', 18, 2, '已到');
INSERT INTO `checkobj` VALUES (88, '2020年02月09日10时', 19, 2, '已到');
INSERT INTO `checkobj` VALUES (89, '2020年02月09日10时', 20, 2, '已到');
INSERT INTO `checkobj` VALUES (90, '2020年02月09日10时', 21, 2, '已到');
INSERT INTO `checkobj` VALUES (91, '2020年02月09日10时', 22, 2, '已到');
INSERT INTO `checkobj` VALUES (92, '2020年02月09日10时', 23, 2, '已到');
INSERT INTO `checkobj` VALUES (93, '2020年02月09日10时', 24, 2, '已到');
INSERT INTO `checkobj` VALUES (94, '2020年02月09日10时', 25, 2, '已到');
INSERT INTO `checkobj` VALUES (95, '2020年02月10日09时', 6, 2, '请假');
INSERT INTO `checkobj` VALUES (96, '2020年02月10日07时', 1, 2, '已到');
INSERT INTO `checkobj` VALUES (97, '2020年02月10日07时', 1, 4, '已到');
INSERT INTO `checkobj` VALUES (98, '2020年02月11日09时', 4, 2, '缺勤扣5分');
INSERT INTO `checkobj` VALUES (99, '2020年02月11日09时', 7, 2, '请假');
INSERT INTO `checkobj` VALUES (100, '2020年02月11日09时', 6, 2, '已到');
INSERT INTO `checkobj` VALUES (101, '2020年02月11日09时', 8, 2, '缺勤扣5分');
INSERT INTO `checkobj` VALUES (102, '2020年02月11日09时', 9, 2, '已到');
INSERT INTO `checkobj` VALUES (103, '2020年02月11日09时', 10, 2, '已到');
INSERT INTO `checkobj` VALUES (104, '2020年02月11日09时', 11, 2, '已到');

-- ----------------------------
-- Table structure for coursegrade
-- ----------------------------
DROP TABLE IF EXISTS `coursegrade`;
CREATE TABLE `coursegrade`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NULL DEFAULT NULL,
  `tid` int(11) NULL DEFAULT NULL,
  `agrade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `bgrade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `proportion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subtract` int(11) NULL DEFAULT 0,
  `stuLoginAccount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ssex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `course` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qingjia` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `tid`(`tid`) USING BTREE,
  INDEX `course`(`course`) USING BTREE,
  INDEX `sname`(`sname`) USING BTREE,
  INDEX `ssex`(`ssex`) USING BTREE,
  INDEX `tname`(`tname`) USING BTREE,
  CONSTRAINT `coursegrade_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `coursegrade_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `coursegrade_ibfk_3` FOREIGN KEY (`course`) REFERENCES `teacher` (`course`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `coursegrade_ibfk_4` FOREIGN KEY (`sname`) REFERENCES `student` (`sname`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `coursegrade_ibfk_5` FOREIGN KEY (`ssex`) REFERENCES `student` (`ssex`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `coursegrade_ibfk_6` FOREIGN KEY (`tname`) REFERENCES `teacher` (`tname`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coursegrade
-- ----------------------------
INSERT INTO `coursegrade` VALUES (1, 1, 1, '80', '60', '68', '0.4', 1, '2016112020301', '男', '周杰伦', '说唱与中国风', '狗蛋', 0);
INSERT INTO `coursegrade` VALUES (3, 4, 2, '5', '60', '44', '0.3', 10, '2016112020304', '男', '罗志祥', '疯狂Java', '易烊千玺', 3);
INSERT INTO `coursegrade` VALUES (6, 5, 4, '75', '10', '36', '0.3', 5, '2016112020405', '女', '徐峥', '发型设计', '沙溢', 1);
INSERT INTO `coursegrade` VALUES (13, 3, 1, '70', '10', '28', '0.3', 2, '2016112020303', '男', '周杰伦', '说唱与中国风', '王一博', 0);
INSERT INTO `coursegrade` VALUES (14, 7, 2, '50', '50', '50', '0.3', 0, '2016112020307', '男', '罗志祥', '疯狂Java', '张伟', 1);
INSERT INTO `coursegrade` VALUES (17, 2, 3, '0', '0', '0', '0.3', 0, '2016112020302', '女', '沈腾', '喜剧论', '小灰灰', 0);
INSERT INTO `coursegrade` VALUES (18, 6, 2, '0', '0', '0', '0.3', 1, '2016112020306', '女', '罗志祥', '疯狂Java', '王二狗', 1);
INSERT INTO `coursegrade` VALUES (20, 8, 2, '95', '50', '64', '0.3', 1, '2016112020308', '男', '罗志祥', '疯狂Java', '邓帆', 0);
INSERT INTO `coursegrade` VALUES (21, 9, 2, '10', '0', '3', '0.3', 0, '2016112020309', '男', '罗志祥', '疯狂Java', '万建新', 1);
INSERT INTO `coursegrade` VALUES (22, 10, 2, '0', '0', '0', '0.3', 0, '2016112020310', '男', '罗志祥', '疯狂Java', '谢东鑫', 0);
INSERT INTO `coursegrade` VALUES (23, 11, 2, '0', '0', '0', '0.3', 0, '2016112020311', '男', '罗志祥', '疯狂Java', '彭晓倩', 0);
INSERT INTO `coursegrade` VALUES (24, 12, 2, '10', '0', '3', '0.3', 0, '2016112020312', '男', '罗志祥', '疯狂Java', '谭松', 0);
INSERT INTO `coursegrade` VALUES (25, 13, 2, '0', '0', '0', '0.3', 0, '2016112020313', '男', '罗志祥', '疯狂Java', '金海路', 0);
INSERT INTO `coursegrade` VALUES (26, 14, 2, '0', '0', '0', '0.3', 0, '2016112020314', '男', '罗志祥', '疯狂Java', '周琪', 1);
INSERT INTO `coursegrade` VALUES (27, 15, 2, '0', '0', '0', '0.3', 0, '2016112020315', '女', '罗志祥', '疯狂Java', '李志超', 0);
INSERT INTO `coursegrade` VALUES (28, 16, 2, '0', '0', '0', '0.3', 0, '2016112020316', '男', '罗志祥', '疯狂Java', '李俊杨', 0);
INSERT INTO `coursegrade` VALUES (29, 17, 2, '0', '0', '0', '0.3', 0, '2016112020317', '女', '罗志祥', '疯狂Java', '袁小虎', 0);
INSERT INTO `coursegrade` VALUES (30, 18, 2, '0', '0', '0', '0.3', 0, '2016112020318', '男', '罗志祥', '疯狂Java', '科正', 0);
INSERT INTO `coursegrade` VALUES (31, 19, 2, '0', '0', '0', '0.3', 0, '2016112020319', '男', '罗志祥', '疯狂Java', '田里曼', 0);
INSERT INTO `coursegrade` VALUES (32, 20, 2, '10', '0', '3', '0.3', 0, '2016112020320', '男', '罗志祥', '疯狂Java', '李庄', 0);
INSERT INTO `coursegrade` VALUES (33, 21, 2, '0', '0', '0', '0.3', 0, '2016112020321', '女', '罗志祥', '疯狂Java', '亚瑟', 0);
INSERT INTO `coursegrade` VALUES (34, 22, 2, '0', '0', '0', '0.3', 0, '2016112020322', '男', '罗志祥', '疯狂Java', '亚索', 0);
INSERT INTO `coursegrade` VALUES (35, 23, 2, '10', '0', '3', '0.3', 0, '2016112020323', '男', '罗志祥', '疯狂Java', '石子龙', 0);
INSERT INTO `coursegrade` VALUES (36, 24, 2, '0', '0', '0', '0.3', 0, '2016112020324', '男', '罗志祥', '疯狂Java', '徐辉辉', 0);
INSERT INTO `coursegrade` VALUES (37, 25, 2, '0', '0', '0', '0.3', 0, '2016112020325', '男', '罗志祥', '疯狂Java', '张旭伟', 0);
INSERT INTO `coursegrade` VALUES (38, 26, 1, '0', '0', '0', '0.3', 0, '2016112020326', '女', '周杰伦', '说唱与中国风', '罗浩', 0);
INSERT INTO `coursegrade` VALUES (39, 27, 1, '0', '0', '0', '0.3', 0, '2016112020327', '女', '周杰伦', '说唱与中国风', '可孟涛', 0);
INSERT INTO `coursegrade` VALUES (40, 28, 1, '0', '0', '0', '0.3', 0, '2016112020328', '女', '周杰伦', '说唱与中国风', '张清华', 0);
INSERT INTO `coursegrade` VALUES (41, 29, 1, '0', '0', '0', '0.3', 0, '2016112020329', '女', '周杰伦', '说唱与中国风', '张世东', 0);
INSERT INTO `coursegrade` VALUES (42, 30, 1, '0', '0', '0', '0.3', 0, '2016112020330', '女', '周杰伦', '说唱与中国风', '潘丽', 0);
INSERT INTO `coursegrade` VALUES (43, 1, 4, '80', '0', '24', '0.3', 0, '2016112020301', '男', '徐峥', '发型设计', '狗蛋', 0);
INSERT INTO `coursegrade` VALUES (44, 1, 2, '0', '0', '0', '0.3', 0, '2016112020301', '男', '罗志祥', '疯狂Java', '狗蛋', 0);

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
  `parents_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `tid`(`tid`) USING BTREE,
  INDEX `sname`(`sname`) USING BTREE,
  INDEX `ssex`(`ssex`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '狗蛋', '男', 4, '2016112020301', '123456', '123456');
INSERT INTO `student` VALUES (2, '小灰灰', '女', 3, '2016112020302', '123456', '123456');
INSERT INTO `student` VALUES (3, '王一博', '男', 1, '2016112020303', '123456', '123456');
INSERT INTO `student` VALUES (4, '易烊千玺', '男', 2, '2016112020304', '123456', '123456');
INSERT INTO `student` VALUES (5, '沙溢', '女', 4, '2016112020305', '123456', '123456');
INSERT INTO `student` VALUES (6, '王二狗', '女', 2, '2016112020306', '123456', '123456');
INSERT INTO `student` VALUES (7, '张伟', '男', 2, '2016112020307', '123456', '123456');
INSERT INTO `student` VALUES (8, '邓帆', '男', 2, '2016112020308', '123456', '123456');
INSERT INTO `student` VALUES (9, '万建新', '男', 2, '2016112020309', '123456', '123456');
INSERT INTO `student` VALUES (10, '谢东鑫', '男', 2, '2016112020310', '123456', '123456');
INSERT INTO `student` VALUES (11, '彭晓倩', '男', 2, '2016112020311', '123456', '123456');
INSERT INTO `student` VALUES (12, '谭松', '男', 2, '2016112020312', '123456', '123456');
INSERT INTO `student` VALUES (13, '金海路', '男', 2, '2016112020313', '123456', '123456');
INSERT INTO `student` VALUES (14, '周琪', '男', 2, '2016112020314', '123456', '123456');
INSERT INTO `student` VALUES (15, '李志超', '女', 2, '2016112020315', '123456', '123456');
INSERT INTO `student` VALUES (16, '李俊杨', '男', 2, '2016112020316', '123456', '123456');
INSERT INTO `student` VALUES (17, '袁小虎', '女', 2, '2016112020317', '123456', '123456');
INSERT INTO `student` VALUES (18, '科正', '男', 2, '2016112020318', '123456', '123456');
INSERT INTO `student` VALUES (19, '田里曼', '男', 2, '2016112020319', '123456', '123456');
INSERT INTO `student` VALUES (20, '李庄', '男', 2, '2016112020320', '123456', '123456');
INSERT INTO `student` VALUES (21, '亚瑟', '女', 2, '2016112020321', '123456', '123456');
INSERT INTO `student` VALUES (22, '亚索', '男', 2, '2016112020322', '123456', '123456');
INSERT INTO `student` VALUES (23, '石子龙', '男', 2, '2016112020323', '123456', '123456');
INSERT INTO `student` VALUES (24, '徐辉辉', '男', 2, '2016112020324', '123456', '123456');
INSERT INTO `student` VALUES (25, '张旭伟', '男', 2, '2016112020325', '123456', '123456');
INSERT INTO `student` VALUES (26, '罗浩', '女', 1, '2016112020326', '123456', '123456');
INSERT INTO `student` VALUES (27, '可孟涛', '女', 1, '2016112020327', '123456', '123456');
INSERT INTO `student` VALUES (28, '张清华', '女', 1, '2016112020328', '123456', '123456');
INSERT INTO `student` VALUES (29, '张世东', '女', 1, '2016112020329', '123456', '123456');
INSERT INTO `student` VALUES (30, '潘丽', '女', 1, '2016112020330', '123456', '123456');

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
  PRIMARY KEY (`tid`) USING BTREE,
  INDEX `course`(`course`) USING BTREE,
  INDEX `tname`(`tname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '周杰伦', '说唱与中国风', '1996112020001', '123456');
INSERT INTO `teacher` VALUES (2, '罗志祥', '疯狂Java', '1996112020002', '123456');
INSERT INTO `teacher` VALUES (3, '沈腾', '喜剧论', '1996112020003', '123456');
INSERT INTO `teacher` VALUES (4, '徐峥', '发型设计', '1996112020004', '123456');
INSERT INTO `teacher` VALUES (5, '张艺兴', '街舞的十八般武艺', '1996112020005', '123456');

SET FOREIGN_KEY_CHECKS = 1;
