-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: ego
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int DEFAULT NULL,
  `name` text,
  `cid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'家用电器',1001),(1,'手机/运营商/数码',1002),(1,'电脑/办公',1003),(1,'家具/家居',1004),(1001,'电视',100001),(1001,'空调',10002),(1001,'洗衣机',10003),(1001,'冰箱',10004),(1002,'手机通讯',10001),(1002,'运营商',10002),(1002,'摄影',10003),(1002,'摄像',10004),(1003,'电脑整机',10001),(1003,'电脑配件',10002),(1003,'外设产品',10003),(1003,'游戏设备',10004),(1004,'厨具',10001),(1004,'家纺',10002),(1004,'灯具',10003),(1004,'家具',10004),(100001,'超薄点视',100004),(100001,'全面屏点视',100005);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `user_id` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `read` tinyint DEFAULT '0',
  `from` varchar(45) DEFAULT NULL,
  `to` varchar(45) DEFAULT NULL,
  `num` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`num`),
  KEY `id_idx` (`user_id`),
  CONSTRAINT `id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1372 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES ('oU5Yyt2caPDUHX1VMG0f30YO0uBE','hello','2022-05-04 10:01:29',1,NULL,'oU5Yyt5JBvj_4M0DdNBTMlzoG-t4',1364),('oU5Yyt5JBvj_4M0DdNBTMlzoG-t4','hello','2022-05-04 10:01:29',1,'oU5Yyt2caPDUHX1VMG0f30YO0uBE',NULL,1365),('oU5Yyt5JBvj_4M0DdNBTMlzoG-t4','哈哈哈','2022-05-04 10:01:52',0,NULL,'oU5Yyt2caPDUHX1VMG0f30YO0uBE',1370),('oU5Yyt2caPDUHX1VMG0f30YO0uBE','哈哈哈','2022-05-04 10:01:52',1,'oU5Yyt5JBvj_4M0DdNBTMlzoG-t4',NULL,1371);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection` (
  `job_id` int NOT NULL COMMENT '收藏的工作的ID',
  `user_id` varchar(45) NOT NULL COMMENT '谁收藏的',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`create_time`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='我的收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (11,'oU5Yyt2caPDUHX1VMG0f30YO0uBE','2022-05-04 14:05:50'),(1,'oU5Yyt2caPDUHX1VMG0f30YO0uBE','2022-05-04 14:05:52'),(2,'oU5Yyt2caPDUHX1VMG0f30YO0uBE','2022-05-04 14:05:55'),(1,'oU5Yyt8lensDsgkxKTLe-6HvLH10','2022-05-04 15:39:04');
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `short_name` varchar(45) NOT NULL COMMENT '公司简称',
  `full_name` varchar(45) NOT NULL COMMENT '公司全称',
  `industry` varchar(45) NOT NULL COMMENT '公司行业分类',
  `scale` varchar(45) NOT NULL COMMENT '公司规模（不限、0-20人、20-99人、100-499人、500-999人、1000-9999人、10000人以上）',
  `stage` varchar(45) DEFAULT NULL COMMENT '公司所在阶段（不限、未融资、天使轮、A轮、B轮、C轮、D轮以上、已上市、不需要融资）',
  `longitude` varchar(45) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(45) DEFAULT NULL COMMENT '纬度',
  `city` varchar(45) DEFAULT NULL COMMENT '公司所在城市',
  `district` varchar(45) DEFAULT NULL COMMENT '小区',
  `address` varchar(45) DEFAULT NULL COMMENT '详细地址',
  `c_pic` mediumblob COMMENT '公司头像',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='公司';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'字节跳动','北京字节跳动科技有限公司','移动互联网','10000人以上','D轮以上',NULL,NULL,'北京市','海淀区','知春路甲',NULL),(2,'腾讯集团','深圳腾讯有限公司','移动互联网','10000人以上','D轮以上',NULL,NULL,'深圳市','市中区','家里',NULL),(3,'京信通信','京信网络系统股份有限公司','通信/网络设备','1000-9999人','未上市',NULL,NULL,'成都市','武侯区','中国(四川)自由贸易试验区',NULL),(4,'卫士通','成都卫士通信息产业股份有限公司','信息安全','1000-9999人','已上市',NULL,NULL,'成都市','武侯区','国家西部信息安全产业基地',NULL),(5,'华为技术有限公司','华为技术有限公司','计算机软件','10000人以上','不需要融资',NULL,NULL,'成都市','郫都区','高新西',NULL),(6,'亿达信息','亿达信息技术有限公司','计算机软件','1000-9999人','不需要融资',NULL,NULL,'成都市','武侯区','新会展中心',NULL),(7,'CloudBU','华为技术有限公司','互联网','10000人以上','未融资',NULL,NULL,'成都市','郫都区','高新西',NULL),(8,'小步创想慧联科技','成都小步创想慧联科技有限公司','计算机软件','100-499人','A轮',NULL,NULL,'成都市',NULL,NULL,NULL),(9,'德阳清康科技','德阳市清康环保科技有限公司','企业服务','20-99人',NULL,NULL,NULL,'成都市','双流区','华阳',NULL);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id` int DEFAULT NULL,
  `name` text NOT NULL,
  `pid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1001,'banner广告',10001),(1003,'电子产品广告',10003),(19412,'刚刚赚了很多钱',89602),(1004,'京东618',90410),(90410,'电脑',56320),(1,'广告分类',1001),(10001,'侧边广告',8020),(10001,'bbb',1529),(10001,'cc',474),(10002,'bbb',9196),(10001,'nnn',280),(10002,'冲冲冲',2999),(1001,'2021京东618',100);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentinfo`
--

DROP TABLE IF EXISTS `contentinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `name` text NOT NULL,
  `url` text NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentinfo`
--

LOCK TABLES `contentinfo` WRITE;
/*!40000 ALTER TABLE `contentinfo` DISABLE KEYS */;
INSERT INTO `contentinfo` VALUES (1,10001,'OPPO Watch','https://pro.jd.com/mall/active/tG3nBBhghqhfM69HoJw9ZoDaT7d/index.html?extension_id=eyJhZCI6IiIsImNoIjoiIiwic2hvcCI6IiIsInNrdSI6IiIsInRzIjoiIiwidW5pcWlkIjoie1wiY2xpY2tfaWRcIjpcIjg5YzRjMTUyLWUwZjktNGQ0OC05NDI4LTJhODQ4NWJjNTc1N1wiLFwibWF0ZXJpYWxfaWRcIjpcIjE4NTAxMDcyMjlcIixcInBvc19pZFwiOlwiNDI3MlwiLFwic2lkXCI6XCJmODcwZmM2MS1jYjc3LTQwN2UtOTM1ZC1jYzhlZTc0MTYyZTdcIn0ifQ==&jd_pop=89c4c152-e0f9-4d48-9428-2a8485bc5757&abt=1','//img14.360buyimg.com/pop/s1180x940_jfs/t1/110562/14/10737/42247/5e81bb76E6fffa006/b3f703f750bd37ea.jpg.webp'),(3,90410,'椅子','https://channel-m.jd.com/pc/psp/10979325649?imup=CgwKBnd3dGxpdRIAGAASEAjR7azzKBDmZhoAIJpNKAEYsRsgACoUaWwsdWEseGdiLGdhLGNpYSxiYWEyAmlsOioKCWpkX2hiZHl5MRDnYRgCIJL50ty1x-S1dyjCo6Q3MMGjpDc4E0CAgCA&extension_id=eyJhZCI6IiIsImNoIjoiIiwic2hvcCI6IiIsInNrdSI6IiIsInRzIjoiIiwidW5pcWlkIjoie1wiY2xpY2tfaWRcIjpcIjJiNmEyNjE5LWE4MmItNGMyNi1iYzYwLWI3ZGE1NzljOWRkZVwiLFwibWF0ZXJpYWxfaWRcIjpcIjg2MDUxMzIyOTY2NTg2NjQ1OTRcIixcInBvc19pZFwiOlwiMzUwNVwiLFwic2lkXCI6XCJmN2Y5ODM2ZS0yZTViLTQyMTUtYWNiMi04NDdmZmI2N2U2ZDdcIn0ifQ==&jd_pop=2b6a2619-a82b-4c26-bc60-b7da579c9dde&abt=0','https://img12.360buyimg.com/pop/s1180x940_jfs/t1/117573/18/9029/83238/5ed7c92aE789977c2/b11a288a7284cdfe.jpg.webp'),(5,10002,'fggh','dffg','dfdf'),(6,10002,'hhh','hh','hh'),(7,10002,'hhh','hh','hhh'),(8,10002,'hhh','hh','hh'),(9,10002,'aaa','aa','aaa'),(11,10001,'轮播图','http://www.baidu.com','http://www.baidu.com/banner.jpg'),(12,10001,'轮播图','http://www.baidu.com','http://www.baidu.com/banner.jpg'),(13,10001,'hjh','6666','666');
/*!40000 ALTER TABLE `contentinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `job_id` int NOT NULL AUTO_INCREMENT COMMENT '职位的ID',
  `company_id` int NOT NULL COMMENT '公司ID',
  `user_id` varchar(45) NOT NULL COMMENT '发布者的ID',
  `title` varchar(45) NOT NULL,
  `salary` varchar(45) NOT NULL,
  `tags` varchar(145) DEFAULT NULL,
  `desc` text,
  `workEXP` varchar(45) DEFAULT NULL COMMENT '工作经验',
  `edu` varchar(45) DEFAULT NULL COMMENT '学历',
  PRIMARY KEY (`job_id`),
  KEY `company_id_idx` (`company_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='职位详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,1,'1','测试','12','学学习','测试','测试','测试'),(2,2,'2','测试2','14','js,uniapp,React,express','测试2','测试2','测试2'),(3,3,'3','DSP软件工程师','20-35K·15薪','Javascript,vue,React,nodeJS','工作职责：','3-5年','硕士'),(4,5,'5','高级前端开发工程师','15-30k','HTML,CSS,数据结构,前端开发,React,','【工作职责】','经验不限','本科'),(5,6,'6','React前端开发工程师','15-20k','HTML,CSS,ES6,前端开发,Node.js,React,Javascript,TypeScript','职位描述：','3-5年','大专'),(6,6,'7','Java开发工程师(成都)','10-13k','SQL,架构师,SpringBoot,Spring,SpringMVC,Oracle,Mysql,Redis','1、独立完成开发框架及核心功能的设计和编码工作，持续对系统进行改进和优化，保障系统和可维护性','3-5','大专'),(7,7,'8','华为云前端开发工程师','15-30k','CSS,Javascript,React,前端开发经验,计算机/软件工程相关专业','x','经验不限','本科'),(8,8,'9','前端实习生','4000-6000元','Javascript,CSS,前端开发,小程序','岗位职责：','1年以内','本科'),(9,8,'9','Web前端工程师','1-1.5万元','Javascript,HTML,CSS,CSS3,HTML5,ES6,ES5,前端开发','岗位要求：','1-3年','本科'),(10,9,'10','Web前端开发实习生 5-7K','5000-7000元','前端开发','岗位职责','1年以内','高中'),(11,1,'oU5Yyt1_J9eWTVRtfZSyrrTAcPu0','React前端开发工程师','20k-40k','Javascript,CSS,前端开发,小程序','1、独立完成开发框架及核心功能的设计和编码工作，持续对系统进行改进和优化，保障系统和可维护性','1年以内','大专'),(12,5,'oU5Yyt8lensDsgkxKTLe-6HvLH10','前端开发','14-28k','HTML,CSS,ES6,前端开发,Node.js,React,Javascript,TypeScript','1、独立完成开发框架及核心功能的设计和编码工作，持续对系统进行改进和优化，保障系统和可维护性','1年以内','本科'),(13,8,'oU5Yytzsl8S1XKbp1AIwMZsybVZc','高级前端工程师','18-26k','CSS,Javascript,React,前端开发经验,计算机/软件工程相关专业','1、独立完成开发框架及核心功能的设计和编码工作，持续对系统进行改进和优化，保障系统和可维护性','1-3年','大专'),(14,8,'oU5Yyt5JBvj_4M0DdNBTMlzoG-t4','前端vue工程师','8-14k','vue,vuex,css,js,html','1、独立完成开发框架及核心功能的设计和编码工作，持续对系统进行改进和优化，保障系统和可维护性','1-3年','不限');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'17051376473','南通','2022-05-18 18:04:53','于乐驹','请尽快送达'),(2,'15100441377','佛山','2022-08-03 18:08:16','吕子骞','qYj'),(3,'15703489661','汕尾','2022-03-04 16:49:39','赵天翊','请尽快送达'),(4,'15103026629','克拉玛依','2022-02-01 09:31:14','洪思源','请尽快送达'),(5,'15521710069','金坛','2022-04-12 11:15:00','余正豪','6s'),(6,'17223759200','曲靖','2022-12-17 12:43:32','邵鑫鹏','请尽快送达'),(7,'14770592684','唐山','2022-12-25 16:08:16','金伟宸','请尽快送达'),(8,'15937859981','珠海','2022-12-20 12:05:35','姜耀杰','请尽快送达'),(9,'15732255593','唐山','2022-01-25 00:48:17','顾立轩','MEU'),(10,'15053072835','攀枝花','2022-04-17 02:16:09','邓文昊','请尽快送达'),(11,'15896523076','张家港','2022-06-03 18:19:40','戴懿轩','kAzdV'),(12,'18075055787','玉溪','2022-11-30 07:57:09','阎明轩','eD8'),(13,'17183546844','武汉','2022-08-25 11:16:09','田智宸','请尽快送达'),(14,'15223985342','张家界','2022-01-22 16:35:03','尹建辉','H5Y'),(15,'15830476647','莱州','2022-02-03 07:11:51','韩修洁','请尽快送达'),(16,'14719392238','湖州','2022-08-28 13:36:06','徐锦程','TE请尽快送达');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `params`
--

DROP TABLE IF EXISTS `params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `params` (
  `id` int NOT NULL AUTO_INCREMENT,
  `itemCatId` text NOT NULL,
  `paramData` text NOT NULL,
  `specsName` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10075 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `params`
--

LOCK TABLES `params` WRITE;
/*!40000 ALTER TABLE `params` DISABLE KEYS */;
INSERT INTO `params` VALUES (10027,'10003','[{\"value\":\"\",\"title\":\"外观\",\"children\":[{\"value\":\"\",\"title\":\"体重\"}]}]','外设产品'),(10031,'10002','[{\"value\":\"\",\"title\":\"基本参数\",\"children\":[{\"value\":\"\",\"title\":\"外观\"},{\"value\":\"\",\"title\":\"重量\"},{\"value\":\"\",\"title\":\"生产时期\"}]},{\"value\":\"\",\"title\":\"形状\",\"children\":[{\"value\":\"\",\"title\":\"耗电量\"}]}]','空调'),(10032,'10003','[{\"value\":\"\",\"title\":\"基本信息\",\"children\":[{\"value\":\"\",\"title\":\"体重\"}]}]','外设产品'),(10033,'1004','[{\"value\":\"\",\"title\":\"材料\",\"children\":[{\"value\":\"\",\"title\":\"纯棉\"},{\"value\":\"\",\"title\":\"蕾丝\"}]}]','家具/家居'),(10036,'10004','[{\"value\":\"\",\"title\":\"多少度\",\"children\":[]}]','摄像'),(10037,'1004','[{\"value\":\"\",\"title\":\"方法\",\"children\":[{\"value\":\"\",\"title\":\"热\"}]}]','家具/家居'),(10044,'1003','[{\"value\":\"\",\"title\":\"基本信息\",\"children\":[{\"value\":\"\",\"title\":\"外观\"}]},{\"value\":\"\",\"title\":\"特殊配置\",\"children\":[{\"value\":\"\",\"title\":\"内存\"}]}]','电脑/办公'),(10045,'1001','[{\"value\":\"\",\"title\":\"dsds\",\"children\":[{\"value\":\"\",\"title\":\"dff\"}]}]','家用电器'),(10046,'1002','[{\"value\":\"\",\"title\":\"基本信息\",\"children\":[{\"value\":\"\",\"title\":\"参数\"}]}]','手机/运营商/数码'),(10047,'1003','[{\"value\":\"\",\"title\":\"过分过分过分\",\"children\":[{\"value\":\"\",\"title\":\"55人\"}]}]','电脑/办公'),(10049,'1002','[{\"value\":\"\",\"title\":\"配置参数\",\"children\":[{\"value\":\"\",\"title\":\"外观\"}]}]','手机/运营商/数码'),(10051,'1001','[{\"value\":\"\",\"title\":\"配置\",\"children\":[{\"value\":\"\",\"title\":\"111\"}]}]','家用电器'),(10052,'10004','[{\"value\":\"\",\"title\":\"配置\",\"children\":[{\"value\":\"\",\"title\":\"111\"}]}]','摄像'),(10053,'1004','[{\"value\":\"\",\"title\":\"家具\",\"children\":[{\"value\":\"\",\"title\":\"床\"}]}]','家具/家居'),(10059,'10004','[{\"value\":\"\",\"name\":\"基本信息\",\"children\":[{\"value\":\"\",\"name\":\"材料组成\"},{\"value\":\"\",\"name\":\"使用寿命\"}]}]','冰箱'),(10060,'10001','[{\"value\":\"\",\"title\":\"手机配置\",\"children\":[{\"value\":\"\",\"title\":\"尺寸\"},{\"value\":\"\",\"title\":\"像素\"},{\"value\":\"\",\"title\":\"内存\"}]}]','手机通讯'),(10061,'1001','[{\"value\":\"\",\"title\":\"外观\",\"children\":[{\"value\":\"\",\"title\":\"高度\"},{\"value\":\"\",\"title\":\"重量\"}]}]','家用电器'),(10062,'10004','[{\"value\":\"\",\"title\":\"66\",\"children\":[{\"value\":\"\",\"title\":\"666\"}]}]','冰箱'),(10063,'家用电器','[{\"value\":\"\",\"title\":\"天下无敌\",\"children\":[]}]','家用电器'),(10064,'家具','[]','家具'),(10065,'冰箱','[{\"value\":\"\",\"title\":\"sss\",\"children\":[]}]','冰箱'),(10072,'888','椅子','椅子'),(10073,'34234','沙发可以让人躺着休息','沙发'),(10074,'3434334','灯，照亮家里','灯');
/*!40000 ALTER TABLE `params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `image` text NOT NULL,
  `sellPoint` text NOT NULL,
  `price` text NOT NULL,
  `cid` text NOT NULL,
  `category` text,
  `num` text NOT NULL,
  `barcode` text NOT NULL,
  `status` text NOT NULL,
  `created` text NOT NULL,
  `updated` text NOT NULL,
  `descs` text NOT NULL,
  `paramsInfo` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004030402 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (16789,'冰箱华为/HUAWEI','www.wilford-hickle.name','我们的产品，物美价廉，产品功好，耐用','93242','456','冰箱','174005','123','12','1643131719368','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(44457,'沙发Microsoft','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvMGEzNGE1NTExOTdlNGJmMjliZTZmNWQyZGJhOTZlODAtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','3008621','456','沙发','657952','123','12','1659695420418','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(47880,'其它','www.lynn-gorczany.biz','我们的产品，物美价廉，产品功好，耐用','258508','479','椅子','2621195','123','12','1653263131367','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(49522,'戴尔/DELL','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvNTc4NzhmZjlhNDc1NzkyMmJkOGExMWM1NGEyODdiYjYtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','1','470','椅子','127','123','12','1641559551346','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(64389,'苹果冰箱/APPLE','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvNTc4NzhmZjlhNDc1NzkyMmJkOGExMWM1NGEyODdiYjYtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','85495','463','冰箱','9506131154','123','12','1671474956113','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(68575,'家具微软/Microsoft','www.kirby-mckenzie.biz','我们的产品，物美价廉，产品功好，耐用','94','473','家具','1704786','123','12','1647605818784','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(93631,'三星/SAMSUNG','www.garry-johns.name','我们的产品，物美价廉，产品功好，耐用','557','457','椅子','4383681','123','12','1655534697754','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(94026,'华硕/ASUS','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvYzFjN2UxM2JkZWI2YTgzMWI1YzQ5ZTU5OWI5YTQ2YmItNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','34234','471','椅子','4150','123','12','1655693660483','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(571408,'其它','www.yasmin-hamill.name','我们的产品，物美价廉，产品功好，耐用','720795','454','椅子','291','123','12','1643152255689','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(808531,'联想/Lenovo','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvMGEzNGE1NTExOTdlNGJmMjliZTZmNWQyZGJhOTZlODAtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','2333','460','椅子','3736441118','123','12','1660932623077','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(828101,'微软家具/Microsoft','www.melba-lang.info','我们的产品，物美价廉，产品功好，耐用','282066','470','家具','4','123','12','1665598491204','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(880525,'其它','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvMGEzNGE1NTExOTdlNGJmMjliZTZmNWQyZGJhOTZlODAtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','4095','469','椅子','1553183','123','12','1664314516121','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(883662,'冰箱','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvYzFjN2UxM2JkZWI2YTgzMWI1YzQ5ZTU5OWI5YTQ2YmItNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','34234','459','冰箱','56874','123','12','1648404602574','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(1743080,'家具三星/SAMSUNG','www.blair-flatley.biz','我们的产品，物美价廉，产品功好，耐用','3243','462','家具','26373','123','12','1660604305944','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(1841463,'沙发华硕/ASUS','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvMGEzNGE1NTExOTdlNGJmMjliZTZmNWQyZGJhOTZlODAtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','6565','453','沙发','17','123','12','1645553237536','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(2385481,'华为/HUAWEI','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvYzFjN2UxM2JkZWI2YTgzMWI1YzQ5ZTU5OWI5YTQ2YmItNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','41860455','467','椅子','37','123','12','1669349072134','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(2930295,'沙发/HP','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvYTllOWE2MGFiZmQ1ZTRjMGYzYmJlNTgxYjU4ZjY5YjEtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','6544','468','沙发','372741','123','12','1642299491969','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(3473850,'三星沙发/SAMSUNG','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvYTllOWE2MGFiZmQ1ZTRjMGYzYmJlNTgxYjU4ZjY5YjEtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','3544','476','沙发','4070474','123','12','1642575966301','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(4204833,'灯/Lenovo','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvZmVlOWM4MDQ5OTdkMWExNDRlN2NmZjg0MWRlYzA0ZTQtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','34234','465','灯','999181917','123','12','1662459817221','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(5082535,'电视柜','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cDovLzVjOWRjODdjMDlhYWUudDczLnFpZmVpeWUuY29tL3FmeS1jb250ZW50L3VwbG9hZHMvMjAxOS8wNC8wYmJmOWU5N2U1ZTQxOTk1MjZhZGMwYzIzNzQ1MTRmMC02MDB4NjAwLTkwLndlYnA_p_p100_p_3D.webp','我们的产品，物美价廉，产品功好，耐用','6234','457','椅子','9830394','123','12','1661526495670','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(5221342,'灯微星/MSI','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvZmVlOWM4MDQ5OTdkMWExNDRlN2NmZjg0MWRlYzA0ZTQtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','5345','488','灯','6363864807','123','12','1656345204335','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(6093334,'电视柜-RF','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cDovLzVjOWRjODdjMDlhYWUudDczLnFpZmVpeWUuY29tL3FmeS1jb250ZW50L3VwbG9hZHMvMjAxOS8wNC8wYmJmOWU5N2U1ZTQxOTk1MjZhZGMwYzIzNzQ1MTRmMC02MDB4NjAwLTkwLndlYnA_p_p100_p_3D.webp','我们的产品，物美价廉，产品功好，耐用','32434','468','家具','542768','123','12','1646621416257','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(6629784,'电视柜-SF','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cDovLzVjOWRjODdjMDlhYWUudDczLnFpZmVpeWUuY29tL3FmeS1jb250ZW50L3VwbG9hZHMvMjAxOS8wNC8wYmJmOWU5N2U1ZTQxOTk1MjZhZGMwYzIzNzQ1MTRmMC02MDB4NjAwLTkwLndlYnA_p_p100_p_3D.webp','我们的产品，物美价廉，产品功好，耐用','2343','492','椅子','71606','123','12','1653979604827','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(8099223,'灯/DELL','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvZmVlOWM4MDQ5OTdkMWExNDRlN2NmZjg0MWRlYzA0ZTQtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','2434','462','灯','67313105','123','12','1664410708541','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(9411758,'宏碁/ACER','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvZmVlOWM4MDQ5OTdkMWExNDRlN2NmZjg0MWRlYzA0ZTQtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','66842993','464','椅子','2','123','12','1665266590087','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(17744862,'其它','www.jonell-maggio.com','我们的产品，物美价廉，产品功好，耐用','3223','463','椅子','66','123','12','1664970768046','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(30112084,'冰箱华硕/ASUS','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvZmVlOWM4MDQ5OTdkMWExNDRlN2NmZjg0MWRlYzA0ZTQtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','3244','455','冰箱','285','123','12','1659960617782','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(35900855,'椅子/MSI','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvNTc4NzhmZjlhNDc1NzkyMmJkOGExMWM1NGEyODdiYjYtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','4234','464','椅子','5','123','12','1668690974200','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(44573668,'椅子/Microsoft','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvNTc4NzhmZjlhNDc1NzkyMmJkOGExMWM1NGEyODdiYjYtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','3423','465','椅子','3935271','123','12','1656861058416','123','椅子/Microsoft的商品，功能齐全，物有所值，适合广大用户',''),(50467692,'苹果/APPLE','www.annie-auer.info','我们的产品，物美价廉，产品功好，耐用','344','470','椅子','5','123','12','1662778812300','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(75782364,'电视柜-asd','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cDovLzVjOWRjODdjMDlhYWUudDczLnFpZmVpeWUuY29tL3FmeS1jb250ZW50L3VwbG9hZHMvMjAxOS8wNC8wYmJmOWU5N2U1ZTQxOTk1MjZhZGMwYzIzNzQ1MTRmMC02MDB4NjAwLTkwLndlYnA_p_p100_p_3D.webp','我们的产品，物美价廉，产品功好，耐用','4234234','454','电视柜','739992396','123','12','1653911138701','123','冰箱er的商品，功能齐全，物有所值，适合广大用户',''),(86233063,'冰箱/HP','www.maryellen-buckridge.biz','我们的产品，物美价廉，产品功好，耐用','4234','460','冰箱','91663','123','12','1654290631342','123','冰箱/HP的商品，功能齐全，物有所值，适合广大用户',''),(361790124,'冰箱/ACER','www.efrain-hilpert.com','我们的产品，物美价廉，产品功好，耐用','23424','454','冰箱','938232536','123','12','1662815347945','123','冰箱/ACER的商品，功能齐全，物有所值，适合广大用户',''),(430023020,'MSI','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvOTkxMmFkZDYxNWZjNGI4MGJmOWNmYTU5YzkzODM2MzUtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','4324','460','冰箱','50','123','12','1641983600331','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(610876577,'灯/Lenovo','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvYzFjN2UxM2JkZWI2YTgzMWI1YzQ5ZTU5OWI5YTQ2YmItNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','34234','465','灯','86','123','12','1644850023311','123','灯/Lenovo的商品，功能齐全，物有所值，适合广大用户',''),(709464246,'沙发DS-4','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvYTllOWE2MGFiZmQ1ZTRjMGYzYmJlNTgxYjU4ZjY5YjEtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','4234','475','沙发','8719','123','12','1655937247124','123','沙发DS-4，功能齐全，物有所值，适合广大用户',''),(724783033,'椅子SAMSUNG','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvNTc4NzhmZjlhNDc1NzkyMmJkOGExMWM1NGEyODdiYjYtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','3423','456','椅子','254653726','123','12','1644121536296','123','椅子SAMSUNG的商品，功能齐全，物有所值，适合广大用户',''),(733329921,'沙发/Microsoft','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvMGEzNGE1NTExOTdlNGJmMjliZTZmNWQyZGJhOTZlODAtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','234','486','沙发','202475228','123','12','1651917467264','123','沙发/Microsoft的商品，功能齐全，物有所值，适合广大用户',''),(756949728,'吊灯/MSI','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvZmVlOWM4MDQ5OTdkMWExNDRlN2NmZjg0MWRlYzA0ZTQtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','4234','461','灯','9279','123','12','1659281155128','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(816746266,'椅子-DA','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cHM6Ly81YzlkYzg3YzA5YWFlLnQ3My5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTkvMDQvYTYxZjg0OTc5ZjkwN2QwMGUyMjFkOTVhYTZiZjY4NTAtNjAweDYwMC05MC53ZWJw.webp','我们的产品，物美价廉，产品功好，耐用','234234','455','椅子','106711645','123','12','1669448040989','123','椅子-DA的商品，功能齐全，物有所值，适合广大用户',''),(1004030401,'装饰/Lenovo','https://ccdn.goodq.top/caches/f3e2686ae5c8d478262426df3f106330/aHR0cDovLzVjOWRjODdjMDlhYWUudDczLnFpZmVpeWUuY29tL3FmeS1jb250ZW50L3VwbG9hZHMvMjAxOS8wNC8wYmJmOWU5N2U1ZTQxOTk1MjZhZGMwYzIzNzQ1MTRmMC02MDB4NjAwLTkwLndlYnA_p_p100_p_3D.webp','我们的产品，物美价廉，产品功好，耐用','32423','477','装饰','74','123','12','1671364967878','123','Lenovo，功能齐全，物有所值','');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectparams`
--

DROP TABLE IF EXISTS `projectparams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectparams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` text NOT NULL,
  `paramscontent` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectparams`
--

LOCK TABLES `projectparams` WRITE;
/*!40000 ALTER TABLE `projectparams` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectparams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `authTime` varchar(45) NOT NULL,
  `authName` text NOT NULL,
  `createTime` text NOT NULL,
  `menus` varchar(256) DEFAULT 'null',
  `keya` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'梁明杰','2022-08-30 22:37:30','武航','2022-12-10 12:00:32','/home,/role,/charts/bar','6'),(2,'沈嘉熙','2022-07-07 09:13:40','沈振家','2022-11-02 21:25:41','/home,/role,/charts/bar','234542'),(3,'严天宇','2022-01-17 10:16:29','苏苑博','2022-02-15 12:23:20','/home,/role,/charts/bar','42092207'),(4,'邵智辉','2022-02-19 11:36:33','戴鑫鹏','2022-04-07 23:33:18','/home,/role,/charts/bar','34541'),(5,'龚睿渊','2022-04-28 18:42:41','史博涛','2022-09-21 15:26:05','/home,/role,/charts/bar','98'),(6,'孔烨霖','2022-07-03 06:20:26','冯鹏飞','2022-12-03 22:48:50','/home,/role,/charts/bar','764022'),(7,'卢明哲','2022-09-10 07:48:26','阎伟宸','2022-08-26 22:01:08','/home,/role,/charts/bar','13335522'),(8,'崔立辉','2022-02-14 01:03:09','梁健雄','2022-04-18 16:27:52','/home,/role,/charts/bar','607'),(9,'许旭尧','2022-08-16 12:31:27','郭志泽','2022-05-16 23:07:36','/home,/role,/charts/bar','316'),(10,'刘明轩','2022-06-28 12:36:59','贺智宸','2022-05-31 20:36:43','/home,/role,/charts/bar','4875713877'),(11,'吴思聪','2022-03-01 01:05:33','袁烨伟','2022-12-07 20:18:45','/home,/role,/charts/bar','659307516'),(12,'程梓晨','2022-02-07 05:03:37','洪弘文','2022-02-24 02:45:52','/home,/role,/charts/bar','53097147'),(13,'杜旭尧','2022-12-13 22:45:49','郑伟诚','2022-05-24 00:28:35','/home,/role,/charts/bar','8'),(14,'贺语堂','2022-11-15 16:28:14','黎立轩','2022-07-13 10:25:37','/home,/role,/charts/bar','118762'),(15,'阎鸿涛','2022-04-07 23:14:13','蒋炎彬','2022-06-14 08:29:23','/home,/role,/charts/bar','62895'),(16,'梁擎苍','2022-12-01 15:58:12','石凯瑞','2022-07-06 07:21:46','/home,/role,/charts/bar','36811108'),(17,'贺笑愚','2022-01-18 13:26:41','戴鹏飞','2022-10-23 14:10:23','/home,/role,/charts/bar','845650796'),(18,'余耀杰','2023-01-15 17:41:51','admin','2022-07-06 16:33:36','/home,/role,/charts/bar,/charts/line','1808518982'),(19,'于鹏','2022-04-16 00:57:11','赖熠彤','2022-05-06 17:34:34','/home,/role,/charts/bar','11'),(20,'罗博文','2023-01-15 15:49:52','admin','2022-04-20 00:11:46','/home,/charts/line','4264045336'),(33,'威威','2023-01-9 22:16:38','admin','2023-01-9 22:16:38','','855'),(34,'威威','2023-01-15 15:50:36','admin','2023-01-9 22:16:38','/product,/home,/charts/bar,/charts/line','855'),(35,'威威','2023-01-15 17:43:35','admin','2023-01-9 22:16:38','/home,/charts/pie,/charts/line,/category','855'),(36,'罗博文','2023-01-15 17:47:39','admin','2022-04-20 00:11:46','/home,/category,/charts/line,/charts,/charts/bar,/charts/pie,/order,/role,/user,/product,/products,all','4264045336'),(37,'weqwq','2023-01-15 17:50:27','admin','2023-01-15 17:50:27','','976'),(38,'hh','2023-01-15 18:16:18','admin','2023-01-15 17:51:1','/home,/category,/products,/charts/bar,/product,/charts/line','687'),(39,'ff','2023-04-16 16:53:17','admin','2023-01-15 18:20:36','/charts/line,/charts/bar,/order','849');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(45) NOT NULL COMMENT 'unionId',
  `company` varchar(45) DEFAULT NULL COMMENT '招聘者所在公司',
  `u_name` varchar(45) NOT NULL COMMENT '姓名',
  `position` varchar(45) DEFAULT NULL COMMENT '该发布者所在公司的职位',
  `status` varchar(45) DEFAULT NULL COMMENT '状态（刚刚活跃）',
  `identity` int DEFAULT '0' COMMENT '0求职者，1招聘者',
  `gender` int DEFAULT '2',
  `u_pic` text,
  `email` varchar(30) DEFAULT NULL,
  `birthday` varchar(40) DEFAULT NULL,
  `WeChat` varchar(20) DEFAULT NULL,
  `graduation` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `recruiter_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='发布招聘信息的人的表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','dd公司','嘤嘤嘤亚','测试','测试',1,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/5Xa4AibCQXuDRKPXSR6IiaR0snfiaOAv65Rl5fib3BJNdz0mohK2EcyjP1GVFfL8OhUPuqMLSlw1PAHHm1z0aK32Wg/132',NULL,NULL,NULL,NULL),('10','德阳清康科技','李淑琦','HR','刚刚活跃',1,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/5Xa4AibCQXuDRKPXSR6IiaR0snfiaOAv65Rl5fib3BJNdz0mohK2EcyjP1GVFfL8OhUPuqMLSlw1PAHHm1z0aK32Wg/132',NULL,NULL,NULL,NULL),('100',NULL,'xx',NULL,NULL,0,2,'https://thirdwx.qlogo.cn/mmopen/vi_32/5Xa4AibCQXuDRKPXSR6IiaR0snfiaOAv65Rl5fib3BJNdz0mohK2EcyjP1GVFfL8OhUPuqMLSlw1PAHHm1z0aK32Wg/132',NULL,NULL,NULL,NULL),('2','测试2','测试2','测试2','测试2',1,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/5Xa4AibCQXuDRKPXSR6IiaR0snfiaOAv65Rl5fib3BJNdz0mohK2EcyjP1GVFfL8OhUPuqMLSlw1PAHHm1z0aK32Wg/132',NULL,NULL,NULL,NULL),('3','京信通信','宋女士','HRBP','半年前活跃',1,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/5Xa4AibCQXuDRKPXSR6IiaR0snfiaOAv65Rl5fib3BJNdz0mohK2EcyjP1GVFfL8OhUPuqMLSlw1PAHHm1z0aK32Wg/132',NULL,NULL,NULL,NULL),('4','卫士通','刘先生','产品经理','2月内活跃',1,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/5Xa4AibCQXuDRKPXSR6IiaR0snfiaOAv65Rl5fib3BJNdz0mohK2EcyjP1GVFfL8OhUPuqMLSlw1PAHHm1z0aK32Wg/132',NULL,NULL,NULL,NULL),('4wIwPzsPqDZ7HTxHAAAn',NULL,'xx',NULL,NULL,0,2,'https://thirdwx.qlogo.cn/mmopen/vi_32/5Xa4AibCQXuDRKPXSR6IiaR0snfiaOAv65Rl5fib3BJNdz0mohK2EcyjP1GVFfL8OhUPuqMLSlw1PAHHm1z0aK32Wg/132',NULL,NULL,NULL,NULL),('5','华为技术有限公司','万女士','招聘者','刚刚活跃',1,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/5Xa4AibCQXuDRKPXSR6IiaR0snfiaOAv65Rl5fib3BJNdz0mohK2EcyjP1GVFfL8OhUPuqMLSlw1PAHHm1z0aK32Wg/132',NULL,NULL,NULL,NULL),('6','亿达信息','刘女士','招聘专员','刚刚活跃',1,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/5Xa4AibCQXuDRKPXSR6IiaR0snfiaOAv65Rl5fib3BJNdz0mohK2EcyjP1GVFfL8OhUPuqMLSlw1PAHHm1z0aK32Wg/132',NULL,NULL,NULL,NULL),('7','亿达信息','王女士','招聘专员','刚刚活跃',1,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/5Xa4AibCQXuDRKPXSR6IiaR0snfiaOAv65Rl5fib3BJNdz0mohK2EcyjP1GVFfL8OhUPuqMLSlw1PAHHm1z0aK32Wg/132',NULL,NULL,NULL,NULL),('8','CloudBU','罗先生','Java开发','刚刚活跃',1,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/5Xa4AibCQXuDRKPXSR6IiaR0snfiaOAv65Rl5fib3BJNdz0mohK2EcyjP1GVFfL8OhUPuqMLSlw1PAHHm1z0aK32Wg/132',NULL,NULL,NULL,NULL),('9','小步创想慧联科技','梁女士','招聘经理','刚刚活跃',1,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/5Xa4AibCQXuDRKPXSR6IiaR0snfiaOAv65Rl5fib3BJNdz0mohK2EcyjP1GVFfL8OhUPuqMLSlw1PAHHm1z0aK32Wg/132',NULL,NULL,NULL,NULL),('lll',NULL,'l妹子',NULL,NULL,0,2,NULL,NULL,NULL,NULL,NULL),('oU5Yyt1_J9eWTVRtfZSyrrTAcPu0',NULL,'Y','小鸡鸡','刚刚活跃',1,2,'https://thirdwx.qlogo.cn/mmopen/vi_32/2AFLibwFfPkkGV6A7wFRIWIMbz2ZgXdtibJlRBbylsP5NLMfFPfSWcb0x2EwhHI357Lqq80CHjovJ9qNUTASZM8g/132',NULL,NULL,NULL,NULL),('oU5Yyt2caPDUHX1VMG0f30YO0uBE',NULL,'hacker',NULL,NULL,0,0,'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK4tsu9z0efKDcYvSgELxiaicUSXIgkAkgCQJ2quP5AF5N0H703I1qk2ErwGVpkGtAxCalichDJkRGzA/132',NULL,'2001-05-17',NULL,NULL),('oU5Yyt5JBvj_4M0DdNBTMlzoG-t4',NULL,'xx',NULL,NULL,0,2,'https://thirdwx.qlogo.cn/mmopen/vi_32/5Xa4AibCQXuDRKPXSR6IiaR0snfiaOAv65Rl5fib3BJNdz0mohK2EcyjP1GVFfL8OhUPuqMLSlw1PAHHm1z0aK32Wg/132',NULL,NULL,NULL,NULL),('oU5Yyt8lensDsgkxKTLe-6HvLH10',NULL,'老豆','运维工程师',NULL,0,2,'https://thirdwx.qlogo.cn/mmopen/vi_32/YWoCLgtU0FEXnwO0yU392VujEmDkMeIG08gGZ6dB9wvNuaZ3XcJtdH9WWMF4icTCibGgz02FjuLkVJpA19Echv0g/132',NULL,NULL,NULL,NULL),('oU5Yytzsl8S1XKbp1AIwMZsybVZc','小步创想慧联科技','小雨','HR',NULL,0,2,'https://thirdwx.qlogo.cn/mmopen/vi_32/SC1wIFhRgTtVL0kTQiaqSib4jwnlR0zQx4MB82u4t8JR9oMgC4pEhE97zMmGrDw249cjN60RoBhVwuQMr8diaSQsw/132',NULL,NULL,NULL,NULL),('xxx','','姚海雄',NULL,NULL,0,2,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `creatTime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'admin','123456','','',''),(4,'sakura','123456','','',''),(32,'asdsa','123454','577492203@qq.com','3256578','2023-01-10 21:29:51'),(33,'大大','123456789','577492203@qq.com','417867865','2023-01-11 21:5:28'),(36,'sda','sdad','sadasdsda',NULL,NULL),(37,'sdasd','asdasd','dasd',NULL,NULL),(38,'sad','asd','sad',NULL,NULL),(39,'sdasd','dasd','dasdas',NULL,NULL);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ego'
--

--
-- Dumping routines for database 'ego'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-31 14:55:57
