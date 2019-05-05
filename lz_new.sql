/*
Navicat MySQL Data Transfer

Source Server         : 10-22
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : lz_new

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-12-26 12:25:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '收件人姓名',
  `address` varchar(30) NOT NULL COMMENT '地址',
  `mobile` char(11) NOT NULL COMMENT '手机号',
  `add_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='地址表';

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('16', 'admin', '嘎嘎手感还是地段好方法', '2147483647', '2018-08-05 11:09:17', '87');
INSERT INTO `address` VALUES ('17', 'admin', '嘎嘎手感还是地段好方法', '18148080867', '2018-08-05 11:13:07', '87');
INSERT INTO `address` VALUES ('18', '张茂荣', '张茂荣张茂荣张111', '13800000001', '2018-08-05 11:22:37', '87');
INSERT INTO `address` VALUES ('19', 'test', '各色各咯黑苹果平手盘', '18749528034', '2018-11-22 16:08:41', '81');
INSERT INTO `address` VALUES ('20', '222', '111111111', '18749528034', '2018-11-22 16:08:34', '81');
INSERT INTO `address` VALUES ('21', 'test', 'hg0shgshoqqfsgs', '18749528034', '2018-11-24 15:48:19', '86');
INSERT INTO `address` VALUES ('22', 'aaaa', 'agagihaogoaiga', '18749528034', '2018-11-24 21:32:28', '82');
INSERT INTO `address` VALUES ('23', 'test', '中华人民共和国', '18686868686', '2018-11-30 18:41:29', '92');
INSERT INTO `address` VALUES ('24', 'test', 'testtesttesttetst', '18749528034', '2018-12-02 15:16:00', '91');
INSERT INTO `address` VALUES ('25', '1111', '111111111111', '18749528034', '2018-12-02 21:31:30', '90');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` tinyint(3) NOT NULL COMMENT '文章分类',
  `title` varchar(255) NOT NULL,
  `content` text COMMENT '内容',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '记录时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0 不显示 1 显示',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '1', 'test', '<h1>fafafaafeaefafafaa</h1>', '1534436717', '1', '1');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(225) NOT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='轮播列表';

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '/uploads/shop/20181209\\0d9f0c9971425741fa5f17c3fb5f4709.png');
INSERT INTO `banner` VALUES ('2', '/uploads/shop/20181209\\efe6ddca3110c6a7c7abfc96dc132b10.png');
INSERT INTO `banner` VALUES ('3', '/uploads/shop/20181209\\d95834e634aca7ffd753762c4a4d4993.png');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` varchar(255) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1:网站配置，2：参数配置',
  `sort` int(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '网站标题', 'web_title', 'RCRT', '1', '1');
INSERT INTO `config` VALUES ('2', '开启站点（1：开启 0：关闭）', 'web_switch', '1', '1', '2');
INSERT INTO `config` VALUES ('3', '站点关闭提示', 'web_close_message', '维护时间，请稍后再试', '1', '3');
INSERT INTO `config` VALUES ('4', '虚拟币名字', 'web_money_name', 'RCRT', '1', '4');
INSERT INTO `config` VALUES ('5', '开启交易市场（1：开启 0：关闭）', 'web_switch_market', '1', '3', '5');
INSERT INTO `config` VALUES ('7', '注册会员名字(一级会员)', 'user_level_1', 'V1', '1', '7');
INSERT INTO `config` VALUES ('8', '二级会员', 'user_level_2', 'V2', '1', '8');
INSERT INTO `config` VALUES ('9', '三级会员', 'user_level_3', 'V3', '1', '9');
INSERT INTO `config` VALUES ('10', '四级会员', 'user_level_4', 'V4', '1', '10');
INSERT INTO `config` VALUES ('11', '五级会员', 'user_level_5', 'V5', '1', '11');
INSERT INTO `config` VALUES ('12', '是否开启注册送迷你能源发生器（1：开启 0：关闭）', 'register_send_produc', '0', '1', '12');
INSERT INTO `config` VALUES ('13', '注册送迷你能源发生器数量（已开启注册送矿机才有效）', 'register_send_product_num', '1', '1', '13');
INSERT INTO `config` VALUES ('14', '交易市场开市时间（设置示例：01:00）', 'web_start_time', '00:00', '3', '14');
INSERT INTO `config` VALUES ('15', '交易市场关市时间（设置示例：22:00）', 'web_end_time', '24:00', '3', '15');
INSERT INTO `config` VALUES ('16', '是否开启注册（1：开启 0：关闭）', 'register_open', '1', '1', '16');
INSERT INTO `config` VALUES ('17', 'IP注册数量限制（只影响会员注册，0:表示不限制）', 'register_ip', '20', '1', '17');
INSERT INTO `config` VALUES ('18', '升级v2(直推人数@联盟人数@联盟开采率)', 'rules_v2_condition', '5@20@20', '2', '1');
INSERT INTO `config` VALUES ('19', '升级v2赠送初级能源发生器数量', 'rules_v2_reward', '0', '2', '1');
INSERT INTO `config` VALUES ('20', '升级v2享受全网联盟每日交易手续费百分比(%)', 'rules_v2_rate', '15', '2', '1');
INSERT INTO `config` VALUES ('21', '升级v3(直推v2人数@联盟开采率)', 'rules_v3_condition', '30@50@50', '2', '1');
INSERT INTO `config` VALUES ('22', '升级v3赠送中级能源发生器数量', 'rules_v3_reward', '0', '2', '1');
INSERT INTO `config` VALUES ('23', '升级v3享受全网联盟每日交易手续费百分比(%)', 'rules_v3_rate', '10', '2', '1');
INSERT INTO `config` VALUES ('24', '升级v4(直推v3人数@联盟开采率)', 'rules_v4_condition', '50@3000@300', '2', '1');
INSERT INTO `config` VALUES ('25', '升级v4赠送高级能源发生器数量', 'rules_v4_reward', '0', '2', '1');
INSERT INTO `config` VALUES ('26', '升级v4享受全网联盟每日交易手续费百分比(%)', 'rules_v4_rate', '5', '2', '1');
INSERT INTO `config` VALUES ('27', '升级v5(直推v4人数@联盟开采率)', 'rules_v5_condition', '50@6000', '2', '1');
INSERT INTO `config` VALUES ('28', '升级v5赠送高级能源发生器数量', 'rules_v5_reward', '0', '2', '1');
INSERT INTO `config` VALUES ('29', '升级v5享受全网联盟每日交易手续费百分比(%)', 'rules_v5_rate', '1', '2', '1');
INSERT INTO `config` VALUES ('30', 'v1最多拥有(高级能源发生器@中级能源发生器@初级能源发生器@迷你能源发生器)个数', 'rules_v1_product', '100@4@6@8', '2', '1');
INSERT INTO `config` VALUES ('31', 'v2最多拥有(高级能源发生器@中级能源发生器@初级能源发生器@迷你能源发生器)个数', 'rules_v2_product', '1@4@7@9', '2', '1');
INSERT INTO `config` VALUES ('32', 'v3最多拥有(高级能源发生器@中级能源发生器@初级能源发生器@迷你能源发生器)个数', 'rules_v3_product', '1@5@7@10', '2', '1');
INSERT INTO `config` VALUES ('33', 'v4最多拥有(高级能源发生器@中级能源发生器@初级能源发生器@迷你能源发生器)个数', 'rules_v4_product', '2@5@8@11', '2', '1');
INSERT INTO `config` VALUES ('34', 'v5最多拥有(高级能源发生器@中级能源发生器@初级能源发生器@迷你能源发生器)个数', 'rules_v5_product', '2@5@9@12', '2', '1');
INSERT INTO `config` VALUES ('35', '买矿机直推奖励(1代@2代@3代)', 'rules_spread_rate', '0.12@0.08@0.05', '2', '1');
INSERT INTO `config` VALUES ('36', '交易单价涨幅(%)', 'market_rate', '3', '3', '1');
INSERT INTO `config` VALUES ('37', '交易数量最小值(整数)', 'market_min', '1', '3', '2');
INSERT INTO `config` VALUES ('44', '交易数量最大值(整数)', 'market_max', '1000', '3', '3');
INSERT INTO `config` VALUES ('46', '交易手续费(%)', 'market_sys_rate', '30', '3', '4');
INSERT INTO `config` VALUES ('47', '美金和人民币的兑换率(1美金=%人民币)', 'market_money_rate', '7', '3', '5');
INSERT INTO `config` VALUES ('48', '24小时交易量(设置为0则统计交易市场的真实数据)', 'market_day_total', '0', '3', '6');
INSERT INTO `config` VALUES ('49', '24小时交易额(设置为0则统计交易市场的真实数据)', 'market_day_magic', '0', '3', '7');
INSERT INTO `config` VALUES ('50', '宝石产量百分比(%),比如，收益1魔石，会产1*xx%的宝石', 'rules_jewel_rate', '0', '2', '18');
INSERT INTO `config` VALUES ('52', '转账手续费(%)', 'trun_bili', '10', '3', '12');
INSERT INTO `config` VALUES ('53', '余额释放比例', 'yue_release', '0.01', '3', '13');
INSERT INTO `config` VALUES ('56', '商品手续费', 'shop_pudg', '0', '3', '16');
INSERT INTO `config` VALUES ('57', '购买商品返积分百分比', 'shop_yue_bili', '0.1', '3', '17');
INSERT INTO `config` VALUES ('58', '余额奖励分红设置', 'yue_bonus', '2-3-0.005@2-5-0.005@2-8-0.005@2-15-0.005@2-30-0.005', '1', '14');
INSERT INTO `config` VALUES ('59', '余额最高奖级层数', 'sum_max', '30', '1', '15');
INSERT INTO `config` VALUES ('60', '最低转账数量', 'yue_out_min', '1', '3', '18');
INSERT INTO `config` VALUES ('64', '最低转账数量', 'yue_out_max', '100000000', '3', '19');
INSERT INTO `config` VALUES ('94', '释放比例(商城消费)', 'margic_shop', '0.3', '3', '26');
INSERT INTO `config` VALUES ('95', '一级', 'level_1', 'v1', '3', '27');
INSERT INTO `config` VALUES ('96', '二级', 'level_2', 'v2', '3', '28');
INSERT INTO `config` VALUES ('97', '三级', 'level_3', 'v3', '3', '29');
INSERT INTO `config` VALUES ('98', '四级', 'level_4', 'v4', '3', '30');
INSERT INTO `config` VALUES ('99', '五级', 'level_5', 'v5', '3', '31');
INSERT INTO `config` VALUES ('100', '六级', 'level_6', 'v6', '3', '32');
INSERT INTO `config` VALUES ('101', '七级', 'level_7', 'v7', '3', '33');
INSERT INTO `config` VALUES ('102', '八级', 'level_8', 'v8', '3', '34');
INSERT INTO `config` VALUES ('103', '九级', 'level_9', 'v9', '3', '35');
INSERT INTO `config` VALUES ('104', '十级', 'level_10', 'v10', '3', '36');
INSERT INTO `config` VALUES ('105', '十一级', 'level_11', 'v11', '3', '37');
INSERT INTO `config` VALUES ('106', '每秒IP访问次数@限制次数(超过则封)', 'ip_visit_num', '5@3', '3', '38');
INSERT INTO `config` VALUES ('107', '邮箱验证码(发件人名字@内容@标题)', 'email', 'RCRT@尊敬的用户您好,你的验证码为%@RCRT', '3', '39');
INSERT INTO `config` VALUES ('108', '最低充值额度', 'recharge_min', '100', '3', '40');
INSERT INTO `config` VALUES ('109', '一级(代数)', 'level_config_1', '0', '3', '41');
INSERT INTO `config` VALUES ('110', '二级(代数)', 'level_config_2', '0', '3', '42');
INSERT INTO `config` VALUES ('116', '三级(代数)', 'level_config_3', '1', '3', '43');
INSERT INTO `config` VALUES ('117', '四级(代数)', 'level_config_4', '2', '3', '44');
INSERT INTO `config` VALUES ('118', '五级(代数)', 'level_config_5', '3', '3', '45');
INSERT INTO `config` VALUES ('120', '六级(代数)', 'level_config_6', '4', '3', '46');
INSERT INTO `config` VALUES ('121', '七级(代数)', 'level_config_7', '5', '3', '47');
INSERT INTO `config` VALUES ('122', '八级(代数)', 'level_config_8', '6', '3', '48');
INSERT INTO `config` VALUES ('123', '九级(代数)', 'level_config_9', '7', '3', '49');
INSERT INTO `config` VALUES ('124', '十级(代数)', 'level_config_10', '8', '3', '50');
INSERT INTO `config` VALUES ('125', '十一级(代数)', 'level_config_11', '9', '3', '51');
INSERT INTO `config` VALUES ('126', '所有产出,奖励自由交易占比例(剩下则为商城消费占比)', 'output_bl', '0.8', '3', '52');
INSERT INTO `config` VALUES ('128', '升级2(矿机数量@直推人数@级别)', 'up_2', '1@0@1', '3', '53');
INSERT INTO `config` VALUES ('129', '升级3(矿机数量@直推人数@级别)', 'up_3', '1@5@2', '3', '54');
INSERT INTO `config` VALUES ('130', '升级4(矿机数量@直推人数@级别)', 'up_4', '1@8@3', '3', '55');
INSERT INTO `config` VALUES ('131', '升级5(矿机数量@直推人数@级别)', 'up_5', '1@10@4', '3', '56');
INSERT INTO `config` VALUES ('132', '升级6(矿机数量@直推人数@级别)', 'up_6', '1@12@5', '3', '57');
INSERT INTO `config` VALUES ('133', '升级7(矿机数量@直推人数@级别)', 'up_7', '1@15@6', '3', '58');
INSERT INTO `config` VALUES ('134', '升级8(矿机数量@直推人数@级别)', 'up_8', '1@18@7', '3', '59');
INSERT INTO `config` VALUES ('135', '升级9(矿机数量@直推人数@级别)', 'up_9', '1@20@8', '3', '60');
INSERT INTO `config` VALUES ('136', '升级10(矿机数量@直推人数@级别)', 'up_10', '1@25@9', '3', '61');
INSERT INTO `config` VALUES ('137', '升级11(矿机数量@直推人数@级别)', 'up_11', '1@30@10', '3', '62');
INSERT INTO `config` VALUES ('138', '十二级', 'level_12', 'v12', '3', '63');
INSERT INTO `config` VALUES ('139', '十二级(代数)', 'level_config_12', '10', '3', '64');
INSERT INTO `config` VALUES ('140', '升级12(矿机数量@直推人数@级别)', 'up_12', '1@35@11', '3', '65');
INSERT INTO `config` VALUES ('141', '日产量算力增加', 'ds_bl', '0.05@0.03@0.03@0.02@0.02@0.02@0.02@0.03@0.03@0.05', '3', '66');
INSERT INTO `config` VALUES ('142', '分红设置(300W@500W@1000W)', 'bonus', '0.0001@0.0002@0.0005@0.001', '3', '76');
INSERT INTO `config` VALUES ('143', '每日封顶倍数', 'day_double', '2', '3', '77');
INSERT INTO `config` VALUES ('144', '总封顶倍数', 'sum_double', '1000', '3', '78');
INSERT INTO `config` VALUES ('145', '推荐三级每日封顶倍数', 'three_double', '1', '3', '79');
INSERT INTO `config` VALUES ('146', '下级矿机分红封顶倍数', 'kg_double', '1', '3', '80');
INSERT INTO `config` VALUES ('147', '赠送矿机id', 'product_id', '1', '3', '81');

-- ----------------------------
-- Table structure for convert_log
-- ----------------------------
DROP TABLE IF EXISTS `convert_log`;
CREATE TABLE `convert_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `yue` decimal(10,2) NOT NULL COMMENT '兑换余额数量',
  `jifen` decimal(10,2) NOT NULL COMMENT '获得积分数量',
  `get_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '兑换时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='兑换积分日志';

-- ----------------------------
-- Records of convert_log
-- ----------------------------

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `detail` text,
  `desc` varchar(100) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('55', '1', 'test1', '升级L2级别', '1543736128');
INSERT INTO `log` VALUES ('56', '1', 'test', '升级L2级别', '1544828042');

-- ----------------------------
-- Table structure for manage_group
-- ----------------------------
DROP TABLE IF EXISTS `manage_group`;
CREATE TABLE `manage_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分组名称',
  `auth_ids` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限ids',
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '默认设置',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of manage_group
-- ----------------------------
INSERT INTO `manage_group` VALUES ('1', '超级管理员', 'all', '1', '1514180157', '0');
INSERT INTO `manage_group` VALUES ('3', '普通管理员', '29,35,36,37,38,39', '0', '1522137703', '1522137703');

-- ----------------------------
-- Table structure for manage_menu
-- ----------------------------
DROP TABLE IF EXISTS `manage_menu`;
CREATE TABLE `manage_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint(4) NOT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of manage_menu
-- ----------------------------
INSERT INTO `manage_menu` VALUES ('54', '内容管理', '1', '5', '0');
INSERT INTO `manage_menu` VALUES ('55', '内容管理|文章管理', '2', '5', '54');
INSERT INTO `manage_menu` VALUES ('56', '内容管理|文章管理@添加文章', '3', '0', '55');
INSERT INTO `manage_menu` VALUES ('58', '内容管理|文章管理@编辑文章', '3', '0', '55');
INSERT INTO `manage_menu` VALUES ('60', '内容管理|文章管理@删除文章', '3', '0', '55');
INSERT INTO `manage_menu` VALUES ('61', '系统配置', '1', '1', '0');
INSERT INTO `manage_menu` VALUES ('62', '系统配置|网站配置', '2', '1', '61');
INSERT INTO `manage_menu` VALUES ('63', '系统配置|参数配置', '2', '0', '61');
INSERT INTO `manage_menu` VALUES ('64', '系统配置|网站配置@修改配置', '3', '0', '62');
INSERT INTO `manage_menu` VALUES ('65', '权限管理', '1', '2', '0');
INSERT INTO `manage_menu` VALUES ('66', '权限管理|分组管理', '2', '2', '65');
INSERT INTO `manage_menu` VALUES ('67', '权限管理|分组管理@添加分组', '3', '0', '66');
INSERT INTO `manage_menu` VALUES ('68', '权限管理|分组管理@编辑分组', '3', '0', '66');
INSERT INTO `manage_menu` VALUES ('69', '权限管理|分组管理@删除分组', '3', '0', '66');
INSERT INTO `manage_menu` VALUES ('70', '权限管理|分组管理@强制删除分组', '3', '0', '66');
INSERT INTO `manage_menu` VALUES ('71', '权限管理|用户管理', '2', '1', '65');
INSERT INTO `manage_menu` VALUES ('72', '权限管理|用户管理@添加用户', '3', '0', '71');
INSERT INTO `manage_menu` VALUES ('73', '权限管理|用户管理@编辑用户', '3', '0', '71');
INSERT INTO `manage_menu` VALUES ('74', '权限管理|用户管理@禁用用户', '3', '0', '71');
INSERT INTO `manage_menu` VALUES ('75', '权限管理|用户管理@解禁用户', '3', '0', '71');
INSERT INTO `manage_menu` VALUES ('76', '交易市场', '1', '4', '0');
INSERT INTO `manage_menu` VALUES ('78', '产品管理', '1', '3', '0');
INSERT INTO `manage_menu` VALUES ('80', '产品管理|能源发生器列表', '2', '0', '78');
INSERT INTO `manage_menu` VALUES ('81', '产品管理|能源发生器列表@上架魔盒', '3', '0', '80');
INSERT INTO `manage_menu` VALUES ('82', '产品管理|魔盒列表@编辑魔盒', '3', '0', '80');
INSERT INTO `manage_menu` VALUES ('83', '产品管理|魔盒列表@下架魔盒', '3', '0', '80');
INSERT INTO `manage_menu` VALUES ('84', '会员管理', '1', '1', '0');
INSERT INTO `manage_menu` VALUES ('85', '会员管理|会员列表', '2', '1', '84');
INSERT INTO `manage_menu` VALUES ('87', '会员管理|会员列表@添加会员', '3', '0', '85');
INSERT INTO `manage_menu` VALUES ('88', '会员管理|会员列表@编辑会员', '3', '0', '85');
INSERT INTO `manage_menu` VALUES ('89', '会员管理|会员列表@充值魔石', '3', '0', '85');
INSERT INTO `manage_menu` VALUES ('90', '会员管理|会员列表@禁用会员', '3', '0', '85');
INSERT INTO `manage_menu` VALUES ('91', '会员管理|会员列表@解禁会员', '3', '0', '85');
INSERT INTO `manage_menu` VALUES ('92', '会员管理|会员列表@认证会员', '3', '0', '85');
INSERT INTO `manage_menu` VALUES ('93', '内容管理|反馈列表', '2', '0', '54');
INSERT INTO `manage_menu` VALUES ('94', '内容管理|反馈列表@删除留言', '3', '0', '93');
INSERT INTO `manage_menu` VALUES ('95', '系统配置|交易配置', '2', '0', '61');
INSERT INTO `manage_menu` VALUES ('96', '系统配置|日志列表', '2', '0', '61');
INSERT INTO `manage_menu` VALUES ('97', '交易市场|订单管理@求购订单', '3', '4', '77');
INSERT INTO `manage_menu` VALUES ('98', '交易市场|订单管理@出售订单', '3', '0', '77');
INSERT INTO `manage_menu` VALUES ('99', '会员管理|矿机明细', '2', '0', '84');
INSERT INTO `manage_menu` VALUES ('100', '交易市场|求购订单', '2', '4', '76');
INSERT INTO `manage_menu` VALUES ('101', '交易市场|出售订单', '2', '0', '76');
INSERT INTO `manage_menu` VALUES ('102', '会员管理|充值明细', '2', '0', '84');
INSERT INTO `manage_menu` VALUES ('103', '交易市场|出售订单@订单详细', '3', '0', '100');
INSERT INTO `manage_menu` VALUES ('104', '交易市场|出售订单@取消订单', '3', '0', '100');
INSERT INTO `manage_menu` VALUES ('105', '交易市场|出售订单@确认收款', '3', '0', '100');
INSERT INTO `manage_menu` VALUES ('106', '会员管理|会员列表@充值魔盒', '3', '0', '85');
INSERT INTO `manage_menu` VALUES ('107', '会员管理|会员列表@手动升级', '3', '0', '85');
INSERT INTO `manage_menu` VALUES ('108', '商城管理', '1', '5', '0');
INSERT INTO `manage_menu` VALUES ('109', '商城管理|商城列表', '2', '0', '108');
INSERT INTO `manage_menu` VALUES ('110', '商城管理|商品列表', '2', '1', '108');
INSERT INTO `manage_menu` VALUES ('113', '订单管理|订单列表', '2', '1', '108');
INSERT INTO `manage_menu` VALUES ('114', '会员管理|余额明细', '2', '0', '84');
INSERT INTO `manage_menu` VALUES ('115', '会员管理|业绩明细', '2', '0', '84');
INSERT INTO `manage_menu` VALUES ('119', '交易市场|余额出售订单', '2', '3', '76');
INSERT INTO `manage_menu` VALUES ('120', '交易市场|余额求购订单', '2', '4', '76');
INSERT INTO `manage_menu` VALUES ('121', '充值管理', '1', '6', '0');
INSERT INTO `manage_menu` VALUES ('122', '充值管理|用户充值', '2', '2', '121');
INSERT INTO `manage_menu` VALUES ('123', '充值管理|二维码管理', '2', '1', '121');
INSERT INTO `manage_menu` VALUES ('124', '内容管理|轮播管理', '2', '3', '54');

-- ----------------------------
-- Table structure for manage_power
-- ----------------------------
DROP TABLE IF EXISTS `manage_power`;
CREATE TABLE `manage_power` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of manage_power
-- ----------------------------
INSERT INTO `manage_power` VALUES ('58', '/admin/article/index', 'GET', '', '55');
INSERT INTO `manage_power` VALUES ('59', '/admin/article/create', 'GET', '', '56');
INSERT INTO `manage_power` VALUES ('60', '/admin/article/edit', 'GET', '', '58');
INSERT INTO `manage_power` VALUES ('61', '/admin/article/save', 'POST', '', '56');
INSERT INTO `manage_power` VALUES ('62', '/admin/article/update', 'POST', '', '58');
INSERT INTO `manage_power` VALUES ('63', '/admin/article/delete', 'POST', '', '60');
INSERT INTO `manage_power` VALUES ('64', '/admin/config/index', 'GET', '', '62');
INSERT INTO `manage_power` VALUES ('65', '/admin/config/show', 'GET', '', '63');
INSERT INTO `manage_power` VALUES ('66', '/admin/config/save', 'POST', '', '64');
INSERT INTO `manage_power` VALUES ('67', '/admin/group/index', 'GET', '', '66');
INSERT INTO `manage_power` VALUES ('68', '/admin/group/create', 'GET', '', '67');
INSERT INTO `manage_power` VALUES ('69', '/admin/group/edit', 'GET', '', '68');
INSERT INTO `manage_power` VALUES ('70', '/admin/group/save', 'POST', '', '67');
INSERT INTO `manage_power` VALUES ('71', '/admin/group/update', 'POST', '', '68');
INSERT INTO `manage_power` VALUES ('72', '/admin/group/delete', 'POST', '', '69');
INSERT INTO `manage_power` VALUES ('73', '/admin/group/force', 'POST', '', '70');
INSERT INTO `manage_power` VALUES ('74', '/admin/manage/index', 'GET', '', '71');
INSERT INTO `manage_power` VALUES ('75', '/admin/manage/create', 'GET', '', '72');
INSERT INTO `manage_power` VALUES ('76', '/admin/manage/edit', 'GET', '', '73');
INSERT INTO `manage_power` VALUES ('77', '/admin/manage/save', 'POST', '', '72');
INSERT INTO `manage_power` VALUES ('78', '/admin/manage/update', 'GET', '', '73');
INSERT INTO `manage_power` VALUES ('79', '/admin/manage/delete', 'POST', '', '74');
INSERT INTO `manage_power` VALUES ('80', '/admin/manage/unforbidden', 'POST', '', '75');
INSERT INTO `manage_power` VALUES ('81', '/admin/order/index', 'GET', '', '100');
INSERT INTO `manage_power` VALUES ('82', '/admin/product/index', 'GET', '', '80');
INSERT INTO `manage_power` VALUES ('83', '/admin/product/downShelve', 'POST', '', '81');
INSERT INTO `manage_power` VALUES ('84', '/admin/product/edit', 'GET', '', '82');
INSERT INTO `manage_power` VALUES ('85', '/admin/product/shelve', 'POST', '', '83');
INSERT INTO `manage_power` VALUES ('86', '/admin/product/update', 'POST', '', '82');
INSERT INTO `manage_power` VALUES ('87', '/admin/user/index', 'GET', '', '85');
INSERT INTO `manage_power` VALUES ('88', '/admin/user/magicList', 'GET', '', '86');
INSERT INTO `manage_power` VALUES ('89', '/admin/user/create', 'GET', '', '87');
INSERT INTO `manage_power` VALUES ('90', '/admin/user/edit', 'GET', '', '88');
INSERT INTO `manage_power` VALUES ('91', '/admin/user/recharge', 'GET', '', '89');
INSERT INTO `manage_power` VALUES ('92', '/admin/user/saveRecharge', 'POST', '', '89');
INSERT INTO `manage_power` VALUES ('93', '/admin/user/save', 'POST', '', '87');
INSERT INTO `manage_power` VALUES ('94', '/admin/user/update', 'POST', '', '88');
INSERT INTO `manage_power` VALUES ('95', '/admin/user/delete', 'POST', '', '90');
INSERT INTO `manage_power` VALUES ('96', '/admin/user/unforbidden', 'POST', '', '91');
INSERT INTO `manage_power` VALUES ('97', '/admin/user/certification', 'GET', '', '92');
INSERT INTO `manage_power` VALUES ('98', '/admin/user/certificationPass', 'POST', '', '92');
INSERT INTO `manage_power` VALUES ('99', '/admin/article/messageList', 'GET', '', '93');
INSERT INTO `manage_power` VALUES ('100', '/admin/article/deleteMsg', 'GET', '', '94');
INSERT INTO `manage_power` VALUES ('101', '/admin/config/market', 'GET', '', '95');
INSERT INTO `manage_power` VALUES ('102', '/admin/config/logList', 'GET', '', '96');
INSERT INTO `manage_power` VALUES ('103', '/admin/order/show', 'GET', '', '101');
INSERT INTO `manage_power` VALUES ('104', '/admin/user/magicboxlist', 'GET', '', '99');
INSERT INTO `manage_power` VALUES ('105', '/admin/user/magicList', 'GET', '', '102');
INSERT INTO `manage_power` VALUES ('106', '/admin/order/detail', 'GET', '', '103');
INSERT INTO `manage_power` VALUES ('107', '/admin/order/delete', 'POST', '', '104');
INSERT INTO `manage_power` VALUES ('108', '/admin/order/update', 'POST', '', '105');
INSERT INTO `manage_power` VALUES ('109', '/admin/user/rechargemagic', 'GET', '', '106');
INSERT INTO `manage_power` VALUES ('110', '/admin/user/saveMagic', 'POST', '', '89');
INSERT INTO `manage_power` VALUES ('111', '/admin/user/level', 'POST', '', '107');
INSERT INTO `manage_power` VALUES ('112', '/admin/shop/index', 'GET', '', '109');
INSERT INTO `manage_power` VALUES ('113', '/admin/shop/detail_list', 'GET', '', '110');
INSERT INTO `manage_power` VALUES ('114', '/admin/shop/order_list', 'GET', '', '113');
INSERT INTO `manage_power` VALUES ('115', '/admin/user/yueList', 'GET', '', '114');
INSERT INTO `manage_power` VALUES ('116', '/admin/user/jifenList', 'GET', '', '115');
INSERT INTO `manage_power` VALUES ('117', '/admin/order/yue_sell_list', 'GET', '', '119');
INSERT INTO `manage_power` VALUES ('118', '/admin/order/yue_buy_list', 'GET', '', '120');
INSERT INTO `manage_power` VALUES ('119', '/admin/index/recharge', 'GET', '', '122');
INSERT INTO `manage_power` VALUES ('120', '/admin/index/recharge_list', 'GET', '', '123');
INSERT INTO `manage_power` VALUES ('121', '/admin/article/banner', 'GET', '', '124');

-- ----------------------------
-- Table structure for manage_user
-- ----------------------------
DROP TABLE IF EXISTS `manage_user`;
CREATE TABLE `manage_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manage_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `password_salt` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码盐',
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是默认用户',
  `forbidden_time` int(11) NOT NULL DEFAULT '0' COMMENT '禁用时间',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of manage_user
-- ----------------------------
INSERT INTO `manage_user` VALUES ('1', 'admin', '31adb5784cd04b2ce8b45c1661b511ad', 'admin', '1', '0', '1514180157', '0');
INSERT INTO `manage_user` VALUES ('2', '测试的1112222', 'df18a9235390194597bb7c7b50a32d42', '9999', '0', '0', '1522084491', '1522200992');
INSERT INTO `manage_user` VALUES ('3', '123456', 'bbf1c54a6df9c67e1c1b98f8c337824b', '9999999999', '0', '0', '1522828897', '1522829946');
INSERT INTO `manage_user` VALUES ('4', '77895313', '344c1fab33f03767dbc0cb6b13f53cd8', '99999999', '0', '0', '1522829978', '1522829978');
INSERT INTO `manage_user` VALUES ('5', '123321', 'bbf1c54a6df9c67e1c1b98f8c337824b', '9999999999', '0', '0', '1522830169', '1522830169');

-- ----------------------------
-- Table structure for manage_user_group
-- ----------------------------
DROP TABLE IF EXISTS `manage_user_group`;
CREATE TABLE `manage_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of manage_user_group
-- ----------------------------
INSERT INTO `manage_user_group` VALUES ('1', '1', '1');
INSERT INTO `manage_user_group` VALUES ('13', '2', '3');
INSERT INTO `manage_user_group` VALUES ('15', '3', '3');
INSERT INTO `manage_user_group` VALUES ('16', '4', '3');
INSERT INTO `manage_user_group` VALUES ('17', '5', '1');

-- ----------------------------
-- Table structure for market_price
-- ----------------------------
DROP TABLE IF EXISTS `market_price`;
CREATE TABLE `market_price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,2) NOT NULL,
  `creates_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_price
-- ----------------------------
INSERT INTO `market_price` VALUES ('1', '0.14', '1523419283');
INSERT INTO `market_price` VALUES ('2', '0.14', '1530676422');
INSERT INTO `market_price` VALUES ('3', '0.14', '1531792464');
INSERT INTO `market_price` VALUES ('4', '0.14', '1531843518');
INSERT INTO `market_price` VALUES ('5', '0.14', '1531991274');
INSERT INTO `market_price` VALUES ('6', '0.14', '1532054427');
INSERT INTO `market_price` VALUES ('7', '0.14', '1532354128');
INSERT INTO `market_price` VALUES ('8', '0.14', '1532947812');
INSERT INTO `market_price` VALUES ('9', '0.14', '1533275947');
INSERT INTO `market_price` VALUES ('10', '0.14', '1533609313');
INSERT INTO `market_price` VALUES ('11', '0.14', '1533692991');
INSERT INTO `market_price` VALUES ('12', '0.14', '1533783858');
INSERT INTO `market_price` VALUES ('13', '0.14', '1533867165');
INSERT INTO `market_price` VALUES ('14', '0.14', '1533979144');
INSERT INTO `market_price` VALUES ('15', '0.14', '1534386951');
INSERT INTO `market_price` VALUES ('16', '0.14', '1534435364');
INSERT INTO `market_price` VALUES ('17', '0.14', '1534521954');
INSERT INTO `market_price` VALUES ('18', '0.14', '1534659994');
INSERT INTO `market_price` VALUES ('19', '0.14', '1535182564');
INSERT INTO `market_price` VALUES ('20', '0.14', '1542114370');
INSERT INTO `market_price` VALUES ('21', '0.14', '1542719113');
INSERT INTO `market_price` VALUES ('22', '0.14', '1542739128');
INSERT INTO `market_price` VALUES ('23', '0.14', '1543050277');
INSERT INTO `market_price` VALUES ('24', '0.14', '1543757443');
INSERT INTO `market_price` VALUES ('25', '0.14', '1544280847');
INSERT INTO `market_price` VALUES ('26', '0.14', '1544330087');
INSERT INTO `market_price` VALUES ('27', '0.14', '1545152565');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COMMENT '内容',
  `create_time` int(11) DEFAULT NULL COMMENT '记录时间',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `img` varchar(225) DEFAULT NULL COMMENT '图片',
  `remark` text COMMENT '回复内容',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('13', '11111111111111111111111111111', '1543570893', '92', '/uploads/msgimg/20181130\\2a4f028c4b3bbd36aa5aafe50bf2f1f2.png', '2222');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(30) NOT NULL COMMENT 'orderid',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `number` int(11) unsigned NOT NULL COMMENT '数量',
  `price` decimal(12,2) unsigned NOT NULL COMMENT '单价',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `target_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '对方ID',
  `match_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '匹配时间',
  `image` varchar(200) DEFAULT NULL COMMENT '图片',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `finish_time` int(11) unsigned DEFAULT '0' COMMENT '完成时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `charge_number` decimal(12,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '手续费',
  `is_comment` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否评论',
  `types` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1：买入，2：卖出',
  `total_price` decimal(12,2) unsigned NOT NULL COMMENT '总的价格。美元',
  `total_price_china` decimal(12,2) unsigned NOT NULL COMMENT '总的价格。人民币',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number` (`order_number`),
  KEY `user_id` (`user_id`),
  KEY `target_user_id` (`target_user_id`),
  KEY `status` (`status`),
  KEY `types` (`types`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('2', '2018080787145551', '87', '100', '0.14', '1533624951', '82', '1533699697', '/uploads/20180808\\f587e1f35d31bdab70fde88c9ff39303.png', '1533699851', '1533699937', '4', '30.00000000', '1', '1', '14.00', '98.00');
INSERT INTO `orders` VALUES ('7', '2018080887164231', '87', '100', '0.14', '1533717751', '81', '1533717823', '/uploads/20180809\\5098fb7b3ebc0731f0874e8767ffd572.png', '1533783999', '0', '3', '30.00000000', '0', '1', '14.00', '98.00');
INSERT INTO `orders` VALUES ('8', '2018120891225415', '91', '1', '0.14', '1544280855', '90', '1544281831', null, '0', '0', '2', '0.30000000', '0', '1', '0.14', '0.98');

-- ----------------------------
-- Table structure for order_comment
-- ----------------------------
DROP TABLE IF EXISTS `order_comment`;
CREATE TABLE `order_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `star` int(11) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_comment
-- ----------------------------
INSERT INTO `order_comment` VALUES ('5', '2', '87', '5', '1533717688');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(30) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `period` int(11) NOT NULL COMMENT '周期',
  `rate_min` decimal(12,5) NOT NULL,
  `rate_max` decimal(12,5) NOT NULL COMMENT '开采率',
  `yield_min` decimal(12,5) NOT NULL COMMENT '最小产量',
  `yield_max` decimal(12,5) NOT NULL COMMENT '最大产量',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:上架：0：下架',
  `image_url` varchar(255) NOT NULL,
  `jewel_price` decimal(10,2) DEFAULT NULL COMMENT '宝石价格',
  `yield_min_display` decimal(12,5) NOT NULL COMMENT '显示最小产量',
  `yield_max_display` decimal(12,5) NOT NULL COMMENT '显示最大产量',
  `image_url_jiu` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '小型云矿机', '10.00', '360', '0.01000', '0.01100', '0.43000', '0.45000', '0', '/uploads/shop/20181203\\4e5f0b9fdd615aba0d6f265d80509db6.png', null, '10.00000', '11.00000', '/uploads/shop/20181203\\d54d764e652bec5611d03c8567fc9683.png', '0');
INSERT INTO `product` VALUES ('2', '中型云矿机', '100.00', '60', '0.10000', '0.11000', '2.40000', '2.45000', '1', '/product/mh2.png', null, '10.00000', '10.00000', '', '5');
INSERT INTO `product` VALUES ('3', '大型云矿机', '1000.00', '90', '1.00000', '1.30000', '18.80000', '18.85000', '1', '/product/mh3.png', null, '10.00000', '10.00000', '', '3');
INSERT INTO `product` VALUES ('4', '超级云矿机', '6250.00', '120', '10.00000', '14.00000', '87.50000', '87.55000', '1', '/product/mh4.png', null, '10.00000', '10.00000', '', '2');
INSERT INTO `product` VALUES ('5', 'ddd', '1.00', '111', '1.00000', '1.00000', '1.00000', '1.00000', '1', '/uploads/shop/20181222\\0523af02a581af8d9a71991f41e75a89.gif', null, '1.00000', '1.00000', '/uploads/shop/20181222\\0fc1b09db18d4cb51cd6946eb1c39bc0.png', '1');

-- ----------------------------
-- Table structure for recharge
-- ----------------------------
DROP TABLE IF EXISTS `recharge`;
CREATE TABLE `recharge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '名称',
  `num` decimal(12,2) NOT NULL COMMENT '数量',
  `img` varchar(255) NOT NULL COMMENT '凭证',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '充值状态 看配置',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '软删除',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '驳回原因',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='充值表';

-- ----------------------------
-- Records of recharge
-- ----------------------------
INSERT INTO `recharge` VALUES ('13', '81', '50.00', '/uploads/20181122\\aec73534696194b5f62fe9c7147cb10e.png', '1', '1', '1542819972', '0', null);
INSERT INTO `recharge` VALUES ('14', '81', '100.00', '/uploads/20181122\\005ccfa1aa2788733dd05bc62666d207.png', '1', '0', '1542821664', '0', null);
INSERT INTO `recharge` VALUES ('15', '81', '50.00', '/uploads/20181122\\4341e7aee5badcc0d5b317f35d48054a.png', '3', '0', '1542822371', '1542864312', '凭证不合格');
INSERT INTO `recharge` VALUES ('16', '81', '10.00', '/uploads/20181122\\84fc3a2687f7f3f3e64d364c150830c8.png', '1', '0', '1542822401', '1542861995', null);

-- ----------------------------
-- Table structure for recharge_list
-- ----------------------------
DROP TABLE IF EXISTS `recharge_list`;
CREATE TABLE `recharge_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `zfb` varchar(100) NOT NULL COMMENT '支付宝',
  `wx` varchar(100) NOT NULL COMMENT '微信',
  `xh_name` varchar(50) NOT NULL COMMENT '银行名称',
  `xh_kh` char(20) NOT NULL DEFAULT '0' COMMENT '银行卡号',
  `name` varchar(50) DEFAULT NULL COMMENT '收款人',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='充值二维码';

-- ----------------------------
-- Records of recharge_list
-- ----------------------------
INSERT INTO `recharge_list` VALUES ('1', '/uploads/shop/20181127\\703e46f475f4e9c9191a003220f76593.png', '/uploads/shop/20181127\\414c2174a89e48c02a256f5ab53b7131.png', '22', '36', '1', '1543316823');

-- ----------------------------
-- Table structure for shop_detail
-- ----------------------------
DROP TABLE IF EXISTS `shop_detail`;
CREATE TABLE `shop_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '商品名',
  `type` int(11) NOT NULL COMMENT 'shop_list ID',
  `price` decimal(8,2) NOT NULL COMMENT '价格',
  `price_xuni` decimal(8,2) NOT NULL COMMENT '虚拟币价格',
  `img` varchar(100) NOT NULL COMMENT '图片',
  `stock` int(11) NOT NULL COMMENT '库存',
  `is_del` decimal(1,0) NOT NULL DEFAULT '1' COMMENT '是否删除 1未删除 0删除',
  `add_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `is_back` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1返积分 0不返',
  `yue_price` decimal(8,2) NOT NULL COMMENT '余额价格',
  `power_num` decimal(12,5) NOT NULL DEFAULT '0.00000' COMMENT '返算力数量',
  `source` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 后台 1用户',
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `img1` varchar(100) NOT NULL COMMENT '图片',
  `img2` varchar(100) NOT NULL COMMENT '图片',
  `remark` text COMMENT '详情内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='商品详情表';

-- ----------------------------
-- Records of shop_detail
-- ----------------------------
INSERT INTO `shop_detail` VALUES ('16', '发票干哈毗伽皮', '10', '2000.00', '200.00', '/uploads/shop/20180811\\60d9b5ee9ec243364745b438adc8ee49.png', '199', '1', '2018-08-11 16:09:49', '1', '2000.00', '10.00000', '1', '0', '', '', '<p><br></p><p><br></p><ul id=\"auto-id-1545213841282\"><li title=\"皮革\">产品材质：皮革</li><li title=\"男\">适用群体：男</li><li title=\"针扣\">腰带带扣款式：针扣</li><li title=\"商务休闲\">款式：商务休闲</li><li title=\"欧美\">风格：欧美</li><li title=\"其他\">流行元素：其他</li><li title=\"牛皮\">材质：牛皮</li><li title=\"男士\">适用对象：男士</li><li title=\"黑/啡\">颜色：黑/啡</li></ul>');
INSERT INTO `shop_detail` VALUES ('17', 'TEST', '12', '100.00', '100.00', '/uploads/shop/20181209\\3894c5e446d4a5353b877f5bea78f876.png', '100', '1', '2018-12-09 18:49:27', '1', '100.00', '20.00000', '0', '0', '', '', '<p><span style=\"background-color: rgb(100, 172, <p><br></p><p><br></p><ul id=\"auto-id-1545213841282\"><li title=\"皮革\">产品材质：皮革</li><li title=\"男\">适用群体：男</li><li title=\"针扣\">腰带带扣款式：针扣</li><li title=\"商务休闲\">款式：商务休闲</li><li title=\"欧美\">风格：欧美</li><li title=\"其他\">流行元素：其他</li><li title=\"牛皮\">材质：牛皮</li><li title=\"男士\">适用对象：男士</li><li title=\"黑/啡\">颜色：黑/啡</li></ul>');
INSERT INTO `shop_detail` VALUES ('19', '1', '10', '1.00', '1.00', '', '1', '1', '2018-12-10 00:46:48', '1', '1.00', '0.00000', '0', '0', '', '', '<p><span style=\"background-color: rgb(100, 172, <p><br></p><p><br></p><ul id=\"auto-id-1545213841282\"><li title=\"皮革\">产品材质：皮革</li><li title=\"男\">适用群体：男</li><li title=\"针扣\">腰带带扣款式：针扣</li><li title=\"商务休闲\">款式：商务休闲</li><li title=\"欧美\">风格：欧美</li><li title=\"其他\">流行元素：其他</li><li title=\"牛皮\">材质：牛皮</li><li title=\"男士\">适用对象：男士</li><li title=\"黑/啡\">颜色：黑/啡</li></ul>');
INSERT INTO `shop_detail` VALUES ('20', '1', '10', '11.00', '1.00', '', '1', '1', '2018-12-10 00:48:11', '1', '1.00', '0.00000', '0', '0', '', '', '<p><span style=\"background-color: rgb(100, 172, <p><br></p><p><br></p><ul id=\"auto-id-1545213841282\"><li title=\"皮革\">产品材质：皮革</li><li title=\"男\">适用群体：男</li><li title=\"针扣\">腰带带扣款式：针扣</li><li title=\"商务休闲\">款式：商务休闲</li><li title=\"欧美\">风格：欧美</li><li title=\"其他\">流行元素：其他</li><li title=\"牛皮\">材质：牛皮</li><li title=\"男士\">适用对象：男士</li><li title=\"黑/啡\">颜色：黑/啡</li></ul>');
INSERT INTO `shop_detail` VALUES ('21', '1', '10', '1.00', '100.00', '/uploads/shop/20181210\\c3af65c9bb8450df8ebc70f3ce7854fb.png', '1', '1', '2018-12-10 00:52:58', '1', '1.00', '0.00000', '0', '0', '/uploads/shop/20181210\\76e71bf7198562f4923924e32de57ac9.png', '/uploads/shop/20181210\\4e37352b90c4c16a71d726688794f4c3.png', '<p><span style=\"background-color: rgb(100, 172, <p><br></p><p><br></p><ul id=\"auto-id-1545213841282\"><li title=\"皮革\">产品材质：皮革</li><li title=\"男\">适用群体：男</li><li title=\"针扣\">腰带带扣款式：针扣</li><li title=\"商务休闲\">款式：商务休闲</li><li title=\"欧美\">风格：欧美</li><li title=\"其他\">流行元素：其他</li><li title=\"牛皮\">材质：牛皮</li><li title=\"男士\">适用对象：男士</li><li title=\"黑/啡\">颜色：黑/啡</li></ul>');
INSERT INTO `shop_detail` VALUES ('22', 'fff', '10', '100.00', '100.00', '/uploads/shop/20181218\\6b9254d92f5d290534149a0ba07f4da4.png', '100', '1', '2018-12-18 00:34:14', '1', '100.00', '0.00000', '0', '0', '/uploads/shop/20181218\\0e2431972338232ecf089b08e5775155.png', '/uploads/shop/20181218\\16e6c2cf6952a9cafb270dc43564ec5d.png', '<p><span style=\"background-color: rgb(100, 172, <p><br></p><p><br></p><ul id=\"auto-id-1545213841282\"><li title=\"皮革\">产品材质：皮革</li><li title=\"男\">适用群体：男</li><li title=\"针扣\">腰带带扣款式：针扣</li><li title=\"商务休闲\">款式：商务休闲</li><li title=\"欧美\">风格：欧美</li><li title=\"其他\">流行元素：其他</li><li title=\"牛皮\">材质：牛皮</li><li title=\"男士\">适用对象：男士</li><li title=\"黑/啡\">颜色：黑/啡</li></ul>');

-- ----------------------------
-- Table structure for shop_list
-- ----------------------------
DROP TABLE IF EXISTS `shop_list`;
CREATE TABLE `shop_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '商品列表名',
  `is_show` decimal(2,0) NOT NULL DEFAULT '1' COMMENT '0禁用 1开启',
  `add_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='商品种类表';

-- ----------------------------
-- Records of shop_list
-- ----------------------------
INSERT INTO `shop_list` VALUES ('10', '日常用品', '1', '2018-08-11 00:00:00', '0');
INSERT INTO `shop_list` VALUES ('11', '电子产品', '1', '2018-08-11 00:00:00', '0');
INSERT INTO `shop_list` VALUES ('12', '皮带', '1', '0000-00-00 00:00:00', '10');
INSERT INTO `shop_list` VALUES ('13', '222', '1', '2018-12-09 00:00:00', '0');
INSERT INTO `shop_list` VALUES ('14', 'TEST', '1', '2018-12-09 00:00:00', '12');
INSERT INTO `shop_list` VALUES ('15', 'TT', '1', '2018-12-09 00:00:00', '10');

-- ----------------------------
-- Table structure for shop_order
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT 'shop_list ID',
  `shop_name` varchar(100) NOT NULL COMMENT '商品名称 ID',
  `shop_price` decimal(16,8) NOT NULL COMMENT '商品价格',
  `num` int(11) NOT NULL COMMENT '商品数量',
  `payment_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '支付方式 1虚拟币 2余额',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1未发货 2已发货 3已收货',
  `name` varchar(50) NOT NULL COMMENT '收货人',
  `address` varchar(100) NOT NULL COMMENT '收货地址',
  `mobile` varchar(20) NOT NULL COMMENT '收货手机号',
  `numbers` varchar(225) DEFAULT '' COMMENT '快递单号或充值卡号',
  `add_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `send_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发货时间',
  `collect_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '收货时间',
  `user_id` int(11) NOT NULL COMMENT '用户 ID',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of shop_order
-- ----------------------------
INSERT INTO `shop_order` VALUES ('22', '0', '小型云矿机', '10.00000000', '1', '2', '1', 'test', 'hg0shgshoqqfsgs', '18749528034', '', '2018-11-24 17:26:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '86', '0');
INSERT INTO `shop_order` VALUES ('23', '0', '小型云矿机', '10.00000000', '1', '2', '1', 'test', 'hg0shgshoqqfsgs', '18749528034', '', '2018-11-24 17:27:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '86', '0');
INSERT INTO `shop_order` VALUES ('24', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'hg0shgshoqqfsgs', '18749528034', '', '2018-11-24 17:27:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '86', '0');
INSERT INTO `shop_order` VALUES ('25', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'hg0shgshoqqfsgs', '18749528034', '', '2018-11-24 17:34:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '86', '0');
INSERT INTO `shop_order` VALUES ('26', '0', '小型云矿机', '10.00000000', '1', '2', '1', 'test', 'hg0shgshoqqfsgs', '18749528034', '', '2018-11-24 17:34:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '86', '0');
INSERT INTO `shop_order` VALUES ('27', '0', '小型云矿机', '10.00000000', '1', '2', '1', 'test', 'hg0shgshoqqfsgs', '18749528034', '', '2018-11-24 17:35:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '86', '0');
INSERT INTO `shop_order` VALUES ('28', '0', '小型云矿机', '10.00000000', '1', '2', '1', 'aaaa', 'agagihaogoaiga', '18749528034', '', '2018-11-24 21:32:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '82', '0');
INSERT INTO `shop_order` VALUES ('29', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'aaaa', 'agagihaogoaiga', '18749528034', '', '2018-11-24 21:56:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '82', '0');
INSERT INTO `shop_order` VALUES ('30', '0', '小型云矿机', '10.00000000', '1', '2', '1', 'aaaa', 'agagihaogoaiga', '18749528034', '', '2018-11-25 19:54:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '82', '0');
INSERT INTO `shop_order` VALUES ('31', '0', '小型云矿机', '10.00000000', '1', '2', '1', 'aaaa', 'agagihaogoaiga', '18749528034', '', '2018-11-25 19:57:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '82', '0');
INSERT INTO `shop_order` VALUES ('32', '0', '小型云矿机', '10.00000000', '1', '2', '1', 'aaaa', 'agagihaogoaiga', '18749528034', '', '2018-11-25 19:59:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '82', '0');
INSERT INTO `shop_order` VALUES ('33', '0', '小型云矿机', '10.00000000', '1', '2', '1', 'test', '各色各咯黑苹果平手盘', '18749528034', '', '2018-11-30 11:45:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '81', '0');
INSERT INTO `shop_order` VALUES ('34', '0', '小型云矿机', '10.00000000', '1', '2', '2', 'test', '中华人民共和国', '18686868686', '2222222', '2018-11-30 18:45:19', '2018-12-01 20:10:47', '0000-00-00 00:00:00', '92', '1');
INSERT INTO `shop_order` VALUES ('35', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 15:30:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('36', '0', '升级大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 16:27:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('37', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 17:06:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('38', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:32:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('39', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:33:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('40', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:33:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('41', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:33:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('42', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:33:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('43', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:33:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('44', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:33:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('45', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:33:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('46', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:33:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('47', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:33:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('48', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:33:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('49', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:33:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('50', '0', '中型云矿机', '100.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:34:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('51', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:34:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('52', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:35:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('53', '0', '超级云矿机', '6250.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:36:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('54', '0', '超级云矿机', '6250.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:39:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('55', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:40:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('56', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:41:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('57', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:41:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('58', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:41:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('59', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:41:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('60', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:41:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('61', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:41:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('62', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:41:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('63', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:41:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('64', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:41:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('65', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:41:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('66', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:41:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('67', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 21:41:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('68', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 23:18:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('69', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 23:18:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('70', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 23:18:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('71', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 23:18:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('72', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 23:18:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('73', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 23:18:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('74', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 23:18:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('75', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 23:18:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('76', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 23:18:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('77', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 23:18:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('78', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 23:19:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('79', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 23:19:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('80', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 23:19:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('81', '0', '大型云矿机', '1000.00000000', '1', '2', '1', 'test', 'testtesttesttetst', '18749528034', '', '2018-12-02 23:19:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '91', '0');
INSERT INTO `shop_order` VALUES ('82', '16', '发票干哈毗伽皮', '200.00000000', '1', '1', '3', 'test', 'testtesttesttetst', '18749528034', '1111111111', '2018-12-05 03:15:42', '2018-12-07 01:59:42', '2018-12-07 02:17:06', '91', '0');
INSERT INTO `shop_order` VALUES ('83', '0', '小型云矿机', '10.00000000', '1', '2', '3', 'test', 'testtesttesttetst', '18749528034', '11111111', '2018-12-07 00:45:18', '2018-12-07 00:52:19', '2018-12-07 01:59:05', '91', '0');
INSERT INTO `shop_order` VALUES ('84', '21', '1', '100.00000000', '1', '3', '1', '1111', '111111111111', '18749528034', '', '2018-12-11 12:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '90', '0');
INSERT INTO `shop_order` VALUES ('85', '0', '升级超级云矿机', '6250.00000000', '1', '2', '1', '1111', '111111111111', '18749528034', '', '2018-12-17 03:31:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '90', '0');
INSERT INTO `shop_order` VALUES ('86', '0', '小型云矿机', '10.00000000', '1', '2', '1', '1111', '111111111111', '18749528034', '', '2018-12-19 01:03:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '90', '0');
INSERT INTO `shop_order` VALUES ('87', '0', '小型云矿机', '10.00000000', '1', '2', '1', '1111', '111111111111', '18749528034', '', '2018-12-20 14:42:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '90', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `avatar` varchar(255) DEFAULT NULL COMMENT '会员头像地址',
  `mobile` char(20) NOT NULL COMMENT '电话号',
  `password` varchar(50) NOT NULL COMMENT '登陆密码',
  `trad_password` varchar(50) NOT NULL COMMENT '交易密码',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '等级id',
  `wx` varchar(255) DEFAULT NULL COMMENT '微信号',
  `zfb` varchar(255) NOT NULL COMMENT '支付宝',
  `card_name` varchar(255) DEFAULT NULL COMMENT '银行名称',
  `card` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `pid` int(11) DEFAULT '0' COMMENT '父id',
  `magic` decimal(16,8) DEFAULT '0.00000000' COMMENT '魔石数量',
  `register_time` int(11) NOT NULL COMMENT '注册时间',
  `register_ip` varchar(255) NOT NULL,
  `login_ip` varchar(255) DEFAULT NULL COMMENT '最后一次登陆ip',
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实名称',
  `card_id` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `card_right` varchar(255) DEFAULT NULL COMMENT '身份证正面图片',
  `card_left` varchar(255) DEFAULT NULL COMMENT '身份证反面',
  `is_certification` int(11) NOT NULL DEFAULT '-1' COMMENT '是否认证 -1 未认证 1 已认证 2认证失败',
  `login_time` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '会员账号状态  -1 禁用 1 正常',
  `forbidden_time` int(11) NOT NULL DEFAULT '0' COMMENT '禁用时间',
  `product_rate` decimal(12,5) NOT NULL DEFAULT '0.00000' COMMENT '开采率',
  `wx_image_url` varchar(255) DEFAULT NULL COMMENT '微信图片地址',
  `zfb_image_url` varchar(255) DEFAULT NULL COMMENT '支付宝二维码图片',
  `comment_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '评价率',
  `certification_fail` text COMMENT '认证失败原因',
  `jewel` decimal(10,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '宝石',
  `yue` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `nick_name` varchar(255) NOT NULL COMMENT '会员昵称',
  `jifen` varchar(255) DEFAULT NULL,
  `freeze` decimal(16,8) DEFAULT '0.00000000' COMMENT '冻结',
  `sum_lucre` decimal(16,8) DEFAULT '0.00000000' COMMENT '总收益',
  `everyday` decimal(16,8) DEFAULT '0.00000000' COMMENT '每日收益',
  `total` decimal(12,2) DEFAULT '0.00' COMMENT '总业绩',
  `shop_magic` decimal(16,8) DEFAULT '0.00000000' COMMENT '商城消费币',
  `sum_lucre_conf` decimal(16,8) DEFAULT '0.00000000' COMMENT '总封顶',
  `everyday_conf` decimal(16,8) DEFAULT '0.00000000' COMMENT '每日封顶',
  `three` decimal(16,8) DEFAULT '0.00000000' COMMENT '三级收益',
  `three_conf` decimal(16,8) DEFAULT '0.00000000' COMMENT '三级封顶',
  `kg` decimal(16,8) DEFAULT '0.00000000' COMMENT '下级矿机分红收益',
  `kg_conf` decimal(16,8) DEFAULT '0.00000000' COMMENT '下级矿机分红封顶',
  PRIMARY KEY (`id`,`zfb`),
  KEY `pid` (`pid`),
  KEY `register_time` (`register_time`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('81', '/uploads/20181116\\a385adc3e14f322257ce40ef6d87e58d.png', '13061339912', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '3', 'lmy1743372239', '13061339912', '中国邮政储蓄银行', '6210984630010845629', '0', '9.76072618', '1523438479', '112.224.65.246', null, '刘梦元', '370982199809167277', '/uploads/20180411/a0c0151890ca75ac0460f2de8ede68cb.png', '/uploads/20180411/059481fb1e5a1713ac169d421f4cf32d.png', '1', '0', '1', '0', '0.01050', null, null, '0.00', '', '0.00000000', '990.00', '1', null, '0.00000000', '11.20072618', '0.00000000', '3000000.00', '1.44000000', '50.00000000', '10.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('82', null, '15940870785', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '2', '15940870785', '15940870785', '民生银行', '6216910703932043', '0', '1.47141476', '1523439624', '223.102.18.155', null, '孙国兴', '210624198904303215', '/uploads/20180411/a353f97b9ed2b2fae012d3c0c7c50c72.jpg', '/uploads/20180411/e6fad77f0a05d2ccc0420ef8a8db84da.jpg', '1', '0', '1', '0', '0.14700', '/uploads/20180411/3343df66066ff71d6b9a94cfd7d2de98.jpg', '/uploads/20180411/f75fd1e8f68bd0c8473444f465807100.jpg', '0.00', '', '0.00000000', '860.00', '11', null, '0.00000000', '500.00000000', '0.00000000', '35980.00', '0.30453824', '0.00000000', '100.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('84', null, '17620500549', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '3', 'qq552341955', '448153513@qq.com', '工商银行', '6212262010028059456', '82', '0.00000000', '1523440576', '171.104.117.216', null, '朱绍君', '450481199003220434', '/uploads/20180411/b943c9d28295942366b0a29ef4ece174.jpg', '/uploads/20180411/e0749101d8b4718d0b5d9fa52595865b.jpg', '1', '0', '1', '0', '0.00000', '/uploads/20180411/4b45f443bd74be5530743a9cf58c7664.png', '/uploads/20180411/fb80cc81eddea649b50c99783b28d43a.png', '0.00', '', '0.00000000', '1000.00', '111', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('85', null, '13835745139', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '3', '13835745139', '13835745139', '侯马之行', '6228411294516865378', '0', '8.96000000', '1523441641', '223.13.42.133', null, '谢有理', '142602196506152534', '/uploads/20180411/792d5373bf23ae5fb7683345dad08cfc.jpg', '/uploads/20180411/ac06f29ac67d8186b87a834bbe6e5d8d.jpg', '1', '0', '1', '0', '0.00000', '/uploads/20180411/2ddd667d948585aaa0957d6f28d14727.png', '/uploads/20180411/2de27706182c11daced15d8452e78413.jpg', '0.00', '', '0.00000000', '1000.00', '1111', null, '0.00000000', '50.00000000', '0.00000000', '240.00', '2.24000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('86', null, '15991110275', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '3', 'guoxiu21', '2624868916', '中国工商银行', '6215592609002900587', '82', '1.78714962', '1523442041', '61.185.12.206', null, '郭秀', '610623198911100721', '/uploads/20180411/d02bb2235ec9db3ab4faa0d881cb5b36.jpg', '/uploads/20180411/e72d33a990563dd26217c59ddd39246f.jpg', '1', '0', '1', '0', '0.25200', '/uploads/20180411/c493d3615fa2a812fe215a6f923d3809.jpg', '/uploads/20180411/81478e8801581413319b63407e145d7b.jpg', '0.00', '', '0.00000000', '760.00', '11111', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('89', '/uploads/20180411/6cef1d493bc0afdf3e5d4916dd9d6838.jpg', '15811508242', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '1', '15811508242', '18301617850', '北京农商银行', '6210676862027226781', '81', '0.00000000', '1523449160', '60.221.226.176', null, '柴彦云', '141029199303290099', '/uploads/20180411/d5db1e5dc4b0cec9426a763ce03ddc08.jpg', '/uploads/20180411/cb5be49ee8902656db1bb9388a5ef7c1.jpg', '1', '0', '1', '0', '0.00000', '/uploads/20180411/6d2573352a963d201ff56e9bc66e010e.png', '/uploads/20180411/1834fc9f8da272e004617c0b3b90bf30.jpg', '0.00', '', '0.00000000', '1000.00', '', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('90', null, '18749528034', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '10', null, '', null, null, '82', '7645.74852277', '1543159989', '127.0.0.1', null, null, null, null, null, '1', '0', '1', '0', '-11.97900', null, null, '0.00', null, '0.00000000', '94730.00', 'test', null, '0.00000000', '1304.20000000', '4.20000000', '14010.00', '1474.48713070', '5263000.00000000', '6570.00000000', '0.00000000', '10000.00000000', '0.00000000', '10000.00000000');
INSERT INTO `user` VALUES ('91', null, '18749528033', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '10', '', '', '', '', '90', '431.70919329', '1543302210', '127.0.0.1', null, '', '', null, null, '1', '0', '1', '0', '79.98050', null, null, '0.00', null, '0.00000000', '100000.00', 'test1', null, '0.00000000', '1.00000000', '1.00000000', '0.00', '158.50229837', '44811000.00000000', '44820.00000000', '0.00000000', '10000.00000000', '0.00000000', '10000.00000000');
INSERT INTO `user` VALUES ('92', null, '18749528034', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '1', null, '', null, null, '85', '0.00000000', '1544503716', '127.0.0.1', null, null, null, null, null, '-1', '0', '1', '0', '0.00000', null, null, '0.00', null, '0.00000000', '0.00', 'ABC', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('93', null, '18749528034', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '1', null, '', null, null, '88', '0.00000000', '1544504045', '127.0.0.1', null, null, null, null, null, '-1', '0', '1', '0', '0.00000', null, null, '0.00', null, '0.00000000', '0.00', 'NBA', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('94', null, '18749528034', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '1', null, '', null, null, '88', '0.00000000', '1544504250', '127.0.0.1', null, null, null, null, null, '-1', '0', '1', '0', '0.00000', null, null, '0.00', null, '0.00000000', '0.00', 'ABCD', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('95', null, '18749528034', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '1', null, '', null, null, '88', '0.00000000', '1544504362', '127.0.0.1', null, null, null, null, null, '-1', '0', '1', '0', '0.00000', null, null, '0.00', null, '0.00000000', '0.00', 'ABCDE', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('96', null, '18749528034', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '1', null, '', null, null, '94', '0.00000000', '1544505408', '127.0.0.1', null, null, null, null, null, '-1', '0', '1', '0', '0.00000', null, null, '0.00', null, '0.00000000', '0.00', 'EEE', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('97', null, '18749528034', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '1', null, '', null, null, '94', '0.00000000', '1544505474', '127.0.0.1', null, null, null, null, null, '-1', '0', '1', '0', '0.00000', null, null, '0.00', null, '0.00000000', '0.00', 'ED', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('98', null, '18749528034', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '1', null, '', null, null, '91', '0.00000000', '1544506283', '127.0.0.1', null, null, null, null, null, '-1', '0', '1', '0', '0.00000', null, null, '0.00', null, '0.00000000', '0.00', 'RR', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('99', null, '18749528034', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '1', null, '', null, null, '91', '0.00000000', '1544507441', '127.0.0.1', null, null, null, null, null, '-1', '0', '1', '0', '0.00000', null, null, '0.00', null, '0.00000000', '0.00', 'PY', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('100', null, '18749528034', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '1', null, '', null, null, '95', '0.00000000', '1544507495', '127.0.0.1', null, null, null, null, null, '-1', '0', '1', '0', '0.00000', null, null, '0.00', null, '0.00000000', '0.00', 'PPY', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('101', null, '18749528034', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '1', null, '', null, null, '95', '0.00000000', '1544507741', '127.0.0.1', null, null, null, null, null, '-1', '0', '1', '0', '0.00000', null, null, '0.00', null, '0.00000000', '0.00', 'PPYY', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('102', null, '18749528034', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '1', null, '', null, null, '95', '0.00000000', '1544508006', '127.0.0.1', null, null, null, null, null, '-1', '0', '1', '0', '0.00000', null, null, '0.00', null, '0.00000000', '0.00', 'PPYYY', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('103', null, '18749528034', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '1', null, '', null, null, '95', '0.00000000', '1544509248', '127.0.0.1', null, null, null, null, null, '-1', '0', '1', '0', '0.00000', null, null, '0.00', null, '0.00000000', '0.00', 'PYZ', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');
INSERT INTO `user` VALUES ('104', null, '18749528034', '653e7710db9484aec0247f233790e74d', '653e7710db9484aec0247f233790e74d', '10', '', '', '', '', '95', '0.00000000', '1544509281', '127.0.0.1', null, '', '', null, null, '1', '0', '1', '0', '0.00000', null, null, '0.00', null, '0.00000000', '0.00', 'PYZz', null, '0.00000000', '0.00000000', '0.00000000', '0.00', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000');

-- ----------------------------
-- Table structure for user_currency
-- ----------------------------
DROP TABLE IF EXISTS `user_currency`;
CREATE TABLE `user_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `u_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `c_id` int(11) DEFAULT '0' COMMENT 'currency ID',
  `num` decimal(16,4) DEFAULT '0.0000' COMMENT '数量',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='用户数字资产货币表';

-- ----------------------------
-- Records of user_currency
-- ----------------------------
INSERT INTO `user_currency` VALUES ('5', '174', '2', '0.0000', '1541176243');
INSERT INTO `user_currency` VALUES ('6', '174', '4', '0.0000', '1541176480');
INSERT INTO `user_currency` VALUES ('7', '174', '3', '0.0000', '1541176505');
INSERT INTO `user_currency` VALUES ('8', '174', '6', '48.0000', '1541177981');
INSERT INTO `user_currency` VALUES ('9', '174', '5', '0.0000', '1541177991');
INSERT INTO `user_currency` VALUES ('10', '4291', '2', '0.0000', '1541244924');
INSERT INTO `user_currency` VALUES ('11', '3702', '6', '0.0000', '1541258195');
INSERT INTO `user_currency` VALUES ('12', '2996', '3', '0.0000', '1541283419');
INSERT INTO `user_currency` VALUES ('13', '3702', '2', '0.0000', '1541294959');
INSERT INTO `user_currency` VALUES ('14', '92', '2', '10000000.0000', '1541297886');
INSERT INTO `user_currency` VALUES ('15', '92', '3', '0.0000', '1541297937');
INSERT INTO `user_currency` VALUES ('16', '92', '6', '0.0000', '1541297950');
INSERT INTO `user_currency` VALUES ('17', '3530', '2', '0.0000', '1541299640');
INSERT INTO `user_currency` VALUES ('18', '2910', '3', '0.0000', '1541342082');
INSERT INTO `user_currency` VALUES ('19', '3064', '2', '0.0000', '1541346173');
INSERT INTO `user_currency` VALUES ('20', '93', '2', '3000000.0000', '1541354291');
INSERT INTO `user_currency` VALUES ('21', '3939', '4', '0.0000', '1541364238');
INSERT INTO `user_currency` VALUES ('22', '3939', '2', '0.0000', '1541364332');
INSERT INTO `user_currency` VALUES ('23', '4029', '2', '0.0000', '1541391579');
INSERT INTO `user_currency` VALUES ('24', '4029', '6', '0.0000', '1541391758');
INSERT INTO `user_currency` VALUES ('25', '2849', '2', '0.0000', '1541395481');
INSERT INTO `user_currency` VALUES ('26', '3193', '5', '0.0000', '1541401609');
INSERT INTO `user_currency` VALUES ('27', '3080', '4', '0.0000', '1541404469');
INSERT INTO `user_currency` VALUES ('28', '2792', '2', '1000000.0000', '1541417054');
INSERT INTO `user_currency` VALUES ('29', '2844', '6', '0.0000', '1541417767');
INSERT INTO `user_currency` VALUES ('30', '2844', '3', '0.0000', '1541417807');
INSERT INTO `user_currency` VALUES ('31', '3810', '2', '0.0000', '1541426034');
INSERT INTO `user_currency` VALUES ('32', '914', '2', '0.0000', '1541435307');
INSERT INTO `user_currency` VALUES ('33', '3749', '3', '0.0000', '1541442453');
INSERT INTO `user_currency` VALUES ('34', '3328', '2', '0.0000', '1541451313');
INSERT INTO `user_currency` VALUES ('35', '2792', '6', '0.0000', '1541462457');
INSERT INTO `user_currency` VALUES ('36', '2792', '3', '0.0000', '1541462491');
INSERT INTO `user_currency` VALUES ('37', '2792', '5', '0.0000', '1541462522');
INSERT INTO `user_currency` VALUES ('38', '3953', '2', '0.0000', '1541474985');
INSERT INTO `user_currency` VALUES ('39', '3953', '6', '0.0000', '1541475080');
INSERT INTO `user_currency` VALUES ('40', '4371', '6', '0.0000', '1541485001');
INSERT INTO `user_currency` VALUES ('41', '4371', '4', '0.0000', '1541485220');
INSERT INTO `user_currency` VALUES ('42', '2912', '2', '0.0000', '1541507794');
INSERT INTO `user_currency` VALUES ('43', '91', '6', '52.0000', '1541516902');
INSERT INTO `user_currency` VALUES ('44', '4093', '6', '0.0000', '1541523582');
INSERT INTO `user_currency` VALUES ('45', '3202', '2', '0.0000', '1541548534');
INSERT INTO `user_currency` VALUES ('46', '2635', '6', '0.0000', '1541551849');
INSERT INTO `user_currency` VALUES ('47', '3953', '3', '0.0000', '1541575275');
INSERT INTO `user_currency` VALUES ('48', '2953', '6', '0.0000', '1541607540');
INSERT INTO `user_currency` VALUES ('49', '3934', '6', '0.0000', '1541627302');
INSERT INTO `user_currency` VALUES ('50', '2959', '2', '0.0000', '1541627789');
INSERT INTO `user_currency` VALUES ('51', '3390', '2', '0.0000', '1541637806');
INSERT INTO `user_currency` VALUES ('52', '289', '6', '0.0000', '1541640981');
INSERT INTO `user_currency` VALUES ('53', '99', '2', '0.0000', '1541652560');
INSERT INTO `user_currency` VALUES ('54', '99', '3', '0.0000', '1541652573');
INSERT INTO `user_currency` VALUES ('55', '3129', '6', '0.0000', '1541680790');
INSERT INTO `user_currency` VALUES ('56', '3129', '3', '0.0000', '1541680886');
INSERT INTO `user_currency` VALUES ('57', '2856', '2', '0.0000', '1541682608');
INSERT INTO `user_currency` VALUES ('58', '2726', '2', '1000000.0000', '1541683396');
INSERT INTO `user_currency` VALUES ('59', '3518', '6', '0.0000', '1541685338');
INSERT INTO `user_currency` VALUES ('60', '941', '4', '0.0000', '1541688747');
INSERT INTO `user_currency` VALUES ('61', '3953', '4', '0.0000', '1541690345');
INSERT INTO `user_currency` VALUES ('62', '2710', '5', '0.0000', '1541690431');
INSERT INTO `user_currency` VALUES ('63', '2910', '6', '0.0000', '1541716194');
INSERT INTO `user_currency` VALUES ('64', '4304', '4', '0.0000', '1541722920');
INSERT INTO `user_currency` VALUES ('65', '3338', '2', '1000000.0000', '1541726042');
INSERT INTO `user_currency` VALUES ('66', '2792', '4', '0.0000', '1541726683');
INSERT INTO `user_currency` VALUES ('67', '2998', '6', '0.0000', '1541727528');
INSERT INTO `user_currency` VALUES ('68', '116', '2', '0.0000', '1541733842');
INSERT INTO `user_currency` VALUES ('69', '3580', '2', '0.0000', '1541741000');
INSERT INTO `user_currency` VALUES ('70', '2910', '2', '0.0000', '1541741054');
INSERT INTO `user_currency` VALUES ('71', '890', '6', '0.0000', '1541743106');
INSERT INTO `user_currency` VALUES ('72', '3064', '3', '0.0000', '1541772301');
INSERT INTO `user_currency` VALUES ('73', '3064', '5', '0.0000', '1541772336');
INSERT INTO `user_currency` VALUES ('74', '2983', '2', '0.0000', '1541773936');
INSERT INTO `user_currency` VALUES ('75', '3314', '2', '0.0000', '1541806086');
INSERT INTO `user_currency` VALUES ('76', '4132', '5', '0.0000', '1541809063');
INSERT INTO `user_currency` VALUES ('77', '4132', '2', '0.0000', '1541809133');
INSERT INTO `user_currency` VALUES ('78', '2865', '6', '0.0000', '1541827734');
INSERT INTO `user_currency` VALUES ('79', '2865', '4', '0.0000', '1541827755');
INSERT INTO `user_currency` VALUES ('80', '2878', '2', '0.0000', '1541836957');
INSERT INTO `user_currency` VALUES ('81', '2920', '3', '0.0000', '1541857203');
INSERT INTO `user_currency` VALUES ('82', '4462', '2', '0.0000', '1541858530');
INSERT INTO `user_currency` VALUES ('83', '4238', '3', '0.0000', '1541862655');
INSERT INTO `user_currency` VALUES ('84', '4425', '2', '0.0000', '1541913192');
INSERT INTO `user_currency` VALUES ('85', '3404', '4', '0.0000', '1541920481');
INSERT INTO `user_currency` VALUES ('86', '4443', '2', '0.0000', '1541930375');
INSERT INTO `user_currency` VALUES ('87', '3381', '2', '0.0000', '1541941966');
INSERT INTO `user_currency` VALUES ('88', '4267', '2', '0.0000', '1541949751');
INSERT INTO `user_currency` VALUES ('89', '91', '2', '0.0000', '1541993537');
INSERT INTO `user_currency` VALUES ('90', '4304', '6', '0.0000', '1541996606');
INSERT INTO `user_currency` VALUES ('91', '2959', '6', '0.0000', '1542012917');
INSERT INTO `user_currency` VALUES ('92', '4417', '3', '0.0000', '1542012945');
INSERT INTO `user_currency` VALUES ('93', '4508', '5', '0.0000', '1542023339');
INSERT INTO `user_currency` VALUES ('94', '4517', '4', '0.0000', '1542033214');
INSERT INTO `user_currency` VALUES ('95', '4517', '2', '0.0000', '1542036975');
INSERT INTO `user_currency` VALUES ('96', '4502', '6', '0.0000', '1542072091');
INSERT INTO `user_currency` VALUES ('97', '4517', '6', '0.0000', '1542074990');
INSERT INTO `user_currency` VALUES ('98', '3505', '5', '0.0000', '1542098558');
INSERT INTO `user_currency` VALUES ('99', '2867', '3', '0.0000', '1542125786');
INSERT INTO `user_currency` VALUES ('100', '2867', '2', '1000000.0000', '1542126246');
INSERT INTO `user_currency` VALUES ('101', '2867', '4', '0.0000', '1542126280');
INSERT INTO `user_currency` VALUES ('102', '2867', '6', '0.0000', '1542126321');
INSERT INTO `user_currency` VALUES ('103', '137', '4', '0.0000', '1542135654');
INSERT INTO `user_currency` VALUES ('104', '3478', '2', '0.0000', '1542152908');
INSERT INTO `user_currency` VALUES ('105', '3478', '3', '0.0000', '1542152942');
INSERT INTO `user_currency` VALUES ('106', '4197', '2', '0.0000', '1542155907');
INSERT INTO `user_currency` VALUES ('107', '3151', '5', '0.0000', '1542173762');
INSERT INTO `user_currency` VALUES ('108', '4539', '2', '0.0000', '1542204953');
INSERT INTO `user_currency` VALUES ('109', '4093', '4', '0.0000', '1542211696');
INSERT INTO `user_currency` VALUES ('110', '3328', '3', '0.0000', '1542232448');
INSERT INTO `user_currency` VALUES ('111', '3328', '6', '0.0000', '1542232482');
INSERT INTO `user_currency` VALUES ('112', '4571', '3', '0.0000', '1542245958');
INSERT INTO `user_currency` VALUES ('113', '2852', '5', '0.0000', '1542264165');
INSERT INTO `user_currency` VALUES ('114', '3277', '2', '0.0000', '1542264580');
INSERT INTO `user_currency` VALUES ('115', '3277', '3', '0.0000', '1542264597');
INSERT INTO `user_currency` VALUES ('116', '3101', '4', '0.0000', '1542264766');
INSERT INTO `user_currency` VALUES ('117', '4609', '6', '0.0000', '1542294873');
INSERT INTO `user_currency` VALUES ('118', '4609', '5', '0.0000', '1542296568');
INSERT INTO `user_currency` VALUES ('119', '2852', '2', '0.0000', '1542319018');
INSERT INTO `user_currency` VALUES ('120', '4607', '6', '0.0000', '1542324196');
INSERT INTO `user_currency` VALUES ('121', '4566', '2', '0.0000', '1542340575');
INSERT INTO `user_currency` VALUES ('122', '3015', '6', '0.0000', '1542359246');
INSERT INTO `user_currency` VALUES ('123', '4648', '2', '0.0000', '1542389534');
INSERT INTO `user_currency` VALUES ('124', '4617', '2', '1000000.0000', '1542450561');
INSERT INTO `user_currency` VALUES ('125', '2987', '2', '0.0000', '1542472119');
INSERT INTO `user_currency` VALUES ('126', '3645', '5', '0.0000', '1542498027');
INSERT INTO `user_currency` VALUES ('127', '4679', '6', '0.0000', '1542501026');
INSERT INTO `user_currency` VALUES ('128', '2683', '6', '0.0000', '1542503220');
INSERT INTO `user_currency` VALUES ('129', '3702', '4', '0.0000', '1542512362');
INSERT INTO `user_currency` VALUES ('130', '3713', '6', '0.0000', '1542557477');
INSERT INTO `user_currency` VALUES ('131', '4304', '5', '0.0000', '1542573558');
INSERT INTO `user_currency` VALUES ('132', '2856', '6', '0.0000', '1542583917');
INSERT INTO `user_currency` VALUES ('133', '4778', '2', '0.0000', '1542608618');
INSERT INTO `user_currency` VALUES ('134', '3953', '5', '0.0000', '1542656524');
INSERT INTO `user_currency` VALUES ('135', '3160', '2', '0.0000', '1542697374');
INSERT INTO `user_currency` VALUES ('136', '4262', '2', '0.0000', '1542709633');
INSERT INTO `user_currency` VALUES ('137', '3934', '3', '0.0000', '1542725034');
INSERT INTO `user_currency` VALUES ('138', '3730', '5', '0.0000', '1542738489');
INSERT INTO `user_currency` VALUES ('139', '3338', '6', '0.0000', '1542762073');
INSERT INTO `user_currency` VALUES ('140', '4494', '6', '0.0000', '1542799809');
INSERT INTO `user_currency` VALUES ('141', '4494', '2', '0.0000', '1542799839');
INSERT INTO `user_currency` VALUES ('142', '3160', '6', '0.0000', '1542814412');
INSERT INTO `user_currency` VALUES ('143', '3089', '6', '0.0000', '1542844050');
INSERT INTO `user_currency` VALUES ('144', '4836', '6', '0.0000', '1542874251');
INSERT INTO `user_currency` VALUES ('145', '4884', '4', '0.0000', '1542919533');
INSERT INTO `user_currency` VALUES ('146', '4512', '2', '0.0000', '1542947806');
INSERT INTO `user_currency` VALUES ('147', '93', '3', '0.0000', '1542965961');
INSERT INTO `user_currency` VALUES ('148', '93', '4', '0.0000', '1542965967');
INSERT INTO `user_currency` VALUES ('149', '93', '5', '0.0000', '1542965970');
INSERT INTO `user_currency` VALUES ('150', '93', '6', '0.0000', '1542965976');
INSERT INTO `user_currency` VALUES ('151', '4267', '3', '0.0000', '1542974082');
INSERT INTO `user_currency` VALUES ('152', '3247', '2', '0.0000', '1543030391');
INSERT INTO `user_currency` VALUES ('153', '4945', '5', '0.0000', '1543030622');
INSERT INTO `user_currency` VALUES ('154', '4945', '2', '0.0000', '1543030638');
INSERT INTO `user_currency` VALUES ('155', '4945', '6', '0.0000', '1543034724');
INSERT INTO `user_currency` VALUES ('156', '3794', '5', '0.0000', '1543046347');
INSERT INTO `user_currency` VALUES ('157', '3904', '2', '0.0000', '1543060290');
INSERT INTO `user_currency` VALUES ('158', '2792', '7', '0.0000', '1543099124');
INSERT INTO `user_currency` VALUES ('159', '3737', '6', '0.0000', '1543105783');
INSERT INTO `user_currency` VALUES ('160', '4034', '2', '0.0000', '1543111407');
INSERT INTO `user_currency` VALUES ('161', '4945', '3', '0.0000', '1543122211');
INSERT INTO `user_currency` VALUES ('162', '4945', '7', '0.0000', '1543122309');
INSERT INTO `user_currency` VALUES ('163', '3953', '7', '0.0000', '1543131469');
INSERT INTO `user_currency` VALUES ('164', '3338', '7', '0.0000', '1543138999');
INSERT INTO `user_currency` VALUES ('165', '3810', '5', '0.0000', '1543163347');
INSERT INTO `user_currency` VALUES ('166', '3810', '7', '0.0000', '1543163369');
INSERT INTO `user_currency` VALUES ('167', '4074', '7', '0.0000', '1543186894');
INSERT INTO `user_currency` VALUES ('168', '4973', '7', '0.0000', '1543193618');
INSERT INTO `user_currency` VALUES ('169', '4792', '4', '0.0000', '1543197416');
INSERT INTO `user_currency` VALUES ('170', '4975', '7', '0.0000', '1543210234');
INSERT INTO `user_currency` VALUES ('171', '2943', '3', '0.0000', '1543211966');
INSERT INTO `user_currency` VALUES ('172', '3702', '3', '0.0000', '1543218791');
INSERT INTO `user_currency` VALUES ('173', '3049', '3', '0.0000', '1543249072');
INSERT INTO `user_currency` VALUES ('174', '3934', '7', '0.0000', '1543259763');
INSERT INTO `user_currency` VALUES ('175', '4661', '3', '0.0000', '1543272116');
INSERT INTO `user_currency` VALUES ('176', '116', '7', '0.0000', '1543273237');
INSERT INTO `user_currency` VALUES ('177', '116', '3', '0.0000', '1543273280');
INSERT INTO `user_currency` VALUES ('178', '3685', '7', '0.0000', '1543278219');
INSERT INTO `user_currency` VALUES ('179', '2996', '4', '0.0000', '1543307765');
INSERT INTO `user_currency` VALUES ('180', '4460', '3', '0.0000', '1543322082');
INSERT INTO `user_currency` VALUES ('181', '4460', '5', '0.0000', '1543322110');
INSERT INTO `user_currency` VALUES ('182', '2849', '3', '0.0000', '1543322202');
INSERT INTO `user_currency` VALUES ('183', '2849', '4', '0.0000', '1543322214');
INSERT INTO `user_currency` VALUES ('184', '2849', '5', '0.0000', '1543322227');
INSERT INTO `user_currency` VALUES ('185', '2849', '6', '0.0000', '1543322245');
INSERT INTO `user_currency` VALUES ('186', '3863', '2', '1000000.0000', '1543323638');
INSERT INTO `user_currency` VALUES ('187', '4247', '2', '2000000.0000', '1543323660');
INSERT INTO `user_currency` VALUES ('188', '4460', '2', '10000000.0000', '1543323675');
INSERT INTO `user_currency` VALUES ('189', '4951', '2', '1000000.0000', '1543323676');
INSERT INTO `user_currency` VALUES ('190', '4975', '2', '1000000.0000', '1543323681');
INSERT INTO `user_currency` VALUES ('191', '4952', '2', '1000000.0000', '1543323709');
INSERT INTO `user_currency` VALUES ('192', '4415', '2', '3000000.0000', '1543323875');
INSERT INTO `user_currency` VALUES ('193', '2726', '3', '0.0000', '1543324018');
INSERT INTO `user_currency` VALUES ('194', '4952', '7', '0.0000', '1543324077');
INSERT INTO `user_currency` VALUES ('195', '4415', '3', '0.0000', '1543324156');
INSERT INTO `user_currency` VALUES ('196', '4943', '3', '0.0000', '1543324182');
INSERT INTO `user_currency` VALUES ('197', '4895', '2', '1000000.0000', '1543324274');
INSERT INTO `user_currency` VALUES ('198', '3038', '2', '1000000.0000', '1543325243');
INSERT INTO `user_currency` VALUES ('199', '4951', '3', '0.0000', '1543325274');
INSERT INTO `user_currency` VALUES ('200', '4951', '4', '0.0000', '1543325306');
INSERT INTO `user_currency` VALUES ('201', '4173', '2', '1000000.0000', '1543325308');
INSERT INTO `user_currency` VALUES ('202', '3116', '2', '1000000.0000', '1543327124');
INSERT INTO `user_currency` VALUES ('203', '3836', '2', '1000000.0000', '1543327153');
INSERT INTO `user_currency` VALUES ('204', '4465', '2', '1000000.0000', '1543329923');
INSERT INTO `user_currency` VALUES ('205', '4465', '3', '0.0000', '1543330124');
INSERT INTO `user_currency` VALUES ('206', '2867', '5', '0.0000', '1543333693');
INSERT INTO `user_currency` VALUES ('207', '4465', '7', '0.0000', '1543334378');
INSERT INTO `user_currency` VALUES ('208', '3907', '2', '1000000.0000', '1543336345');
INSERT INTO `user_currency` VALUES ('209', '4975', '5', '0.0000', '1543349860');
INSERT INTO `user_currency` VALUES ('210', '4975', '3', '0.0000', '1543349878');
INSERT INTO `user_currency` VALUES ('211', '4978', '5', '0.0000', '1543354297');
INSERT INTO `user_currency` VALUES ('212', '4173', '3', '0.0000', '1543359979');
INSERT INTO `user_currency` VALUES ('213', '91', '7', '0.0000', '1543361298');
INSERT INTO `user_currency` VALUES ('214', '3038', '4', '0.0000', '1543363431');
INSERT INTO `user_currency` VALUES ('215', '3038', '3', '0.0000', '1543363617');
INSERT INTO `user_currency` VALUES ('216', '4322', '2', '1000000.0000', '1543365246');
INSERT INTO `user_currency` VALUES ('217', '2912', '3', '0.0000', '1543370140');
INSERT INTO `user_currency` VALUES ('218', '4977', '7', '0.0000', '1543370291');
INSERT INTO `user_currency` VALUES ('219', '4101', '2', '1000000.0000', '1543379283');
INSERT INTO `user_currency` VALUES ('220', '3662', '3', '0.0000', '1543380587');
INSERT INTO `user_currency` VALUES ('221', '4896', '2', '4000000.0000', '1543397627');
INSERT INTO `user_currency` VALUES ('222', '4691', '2', '1000000.0000', '1543407834');
INSERT INTO `user_currency` VALUES ('223', '4896', '3', '0.0000', '1543411425');
INSERT INTO `user_currency` VALUES ('224', '4952', '6', '0.0000', '1543417475');
INSERT INTO `user_currency` VALUES ('225', '4691', '3', '0.0000', '1543436531');
INSERT INTO `user_currency` VALUES ('226', '3338', '3', '0.0000', '1543442585');
INSERT INTO `user_currency` VALUES ('227', '4267', '7', '0.0000', '1543446279');
INSERT INTO `user_currency` VALUES ('228', '4876', '2', '2000000.0000', '1543457741');
INSERT INTO `user_currency` VALUES ('229', '5019', '2', '1000000.0000', '1543465073');
INSERT INTO `user_currency` VALUES ('230', '3193', '2', '1000000.0000', '1543467202');
INSERT INTO `user_currency` VALUES ('231', '5058', '7', '0.0000', '1543472746');
INSERT INTO `user_currency` VALUES ('232', '4304', '2', '1000000.0000', '1543478057');
INSERT INTO `user_currency` VALUES ('233', '4304', '3', '0.0000', '1543478233');
INSERT INTO `user_currency` VALUES ('234', '151', '6', '0.0000', '1543480118');
INSERT INTO `user_currency` VALUES ('235', '3116', '3', '0.0000', '1543482190');
INSERT INTO `user_currency` VALUES ('236', '5063', '3', '0.0000', '1543487124');
INSERT INTO `user_currency` VALUES ('237', '3414', '2', '2000000.0000', '1543488227');
INSERT INTO `user_currency` VALUES ('238', '4315', '3', '0.0000', '1543496185');
INSERT INTO `user_currency` VALUES ('239', '4824', '7', '0.0000', '1543502376');
INSERT INTO `user_currency` VALUES ('240', '3193', '3', '0.0000', '1543514302');
INSERT INTO `user_currency` VALUES ('241', '2994', '4', '0.0000', '1543540336');
INSERT INTO `user_currency` VALUES ('242', '3702', '7', '0.0000', '1543577202');
INSERT INTO `user_currency` VALUES ('243', '4849', '2', '1000000.0000', '1543582015');
INSERT INTO `user_currency` VALUES ('244', '4849', '4', '0.0000', '1543582392');
INSERT INTO `user_currency` VALUES ('245', '5063', '2', '1000000.0000', '1543586814');
INSERT INTO `user_currency` VALUES ('246', '4607', '2', '1000000.0000', '1543589395');
INSERT INTO `user_currency` VALUES ('247', '4978', '7', '0.0000', '1543615290');
INSERT INTO `user_currency` VALUES ('248', '3111', '2', '1000000.0000', '1543616701');
INSERT INTO `user_currency` VALUES ('249', '4670', '7', '0.0000', '1543618969');
INSERT INTO `user_currency` VALUES ('250', '2866', '3', '0.0000', '1543648001');
INSERT INTO `user_currency` VALUES ('251', '2866', '4', '0.0000', '1543648013');
INSERT INTO `user_currency` VALUES ('252', '3043', '2', '1000000.0000', '1543677914');
INSERT INTO `user_currency` VALUES ('253', '5046', '2', '1000000.0000', '1543726839');
INSERT INTO `user_currency` VALUES ('254', '4094', '2', '1000000.0000', '1543735469');
INSERT INTO `user_currency` VALUES ('255', '4094', '3', '0.0000', '1543736341');
INSERT INTO `user_currency` VALUES ('256', '4094', '4', '0.0000', '1543736362');
INSERT INTO `user_currency` VALUES ('257', '4094', '5', '0.0000', '1543736368');
INSERT INTO `user_currency` VALUES ('258', '3741', '2', '1000000.0000', '1543738541');
INSERT INTO `user_currency` VALUES ('259', '4364', '2', '1000000.0000', '1543745906');
INSERT INTO `user_currency` VALUES ('260', '4568', '2', '1000000.0000', '1543747430');
INSERT INTO `user_currency` VALUES ('261', '5063', '7', '0.0000', '1543765597');
INSERT INTO `user_currency` VALUES ('262', '4507', '3', '0.0000', '1543814874');
INSERT INTO `user_currency` VALUES ('263', '4975', '6', '0.0000', '1543823233');
INSERT INTO `user_currency` VALUES ('264', '2957', '3', '0.0000', '1543843886');
INSERT INTO `user_currency` VALUES ('265', '4539', '5', '0.0000', '1543844490');
INSERT INTO `user_currency` VALUES ('266', '4539', '7', '0.0000', '1543844565');
INSERT INTO `user_currency` VALUES ('267', '4778', '4', '0.0000', '1543869754');
INSERT INTO `user_currency` VALUES ('268', '3185', '3', '0.0000', '1543883786');
INSERT INTO `user_currency` VALUES ('269', '4975', '4', '0.0000', '1543888064');
INSERT INTO `user_currency` VALUES ('270', '4906', '4', '0.0000', '1543950961');
INSERT INTO `user_currency` VALUES ('271', '4812', '3', '0.0000', '1544018281');
INSERT INTO `user_currency` VALUES ('272', '3765', '4', '0.0000', '1544031015');
INSERT INTO `user_currency` VALUES ('273', '3237', '6', '0.0000', '1544062743');
INSERT INTO `user_currency` VALUES ('274', '5147', '7', '0.0000', '1544064963');
INSERT INTO `user_currency` VALUES ('275', '5147', '3', '0.0000', '1544065124');
INSERT INTO `user_currency` VALUES ('276', '4896', '4', '0.0000', '1544080558');
INSERT INTO `user_currency` VALUES ('277', '4455', '7', '0.0000', '1544101676');
INSERT INTO `user_currency` VALUES ('278', '3043', '7', '0.0000', '1544108633');
INSERT INTO `user_currency` VALUES ('279', '3043', '3', '0.0000', '1544108660');
INSERT INTO `user_currency` VALUES ('280', '3530', '6', '0.0000', '1544117232');
INSERT INTO `user_currency` VALUES ('281', '5194', '3', '0.0000', '1544153180');
INSERT INTO `user_currency` VALUES ('282', '4922', '7', '0.0000', '1544165246');
INSERT INTO `user_currency` VALUES ('283', '4927', '7', '0.0000', '1544181625');
INSERT INTO `user_currency` VALUES ('284', '5211', '3', '0.0000', '1544190034');
INSERT INTO `user_currency` VALUES ('285', '2770', '4', '0.0000', '1544221719');
INSERT INTO `user_currency` VALUES ('286', '4066', '7', '0.0000', '1544241745');
INSERT INTO `user_currency` VALUES ('287', '4880', '7', '0.0000', '1544300063');
INSERT INTO `user_currency` VALUES ('288', '2911', '7', '0.0000', '1544309009');
INSERT INTO `user_currency` VALUES ('289', '5195', '5', '0.0000', '1544397170');
INSERT INTO `user_currency` VALUES ('290', '3966', '4', '0.0000', '1544404811');
INSERT INTO `user_currency` VALUES ('291', '2726', '4', '0.0000', '1544405240');
INSERT INTO `user_currency` VALUES ('292', '3934', '4', '0.0000', '1544441433');
INSERT INTO `user_currency` VALUES ('293', '3193', '4', '0.0000', '1544472711');
INSERT INTO `user_currency` VALUES ('294', '3237', '4', '0.0000', '1544496177');

-- ----------------------------
-- Table structure for user_invite_code
-- ----------------------------
DROP TABLE IF EXISTS `user_invite_code`;
CREATE TABLE `user_invite_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `invite_code` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invite_code` (`invite_code`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_invite_code
-- ----------------------------
INSERT INTO `user_invite_code` VALUES ('66', '79', 'nzPtiAzK79');
INSERT INTO `user_invite_code` VALUES ('68', '81', '31Fpw9so81');
INSERT INTO `user_invite_code` VALUES ('69', '82', '7o3yHzhj82');
INSERT INTO `user_invite_code` VALUES ('71', '84', 'sIhrsrN084');
INSERT INTO `user_invite_code` VALUES ('72', '85', 'OMNKONfb85');
INSERT INTO `user_invite_code` VALUES ('73', '86', 'n0bElb2q86');
INSERT INTO `user_invite_code` VALUES ('74', '87', 'm6KQ9hxA87');
INSERT INTO `user_invite_code` VALUES ('75', '88', '9pX0D4aC88');
INSERT INTO `user_invite_code` VALUES ('76', '89', 'VKWKQdLY89');
INSERT INTO `user_invite_code` VALUES ('77', '90', 'ukymKBIz90');
INSERT INTO `user_invite_code` VALUES ('78', '91', 'Uby4KvpG91');
INSERT INTO `user_invite_code` VALUES ('80', '93', 'Kv8ilxSY93');
INSERT INTO `user_invite_code` VALUES ('81', '94', 'Qd0UNaqk94');
INSERT INTO `user_invite_code` VALUES ('82', '95', 'cf2nHTc295');
INSERT INTO `user_invite_code` VALUES ('83', '92', 'iHrDf7dX92');
INSERT INTO `user_invite_code` VALUES ('87', '96', 'QN1f5iox96');
INSERT INTO `user_invite_code` VALUES ('88', '97', 'Ov9Lllsq97');
INSERT INTO `user_invite_code` VALUES ('89', '98', 'Cgvdxmq798');
INSERT INTO `user_invite_code` VALUES ('90', '99', 'Op9ZotIX99');
INSERT INTO `user_invite_code` VALUES ('91', '100', 'z3NBp6Cr100');
INSERT INTO `user_invite_code` VALUES ('92', '101', 'dqGg1Qmd101');
INSERT INTO `user_invite_code` VALUES ('93', '102', 'wrwZimS7102');
INSERT INTO `user_invite_code` VALUES ('94', '103', 'cMCLEX5V103');
INSERT INTO `user_invite_code` VALUES ('95', '104', 'iCpTBokG104');

-- ----------------------------
-- Table structure for user_jewel_log
-- ----------------------------
DROP TABLE IF EXISTS `user_jewel_log`;
CREATE TABLE `user_jewel_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `jewel` decimal(16,8) NOT NULL COMMENT '变化的魔石',
  `old` decimal(16,8) NOT NULL COMMENT '原来的魔石',
  `new` decimal(16,8) NOT NULL COMMENT '变化后的魔石',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=506 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_jewel_log
-- ----------------------------
INSERT INTO `user_jewel_log` VALUES ('505', '79', '0.00000000', '0.00000000', '0.00000000', '123', '0');

-- ----------------------------
-- Table structure for user_magic_log
-- ----------------------------
DROP TABLE IF EXISTS `user_magic_log`;
CREATE TABLE `user_magic_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `magic` decimal(16,8) NOT NULL COMMENT '变化的魔石',
  `old` decimal(16,8) NOT NULL COMMENT '原来的魔石',
  `new` decimal(16,8) NOT NULL COMMENT '变化后的魔石',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `types` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `type` (`types`)
) ENGINE=MyISAM AUTO_INCREMENT=1192 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_magic_log
-- ----------------------------
INSERT INTO `user_magic_log` VALUES ('1120', '90', '120.00000000', '0.00000000', '0.00000000', '推广三代奖励', '4', '1543763898');
INSERT INTO `user_magic_log` VALUES ('1121', '90', '120.00000000', '0.00000000', '0.00000000', '推广三代奖励', '4', '1543763925');
INSERT INTO `user_magic_log` VALUES ('1122', '90', '120.00000000', '0.00000000', '0.00000000', '推广三代奖励', '4', '1543763926');
INSERT INTO `user_magic_log` VALUES ('1123', '90', '120.00000000', '0.00000000', '0.00000000', '推广三代奖励', '4', '1543763928');
INSERT INTO `user_magic_log` VALUES ('1124', '90', '120.00000000', '0.00000000', '0.00000000', '推广三代奖励', '4', '1543763931');
INSERT INTO `user_magic_log` VALUES ('1125', '90', '120.00000000', '0.00000000', '0.00000000', '推广三代奖励', '4', '1543763933');
INSERT INTO `user_magic_log` VALUES ('1126', '90', '120.00000000', '0.00000000', '0.00000000', '推广三代奖励', '4', '1543763934');
INSERT INTO `user_magic_log` VALUES ('1127', '90', '120.00000000', '0.00000000', '0.00000000', '推广三代奖励', '4', '1543763936');
INSERT INTO `user_magic_log` VALUES ('1128', '90', '120.00000000', '0.00000000', '0.00000000', '推广三代奖励', '4', '1543763937');
INSERT INTO `user_magic_log` VALUES ('1129', '90', '120.00000000', '0.00000000', '0.00000000', '推广三代奖励', '4', '1543763939');
INSERT INTO `user_magic_log` VALUES ('1130', '90', '100.00000000', '0.00000000', '0.00000000', '推广三代奖励', '4', '1543763941');
INSERT INTO `user_magic_log` VALUES ('1131', '91', '18.28036710', '0.00000000', '14.62429368', '矿机[763898913]收益1天', '5', '1543766328');
INSERT INTO `user_magic_log` VALUES ('1132', '91', '18.28630845', '14.62429368', '29.25334044', '矿机[763925913]收益1天', '5', '1543766328');
INSERT INTO `user_magic_log` VALUES ('1133', '91', '18.28635345', '29.25334044', '43.88242320', '矿机[763926913]收益1天', '5', '1543766328');
INSERT INTO `user_magic_log` VALUES ('1134', '91', '18.28679830', '43.88242320', '58.51186184', '矿机[763928913]收益1天', '5', '1543766328');
INSERT INTO `user_magic_log` VALUES ('1135', '91', '18.28763474', '58.51186184', '73.14196963', '矿机[763931913]收益1天', '5', '1543766328');
INSERT INTO `user_magic_log` VALUES ('1136', '91', '18.28844378', '73.14196963', '87.77272465', '矿机[763933913]收益1天', '5', '1543766328');
INSERT INTO `user_magic_log` VALUES ('1137', '91', '18.28821570', '87.77272465', '102.40329721', '矿机[763934913]收益1天', '5', '1543766328');
INSERT INTO `user_magic_log` VALUES ('1138', '91', '18.28910121', '102.40329721', '117.03457817', '矿机[763936913]收益1天', '5', '1543766328');
INSERT INTO `user_magic_log` VALUES ('1139', '91', '18.28904817', '117.03457817', '131.66581670', '矿机[763937913]收益1天', '5', '1543766329');
INSERT INTO `user_magic_log` VALUES ('1140', '91', '18.28944746', '131.66581670', '146.29737466', '矿机[763939913]收益1天', '5', '1543766329');
INSERT INTO `user_magic_log` VALUES ('1141', '91', '18.28994185', '146.29737466', '160.92932814', '矿机[763941913]收益1天', '5', '1543766329');
INSERT INTO `user_magic_log` VALUES ('1142', '91', '18.29056624', '160.92932814', '175.56178113', '矿机[763944913]收益1天', '5', '1543766329');
INSERT INTO `user_magic_log` VALUES ('1143', '91', '18.29046398', '175.56178113', '190.19415231', '矿机[763946913]收益1天', '5', '1543766329');
INSERT INTO `user_magic_log` VALUES ('1144', '91', '18.29484688', '190.19415231', '204.83002981', '矿机[763965913]收益1天', '5', '1543766329');
INSERT INTO `user_magic_log` VALUES ('1145', '91', '1.00000000', '0.00000000', '0.00000000', '下级矿机分红', '11', '1543766751');
INSERT INTO `user_magic_log` VALUES ('1146', '91', '-200.00000000', '205.63002981', '5.63002981', '自由RCRC购买商品', '1', '1543950942');
INSERT INTO `user_magic_log` VALUES ('1147', '91', '-2.20000000', '0.00000000', '0.00000000', '转出', '9', '1544031335');
INSERT INTO `user_magic_log` VALUES ('1148', '90', '2.00000000', '0.00000000', '0.00000000', '转入', '10', '1544031335');
INSERT INTO `user_magic_log` VALUES ('1149', '91', '-1.10000000', '0.00000000', '0.00000000', '转出', '9', '1544079222');
INSERT INTO `user_magic_log` VALUES ('1150', '90', '1.00000000', '0.00000000', '0.00000000', '转入', '10', '1544079222');
INSERT INTO `user_magic_log` VALUES ('1151', '90', '1.20000000', '0.00000000', '0.00000000', '推广三代奖励', '4', '1544114718');
INSERT INTO `user_magic_log` VALUES ('1152', '90', '-1.30000000', '2391.16000000', '2389.86000000', '卖出交易', '3', '1544281831');
INSERT INTO `user_magic_log` VALUES ('1153', '90', '-1.10000000', '0.00000000', '0.00000000', '转出', '9', '1544284442');
INSERT INTO `user_magic_log` VALUES ('1154', '91', '1.00000000', '0.00000000', '0.00000000', '转入', '10', '1544284442');
INSERT INTO `user_magic_log` VALUES ('1155', '90', '-100.00000000', '260.24000000', '160.24000000', '自由RCRC购买商品', '1', '1544501128');
INSERT INTO `user_magic_log` VALUES ('1156', '90', '3.00000000', '2388.76000000', '2391.76000000', '奖励补算', '15', '1544988697');
INSERT INTO `user_magic_log` VALUES ('1157', '91', '18.82556150', '3.33002981', '18.39047901', '矿机[763898913]收益2天', '5', '1545722545');
INSERT INTO `user_magic_log` VALUES ('1158', '91', '18.82522560', '18.39047901', '33.45065949', '矿机[763925913]收益2天', '5', '1545722545');
INSERT INTO `user_magic_log` VALUES ('1159', '91', '18.82588340', '33.45065949', '48.51136621', '矿机[763926913]收益2天', '5', '1545722545');
INSERT INTO `user_magic_log` VALUES ('1160', '91', '18.82522220', '48.51136621', '63.57154397', '矿机[763928913]收益2天', '5', '1545722546');
INSERT INTO `user_magic_log` VALUES ('1161', '91', '18.82548210', '63.57154397', '78.63192965', '矿机[763931913]收益2天', '5', '1545722546');
INSERT INTO `user_magic_log` VALUES ('1162', '91', '18.82527620', '78.63192965', '93.69215061', '矿机[763933913]收益2天', '5', '1545722546');
INSERT INTO `user_magic_log` VALUES ('1163', '91', '18.82579750', '93.69215061', '108.75278861', '矿机[763934913]收益2天', '5', '1545722546');
INSERT INTO `user_magic_log` VALUES ('1164', '91', '18.82570890', '108.75278861', '123.81335573', '矿机[763936913]收益2天', '5', '1545722546');
INSERT INTO `user_magic_log` VALUES ('1165', '91', '18.82523620', '123.81335573', '138.87354469', '矿机[763937913]收益2天', '5', '1545722546');
INSERT INTO `user_magic_log` VALUES ('1166', '91', '18.82543400', '138.87354469', '153.93389189', '矿机[763939913]收益2天', '5', '1545722546');
INSERT INTO `user_magic_log` VALUES ('1167', '91', '18.82513940', '153.93389189', '168.99400341', '矿机[763941913]收益2天', '5', '1545722546');
INSERT INTO `user_magic_log` VALUES ('1168', '91', '18.82511700', '168.99400341', '184.05409701', '矿机[763944913]收益2天', '5', '1545722546');
INSERT INTO `user_magic_log` VALUES ('1169', '91', '18.82533550', '184.05409701', '199.11436541', '矿机[763946913]收益2天', '5', '1545722546');
INSERT INTO `user_magic_log` VALUES ('1170', '91', '18.82570690', '199.11436541', '214.17493093', '矿机[763965913]收益2天', '5', '1545722546');
INSERT INTO `user_magic_log` VALUES ('1171', '91', '7.92082245', '214.17493093', '220.51158889', '矿机[114718911]收益1天', '5', '1545722546');
INSERT INTO `user_magic_log` VALUES ('1172', '90', '6565.80000000', '2388.76000000', '7641.40000000', '矿机[]收益1天', '5', '1545722546');
INSERT INTO `user_magic_log` VALUES ('1173', '90', '2.62133078', '7641.40000000', '7643.49706462', '矿机[152607901]收益1天', '5', '1545722546');
INSERT INTO `user_magic_log` VALUES ('1174', '90', '1.93320659', '7643.49706462', '7645.04362989', '矿机[288173901]收益1天', '5', '1545722546');
INSERT INTO `user_magic_log` VALUES ('1175', '91', '18.82536540', '220.51158889', '235.57188121', '矿机[763898913]收益3天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1176', '91', '18.82514540', '235.57188121', '250.63199753', '矿机[763925913]收益3天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1177', '91', '18.82510620', '250.63199753', '265.69208249', '矿机[763926913]收益3天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1178', '91', '18.82573260', '265.69208249', '280.75266857', '矿机[763928913]收益3天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1179', '91', '18.82553240', '280.75266857', '295.81309449', '矿机[763931913]收益3天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1180', '91', '18.82571150', '295.81309449', '310.87366369', '矿机[763933913]收益3天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1181', '91', '18.82593760', '310.87366369', '325.93441377', '矿机[763934913]收益3天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1182', '91', '18.82536860', '325.93441377', '340.99470865', '矿机[763936913]收益3天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1183', '91', '18.82533900', '340.99470865', '356.05497985', '矿机[763937913]收益3天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1184', '91', '18.82512370', '356.05497985', '371.11507881', '矿机[763939913]收益3天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1185', '91', '18.82513090', '371.11507881', '386.17518353', '矿机[763941913]收益3天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1186', '91', '18.82532840', '386.17518353', '401.23544625', '矿机[763944913]收益3天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1187', '91', '18.82579970', '401.23544625', '416.29608601', '矿机[763946913]收益3天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1188', '91', '18.82552880', '416.29608601', '431.35650905', '矿机[763965913]收益3天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1189', '91', '0.44085530', '431.35650905', '431.70919329', '矿机[114718911]收益2天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1190', '90', '0.44035320', '7645.04362989', '7645.39591245', '矿机[152607901]收益2天', '5', '1545738164');
INSERT INTO `user_magic_log` VALUES ('1191', '90', '0.44076290', '7645.39591245', '7645.74852277', '矿机[288173901]收益2天', '5', '1545738164');

-- ----------------------------
-- Table structure for user_mbo_turn_log
-- ----------------------------
DROP TABLE IF EXISTS `user_mbo_turn_log`;
CREATE TABLE `user_mbo_turn_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(225) NOT NULL COMMENT '转出人昵称',
  `other_id` int(11) NOT NULL COMMENT '交易人id',
  `other_name` varchar(225) DEFAULT NULL COMMENT '交易人昵称',
  `other_mobile` char(15) NOT NULL COMMENT '交易人电话号',
  `other_magic` decimal(16,8) DEFAULT NULL COMMENT '交易mbo',
  `shouxufei` decimal(16,8) DEFAULT NULL COMMENT '手续费',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `other_id` (`other_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='虚拟币转账记录表';

-- ----------------------------
-- Records of user_mbo_turn_log
-- ----------------------------
INSERT INTO `user_mbo_turn_log` VALUES ('26', '81', '1', '84', '111', '17620500549', '10.00000000', '1.00000000', '1542719553');
INSERT INTO `user_mbo_turn_log` VALUES ('27', '81', '1', '84', '111', '17620500549', '10.00000000', '1.00000000', '1542719719');
INSERT INTO `user_mbo_turn_log` VALUES ('28', '91', 'test1', '90', 'test', '18749528034', '2.00000000', '0.20000000', '1544031335');
INSERT INTO `user_mbo_turn_log` VALUES ('29', '91', 'test1', '90', 'test', '18749528034', '1.00000000', '0.10000000', '1544079222');
INSERT INTO `user_mbo_turn_log` VALUES ('30', '90', 'test', '91', 'test1', '18749528033', '1.00000000', '0.10000000', '1544284442');

-- ----------------------------
-- Table structure for user_product
-- ----------------------------
DROP TABLE IF EXISTS `user_product`;
CREATE TABLE `user_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` tinyint(3) DEFAULT NULL COMMENT '产品id',
  `product_number` varchar(20) DEFAULT NULL COMMENT '产品number',
  `yestoday` decimal(16,8) DEFAULT NULL COMMENT '昨日开采',
  `total` decimal(16,8) DEFAULT NULL COMMENT '总开采',
  `buy_time` int(11) DEFAULT NULL COMMENT '购买时间',
  `end_time` int(11) DEFAULT NULL COMMENT '到期时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态：1：运行中；0：已过期',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `total_day` int(11) DEFAULT NULL COMMENT '周期',
  `balance_day` int(11) DEFAULT '0' COMMENT '已结算天数',
  `last_time` int(11) DEFAULT '0' COMMENT '上次结算时间',
  `types` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：后台发放；2：购买，3：升级赠送，4:注册赠送',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `end_time` (`end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_product
-- ----------------------------
INSERT INTO `user_product` VALUES ('35', '3', '763898913', '18.82536540', '55.93129400', '1543763898', '1551539898', '1', '91', '90', '3', '1545738164', '2');
INSERT INTO `user_product` VALUES ('36', '3', '763925913', '18.82514540', '55.93667945', '1543763925', '1551539925', '1', '91', '90', '3', '1545738164', '2');
INSERT INTO `user_product` VALUES ('37', '3', '763926913', '18.82510620', '55.93734305', '1543763926', '1551539926', '1', '91', '90', '3', '1545738164', '2');
INSERT INTO `user_product` VALUES ('38', '3', '763928913', '18.82573260', '55.93775310', '1543763928', '1551539928', '1', '91', '90', '3', '1545738164', '2');
INSERT INTO `user_product` VALUES ('39', '3', '763931913', '18.82553240', '55.93864924', '1543763931', '1551539931', '1', '91', '90', '3', '1545738164', '2');
INSERT INTO `user_product` VALUES ('40', '3', '763933913', '18.82571150', '55.93943148', '1543763933', '1551539933', '1', '91', '90', '3', '1545738164', '2');
INSERT INTO `user_product` VALUES ('41', '3', '763934913', '18.82593760', '55.93995080', '1543763934', '1551539934', '1', '91', '90', '3', '1545738164', '2');
INSERT INTO `user_product` VALUES ('42', '3', '763936913', '18.82536860', '55.94017871', '1543763936', '1551539936', '1', '91', '90', '3', '1545738164', '2');
INSERT INTO `user_product` VALUES ('43', '3', '763937913', '18.82533900', '55.93962337', '1543763937', '1551539937', '1', '91', '90', '3', '1545738164', '2');
INSERT INTO `user_product` VALUES ('44', '3', '763939913', '18.82512370', '55.94000516', '1543763939', '1551539939', '1', '91', '90', '3', '1545738164', '2');
INSERT INTO `user_product` VALUES ('45', '3', '763941913', '18.82513090', '55.94021215', '1543763941', '1551539941', '1', '91', '90', '3', '1545738164', '2');
INSERT INTO `user_product` VALUES ('46', '3', '763944913', '18.82532840', '55.94101164', '1543763944', '1551539944', '1', '91', '90', '3', '1545738164', '2');
INSERT INTO `user_product` VALUES ('47', '3', '763946913', '18.82579970', '55.94159918', '1543763946', '1551539946', '1', '91', '90', '3', '1545738164', '2');
INSERT INTO `user_product` VALUES ('48', '3', '763965913', '18.82552880', '55.94608258', '1543763965', '1551539965', '1', '91', '90', '3', '1545738164', '2');
INSERT INTO `user_product` VALUES ('49', '1', '114718911', '0.44085530', '8.36167775', '1544114718', '1575218718', '1', '91', '360', '2', '1545738164', '2');
INSERT INTO `user_product` VALUES ('50', '4', null, '6565.80000000', '6565.80000000', null, null, '0', '90', null, '1', '1545722546', '1');
INSERT INTO `user_product` VALUES ('51', '1', '152607901', '0.44035320', '3.06168398', '1545152607', '1576256607', '1', '90', '360', '2', '1545738164', '2');
INSERT INTO `user_product` VALUES ('52', '1', '288173901', '0.44076290', '2.37396949', '1545288173', '1576392173', '1', '90', '360', '2', '1545738164', '2');

-- ----------------------------
-- Table structure for user_total_log
-- ----------------------------
DROP TABLE IF EXISTS `user_total_log`;
CREATE TABLE `user_total_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `num` decimal(16,2) NOT NULL COMMENT '变化业绩的数量',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `types` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `type` (`types`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='业绩明细表';

-- ----------------------------
-- Records of user_total_log
-- ----------------------------
INSERT INTO `user_total_log` VALUES ('6', '85', '10.00', '下级购买矿机', '1', '1543051618');
INSERT INTO `user_total_log` VALUES ('7', '85', '10.00', '下级购买矿机', '1', '1543051620');
INSERT INTO `user_total_log` VALUES ('8', '85', '100.00', '下级购买矿机', '1', '1543051622');
INSERT INTO `user_total_log` VALUES ('9', '85', '100.00', '下级购买矿机', '1', '1543052070');
INSERT INTO `user_total_log` VALUES ('10', '85', '10.00', '下级购买矿机', '1', '1543052090');
INSERT INTO `user_total_log` VALUES ('11', '85', '10.00', '下级购买矿机', '1', '1543052104');
INSERT INTO `user_total_log` VALUES ('12', '81', '10.00', '下级购买矿机', '1', '1543066358');
INSERT INTO `user_total_log` VALUES ('13', '81', '100.00', '下级购买矿机', '1', '1543067787');
INSERT INTO `user_total_log` VALUES ('14', '82', '100.00', '下级18749528033购买矿机', '1', '1543735859');
INSERT INTO `user_total_log` VALUES ('15', '82', '900.00', '下级18749528033升级矿机', '2', '1543739239');
INSERT INTO `user_total_log` VALUES ('16', '82', '1000.00', '下级18749528033购买矿机', '1', '1543741566');
INSERT INTO `user_total_log` VALUES ('17', '90', '100.00', '下级18749528033购买矿机', '1', '1543757576');
INSERT INTO `user_total_log` VALUES ('18', '82', '100.00', '下级18749528033购买矿机', '1', '1543757576');
INSERT INTO `user_total_log` VALUES ('19', '90', '100.00', '下级18749528033购买矿机', '1', '1543757590');
INSERT INTO `user_total_log` VALUES ('20', '82', '100.00', '下级18749528033购买矿机', '1', '1543757590');
INSERT INTO `user_total_log` VALUES ('21', '90', '100.00', '下级18749528033购买矿机', '1', '1543757593');
INSERT INTO `user_total_log` VALUES ('22', '82', '100.00', '下级18749528033购买矿机', '1', '1543757593');
INSERT INTO `user_total_log` VALUES ('23', '90', '100.00', '下级18749528033购买矿机', '1', '1543757596');
INSERT INTO `user_total_log` VALUES ('24', '82', '100.00', '下级18749528033购买矿机', '1', '1543757596');
INSERT INTO `user_total_log` VALUES ('25', '90', '100.00', '下级18749528033购买矿机', '1', '1543757597');
INSERT INTO `user_total_log` VALUES ('26', '82', '100.00', '下级18749528033购买矿机', '1', '1543757597');
INSERT INTO `user_total_log` VALUES ('27', '90', '100.00', '下级18749528033购买矿机', '1', '1543757599');
INSERT INTO `user_total_log` VALUES ('28', '82', '100.00', '下级18749528033购买矿机', '1', '1543757599');
INSERT INTO `user_total_log` VALUES ('29', '90', '100.00', '下级18749528033购买矿机', '1', '1543757601');
INSERT INTO `user_total_log` VALUES ('30', '82', '100.00', '下级18749528033购买矿机', '1', '1543757601');
INSERT INTO `user_total_log` VALUES ('31', '90', '100.00', '下级18749528033购买矿机', '1', '1543757603');
INSERT INTO `user_total_log` VALUES ('32', '82', '100.00', '下级18749528033购买矿机', '1', '1543757603');
INSERT INTO `user_total_log` VALUES ('33', '90', '100.00', '下级18749528033购买矿机', '1', '1543757620');
INSERT INTO `user_total_log` VALUES ('34', '82', '100.00', '下级18749528033购买矿机', '1', '1543757620');
INSERT INTO `user_total_log` VALUES ('35', '90', '100.00', '下级18749528033购买矿机', '1', '1543757623');
INSERT INTO `user_total_log` VALUES ('36', '82', '100.00', '下级18749528033购买矿机', '1', '1543757623');
INSERT INTO `user_total_log` VALUES ('37', '90', '100.00', '下级18749528033购买矿机', '1', '1543757631');
INSERT INTO `user_total_log` VALUES ('38', '82', '100.00', '下级18749528033购买矿机', '1', '1543757631');
INSERT INTO `user_total_log` VALUES ('39', '90', '100.00', '下级18749528033购买矿机', '1', '1543757635');
INSERT INTO `user_total_log` VALUES ('40', '82', '100.00', '下级18749528033购买矿机', '1', '1543757635');
INSERT INTO `user_total_log` VALUES ('41', '90', '100.00', '下级18749528033购买矿机', '1', '1543757643');
INSERT INTO `user_total_log` VALUES ('42', '82', '100.00', '下级18749528033购买矿机', '1', '1543757643');
INSERT INTO `user_total_log` VALUES ('43', '90', '1000.00', '下级18749528033购买矿机', '1', '1543757654');
INSERT INTO `user_total_log` VALUES ('44', '82', '1000.00', '下级18749528033购买矿机', '1', '1543757654');
INSERT INTO `user_total_log` VALUES ('45', '90', '1000.00', '下级18749528033购买矿机', '1', '1543757757');
INSERT INTO `user_total_log` VALUES ('46', '82', '1000.00', '下级18749528033购买矿机', '1', '1543757757');
INSERT INTO `user_total_log` VALUES ('47', '90', '6250.00', '下级18749528033购买矿机', '1', '1543757793');
INSERT INTO `user_total_log` VALUES ('48', '82', '6250.00', '下级18749528033购买矿机', '1', '1543757793');
INSERT INTO `user_total_log` VALUES ('49', '90', '6250.00', '下级18749528033购买矿机', '1', '1543757976');
INSERT INTO `user_total_log` VALUES ('50', '82', '6250.00', '下级18749528033购买矿机', '1', '1543757976');
INSERT INTO `user_total_log` VALUES ('51', '90', '1000.00', '下级18749528033购买矿机', '1', '1543758059');
INSERT INTO `user_total_log` VALUES ('52', '82', '1000.00', '下级18749528033购买矿机', '1', '1543758059');
INSERT INTO `user_total_log` VALUES ('53', '90', '1000.00', '下级18749528033购买矿机', '1', '1543758061');
INSERT INTO `user_total_log` VALUES ('54', '82', '1000.00', '下级18749528033购买矿机', '1', '1543758061');
INSERT INTO `user_total_log` VALUES ('55', '90', '1000.00', '下级18749528033购买矿机', '1', '1543758063');
INSERT INTO `user_total_log` VALUES ('56', '82', '1000.00', '下级18749528033购买矿机', '1', '1543758063');
INSERT INTO `user_total_log` VALUES ('57', '90', '1000.00', '下级18749528033购买矿机', '1', '1543758065');
INSERT INTO `user_total_log` VALUES ('58', '82', '1000.00', '下级18749528033购买矿机', '1', '1543758065');
INSERT INTO `user_total_log` VALUES ('59', '90', '1000.00', '下级18749528033购买矿机', '1', '1543758080');
INSERT INTO `user_total_log` VALUES ('60', '82', '1000.00', '下级18749528033购买矿机', '1', '1543758080');
INSERT INTO `user_total_log` VALUES ('61', '90', '1000.00', '下级18749528033购买矿机', '1', '1543758082');
INSERT INTO `user_total_log` VALUES ('62', '82', '1000.00', '下级18749528033购买矿机', '1', '1543758082');
INSERT INTO `user_total_log` VALUES ('63', '90', '1000.00', '下级18749528033购买矿机', '1', '1543758084');
INSERT INTO `user_total_log` VALUES ('64', '82', '1000.00', '下级18749528033购买矿机', '1', '1543758084');
INSERT INTO `user_total_log` VALUES ('65', '90', '1000.00', '下级18749528033购买矿机', '1', '1543758086');
INSERT INTO `user_total_log` VALUES ('66', '82', '1000.00', '下级18749528033购买矿机', '1', '1543758086');
INSERT INTO `user_total_log` VALUES ('67', '90', '1000.00', '下级18749528033购买矿机', '1', '1543758088');
INSERT INTO `user_total_log` VALUES ('68', '82', '1000.00', '下级18749528033购买矿机', '1', '1543758088');
INSERT INTO `user_total_log` VALUES ('69', '90', '1000.00', '下级18749528033购买矿机', '1', '1543758092');
INSERT INTO `user_total_log` VALUES ('70', '82', '1000.00', '下级18749528033购买矿机', '1', '1543758092');
INSERT INTO `user_total_log` VALUES ('71', '90', '1000.00', '下级18749528033购买矿机', '1', '1543758093');
INSERT INTO `user_total_log` VALUES ('72', '82', '1000.00', '下级18749528033购买矿机', '1', '1543758093');
INSERT INTO `user_total_log` VALUES ('73', '90', '1000.00', '下级18749528033购买矿机', '1', '1543758095');
INSERT INTO `user_total_log` VALUES ('74', '82', '1000.00', '下级18749528033购买矿机', '1', '1543758095');
INSERT INTO `user_total_log` VALUES ('75', '90', '1000.00', '下级18749528033购买矿机', '1', '1543758098');
INSERT INTO `user_total_log` VALUES ('76', '82', '1000.00', '下级18749528033购买矿机', '1', '1543758098');
INSERT INTO `user_total_log` VALUES ('77', '90', '1000.00', '下级18749528033购买矿机', '1', '1543763898');
INSERT INTO `user_total_log` VALUES ('78', '82', '1000.00', '下级18749528033购买矿机', '1', '1543763898');
INSERT INTO `user_total_log` VALUES ('79', '90', '1000.00', '下级18749528033购买矿机', '1', '1543763925');
INSERT INTO `user_total_log` VALUES ('80', '82', '1000.00', '下级18749528033购买矿机', '1', '1543763925');
INSERT INTO `user_total_log` VALUES ('81', '90', '1000.00', '下级18749528033购买矿机', '1', '1543763926');
INSERT INTO `user_total_log` VALUES ('82', '82', '1000.00', '下级18749528033购买矿机', '1', '1543763926');
INSERT INTO `user_total_log` VALUES ('83', '90', '1000.00', '下级18749528033购买矿机', '1', '1543763928');
INSERT INTO `user_total_log` VALUES ('84', '82', '1000.00', '下级18749528033购买矿机', '1', '1543763928');
INSERT INTO `user_total_log` VALUES ('85', '90', '1000.00', '下级18749528033购买矿机', '1', '1543763931');
INSERT INTO `user_total_log` VALUES ('86', '82', '1000.00', '下级18749528033购买矿机', '1', '1543763931');
INSERT INTO `user_total_log` VALUES ('87', '90', '1000.00', '下级18749528033购买矿机', '1', '1543763933');
INSERT INTO `user_total_log` VALUES ('88', '82', '1000.00', '下级18749528033购买矿机', '1', '1543763933');
INSERT INTO `user_total_log` VALUES ('89', '90', '1000.00', '下级18749528033购买矿机', '1', '1543763934');
INSERT INTO `user_total_log` VALUES ('90', '82', '1000.00', '下级18749528033购买矿机', '1', '1543763934');
INSERT INTO `user_total_log` VALUES ('91', '90', '1000.00', '下级18749528033购买矿机', '1', '1543763936');
INSERT INTO `user_total_log` VALUES ('92', '82', '1000.00', '下级18749528033购买矿机', '1', '1543763936');
INSERT INTO `user_total_log` VALUES ('93', '90', '1000.00', '下级18749528033购买矿机', '1', '1543763937');
INSERT INTO `user_total_log` VALUES ('94', '82', '1000.00', '下级18749528033购买矿机', '1', '1543763937');
INSERT INTO `user_total_log` VALUES ('95', '90', '1000.00', '下级18749528033购买矿机', '1', '1543763939');
INSERT INTO `user_total_log` VALUES ('96', '82', '1000.00', '下级18749528033购买矿机', '1', '1543763939');
INSERT INTO `user_total_log` VALUES ('97', '90', '1000.00', '下级18749528033购买矿机', '1', '1543763941');
INSERT INTO `user_total_log` VALUES ('98', '82', '1000.00', '下级18749528033购买矿机', '1', '1543763941');
INSERT INTO `user_total_log` VALUES ('99', '90', '1000.00', '下级18749528033购买矿机', '1', '1543763944');
INSERT INTO `user_total_log` VALUES ('100', '82', '1000.00', '下级18749528033购买矿机', '1', '1543763944');
INSERT INTO `user_total_log` VALUES ('101', '90', '1000.00', '下级18749528033购买矿机', '1', '1543763946');
INSERT INTO `user_total_log` VALUES ('102', '82', '1000.00', '下级18749528033购买矿机', '1', '1543763946');
INSERT INTO `user_total_log` VALUES ('103', '90', '1000.00', '下级18749528033购买矿机', '1', '1543763965');
INSERT INTO `user_total_log` VALUES ('104', '82', '1000.00', '下级18749528033购买矿机', '1', '1543763965');
INSERT INTO `user_total_log` VALUES ('105', '90', '10.00', '下级18749528033购买矿机', '1', '1544114718');
INSERT INTO `user_total_log` VALUES ('106', '82', '10.00', '下级18749528033购买矿机', '1', '1544114718');
INSERT INTO `user_total_log` VALUES ('107', '82', '5250.00', '下级18749528034升级矿机', '2', '1544988697');
INSERT INTO `user_total_log` VALUES ('108', '82', '10.00', '下级18749528034购买矿机', '1', '1545152607');
INSERT INTO `user_total_log` VALUES ('109', '82', '10.00', '下级18749528034购买矿机', '1', '1545288173');

-- ----------------------------
-- Table structure for user_yue_log
-- ----------------------------
DROP TABLE IF EXISTS `user_yue_log`;
CREATE TABLE `user_yue_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `yue` decimal(16,2) NOT NULL COMMENT '变化的余额',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `types` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `just_yue` decimal(16,2) NOT NULL COMMENT '变化余额的正整数',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `type` (`types`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='余额明细表';

-- ----------------------------
-- Records of user_yue_log
-- ----------------------------
INSERT INTO `user_yue_log` VALUES ('60', '81', '-10.00', '购买小型云矿机', '10', '2018-11-30 11:45:24', '10.00');
INSERT INTO `user_yue_log` VALUES ('61', '92', '5000.00', '系统充值', '1', '2018-11-30 18:45:06', '0.00');
INSERT INTO `user_yue_log` VALUES ('62', '92', '-10.00', '购买小型云矿机', '10', '2018-11-30 18:45:19', '10.00');
INSERT INTO `user_yue_log` VALUES ('63', '92', '-90.00', '矿机升级', '11', '2018-12-01 01:24:29', '90.00');
INSERT INTO `user_yue_log` VALUES ('64', '92', '-900.00', '矿机升级', '11', '2018-12-01 01:27:30', '900.00');
INSERT INTO `user_yue_log` VALUES ('65', '92', '-5250.00', '矿机升级', '11', '2018-12-01 01:33:13', '5250.00');
INSERT INTO `user_yue_log` VALUES ('66', '91', '-100.00', '购买中型云矿机', '10', '2018-12-02 15:30:59', '100.00');
INSERT INTO `user_yue_log` VALUES ('67', '91', '-900.00', '矿机升级', '11', '2018-12-02 16:27:19', '900.00');
INSERT INTO `user_yue_log` VALUES ('68', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 17:06:06', '1000.00');
INSERT INTO `user_yue_log` VALUES ('69', '91', '-100.00', '购买中型云矿机', '10', '2018-12-02 21:32:56', '100.00');
INSERT INTO `user_yue_log` VALUES ('70', '91', '-100.00', '购买中型云矿机', '10', '2018-12-02 21:33:10', '100.00');
INSERT INTO `user_yue_log` VALUES ('71', '91', '-100.00', '购买中型云矿机', '10', '2018-12-02 21:33:13', '100.00');
INSERT INTO `user_yue_log` VALUES ('72', '91', '-100.00', '购买中型云矿机', '10', '2018-12-02 21:33:16', '100.00');
INSERT INTO `user_yue_log` VALUES ('73', '91', '-100.00', '购买中型云矿机', '10', '2018-12-02 21:33:17', '100.00');
INSERT INTO `user_yue_log` VALUES ('74', '91', '-100.00', '购买中型云矿机', '10', '2018-12-02 21:33:19', '100.00');
INSERT INTO `user_yue_log` VALUES ('75', '91', '-100.00', '购买中型云矿机', '10', '2018-12-02 21:33:21', '100.00');
INSERT INTO `user_yue_log` VALUES ('76', '91', '-100.00', '购买中型云矿机', '10', '2018-12-02 21:33:23', '100.00');
INSERT INTO `user_yue_log` VALUES ('77', '91', '-100.00', '购买中型云矿机', '10', '2018-12-02 21:33:40', '100.00');
INSERT INTO `user_yue_log` VALUES ('78', '91', '-100.00', '购买中型云矿机', '10', '2018-12-02 21:33:43', '100.00');
INSERT INTO `user_yue_log` VALUES ('79', '91', '-100.00', '购买中型云矿机', '10', '2018-12-02 21:33:51', '100.00');
INSERT INTO `user_yue_log` VALUES ('80', '91', '-100.00', '购买中型云矿机', '10', '2018-12-02 21:33:55', '100.00');
INSERT INTO `user_yue_log` VALUES ('81', '91', '-100.00', '购买中型云矿机', '10', '2018-12-02 21:34:03', '100.00');
INSERT INTO `user_yue_log` VALUES ('82', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 21:34:14', '1000.00');
INSERT INTO `user_yue_log` VALUES ('83', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 21:35:57', '1000.00');
INSERT INTO `user_yue_log` VALUES ('84', '91', '-6250.00', '购买超级云矿机', '10', '2018-12-02 21:36:33', '6250.00');
INSERT INTO `user_yue_log` VALUES ('85', '91', '-6250.00', '购买超级云矿机', '10', '2018-12-02 21:39:36', '6250.00');
INSERT INTO `user_yue_log` VALUES ('86', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 21:40:59', '1000.00');
INSERT INTO `user_yue_log` VALUES ('87', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 21:41:01', '1000.00');
INSERT INTO `user_yue_log` VALUES ('88', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 21:41:03', '1000.00');
INSERT INTO `user_yue_log` VALUES ('89', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 21:41:05', '1000.00');
INSERT INTO `user_yue_log` VALUES ('90', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 21:41:20', '1000.00');
INSERT INTO `user_yue_log` VALUES ('91', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 21:41:22', '1000.00');
INSERT INTO `user_yue_log` VALUES ('92', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 21:41:24', '1000.00');
INSERT INTO `user_yue_log` VALUES ('93', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 21:41:26', '1000.00');
INSERT INTO `user_yue_log` VALUES ('94', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 21:41:28', '1000.00');
INSERT INTO `user_yue_log` VALUES ('95', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 21:41:32', '1000.00');
INSERT INTO `user_yue_log` VALUES ('96', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 21:41:33', '1000.00');
INSERT INTO `user_yue_log` VALUES ('97', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 21:41:35', '1000.00');
INSERT INTO `user_yue_log` VALUES ('98', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 21:41:38', '1000.00');
INSERT INTO `user_yue_log` VALUES ('99', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 23:18:18', '1000.00');
INSERT INTO `user_yue_log` VALUES ('100', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 23:18:45', '1000.00');
INSERT INTO `user_yue_log` VALUES ('101', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 23:18:46', '1000.00');
INSERT INTO `user_yue_log` VALUES ('102', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 23:18:48', '1000.00');
INSERT INTO `user_yue_log` VALUES ('103', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 23:18:51', '1000.00');
INSERT INTO `user_yue_log` VALUES ('104', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 23:18:53', '1000.00');
INSERT INTO `user_yue_log` VALUES ('105', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 23:18:54', '1000.00');
INSERT INTO `user_yue_log` VALUES ('106', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 23:18:56', '1000.00');
INSERT INTO `user_yue_log` VALUES ('107', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 23:18:57', '1000.00');
INSERT INTO `user_yue_log` VALUES ('108', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 23:18:59', '1000.00');
INSERT INTO `user_yue_log` VALUES ('109', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 23:19:01', '1000.00');
INSERT INTO `user_yue_log` VALUES ('110', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 23:19:04', '1000.00');
INSERT INTO `user_yue_log` VALUES ('111', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 23:19:06', '1000.00');
INSERT INTO `user_yue_log` VALUES ('112', '91', '-1000.00', '购买大型云矿机', '10', '2018-12-02 23:19:25', '1000.00');
INSERT INTO `user_yue_log` VALUES ('113', '91', '-10.00', '购买小型云矿机', '10', '2018-12-07 00:45:18', '10.00');
INSERT INTO `user_yue_log` VALUES ('114', '90', '-5250.00', '矿机升级', '11', '2018-12-17 03:31:37', '5250.00');
INSERT INTO `user_yue_log` VALUES ('115', '90', '-10.00', '购买小型云矿机', '10', '2018-12-19 01:03:27', '10.00');
INSERT INTO `user_yue_log` VALUES ('116', '90', '-10.00', '购买小型云矿机', '10', '2018-12-20 14:42:53', '10.00');

-- ----------------------------
-- Table structure for yue_orders
-- ----------------------------
DROP TABLE IF EXISTS `yue_orders`;
CREATE TABLE `yue_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `number` int(11) unsigned NOT NULL COMMENT '余额数量',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `target_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '对方ID',
  `match_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '匹配时间',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `finish_time` int(11) unsigned DEFAULT '0' COMMENT '完成时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 见配置',
  `charge_number` decimal(12,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '手续费',
  `is_comment` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否评论',
  `types` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1：买入，2：卖出',
  `total_price_china` decimal(12,2) unsigned NOT NULL COMMENT '人民币价格',
  `bond` decimal(12,2) unsigned NOT NULL COMMENT '保证金',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1删除',
  `img` varchar(100) DEFAULT '' COMMENT '凭证图片',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `target_user_id` (`target_user_id`),
  KEY `status` (`status`),
  KEY `types` (`types`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='余额交易中心';

-- ----------------------------
-- Records of yue_orders
-- ----------------------------
