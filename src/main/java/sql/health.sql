/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : health

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2015-02-12 01:11:42
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `formdata`
-- ----------------------------
DROP TABLE IF EXISTS `formdata`;
CREATE TABLE `formdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `maxvalue` varchar(255) DEFAULT NULL,
  `minvalue` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `normalValues` varchar(255) DEFAULT NULL,
  `other1` varchar(255) DEFAULT NULL,
  `other2` varchar(255) DEFAULT NULL,
  `other3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of formdata
-- ----------------------------
INSERT INTO `formdata` VALUES ('1', 'normal1', '收缩压（高压）', null, null, null, 'mmHg', null, null, null, null);
INSERT INTO `formdata` VALUES ('2', 'normal2', '舒张压（低压）', '', null, null, 'mmHg', null, null, null, null);
INSERT INTO `formdata` VALUES ('3', 'normal3', '脉搏', null, null, null, '次/分钟', null, null, null, null);
INSERT INTO `formdata` VALUES ('4', 'normal4', '心率', '', null, null, '次/分钟', null, null, null, null);
INSERT INTO `formdata` VALUES ('5', 'normal5', '腰围', '', null, null, 'cm', null, null, null, null);
INSERT INTO `formdata` VALUES ('6', 'normal6', '臀围', '', null, null, 'cm', null, null, null, null);
INSERT INTO `formdata` VALUES ('7', 'normal7', '身高', '', null, null, 'cm', null, null, null, null);
INSERT INTO `formdata` VALUES ('8', 'normal8', '体重', '', null, null, 'kg', null, null, null, null);
INSERT INTO `formdata` VALUES ('9', 'normal9', '体脂肪量', '', null, null, 'kg', null, null, null, null);
INSERT INTO `formdata` VALUES ('10', 'normal10', '肌肉量', '', null, null, 'kg', null, null, null, null);
INSERT INTO `formdata` VALUES ('11', 'normal11', '体水分量', '', null, null, 'kg', null, null, null, null);
INSERT INTO `formdata` VALUES ('12', 'normal12', '体重指数（BMI）', '', null, null, 'kg/m<sup>2</sup>', null, null, null, null);
INSERT INTO `formdata` VALUES ('13', 'normal13', '腰臀围比值', '', null, null, '无', null, null, null, null);
INSERT INTO `formdata` VALUES ('14', 'normal14', '体脂肪率', '', null, null, '%', null, null, null, null);
INSERT INTO `formdata` VALUES ('15', 'normal15', '身体均衡（右臂）', '', null, null, 'kg', null, null, null, null);
INSERT INTO `formdata` VALUES ('16', 'normal16', '身体均衡（左臂）', '', null, null, 'kg', null, null, null, null);
INSERT INTO `formdata` VALUES ('17', 'normal17', '身体均衡（右腿）', '', null, null, 'kg', null, null, null, null);
INSERT INTO `formdata` VALUES ('18', 'normal18', '身体均衡（左腿）', '', null, null, 'kg', null, null, null, null);
INSERT INTO `formdata` VALUES ('19', 'normal19', '身体均衡（躯干）', '', null, null, 'kg', null, null, null, null);
INSERT INTO `formdata` VALUES ('20', 'normal20', '细胞内液', '', null, null, 'L', null, null, null, null);
INSERT INTO `formdata` VALUES ('21', 'normal21', '细胞外液', '', null, null, 'L', null, null, null, null);
INSERT INTO `formdata` VALUES ('22', 'normal22', '蛋白质', '', null, null, 'kg', null, null, null, null);
INSERT INTO `formdata` VALUES ('23', 'normal23', '无机质', '', null, null, 'kg', null, null, null, null);
INSERT INTO `formdata` VALUES ('24', 'normal24', '脂肪质', '', null, null, 'kg', null, null, null, null);
INSERT INTO `formdata` VALUES ('25', 'normal25', '内科', null, null, null, '', null, null, null, null);
INSERT INTO `formdata` VALUES ('26', 'normal26', '外科', null, null, null, '', null, null, null, null);
INSERT INTO `formdata` VALUES ('27', 'normal27', '视力', null, null, null, '', null, null, null, null);
INSERT INTO `formdata` VALUES ('28', 'normal28', '眼科', null, null, null, '', null, null, null, null);
INSERT INTO `formdata` VALUES ('29', 'normal29', '耳鼻咽喉科', null, null, null, '', null, null, null, null);
INSERT INTO `formdata` VALUES ('30', 'normal30', '口腔科', null, null, null, '', null, null, null, null);
INSERT INTO `formdata` VALUES ('31', 'normal31', '妇科', null, null, null, '', null, null, null, null);
INSERT INTO `formdata` VALUES ('32', 'labn1', '红细胞计数（RBC）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('33', 'labn2', '血红蛋白测定（HB）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('34', 'labn3', '红细胞压积（Hct）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('35', 'labn4', '平均红细胞体积（MCV）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('36', 'labn5', '平均红细胞血红蛋白量（MCH）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('37', 'labn6', '平均红细胞血红蛋白浓度（MCHC）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('38', 'labn7', '红细胞体积分布宽度（RDW）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('39', 'labn8', '白细胞计数（WBC）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('40', 'labn9', '血小板计数（PLT）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('41', 'labn10', '平均血小板体积（MPV）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('42', 'labn11', '网织红细胞百分率（RET%）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('43', 'labn12', '低荧光网织红细胞', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('44', 'labn13', '中荧光网织红细胞', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('45', 'labn14', '高荧光网织红细胞', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('46', 'labn15', '嗜酸性粒细胞', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('47', 'labn16', '淋巴细胞', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('48', 'labn17', '嗜碱性粒细胞', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('49', 'labn18', '单核细胞', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('50', 'labn19', '中性粒细胞', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('51', 'labn20', '尿颜色（COL）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('52', 'labn21', '尿比重（SG）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('53', 'labn22', '尿酸碱度（pH）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('54', 'labn23', '尿蛋白（Pro）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('55', 'labn24', '尿糖（GLU）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('56', 'labn25', '尿胆红素（BIL）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('57', 'labn26', '尿结晶（CRY）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('58', 'labn27', '尿胆原（UBG）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('59', 'labn28', '尿酮体（KET）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('60', 'labn29', '尿亚硝酸盐试验（NIT）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('61', 'labn30', '尿红细胞', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('62', 'labn31', '尿红细胞（镜检）（RBC）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('63', 'labn32', '尿白细胞（镜检）（WBC）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('64', 'labn33', '尿鳞状上皮细胞（EPT）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('65', 'labn34', '尿非鳞状上皮细胞（EPT）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('66', 'labn35', '尿透明管型（PAT）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('67', 'labn36', '尿未分类管型', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('68', 'labn37', '快速微量白蛋白/肌酐（尿微量白蛋白+尿肌酐）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('69', 'labn38', '尿α1-微球蛋白', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('70', 'labn39', '尿β2-微球蛋白', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('71', 'labn40', '粪便颜色（COL）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('72', 'labn41', '粪便性状（SHA）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('73', 'labn42', '粪便白细胞（WBC）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('74', 'labn43', '粪便红细胞（RBC）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('75', 'labn44', '粪便虫卵（大便集卵）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('76', 'labn45', '潜血检查（OB）', null, null, null, null, null, null, null, null);
INSERT INTO `formdata` VALUES ('77', 'labn46', '血型ABO正反定型\r\n', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `survey_check`
-- ----------------------------
DROP TABLE IF EXISTS `survey_check`;
CREATE TABLE `survey_check` (
  `uid` int(11) NOT NULL,
  `high` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `xiongwei` varchar(255) DEFAULT NULL,
  `gaoya` varchar(255) DEFAULT NULL,
  `diya` varchar(255) DEFAULT NULL,
  `zaobo` varchar(255) DEFAULT NULL,
  `stt` varchar(255) DEFAULT NULL,
  `fangchan` varchar(255) DEFAULT NULL,
  `zuoxinshi` varchar(255) DEFAULT NULL,
  `xb01` varchar(255) DEFAULT NULL,
  `xb02` varchar(255) DEFAULT NULL,
  `xb03` varchar(255) DEFAULT NULL,
  `xb04` varchar(255) DEFAULT NULL,
  `xb05` varchar(255) DEFAULT NULL,
  `xb06` varchar(255) DEFAULT NULL,
  `xb07` varchar(255) DEFAULT NULL,
  `xb08` varchar(255) DEFAULT NULL,
  `sys01` varchar(255) DEFAULT NULL,
  `sys02` varchar(255) DEFAULT NULL,
  `sys03` varchar(255) DEFAULT NULL,
  `sys04` varchar(255) DEFAULT NULL,
  `sys05` varchar(255) DEFAULT NULL,
  `sys06` varchar(255) DEFAULT NULL,
  `sys07` varchar(255) DEFAULT NULL,
  `sys08` varchar(255) DEFAULT NULL,
  `sys09` varchar(255) DEFAULT NULL,
  `sys10` varchar(255) DEFAULT NULL,
  `sys11` varchar(255) DEFAULT NULL,
  `sys12` varchar(255) DEFAULT NULL,
  `sys13` varchar(255) DEFAULT NULL,
  `sys14` varchar(255) DEFAULT NULL,
  `sys15` varchar(255) DEFAULT NULL,
  `sys16` varchar(255) DEFAULT NULL,
  `sys17` varchar(255) DEFAULT NULL,
  `sys18` varchar(255) DEFAULT NULL,
  `sys19` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of survey_check
-- ----------------------------

-- ----------------------------
-- Table structure for `survey_eat`
-- ----------------------------
DROP TABLE IF EXISTS `survey_eat`;
CREATE TABLE `survey_eat` (
  `uid` int(11) NOT NULL,
  `eat01` varchar(255) DEFAULT NULL,
  `eat02` varchar(255) DEFAULT NULL,
  `eat03` varchar(255) DEFAULT NULL,
  `eat04` varchar(255) DEFAULT NULL,
  `eat05` varchar(255) DEFAULT NULL,
  `eat06` varchar(255) DEFAULT NULL,
  `eat07` varchar(255) DEFAULT NULL,
  `eat08` varchar(255) DEFAULT NULL,
  `eat09` varchar(255) DEFAULT NULL,
  `eat10` varchar(255) DEFAULT NULL,
  `eath01` varchar(255) DEFAULT NULL,
  `eath02` varchar(255) DEFAULT NULL,
  `eath03` varchar(255) DEFAULT NULL,
  `eatt` varchar(255) DEFAULT NULL,
  `isXiyan` varchar(255) DEFAULT NULL,
  `zhuyaoChou` varchar(255) DEFAULT NULL,
  `howManyYan` varchar(255) DEFAULT NULL,
  `whenXiYan` varchar(255) DEFAULT NULL,
  `hasOtherChou` varchar(255) DEFAULT NULL,
  `whenJieYan` varchar(255) DEFAULT NULL,
  `isdrink` varchar(255) DEFAULT NULL,
  `howlongDrink` varchar(255) DEFAULT NULL,
  `howmuchDrink1` varchar(255) DEFAULT NULL,
  `howmuchDrink2` varchar(255) DEFAULT NULL,
  `howmuchDrink3` varchar(255) DEFAULT NULL,
  `ismustDrink` varchar(255) DEFAULT NULL,
  `work` varchar(255) DEFAULT NULL,
  `jiaotong` varchar(255) DEFAULT NULL,
  `jiawu` varchar(255) DEFAULT NULL,
  `tiyu01` varchar(255) DEFAULT NULL,
  `tiyu02` varchar(255) DEFAULT NULL,
  `tiyu03` varchar(255) DEFAULT NULL,
  `tiyu04` varchar(255) DEFAULT NULL,
  `zhiye01` varchar(255) DEFAULT NULL,
  `zhiye02` varchar(255) DEFAULT NULL,
  `zhiye03` varchar(255) DEFAULT NULL,
  `zhiye04` varchar(255) DEFAULT NULL,
  `zhiye05` varchar(255) DEFAULT NULL,
  `zhiye06` varchar(255) DEFAULT NULL,
  KEY `f_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of survey_eat
-- ----------------------------
INSERT INTO `survey_eat` VALUES ('2', '5-7天', '5-7天', '3-4天', '3-4天', '5-7天', '5-7天', '5-7天', '3-4天', '3-4天', '3-4天', '12两以上', '基本不吃', '5-9两', '略淡', '是', '卷烟', '55', '33', '有', '99', '不喝', '每天2次', null, null, '11', '', '', '', '', '', '', '', '', '很不满意', '', '', '', '', '');

-- ----------------------------
-- Table structure for `survey_health`
-- ----------------------------
DROP TABLE IF EXISTS `survey_health`;
CREATE TABLE `survey_health` (
  `uid` int(11) NOT NULL,
  `isFaRe` varchar(4) DEFAULT NULL,
  `isTried` varchar(4) DEFAULT NULL,
  `isInappetence` varchar(4) DEFAULT NULL,
  `isTouTong` varchar(255) DEFAULT NULL,
  `isTouYun` varchar(255) DEFAULT NULL,
  `isXiongTong` varchar(255) DEFAULT NULL,
  `isHuXi` varchar(255) DEFAULT NULL,
  `isKeSou` varchar(255) DEFAULT NULL,
  `isKeTan` varchar(255) DEFAULT NULL,
  `isDaHuLu` varchar(255) DEFAULT NULL,
  `isKeShui` varchar(255) DEFAULT NULL,
  `isTunYanKunNan` varchar(255) DEFAULT NULL,
  `isShangFuTong` varchar(255) DEFAULT NULL,
  `isBianMi` varchar(255) DEFAULT NULL,
  `isFuXie` varchar(255) DEFAULT NULL,
  `isDaBian` varchar(255) DEFAULT NULL,
  `isPaiNiaoNan` varchar(255) DEFAULT NULL,
  `isNiaoTong` varchar(255) DEFAULT NULL,
  `isGuanJieTong` varchar(255) DEFAULT NULL,
  `isYaoTong` varchar(255) DEFAULT NULL,
  `isShiMian` varchar(255) DEFAULT NULL,
  `hasZhiQiGuan` varchar(255) DEFAULT NULL,
  `hasXiaoChuan` varchar(255) DEFAULT NULL,
  `hasFeiQiZhong` varchar(255) DEFAULT NULL,
  `hasFeiJieHe` varchar(255) DEFAULT NULL,
  `hasFeiBing` varchar(255) DEFAULT NULL,
  `hasFeiXinBing` varchar(255) DEFAULT NULL,
  `hasGaoXieYa` varchar(255) DEFAULT NULL,
  `hasGuanXinBing` varchar(255) DEFAULT NULL,
  `hasXinLiShuaiJie` varchar(255) DEFAULT NULL,
  `hasZhongFeng` varchar(255) DEFAULT NULL,
  `hasTangNiaoBing` varchar(255) DEFAULT NULL,
  `hasWeiYan` varchar(255) DEFAULT NULL,
  `hasChangDao` varchar(255) DEFAULT NULL,
  `hasZhiChuang` varchar(255) DEFAULT NULL,
  `hasGanYan` varchar(255) DEFAULT NULL,
  `hasGanYingHua` varchar(255) DEFAULT NULL,
  `hasPinXue` varchar(255) DEFAULT NULL,
  `hasShenShuaiJie` varchar(255) DEFAULT NULL,
  `hasGuShuSong` varchar(255) DEFAULT NULL,
  `hasTongFeng` varchar(255) DEFAULT NULL,
  `hasFeiAi` varchar(255) DEFAULT NULL,
  `hasWeiAi` varchar(255) DEFAULT NULL,
  `hasGanAi` varchar(255) DEFAULT NULL,
  `hasDaChangAi` varchar(255) DEFAULT NULL,
  `hasOther` varchar(255) DEFAULT NULL,
  `hasQiGuanYan` varchar(255) DEFAULT NULL,
  `hasAllFeiJieHe` varchar(255) DEFAULT NULL,
  `hasATangNiaoBing` varchar(255) DEFAULT NULL,
  `hasAllTangNiao` varchar(255) DEFAULT NULL,
  `hasGaoXueYa` varchar(255) DEFAULT NULL,
  `hasAllGaoXueYa` varchar(255) DEFAULT NULL,
  `hasAGuanXinBing` varchar(255) DEFAULT NULL,
  `hasAZhongFeng` varchar(255) DEFAULT NULL,
  `hasAGanYan` varchar(255) DEFAULT NULL,
  `hasAFeiAi` varchar(255) DEFAULT NULL,
  `hasAGanAi` varchar(255) DEFAULT NULL,
  `hasAWeiAi` varchar(255) DEFAULT NULL,
  `hasADaChangAi` varchar(255) DEFAULT NULL,
  `FirstYJ` varchar(255) DEFAULT NULL,
  `isJueJing` varchar(255) DEFAULT NULL,
  `ageOfM` varchar(255) DEFAULT NULL,
  `isHasChild` varchar(255) DEFAULT NULL,
  `isWeiNai` varchar(255) DEFAULT NULL,
  `hasGongJing` varchar(255) DEFAULT NULL,
  `FuyongCiJS` varchar(255) DEFAULT NULL,
  `hasRuXianZS` varchar(255) DEFAULT NULL,
  `hasRuXianAi` varchar(255) DEFAULT NULL,
  `hasORuXianAi` varchar(255) DEFAULT NULL,
  `howCheckRuXianAi` varchar(255) DEFAULT NULL,
  `isCookOfthen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of survey_health
-- ----------------------------
INSERT INTO `survey_health` VALUES ('2', '偶尔', '没有', '没有', '偶尔', '没有', '没有', '没有', '偶尔', '没有', '没有', '没有', '没有', '没有', '没有', '没有', '没有', '没有', '没有', '没有', '没有', '没有', '目前患有;在医生指导下治疗', '', '', '', '', '', '', '', '', '', '从未患过', '', '从未患过', '从未患过', '', '', '', '', '', '', '', '', '', '曾经患过;在医生指导下治疗', '', '', '', '', '否', '否', '不知道', '是', '不知道', '是', '否', '否', '否', '否', '66', '是;77', '44', '', '', '否', '否', '', '', '', '', '');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name_zh` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `gender` char(10) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `education` char(30) DEFAULT NULL,
  `marriage` char(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `home` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '高通', '', '男', 'dfsdf', '行政人员', '高中及以下', '未婚', '北方工业大学', '15652525910', 'gaotong@11.com', '满族', 'henan', '19902055', '1990-01-16');
INSERT INTO `user` VALUES ('3', 'aaaaa', null, null, 'dddddd', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('4', null, null, null, null, null, null, null, null, null, 'gaotong@163.com', null, null, '19902055', null);
INSERT INTO `user` VALUES ('5', '123', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('6', '', '', '', '', '', '', '', '', '', 'gaotong@test.com', '', '', '19902055', '');
INSERT INTO `user` VALUES ('7', '', '', '', '', '', '', '', '', '', 'test@test.com', '', '', '19902055', '');
