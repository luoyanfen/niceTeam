-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.53 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.5.0.5220
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 niceteam 的数据库结构
CREATE DATABASE IF NOT EXISTS `niceteam` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `niceteam`;

-- 导出  表 niceteam.auser 结构
CREATE TABLE IF NOT EXISTS `auser` (
  `aid` int(11) NOT NULL,
  `aaccount` varchar(255) NOT NULL,
  `aname` varchar(255) NOT NULL,
  `apassword` varchar(255) NOT NULL,
  `a_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  niceteam.auser 的数据：1 rows
/*!40000 ALTER TABLE `auser` DISABLE KEYS */;
INSERT INTO `auser` (`aid`, `aaccount`, `aname`, `apassword`, `a_id`) VALUES
	(0, 'cxm', 'cxm', '123456', NULL);
/*!40000 ALTER TABLE `auser` ENABLE KEYS */;

-- 导出  表 niceteam.buy 结构
CREATE TABLE IF NOT EXISTS `buy` (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT '下单id',
  `uid` int(11) NOT NULL COMMENT '下单用户的id',
  `shid` int(11) NOT NULL COMMENT '店铺id',
  `gid` int(11) NOT NULL COMMENT '团购id',
  `buynum` int(11) NOT NULL DEFAULT '1' COMMENT '购买数量',
  PRIMARY KEY (`bid`),
  KEY `b_shid` (`shid`),
  KEY `b_gid` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='下单表';

-- 正在导出表  niceteam.buy 的数据：~19 rows (大约)
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` (`bid`, `uid`, `shid`, `gid`, `buynum`) VALUES
	(1, 2, 6, 4, 1),
	(2, 2, 6, 4, 1),
	(3, 2, 6, 4, 1),
	(4, 2, 6, 4, 1),
	(5, 2, 6, 4, 1),
	(6, 2, 6, 4, 1),
	(7, 2, 6, 4, 1),
	(8, 2, 6, 4, 1),
	(9, 2, 6, 4, 1),
	(10, 2, 8, 1, 1),
	(11, 2, 8, 1, 1),
	(12, 2, 8, 1, 1),
	(13, 2, 8, 1, 3),
	(14, 2, 8, 1, 1),
	(15, 2, 8, 1, 1),
	(16, 2, 8, 1, 1),
	(17, 2, 8, 1, 1),
	(18, 2, 8, 1, 1),
	(19, 2, 8, 1, 3);
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;

-- 导出  表 niceteam.cinema 结构
CREATE TABLE IF NOT EXISTS `cinema` (
  `cinemaid` int(11) NOT NULL AUTO_INCREMENT,
  `cinemaname` char(50) NOT NULL,
  `cinemaaddress` char(50) DEFAULT NULL,
  `distance` char(50) DEFAULT NULL,
  PRIMARY KEY (`cinemaid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='影院';

-- 正在导出表  niceteam.cinema 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` (`cinemaid`, `cinemaname`, `cinemaaddress`, `distance`) VALUES
	(1, '华夏3D国际影城', '师宗县凤山街80号', '500m'),
	(2, '万达影城', '西山区滇池路南亚风情A1座6层', '2.1km'),
	(3, '红星太平洋影城', '西山区广福路488号', '2.7km'),
	(4, '完美世界影城', '西山区老海埂路豆腐营13号新都', '2.8km'),
	(5, '横店电影城', '西山区环城南路618号大悦城8楼', '3.3km'),
	(6, '百老汇影城', '五华区顺城王府井购物中心F区2层', '3.7km'),
	(7, 'SFC上影影城', '五华区东风西路99号白打新天地7楼', '4km'),
	(8, '新昆明影城', '五华区南屏街43号', '4.2km');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;

-- 导出  表 niceteam.comment 结构
CREATE TABLE IF NOT EXISTS `comment` (
  `cmid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `gid` int(11) NOT NULL COMMENT '团购id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `cmgrade` int(11) NOT NULL COMMENT '评分',
  `cmcontent` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '评论内容',
  `cmimg` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '评论图片',
  PRIMARY KEY (`cmid`),
  KEY `cm_gid` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='团购评论表';

-- 正在导出表  niceteam.comment 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 导出  表 niceteam.group 结构
CREATE TABLE IF NOT EXISTS `group` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '团购id',
  `shid` int(11) NOT NULL COMMENT '店铺id',
  `gname` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '团购名称',
  `gimg` varchar(5000) COLLATE utf8_unicode_ci NOT NULL COMMENT '团购图片',
  `gprice` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '团购价格',
  `gsold` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '已售数量',
  `gremarks` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `gterm` int(11) NOT NULL DEFAULT '0' COMMENT '有效期',
  `grule` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '使用规则',
  PRIMARY KEY (`gid`,`shid`),
  KEY `pk_shid` (`shid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='团购套餐表';

-- 正在导出表  niceteam.group 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` (`gid`, `shid`, `gname`, `gimg`, `gprice`, `gsold`, `gremarks`, `gterm`, `grule`) VALUES
	(1, 8, '香辣虾2-3', 'http://p0.meituan.net/deal/f2deb8bb9feb62341baa44a000f66e96110476.jpg', '117', '218', '香辣、米饭、面条', 12, '团购用户不可同时享受商家其他优惠'),
	(2, 8, '虾蟹汇2-3人餐', 'http://p0.meituan.net/deal/f2deb8bb9feb62341baa44a000f66e96110476.jpg', '148', '133', '虾蟹汇、苦菜汤、米饭、面条', 12, '团购用户不可同时享受商家其他优惠；酒水饮料等问题，请致电商家咨询，以商家反馈为准'),
	(3, 6, '石板烧2-3人餐', 'http://p1.meituan.net/deal/e9ea328f7a5e537e8f580b543e563e51216469.jpg', '89.9', '259', '五花肉、鸡肚、鸭肠、脆肠、小瓜、韭菜、洋芋、冰毛豆', 6, '无需预约，消费高峰期可能需要等位；商家提供免费WIFI'),
	(4, 6, '4-5人丽江洋芋鸡火锅', 'http://p0.meituan.net/deal/5aca865d8313ef777dc82203d4a12a6b187666.jpg', '138', '10', '麻辣洋芋鸡、秘制五花肉、大白菜、人工菌、豆腐皮、小青菜、西红柿、米饭', 6, '无需预约，消费高峰期可能需要等位；商家提供免费WIFI'),
	(5, 9, '2-3人富源酸菜猪脚火锅', 'http://p1.meituan.net/deal/01c17399e15c45c8e7367e117b08346b59604.jpg@360w_328h_1e_1c', '98', '1120', '新猪脚小锅、肥牛卷、午餐肉、五花肉、老火腿片、柠檬汁', 9, '免费提供15个停车位；店内无包间；每桌最多使用1张美团券'),
	(6, 9, '4-5人富源酸菜猪脚火锅', 'http://p1.meituan.net/deal/01c17399e15c45c8e7367e117b08346b59604.jpg@360w_328h_1e_1c', '128', '521', '新猪脚中锅、荤菜2份、素菜4份、柠檬汁', 0, '免费提供15个停车位；店内无包间；每桌最多使用1张美团券'),
	(7, 9, '6-7人特色酸汤猪脚火锅', 'http://p1.meituan.net/deal/01c17399e15c45c8e7367e117b08346b59604.jpg@360w_328h_1e_1c', '188', '120', '新猪脚锅底（含2斤猪脚）、老火腿片、猪蹄、肥牛卷、五花肉、午餐肉、金针菇、菠菜、山药、豆腐、香菇', 0, '免费提供15个停车位；店内无包间；每桌最多使用1张美团券'),
	(8, 10, '2人精品火锅', 'http://p0.meituan.net/deal/0b11a35ebded7f44ba12933a923735d81128161.png@360w_328h_1e_1c', '119', '50', '巴喜九宫格、绿色毛肚、麻辣牛肉、墨鱼仔、土豆、小白菜', 0, '无需预约，消费高峰期可能需要等位；商家提供免费WIFI'),
	(9, 11, '5-7人套餐，精品三合一', 'http://p0.meituan.net/deal/66e08e67c88de607570ea7c57c98069337184.jpg@360w_328h_1e_1c', '223', '68', '精品香鸭三合一干锅（大）、荤菜2份、素材5份、米饭', 0, '无需预约，消费高峰期可能需要等位；商家提供免费WIFI'),
	(10, 12, '4-6人田鸡火锅', 'http://p1.meituan.net/deal/d24f2c3ccb8a9bce5d9e0c65639fd9ca41379.jpg@360w_328h_1e_1c', '168', '112', '锅底、田鸡、五花肉、午餐肉、牛肉丸、牛肉卷', 0, '无需预约，消费高峰期可能需要等位；商家提供免费WIFI'),
	(11, 2, '【可自提】经典现烤玫瑰鲜花饼', 'http://p0.meituan.net/deal/808b965c21a9d41e79a22f8582fee8f4167504.jpg@360w_328h_1e_1c', '90', '154154', '经典现烤玫瑰鲜花饼礼盒', 0, '不提供餐巾纸；无需预约，消费高峰期可能需要等位；商家提供免费WIFI'),
	(12, 1, '6-8人餐，有赠品，免费包间', 'http://p1.meituan.net/200.0/deal/42bef5ad68ceba65c9eebe53b7f5ed2136294.jpg@92_0_285_285a%7C267h_267w_2e_90Q', '277', '52', '麻辣/清汤底料、原生态土鸡、酥肉、排骨、虾饺、薄荷、豆腐皮、米饭、纸巾', 0, '免费提供15个停车位；店内无包间；每桌最多使用1张美团券');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;

-- 导出  表 niceteam.ktv-comment 结构
CREATE TABLE IF NOT EXISTS `ktv-comment` (
  `kdpid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'KTV商品网友点评id，主键',
  `kgid` int(11) DEFAULT NULL COMMENT 'KTV店铺商品，外键',
  `kid` int(11) DEFAULT NULL COMMENT 'KTV店铺，外键',
  `uid` int(11) DEFAULT NULL COMMENT '美团用户id，外键',
  `kdpscore` int(2) DEFAULT NULL COMMENT '美团用户评分',
  `kdpinfo` char(200) DEFAULT NULL COMMENT '美团用户评语',
  `Kdppicture` char(255) DEFAULT NULL COMMENT '美团用户买家秀图片地址',
  PRIMARY KEY (`kdpid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='KTV商品网友点评表';

-- 正在导出表  niceteam.ktv-comment 的数据：15 rows
/*!40000 ALTER TABLE `ktv-comment` DISABLE KEYS */;
INSERT INTO `ktv-comment` (`kdpid`, `kgid`, `kid`, `uid`, `kdpscore`, `kdpinfo`, `Kdppicture`) VALUES
	(1, 1, 1, NULL, 1, '页面上有小包中包 来了只有小包 要中包必须消费一打酒或者其他 严重欺骗消费者 服务态度还不好', NULL),
	(2, 1, 1, NULL, 1, '页面有小包中包 来了就只有小包 要中包必须消费一打酒 欺骗顾客 不建议来', NULL),
	(3, 2, 1, NULL, 3, '至少要15个字是什么意思？？？？', NULL),
	(4, 2, 1, NULL, 5, NULL, NULL),
	(5, 3, 1, NULL, 4, NULL, NULL),
	(6, 1, 2, NULL, 5, '老哥很耐心负责！录得很细心！反正我是常客，我还会来的哈哈哈', 'https://p0.meituan.net/shaitu/3b0b64fabc7f2cd200cb38f406cc830e2641576.jpg%40249w_249h_0e_1l%7Cwatermark%3D0'),
	(7, 1, 2, NULL, 5, '交通方便，坐地铁就可以直达，价格也比别家划算，老板人超好！超细心！超专业！', 'https://p1.meituan.net/shaitu/93ffb3c99d3d846c4619934c4f506aa8407838.jpg%40249w_249h_0e_1l%7Cwatermark%3D0'),
	(8, 2, 2, NULL, 5, '非常好的老师 一句一句直到完成 以后还会再来', 'https://p0.meituan.net/shaitu/809d98a0f4a84d1d46a45dc18c0363be2380467.jpg%40249w_249h_0e_1l%7Cwatermark%3D0'),
	(9, 2, 2, NULL, 5, '效果非常棒，强烈建议298的套餐，小哥后期调音很负责，还给了很多唱歌时的建议，学到了不少东西，下次还会再来', 'https://p0.meituan.net/shaitu/0115675b9c299db1be15974f85f81042351734.jpg%40249w_249h_0e_1l%7Cwatermark%3D0'),
	(10, NULL, 3, NULL, 5, '非常好', NULL),
	(11, NULL, 3, NULL, 5, '太给力了，田老师的录音棚太给力了，昆明最棒的，这里值得您来录音', 'http://p1.meituan.net/60.0/shaitu/1bdcd4393e72ce6f47a5571e0e2c4249377709.jpg'),
	(12, NULL, 3, NULL, 5, NULL, NULL),
	(13, NULL, 4, NULL, 5, '第好几次来了 很不错喔！！服务好 环境好 总体来说很划算！', 'http://p1.meituan.net/60.0/shaitu/c2768c1c6d3893c8084c8d83f3310a59557669.jpg'),
	(14, NULL, 4, NULL, 3, '离家比较近。也是老顾客了。第一次在美团上点。不过值得提醒的是进门询问美团预订是感觉某些服务员对我带理不理的，我也做服务行业，希望有所改进吧。', NULL),
	(15, NULL, 4, NULL, 1, '服务态度极差，直接差到让人无法享受', NULL);
/*!40000 ALTER TABLE `ktv-comment` ENABLE KEYS */;

-- 导出  表 niceteam.ktv-goods 结构
CREATE TABLE IF NOT EXISTS `ktv-goods` (
  `kgid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id，主键',
  `kid` int(11) DEFAULT NULL COMMENT 'KTV店铺id，外键',
  `kgname` char(20) DEFAULT NULL COMMENT '商品名称',
  `kgavatar` char(128) DEFAULT NULL COMMENT '商品头像地址',
  `kgprice` int(20) DEFAULT NULL COMMENT '商品价格',
  `kgoldprice` int(20) DEFAULT NULL COMMENT '商品门市价',
  `kgsold` int(20) DEFAULT NULL COMMENT '商品已售数量',
  `kginfo` char(50) DEFAULT NULL COMMENT '商品简介',
  `kgscore` float DEFAULT NULL COMMENT '商品评分',
  PRIMARY KEY (`kgid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='KTV商品信息表';

-- 正在导出表  niceteam.ktv-goods 的数据：9 rows
/*!40000 ALTER TABLE `ktv-goods` DISABLE KEYS */;
INSERT INTO `ktv-goods` (`kgid`, `kid`, `kgname`, `kgavatar`, `kgprice`, `kgoldprice`, `kgsold`, `kginfo`, `kgscore`) VALUES
	(1, 1, '黄金场指定酒水套餐', 'http://p1.meituan.net/200.0/dpdeal/0d3e40f8551ffea91117c9c5860d86cb152528.jpg', 99, 297, 79, '仅售99元，价值297元黄金场指定酒水套餐，节假日通用！', 3),
	(2, 1, '黄金场一打酒小/中包7小时欢唱套餐', 'http://p1.meituan.net/200.0/dpdeal/0d3e40f8551ffea91117c9c5860d86cb152528.jpg', 238, 566, 65, '仅售238元，黄金场一打酒小/中包7小时欢唱套餐，节假日通用！', 3),
	(3, 1, '黄金场3打大理v8欢唱套餐', 'http://p1.meituan.net/200.0/dpdeal/0d3e40f8551ffea91117c9c5860d86cb152528.jpg', 388, 766, 17, '仅售388元，价值766元黄金场3打大理v8欢唱套餐，节假日通用！', 3),
	(4, 2, '单人录音体验套餐', 'http://p0.meituan.net/200.0/dpdeal/0117f7d1b517df11f9c6b040b74946de1397252.jpg', 98, 300, 41, '仅售98元，价值300元单人录音体验套餐，节假日通用！', 4),
	(5, 2, '单曲精细录制以及修音', 'http://p0.meituan.net/200.0/dpdeal/0117f7d1b517df11f9c6b040b74946de1397252.jpg', 298, 500, 22, '仅售298元，价值500元单曲精细录制以及修音，节假日通用！', 4),
	(6, 2, '双人/合唱录制套餐', 'http://p0.meituan.net/200.0/dpdeal/0117f7d1b517df11f9c6b040b74946de1397252.jpg', 598, 1000, 1, '仅售598元，价值1000元双人/合唱录制套餐，节假日通用！', 4),
	(7, 3, '音乐短视频录制', 'http://p0.meituan.net/200.0/dpdeal/d15f1d2bc2b00828a5ce69df9323a11b42075.jpg', 600, 999, 0, '仅售600元，价值999元音乐短视频录制，节假日通用，免费WiFi,免费停车位！', 4.5),
	(8, 3, '音乐后期制作', 'http://p0.meituan.net/200.0/dpdeal/d15f1d2bc2b00828a5ce69df9323a11b42075.jpg', 260, 660, 0, '仅售260元，价值660元音乐后期制作，节假日通用，免费WiFi,免费停车位！', 4),
	(9, 3, '音乐剪辑', 'http://p0.meituan.net/200.0/dpdeal/d15f1d2bc2b00828a5ce69df9323a11b42075.jpg', 20, 100, 0, '仅售20元，价值100元音频剪辑，节假日通用，免费WiFi,免费停车位！', 4);
/*!40000 ALTER TABLE `ktv-goods` ENABLE KEYS */;

-- 导出  表 niceteam.ktv-goods-info 结构
CREATE TABLE IF NOT EXISTS `ktv-goods-info` (
  `ktgid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'KTV商品团购详情，主键',
  `kid` int(11) DEFAULT NULL COMMENT 'KTV店铺，外键',
  `ktgname` char(50) DEFAULT NULL COMMENT '名称',
  `ktgnum` char(20) DEFAULT NULL COMMENT '数量',
  `ktgprice` char(20) DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`ktgid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='KTV商品团购详情表';

-- 正在导出表  niceteam.ktv-goods-info 的数据：13 rows
/*!40000 ALTER TABLE `ktv-goods-info` DISABLE KEYS */;
INSERT INTO `ktv-goods-info` (`ktgid`, `kid`, `ktgname`, `ktgnum`, `ktgprice`) VALUES
	(1, 1, '指定啤酒', '1打', '238元'),
	(2, 1, '爆米花', '1份', '20元'),
	(3, 1, '冰毛豆', '1份', '20元'),
	(4, 1, '包厢', '1间', '358元'),
	(5, 1, '雪花勇闯', '30瓶', '572元'),
	(7, 1, '中果盘', '1份', '68元'),
	(8, 1, '爆米花', '1份', '20元'),
	(9, 2, '单人录音', '1次', '300元'),
	(10, 2, '1人', '1次', '500元'),
	(11, 2, '双人/合唱录制', '1次', '1000元'),
	(12, 3, '音乐录制60秒以内', '1份', '999元'),
	(13, 3, '乐音后期制作', '1次', '660元'),
	(14, 3, '音频剪辑', '1次', '100元');
/*!40000 ALTER TABLE `ktv-goods-info` ENABLE KEYS */;

-- 导出  表 niceteam.ktv_shop 结构
CREATE TABLE IF NOT EXISTS `ktv_shop` (
  `kid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，KTV店铺id',
  `kname` char(50) DEFAULT NULL COMMENT '店铺名称',
  `kavatar` char(128) DEFAULT NULL COMMENT '店铺头像地址',
  `klowprice` int(20) DEFAULT NULL COMMENT '店铺最低价格',
  `kaddress` char(50) DEFAULT NULL COMMENT '店铺地址',
  `kpictures` char(255) DEFAULT NULL COMMENT '店铺相关图片地址',
  `kinfo` char(50) DEFAULT NULL COMMENT '店铺简介',
  `kscore` float DEFAULT NULL COMMENT '店铺评分',
  PRIMARY KEY (`kid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='KTV店铺信息表';

-- 正在导出表  niceteam.ktv_shop 的数据：4 rows
/*!40000 ALTER TABLE `ktv_shop` DISABLE KEYS */;
INSERT INTO `ktv_shop` (`kid`, `kname`, `kavatar`, `klowprice`, `kaddress`, `kpictures`, `kinfo`, `kscore`) VALUES
	(1, '音乐宝贝KTV', 'https://p1.meituan.net/440.0/merchantpic/ba7d7639d74437585eec56f2c5e95fa0492794.jpg', 99, '石林彝族自治县财富中心', 'http://p1.meituan.net/440.0/poi/32a6474ecf0b2216fd918e182d5966c857344.jpg', '99元/券，黄金档7小时欢唱', 3),
	(2, '云南隆嘉录音棚', 'http://p0.meituan.net/440.0/joymerchant/34fa40fd96337d8ec7021729bcad8d46--60005206.jpg', 98, '金星小区，盘龙区白玉路470号金色年华', 'http://p0.meituan.net/440.0/joymerchant/34fa40fd96337d8ec7021729bcad8d46--60005206.jpg', '单人录音体验套餐', 4.4),
	(3, '飞音录音棚', 'http://p1.meituan.net/440.0/joymerchant/-3443254324457132879-28637783-1503924430721.JPG', 20, '天骄北麓，五华区小康大道江东华龙人家', 'http://p1.meituan.net/440.0/joymerchant/-3443254324457132879-28637783-1503924430721.JPG', '音频剪辑', 3.5),
	(4, '速捌KTV', 'http://p0.meituan.net/440.0/joymerchant/056c1183de1bbf1d9191848e0908408c--380188593.jpg', 0, '东川区铜都街道兴玉路39号', 'http://p0.meituan.net/440.0/joymerchant/056c1183de1bbf1d9191848e0908408c--380188593.jpg', '小包1小时41元，中包1小时41元', 4.8);
/*!40000 ALTER TABLE `ktv_shop` ENABLE KEYS */;

-- 导出  表 niceteam.lr-comment 结构
CREATE TABLE IF NOT EXISTS `lr-comment` (
  `ldpid` int(11) NOT NULL AUTO_INCREMENT COMMENT '丽人商品网友点评id，主键',
  `lgid` int(11) DEFAULT NULL COMMENT '丽人店铺商品id，外键',
  `lid` int(11) DEFAULT NULL COMMENT '丽人店铺id，外键',
  `uid` int(11) DEFAULT NULL COMMENT '美团用户id，外键',
  `ldpscore` int(2) DEFAULT NULL COMMENT '美团用户评分',
  `ldpinfo` char(200) DEFAULT NULL COMMENT '美团用户评语',
  `ldppicture` char(255) DEFAULT NULL COMMENT '美团用户买家秀图片地址',
  PRIMARY KEY (`ldpid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='丽人商品网友点评表';

-- 正在导出表  niceteam.lr-comment 的数据：0 rows
/*!40000 ALTER TABLE `lr-comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `lr-comment` ENABLE KEYS */;

-- 导出  表 niceteam.lr-goods 结构
CREATE TABLE IF NOT EXISTS `lr-goods` (
  `lgid` int(11) NOT NULL AUTO_INCREMENT COMMENT '丽人店铺商品id，主键',
  `lid` int(11) DEFAULT NULL COMMENT '丽人店铺id，外键',
  `lgname` char(20) DEFAULT NULL COMMENT '商品名称',
  `lgavatar` char(128) DEFAULT NULL COMMENT '商品头像地址',
  `lgprice` int(20) DEFAULT NULL COMMENT '商品价格',
  `lgoldprice` char(20) DEFAULT NULL COMMENT '商品门市价',
  `lgsold` int(20) DEFAULT NULL COMMENT '商品已售数量',
  `lgInfo` char(50) DEFAULT NULL COMMENT '商品简介',
  `lgscore` int(2) DEFAULT NULL COMMENT '商品评分',
  PRIMARY KEY (`lgid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='丽人商品信息表';

-- 正在导出表  niceteam.lr-goods 的数据：0 rows
/*!40000 ALTER TABLE `lr-goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `lr-goods` ENABLE KEYS */;

-- 导出  表 niceteam.lr-goods-info 结构
CREATE TABLE IF NOT EXISTS `lr-goods-info` (
  `ltgid` int(11) NOT NULL AUTO_INCREMENT COMMENT '丽人店铺商品团购详情id，主键',
  `lgid` int(11) DEFAULT NULL COMMENT '丽人店铺商品id，外键',
  `lid` int(11) DEFAULT NULL COMMENT '丽人店铺id，外键',
  `ltgname` char(20) DEFAULT NULL COMMENT '团购商品名称',
  `ltginfo` char(50) DEFAULT NULL COMMENT '套餐介绍',
  `ltgoldprice` int(11) DEFAULT NULL COMMENT '套餐原价',
  `ltgprice` int(11) DEFAULT NULL COMMENT '套餐团购价',
  PRIMARY KEY (`ltgid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='丽人店铺商品团购表';

-- 正在导出表  niceteam.lr-goods-info 的数据：0 rows
/*!40000 ALTER TABLE `lr-goods-info` DISABLE KEYS */;
/*!40000 ALTER TABLE `lr-goods-info` ENABLE KEYS */;

-- 导出  表 niceteam.lr-shop 结构
CREATE TABLE IF NOT EXISTS `lr-shop` (
  `lid` int(11) NOT NULL AUTO_INCREMENT COMMENT '丽人店铺id，主键',
  `lname` char(20) DEFAULT NULL COMMENT '店铺名称',
  `ltype` char(20) DEFAULT NULL COMMENT '店铺类型',
  `laddress` char(128) DEFAULT NULL COMMENT '店铺地址',
  `lscore` int(11) DEFAULT NULL COMMENT '店铺评分',
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='丽人店铺信息表';

-- 正在导出表  niceteam.lr-shop 的数据：0 rows
/*!40000 ALTER TABLE `lr-shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `lr-shop` ENABLE KEYS */;

-- 导出  表 niceteam.movie 结构
CREATE TABLE IF NOT EXISTS `movie` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `moviename` char(50) NOT NULL,
  `movieavatar` varchar(128) NOT NULL,
  `wantnum` int(20) DEFAULT '0',
  `stars` varchar(128) DEFAULT NULL,
  `ondate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`movieid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='电影';

-- 正在导出表  niceteam.movie 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` (`movieid`, `moviename`, `movieavatar`, `wantnum`, `stars`, `ondate`) VALUES
	(1, '调酒师', 'https://p1.meituan.net/128.180/moviemachine/6664cd8c31f1254bc52793a158dc53ff8811971.jpg', 3, '刘挺,陆莹', '2020-2-13'),
	(2, '站住！小偷', 'https://p0.meituan.net/128.180/movie/115273d73084aa4e54c3401f7457e9fa1185899.jpg', 1, '郑云,尤勇,梁小龙', '2020-03'),
	(3, '愤怒的心', 'https://p0.meituan.net/128.180/movie/174c45cf85694f065224ee38b29282903015976.jpg', 0, '吴琼,王之民,阳蕾', '2020-04-15'),
	(4, '大红包', 'https://p1.meituan.net/128.180/movie/fcabb91dbae511e8a32af1deeb0c1cec204154.jpg', 0, '包贝尔,克拉拉', '2020-04-30'),
	(5, '灰烬燃烧', 'https://p1.meituan.net/128.180/movie/51d3b0c39d082db32c3534cb68338b441447222.png', 1, '罗晋,辛鹏', '2020-04');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;

-- 导出  表 niceteam.movie_comment 结构
CREATE TABLE IF NOT EXISTS `movie_comment` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT,
  `commenttext` varchar(128) DEFAULT NULL,
  `movieid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`commentid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='影评';

-- 正在导出表  niceteam.movie_comment 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `movie_comment` DISABLE KEYS */;
INSERT INTO `movie_comment` (`commentid`, `commenttext`, `movieid`, `uid`) VALUES
	(47, '123', 1, 1);
/*!40000 ALTER TABLE `movie_comment` ENABLE KEYS */;

-- 导出  表 niceteam.nuser 结构
CREATE TABLE IF NOT EXISTS `nuser` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uaccount` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `uavatar` varchar(255) DEFAULT NULL,
  `upassword` varchar(255) DEFAULT NULL,
  `uemail` varchar(255) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  niceteam.nuser 的数据：1 rows
/*!40000 ALTER TABLE `nuser` DISABLE KEYS */;
INSERT INTO `nuser` (`uid`, `uaccount`, `uname`, `uavatar`, `upassword`, `uemail`, `a_id`) VALUES
	(1, 'qwe', 'qwe', NULL, '123456', NULL, NULL);
/*!40000 ALTER TABLE `nuser` ENABLE KEYS */;

-- 导出  表 niceteam.shop 结构
CREATE TABLE IF NOT EXISTS `shop` (
  `shid` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `shtid` int(11) NOT NULL COMMENT '店铺种类id',
  `shname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '店铺名称',
  `shimg` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '主题图片',
  `shspecial` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '店铺特色',
  `shlocal` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '店铺位置',
  `shprice` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '价格',
  `shsales` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '店铺销量',
  PRIMARY KEY (`shid`),
  KEY `sht_id` (`shtid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='店铺表';

-- 正在导出表  niceteam.shop 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` (`shid`, `shtid`, `shname`, `shimg`, `shspecial`, `shlocal`, `shprice`, `shsales`) VALUES
	(1, 4, '乡村柴火鸡', 'http://p1.meituan.net/mogu/4ab2665eab5820a1c945b8c4d98887c3700220.jpg@1500w_640h_1e_1c', '农家菜', '永德客运站', '25', '154'),
	(2, 2, '嘉华饼屋（临沧店）', 'http://p1.meituan.net/bbia/02bd6930f25c0050b5a8e6a314752d4e173887.jpg@1500w_640h_1e_1c', '蛋糕', '临沧市第二人民医院', '24', '324'),
	(3, 1, '老房老舍火锅', 'https://img.meituan.net/msmerchant/8f3b6bde4a3139a894943c6df289a62c450160.jpg@1500w_640h_1e_1c', '重庆火锅', '恒基广场', '69', '142'),
	(4, 3, '顺风肥牛（云县店）', 'http://p0.meituan.net/deal/83bcfa3b4118350f4a25d70d7f0810f3265330.jpg@1500w_640h_1e_1c', '火锅', '迎新路', '58', '113'),
	(5, 5, '德克士（临沧店）', 'https://img.meituan.net/msmerchant/3cbe9e6d231e841264fb4d132848b627276665.jpg@1500w_640h_1e_1c', '汉堡', '金泰百货', '29', '184'),
	(6, 6, '丽江石板烧', 'http://p0.meituan.net/mogu/8e98c1f45a7e71577c3977c6d0792b01340859.jpg@1500w_640h_1e_1c', '烧烤', '白塔路', '37', '230'),
	(7, 7, '志华鲜椒木瓜鱼', 'https://img.meituan.net/msmerchant/974ee9f05ce1316046d571ec5128d66890530.jpg@1500w_640h_1e_1c', '云南菜', '临翔政府', '29', '330'),
	(8, 8, '虾缤蟹酱', 'http://p0.meituan.net/deal/f2deb8bb9feb62341baa44a000f66e96110476.jpg@1500w_640h_1e_1c', '海鲜', '晚翠路', '39', '87'),
	(9, 1, '富源酸菜猪脚火锅', 'https://img.meituan.net/msmerchant/15a4d28b0a0a63de44dde0888000666475522.jpg@353w_353h_1e_1c', '云南火锅', '迎新路', '45', '54'),
	(10, 1, '重庆巴喜火锅', 'https://img.meituan.net/msmerchant/21f8272dabe3814d009b028535c2f82548152.jpg@353w_353h_1e_1c', '重庆霍火锅', NULL, '57', '128'),
	(11, 1, '鸭掌门特色火锅', 'http://p0.meituan.net/deal/8d3362de583ee9f57ea121e49bebacae89124.jpg@353w_353h_1e_1c', '火锅', NULL, '44', '254'),
	(12, 1, '跳三跳（云县店）', 'http://p1.meituan.net/deal/dbd8190a64fa49b2a6a98a259219b068100976.jpg@353w_353h_1e_1c', '火锅', '迎新路', '30', '246'),
	(13, 1, '顺丰鱼馆', 'http://p0.meituan.net/deal/3cd45f6b0dd7b228b42b13d5980350ad113660.jpg@353w_353h_1e_1c', '鱼火锅', '迎新路', '50', '97'),
	(14, 2, '蛋挞王（临沧店）', 'http://p0.meituan.net/deal/311f36157adbf7c5d0e4304c966252e1831957.jpg@353w_353h_1e_1c', '甜点饮品', '临沧市第二人名医院', '8', '324');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;

-- 导出  表 niceteam.shtype 结构
CREATE TABLE IF NOT EXISTS `shtype` (
  `shtid` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺种类id',
  `shtname` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '店铺种类名称',
  `shtimg` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '种类图片',
  PRIMARY KEY (`shtid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='店铺种类表';

-- 正在导出表  niceteam.shtype 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `shtype` DISABLE KEYS */;
INSERT INTO `shtype` (`shtid`, `shtname`, `shtimg`) VALUES
	(1, '火锅', 'http://p1.meituan.net/deal/eb9422e47754196d559c28a990e79da1143268.jpg@1500w_640h_1e_1c'),
	(2, '甜点饮品', 'https://img.meituan.net/msmerchant/3317f15d9aa71ff926945a9c7bf93f464110442.jpg@1500w_640h_1e_1c'),
	(3, '自助餐', 'https://img.meituan.net/msmerchant/db4d0ae0f03f9d5f28bbc790a819aa6166372.jpg@1500w_640h_1e_1c'),
	(4, '小吃快餐', 'http://p0.meituan.net/waimaipoi/235c82cbbfd4dda1039833a9e1e9595a51200.jpg@1500w_640h_1e_1c'),
	(5, '西餐', 'https://img.meituan.net/msmerchant/51d564d4f139f8d092ea5367dbd25e6f338841.jpg@1500w_640h_1e_1c'),
	(6, '烧烤烤肉', 'http://p1.meituan.net/deal/a6399f54c374f565f9701c1298848201132058.jpg@1500w_640h_1e_1c'),
	(7, '香锅烤鱼', 'https://img.meituan.net/msmerchant/7af3baad2448b2a43d86e35a3392b162226013.jpg@1500w_640h_1e_1c'),
	(8, '海鲜', 'http://p1.meituan.net/mogu/37b4a375b06cc5d7fcb58f9ffa314203356090.jpg@1500w_640h_1e_1c');
/*!40000 ALTER TABLE `shtype` ENABLE KEYS */;

-- 导出  表 niceteam.star 结构
CREATE TABLE IF NOT EXISTS `star` (
  `starid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `starimg` varchar(128) NOT NULL,
  `starname` varchar(50) NOT NULL,
  PRIMARY KEY (`starid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='明星';

-- 正在导出表  niceteam.star 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
INSERT INTO `star` (`starid`, `starimg`, `starname`) VALUES
	(1, 'https://p1.meituan.net/movie/eef92a63388f5151fcf9adba544228a5142365.jpg', '岳云鹏'),
	(2, 'https://p0.meituan.net/moviemachine/6939e8cbf85fcacf0dde0d1741669f7b170375.jpg', '李子雄'),
	(3, 'https://p0.meituan.net/moviemachine/ae497712ff7d5004d0bebb6154b30d9457982.jpg', '郑云'),
	(4, 'https://p0.meituan.net/movie/d290c66b4c40f6d676c64054b9ef4d1a55520.jpg', '沈梦辰'),
	(5, 'https://p0.meituan.net/moviemachine/b201f991c2cf98dfd6fafe97ad90eecd176389.png', '郭德纲'),
	(6, 'https://p0.meituan.net/movie/e090a20afc0823116b550f9bb14d78a7109422.jpg', '孙越');
/*!40000 ALTER TABLE `star` ENABLE KEYS */;

-- 导出  表 niceteam.wantmovie 结构
CREATE TABLE IF NOT EXISTS `wantmovie` (
  `wantid` int(11) NOT NULL AUTO_INCREMENT,
  `moviestar` char(20) DEFAULT '0',
  `moviename` varchar(50) NOT NULL,
  `movieavatar` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`wantid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='想看的电影';

-- 正在导出表  niceteam.wantmovie 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `wantmovie` DISABLE KEYS */;
/*!40000 ALTER TABLE `wantmovie` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
