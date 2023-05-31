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
INSERT INTO `project` VALUES (1,'华硕/ASUS','www.yvone-cormier.org','我们的产品，物美价廉，产品功好，耐用','87133','466','椅子','77451','123','12','1663296279647','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(3,'微软/Microsoft','www.julio-okuneva.name','我们的产品，物美价廉，产品功好，耐用','970797555','453','椅子','92395574','123','12','1644409647792','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(5,'戴尔/DELL','www.felipe-nienow.name','我们的产品，物美价廉，产品功好，耐用','85','487','椅子','91642255','123','12','1653054938850','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(7,'微软/Microsoft','www.logan-hegmann.biz','我们的产品，物美价廉，产品功好，耐用','633','458','椅子','9614950923','123','12','1653126207213','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(8,'三星/SAMSUNG','www.yvone-feil.info','我们的产品，物美价廉，产品功好，耐用','74700','483','椅子','8271','123','12','1647656207337','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(9,'华为/HUAWEI','www.elmo-adams.co','我们的产品，物美价廉，产品功好，耐用','49','469','椅子','4','123','12','1655413321520','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(16,'联想/Lenovo','www.erlene-goodwin.co','我们的产品，物美价廉，产品功好，耐用','369464883','458','椅子','312474547','123','12','1658882795943','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(20,'宏碁/ACER','www.norbert-lindgren.com','我们的产品，物美价廉，产品功好，耐用','6122','491','椅子','3','123','12','1665269119785','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(23,'联想/Lenovo','www.marchelle-botsford.biz','我们的产品，物美价廉，产品功好，耐用','66930831','461','椅子','302440192','123','12','1647265451442','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(48,'宏碁/ACER','www.bobbye-beahan.io','我们的产品，物美价廉，产品功好，耐用','9','481','椅子','1497388','123','12','1658638381433','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(59,'戴尔/DELL','www.rossana-hauck.co','我们的产品，物美价廉，产品功好，耐用','9146669244','463','椅子','81912498','123','12','1656545091118','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(62,'联想/Lenovo','www.lianne-bode.net','我们的产品，物美价廉，产品功好，耐用','22','490','椅子','57','123','12','1669452052047','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(91,'惠普/HP','www.hiedi-becker.com','我们的产品，物美价廉，产品功好，耐用','572436','471','椅子','2762','123','12','1668907870804','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(196,'苹果/APPLE','www.thu-denesik.name','我们的产品，物美价廉，产品功好，耐用','171593','484','椅子','179302','123','12','1652461496772','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(329,'微星/MSI','www.sharell-schmidt.info','我们的产品，物美价廉，产品功好，耐用','92048326','459','椅子','7358115','123','12','1654816231768','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(552,'华硕/ASUS','www.frederick-torphy.co','我们的产品，物美价廉，产品功好，耐用','27','466','椅子','9110','123','12','1652483528416','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(581,'华硕/ASUS','www.larisa-bartoletti.net','我们的产品，物美价廉，产品功好，耐用','522','471','椅子','169288997','123','12','1644381898303','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(647,'宏碁/ACER','www.garrett-lindgren.co','我们的产品，物美价廉，产品功好，耐用','2002','472','椅子','41974797','123','12','1662714614456','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(794,'戴尔/DELL','www.jay-runolfsson.biz','我们的产品，物美价廉，产品功好，耐用','2482360','468','椅子','8147395146','123','12','1657583128520','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(803,'惠普/HP','www.martin-kohler.org','我们的产品，物美价廉，产品功好，耐用','3','461','椅子','0','123','12','1667083407183','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(909,'华为/HUAWEI','www.destiny-hegmann.info','我们的产品，物美价廉，产品功好，耐用','6215','466','椅子','4727361','123','12','1662932512463','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(1852,'联想/Lenovo','www.tiny-brakus.biz','我们的产品，物美价廉，产品功好，耐用','6','457','椅子','863274834','123','12','1648545249588','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(2328,'宏碁/ACER','www.henriette-marks.io','我们的产品，物美价廉，产品功好，耐用','4854543','485','椅子','2659','123','12','1652833310179','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(2906,'其它','www.theda-weimann.org','我们的产品，物美价廉，产品功好，耐用','478','458','椅子','5645278692','123','12','1650269036831','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(3154,'其它','www.gabriela-romaguera.name','我们的产品，物美价廉，产品功好，耐用','791192','472','椅子','6276','123','12','1656882123808','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(4591,'三星/SAMSUNG','www.carlos-medhurst.biz','我们的产品，物美价廉，产品功好，耐用','28213','467','椅子','5','123','12','1650103029572','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(5190,'其它','www.yu-gutmann.co','我们的产品，物美价廉，产品功好，耐用','8699','467','椅子','642160538','123','12','1652868650315','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(5809,'惠普/HP','www.timothy-blanda.io','我们的产品，物美价廉，产品功好，耐用','822658229','474','椅子','7329159','123','12','1647987151632','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(8860,'其它','www.jayme-lubowitz.org','我们的产品，物美价廉，产品功好，耐用','607322439','482','椅子','6990530125','123','12','1670288599747','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(10015,'三体-刘慈欣','','未来科幻','99','',NULL,'999','','','','','<p>这是大刘的得意之作，连奥巴马都喜欢看！</p>',NULL),(10028,'梦里花落知多少','2.jpg','小时代！！！','11','10001',NULL,'11','','','','','<p>还不错，但是要看书籍，不要看电影</p>',NULL),(10031,'我与地坛','','做一个不动声色的人','55','',NULL,'464','','','','','人生尔尔，错过了，就是一辈子',NULL),(10032,'舞！舞！舞！','','村上春树经典作品','234','43',NULL,'34','','','','','人不是慢慢变老的，而是一瞬间变老的',NULL),(10033,'岁月神偷','','经典书籍','23','',NULL,'23','','','','','我没有精力去认识一个新的人，或者花力气去宠福新维系一段感情，跟没办法在把自己的故事讲述一遍又一遍',NULL),(10035,'解忧杂货店','','无论现在有多么的不开心，你要相信明天会比今天更好','34','',NULL,'12','','','','','<p>无论现在有多么的不开心，你要相信明天会比今天更好!!!!</p>',NULL),(10038,'小王子','','写给成年人的童话故事','20','',NULL,'1','','1','','','所有人都曾是小孩，虽然之后少数人记得',NULL),(10039,'笑场','mock\\upload\\1585277506405-u=2137641711,889921437&fm=26&gp=0.jpg','李诞的作品，很有意思，集成了扯经','55','100002',NULL,'1000','','1','','','<p>未曾开言，我先笑场，笑过之后，听我来诉一诉衷肠</p>',NULL),(10040,'万历十五年','mock\\upload\\1585277681739-u=2137641711,889921437&fm=26&gp=0.jpg','人民的名义里面出现过很多次','45','10002',NULL,'26','','1','','','<p>在明朝当皇帝其实没那么幸福，比其清朝来说，还是清朝的皇帝牛逼，毕竟清朝才是更加牛逼的中央集权制</p>',NULL),(10084,'666','','666','666','','','666','','1','','','<p>666</p>',NULL),(10085,'888','','88','888','','','888','','1','','','<p>888</p>',NULL),(10088,'888','','888','88','','','888','','1','','','<p>8888</p>',NULL),(10089,'999','','99','999','','','99','','1','','','<p>999</p>',NULL),(10090,'3333','','','333','','','333','','1','','','<p>3333</p>',NULL),(10091,'4444','','','444','','','444','','1','','','<p>4444</p>',NULL),(10092,'ioii','','hhh','hhh','','','hhhh','','1','','','<p>hhh</p>',NULL),(10093,'jjj','','jjj','jjj','10001','电视','jjj','','1','','','<p>jjj</p>',NULL),(10094,'666','','66','66','10001','电视','66','','1','','','<p>66</p>',NULL),(10095,'444','','44','444','10001','电视','444','','1','','','<p>4444</p>','[{\"value\":\"\",\"name\":\"基本参数\",\"children\":[{\"value\":\"44\",\"name\":\"电视大小\"},{\"value\":\"44\",\"name\":\"尺寸单位\"}]}]'),(10096,'777','','777','77','','电视','77','','1','','','<p>777</p>','[{\"value\":\"\",\"name\":\"基本参数\",\"children\":[{\"value\":\"77666\",\"name\":\"电视大小\"},{\"value\":\"77677\",\"name\":\"尺寸单位\"}]}]'),(10097,'888','http://localhost:3065/upload/1616920627783-QQ图片20200722115959.jpg','','88','','','8','','1','','','','[]'),(10098,'hhh','http://localhost:3065/1616921161534-QQ图片20200722115959.jpg','','hh','','','hhh','','1','','','','[]'),(10099,'','','','','','','','','1','','','',''),(10100,'','','','','','','','','1','','','',''),(10102,'ggg','','44','54','','','45','','1','','','',''),(10107,'电视长虹','http://localhost:4000/1617103475898-qq.jpg','111','111','10001','电视','223','','1','','','<p>4444最好的电视</p>',''),(10108,'家具用品','http://localhost:4000/1617103894235-qq.jpg','www','12.00','1004','家具/家居','3445','','1','','','<p>哈哈哈，看看怎么样吧，测试数据</p>',''),(10112,'游戏光盘','http://localhost:4000/1617104395957-qq.jpg','1323','45.34','10004','游戏设备','3455','','1','','','<p>目前加入的prop 那么神奇吗</p>',''),(10117,'天高任鸟飞，海阔凭鱼跃','','心敢比天高','1200.00','','','1','','1','','','<p>越自律越优秀</p>',''),(10121,'灌灌灌灌','http://localhost:3000/1617242837899-qq.jpg','455','455','10002','家纺','455','','1','','','<p>4555</p>',''),(10138,'对对对','','11','11','1003','电脑/办公','11','','1','','','<p>111</p>','[{\"value\":\"22\",\"title\":\"基本信息\",\"children\":[{\"value\":\"22\",\"title\":\"外观\"}]},{\"value\":\"22\",\"title\":\"特殊配置\",\"children\":[{\"value\":\"22\",\"title\":\"内存\"}]}]'),(10139,'666','','','666','10001','手机通讯','666','','1','','','',''),(10140,'888','','888888','888','1004','家具/家居','888','','1','','','<p>888</p>','[{\"value\":\"纯棉66\",\"title\":\"材料\",\"children\":[{\"value\":\"新疆棉花66\",\"title\":\"纯棉\"},{\"value\":\"嗯嗯66\",\"title\":\"蕾丝\"}]}]'),(10141,'444','','444','444','10002','运营商','444','','1','','','<p>444</p>',''),(10142,'444879','http://localhost:8989/1654528768268-1.jpg','78756','44457878','','','4447979','','1','','','<p>的哈哈单号</p>',''),(10143,'444879','http://localhost:8989/1654528768268-1.jpg','78756','44457878','','','4447979','','1','','','<p>的哈哈单号</p>',''),(10144,'444879','http://localhost:8989/1654528768268-1.jpg','78756','44457878','','','4447979','','1','','','<p>的哈哈单号</p>',''),(10145,'12','','212','12','','','12','','1','','','<p>1212</p>',''),(10146,'','','','','','','','','1','','','',''),(10148,'11112222','','11111000','1111222','10002','运营商','1111','','1','','','<p>00000</p>',''),(10155,'大四','http://localhost:8989/1665300154022-C00E983C1C39880AA0380312B8B551A6.jpg','s大四','阿达','10004','冰箱','阿松大','','1','','','',''),(10157,'落魄山','','','800','555668','','','','1','','','太猛了',''),(10158,'落魄山','','','800','555668','','','','1','','','太猛了',''),(10159,'落魄山','','','800','555668','','','','1','','','太猛了',''),(10160,'落魄山','','','800','555668','','','','1','','','太猛了',''),(10161,'落魄山','','','800','555668','','','','1','','','太猛了',''),(10162,'落魄山','','','800','555668','','','','1','','','太猛了',''),(10163,'落魄山','','','800','555668','','','','1','','','太猛了',''),(10164,'落魄山','','','800','555668','','','','1','','','太猛了',''),(10165,'落魄山','','','800','555668','','','','1','','','太猛了',''),(10166,'落魄山','','','800','555668','','','','1','','','太猛了',''),(10167,'落魄山','','','800','555668','','','','1','','','太猛了',''),(10168,'落魄山','','','800','555668','','','','1','','','太猛了',''),(10169,'落魄山','','','800','555668','','','','1','','','太猛了',''),(10170,'','','','','','','','','1','','','',''),(10173,'','','','','','','','','1','','','',''),(10174,'落魄山','','','800','555668','','','','1','','','太猛了',''),(10175,'落魄山gjj','','','800','555668','','','','1','','','太猛了',''),(10176,'落魄山gjj','','','800','555668','','','','1','','','太猛了',''),(10177,'落魄山gjj','','','800','555668','','','','1','','','太猛了',''),(10180,'落魄山gjj','','','800','555668','','','','1','','','太猛了',''),(10182,'披云山','','','1200','00765','','','','1','','','落魄山好友',''),(10183,'披云山','','','1200','00765','','','','1','','','落魄山好友',''),(10188,'商品描述weq','','','恶趣味','问起我','','','','1','','','问请问',''),(10189,'商品描述weq','','','恶趣味元','问起我88888','','','','1','','','问请问',''),(10195,'披云山','','','1200元元','00765','','','','1','','','落魄山好友',''),(10197,'披云山苟富贵','','','1200元元元元','00765d','','','','1','','','落魄山好友杀杀杀',''),(10198,'披云山','','','1200元元元','00765','','','','1','','','落魄山好友不不不',''),(10199,'d阿松大','','','啊实打实但','啊实打实但','','','','1','','','阿三打撒',''),(10200,'披云山','','','1200元元元元','00765','','','','1','','','落魄山好友不不不',''),(10201,'披云山','','','1200','00765','','','','1','','','落魄山好友不不不',''),(10202,'披云山','','','1200元','00765','','','','1','','','落魄',''),(10203,'披云山8888','','555','420','00765','','8888','','1','','','<p>落魄</p>',''),(10204,'颤三  ','','','十点四十','大苏打','','','','1','','','的权威权威',''),(10205,'搭建先','','','333','333','','','','1','','','34234',''),(10207,'11111','','asdasdasd','阿松大元元','阿斯顿撒旦','7777','5555sadas','','1','','','<p>阿松大sdasdasd</p>',''),(10211,'weqwe','','','额权威',' 权威权威q\'w','权威','qwe权威我去恶趣味','','1','','','去恶趣味',''),(10212,'77','萨达撒','','大撒大撒元元元','s大as','','d阿三打撒','','1','','','大四',''),(10217,'','','','','','','','','1','','','',''),(10218,'','','','','','','','','1','','','',''),(10219,'','','','','','','','','1','','','',''),(10220,'wqeqw','weqwe','椅子','1434123','323','椅子','3434','','1','','','qweq',''),(10222,'椅子DYS-312','783783','椅子','31323','31545','椅子','343','','1','','','落魄山好友不不不水水水水',''),(16789,'冰箱华为/HUAWEI','www.wilford-hickle.name','我们的产品，物美价廉，产品功好，耐用','9元','456','冰箱','174005','123','12','1643131719368','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(44457,'沙发Microsoft','www.annamaria-douglas.net','我们的产品，物美价廉，产品功好，耐用','3008621元','456','沙发','657952','123','12','1659695420418','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(47880,'其它','www.lynn-gorczany.biz','我们的产品，物美价廉，产品功好，耐用','258508','479','椅子','2621195','123','12','1653263131367','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(49522,'戴尔/DELL','www.dillon-dibbert.biz','我们的产品，物美价廉，产品功好，耐用','1','470','椅子','127','123','12','1641559551346','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(64389,'苹果冰箱/APPLE','www.buck-sanford.com','我们的产品，物美价廉，产品功好，耐用','85495元','463','冰箱','9506131154','123','12','1671474956113','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(68575,'家具微软/Microsoft','www.kirby-mckenzie.biz','我们的产品，物美价廉，产品功好，耐用','94元','473','家具','1704786','123','12','1647605818784','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(93631,'三星/SAMSUNG','www.garry-johns.name','我们的产品，物美价廉，产品功好，耐用','557','457','椅子','4383681','123','12','1655534697754','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(94026,'华硕/ASUS','www.alva-stamm.info','我们的产品，物美价廉，产品功好，耐用','2966035434','471','椅子','4150','123','12','1655693660483','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(571408,'其它','www.yasmin-hamill.name','我们的产品，物美价廉，产品功好，耐用','720795','454','椅子','291','123','12','1643152255689','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(808531,'联想/Lenovo','www.sheldon-wiza.info','我们的产品，物美价廉，产品功好，耐用','2','460','椅子','3736441118','123','12','1660932623077','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(828101,'微软家具/Microsoft','www.melba-lang.info','我们的产品，物美价廉，产品功好，耐用','282066元','470','家具','4','123','12','1665598491204','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(880525,'其它','www.eryn-mclaughlin.io','我们的产品，物美价廉，产品功好，耐用','4095','469','椅子','1553183','123','12','1664314516121','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(883662,'冰箱','www.desmond-conn.name','我们的产品，物美价廉，产品功好，耐用','2078987922元','459','冰箱','56874','123','12','1648404602574','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(1743080,'家具三星/SAMSUNG','www.blair-flatley.biz','我们的产品，物美价廉，产品功好，耐用','846534826元','462','家具','26373','123','12','1660604305944','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(1841463,'沙发华硕/ASUS','www.julianna-stark.org','我们的产品，物美价廉，产品功好，耐用','363864190元','453','沙发','17','123','12','1645553237536','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(2385481,'华为/HUAWEI','www.blondell-rohan.co','我们的产品，物美价廉，产品功好，耐用','41860455','467','椅子','37','123','12','1669349072134','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(2930295,'沙发/HP','www.venetta-mueller.org','我们的产品，物美价廉，产品功好，耐用','92889733元','468','沙发','372741','123','12','1642299491969','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(3473850,'三星沙发/SAMSUNG','www.leandra-murphy.io','我们的产品，物美价廉，产品功好，耐用','4元','476','沙发','4070474','123','12','1642575966301','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(4204833,'灯/Lenovo','www.berry-roob.co','我们的产品，物美价廉，产品功好，耐用','2元','465','灯','999181917','123','12','1662459817221','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(5082535,'惠普/HP','www.sharell-dicki.org','我们的产品，物美价廉，产品功好，耐用','434724843','457','椅子','9830394','123','12','1661526495670','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(5221342,'灯微星/MSI','www.darrell-gutkowski.co','我们的产品，物美价廉，产品功好，耐用','94700803元','488','灯','6363864807','123','12','1656345204335','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(6093334,'家具/ACER','www.adriane-keeling.org','我们的产品，物美价廉，产品功好，耐用','66215236元','468','家具','542768','123','12','1646621416257','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(6629784,'冰箱华为/HUAWEI','www.corrina-lockman.co','我们的产品，物美价廉，产品功好，耐用','96764446元','492','椅子','71606','123','12','1653979604827','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(8099223,'灯/DELL','www.gail-champlin.name','我们的产品，物美价廉，产品功好，耐用','8元','462','灯','67313105','123','12','1664410708541','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(9411758,'宏碁/ACER','www.reed-langworth.info','我们的产品，物美价廉，产品功好，耐用','66842993','464','椅子','2','123','12','1665266590087','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(17744862,'其它','www.jonell-maggio.com','我们的产品，物美价廉，产品功好，耐用','3223','463','椅子','66','123','12','1664970768046','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(30112084,'冰箱华硕/ASUS','www.mendy-kozey.biz','我们的产品，物美价廉，产品功好，耐用','25808101元','455','冰箱','285','123','12','1659960617782','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(35900855,'椅子/MSI','www.celina-cormier.org','我们的产品，物美价廉，产品功好，耐用','719556693元','464','椅子','5','123','12','1668690974200','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(44573668,'椅子/Microsoft','www.eden-lueilwitz.net','我们的产品，物美价廉，产品功好，耐用','152483417元','465','椅子','3935271','123','12','1656861058416','123','椅子/Microsoft的商品，功能齐全，物有所值，适合广大用户',''),(50467692,'苹果/APPLE','www.annie-auer.info','我们的产品，物美价廉，产品功好，耐用','1','470','椅子','5','123','12','1662778812300','123','我们的商品，功能齐全，物有所值，适合广大用户',NULL),(75782364,'冰箱er','www.tyrone-wunsch.io','我们的产品，物美价廉，产品功好，耐用','574939142元','454','冰箱','739992396','123','12','1653911138701','123','冰箱er的商品，功能齐全，物有所值，适合广大用户',''),(86233063,'冰箱/HP','www.maryellen-buckridge.biz','我们的产品，物美价廉，产品功好，耐用','187402934元','460','冰箱','91663','123','12','1654290631342','123','冰箱/HP的商品，功能齐全，物有所值，适合广大用户',''),(361790124,'冰箱/ACER','www.efrain-hilpert.com','我们的产品，物美价廉，产品功好，耐用','38869516元','454','冰箱','938232536','123','12','1662815347945','123','冰箱/ACER的商品，功能齐全，物有所值，适合广大用户',''),(430023020,'微星冰箱/MSI','www.len-erdman.org','我们的产品，物美价廉，产品功好，耐用','13434653元','460','冰箱','50','123','12','1641983600331','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(610876577,'灯/Lenovo','www.dede-christiansen.net','我们的产品，物美价廉，产品功好，耐用','9147元','465','灯','86','123','12','1644850023311','123','灯/Lenovo的商品，功能齐全，物有所值，适合广大用户',''),(709464246,'沙发DS-4','www.laverne-batz.biz','我们的产品，物美价廉，产品功好，耐用','6745636元','475','沙发','8719','123','12','1655937247124','123','沙发DS-4，功能齐全，物有所值，适合广大用户',''),(724783033,'椅子SAMSUNG','www.shenna-homenick.io','我们的产品，物美价廉，产品功好，耐用','988389636元','456','椅子','254653726','123','12','1644121536296','123','椅子SAMSUNG的商品，功能齐全，物有所值，适合广大用户',''),(733329921,'沙发/Microsoft','www.nilda-mosciski.org','我们的产品，物美价廉，产品功好，耐用','7659元','486','沙发','202475228','123','12','1651917467264','123','沙发/Microsoft的商品，功能齐全，物有所值，适合广大用户',''),(756949728,'吊灯/MSI','www.pearlene-bergnaum.com','我们的产品，物美价廉，产品功好，耐用','3288723207元元元','461','灯','9279','123','12','1659281155128','123','我们的商品，功能齐全，物有所值，适合广大用户',''),(816746266,'椅子-DA','www.nella-hand.info','我们的产品，物美价廉，产品功好，耐用','20元元','455','椅子','106711645','123','12','1669448040989','123','椅子-DA的商品，功能齐全，物有所值，适合广大用户',''),(1004030401,'椅子/Lenovo','www.angelic-adams.com','我们的产品，物美价廉，产品功好，耐用','88085138元元','477','椅子','74','123','12','1671364967878','123','椅子/Lenovo，功能齐全，物有所值','');
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
INSERT INTO `role` VALUES (1,'梁明杰','2022-08-30 22:37:30','武航','2022-12-10 12:00:32','/home,/role,/charts/bar','6'),(2,'沈嘉熙','2022-07-07 09:13:40','沈振家','2022-11-02 21:25:41','/home,/role,/charts/bar','234542'),(3,'严天宇','2022-01-17 10:16:29','苏苑博','2022-02-15 12:23:20','/home,/role,/charts/bar','42092207'),(4,'邵智辉','2022-02-19 11:36:33','戴鑫鹏','2022-04-07 23:33:18','/home,/role,/charts/bar','34541'),(5,'龚睿渊','2022-04-28 18:42:41','史博涛','2022-09-21 15:26:05','/home,/role,/charts/bar','98'),(6,'孔烨霖','2022-07-03 06:20:26','冯鹏飞','2022-12-03 22:48:50','/home,/role,/charts/bar','764022'),(7,'卢明哲','2022-09-10 07:48:26','阎伟宸','2022-08-26 22:01:08','/home,/role,/charts/bar','13335522'),(8,'崔立辉','2022-02-14 01:03:09','梁健雄','2022-04-18 16:27:52','/home,/role,/charts/bar','607'),(9,'许旭尧','2022-08-16 12:31:27','郭志泽','2022-05-16 23:07:36','/home,/role,/charts/bar','316'),(10,'刘明轩','2022-06-28 12:36:59','贺智宸','2022-05-31 20:36:43','/home,/role,/charts/bar','4875713877'),(11,'吴思聪','2022-03-01 01:05:33','袁烨伟','2022-12-07 20:18:45','/home,/role,/charts/bar','659307516'),(12,'程梓晨','2022-02-07 05:03:37','洪弘文','2022-02-24 02:45:52','/home,/role,/charts/bar','53097147'),(13,'杜旭尧','2022-12-13 22:45:49','郑伟诚','2022-05-24 00:28:35','/home,/role,/charts/bar','8'),(14,'贺语堂','2022-11-15 16:28:14','黎立轩','2022-07-13 10:25:37','/home,/role,/charts/bar','118762'),(15,'阎鸿涛','2022-04-07 23:14:13','蒋炎彬','2022-06-14 08:29:23','/home,/role,/charts/bar','62895'),(16,'梁擎苍','2022-12-01 15:58:12','石凯瑞','2022-07-06 07:21:46','/home,/role,/charts/bar','36811108'),(17,'贺笑愚','2022-01-18 13:26:41','戴鹏飞','2022-10-23 14:10:23','/home,/role,/charts/bar','845650796'),(18,'余耀杰','2023-01-15 17:41:51','admin','2022-07-06 16:33:36','/home,/role,/charts/bar,/charts/line','1808518982'),(19,'于鹏','2022-04-16 00:57:11','赖熠彤','2022-05-06 17:34:34','/home,/role,/charts/bar','11'),(20,'罗博文','2023-01-15 15:49:52','admin','2022-04-20 00:11:46','/home,/charts/line','4264045336'),(33,'威威','2023-01-9 22:16:38','admin','2023-01-9 22:16:38','','855'),(34,'威威','2023-01-15 15:50:36','admin','2023-01-9 22:16:38','/product,/home,/charts/bar,/charts/line','855'),(35,'威威','2023-01-15 17:43:35','admin','2023-01-9 22:16:38','/home,/charts/pie,/charts/line,/category','855'),(36,'罗博文','2023-01-15 17:47:39','admin','2022-04-20 00:11:46','/home,/category,/charts/line,/charts,/charts/bar,/charts/pie,/order,/role,/user,/product,/products,all','4264045336'),(37,'weqwq','2023-01-15 17:50:27','admin','2023-01-15 17:50:27','','976'),(38,'hh','2023-01-15 18:16:18','admin','2023-01-15 17:51:1','/home,/category,/products,/charts/bar,/product,/charts/line','687'),(39,'ff','2023-01-15 18:20:44','admin','2023-01-15 18:20:36','/charts/line,/charts/bar','849');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'admin','123456','','',''),(4,'sakura','123456','','',''),(32,'asdsa','123454','577492203@qq.com','3256578','2023-01-10 21:29:51'),(33,'大大','123456789','577492203@qq.com','417867865','2023-01-11 21:5:28');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-18 16:18:24
