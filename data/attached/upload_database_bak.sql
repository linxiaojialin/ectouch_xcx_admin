/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : xiaomi20162

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2016-04-29 13:49:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ecs_category`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_category`;
CREATE TABLE `ecs_category` (
  `cat_id` smallint(5) unsigned NOT NULL auto_increment,
  `cat_name` varchar(90) NOT NULL default '',
  `keywords` varchar(255) NOT NULL default '',
  `cat_desc` varchar(255) NOT NULL default '',
  `parent_id` smallint(5) unsigned NOT NULL default '0',
  `sort_order` tinyint(1) unsigned NOT NULL default '50',
  `template_file` varchar(50) NOT NULL default '',
  `measure_unit` varchar(15) NOT NULL default '',
  `show_in_nav` tinyint(1) NOT NULL default '0',
  `style` varchar(150) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL default '1',
  `grade` tinyint(4) NOT NULL default '0',
  `filter_attr` varchar(255) NOT NULL default '0',
  `is_top_style` tinyint(1) unsigned NOT NULL default '0',
  `is_on_top` tinyint(1) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`cat_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_category
-- ----------------------------
INSERT INTO `ecs_category` VALUES ('69', '购买手机', '', '', '0', '50', '', '', '1', '', '1', '0', '', '0', '0', '');
INSERT INTO `ecs_category` VALUES ('91', '床头灯', '', '', '80', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714828177337851.jpg');
INSERT INTO `ecs_category` VALUES ('83', '小米手环', '', '', '80', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714594129934702.jpg');
INSERT INTO `ecs_category` VALUES ('77', '小米电视2', '', '', '76', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714523818497367.jpg');
INSERT INTO `ecs_category` VALUES ('75', '根据机型选配件', '', '', '69', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714436136987275.jpg');
INSERT INTO `ecs_category` VALUES ('70', '小米Note', '', '', '69', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440694830757590201.jpg');
INSERT INTO `ecs_category` VALUES ('71', '小米手机4', '', '', '69', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714333309950345.jpg');
INSERT INTO `ecs_category` VALUES ('95', '小米移动电源', '', '', '94', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714900932574593.jpg');
INSERT INTO `ecs_category` VALUES ('92', '随身WiFi', '', '', '80', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715656375233503.jpg');
INSERT INTO `ecs_category` VALUES ('84', '净化器与滤芯', '', '', '80', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714604871156701.jpg');
INSERT INTO `ecs_category` VALUES ('80', '路由器与智能硬件', '', '', '0', '50', '', '', '0', '', '1', '0', '0', '0', '0', '');
INSERT INTO `ecs_category` VALUES ('81', '小米路由器', '', '', '80', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714625090181569.jpg');
INSERT INTO `ecs_category` VALUES ('76', '购买电视与平板', '', '', '0', '50', '', '', '1', '', '1', '9', '11,10', '0', '0', '');
INSERT INTO `ecs_category` VALUES ('73', '红米Note', '', '', '69', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714403858779637.jpg');
INSERT INTO `ecs_category` VALUES ('72', '红米手机2', '', '', '69', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714364083646808.jpg');
INSERT INTO `ecs_category` VALUES ('74', '合约机', '', '', '69', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714462800237542.jpg');
INSERT INTO `ecs_category` VALUES ('82', '小米路由器mini', '', '', '80', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714634528408482.jpg');
INSERT INTO `ecs_category` VALUES ('104', '小米蓝牙耳机', '', '', '101', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715065754194490.jpg');
INSERT INTO `ecs_category` VALUES ('105', '品牌耳机', '', '', '101', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715032831550803.jpg');
INSERT INTO `ecs_category` VALUES ('101', '耳机音箱与存储卡', '', '', '0', '50', '', '', '1', '', '1', '0', '', '0', '0', '');
INSERT INTO `ecs_category` VALUES ('103', '小米活塞耳机', '', '', '101', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715024130191189.jpg');
INSERT INTO `ecs_category` VALUES ('102', '小米头戴式耳机', '', '', '101', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715048540050271.jpg');
INSERT INTO `ecs_category` VALUES ('97', '品牌移动电源', '', '', '94', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714924713983846.jpg');
INSERT INTO `ecs_category` VALUES ('96', '插线板', '', '', '94', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714915425315885.jpg');
INSERT INTO `ecs_category` VALUES ('100', '线材', '', '', '94', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714936755382725.jpg');
INSERT INTO `ecs_category` VALUES ('98', '电池', '', '', '94', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714981256300433.jpg');
INSERT INTO `ecs_category` VALUES ('99', '充电器', '', '', '94', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714969081433313.jpg');
INSERT INTO `ecs_category` VALUES ('94', '插线板、移动电源与电池', '', '', '0', '50', '', '', '0', '', '1', '0', '', '0', '0', '');
INSERT INTO `ecs_category` VALUES ('93', '智能家庭套装', '', '', '80', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714801144245694.jpg');
INSERT INTO `ecs_category` VALUES ('90', '体重秤', '', '', '80', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714813461961388.jpg');
INSERT INTO `ecs_category` VALUES ('85', '运动相机', '', '', '80', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714715783886182.jpg');
INSERT INTO `ecs_category` VALUES ('86', '摄像机', '', '', '80', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714727617165633.jpg');
INSERT INTO `ecs_category` VALUES ('87', '血压计', '', '', '80', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714693247309265.jpg');
INSERT INTO `ecs_category` VALUES ('88', '智能插座', '', '', '80', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714705263121780.jpg');
INSERT INTO `ecs_category` VALUES ('89', '智能灯泡', '', '', '80', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715638505801362.jpg');
INSERT INTO `ecs_category` VALUES ('108', '保护套与贴膜', '', '', '0', '50', '', '', '1', '', '1', '0', '', '0', '0', '');
INSERT INTO `ecs_category` VALUES ('107', '存储卡', '', '', '101', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715085793740200.jpg');
INSERT INTO `ecs_category` VALUES ('106', '音箱', '', '', '101', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715040881731212.jpg');
INSERT INTO `ecs_category` VALUES ('79', '小米平板', '', '', '76', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714487073430021.jpg');
INSERT INTO `ecs_category` VALUES ('78', '小米盒子', '', '', '76', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440714530518865434.jpg');
INSERT INTO `ecs_category` VALUES ('109', '保护套', '', '', '108', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715134794547790.jpg');
INSERT INTO `ecs_category` VALUES ('110', '贴膜', '', '', '108', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715114068188035.jpg');
INSERT INTO `ecs_category` VALUES ('111', '防尘塞', '', '', '108', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715123287405177.jpg');
INSERT INTO `ecs_category` VALUES ('112', '后盖与个性化配件', '', '', '0', '50', '', '', '0', '', '1', '0', '', '0', '0', '');
INSERT INTO `ecs_category` VALUES ('113', '米键', '', '', '112', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715625439150214.jpg');
INSERT INTO `ecs_category` VALUES ('114', '后盖', '', '', '112', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715187036075931.jpg');
INSERT INTO `ecs_category` VALUES ('115', '贴纸', '', '', '112', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715195561532491.jpg');
INSERT INTO `ecs_category` VALUES ('116', '手机支架', '', '', '112', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715238522222987.jpg');
INSERT INTO `ecs_category` VALUES ('117', '耳机绕线器', '', '', '112', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715230765044894.jpg');
INSERT INTO `ecs_category` VALUES ('118', '小米生活方式', '', '', '0', '50', '', '', '1', '', '1', '0', '', '0', '0', '');
INSERT INTO `ecs_category` VALUES ('119', 'T恤', '', '', '118', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715327531806544.jpg');
INSERT INTO `ecs_category` VALUES ('120', '米兔', '', '', '118', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715299548417989.jpg');
INSERT INTO `ecs_category` VALUES ('121', '背包', '', '', '118', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715307737503627.jpg');
INSERT INTO `ecs_category` VALUES ('122', '小米鼠标垫', '', '', '118', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715318290414276.jpg');
INSERT INTO `ecs_category` VALUES ('123', '生活周边', '', '', '118', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1440715289580224704.jpg');
INSERT INTO `ecs_category` VALUES ('124', '小米电视', '', '', '76', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1441052146914725720.jpg');
INSERT INTO `ecs_category` VALUES ('125', '电视盒子配件', '', '', '76', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1441052187926588684.jpg');
INSERT INTO `ecs_category` VALUES ('126', '小米盒子mini', '', '', '76', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1441057025002599029.jpg');
INSERT INTO `ecs_category` VALUES ('127', '翻盖保护套', '', '', '108', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1441055970998522204.png');
INSERT INTO `ecs_category` VALUES ('128', '软胶保护套', '', '', '108', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1441056068949453322.png');
INSERT INTO `ecs_category` VALUES ('129', '保护壳', '', '', '108', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1441056471201197370.png');
INSERT INTO `ecs_category` VALUES ('130', '酷玩产品', '', '', '118', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1441056836925397608.jpg');
INSERT INTO `ecs_category` VALUES ('131', '卫衣', '', '', '118', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1441057330781825431.jpg');
INSERT INTO `ecs_category` VALUES ('132', 'POLO衫', '', '', '118', '50', '', '', '0', '', '1', '0', '0', '0', '0', '1441057345875896145.jpg');

-- ----------------------------
-- Table structure for `ecs_comment`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_comment`;
CREATE TABLE `ecs_comment` (
  `comment_id` int(10) unsigned NOT NULL auto_increment,
  `comment_type` tinyint(3) unsigned NOT NULL default '0',
  `id_value` mediumint(8) unsigned NOT NULL default '0',
  `email` varchar(60) NOT NULL default '',
  `user_name` varchar(60) NOT NULL default '',
  `content` text NOT NULL,
  `comment_rank` tinyint(1) unsigned NOT NULL default '0',
  `add_time` int(10) unsigned NOT NULL default '0',
  `ip_address` varchar(15) NOT NULL default '',
  `status` tinyint(3) unsigned NOT NULL default '0',
  `parent_id` int(10) unsigned NOT NULL default '0',
  `user_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`comment_id`),
  KEY `parent_id` (`parent_id`),
  KEY `id_value` (`id_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_comment
-- ----------------------------
INSERT INTO `ecs_comment` VALUES ('88', '0', '27', '497110669@qq.com', '', '不买盒子可以直接放电视吗', '5', '1441666569', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('89', '0', '27', 'admin1232444@qq.com', '', '电视太漂亮了，外观很时尚', '5', '1441666602', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('92', '0', '27', '497110669@qq.com', '', '颜色好看，音质和简装版一样，有点小贵', '3', '1441666806', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('91', '0', '27', '497110669@qq.com', '', '这个冰川蓝我非常喜欢！颜色很亮！感觉很清爽呢！像是夏天的海洋！音质棒棒的！来吧！打开DJ一起摇…！', '5', '1441666787', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('90', '0', '27', '444@qq.com', '', '东西不错，是正品，现在高仿小米的产品太多了，只有选择官网购买，一分钱一分货', '4', '1441666765', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('54', '0', '39', 'af@sdds.dsd', '', '大发发生', '3', '1440454940', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('55', '0', '39', '497110669@qq.com', '', 'sadadsad', '4', '1440455014', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('56', '0', '55', 'dsadsadad@qq.cc', '', 'dsadsdsad', '2', '1440625711', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('57', '0', '55', '21e12@ww.aaa', '', 'DSADADSFASDFASD', '5', '1440625790', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('58', '0', '55', '21e12@ww.aaa', '', 'RSGDFHFRHRT', '5', '1440625812', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('59', '0', '55', '497110669@qq.com', '', '五星', '5', '1440626866', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('60', '0', '55', 'admin1232444@qq.com', '', '四星', '4', '1440626886', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('61', '0', '55', '497110669@qq.com', '', 'dasdsad', '5', '1440626899', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('62', '0', '55', 'admin1232444@qq.com', '', '三星', '3', '1440626939', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('63', '0', '55', '497110669@qq.com', '', '两星', '2', '1440626980', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('64', '0', '55', '497110669@qq.com', '', '一星', '1', '1440626998', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('65', '0', '55', '497110669@qq.com', '', 'dsddad', '3', '1440634960', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('66', '0', '55', 'admin1232444@qq.com', '', 'ededededededededededededededed', '2', '1440634977', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('67', '0', '55', 'admin1232444@qq.com', '', 'wdwdw', '2', '1440634988', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('93', '0', '27', '497110669@qq.com', '', '收到实物后，看见耳机确实是蓝色的，有一点像小清新的天空蓝，颜色真好看，超喜欢的说≧◇≦', '5', '1441666830', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('69', '0', '45', 'kk1346@qq.com', 'tyq', 'eeeeeeeeeeeeeeeee', '5', '1440974952', '127.0.0.1', '1', '0', '16');
INSERT INTO `ecs_comment` VALUES ('70', '0', '28', 'ss5521221w@qq.cs', '', '外观时尚，系统流畅，续航时间长。', '5', '1441492507', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('71', '0', '85', 'ssssssss@ww.aa', '', '同事很喜欢，不显厚～bling bling～ ', '5', '1441492559', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('72', '0', '38', 'ssssssss@ww.aa', '', '还不错，音质也好，就是太可爱了，被小侄女看到了。(๑´ω`๑) ', '5', '1441492617', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('73', '0', '88', 'ssssssss@ww.aa', '', 'So cool！看米关公风虎云龙！大喝一声—— 『刀下留人！』 ', '5', '1441492755', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('74', '0', '84', 'ssssssss@ww.aa', '', '东西是还可以啦。。就是不方便。要是带磁铁封的就好了。。可能是新东西。。放在哪老是自己张开。。这个情况令我很是烦恼。。。 ', '4', '1441502880', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('75', '0', '84', 'ssssssss@ww.aa', '', '我己买了手杌套，下一步就该手机了，必须买个红米note，因为手机我只用小米的！！！ ', '4', '1441502916', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('76', '0', '84', 'ssssssss@ww.aa', '', '昨天我夜观天象，被告知我评论完成，就可以得到客服妹妹的电话号码，特意前来验证 ', '4', '1441502938', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('77', '0', '84', 'ssssssss@ww.aa', '', '做工是比较熬好的，有几点不足，观看电影的时候保护套不能将手机倾斜45度角，在盖住手机的时候前盖盖不住，设计个按钮会更好地，弄的我有换了一个保护壳。 ', '3', '1441502981', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('78', '0', '84', 'ssssssss@ww.aa', '', '给力啊，小米的周边配件挺好用的。 ', '5', '1441503019', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('79', '0', '84', '', 'admin', '这么巧？小妹我昨夜夜观星象，发现贪狼移位，破军妄动，紫薇星暗淡！萤惑星闪耀红光。拈指一算，竟推出今日若有信息泄露，必定狼哭鬼嚎，血流成河。为了大地苍生，此事改日再议，感谢您对小米的支持。', '0', '1441503072', '127.0.0.1', '0', '76', '0');
INSERT INTO `ecs_comment` VALUES ('80', '0', '84', '', 'admin', '购物狂是种病，得治啊，不过闲着也是闲着，不如送给身边有用的人儿吧。感谢您对小米的支持。', '0', '1441503142', '127.0.0.1', '0', '77', '0');
INSERT INTO `ecs_comment` VALUES ('81', '0', '84', '', 'admin', '张开的解决办法……把手机反过来壳子背面朝上放一晚上……一定可以', '0', '1441503300', '127.0.0.1', '0', '74', '0');
INSERT INTO `ecs_comment` VALUES ('82', '0', '38', 'ssssssss@ww.aa', '', '颜色好看，音质和简装版一样，有点小贵 ', '5', '1441558875', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('83', '0', '38', 'ssssssss@ww.aa', '', '耳机音效还不错？价格也合适，就是又加了邮费让人不爽 ', '4', '1441558902', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('84', '0', '38', 'ssssssss@ww.aa', '', '这个冰川蓝我非常喜欢！颜色很亮！感觉很清爽呢！像是夏天的海洋！音质棒棒的！来吧！打开DJ一起摇…！ ', '5', '1441558926', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('85', '0', '38', 'ssssssss@ww.aa', '', '东西不错，是正品，现在高仿小米的产品太多了，只有选择官网购买，一分钱一分货 ', '5', '1441558947', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('86', '0', '38', 'ssssssss@ww.aa', '', '收到实物后，看见耳机确实是蓝色的，有一点像小清新的天空蓝，颜色真好看，超喜欢的说≧◇≦ ', '5', '1441558983', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('87', '0', '38', 'ssssssss@ww.aa', '', '跟女神版超配的。颜值高。 ', '5', '1441559012', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('94', '0', '94', 'vip@ecshop.com', 'vip', '猫儿很可爱，女朋友戴上萌萌哒', '5', '1441672540', '127.0.0.1', '1', '0', '2');
INSERT INTO `ecs_comment` VALUES ('95', '0', '43', 'vip@ecshop.com', 'vip', '超级帅的自拍杆，还可以伸缩，方便携带', '5', '1441672605', '127.0.0.1', '1', '0', '2');
INSERT INTO `ecs_comment` VALUES ('96', '0', '90', 'vip@ecshop.com', 'vip', '米兔的眼神好呆', '5', '1441672652', '127.0.0.1', '1', '0', '2');
INSERT INTO `ecs_comment` VALUES ('97', '0', '39', 'vip@ecshop.com', 'vip', '方便实用', '5', '1441672682', '127.0.0.1', '1', '0', '2');
INSERT INTO `ecs_comment` VALUES ('98', '0', '93', 'vip@ecshop.com', 'vip', '刚买就掉地上了，但是质量很坚固，没有摔坏', '5', '1441672799', '127.0.0.1', '1', '0', '2');
INSERT INTO `ecs_comment` VALUES ('99', '0', '45', '123@qq.com', '', 'dddd', '5', '1441835647', '127.0.0.1', '1', '0', '0');
INSERT INTO `ecs_comment` VALUES ('100', '0', '45', 'admin1232444@qq.com', '', 'dsad', '5', '1441835756', '127.0.0.1', '1', '0', '0');

-- ----------------------------
-- Table structure for `ecs_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods`;
CREATE TABLE `ecs_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL auto_increment,
  `cat_id` smallint(5) unsigned NOT NULL default '0',
  `goods_sn` varchar(60) NOT NULL default '',
  `goods_name` varchar(120) NOT NULL default '',
  `goods_name_style` varchar(60) NOT NULL default '+',
  `click_count` int(10) unsigned NOT NULL default '0',
  `brand_id` smallint(5) unsigned NOT NULL default '0',
  `provider_name` varchar(100) NOT NULL default '',
  `goods_number` smallint(5) unsigned NOT NULL default '0',
  `goods_weight` decimal(10,3) unsigned NOT NULL default '0.000',
  `market_price` decimal(10,2) unsigned NOT NULL default '0.00',
  `shop_price` decimal(10,2) unsigned NOT NULL default '0.00',
  `promote_price` decimal(10,2) unsigned NOT NULL default '0.00',
  `promote_start_date` int(11) unsigned NOT NULL default '0',
  `promote_end_date` int(11) unsigned NOT NULL default '0',
  `warn_number` tinyint(3) unsigned NOT NULL default '1',
  `keywords` varchar(255) NOT NULL default '',
  `goods_brief` varchar(255) NOT NULL default '',
  `goods_desc` text NOT NULL,
  `goods_thumb` varchar(255) NOT NULL default '',
  `goods_img` varchar(255) NOT NULL default '',
  `original_img` varchar(255) NOT NULL default '',
  `is_real` tinyint(3) unsigned NOT NULL default '1',
  `extension_code` varchar(30) NOT NULL default '',
  `is_on_sale` tinyint(1) unsigned NOT NULL default '1',
  `is_alone_sale` tinyint(1) unsigned NOT NULL default '1',
  `is_shipping` tinyint(1) unsigned NOT NULL default '0',
  `integral` int(10) unsigned NOT NULL default '0',
  `add_time` int(10) unsigned NOT NULL default '0',
  `sort_order` smallint(4) unsigned NOT NULL default '100',
  `is_delete` tinyint(1) unsigned NOT NULL default '0',
  `is_best` tinyint(1) unsigned NOT NULL default '0',
  `is_new` tinyint(1) unsigned NOT NULL default '0',
  `is_hot` tinyint(1) unsigned NOT NULL default '0',
  `is_promote` tinyint(1) unsigned NOT NULL default '0',
  `bonus_type_id` tinyint(3) unsigned NOT NULL default '0',
  `last_update` int(10) unsigned NOT NULL default '0',
  `goods_type` smallint(5) unsigned NOT NULL default '0',
  `seller_note` varchar(255) NOT NULL default '',
  `give_integral` int(11) NOT NULL default '-1',
  `rank_integral` int(11) NOT NULL default '-1',
  `suppliers_id` smallint(5) unsigned default NULL,
  `is_check` tinyint(1) unsigned default NULL,
  `sales_volume` int(10) unsigned NOT NULL default '0',
  `comments_number` int(10) unsigned NOT NULL default '0',
  `packing_list` text NOT NULL,
  `customer_service` text NOT NULL,
  PRIMARY KEY  (`goods_id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_weight` (`goods_weight`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`),
  KEY `sales_volume` (`sales_volume`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods
-- ----------------------------
INSERT INTO `ecs_goods` VALUES ('46', '106', 'ECS000046', '小钢炮蓝牙音箱', '+', '152', '0', '', '9997', '0.000', '154.80', '129.00', '0.00', '0', '0', '1', '', '', '', 'images/201507/thumb_img/46_thumb_G_1437092278369.jpg', 'images/201507/goods_img/46_G_1437092278300.jpg', 'images/201507/source_img/46_G_1437092278839.jpg', '1', '', '1', '1', '0', '1', '1437092278', '4', '0', '0', '0', '1', '0', '0', '1439938394', '0', '', '-1', '-1', '0', null, '3', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('44', '95', 'ECS000044', '小米移动电源5000mAh', '+', '100', '0', '', '9999', '0.000', '58.80', '49.00', '0.00', '0', '0', '1', '', '', '', 'images/201507/thumb_img/44_thumb_G_1437092148601.jpg', 'images/201507/goods_img/44_G_1437092148551.jpg', 'images/201507/source_img/44_G_1437092148573.jpg', '1', '', '1', '1', '0', '0', '1437092148', '2', '0', '0', '0', '1', '0', '0', '1439313623', '0', '', '-1', '-1', '0', null, '1', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('45', '103', 'ECS000045', '小米活塞耳机标准版', '+', '135', '0', '', '10000', '0.000', '106.80', '89.00', '0.00', '0', '0', '1', '', '', '', 'images/201507/thumb_img/45_thumb_G_1437092199733.jpg', 'images/201507/goods_img/45_G_1437092199617.jpg', 'images/201507/source_img/45_G_1437092199141.jpg', '1', '', '1', '1', '0', '0', '1437092199', '3', '0', '1', '0', '1', '0', '0', '1439938396', '0', '', '-1', '-1', '0', null, '0', '3', '', '');
INSERT INTO `ecs_goods` VALUES ('27', '77', 'ECS000000', '小米电视2 40英寸', '+', '416', '0', '', '9999', '0.000', '2640.00', '2200.00', '1200.00', '1439884800', '1439971200', '1', '', '40/49/55英寸 现货购买', '<p><img width=\"720\" height=\"598\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/20150818160807.png\" /></p>\r\n<p><img width=\"720\" height=\"508\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/20150818160858.png\" /></p>\r\n<p><img width=\"720\" height=\"572\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/20150818160916.png\" /></p>\r\n<p><img src=\"/xiaomi2015273/images/upload/Image/er08150123.png\" width=\"1351\" height=\"762\" alt=\"\" /></p>\r\n<p><img src=\"/xiaomi2015273/images/upload/Image/ger908150140.png\" width=\"1138\" height=\"867\" alt=\"\" /></p>', 'images/201507/thumb_img/27_thumb_G_1437074702008.jpg', 'images/201507/goods_img/27_G_1437074702381.jpg', 'images/201507/source_img/27_G_1437074702064.jpg', '1', '', '1', '1', '0', '22', '1437074010', '1', '0', '1', '0', '1', '1', '0', '1441843861', '3', '', '-1', '-1', '0', null, '1', '6', '', '');
INSERT INTO `ecs_goods` VALUES ('28', '79', 'ECS000028', '小米平板 16G', '+', '86', '0', '', '9998', '0.000', '1558.00', '1299.00', '0.00', '0', '0', '1', '', '全球首款搭载 NVIDIA Tegra K1 处理器平板', '', 'images/201507/thumb_img/28_thumb_G_1437074792369.jpg', 'images/201507/goods_img/28_G_1437074792652.jpg', 'images/201507/source_img/28_G_1437074792489.jpg', '1', '', '1', '1', '0', '12', '1437074792', '2', '0', '0', '0', '1', '0', '0', '1439830263', '3', '', '-1', '-1', '0', null, '2', '1', '', '');
INSERT INTO `ecs_goods` VALUES ('29', '78', 'ECS000029', '小米盒子增强版 1G', '+', '15', '0', '', '9997', '0.000', '358.00', '299.00', '0.00', '0', '0', '1', '', '首款4K超高清网络机顶盒', '', 'images/201507/thumb_img/29_thumb_G_1437074933275.jpg', 'images/201507/goods_img/29_G_1437074933512.jpg', 'images/201507/source_img/29_G_1437074933166.jpg', '1', '', '1', '1', '0', '2', '1437074933', '3', '0', '0', '0', '1', '0', '0', '1441498116', '3', '', '-1', '-1', '0', null, '3', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('30', '102', 'ECS000030', '小米头戴式耳机', '+', '165', '0', '', '10000', '0.000', '598.00', '499.00', '0.00', '0', '0', '1', '', '50mm大尺寸航天金属振膜', '<p><img src=\"/xiaomi2015273/images/upload/Image/af71a35721.png\" width=\"1040\" height=\"813\" alt=\"\" /></p>\r\n<p><img src=\"/xiaomi2015273/images/upload/Image/agx0536.png\" alt=\"\" /></p>\r\n<p><img src=\"/xiaomi2015273/images/upload/Image/he08110501.png\" width=\"913\" height=\"779\" alt=\"\" /></p>\r\n<p><img src=\"/xiaomi2015273/images/upload/Image/mhyte110940.png\" width=\"854\" height=\"836\" alt=\"\" /></p>', 'images/201507/thumb_img/30_thumb_G_1437075007558.jpg', 'images/201507/goods_img/30_G_1437075007745.jpg', 'images/201507/source_img/30_G_1437075007203.jpg', '1', '', '1', '1', '0', '4', '1437075007', '10000', '0', '1', '1', '1', '0', '0', '1441672328', '4', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('31', '95', 'ECS000031', '小米移动电源10000mAh', '+', '64', '0', '', '10000', '0.000', '94.00', '79.00', '0.00', '0', '0', '1', '', '松下/LG高密度进口电芯', '', 'images/201507/thumb_img/31_thumb_G_1437075539254.jpg', 'images/201507/goods_img/31_G_1437075539651.jpg', 'images/201507/source_img/31_G_1437075539605.jpg', '1', '', '1', '1', '0', '0', '1437075539', '5', '0', '1', '0', '0', '0', '0', '1439171255', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('32', '82', 'ECS000032', '小米路由器 mini', '+', '36', '0', '', '10000', '0.000', '154.00', '129.00', '0.00', '0', '0', '1', '', '主流双频AC智能路由器，性价比之王', '', 'images/201507/thumb_img/32_thumb_G_1437075765802.jpg', 'images/201507/goods_img/32_G_1437075765689.jpg', 'images/201507/source_img/32_G_1437075765600.jpg', '1', '', '1', '1', '0', '1', '1437075765', '6', '0', '1', '0', '1', '0', '0', '1439313614', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('33', '86', 'ECS000033', '小蚁智能摄像机 标准', '+', '4', '0', '', '9998', '0.000', '154.80', '129.00', '0.00', '0', '0', '1', '', '能看能听能说，手机远程观看', '', 'images/201507/thumb_img/33_thumb_G_1437075865379.jpg', 'images/201507/goods_img/33_G_1437075865949.jpg', 'images/201507/source_img/33_G_1437075865463.jpg', '1', '', '1', '1', '0', '1', '1437075865', '7', '0', '1', '0', '1', '0', '0', '1439313614', '0', '', '-1', '-1', '0', null, '2', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('34', '85', 'ECS000034', '小蚁运动相机', '+', '6', '0', '', '10000', '0.000', '478.00', '399.00', '0.00', '0', '0', '1', '', '边玩边录边拍，手机随时分享', '', 'images/201507/thumb_img/34_thumb_G_1437076036973.jpg', 'images/201507/goods_img/34_G_1437076036835.jpg', 'images/201507/source_img/34_G_1437076036893.jpg', '1', '', '1', '1', '0', '3', '1437076036', '8', '0', '1', '0', '1', '0', '0', '1439313615', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('35', '84', 'ECS000035', '小米空气净化器', '+', '4', '0', '', '10000', '0.000', '1078.80', '899.00', '0.00', '0', '0', '1', '', '', '', 'images/201507/thumb_img/35_thumb_G_1437081702649.jpg', 'images/201507/goods_img/35_G_1437081702302.jpg', 'images/201507/source_img/35_G_1437081702860.jpg', '1', '', '1', '1', '0', '8', '1437081702', '1', '0', '0', '1', '1', '0', '0', '1439313797', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('36', '87', 'ECS000036', 'iHealth智能血压计', '+', '0', '0', '', '10000', '0.000', '238.00', '199.00', '0.00', '0', '0', '1', '', '', '', 'images/201507/thumb_img/36_thumb_G_1437082145888.jpg', 'images/201507/goods_img/36_G_1437082145677.jpg', 'images/201507/source_img/36_G_1437082145811.jpg', '1', '', '1', '1', '0', '1', '1437082145', '2', '0', '0', '1', '0', '0', '0', '1439313706', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('37', '88', 'ECS000037', '小米智能插座', '+', '2', '0', '', '10000', '0.000', '94.00', '79.00', '0.00', '0', '0', '1', '', '', '', 'images/201507/thumb_img/37_thumb_G_1437082214575.jpg', 'images/201507/goods_img/37_G_1437082214887.jpg', 'images/201507/source_img/37_G_1437082214044.jpg', '1', '', '1', '1', '0', '0', '1437082214', '3', '0', '0', '1', '0', '0', '0', '1439313617', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('38', '103', 'ECS000038', '小米活塞耳机 炫彩版', '+', '85', '0', '', '9998', '0.000', '46.80', '39.00', '0.00', '0', '0', '1', '', '适合出街的耳机', '<p><img width=\"1226\" height=\"691\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/xhsejxcb_01x.jpg\" /></p>\r\n<p><img width=\"1226\" height=\"692\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/xhsejxcb_05.jpg\" /></p>\r\n<p><img width=\"1226\" height=\"692\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/xhsejxcb_11.jpg\" /></p>\r\n<p><img width=\"1226\" height=\"692\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/xhsejxcb_13.jpg\" /></p>\r\n<p><img width=\"1226\" height=\"692\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/xhsejxcb_23.jpg\" /></p>\r\n<p><img width=\"1226\" height=\"692\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/xhsejxcb_37.jpg\" /></p>', 'images/201507/thumb_img/38_thumb_G_1437082667838.jpg', 'images/201507/goods_img/38_G_1437082667243.jpg', 'images/201507/source_img/38_G_1437082667365.jpg', '1', '', '1', '1', '0', '0', '1437082667', '1', '0', '0', '1', '1', '0', '0', '1442180645', '4', '', '-1', '-1', '0', null, '2', '7', '', '');
INSERT INTO `ecs_goods` VALUES ('39', '123', 'ECS000039', '小米水质TDS检测笔', '+', '9', '0', '', '10000', '0.000', '46.80', '39.00', '0.00', '0', '0', '1', '', '', '', 'images/201507/thumb_img/39_thumb_G_1437082747983.jpg', 'images/201507/goods_img/39_G_1437082747038.jpg', 'images/201507/source_img/39_G_1437082747160.jpg', '1', '', '1', '1', '0', '0', '1437082747', '5', '0', '0', '1', '1', '0', '0', '1439313619', '0', '', '-1', '-1', '0', null, '0', '3', '', '');
INSERT INTO `ecs_goods` VALUES ('40', '90', 'ECS000040', '小米体重秤', '+', '8', '0', '', '9999', '0.000', '118.00', '99.00', '0.00', '0', '0', '1', '', '', '', 'images/201507/thumb_img/40_thumb_G_1437082798686.jpg', 'images/201507/goods_img/40_G_1437082798286.jpg', 'images/201507/source_img/40_G_1437082798429.jpg', '1', '', '1', '1', '0', '0', '1437082798', '6', '0', '1', '1', '1', '0', '0', '1439313620', '0', '', '-1', '-1', '0', null, '1', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('41', '95', 'ECS000041', '小米移动电源16000mAh', '+', '3', '0', '', '10000', '0.000', '129.00', '109.00', '0.00', '0', '0', '1', '', '', '', 'images/201507/thumb_img/41_thumb_G_1437082849514.jpg', 'images/201507/goods_img/41_G_1437082849066.jpg', 'images/201507/source_img/41_G_1437082849886.jpg', '1', '', '1', '1', '0', '1', '1437082849', '7', '0', '1', '1', '0', '0', '0', '1439313620', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('42', '93', 'ECS000042', '小米蓝牙手柄', '+', '48', '0', '', '9999', '0.000', '118.00', '99.00', '0.00', '0', '0', '1', '', '', '', 'images/201507/thumb_img/42_thumb_G_1437082936092.jpg', 'images/201507/goods_img/42_G_1437082936414.jpg', 'images/201507/source_img/42_G_1437082936458.jpg', '1', '', '1', '1', '0', '0', '1437082936', '8', '0', '1', '1', '0', '0', '0', '1439313622', '0', '', '-1', '-1', '0', null, '1', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('43', '123', 'ECS000043', '小蚁蓝牙自拍杆', '+', '6', '0', '', '9998', '0.000', '154.80', '129.00', '0.00', '0', '0', '1', '', '', '', 'images/201507/thumb_img/43_thumb_G_1437091900155.jpg', 'images/201507/goods_img/43_G_1437091900518.jpg', 'images/201507/source_img/43_G_1437091900408.jpg', '1', '', '1', '1', '0', '1', '1437091900', '1', '0', '0', '0', '1', '0', '0', '1439313622', '0', '', '-1', '-1', '0', null, '2', '1', '', '');
INSERT INTO `ecs_goods` VALUES ('47', '107', 'ECS000047', '米兔手机U盘升级版', '+', '58', '0', '', '10000', '0.000', '59.87', '49.90', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/47_thumb_G_1439331077002.jpg', 'images/201508/goods_img/47_G_1439331077204.jpg', 'images/201508/source_img/47_G_1439331077155.jpg', '1', '', '1', '1', '0', '0', '1439331077', '100', '0', '0', '0', '0', '0', '0', '1439938394', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('53', '124', 'ECS000053', '小米电视2S48英寸', '+', '2', '62', '', '10000', '0.000', '3598.79', '2999.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/53_thumb_G_1439511514539.jpg', 'images/201508/goods_img/53_G_1439511514043.jpg', 'images/201508/source_img/53_G_1439511514552.jpg', '1', '', '1', '1', '0', '29', '1439511514', '100', '0', '0', '0', '1', '0', '0', '1441498131', '3', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('54', '76', 'ECS000054', '小米电视2 55英寸', '+', '5', '54', '', '10000', '0.000', '5398.80', '4499.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/54_thumb_G_1439511600535.jpg', 'images/201508/goods_img/54_G_1439511600015.jpg', 'images/201508/source_img/54_G_1439511600707.jpg', '1', '', '1', '1', '0', '44', '1439511600', '100', '0', '0', '0', '1', '0', '0', '1441498095', '3', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('55', '76', 'ECS000055', '小米平板 64GB', '+', '27', '0', '', '10000', '0.000', '1798.80', '1499.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/55_thumb_G_1439511725721.jpg', 'images/201508/goods_img/55_G_1439511725534.jpg', 'images/201508/source_img/55_G_1439511725197.jpg', '1', '', '1', '1', '0', '14', '1439511725', '100', '0', '0', '0', '1', '0', '0', '1441498056', '3', '', '-1', '-1', '0', null, '0', '12', '', '');
INSERT INTO `ecs_goods` VALUES ('77', '125', 'ECS000077', '小米电视/盒子遥控器', '+', '2', '0', '', '10000', '0.000', '34.80', '29.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/77_thumb_G_1440984390480.jpg', 'images/201508/goods_img/77_G_1440984390774.jpg', 'images/201508/source_img/77_G_1440984390578.png', '1', '', '1', '1', '0', '0', '1440984390', '100', '0', '0', '0', '1', '0', '0', '1441052227', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('78', '73', 'ECS000078', '红米Note2', '+', '1', '0', '', '10000', '0.000', '958.80', '799.00', '0.00', '0', '0', '1', '', '千元旗舰，青春优选', '', 'images/201509/thumb_img/78_thumb_G_1441050387337.jpg', 'images/201509/goods_img/78_G_1441050387752.jpg', 'images/201509/source_img/78_G_1441050387167.png', '1', '', '1', '1', '0', '7', '1441050387', '100', '0', '0', '0', '0', '0', '0', '1441050387', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('56', '71', 'ECS000056', '小米手机4', '+', '13', '0', '', '10000', '0.000', '1798.80', '1499.00', '0.00', '0', '0', '1', '', '', '<p><img src=\"/xiaomi2015273/images/upload/Image/1235.png\" width=\"1015\" height=\"941\" alt=\"\" /></p>', 'images/201508/thumb_img/56_thumb_G_1440717641715.jpg', 'images/201508/goods_img/56_G_1440717641435.jpg', 'images/201508/source_img/56_G_1440717640337.png', '1', '', '1', '1', '0', '14', '1440717640', '100', '0', '0', '0', '0', '0', '0', '1440717776', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('57', '109', 'ECS000057', '清水软胶保护套', '+', '10', '0', '', '10000', '0.000', '5.88', '4.90', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/57_thumb_G_1440717888680.jpg', 'images/201508/goods_img/57_G_1440717888357.jpg', 'images/201508/source_img/57_G_1440717888107.jpg', '1', '', '1', '1', '0', '0', '1440717888', '100', '0', '0', '0', '0', '0', '0', '1440717953', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('58', '114', 'ECS000058', '实木后盖', '+', '8', '0', '', '9999', '0.000', '82.80', '69.00', '0.00', '0', '0', '1', '', '', '<p><img width=\"1240\" height=\"700\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/manguzhutoutu.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><img width=\"1240\" height=\"700\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/manguzhu_03.jpg\" /></p>', 'images/201508/thumb_img/58_thumb_G_1440725448948.jpg', 'images/201508/goods_img/58_G_1440725448654.jpg', 'images/201508/source_img/58_G_1440725448687.jpg', '1', '', '1', '1', '0', '0', '1440725448', '100', '0', '0', '0', '0', '0', '0', '1440725512', '0', '', '-1', '-1', '0', null, '1', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('59', '106', 'ECS000059', '小米方盒子蓝牙音箱', '+', '1', '0', '', '10000', '0.000', '118.80', '99.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/59_thumb_G_1440983020324.jpg', 'images/201508/goods_img/59_G_1440983020503.jpg', 'images/201508/source_img/59_G_1440983020268.jpg', '1', '', '1', '1', '0', '0', '1440983020', '100', '0', '0', '0', '1', '0', '0', '1440983126', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('60', '106', 'ECS000060', '先锋APS-BA202蓝牙音箱', '+', '3', '0', '', '10000', '0.000', '274.80', '229.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/60_thumb_G_1440983103483.jpg', 'images/201508/goods_img/60_G_1440983103289.jpg', 'images/201508/source_img/60_G_1440983103358.jpg', '1', '', '1', '1', '0', '2', '1440983049', '100', '0', '0', '0', '1', '0', '0', '1440983125', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('61', '106', 'ECS000061', 'Jam Blast蓝牙音箱', '+', '0', '0', '', '10000', '0.000', '358.80', '299.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/61_thumb_G_1440983075965.jpg', 'images/201508/goods_img/61_G_1440983075775.jpg', 'images/201508/source_img/61_G_1440983075461.jpg', '1', '', '1', '1', '0', '2', '1440983075', '100', '0', '0', '0', '1', '0', '0', '1440983124', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('62', '105', 'ECS000062', '1MORE金澈耳机', '+', '2', '0', '', '10000', '0.000', '118.80', '99.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/62_thumb_G_1440983163158.jpg', 'images/201508/goods_img/62_G_1440983163401.jpg', 'images/201508/source_img/62_G_1440983163343.jpg', '1', '', '1', '1', '0', '0', '1440983163', '100', '0', '0', '0', '0', '0', '0', '1440983163', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('63', '105', 'ECS000063', 'Skullcandy Jib耳机', '+', '0', '0', '', '10000', '0.000', '118.80', '99.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/63_thumb_G_1440983188625.jpg', 'images/201508/goods_img/63_G_1440983188968.jpg', 'images/201508/source_img/63_G_1440983188774.jpg', '1', '', '1', '1', '0', '0', '1440983188', '100', '0', '0', '0', '0', '0', '0', '1440983188', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('64', '105', 'ECS000064', '魔声Beats Studio HD 2.0耳机', '+', '7', '0', '', '10000', '0.000', '3238.79', '2699.00', '0.00', '0', '0', '1', '', '适用于 小米平板, 所有小米手机', '', 'images/201508/thumb_img/64_thumb_G_1440983246324.jpg', 'images/201508/goods_img/64_G_1440983246833.jpg', 'images/201508/source_img/64_G_1440983246755.jpg', '1', '', '1', '1', '0', '26', '1440983246', '100', '0', '0', '0', '1', '0', '0', '1440983246', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('65', '81', 'ECS000065', '全新小米路由器', '+', '0', '0', '', '10000', '0.000', '838.80', '699.00', '0.00', '0', '0', '1', '', '顶配企业级性能，最高内置6TB监控级硬盘', '', 'images/201508/thumb_img/65_thumb_G_1440983430401.jpg', 'images/201508/goods_img/65_G_1440983430591.jpg', 'images/201508/source_img/65_G_1440983430781.png', '1', '', '1', '1', '0', '6', '1440983430', '100', '0', '0', '0', '1', '0', '0', '1440983551', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('66', '92', 'ECS000066', '小米随身WiFi U盘版本', '+', '0', '0', '', '10000', '0.000', '59.87', '49.90', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/66_thumb_G_1440983490045.jpg', 'images/201508/goods_img/66_G_1440983490432.jpg', 'images/201508/source_img/66_G_1440983490982.png', '1', '', '1', '1', '0', '0', '1440983490', '100', '0', '0', '0', '1', '0', '0', '1440983551', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('67', '83', 'ECS000067', '小米手环', '+', '7', '0', '', '10000', '0.000', '82.80', '69.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/67_thumb_G_1440983638116.jpg', 'images/201508/goods_img/67_G_1440983638287.jpg', 'images/201508/source_img/67_G_1440983638037.png', '1', '', '1', '1', '0', '0', '1440983638', '100', '0', '0', '0', '1', '0', '0', '1440983646', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('68', '100', 'ECS000068', '多彩便携USB线20CM', '+', '0', '0', '', '10000', '0.000', '22.80', '19.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/68_thumb_G_1440983695997.jpg', 'images/201508/goods_img/68_G_1440983695646.jpg', 'images/201508/source_img/68_G_1440983695262.jpg', '1', '', '1', '1', '0', '0', '1440983695', '100', '0', '0', '0', '1', '0', '0', '1440983756', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('69', '100', 'ECS000069', '小米千兆网线', '+', '1', '0', '', '10000', '0.000', '17.88', '14.90', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/69_thumb_G_1440983751530.jpg', 'images/201508/goods_img/69_G_1440983751111.jpg', 'images/201508/source_img/69_G_1440983751678.jpg', '1', '', '1', '1', '0', '0', '1440983751', '100', '0', '0', '0', '1', '0', '0', '1440983756', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('70', '98', 'ECS000070', '红米2/2A原装电池', '+', '0', '0', '', '10000', '0.000', '58.80', '49.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/70_thumb_G_1440983810214.jpg', 'images/201508/goods_img/70_G_1440983810229.jpg', 'images/201508/source_img/70_G_1440983810482.jpg', '1', '', '1', '1', '0', '0', '1440983810', '100', '0', '0', '0', '0', '0', '0', '1440983810', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('71', '98', 'ECS000071', '红米Note电池', '+', '1', '0', '', '10000', '0.000', '58.80', '49.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/71_thumb_G_1440983839269.jpg', 'images/201508/goods_img/71_G_1440983839789.jpg', 'images/201508/source_img/71_G_1440983839316.jpg', '1', '', '1', '1', '0', '0', '1440983839', '100', '0', '0', '0', '1', '0', '0', '1440983965', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('72', '98', 'ECS000072', '红米note 2原装电池', '+', '0', '0', '', '10000', '0.000', '58.80', '49.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/72_thumb_G_1440983887661.jpg', 'images/201508/goods_img/72_G_1440983887203.jpg', 'images/201508/source_img/72_G_1440983887349.jpg', '1', '', '1', '1', '0', '0', '1440983887', '100', '0', '0', '0', '1', '0', '0', '1440983962', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('73', '97', 'ECS000073', '刀锋移动电源', '+', '1', '0', '', '10000', '0.000', '358.80', '299.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/73_thumb_G_1440983937959.jpg', 'images/201508/goods_img/73_G_1440983937768.jpg', 'images/201508/source_img/73_G_1440983937124.jpg', '1', '', '1', '1', '0', '2', '1440983937', '100', '0', '0', '0', '1', '0', '0', '1440983962', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('74', '97', 'ECS000074', '萨摩小狗移动电源', '+', '7', '0', '', '10000', '0.000', '153.60', '128.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/74_thumb_G_1440983959230.jpg', 'images/201508/goods_img/74_G_1440983959272.jpg', 'images/201508/source_img/74_G_1440983959160.jpg', '1', '', '1', '1', '0', '1', '1440983959', '100', '0', '0', '0', '1', '0', '0', '1440983961', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('75', '97', 'ECS000075', '多彩电源适配器', '+', '0', '0', '', '10000', '0.000', '23.88', '19.90', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/75_thumb_G_1440984011595.jpg', 'images/201508/goods_img/75_G_1440984011527.jpg', 'images/201508/source_img/75_G_1440984011675.jpg', '1', '', '1', '1', '0', '0', '1440984011', '100', '0', '0', '0', '1', '0', '0', '1440984016', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('76', '126', 'ECS000076', '小米盒子mini版', '+', '2', '0', '', '9999', '0.000', '238.79', '199.00', '0.00', '0', '0', '1', '', '', '', 'images/201508/thumb_img/76_thumb_G_1440984280864.jpg', 'images/201508/goods_img/76_G_1440984280941.jpg', 'images/201508/source_img/76_G_1440984280163.png', '1', '', '1', '1', '0', '1', '1440984280', '100', '0', '0', '0', '1', '0', '0', '1441052219', '0', '', '-1', '-1', '0', null, '1', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('79', '74', 'ECS000079', '小米Note顶配版 合约机', '+', '1', '0', '', '10000', '0.000', '3598.79', '2999.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/79_thumb_G_1441050485953.jpg', 'images/201509/goods_img/79_G_1441050485186.jpg', 'images/201509/source_img/79_G_1441050485988.png', '1', '', '1', '1', '0', '29', '1441050485', '100', '0', '0', '0', '0', '0', '0', '1441050485', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('80', '70', 'ECS000080', '小米NOTE', '+', '2', '0', '', '10000', '0.000', '2638.79', '2199.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/80_thumb_G_1441050558701.jpg', 'images/201509/goods_img/80_G_1441050558071.jpg', 'images/201509/source_img/80_G_1441050558342.png', '1', '', '1', '1', '0', '21', '1441050558', '100', '0', '0', '0', '0', '0', '0', '1441050558', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('81', '72', 'ECS000081', '红米手机2', '+', '1', '0', '', '10000', '0.000', '718.80', '599.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/81_thumb_G_1441050609661.jpg', 'images/201509/goods_img/81_G_1441050609705.jpg', 'images/201509/source_img/81_G_1441050609492.png', '1', '', '1', '1', '0', '5', '1441050609', '100', '0', '0', '0', '0', '0', '0', '1441050609', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('82', '75', 'ECS000082', '红米手机2A', '+', '1', '0', '', '10000', '0.000', '1078.80', '899.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/82_thumb_G_1441050801926.jpg', 'images/201509/goods_img/82_G_1441050801693.jpg', 'images/201509/source_img/82_G_1441050801052.jpg', '1', '', '1', '1', '0', '8', '1441050801', '100', '0', '0', '0', '0', '0', '0', '1441050801', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('83', '104', 'ECS000083', '小米蓝牙耳机', '+', '2', '62', '', '10000', '0.000', '94.80', '79.00', '0.00', '0', '0', '1', '', '6.5克轻巧，蓝牙4.1高清通话音质', '', 'images/201509/thumb_img/83_thumb_G_1441052403875.jpg', 'images/201509/goods_img/83_G_1441052403275.jpg', 'images/201509/source_img/83_G_1441052403717.png', '1', '', '1', '1', '0', '0', '1441052403', '100', '0', '0', '0', '0', '0', '0', '1441052403', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('84', '127', 'ECS000084', '插卡式翻盖保护套', '+', '11', '0', '', '10000', '0.000', '34.80', '29.00', '0.00', '0', '0', '1', '', '', '<p><img width=\"720\" height=\"530\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/hminote_01.jpg\" /></p>\r\n<p><img width=\"720\" height=\"140\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/hminote_04.jpg\" /></p>\r\n<p><img width=\"720\" height=\"530\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/hminote_05.jpg\" /></p>\r\n<p><img width=\"720\" height=\"130\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/hominote_06.jpg\" /></p>\r\n<p><img width=\"720\" height=\"530\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/shou.jpg\" /></p>\r\n<p><img width=\"720\" height=\"530\" alt=\"\" src=\"/xiaomi2015273/images/upload/Image/hminote_11.jpg\" /></p>', 'images/201509/thumb_img/84_thumb_G_1441056023645.jpg', 'images/201509/goods_img/84_G_1441056023990.jpg', 'images/201509/source_img/84_G_1441056023964.jpg', '1', '', '1', '1', '0', '0', '1441056023', '100', '0', '0', '0', '0', '0', '0', '1441502831', '0', '', '-1', '-1', '0', null, '0', '5', '', '');
INSERT INTO `ecs_goods` VALUES ('85', '128', 'ECS000085', '清水软胶保护套', '+', '3', '0', '', '10000', '0.000', '5.88', '4.90', '0.00', '0', '0', '1', '', '适用于 红米1S/红米', '', 'images/201509/thumb_img/85_thumb_G_1441056112107.jpg', 'images/201509/goods_img/85_G_1441056112082.jpg', 'images/201509/source_img/85_G_1441056112054.jpg', '1', '', '1', '1', '0', '0', '1441056112', '100', '0', '0', '0', '0', '0', '0', '1441056112', '0', '', '-1', '-1', '0', null, '0', '1', '', '');
INSERT INTO `ecs_goods` VALUES ('86', '111', 'ECS000086', '安卓防尘塞', '+', '0', '0', '', '10000', '0.000', '7.08', '5.90', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/86_thumb_G_1441056239670.jpg', 'images/201509/goods_img/86_G_1441056239202.jpg', 'images/201509/source_img/86_G_1441056239893.jpg', '1', '', '1', '1', '0', '0', '1441056239', '100', '0', '0', '0', '0', '0', '0', '1441056239', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('87', '110', 'ECS000087', '普通高透贴膜(单片装)', '+', '1', '0', '', '10000', '0.000', '11.88', '9.90', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/87_thumb_G_1441056303542.jpg', 'images/201509/goods_img/87_G_1441056303571.jpg', 'images/201509/source_img/87_G_1441056303890.jpg', '1', '', '1', '1', '0', '0', '1441056303', '100', '0', '0', '0', '0', '0', '0', '1441056303', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('88', '129', 'ECS000088', '米兔主题3D保护壳', '+', '67', '0', '', '10000', '0.000', '46.80', '39.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/88_thumb_G_1441056484072.jpg', 'images/201509/goods_img/88_G_1441056484238.jpg', 'images/201509/source_img/88_G_1441056484508.jpg', '1', '', '1', '1', '0', '0', '1441056484', '100', '0', '0', '0', '0', '0', '0', '1441056484', '0', '', '-1', '-1', '0', null, '0', '1', '', '');
INSERT INTO `ecs_goods` VALUES ('89', '119', 'ECS000089', '纯色开衫卫衣 女款', '+', '2', '0', '', '10000', '0.000', '154.79', '129.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/89_thumb_G_1441056597778.jpg', 'images/201509/goods_img/89_G_1441056597264.jpg', 'images/201509/source_img/89_G_1441056597372.jpg', '1', '', '1', '1', '0', '1', '1441056597', '100', '0', '0', '0', '1', '0', '0', '1441493401', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('90', '120', 'ECS000090', '企鹅版米兔', '+', '2', '0', '', '10000', '0.000', '58.80', '49.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/90_thumb_G_1441056659073.jpg', 'images/201509/goods_img/90_G_1441056659397.jpg', 'images/201509/source_img/90_G_1441056659816.jpg', '1', '', '1', '1', '0', '0', '1441056659', '100', '0', '0', '0', '1', '0', '0', '1441493400', '0', '', '-1', '-1', '0', null, '0', '1', '', '');
INSERT INTO `ecs_goods` VALUES ('91', '121', 'ECS000091', '简约多功能双肩包', '+', '0', '0', '', '10000', '0.000', '118.80', '99.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/91_thumb_G_1441056702928.jpg', 'images/201509/goods_img/91_G_1441056702794.jpg', 'images/201509/source_img/91_G_1441056702721.jpg', '1', '', '1', '1', '0', '0', '1441056702', '100', '0', '0', '0', '1', '0', '0', '1441493400', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('92', '122', 'ECS000092', '小米鼠标垫', '+', '0', '0', '', '10000', '0.000', '5.88', '4.90', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/92_thumb_G_1441056728120.jpg', 'images/201509/goods_img/92_G_1441056728244.jpg', 'images/201509/source_img/92_G_1441056728619.jpg', '1', '', '1', '1', '0', '0', '1441056728', '100', '0', '0', '0', '1', '0', '0', '1441493399', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('93', '123', 'ECS000093', '小米百变随身杯', '+', '3', '0', '', '10000', '0.000', '46.80', '39.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/93_thumb_G_1441056767939.jpg', 'images/201509/goods_img/93_G_1441056767774.jpg', 'images/201509/source_img/93_G_1441056767621.jpg', '1', '', '1', '1', '0', '0', '1441056767', '100', '0', '0', '0', '1', '0', '0', '1441493398', '0', '', '-1', '-1', '0', null, '0', '1', '', '');
INSERT INTO `ecs_goods` VALUES ('94', '130', 'ECS000094', '猫的秘密', '+', '7', '0', '', '10000', '0.000', '238.79', '199.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/94_thumb_G_1441056891849.jpg', 'images/201509/goods_img/94_G_1441056891405.jpg', 'images/201509/source_img/94_G_1441056891886.jpg', '1', '', '1', '1', '0', '1', '1441056891', '1', '0', '0', '0', '1', '0', '0', '1441759636', '0', '', '-1', '-1', '0', null, '0', '1', '', '');
INSERT INTO `ecs_goods` VALUES ('95', '105', 'ECS000095', '先锋SE-MJ512折叠式头戴耳机', '+', '0', '0', '', '10000', '0.000', '201.60', '168.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/95_thumb_G_1441738494824.jpg', 'images/201509/goods_img/95_G_1441738494127.jpg', 'images/201509/source_img/95_G_1441738494837.png', '1', '', '1', '1', '0', '1', '1441738494', '100', '0', '0', '0', '0', '0', '0', '1441738494', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('96', '104', 'ECS000096', 'QCY派Q8蓝牙耳机', '+', '0', '0', '', '10000', '0.000', '71.88', '59.90', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/96_thumb_G_1441738537157.jpg', 'images/201509/goods_img/96_G_1441738537224.jpg', 'images/201509/source_img/96_G_1441738537599.png', '1', '', '1', '1', '0', '0', '1441738537', '100', '0', '0', '0', '0', '0', '0', '1441738537', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('97', '105', 'ECS000097', '先锋CL31系列入耳式耳机', '+', '0', '0', '', '10000', '0.000', '118.80', '99.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/97_thumb_G_1441738581513.jpg', 'images/201509/goods_img/97_G_1441738581436.jpg', 'images/201509/source_img/97_G_1441738581597.png', '1', '', '1', '1', '0', '0', '1441738581', '100', '0', '0', '0', '0', '0', '0', '1441738581', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('98', '105', 'ECS000098', '铁三角J100耳机', '+', '0', '0', '', '10000', '0.000', '94.80', '79.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/98_thumb_G_1441738620606.jpg', 'images/201509/goods_img/98_G_1441738620612.jpg', 'images/201509/source_img/98_G_1441738620612.png', '1', '', '1', '1', '0', '0', '1441738620', '100', '0', '1', '0', '0', '0', '0', '1441754973', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('99', '105', 'ECS000099', '捷波朗EASY–CALL蓝牙耳机', '+', '0', '0', '', '10000', '0.000', '214.79', '179.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/99_thumb_G_1441738667754.jpg', 'images/201509/goods_img/99_G_1441738667970.jpg', 'images/201509/source_img/99_G_1441738667868.png', '1', '', '1', '1', '0', '1', '1441738667', '100', '0', '0', '0', '0', '0', '0', '1441738667', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('100', '105', 'ECS000100', '铁三角CLR100耳机', '+', '1', '0', '', '10000', '0.000', '213.60', '178.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/100_thumb_G_1441738698084.jpg', 'images/201509/goods_img/100_G_1441738698092.jpg', 'images/201509/source_img/100_G_1441738698062.png', '1', '', '1', '1', '0', '1', '1441738698', '100', '0', '0', '0', '0', '0', '0', '1441738698', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('101', '105', 'ECS000101', '中锘基B97S运动蓝牙耳机', '+', '0', '0', '', '10000', '0.000', '142.79', '119.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/101_thumb_G_1441738730692.jpg', 'images/201509/goods_img/101_G_1441738730248.jpg', 'images/201509/source_img/101_G_1441738730067.png', '1', '', '1', '1', '0', '1', '1441738730', '100', '0', '0', '0', '1', '0', '0', '1441758533', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('102', '105', 'ECS000102', 'QCY 杰克J02蓝牙耳机', '+', '2', '0', '', '10000', '0.000', '116.28', '96.90', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/102_thumb_G_1441738765271.jpg', 'images/201509/goods_img/102_G_1441738765970.jpg', 'images/201509/source_img/102_G_1441738765409.png', '1', '', '1', '1', '0', '0', '1441738765', '100', '0', '0', '0', '1', '0', '0', '1441758532', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('103', '105', 'ECS000103', '铁三角COR150入耳式耳机', '+', '0', '0', '', '10000', '0.000', '166.79', '139.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/103_thumb_G_1441738795942.jpg', 'images/201509/goods_img/103_G_1441738795866.jpg', 'images/201509/source_img/103_G_1441738794688.png', '1', '', '1', '1', '0', '1', '1441738794', '100', '0', '0', '0', '0', '0', '0', '1441738794', '0', '', '-1', '-1', '0', null, '0', '0', '', '');
INSERT INTO `ecs_goods` VALUES ('104', '91', 'ECS000104', 'Yeelight床头灯', '+', '2', '0', '', '10000', '0.000', '298.80', '249.00', '0.00', '0', '0', '1', '', '', '', 'images/201509/thumb_img/104_thumb_G_1441747447591.jpg', 'images/201509/goods_img/104_G_1441747447738.jpg', 'images/201509/source_img/104_G_1441747447471.png', '1', '', '1', '1', '0', '2', '1441747447', '100', '0', '1', '0', '1', '0', '0', '1441759567', '0', '', '-1', '-1', '0', null, '0', '0', '', '');

-- ----------------------------
-- Table structure for `ecs_goods_attr`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods_attr`;
CREATE TABLE `ecs_goods_attr` (
  `goods_attr_id` int(10) unsigned NOT NULL auto_increment,
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `attr_id` smallint(5) unsigned NOT NULL default '0',
  `attr_value` text NOT NULL,
  `attr_price` varchar(255) NOT NULL default '',
  `img_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`goods_attr_id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods_attr
-- ----------------------------
INSERT INTO `ecs_goods_attr` VALUES ('36', '28', '11', '灰', '', '35');
INSERT INTO `ecs_goods_attr` VALUES ('35', '28', '10', '45', '', '0');
INSERT INTO `ecs_goods_attr` VALUES ('34', '29', '11', '黑', '', '36');
INSERT INTO `ecs_goods_attr` VALUES ('33', '29', '10', '15', '', '0');
INSERT INTO `ecs_goods_attr` VALUES ('37', '27', '10', '45', '', '0');
INSERT INTO `ecs_goods_attr` VALUES ('38', '27', '11', '黄', '100', '34');
INSERT INTO `ecs_goods_attr` VALUES ('91', '38', '12', '樱花粉', '30', '121');
INSERT INTO `ecs_goods_attr` VALUES ('90', '38', '12', '冰川蓝', '20', '120');
INSERT INTO `ecs_goods_attr` VALUES ('87', '30', '12', '红', '0', '0');
INSERT INTO `ecs_goods_attr` VALUES ('86', '30', '12', '蓝', '0', '0');
INSERT INTO `ecs_goods_attr` VALUES ('85', '30', '12', '白', '0', '0');
INSERT INTO `ecs_goods_attr` VALUES ('66', '53', '10', '45', '', '0');
INSERT INTO `ecs_goods_attr` VALUES ('67', '53', '11', '黑', '', '55');
INSERT INTO `ecs_goods_attr` VALUES ('68', '54', '10', '58', '', '0');
INSERT INTO `ecs_goods_attr` VALUES ('69', '54', '11', '黄', '', '56');
INSERT INTO `ecs_goods_attr` VALUES ('70', '55', '10', '15', '', '0');
INSERT INTO `ecs_goods_attr` VALUES ('71', '55', '11', '蓝', '', '57');
INSERT INTO `ecs_goods_attr` VALUES ('72', '55', '11', '黄', '', '103');
INSERT INTO `ecs_goods_attr` VALUES ('73', '55', '11', '黑', '', '104');
INSERT INTO `ecs_goods_attr` VALUES ('74', '55', '11', '白', '', '106');
INSERT INTO `ecs_goods_attr` VALUES ('89', '38', '12', '丁香紫', '10', '122');
INSERT INTO `ecs_goods_attr` VALUES ('82', '27', '11', '红', '300', '58');
INSERT INTO `ecs_goods_attr` VALUES ('81', '27', '11', '黑白', '200', '60');
INSERT INTO `ecs_goods_attr` VALUES ('83', '27', '11', '灰', '400', '59');
INSERT INTO `ecs_goods_attr` VALUES ('92', '38', '13', '50cm', '100', '0');

-- ----------------------------
-- Table structure for `ecs_goods_gallery`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods_gallery`;
CREATE TABLE `ecs_goods_gallery` (
  `img_id` mediumint(8) unsigned NOT NULL auto_increment,
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `img_url` varchar(255) NOT NULL default '',
  `img_desc` varchar(255) NOT NULL default '',
  `thumb_url` varchar(255) NOT NULL default '',
  `img_original` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`img_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods_gallery
-- ----------------------------
INSERT INTO `ecs_goods_gallery` VALUES ('53', '46', 'images/201507/goods_img/46_P_1437092278066.jpg', '', 'images/201507/thumb_img/46_thumb_P_1437092278473.jpg', 'images/201507/source_img/46_P_1437092278010.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('38', '31', 'images/201507/goods_img/31_P_1437075539094.jpg', '', 'images/201507/thumb_img/31_thumb_P_1437075539421.jpg', 'images/201507/source_img/31_P_1437075539906.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('39', '32', 'images/201507/goods_img/32_P_1437075765944.jpg', '', 'images/201507/thumb_img/32_thumb_P_1437075765465.jpg', 'images/201507/source_img/32_P_1437075765079.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('40', '33', 'images/201507/goods_img/33_P_1437075865227.jpg', '', 'images/201507/thumb_img/33_thumb_P_1437075865237.jpg', 'images/201507/source_img/33_P_1437075865884.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('41', '34', 'images/201507/goods_img/34_P_1437076036621.jpg', '', 'images/201507/thumb_img/34_thumb_P_1437076036805.jpg', 'images/201507/source_img/34_P_1437076036376.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('42', '35', 'images/201507/goods_img/35_P_1437081702366.jpg', '', 'images/201507/thumb_img/35_thumb_P_1437081702651.jpg', 'images/201507/source_img/35_P_1437081702899.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('43', '36', 'images/201507/goods_img/36_P_1437082145143.jpg', '', 'images/201507/thumb_img/36_thumb_P_1437082145850.jpg', 'images/201507/source_img/36_P_1437082145148.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('44', '37', 'images/201507/goods_img/37_P_1437082214509.jpg', '', 'images/201507/thumb_img/37_thumb_P_1437082214988.jpg', 'images/201507/source_img/37_P_1437082214538.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('45', '38', 'images/201507/goods_img/38_P_1437082667902.jpg', '', 'images/201507/thumb_img/38_thumb_P_1437082667724.jpg', 'images/201507/source_img/38_P_1437082667957.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('46', '39', 'images/201507/goods_img/39_P_1437082747827.jpg', '', 'images/201507/thumb_img/39_thumb_P_1437082747037.jpg', 'images/201507/source_img/39_P_1437082747506.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('47', '40', 'images/201507/goods_img/40_P_1437082798936.jpg', '', 'images/201507/thumb_img/40_thumb_P_1437082798602.jpg', 'images/201507/source_img/40_P_1437082798751.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('48', '41', 'images/201507/goods_img/41_P_1437082849358.jpg', '', 'images/201507/thumb_img/41_thumb_P_1437082849448.jpg', 'images/201507/source_img/41_P_1437082849433.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('49', '42', 'images/201507/goods_img/42_P_1437082936955.jpg', '', 'images/201507/thumb_img/42_thumb_P_1437082936854.jpg', 'images/201507/source_img/42_P_1437082936981.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('50', '43', 'images/201507/goods_img/43_P_1437091900195.jpg', '', 'images/201507/thumb_img/43_thumb_P_1437091900030.jpg', 'images/201507/source_img/43_P_1437091900687.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('51', '44', 'images/201507/goods_img/44_P_1437092148904.jpg', '', 'images/201507/thumb_img/44_thumb_P_1437092148467.jpg', 'images/201507/source_img/44_P_1437092148962.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('52', '45', 'images/201507/goods_img/45_P_1437092199657.jpg', '', 'images/201507/thumb_img/45_thumb_P_1437092199896.jpg', 'images/201507/source_img/45_P_1437092199809.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('37', '30', 'images/201507/goods_img/30_P_1437075007961.jpg', '', 'images/201507/thumb_img/30_thumb_P_1437075007298.jpg', 'images/201507/source_img/30_P_1437075007281.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('36', '29', 'images/201507/goods_img/29_P_1437074933206.jpg', '', 'images/201507/thumb_img/29_thumb_P_1437074933782.jpg', 'images/201507/source_img/29_P_1437074933560.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('35', '28', 'images/201507/goods_img/28_P_1437074792937.jpg', '', 'images/201507/thumb_img/28_thumb_P_1437074792079.jpg', 'images/201507/source_img/28_P_1437074792599.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('34', '27', 'images/201507/goods_img/27_P_1437074702951.jpg', '', 'images/201507/thumb_img/27_thumb_P_1437074702931.jpg', 'images/201507/source_img/27_P_1437074702620.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('33', '27', 'images/201507/goods_img/27_P_1437074010553.jpg', '', 'images/201507/thumb_img/27_thumb_P_1437074010140.jpg', 'images/201507/source_img/27_P_1437074010780.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('54', '47', 'images/201508/goods_img/47_P_1439331077456.jpg', '', 'images/201508/thumb_img/47_thumb_P_1439331077895.jpg', 'images/201508/source_img/47_P_1439331077302.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('55', '53', 'images/201508/goods_img/53_P_1439511514491.jpg', '', 'images/201508/thumb_img/53_thumb_P_1439511514984.jpg', 'images/201508/source_img/53_P_1439511514441.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('56', '54', 'images/201508/goods_img/54_P_1439511600464.jpg', '', 'images/201508/thumb_img/54_thumb_P_1439511600402.jpg', 'images/201508/source_img/54_P_1439511600835.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('57', '55', 'images/201508/goods_img/55_P_1439511725475.jpg', '', 'images/201508/thumb_img/55_thumb_P_1439511725800.jpg', 'images/201508/source_img/55_P_1439511725177.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('58', '27', 'images/201508/goods_img/27_P_1440636386428.jpg', '', 'images/201508/thumb_img/27_thumb_P_1440636386334.jpg', 'images/201508/source_img/27_P_1440636386348.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('59', '27', 'images/201508/goods_img/27_P_1440636396953.png', '', 'images/201508/thumb_img/27_thumb_P_1440636396876.jpg', 'images/201508/source_img/27_P_1440636396708.png');
INSERT INTO `ecs_goods_gallery` VALUES ('60', '27', 'images/201508/goods_img/27_P_1440636492199.jpg', '', 'images/201508/thumb_img/27_thumb_P_1440636492790.jpg', 'images/201508/source_img/27_P_1440636492732.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('110', '95', 'images/201509/goods_img/95_P_1441738495691.png', '', 'images/201509/thumb_img/95_thumb_P_1441738495450.jpg', 'images/201509/source_img/95_P_1441738495871.png');
INSERT INTO `ecs_goods_gallery` VALUES ('62', '56', 'images/201508/goods_img/56_P_1440717641995.png', '', 'images/201508/thumb_img/56_thumb_P_1440717641728.jpg', 'images/201508/source_img/56_P_1440717641227.png');
INSERT INTO `ecs_goods_gallery` VALUES ('63', '57', 'images/201508/goods_img/57_P_1440717888340.jpg', '', 'images/201508/thumb_img/57_thumb_P_1440717888922.jpg', 'images/201508/source_img/57_P_1440717888289.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('64', '58', 'images/201508/goods_img/58_P_1440725448086.jpg', '', 'images/201508/thumb_img/58_thumb_P_1440725448884.jpg', 'images/201508/source_img/58_P_1440725448044.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('65', '59', 'images/201508/goods_img/59_P_1440983020331.jpg', '', 'images/201508/thumb_img/59_thumb_P_1440983020113.jpg', 'images/201508/source_img/59_P_1440983020449.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('66', '61', 'images/201508/goods_img/61_P_1440983075194.jpg', '', 'images/201508/thumb_img/61_thumb_P_1440983075257.jpg', 'images/201508/source_img/61_P_1440983075683.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('67', '60', 'images/201508/goods_img/60_P_1440983103335.jpg', '', 'images/201508/thumb_img/60_thumb_P_1440983103759.jpg', 'images/201508/source_img/60_P_1440983103825.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('68', '62', 'images/201508/goods_img/62_P_1440983163360.jpg', '', 'images/201508/thumb_img/62_thumb_P_1440983163430.jpg', 'images/201508/source_img/62_P_1440983163883.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('69', '63', 'images/201508/goods_img/63_P_1440983188388.jpg', '', 'images/201508/thumb_img/63_thumb_P_1440983188630.jpg', 'images/201508/source_img/63_P_1440983188664.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('70', '64', 'images/201508/goods_img/64_P_1440983246654.jpg', '', 'images/201508/thumb_img/64_thumb_P_1440983246436.jpg', 'images/201508/source_img/64_P_1440983246818.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('71', '65', 'images/201508/goods_img/65_P_1440983430245.png', '', 'images/201508/thumb_img/65_thumb_P_1440983430750.jpg', 'images/201508/source_img/65_P_1440983430130.png');
INSERT INTO `ecs_goods_gallery` VALUES ('72', '66', 'images/201508/goods_img/66_P_1440983490499.png', '', 'images/201508/thumb_img/66_thumb_P_1440983490179.jpg', 'images/201508/source_img/66_P_1440983490681.png');
INSERT INTO `ecs_goods_gallery` VALUES ('73', '67', 'images/201508/goods_img/67_P_1440983638515.png', '', 'images/201508/thumb_img/67_thumb_P_1440983638347.jpg', 'images/201508/source_img/67_P_1440983638706.png');
INSERT INTO `ecs_goods_gallery` VALUES ('74', '68', 'images/201508/goods_img/68_P_1440983695525.jpg', '', 'images/201508/thumb_img/68_thumb_P_1440983695392.jpg', 'images/201508/source_img/68_P_1440983695874.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('75', '69', 'images/201508/goods_img/69_P_1440983751707.jpg', '', 'images/201508/thumb_img/69_thumb_P_1440983751247.jpg', 'images/201508/source_img/69_P_1440983751360.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('76', '69', 'images/201508/goods_img/69_P_1440983751268.jpg', '', 'images/201508/thumb_img/69_thumb_P_1440983751851.jpg', 'images/201508/source_img/69_P_1440983751038.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('77', '69', 'images/201508/goods_img/69_P_1440983751855.jpg', '', 'images/201508/thumb_img/69_thumb_P_1440983751517.jpg', 'images/201508/source_img/69_P_1440983751470.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('78', '70', 'images/201508/goods_img/70_P_1440983810457.jpg', '', 'images/201508/thumb_img/70_thumb_P_1440983810977.jpg', 'images/201508/source_img/70_P_1440983810155.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('79', '71', 'images/201508/goods_img/71_P_1440983839013.jpg', '', 'images/201508/thumb_img/71_thumb_P_1440983839171.jpg', 'images/201508/source_img/71_P_1440983839575.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('80', '72', 'images/201508/goods_img/72_P_1440983887937.jpg', '', 'images/201508/thumb_img/72_thumb_P_1440983887273.jpg', 'images/201508/source_img/72_P_1440983887487.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('81', '73', 'images/201508/goods_img/73_P_1440983937493.jpg', '', 'images/201508/thumb_img/73_thumb_P_1440983937145.jpg', 'images/201508/source_img/73_P_1440983937958.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('82', '74', 'images/201508/goods_img/74_P_1440983959915.jpg', '', 'images/201508/thumb_img/74_thumb_P_1440983959089.jpg', 'images/201508/source_img/74_P_1440983959660.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('83', '75', 'images/201508/goods_img/75_P_1440984011204.jpg', '', 'images/201508/thumb_img/75_thumb_P_1440984011032.jpg', 'images/201508/source_img/75_P_1440984011552.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('84', '76', 'images/201508/goods_img/76_P_1440984280952.png', '', 'images/201508/thumb_img/76_thumb_P_1440984280227.jpg', 'images/201508/source_img/76_P_1440984280400.png');
INSERT INTO `ecs_goods_gallery` VALUES ('85', '77', 'images/201508/goods_img/77_P_1440984390419.png', '', 'images/201508/thumb_img/77_thumb_P_1440984390019.jpg', 'images/201508/source_img/77_P_1440984390701.png');
INSERT INTO `ecs_goods_gallery` VALUES ('86', '78', 'images/201509/goods_img/78_P_1441050387993.png', '', 'images/201509/thumb_img/78_thumb_P_1441050387910.jpg', 'images/201509/source_img/78_P_1441050387023.png');
INSERT INTO `ecs_goods_gallery` VALUES ('87', '79', 'images/201509/goods_img/79_P_1441050485571.png', '', 'images/201509/thumb_img/79_thumb_P_1441050485861.jpg', 'images/201509/source_img/79_P_1441050485884.png');
INSERT INTO `ecs_goods_gallery` VALUES ('88', '80', 'images/201509/goods_img/80_P_1441050558370.png', '', 'images/201509/thumb_img/80_thumb_P_1441050558679.jpg', 'images/201509/source_img/80_P_1441050558797.png');
INSERT INTO `ecs_goods_gallery` VALUES ('89', '81', 'images/201509/goods_img/81_P_1441050609354.png', '', 'images/201509/thumb_img/81_thumb_P_1441050609396.jpg', 'images/201509/source_img/81_P_1441050609935.png');
INSERT INTO `ecs_goods_gallery` VALUES ('90', '82', 'images/201509/goods_img/82_P_1441050801811.jpg', '', 'images/201509/thumb_img/82_thumb_P_1441050801396.jpg', 'images/201509/source_img/82_P_1441050801454.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('91', '83', 'images/201509/goods_img/83_P_1441052403904.png', '', 'images/201509/thumb_img/83_thumb_P_1441052403926.jpg', 'images/201509/source_img/83_P_1441052403124.png');
INSERT INTO `ecs_goods_gallery` VALUES ('92', '84', 'images/201509/goods_img/84_P_1441056023451.jpg', '', 'images/201509/thumb_img/84_thumb_P_1441056023162.jpg', 'images/201509/source_img/84_P_1441056023607.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('93', '85', 'images/201509/goods_img/85_P_1441056112035.jpg', '', 'images/201509/thumb_img/85_thumb_P_1441056112906.jpg', 'images/201509/source_img/85_P_1441056112504.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('94', '86', 'images/201509/goods_img/86_P_1441056239799.jpg', '', 'images/201509/thumb_img/86_thumb_P_1441056239192.jpg', 'images/201509/source_img/86_P_1441056239437.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('95', '87', 'images/201509/goods_img/87_P_1441056303446.jpg', '', 'images/201509/thumb_img/87_thumb_P_1441056303989.jpg', 'images/201509/source_img/87_P_1441056303788.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('96', '88', 'images/201509/goods_img/88_P_1441056484153.jpg', '', 'images/201509/thumb_img/88_thumb_P_1441056484641.jpg', 'images/201509/source_img/88_P_1441056484525.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('97', '89', 'images/201509/goods_img/89_P_1441056597776.jpg', '', 'images/201509/thumb_img/89_thumb_P_1441056597458.jpg', 'images/201509/source_img/89_P_1441056597511.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('98', '90', 'images/201509/goods_img/90_P_1441056659643.jpg', '', 'images/201509/thumb_img/90_thumb_P_1441056659969.jpg', 'images/201509/source_img/90_P_1441056659528.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('99', '91', 'images/201509/goods_img/91_P_1441056702062.jpg', '', 'images/201509/thumb_img/91_thumb_P_1441056702481.jpg', 'images/201509/source_img/91_P_1441056702311.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('100', '92', 'images/201509/goods_img/92_P_1441056728536.jpg', '', 'images/201509/thumb_img/92_thumb_P_1441056728093.jpg', 'images/201509/source_img/92_P_1441056728693.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('101', '93', 'images/201509/goods_img/93_P_1441056767053.jpg', '', 'images/201509/thumb_img/93_thumb_P_1441056767377.jpg', 'images/201509/source_img/93_P_1441056767969.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('102', '94', 'images/201509/goods_img/94_P_1441056891966.jpg', '', 'images/201509/thumb_img/94_thumb_P_1441056891641.jpg', 'images/201509/source_img/94_P_1441056891627.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('103', '55', 'images/201509/goods_img/55_P_1441498030235.jpg', '', 'images/201509/thumb_img/55_thumb_P_1441498030464.jpg', 'images/201509/source_img/55_P_1441498030729.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('104', '55', 'images/201509/goods_img/55_P_1441498030320.jpg', '', 'images/201509/thumb_img/55_thumb_P_1441498030567.jpg', 'images/201509/source_img/55_P_1441498030051.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('105', '55', 'images/201509/goods_img/55_P_1441498031944.jpg', '', 'images/201509/thumb_img/55_thumb_P_1441498031389.jpg', 'images/201509/source_img/55_P_1441498031853.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('106', '55', 'images/201509/goods_img/55_P_1441498031553.png', '', 'images/201509/thumb_img/55_thumb_P_1441498031661.jpg', 'images/201509/source_img/55_P_1441498031036.png');
INSERT INTO `ecs_goods_gallery` VALUES ('107', '30', 'images/201509/goods_img/30_P_1441661907785.png', '', 'images/201509/thumb_img/30_thumb_P_1441661907216.jpg', 'images/201509/source_img/30_P_1441661907596.png');
INSERT INTO `ecs_goods_gallery` VALUES ('108', '30', 'images/201509/goods_img/30_P_1441661907757.png', '', 'images/201509/thumb_img/30_thumb_P_1441661907011.jpg', 'images/201509/source_img/30_P_1441661907757.png');
INSERT INTO `ecs_goods_gallery` VALUES ('109', '30', 'images/201509/goods_img/30_P_1441661908217.png', '', 'images/201509/thumb_img/30_thumb_P_1441661908459.jpg', 'images/201509/source_img/30_P_1441661908909.png');
INSERT INTO `ecs_goods_gallery` VALUES ('111', '96', 'images/201509/goods_img/96_P_1441738537411.png', '', 'images/201509/thumb_img/96_thumb_P_1441738537288.jpg', 'images/201509/source_img/96_P_1441738537805.png');
INSERT INTO `ecs_goods_gallery` VALUES ('112', '97', 'images/201509/goods_img/97_P_1441738581693.png', '', 'images/201509/thumb_img/97_thumb_P_1441738581210.jpg', 'images/201509/source_img/97_P_1441738581386.png');
INSERT INTO `ecs_goods_gallery` VALUES ('113', '98', 'images/201509/goods_img/98_P_1441738620481.png', '', 'images/201509/thumb_img/98_thumb_P_1441738620390.jpg', 'images/201509/source_img/98_P_1441738620047.png');
INSERT INTO `ecs_goods_gallery` VALUES ('114', '99', 'images/201509/goods_img/99_P_1441738667644.png', '', 'images/201509/thumb_img/99_thumb_P_1441738667068.jpg', 'images/201509/source_img/99_P_1441738667880.png');
INSERT INTO `ecs_goods_gallery` VALUES ('115', '100', 'images/201509/goods_img/100_P_1441738698187.png', '', 'images/201509/thumb_img/100_thumb_P_1441738698771.jpg', 'images/201509/source_img/100_P_1441738698582.png');
INSERT INTO `ecs_goods_gallery` VALUES ('116', '101', 'images/201509/goods_img/101_P_1441738730510.png', '', 'images/201509/thumb_img/101_thumb_P_1441738730487.jpg', 'images/201509/source_img/101_P_1441738730994.png');
INSERT INTO `ecs_goods_gallery` VALUES ('117', '102', 'images/201509/goods_img/102_P_1441738765274.png', '', 'images/201509/thumb_img/102_thumb_P_1441738765170.jpg', 'images/201509/source_img/102_P_1441738765702.png');
INSERT INTO `ecs_goods_gallery` VALUES ('118', '103', 'images/201509/goods_img/103_P_1441738795859.png', '', 'images/201509/thumb_img/103_thumb_P_1441738795088.jpg', 'images/201509/source_img/103_P_1441738795138.png');
INSERT INTO `ecs_goods_gallery` VALUES ('119', '104', 'images/201509/goods_img/104_P_1441747447909.png', '', 'images/201509/thumb_img/104_thumb_P_1441747447681.jpg', 'images/201509/source_img/104_P_1441747447303.png');
INSERT INTO `ecs_goods_gallery` VALUES ('120', '38', 'images/201509/goods_img/38_P_1442179091821.png', '', 'images/201509/thumb_img/38_thumb_P_1442179091550.jpg', 'images/201509/source_img/38_P_1442179091563.png');
INSERT INTO `ecs_goods_gallery` VALUES ('121', '38', 'images/201509/goods_img/38_P_1442179091715.png', '', 'images/201509/thumb_img/38_thumb_P_1442179091581.jpg', 'images/201509/source_img/38_P_1442179091565.png');
INSERT INTO `ecs_goods_gallery` VALUES ('122', '38', 'images/201509/goods_img/38_P_1442179091449.png', '', 'images/201509/thumb_img/38_thumb_P_1442179091766.jpg', 'images/201509/source_img/38_P_1442179091088.png');
