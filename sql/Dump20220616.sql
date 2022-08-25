-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: term_project
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `123456_course`
--

DROP TABLE IF EXISTS `123456_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `123456_course` (
  `teacher` char(20) NOT NULL,
  `Cname` char(20) DEFAULT NULL,
  `Cno` char(10) DEFAULT NULL,
  `Cpno` char(10) DEFAULT NULL,
  `Ctime` char(20) DEFAULT NULL,
  `Cloc` char(20) DEFAULT NULL,
  `plim` char(10) DEFAULT NULL,
  `selperson` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `123456_course`
--

LOCK TABLES `123456_course` WRITE;
/*!40000 ALTER TABLE `123456_course` DISABLE KEYS */;
INSERT INTO `123456_course` VALUES ('廖清','  网球','  pe003','  -',' 星期五  8:30-10:10','  网球场','168','0'),('徐飞','  游泳','  pe005','   -','   星期五  15:45-17:25','    游泳馆','164','0'),('宋明','  电子电工技术','  t001','  h001',' 星期一  13:00-15:35','  C-201','65','0'),('卢胜','  操作系统','  t019','  h004','  星期一 18:30-21:05','  Lab101','31','0');
/*!40000 ALTER TABLE `123456_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admintable`
--

DROP TABLE IF EXISTS `admintable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admintable` (
  `adminID` char(20) NOT NULL,
  `adminPW` char(20) NOT NULL,
  `adminPH` char(20) NOT NULL,
  PRIMARY KEY (`adminID`),
  UNIQUE KEY `adminID` (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admintable`
--

LOCK TABLES `admintable` WRITE;
/*!40000 ALTER TABLE `admintable` DISABLE KEYS */;
INSERT INTO `admintable` VALUES ('123456','123456','123456'),('999999','999999','999999');
/*!40000 ALTER TABLE `admintable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `teacher` char(20) DEFAULT NULL,
  `Cname` char(20) DEFAULT NULL,
  `Cno` char(10) NOT NULL,
  `Cpno` char(10) DEFAULT NULL,
  `Ctime` char(20) DEFAULT NULL,
  `Cloc` char(20) DEFAULT NULL,
  `plim` int DEFAULT NULL,
  `selperson` int DEFAULT NULL,
  PRIMARY KEY (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('文钦羽','  书法鉴赏','    a012','  -','  星期四   13:00-14:40','    B-313',64,0),('曲杰','  影视鉴赏','    a013','  -',' 星期四    15:45-17:25','  D-405',57,0),('仇力','  歌剧鉴赏','    a026','   -','星期一   8:30-10:10','   J-101',45,0),('王德发','  戏曲鉴赏','  a025','  -','星期二  10:20-12:00','  E-212',98,0),('万彧','  建筑艺术鉴赏','  a028','  -','星期一  10:20-12:00','  C-110',79,0),('郦和平','  综合英语','  e001','   -',' 星期四     8:30-10:10','  E-210',143,0),('黄胜华','  商务信函规范','  e004','  h022','  星期一   13:00-14:40','  D-203',29,0),('张福良','  英语写作','  e011','  h021','   星期二  10:20-12:00','     F-110',46,0),('王小龙','  高级英语视听说','  e012','  h023','星期二  10:20-12:00','  E-201',45,0),('陈晓丹','  英美文化概论','  e013','  h020','  星期三  8:30-10:10','  E-304',41,0),('史文娟','  实用文体翻译','  e016','    h021','  星期五   8:30-10:10','  F-405',65,0),('胡天秀','  商务英语','  e019','    h026','  星期四   18:30-21:05','    E-305',76,0),('赵思敏','  初级日语','  e024','  h027',' 星期三 15:45-17:25','    F-202',41,0),('林新','  西语应用','  e030','  h022','星期二  10:20-12:00','  D-306',43,0),('阳美琴','  中级法语','  e045','  h025','星期一  18:30-21:05','  D-309',36,0),('李春生','  大学生职业发展规划','  hs001','  -',' 星期五  18:30-21:05','H112',438,0),('任万里','  大学生心理健康','  hs002','  -',' 星期五  8:30-11:05','    E-501',228,0),('温祥云','  社会应用心理学','  hs004','  -',' 星期四    18:30-21:05','  F-207',381,0),('牛伟国','  科学技术史','  hs005','  -',' 星期五  18:30-20:10','  C-111',125,0),('马壮实','  中国古典文学概论','  hs009','  -',' 星期四  10:20-12:00',' H102',172,0),('祁伟通','  宏观经济学(曼昆)','  m004','  k001','星期三  18:30-21:05','  F-112',60,0),('邢建国','  政治经济学','  m008','  k003','星期五  8:30-10:10','  C-202',98,0),('伍凯','  金融学','  m010','  k002',' 星期三 13:00-15:35','  H-101',154,0),('韩大鹏','  金融信息管理','  m014','  k002','星期三  8:30-11:05','  G-216',68,0),('熊海涛','  中级微观经济学','  m021','  k007','星期三  14:50-17:25','  J-214',48,0),('刘开然','  管理学','  m032','  -','星期一  8:30-10:10','    B-501',130,0),('李永胜','  公共管理','  m034','  k013','星期二  13:00-15:35','    D-313',64,0),('莫林峰','  计量经济学','  m035','    k009',' 星期四    14:50-17:25','   E-304',60,0),('钱多多','  运筹学','  m043','    k017','星期二    18:30-21:05','  H-306',154,0),('韦曲南','  工商管理','  m121','  -',' 星期四    8:30-11:05','  G-116',97,0),('袁鹏举','  乒乓球','  pe001','    -','  星期五  13:00-14:40','    乒乓球场',128,0),('刘永平','  羽毛球','  pe002','   -','  星期五 8:30-10:10','    运动场',154,0),('廖清','  网球','  pe003','  -',' 星期五  8:30-10:10','  网球场',168,1),('徐飞','  游泳','  pe005','   -','   星期五  15:45-17:25','    游泳馆',164,1),('项菲','  瑜伽','  pe010','  -',' 星期五 10:20-12:00','  体育馆',88,0),('宋明','  电子电工技术','  t001','  h001',' 星期一  13:00-15:35','  C-201',65,1),('秦倩','  通信原理','  t003','  h002',' 星期一  8:30-10:10','  B-418',122,0),('索迁','  Python入门与应用','  t010','  -','星期一  14:50-17:25','  Lab201',68,0),('欧阳寻','  JSP实用教程','  t013','  -','星期一  8:30-11:05','  Lab208',91,0),('孙庆丰','  PHP程序设计','  t016','  -',' 星期二 13:00-15:35','    Lab104',33,0),('卢胜','  操作系统','  t019','  h004','  星期一 18:30-21:05','  Lab101',31,1),('杨兴宇','  高等数学I','  t021','  -','  星期二 8:30-10:10','   H-502',187,0),('霍爱莲','  数值分析原理','  t023','  h009','  星期二  8:30-10:10','  G-109',154,0),('吴波','  概率论与数理统计','  t024','  h009',' 星期二 8:30-10:10','  G-203',91,0),('刘培元','  大数据算法分析','  t027','  -','  星期二 18:30-21:05','  Lab201',66,0);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pe003_student`
--

DROP TABLE IF EXISTS `pe003_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pe003_student` (
  `Sno` char(20) NOT NULL,
  `Sname` char(20) DEFAULT NULL,
  `Sgrade` char(20) DEFAULT NULL,
  `Sdept` char(20) DEFAULT NULL,
  `Saca` char(20) DEFAULT NULL,
  `Spswd` char(20) DEFAULT NULL,
  `Sphone` char(20) DEFAULT NULL,
  `Sclno` char(100) DEFAULT NULL,
  PRIMARY KEY (`Sno`),
  UNIQUE KEY `Sno` (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pe003_student`
--

LOCK TABLES `pe003_student` WRITE;
/*!40000 ALTER TABLE `pe003_student` DISABLE KEYS */;
INSERT INTO `pe003_student` VALUES ('123456','测试员','-','-','-','123456','123456','-');
/*!40000 ALTER TABLE `pe003_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pe005_student`
--

DROP TABLE IF EXISTS `pe005_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pe005_student` (
  `Sno` char(20) NOT NULL,
  `Sname` char(20) DEFAULT NULL,
  `Sgrade` char(20) DEFAULT NULL,
  `Sdept` char(20) DEFAULT NULL,
  `Saca` char(20) DEFAULT NULL,
  `Spswd` char(20) DEFAULT NULL,
  `Sphone` char(20) DEFAULT NULL,
  `Sclno` char(100) DEFAULT NULL,
  PRIMARY KEY (`Sno`),
  UNIQUE KEY `Sno` (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pe005_student`
--

LOCK TABLES `pe005_student` WRITE;
/*!40000 ALTER TABLE `pe005_student` DISABLE KEYS */;
INSERT INTO `pe005_student` VALUES ('123456','测试员','-','-','-','123456','123456','-');
/*!40000 ALTER TABLE `pe005_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `Sno` char(20) NOT NULL,
  `Sname` char(20) DEFAULT NULL,
  `Sgrade` char(20) DEFAULT NULL,
  `Sdept` char(20) DEFAULT NULL,
  `Saca` char(20) DEFAULT NULL,
  `Spswd` char(20) DEFAULT NULL,
  `Sphone` char(20) DEFAULT NULL,
  `Sclno` char(100) DEFAULT NULL,
  PRIMARY KEY (`Sno`),
  UNIQUE KEY `Sno` (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('123456','测试员','-','-','-','123456','123456','-'),('20180184','   邱同权','   2018级','   电子信息工程','   信息学院','   1234','   13492842192','   h027、h001、h002、t003、h004、t010、h009\r'),('20180473','   赵凌云','   2018级','   金融智能与信息管理','   信息学院','   1234','   19382736472','   t013、t024、h009、t027、t021、m008、k003、k013、k017、k002、pe002\r'),('20180638','   徐福','   2018级','   金融学','   金融学院','   1234','   13383476921','   e013、h020、m004、k003、m008、m010、k002、pe002\r'),('20180727','   胡思敏','   2018级','   会计学','   会计学院','   1234','   19873737412','   t021、hs005、h009、h020、e001\r'),('20180928','   左秋白','   2018级','   金融学','   金融学院','   1234','   1823654921','   e013、h020、m004、k001、h009、m010、k002、pe001、h021\r'),('20182318','   黄滨','   2018级','   人力资源管理','   公管学院','   1234','   17392783432','   m032、a028、k001、k007、k009、m035、t021\r'),('20190101','   范曦若','   2019级','   投资学','   财税学院','   1234','   18463228134','   m004、k001、m021、pe003、k007、h021、h026\r'),('20190283','   艾夏莲','   2019级','   国际经济与贸易','   国商学院','   1234','   19428469374','   h026、k009、t021、k001、h023\r'),('20190395','   毛天赐','   2019级','   经济统计学','   统计学院','   1234','   13847383468','   k002、m032、k013、hs004、h009\r'),('20190417','   梅九织','   2019级','   人力资源管理','   公管学院','   1234','    13527483874','   k013、m032、h021、hs009、e001\r'),('20190541','   叶星','   2019级','   计算机科学与技术','   信息学院','   1234','   18284736518','   h004、t016、t013、m032、h009\r'),('20190581','   周文杰','   2019级','   金融学','   金融学院','   1234','   19283474238','   m021、k002、h021、k017、pe002\r'),('20190787','   聂文源','   2019级','   金融工程','   金融学院','   1234','   19127834732','   pe003、h021、e019、h026、hs004、k002、m010、k002'),('20190794','   元帆','   2019级','   通信工程','   信息学院','   1234','   13984746213','   t003、h002、t019、h004、pe010\r'),('20190987','   魏翔','   2019级','   信息管理与信息系统','   信息学院','   1234','   17837362651','   m032、h022、k017、t010、m021\r'),('20191203','   陆思雨','   2019级','   金融与人工智能','   金融学院','   1234','   13848273643','   t016、t013、a013、hs004、pe005\r'),('20191975','   佘天如','   2019级','   保险学','   保险学院','   1234','   19378462813','   pe010、e004、h022、t021\r'),('20192281','   刘芷若','   2019级','   金融工程','   金融学院','   1234','   18374294742','   e001、t027、t021、h021、a021\r'),('20192481','   李仕奇','   2019级','   商务英语','   外语学院','   1234','   18429347382','   e019、h026、e001、h021、k013、h022\r'),('20200103','   史帅','   2020级','   人工智能','   信息学院','   1234','   18239476293','     -  \r'),('20200134','   高麟','   2020级','   会计学','   会计学院','   1234','   18376481293','     -  \r'),('20200273','   乐诗礼','   2020级','   新闻学','   人文学院','   1234','   19228347431','     -  \r'),('20200284','   海云亮','   2020级','   经济学','   经济学院','   1234','   13424947392','     -  \r'),('20200502','   于彩虹','   2020级','   汉语言文学','   人文学院','   1234','   15992836481','     -  \r'),('20200561','   郑士载','   2020级','   市场营销','   工商学院','   1234','   15728364831','     -  \r'),('20200719','   林雨桐','   2020级','   审计学','   会计学院','   1234','   18735273482','     -  \r'),('20200999','   李祥','   2020级','   法学','   法学院','   1234','   18237483912','     -  \r'),('20201049','   李嘉阳','   2020级','   信息管理与信息系统','   信息学院','   1234','   15938263748','     -  \r'),('20202102','   马诗涵','   2020级','   计算机科学与技术','   信息学院','   1234','   18362749023','     -  \r'),('20202137','   孙奇骏','   2020级','   英语','   外语学院','   1234','   19328275384','     -  \r');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t001_student`
--

DROP TABLE IF EXISTS `t001_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t001_student` (
  `Sno` char(20) NOT NULL,
  `Sname` char(20) DEFAULT NULL,
  `Sgrade` char(20) DEFAULT NULL,
  `Sdept` char(20) DEFAULT NULL,
  `Saca` char(20) DEFAULT NULL,
  `Spswd` char(20) DEFAULT NULL,
  `Sphone` char(20) DEFAULT NULL,
  `Sclno` char(100) DEFAULT NULL,
  PRIMARY KEY (`Sno`),
  UNIQUE KEY `Sno` (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t001_student`
--

LOCK TABLES `t001_student` WRITE;
/*!40000 ALTER TABLE `t001_student` DISABLE KEYS */;
INSERT INTO `t001_student` VALUES ('123456','测试员','-','-','-','123456','123456','-');
/*!40000 ALTER TABLE `t001_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t019_student`
--

DROP TABLE IF EXISTS `t019_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t019_student` (
  `Sno` char(20) NOT NULL,
  `Sname` char(20) DEFAULT NULL,
  `Sgrade` char(20) DEFAULT NULL,
  `Sdept` char(20) DEFAULT NULL,
  `Saca` char(20) DEFAULT NULL,
  `Spswd` char(20) DEFAULT NULL,
  `Sphone` char(20) DEFAULT NULL,
  `Sclno` char(100) DEFAULT NULL,
  PRIMARY KEY (`Sno`),
  UNIQUE KEY `Sno` (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t019_student`
--

LOCK TABLES `t019_student` WRITE;
/*!40000 ALTER TABLE `t019_student` DISABLE KEYS */;
INSERT INTO `t019_student` VALUES ('123456','测试员','-','-','-','123456','123456','-');
/*!40000 ALTER TABLE `t019_student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-16 14:45:56
