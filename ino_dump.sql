-- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ino
-- ------------------------------------------------------
-- Server version	10.11.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attention`
--

DROP TABLE IF EXISTS `attention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attention` (
  `attention_no` int(10) NOT NULL AUTO_INCREMENT,
  `attention_div_no` int(10) DEFAULT NULL,
  `attention_div` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`attention_no`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `attention_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attention`
--

LOCK TABLES `attention` WRITE;
/*!40000 ALTER TABLE `attention` DISABLE KEYS */;
INSERT INTO `attention` VALUES
(1,1,'판매글','user119','2023-05-18 00:47:23'),
(2,4,'판매글','moriring','2023-05-18 00:56:13'),
(3,5,'판매글','moriring','2023-05-18 00:56:41'),
(4,2,'갤러리','mobpolice','2023-05-18 02:15:14'),
(6,1,'판매글','mobpolice','2023-05-18 05:54:36'),
(7,5,'판매글','user002','2023-05-18 06:06:44'),
(8,3,'갤러리','user002','2023-05-18 06:08:10'),
(9,16,'판매글','riderCheck','2023-05-18 06:35:06'),
(10,4,'갤러리','user004','2023-05-18 06:45:50');
/*!40000 ALTER TABLE `attention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_extra`
--

DROP TABLE IF EXISTS `auth_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_extra` (
  `user_id` varchar(255) NOT NULL,
  `biz_num` varchar(255) DEFAULT NULL,
  `biz` varchar(255) DEFAULT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL COMMENT '인증대기/인증완료',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_user_TO_auth_extra_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_extra`
--

LOCK TABLES `auth_extra` WRITE;
/*!40000 ALTER TABLE `auth_extra` DISABLE KEYS */;
INSERT INTO `auth_extra` VALUES
('coo810','4578500300','b005','bigcom','인증완료'),
('cpzm1234','1251251251','b001','구디아카데미','인증완료'),
('moriring','2926100615','b006','올리브영','인증완료');
/*!40000 ALTER TABLE `auth_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz`
--

DROP TABLE IF EXISTS `biz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz` (
  `biz_id` varchar(255) NOT NULL COMMENT 'b012 라이더',
  `biz_name` varchar(255) DEFAULT NULL COMMENT '라이더',
  PRIMARY KEY (`biz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz`
--

LOCK TABLES `biz` WRITE;
/*!40000 ALTER TABLE `biz` DISABLE KEYS */;
INSERT INTO `biz` VALUES
('b001','카페'),
('b002','음식점'),
('b003','여가오락'),
('b004','교육'),
('b005','운동'),
('b006','미용'),
('b007','숙박업'),
('b008','반려동물'),
('b009','세탁업'),
('b010','도소매'),
('b011','기타'),
('b012','라이더');
/*!40000 ALTER TABLE `biz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cate_no` varchar(255) NOT NULL COMMENT 's001, s002, s003\r\np001, p002, p003, p004,p005,p006\r\nstar001, star002, star003\r\n\r\n신고:갤러리/판매글/회원\r\n사진:프로필/사업자등록증/라이더업장/메시지번호/판매글번호/갤러리번호\r\n별점:물품상태/시간약속/친절도',
  `cate_name` varchar(255) DEFAULT NULL COMMENT '신고:갤러리/판매글/회원\r\n사진:프로필/사업자등록증/라이더업장/메시지번호/판매글/갤러리\r\n별점:물품상태/시간약속/친절도',
  PRIMARY KEY (`cate_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES
('p001','프로필사진'),
('p002','사업자등록증사진'),
('p003','라이더업장사진'),
('p004','메시지사진'),
('p005','판매글사진'),
('p006','갤러리사진'),
('s001','갤러리신고'),
('s002','판매글신고'),
('s003','회원신고'),
('star001','물품상태'),
('star002','시간약속'),
('star003','친절도');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatmsg`
--

DROP TABLE IF EXISTS `chatmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatmsg` (
  `msg_no` int(10) NOT NULL AUTO_INCREMENT,
  `from_id` varchar(255) NOT NULL,
  `msg_content` text DEFAULT NULL,
  `from_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `roomid` int(10) NOT NULL,
  PRIMARY KEY (`msg_no`),
  KEY `roomid` (`roomid`),
  CONSTRAINT `chatmsg_ibfk_1` FOREIGN KEY (`roomid`) REFERENCES `chatroom` (`roomid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatmsg`
--

LOCK TABLES `chatmsg` WRITE;
/*!40000 ALTER TABLE `chatmsg` DISABLE KEYS */;
INSERT INTO `chatmsg` VALUES
(39,'coo810','ㅇ','2023-05-18 06:14:25',18),
(40,'mobpolice','ㅇ','2023-05-18 06:19:25',21),
(41,'user004','안녕하세요.','2023-05-18 06:29:25',22),
(42,'mobpolice','ㅎㅇ','2023-05-18 06:29:30',22),
(43,'mobpolice','커피머신','2023-05-18 06:29:37',22),
(44,'mobpolice','관심있으신;가요?','2023-05-18 06:29:40',22),
(45,'user004','좋아요','2023-05-18 06:29:41',22),
(46,'mobpolice','이미지 전송','2023-05-18 06:29:45',22),
(47,'user004','네고 되나요','2023-05-18 06:29:48',22),
(48,'user004','이미지 전송','2023-05-18 06:29:52',22),
(49,'mobpolice','얼마 생각하세요','2023-05-18 06:29:54',22),
(50,'user004','25000정도..','2023-05-18 06:30:00',22),
(51,'mobpolice','썩 꺼지세요','2023-05-18 06:30:04',22),
(52,'mobpolice','팔게요','2023-05-18 06:30:15',22),
(53,'riderCheck ','안녕하세요','2023-05-18 06:30:55',23),
(54,'mobpolice','저욧저요','2023-05-18 06:34:32',24),
(55,'mobpolice','살게요','2023-05-18 06:34:34',24);
/*!40000 ALTER TABLE `chatmsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatroom`
--

DROP TABLE IF EXISTS `chatroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatroom` (
  `roomid` int(10) NOT NULL AUTO_INCREMENT,
  `roomname` varchar(255) DEFAULT NULL,
  `recent_msg` text DEFAULT NULL,
  `recent_no` int(10) DEFAULT NULL,
  `recent_time` timestamp NULL DEFAULT current_timestamp(),
  `from_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `msg_div` varchar(255) DEFAULT NULL COMMENT '판매/배송',
  `msg_div_no` varchar(255) DEFAULT NULL COMMENT '판매글번호, 배송희망번호',
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatroom`
--

LOCK TABLES `chatroom` WRITE;
/*!40000 ALTER TABLE `chatroom` DISABLE KEYS */;
INSERT INTO `chatroom` VALUES
(13,'mobpolice','',999999999,'2023-05-18 05:20:43','2023-05-18 05:20:43','배송','4'),
(14,'mobpolice','',999999999,'2023-05-18 05:29:58','2023-05-18 05:29:58','판매','5'),
(15,'mobpolice','',999999999,'2023-05-18 05:30:06','2023-05-18 05:30:06','판매','1'),
(16,'mobpolice','',999999999,'2023-05-18 06:09:09','2023-05-18 06:09:09','판매','1'),
(17,'mobpolice','',999999999,'2023-05-18 06:13:14','2023-05-18 06:13:14','판매','1'),
(18,'mobpolice','ㅇ',39,'2023-05-18 06:14:25','2023-05-18 06:14:16','판매','1'),
(19,'user003','',999999999,'2023-05-18 06:15:30','2023-05-18 06:15:30','판매','10'),
(20,'mobpolice','',999999999,'2023-05-18 06:15:47','2023-05-18 06:15:47','판매','14'),
(21,'coo810','ㅇ',40,'2023-05-18 06:19:25','2023-05-18 06:19:07','판매','15'),
(22,'mobpolice','팔게요',52,'2023-05-18 06:30:15','2023-05-18 06:29:19','판매','1'),
(23,'mobpolice','안녕하세요',53,'2023-05-18 06:30:55','2023-05-18 06:30:50','배송','6'),
(24,'user004','살게요',55,'2023-05-18 06:34:34','2023-05-18 06:34:28','판매','16');
/*!40000 ALTER TABLE `chatroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_history`
--

DROP TABLE IF EXISTS `delivery_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_history` (
  `delivery_accept_no` int(10) NOT NULL,
  `delivery_state` varchar(255) DEFAULT NULL COMMENT '배송접수\r\n상품인수\r\n배송중\r\n배송완료\r\n배송실패',
  `delivery_time` timestamp NULL DEFAULT current_timestamp() COMMENT '상태변경에 대한 시간이 기록됨',
  KEY `delivery_accept_no` (`delivery_accept_no`),
  CONSTRAINT `delivery_history_ibfk_1` FOREIGN KEY (`delivery_accept_no`) REFERENCES `delivery_offer` (`delivery_offer_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_history`
--

LOCK TABLES `delivery_history` WRITE;
/*!40000 ALTER TABLE `delivery_history` DISABLE KEYS */;
INSERT INTO `delivery_history` VALUES
(1,'배송접수','2023-05-18 00:51:36'),
(2,'배송접수','2023-05-18 01:31:21'),
(2,'배송중','2023-05-18 01:38:37'),
(2,'배송완료','2023-05-18 01:38:41'),
(1,'배송중','2023-05-18 01:49:02'),
(1,'배송완료','2023-05-18 01:49:27'),
(3,'배송접수','2023-05-18 01:51:46'),
(3,'배송중','2023-05-18 01:52:01'),
(3,'배송완료','2023-05-18 01:52:07'),
(4,'배송접수','2023-05-18 05:14:31'),
(4,'배송완료','2023-05-18 05:41:18'),
(6,'배송접수','2023-05-18 06:12:12'),
(6,'배송접수','2023-05-18 06:12:16'),
(7,'배송접수','2023-05-18 06:14:05'),
(7,'배송중','2023-05-18 06:14:12'),
(7,'배송완료','2023-05-18 06:14:18'),
(8,'배송접수','2023-05-18 06:15:18'),
(8,'배송중','2023-05-18 06:15:21'),
(8,'배송완료','2023-05-18 06:15:25'),
(9,'배송접수','2023-05-18 06:19:29'),
(10,'배송접수','2023-05-18 06:30:49'),
(5,'배송접수','2023-05-18 06:32:18'),
(10,'배송중','2023-05-18 07:10:05'),
(5,'배송완료','2023-05-18 07:10:09'),
(10,'배송완료','2023-05-18 07:10:20');
/*!40000 ALTER TABLE `delivery_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_offer`
--

DROP TABLE IF EXISTS `delivery_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_offer` (
  `delivery_offer_no` int(10) NOT NULL AUTO_INCREMENT,
  `sales_no` int(10) NOT NULL,
  `rider_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `to_addr` varchar(255) DEFAULT NULL,
  `offer_date` timestamp NULL DEFAULT current_timestamp(),
  `accept` tinyint(1) DEFAULT NULL COMMENT '첨에 null ㄱㄱ',
  `all_show` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`delivery_offer_no`),
  KEY `sales_no` (`sales_no`),
  KEY `rider_id` (`rider_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `delivery_offer_ibfk_1` FOREIGN KEY (`sales_no`) REFERENCES `sales` (`sales_no`),
  CONSTRAINT `delivery_offer_ibfk_2` FOREIGN KEY (`rider_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `delivery_offer_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_offer`
--

LOCK TABLES `delivery_offer` WRITE;
/*!40000 ALTER TABLE `delivery_offer` DISABLE KEYS */;
INSERT INTO `delivery_offer` VALUES
(1,1,'rider123','mobpolice','서울 금천구 가산디지털1로 151, 구디아카데미 (가산동)','ㅌㅊㅍㅇㄴㄹㅇㅁㄴㄹ','2023-05-18 00:44:06',1,'as'),
(2,6,'rider123','user002','서울 강남구 논현로123길 4-1,  (논현동)','12321312321321','2023-05-18 01:30:51',1,'as'),
(3,6,'rider123','user002','서울 강남구 논현로123길 4-1,  (논현동)','sdfasfasdfsaf','2023-05-18 01:51:21',1,'as'),
(4,5,'riderplz','mobpolice','서울 금천구 가마산로 70, 길바닥카페 (가산동)','금천구 어디어디로','2023-05-18 05:12:29',1,'as'),
(5,4,'riderCheck','bugger','경기 성남시 분당구 판교역로 166, 123호 (백현동)','','2023-05-18 05:12:32',1,'as'),
(6,1,'riderCheck','mobpolice','서울 금천구 가산디지털1로 151, 구디아카데미 (가산동)','구디아카데미','2023-05-18 06:10:35',1,'as'),
(7,1,'riderplz','mobpolice','서울 금천구 가산디지털1로 151, 구디아카데미 (가산동)','adsfasfads','2023-05-18 06:13:50',1,'as'),
(8,1,'riderplz','mobpolice','서울 금천구 가산디지털1로 151, 구디아카데미 (가산동)','asdfasd','2023-05-18 06:14:58',1,'as'),
(9,1,'rider111','mobpolice','서울 금천구 가산디지털1로 151, 구디아카데미 (가산동)','경기도 시흥시 목감중앙로 19','2023-05-18 06:16:49',1,'as'),
(10,1,'riderCheck','mobpolice','서울 금천구 가산디지털1로 151, 구디아카데미 (가산동)','구디아카데미','2023-05-18 06:30:45',1,'as');
/*!40000 ALTER TABLE `delivery_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery` (
  `gallery_no` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `gallery_subject` varchar(255) DEFAULT NULL,
  `gallery_content` varchar(255) DEFAULT NULL COMMENT '인테리어 소개가 들어감',
  `gallery_date` timestamp NULL DEFAULT current_timestamp(),
  `gallery_hit` int(10) NOT NULL,
  `gallery_jjim` int(10) NOT NULL,
  `blind` varchar(16) NOT NULL,
  PRIMARY KEY (`gallery_no`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES
(1,'moriring','올리브영','반갑습니다 오늘도 올리브영입니다 ~ ☆','필요하신 상품이 있으면 말씀해주세요~ ','2023-05-18 00:59:16',33,0,'0'),
(2,'mobpolice','서정벅스','저희 카페입니다.','저희 카페 인테리어입니다 ㅎㅎ','2023-05-18 01:29:48',25,1,'0'),
(3,'user003','카페','저희 화이트톤 인테리어 구경하세요.','봄바람이 시원하네요 ^^','2023-05-18 05:26:13',3,1,'0'),
(4,'user002','candy cafe','리모델링했어요~~','어떤가요','2023-05-18 06:08:03',2,1,'0');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `goods_id` varchar(255) NOT NULL,
  `biz_id` varchar(255) NOT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `biz_id` (`biz_id`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`biz_id`) REFERENCES `biz` (`biz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES
('g001','b001','가전'),
('g002','b001','인테리어물품'),
('g003','b001','가구'),
('g004','b001','기타'),
('g005','b002','가전'),
('g006','b002','인테리어물품'),
('g007','b002','가구'),
('g008','b002','기타'),
('g009','b003','가전'),
('g010','b003','인테리어물품'),
('g011','b003','가구'),
('g012','b003','기타'),
('g013','b004','가전'),
('g014','b004','인테리어물품'),
('g015','b004','가구'),
('g016','b004','기타'),
('g017','b005','가전'),
('g018','b005','인테리어물품'),
('g019','b005','가구'),
('g020','b005','기타'),
('g021','b006','가전'),
('g022','b006','인테리어물품'),
('g023','b006','가구'),
('g024','b006','기타'),
('g025','b007','가전'),
('g026','b007','인테리어물품'),
('g027','b007','가구'),
('g028','b007','기타'),
('g029','b008','가전'),
('g030','b008','인테리어물품'),
('g031','b008','가구'),
('g032','b008','기타'),
('g033','b009','가전'),
('g034','b009','인테리어물품'),
('g035','b009','가구'),
('g036','b009','기타'),
('g037','b010','가전'),
('g038','b010','인테리어물품'),
('g039','b010','가구'),
('g040','b010','기타'),
('g041','b011','가전'),
('g042','b011','인테리어물품'),
('g043','b011','가구'),
('g044','b011','기타'),
('g045','b012','라이더');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg`
--

DROP TABLE IF EXISTS `msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg` (
  `msg_no` int(10) NOT NULL AUTO_INCREMENT,
  `from_id` varchar(255) NOT NULL,
  `to_id` varchar(255) NOT NULL,
  `msg_content` varchar(255) DEFAULT NULL,
  `from_time` datetime DEFAULT NULL,
  `msg_div` varchar(255) DEFAULT NULL COMMENT '판매/배송',
  `msg_div_no` varchar(255) DEFAULT NULL COMMENT '판매글번호, 배송희망번호',
  PRIMARY KEY (`msg_no`),
  KEY `from_id` (`from_id`),
  KEY `to_id` (`to_id`),
  CONSTRAINT `msg_ibfk_1` FOREIGN KEY (`from_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `msg_ibfk_2` FOREIGN KEY (`to_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg`
--

LOCK TABLES `msg` WRITE;
/*!40000 ALTER TABLE `msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `photo_no` int(10) NOT NULL AUTO_INCREMENT,
  `ori_photo_name` varchar(255) DEFAULT NULL,
  `new_photo_name` varchar(255) DEFAULT NULL,
  `photo_div` varchar(255) DEFAULT NULL COMMENT '아이디(프로필사진)\r\n인증사용자아이디(사업자증명)\r\n라이더아이디(사업자증명)\r\n라이더아이디(업장사진)\r\n판매글번호(판매글사진)\r\n갤러리번호(갤러리사진)\r\n채팅메시지번호(채팅사진)',
  `cate_no` varchar(255) NOT NULL COMMENT 's001, s002, s003\r\np001, p002, p003, p004,p005,p006\r\nstar001, star002, star003\r\n\r\n신고:갤러리/판매글/회원\r\n사진:프로필/사업자등록증/라이더업장/메시지번호/판매글번호/갤러리번호\r\n별점:물품상태/시간약속/친절도',
  PRIMARY KEY (`photo_no`),
  KEY `cate_no` (`cate_no`),
  CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`cate_no`) REFERENCES `category` (`cate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES
(1,'free-icon-user-5079583.png','1684369696028.png','user001','p001'),
(2,'다운로드 (1).jfif','1684369747533.jfif','mobpolice','p001'),
(3,'pepe.jfif','1684369772231.jfif','pepe1','p001'),
(4,'KakaoTalk_20230424_135859798.png','1684369811945.png','bugger','p001'),
(5,'1-4.png','1684369883809.png','1','p005'),
(6,'991 (1).jpg','1684370101905.jpg','cinna','p001'),
(7,'KakaoTalk_20230518_084629594_04.jpg','1684370137432.jpg','coo810','p001'),
(8,'B.jpg','1684370158026.jpg','2','p005'),
(9,'랏코1.jpg','1684370211792.jpg','gudigudi','p001'),
(10,'고양.png','1684370239825.png','rider123','p001'),
(11,'untitled-design-1681406722575.png','1684370301780.png','3','p005'),
(12,'whopper.jpg','1684370424814.jpg','4','p005'),
(13,'FfLKUHNUAAA7tfW.jpg','1684370526237.jpg','3','p004'),
(14,'가구1_(2).jpg','1684370536707.jpg','5','p005'),
(15,'고양.png','1684370580335.png','user119','p001'),
(16,'c96e26166b8180010b861e144c52855e_res.jpeg','1684370594639.jpeg','7','p004'),
(17,'다운로드.jfif','1684370615171.jfif','10','p004'),
(18,'1682798351016.jpg','1684370721741.jpg','riderrider','p001'),
(19,'1683047280913.png','1684370721743.png','riderrider','p002'),
(20,'1682798351016.jpg','1684370992706.jpg','riderCC','p001'),
(21,'아이폰.png','1684370992708.png','riderCC','p002'),
(22,'다운로드.jpg','1684371324613.jpg','moriring','p001'),
(23,'1682798351016.jpg','1684371328169.jpg','user002','p001'),
(24,'1683047280913.png','1684371451160.png','cpzm1234','p001'),
(25,'free-icon-letter-1250663.png','1684371451175.png','cpzm1234','p002'),
(26,'beauty_1639024513282.jpg','1684371556804.jpg','1','p006'),
(27,'beauty_1639024525903.jpg','1684371556819.jpg','1','p006'),
(28,'beauty_1639024732023.jpg','1684371556835.jpg','1','p006'),
(29,'beauty_1639024797626.jpg','1684371556851.jpg','1','p006'),
(30,'아이폰.png','1684371733691.png','6','p005'),
(31,'table.jpg','1684371957379.jpg','7','p005'),
(32,'FfLKUHNUAAA7tfW.jpg','1684372211850.jpg','18','p004'),
(33,'다운로드.jpg','1684372311657.jpg','pochacco','p001'),
(34,'wdsad.jpg','1684372441605.jpg','8','p005'),
(35,'22V9KRDG8B_9.jpeg','1684373388997.jpeg','2','p006'),
(36,'1682798351016.jpg','1684373480757.jpg','27','p004'),
(37,'KakaoTalk_Snapshot_20230518_102013.png','1684373843844.png','riderplz','p001'),
(38,'랏코1.jpg','1684373843849.jpg','riderplz','p002'),
(39,'KakaoTalk_20230518_084629594_04.jpg','1684374219272.jpg','coo810','p002'),
(40,'고양.png','1684375014881.png','30','p004'),
(41,'22V9KRDG8B_9.jpeg','1684375796748.jpeg','5','p005'),
(42,'다운로드.jfif','1684385840247.jfif','34','p004'),
(43,'pepepe.webp','1684385844553.webp','35','p004'),
(44,'가구1_(2).jpg','1684385901966.jpg','37','p004'),
(45,'다운로드 (2).jfif','1684385989576.jfif','5','p005'),
(46,'FfLKUHNUAAA7tfW.jpg','1684386053784.jpg','38','p004'),
(47,'2023-05-18 14 19 54.png','1684387267760.png','9','p005'),
(48,'돌고래.jpg','1684387368270.jpg','user003','p001'),
(49,'2023-05-18 14 24 18.png','1684387515407.png','10','p005'),
(50,'마이프차4.png','1684387573911.png','3','p006'),
(51,'야외테이블.png','1684387735073.png','11','p005'),
(52,'랏코1.jpg','1684387964948.jpg','tjwjd','p001'),
(58,'2023-05-18 14 24 18.png','1684388513545.png','12','p005'),
(59,'2023-05-18 14 38 51.png','1684388513554.png','12','p005'),
(60,'사업자등록증.png','1684388570641.png','moriring','p002'),
(61,'corgi.jpg','1684388697172.jpg','6','p005'),
(62,'doge.jpg','1684388697188.jpg','6','p005'),
(63,'마이프차1.png','1684389039166.png','13','p005'),
(64,'마이프차2.png','1684389039181.png','13','p005'),
(65,'cafe.jpg','1684390083195.jpg','4','p006'),
(66,'다운로드 (2).jfif','1684390222108.jfif','14','p005'),
(67,'suseok.jpg','1684390362201.jpg','ahead','p001'),
(68,'1-4.png','1684390729002.png','15','p005'),
(69,'wani.png','1684391274011.png','user004','p001'),
(70,'doge.jpg','1684391321633.jpg','16','p005'),
(71,'FfLKUHNUAAA7tfW.jpg','1684391321644.jpg','16','p005'),
(72,'다운로드.jfif','1684391385973.jfif','46','p004'),
(73,'FfLKUHNUAAA7tfW.jpg','1684391392527.jpg','48','p004');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `report_no` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `cate_no` varchar(255) NOT NULL COMMENT 's001, s002, s003\r\np001, p002, p003, p004,p005,p006\r\nstar001, star002, star003\r\n\r\n신고:갤러리/판매글/회원\r\n사진:프로필/사업자등록증/라이더업장/메시지번호/판매글번호/갤러리번호\r\n별점:물품상태/시간약속/친절도',
  `report_reason` varchar(255) DEFAULT NULL,
  `report_date` timestamp NULL DEFAULT current_timestamp(),
  `report_state` varchar(255) DEFAULT NULL,
  `report_whom` varchar(255) DEFAULT NULL COMMENT 'varchar (회원 아이디 있어가지구)',
  PRIMARY KEY (`report_no`),
  KEY `user_id` (`user_id`),
  KEY `cate_no` (`cate_no`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`cate_no`) REFERENCES `category` (`cate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES
(1,'moriring','s002','허위 내용이에요 개사료를 사람이 왜 먹습니까','2023-05-18 00:57:21','대기','2'),
(2,'admin','s002','jsfd','2023-05-18 04:35:47','대기','4'),
(3,'user002','s001','hftdyt','2023-05-18 04:39:06','완료','2');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_history`
--

DROP TABLE IF EXISTS `report_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_history` (
  `report_no` int(10) NOT NULL,
  `report_time` timestamp NULL DEFAULT current_timestamp(),
  `report_content` varchar(255) DEFAULT NULL,
  `report_id` varchar(255) DEFAULT NULL,
  KEY `report_no` (`report_no`),
  CONSTRAINT `report_history_ibfk_1` FOREIGN KEY (`report_no`) REFERENCES `report` (`report_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_history`
--

LOCK TABLES `report_history` WRITE;
/*!40000 ALTER TABLE `report_history` DISABLE KEYS */;
INSERT INTO `report_history` VALUES
(3,'2023-05-18 04:39:24','hjcgv','user002'),
(3,'2023-05-18 04:39:36','k.hbj','user002'),
(3,'2023-05-18 04:39:40','cgv','user002'),
(3,'2023-05-18 04:39:51','ycv','user002'),
(3,'2023-05-18 04:40:06','hgvb','user002'),
(3,'2023-05-18 05:50:29','j,bgv ','user002');
/*!40000 ALTER TABLE `report_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rider_extra`
--

DROP TABLE IF EXISTS `rider_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rider_extra` (
  `user_id` varchar(255) NOT NULL,
  `biz_num` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `news` varchar(255) DEFAULT NULL,
  `store_time` varchar(255) DEFAULT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_user_TO_rider_extra_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rider_extra`
--

LOCK TABLES `rider_extra` WRITE;
/*!40000 ALTER TABLE `rider_extra` DISABLE KEYS */;
INSERT INTO `rider_extra` VALUES
('riderCC','1241251251','riderCC','riderCC','09:51~09:52','riderCC'),
('riderCheck','1251251251','riderCheck','riderCheck','09:50~11:50','test002'),
('riderplz','1198691245','라이더','창업했습니다','11:39~14:39','라라이더'),
('riderrider','1241251251','riderrider','riderrider','~','riderrider');
/*!40000 ALTER TABLE `rider_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomuser`
--

DROP TABLE IF EXISTS `roomuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roomuser` (
  `roomuserno` int(10) NOT NULL AUTO_INCREMENT,
  `roomid` int(10) NOT NULL,
  `id` varchar(50) NOT NULL,
  `from_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`roomuserno`),
  KEY `roomid` (`roomid`),
  KEY `id` (`id`),
  CONSTRAINT `roomuser_ibfk_1` FOREIGN KEY (`roomid`) REFERENCES `chatroom` (`roomid`) ON DELETE CASCADE,
  CONSTRAINT `roomuser_ibfk_2` FOREIGN KEY (`id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomuser`
--

LOCK TABLES `roomuser` WRITE;
/*!40000 ALTER TABLE `roomuser` DISABLE KEYS */;
INSERT INTO `roomuser` VALUES
(25,13,'riderplz','2023-05-18 05:20:43'),
(26,13,'mobpolice','2023-05-18 05:20:43'),
(27,14,'pepe1','2023-05-18 05:29:58'),
(28,14,'mobpolice','2023-05-18 05:29:58'),
(29,15,'pepe1','2023-05-18 05:30:06'),
(30,15,'mobpolice','2023-05-18 05:30:06'),
(31,16,'user002','2023-05-18 06:09:09'),
(32,16,'mobpolice','2023-05-18 06:09:09'),
(33,17,'user001','2023-05-18 06:13:14'),
(34,17,'mobpolice','2023-05-18 06:13:14'),
(35,18,'coo810','2023-05-18 06:14:16'),
(36,18,'mobpolice','2023-05-18 06:14:16'),
(37,19,'coo810','2023-05-18 06:15:30'),
(38,19,'user003','2023-05-18 06:15:30'),
(39,20,'coo810','2023-05-18 06:15:47'),
(40,20,'mobpolice','2023-05-18 06:15:47'),
(41,21,'mobpolice','2023-05-18 06:19:07'),
(42,21,'coo810','2023-05-18 06:19:07'),
(43,22,'user004','2023-05-18 06:29:19'),
(44,22,'mobpolice','2023-05-18 06:29:19'),
(45,23,'riderCheck ','2023-05-18 06:30:50'),
(46,23,'mobpolice','2023-05-18 06:30:50'),
(47,24,'mobpolice','2023-05-18 06:34:28'),
(48,24,'user004','2023-05-18 06:34:28');
/*!40000 ALTER TABLE `roomuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `sales_no` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `price` int(12) DEFAULT NULL,
  `post_num` varchar(255) DEFAULT NULL,
  `sales_sido` varchar(255) DEFAULT NULL,
  `sigungu` varchar(255) DEFAULT NULL,
  `left_addr` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `sales_state` varchar(255) DEFAULT NULL,
  `blind` tinyint(1) DEFAULT NULL,
  `hit` int(12) NOT NULL,
  `attention` int(12) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp() COMMENT 'alter table sales modify column date timestamp default current_timestamp;',
  `biz_id` varchar(255) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  PRIMARY KEY (`sales_no`),
  KEY `user_id` (`user_id`),
  KEY `biz_id` (`biz_id`),
  KEY `goods_id` (`goods_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`biz_id`) REFERENCES `biz` (`biz_id`),
  CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES
(1,'mobpolice','카페용 커피머신 팝니다.',3000000,'08506','서울','금천구','가산디지털1로 151, 구디아카데미 (가산동)','이거 제가 쓰던건데 그냥 300만원만 받고 나눔합니다.','판매중',1,54,2,'2023-05-18 00:31:23','b001','g001'),
(2,'cinna','개사료 팝니다',88888,'13529','경기','성남시 분당구','판교역로 166, 123호 (백현동)','제가 먹어봤는데 맛있어요','판매중',0,7,0,'2023-05-18 00:35:58','b008','g032'),
(3,'pepe1','RTX 4070ti 신상품 팝니다',1000000,'13529','경기','성남시 분당구','판교역로 166, 123호 (백현동)','한번도 사용 안한 신상품입니다','판매중',1,9,0,'2023-05-18 00:38:21','b003','g009'),
(4,'bugger','와퍼세트 팔아요',4444,'13529','경기','성남시 분당구','판교역로 166, 123호 (백현동)','제가 아끼는건데 눈물을 머금고 팔아여\r\n부거조와','판매중',1,16,1,'2023-05-18 00:40:24','b002','g008'),
(5,'mobpolice','카페 의자 나눔합니다.',0,'08500','서울','금천구','가마산로 70, 길바닥카페 (가산동)','공사장 컨셉으로 카페 변경하려고 안쓰는 의자 나눔합니다.','판매중',1,21,2,'2023-05-18 00:42:16','b001','g002'),
(6,'user002','아이폰 팔아요',15000000,'06112','서울','강남구','논현로123길 4-1,  (논현동)','싸게 넘겨요','판매중',1,25,0,'2023-05-18 01:02:13','b001','g001'),
(7,'coo810','테이블 팔아요',25000,'08500','서울','금천구','가마산로 70,  (가산동)','테이블 새거예요','판매중',1,8,0,'2023-05-18 01:05:57','b001','g002'),
(8,'pochacco','야구 배트 판매합니다',201925,'42250','대구','수성구','야구전설로 1, 라이온즈파크 (연호동)','야구배트 판매합니다!!!!','판매중',1,8,0,'2023-05-18 01:14:01','b005','g020'),
(9,'user002','@@@ 급함 플쓰방 모니터 정리합니다. 가져가세요 ',520000,'06350','서울','강남구','광평로 61,  (일원동)','하하','판매중',1,3,0,'2023-05-18 05:21:07','b003','g009'),
(10,'user003','학원 책상 처분',10000,'06307','서울','강남구','개포로 202,  (개포동)','개당 만원 입니다. 전체 만원 아니에요ㅛㅛㅛ','판매중',1,2,0,'2023-05-18 05:25:15','b004','g015'),
(11,'user002','가계 야외 테이블 처분합니다.',250000,'06112','서울','강남구','논현로123길 4-3,  (논현동)','싸요','판매중',0,3,0,'2023-05-18 05:28:55','b002','g005'),
(12,'user002','학생 책상 팔아요',32000,'05200','서울','강동구','가래여울길 3,  (강일동)','학생이 안오네요.','판매중',0,10,0,'2023-05-18 05:39:37','b004','g013'),
(13,'user002','테이블 팔아요',40000,'05200','서울','강동구','가래여울길 3,  (강일동)','물건 좋습니다.','판매중',0,6,0,'2023-05-18 05:50:39','b001','g001'),
(14,'mobpolice','저희 카페에서 안쓰는 의자 팝니다(누르지 마세요)',350000,'06267','서울','강남구','강남대로 238, 길바닥 카페 (도곡동)','공사장 컨셉으로 인테리어 변경하고 싶어서 예전에 쓰던 의자 다 팔게요~','판매중',0,5,0,'2023-05-18 06:10:22','b001','g001'),
(15,'coo810','팝니다',100,'08506','서울','금천구','가산디지털1로 149, 구디아카데미 (가산동)','뭔가 팝니다.','판매중',0,3,0,'2023-05-18 06:18:48','b001','g001'),
(16,'user004','판매합니다.',25000,'06307','서울','강남구','개포로 202,  (개포동)','팝니다.','판매완료',0,15,1,'2023-05-18 06:28:41','b001','g001');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star` (
  `star_no` int(10) NOT NULL AUTO_INCREMENT,
  `star_to_id` varchar(255) NOT NULL,
  `star_div` varchar(255) DEFAULT NULL COMMENT '판매/배송',
  `star_div_no` int(10) DEFAULT NULL COMMENT '판매글번호, 배송확정번호',
  PRIMARY KEY (`star_no`),
  KEY `star_to_id` (`star_to_id`),
  CONSTRAINT `star_ibfk_1` FOREIGN KEY (`star_to_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star`
--

LOCK TABLES `star` WRITE;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
INSERT INTO `star` VALUES
(1,'user004','판매',16);
/*!40000 ALTER TABLE `star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star_test_paper`
--

DROP TABLE IF EXISTS `star_test_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star_test_paper` (
  `star_category_no` varchar(255) NOT NULL COMMENT 's001, s002, s003\r\np001, p002, p003, p004\r\nstar001, star002, star003\r\n\r\n신고:갤러리/판매글/회원\r\n사진:프로필/사업자등록증/라이더업장/메시지번호\r\n별점:물품상태/시간약속/친절도',
  `star_no` int(10) NOT NULL,
  `star_score` int(10) DEFAULT NULL,
  KEY `star_no` (`star_no`),
  KEY `star_category_no` (`star_category_no`),
  CONSTRAINT `star_test_paper_ibfk_1` FOREIGN KEY (`star_no`) REFERENCES `star` (`star_no`),
  CONSTRAINT `star_test_paper_ibfk_2` FOREIGN KEY (`star_category_no`) REFERENCES `category` (`cate_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star_test_paper`
--

LOCK TABLES `star_test_paper` WRITE;
/*!40000 ALTER TABLE `star_test_paper` DISABLE KEYS */;
INSERT INTO `star_test_paper` VALUES
('star001',1,5),
('star002',1,5),
('star003',1,5);
/*!40000 ALTER TABLE `star_test_paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL,
  `user_pw` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `post_num` varchar(255) DEFAULT NULL,
  `sido` varchar(255) DEFAULT NULL,
  `sigungu` varchar(255) DEFAULT NULL,
  `left_addr` varchar(255) DEFAULT NULL,
  `phone_num` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_state` varchar(255) DEFAULT NULL COMMENT '대기상태는 라이더에만 적용',
  `interest_biz_id` varchar(255) NOT NULL COMMENT '라이더는 기타로 입력하자 b012',
  `user_div` varchar(255) NOT NULL COMMENT 'auto incre 안됨\r\n일반/인증/라이더/관리자\r\n1/2/3/4',
  PRIMARY KEY (`user_id`),
  KEY `interest_biz_id` (`interest_biz_id`),
  KEY `user_div` (`user_div`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`interest_biz_id`) REFERENCES `biz` (`biz_id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`user_div`) REFERENCES `user_div` (`user_div`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
('admin','pass','어드민','어드민','1','서울특별시','구로구','구로아파트','010-1234-5678','admin@naver.com','정상','b002','d'),
('ahead','1','63기 수석','63기 수석','06035','서울','강남구','서울 강남구 가로수길 5','01012414124','head@naver.com','가입대기','b012','c'),
('bugger','1234','부거','부거','13529','경기','성남시 분당구','경기 성남시 분당구 판교역로 166','01012341234','bugger@naver.com','블록','b001','b'),
('cinna','1234','시나','시나','13529','경기','성남시 분당구','경기 성남시 분당구 판교역로 166','01012341234','cinna@naver.com','블록','b001','a'),
('coo810','as','최은영','녕긔','06267','서울','','서울 강남구 강남대로 238','01000000000','coo810@naver.com','정상','b001','b'),
('cpzm1234','cpzm1234','아무개','체크','01440','서울','도봉구','서울 도봉구 도봉로123길 7','01012415435','skrudddud123@naver.com','정상','b001','b'),
('dbdbdb','1234','한디비','디비디비딥','62404','광주','광산구','광주 광산구 가마길 2-21','01012341234','dbdbdb@gmail.com','블록','b002','a'),
('gudigudi','0330','한구디','63기 수석임','08500','서울','금천구','서울 금천구 가마산로 70','01029299292','popopo@gmail.com','가입대기','b003','c'),
('mobpolice','pass','서승범','몹경찰','08506','서울','금천구','서울 금천구 가산디지털1로 151','01011112222','mobpolice@naver.com','정상','b001','a'),
('moriring','1234','한모리','모리링','07718','서울','강서구','서울 강서구 가로공원로 173','01044212213','olive@naver.com','정상','b006','b'),
('pepe1','1234','페페','페페','13529','경기','성남시 분당구','경기 성남시 분당구 판교역로 166','01012341234','pepe@naver.com','정상','b001','a'),
('pochacco','1234','한포챠','포챠챠','42250','','','대구 수성구 대구 수성구 야구전설로 1','01033334444','popopo@naver.com','정상','b005','a'),
('rider001','as','최은영','안녕라이더','13524','경기','성남시 분당구','경기 성남시 분당구 대왕판교로606번길 45','01000000000','rider001@gmail.com','가입대기','b012','c'),
('rider111','1','한서정','한서정','','','','','010','@naver.com','가입대기','b012','c'),
('rider114','1','한서정','12342222','13480','경기','성남시 분당구','경기 성남시 분당구 대왕판교로 477','010213123','213@naver.com','가입대기','b012','c'),
('rider123','1','한서정','서승범','44211','울산','북구','울산 북구 가대서길 25','010123123','123@naver.com','가입대기','b004','c'),
('riderCC','riderCC','riderCC','riderCC','01437','서울','도봉구','서울 도봉구 도봉로123길 4','01012414124','riderCC@naver.com','가입대기','b012','c'),
('riderCheck','riderCheck','test002','test002','06112','서울','강남구','서울 강남구 논현로123길 4-1','01012411241','rider002@naver.com','가입대기','b012','c'),
('riderplz','1234','한라이더','라라이더','13536','경기','성남시 분당구','경기 성남시 분당구 판교역로 4','01033345464','lllasd@naver.com','가입대기','b012','c'),
('riderrider','riderrider','riderrider','riderrider','01437','서울','도봉구','서울 도봉구 도봉로123길 4','01012411241','riderrider@naver.com','가입대기','b012','c'),
('tjwjd','1111','서정스','서정운송','13529','경기','성남시 분당구','경기 성남시 분당구 판교역로 166','01022222222','sdads@naver.com','가입대기','b012','c'),
('user001','1234','유저001','유저001','13529','경기','성남시 분당구','경기 성남시 분당구 판교역로 166','01012341234','user001@naver.com','정상','b001','a'),
('user002','1','아무개','공룡','06112','서울','강남구','서울 강남구 논현로123길 4-1','01012415435','skrudddud123@naver.com','정상','b001','b'),
('user003','1','돌고리','돌고리','06350','서울','강남구','서울 강남구 광평로 61','01041654161','dsaflkj@naver.com@naver.com','정상','b001','a'),
('user004','1234','이름','닉네임','06035','서울','강남구','서울 강남구 가로수길 5','01012341234','skruddd@naver.com','정상','b001','a'),
('user119','1','이근일','이근일','44260','울산','북구','울산 북구 아랫율동2길 262-70','010123123','213@naver.com','정상','b010','a');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_div`
--

DROP TABLE IF EXISTS `user_div`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_div` (
  `user_div` varchar(255) NOT NULL COMMENT '일반/인증/라이더/관리자\r\na/b/c/d',
  `user_div_name` varchar(255) DEFAULT NULL COMMENT '일반/인증/라이더/관리자\r\na/b/c/d',
  PRIMARY KEY (`user_div`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_div`
--

LOCK TABLES `user_div` WRITE;
/*!40000 ALTER TABLE `user_div` DISABLE KEYS */;
INSERT INTO `user_div` VALUES
('a','일반'),
('b','인증'),
('c','라이더'),
('d','관리자');
/*!40000 ALTER TABLE `user_div` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_history`
--

DROP TABLE IF EXISTS `user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_history` (
  `user_id` varchar(255) NOT NULL,
  `user_state` varchar(255) DEFAULT NULL,
  `state_time` timestamp NULL DEFAULT current_timestamp(),
  `user_content` varchar(255) DEFAULT NULL,
  `admin_id` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_history`
--

LOCK TABLES `user_history` WRITE;
/*!40000 ALTER TABLE `user_history` DISABLE KEYS */;
INSERT INTO `user_history` VALUES
('coo810','','2023-05-18 02:27:10','kmjlghfhgf','admin'),
('cpzm1234','','2023-05-18 04:43:06','uigilu','user002'),
('moriring','','2023-05-18 05:43:25','ssss','admin'),
('coo810','','2023-05-18 05:50:14','jgkcvfmv','user002'),
('dbdbdb','블록','2023-05-18 06:10:34','drftdfg','admin'),
('cinna','블록','2023-05-18 06:16:47','asd','admin'),
('bugger','블록','2023-05-18 06:36:44','처리','admin');
/*!40000 ALTER TABLE `user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verified_area`
--

DROP TABLE IF EXISTS `verified_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verified_area` (
  `user_id` varchar(255) NOT NULL,
  `verified_sido` varchar(255) DEFAULT NULL,
  `verified_sigungu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_user_TO_verified_area_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verified_area`
--

LOCK TABLES `verified_area` WRITE;
/*!40000 ALTER TABLE `verified_area` DISABLE KEYS */;
INSERT INTO `verified_area` VALUES
('bugger',NULL,'금천구'),
('pepe1',NULL,'금천구'),
('user001',NULL,'금천구');
/*!40000 ALTER TABLE `verified_area` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-22 16:39:09
