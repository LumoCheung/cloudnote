-- MySQL dump 10.13  Distrib 5.5.22, for Win32 (x86)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.5.22

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
-- Table structure for table `cn_activity`
--

DROP TABLE IF EXISTS `cn_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cn_activity` (
  `cn_activity_id` varchar(100) NOT NULL COMMENT 'æ´»åŠ¨ID',
  `cn_activity_title` varchar(500) DEFAULT NULL COMMENT 'æ´»åŠ¨æ ‡é¢˜',
  `cn_activity_body` text COMMENT 'æ´»åŠ¨ä»‹ç»(htmlç‰‡æ®µ)',
  `cn_activity_end_time` bigint(20) DEFAULT NULL COMMENT 'æ´»åŠ¨ç»“æŸæ—¶é—´',
  PRIMARY KEY (`cn_activity_id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`cn_activity_id`) REFERENCES `cn_activity_status` (`cn_activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cn_activity`
--

LOCK TABLES `cn_activity` WRITE;
/*!40000 ALTER TABLE `cn_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `cn_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cn_activity_status`
--

DROP TABLE IF EXISTS `cn_activity_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cn_activity_status` (
  `cn_activity_status_id` varchar(100) NOT NULL COMMENT 'æ´»åŠ¨çŠ¶æ€ID',
  `cn_activity_id` varchar(100) DEFAULT NULL COMMENT 'æ´»åŠ¨ID',
  `cn_activity_status_code` varchar(500) DEFAULT NULL COMMENT 'æ´»åŠ¨çŠ¶æ€Code',
  `cn_activity_status_name` varchar(500) DEFAULT NULL COMMENT 'æ´»åŠ¨çŠ¶æ€åç§°',
  PRIMARY KEY (`cn_activity_status_id`),
  KEY `FK_Reference_9` (`cn_activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cn_activity_status`
--

LOCK TABLES `cn_activity_status` WRITE;
/*!40000 ALTER TABLE `cn_activity_status` DISABLE KEYS */;
INSERT INTO `cn_activity_status` VALUES ('1','1','normal','normal');
/*!40000 ALTER TABLE `cn_activity_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cn_note`
--

DROP TABLE IF EXISTS `cn_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cn_note` (
  `cn_note_id` varchar(100) NOT NULL COMMENT 'ç¬”è®°ID',
  `cn_notebook_id` varchar(100) DEFAULT NULL COMMENT 'ç¬”è®°æœ¬ID',
  `cn_user_id` varchar(100) DEFAULT NULL COMMENT 'ç”¨æˆ·ID',
  `cn_note_status_id` varchar(100) DEFAULT NULL COMMENT 'ç¬”è®°çŠ¶æ€ID:å¤‡ç”¨',
  `cn_note_type_id` varchar(100) DEFAULT NULL COMMENT 'ç¬”è®°æœ¬ç±»åž‹IDï¼šå¤‡ç”¨',
  `cn_note_title` varchar(500) DEFAULT NULL COMMENT 'ç¬”è®°æ ‡é¢˜',
  `cn_note_body` text COMMENT 'ç¬”è®°å†…å®¹',
  `cn_note_create_time` bigint(20) DEFAULT NULL COMMENT 'ç¬”è®°åˆ›å»ºæ—¶é—´',
  `cn_note_last_modify_time` bigint(20) DEFAULT NULL COMMENT 'ç¬”è®°æœ€è¿‘ä¿®æ”¹æ—¶é—´',
  PRIMARY KEY (`cn_note_id`),
  KEY `FK_Reference_2` (`cn_notebook_id`),
  KEY `FK_Reference_3` (`cn_user_id`),
  KEY `FK_Reference_7` (`cn_note_status_id`),
  KEY `FK_Reference_8` (`cn_note_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cn_note`
--

LOCK TABLES `cn_note` WRITE;
/*!40000 ALTER TABLE `cn_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `cn_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cn_note_activity`
--

DROP TABLE IF EXISTS `cn_note_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cn_note_activity` (
  `cn_note_activity_id` varchar(100) NOT NULL COMMENT 'æŠ•ç¨¿ID',
  `cn_activity_id` varchar(100) DEFAULT NULL COMMENT 'æ´»åŠ¨ID',
  `cn_note_id` varchar(100) DEFAULT NULL COMMENT 'ç¬”è®°ID',
  `cn_note_activity_up` int(11) DEFAULT NULL COMMENT 'æŠ•ç¨¿èµž:å¢žåŠ æ•°',
  `cn_note_activity_down` int(11) DEFAULT NULL COMMENT 'æŠ•ç¨¿è¸©:å¢žåŠ æ•°',
  `cn_note_activity_title` varchar(500) DEFAULT NULL,
  `cn_note_activity_body` text,
  PRIMARY KEY (`cn_note_activity_id`),
  KEY `FK_Reference_4` (`cn_activity_id`),
  KEY `FK_Reference_5` (`cn_note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cn_note_activity`
--

LOCK TABLES `cn_note_activity` WRITE;
/*!40000 ALTER TABLE `cn_note_activity` DISABLE KEYS */;
INSERT INTO `cn_note_activity` VALUES ('',NULL,'ce997ee1-0adf-4d71-9be9-fe32807c34fb',NULL,NULL,NULL,NULL),('0533bce4-0341-4d07-a953-3e6bbb402c75','8','737a9a27-b02f-4cc2-b447-eba0f047cd0d',0,0,'aaaa','<p>é¡¶é¡¶é¡¶é¡¶é¡¶é¡¶é¡¶é¡¶é¡¶é¡¶é¡¶é¡¶é¡¶é¡¶<br/></p>'),('07468f36-fe97-4033-aa77-88c867a4fc3b','3','046b0110-67f9-48c3-bef3-b0b23bda9d4e',0,0,'å•Šå•Šå•Šå•Š','<p>çŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜Žå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜ŽçŒçŒçŒ</p><p>çŒçŒçŒçŒçŒçŒçŒè¿‡å˜Žå˜Žå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜Žå˜Žå˜Žå˜Žå˜Žä¸ªçŒçŒçŒçŒå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒ</p><p>é˜¿è¨å¾·é£žæ´’åœ°æ–¹æ’’çš„å‘ç”Ÿå¤§æ’’åœ°æ–¹ç››å¤§æ’’æ—¦é˜¿æ–¯è’‚èŠ¬æ’’çš„å‘ç”Ÿå¤§é˜¿æ–¯è’‚èŠ¬é˜¿è¨å¾·é˜¿æ–¯è’‚èŠ¬é˜¿è¨å¾·é˜¿æ–¯è’‚èŠ¬é˜¿æ–¯è’‚èŠ¬æ’’åœ°æ–¹é˜¿æ–¯è’‚èŠ¬é˜¿æ–¯è’‚èŠ¬é˜¿æ–¯è’‚èŠ¬é˜¿æ–¯è’‚èŠ¬<br/></p>'),('0c6b43f6-ada8-4eba-a859-c7f3ad68ea10','1','326f17e8-ff04-4a79-b33b-ae4bb3bb5f1b',0,0,'æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1','<p>æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1</p>'),('1111223213','111222','1231312312313',0,0,'junit test','é˜¿æ–¯é¡¿ç¦å»ºæ”¶åˆ°äº†ç©ºé—´å‘å•Šæ­»å•¦æ¬¾åˆ°å³å‘é˜¿æ–¯åˆ©åº·äº¬ä¸œæ–¹'),('1111223213123123','11122231231','1231312312313',0,0,'junit test','é˜¿æ–¯é¡¿ç¦å»ºæ”¶åˆ°äº†ç©ºé—´å‘å•Šæ­»å•¦æ¬¾åˆ°å³å‘é˜¿æ–¯åˆ©åº·äº¬ä¸œæ–¹'),('1111223213123123adf','11122231231','1231312312313',0,0,'junit test','é˜¿æ–¯é¡¿ç¦å»ºæ”¶åˆ°äº†ç©ºé—´å‘å•Šæ­»å•¦æ¬¾åˆ°å³å‘é˜¿æ–¯åˆ©åº·äº¬ä¸œæ–¹'),('1a2348f1-d083-480d-b899-41df960927bf','fa8d3d9d-2de5-4cfe-845f-951041bcc461','3febebb3-a1b7-45ac-83ba-50cdb41e5fc1',0,0,'æµ‹è¯•ç¬”è®°â€”â€”1',''),('1ef6eeaa-e995-409f-a810-7c1eeb736e99','6dc39e41-8c9e-4791-9c13-52a8e537fe64','ce997ee1-0adf-4d71-9be9-fe32807c34fb',0,0,'ddddddddddddddddddd','<p>å½­å·æµ‹è¯•å½­å·æµ‹è¯•å½­å·æµ‹è¯•å½­å·æµ‹è¯•å½­å·æµ‹è¯•å½­å·æµ‹è¯•å½­å·æµ‹è¯•å½­å·æµ‹è¯•dddddd</p>'),('20010a60-bab4-41ea-9aff-18d6c16cd110','fa8d3d9d-2de5-4cfe-845f-951041bcc461','754f9d52-3c25-40e1-ae5a-6110d799e608',0,0,'note2','<p>é˜¿æ–¯é¡¿å‘é€åˆ°æ’’æ—¦æ³•æ’’æ—¦æ³•æ–¯è’‚èŠ¬</p><p>é˜¿è¨å¾·fasä¸œæ–¹asä¸œæ–¹</p><p>asdf sæ’’åœ°æ–¹asä¸œæ–¹</p><p>asdfasçš„</p><p>asdf asdf asdé£ž</p><p>æ’’åœ°æ–¹sadé£žasä¸œæ–¹asdfæ’’æ—¦</p><p>saä¸œæ–¹</p><p>é˜¿æ–¯è’‚èŠ¬asdé£žæ´’åœ°æ–¹<br/></p>'),('2630c3fb-ac81-4501-9d54-c6fa8cd26dd5','1','d3ded3ca-4e79-48fd-a501-ea4df79936c1',0,0,'å®‰è£…ç¬”è®°','<p>é¦–å…ˆé…ç½®çŽ¯å¢ƒ~<br/></p>'),('30d697bf-c1eb-466b-9f9d-83019c6d3a56','1','60480071-f989-4945-9b1c-0d2aba07ae96',0,0,'æµ‹è¯•å‚åŠ æ´»åŠ¨â€”â€”ä¹±ä¸ƒå…«ç³Ÿ',''),('5595e8c9-df35-4e91-8e8c-a3af3a0c3de3','1','7cc685b4-1b0b-4900-8511-f948aa2c2e28',0,0,'æµ‹è¯•å‚åŠ æ´»åŠ¨â€”â€”11111111111',''),('60aadac1-6e35-4b2e-a5c4-3cd430a7803a','fa8d3d9d-2de5-4cfe-845f-951041bcc461','b4f82f9f-bc0f-480a-b8f2-335164d69945',0,0,'dddd',''),('61c4fbd2-b311-49f0-93cf-556b198c850f','fa8d3d9d-2de5-4cfe-845f-951041bcc461','ebd65da6-3f90-45f9-b045-782928a5e2c0',0,0,'æµ‹è¯•ç¬”è®°â€”â€”4',''),('6aa515cc-43b2-4ecc-8bb6-f298ad2cabd7','1','5565bda4-ddee-4f87-844e-2ba83aa4925f',0,0,'1â€”â€”5','<p>1â€”â€”5</p><p>1â€”â€”5</p><p>1â€”â€”5</p><p>1â€”â€”5</p><p>1â€”â€”5</p><p>1â€”â€”5</p><p><br/></p>'),('74a9eb36-043b-4715-8c4f-0b7927eea7de','undefined','3febebb3-a1b7-45ac-83ba-50cdb41e5fc1',0,0,'æµ‹è¯•ç¬”è®°â€”â€”1',''),('788f6e74-aa66-46eb-bc24-f041935080ff','fa8d3d9d-2de5-4cfe-845f-951041bcc461','b4f82f9f-bc0f-480a-b8f2-335164d69945',0,0,'dddd',''),('918dc992-3b64-40a4-9750-7868b15121c7','fa8d3d9d-2de5-4cfe-845f-951041bcc461','ebd65da6-3f90-45f9-b045-782928a5e2c0',0,0,'æµ‹è¯•ç¬”è®°â€”â€”4',''),('9971724f-e890-429b-8ffc-a52eb73e59a4','1','326f17e8-ff04-4a79-b33b-ae4bb3bb5f1b',0,0,'æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1','<p>æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1</p>'),('9a0512d2-e8e3-431b-9a2b-c010e01b8cf0','c7f7fcdb-37c0-4d04-8dea-99123c672d4a','60480071-f989-4945-9b1c-0d2aba07ae96',0,0,'æµ‹è¯•å‚åŠ æ´»åŠ¨â€”â€”ä¹±ä¸ƒå…«ç³Ÿ',''),('9f3fe6bc-3353-4f91-8883-452e37edcd5c','fa8d3d9d-2de5-4cfe-845f-951041bcc461','60480071-f989-4945-9b1c-0d2aba07ae96',0,0,'æµ‹è¯•å‚åŠ æ´»åŠ¨â€”â€”ä¹±ä¸ƒå…«ç³Ÿ',''),('a892e798-55aa-4ee1-ac7a-feec25f52f3a','8','b5fc7da0-b5e8-4792-8f1f-9fd4b347a64f',0,0,'ç¬”è®°1â€”â€”132','<p>é˜¿æ–¯é¡¿è¾…å¯¼è´¹çš„é˜¿è¨å¾·ä¸œæ–¹</p><p>çˆ±çš„è‰²æ”¾é£žé€Ÿè¾¾é˜¿è¨å¾·</p><p>é˜¿è¨å¾·æ’’åœ°æ–¹ æ’’æ—¦æ³•æ’’æ—¦æŒ‰æ—¶å‘è¾¾å‘æ”¾å€’è¨å£«å¤§å¤«</p><p>é˜¿è¨å¾·æ³•æ’’æ—¦é˜¿æ–¯è’‚èŠ¬123123<br/></p>'),('ae2aa279-6f29-4723-97a0-71269e649921','1','326f17e8-ff04-4a79-b33b-ae4bb3bb5f1b',0,0,'æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1','<p>æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1æµ‹è¯•æ”¶è—æ´»åŠ¨ç¬”è®°â€”â€”1</p>'),('b492c950-8690-4c50-a0dd-2ee45a6ce199','1','b6f39eed-7d6f-42a5-af4f-53b3a1d12451',0,0,'å‘¨ä½³1111','<p>å•Šæ°´äº•åŠç»¿å¡åœ£è¯žèŠ‚æ³•æ‹‰ç››ç®€å•äº†å’–å•¡æœºå¡æ‹‰æ–¯çš„äº†å‘ç”Ÿå‘äº†æŸå¸¦ç»“å‘é˜¿æ–¯è’‚èŠ¬</p><p>SDå¡åå‡»asflsakdæ‹‰æ–¯åŠ å‘æ–¯è’‚èŠ¬</p><p>asfsdaé£žé˜¿æ–¯è’‚èŠ¬</p><p>é˜¿æ–¯è’‚èŠ¬</p><p>é˜¿æ–¯è’‚èŠ¬é˜¿æ–¯è’‚èŠ¬é˜¿æ–¯è’‚èŠ¬é˜¿æ–¯è’‚èŠ¬é˜¿æ–¯è’‚èŠ¬asçš„é˜¿æ–¯è’‚èŠ¬<br/></p>'),('ba60ed45-1474-4ae2-af7c-73b10dcffbc0','1','8530622b-f739-4048-a23f-d226228756b3',0,0,'2â€”â€”1',''),('bea04303-1590-4da8-8905-3f5a3b0202e8','fa8d3d9d-2de5-4cfe-845f-951041bcc461','ebd65da6-3f90-45f9-b045-782928a5e2c0',0,0,'æµ‹è¯•ç¬”è®°â€”â€”4',''),('c08620aa-dbf6-401a-9c86-59030417c70b','fa8d3d9d-2de5-4cfe-845f-951041bcc461','3febebb3-a1b7-45ac-83ba-50cdb41e5fc1',0,0,'æµ‹è¯•ç¬”è®°â€”â€”1',''),('c365d8e6-7a51-4607-af9a-08261c2a6f7b','fa8d3d9d-2de5-4cfe-845f-951041bcc461','e633e99d-c8dd-44f3-8d8e-5b0966e0927c',0,0,'1â€”â€”1','<p>1â€”â€”11â€”â€”11â€”â€”11â€”â€”11â€”â€”11â€”â€”11â€”â€”11â€”â€”11â€”â€”11â€”â€”11â€”â€”11â€”â€”11â€”â€”1</p>'),('c44c84eb-983c-49a5-8922-34f82a6750b9','fa8d3d9d-2de5-4cfe-845f-951041bcc461','668354a9-c7b4-46a0-9a6d-b138cdefc941',0,0,'aaaa','<p>å•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Š</p><p>å•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Š</p><p><br/></p><p><br/></p><p>å•Š&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; å•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Š</p><p>å•Š&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; å•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Šå•Š</p><p>å•Š&nbsp; å•Šå•Šå®‰è£…å•Šæ“¦æ€æ‰‹é”å‡ åå°æ°´ç”µè´¹å“ˆæ•°æ®åº“ç”µè¯è´¹é˜¿è¿ªå°‘å–å’–å•¡å“ˆè‹ä¸¹çº¢å°†SDå¡åŽæ–¹å¯å‘ç”Ÿä¸œæ–¹èˆªç©ºé˜¿é£žå•Šå‰‘ç¥žå‘å“ˆå¡æ–¯åŠ å’Œä¸œæ–¹åŠ æ°´ç”µè´¹å“ˆæ–¯å¡ä¸œæ–¹çº¢å¡è¨äº¬ä¸œæ–¹çœ‹è§å¸æ³•å±€åˆ†å¼€å¥–å·è¦…çŽ‹å…¨è¦†ç›–æ’’åœ°æ–¹å°†å’Œçš„å‘å°„åˆ°å‘ç¥žç»è´§åˆ°ä»˜æ¬¾çº§å•ŠåŒé£žåˆ€æš—çº¢è‰²çš„ç½šæ¬¾äº¬å“ˆå¡åŠ å°‘åºŸè¯å¡åŠ æ°´ç”µè´¹å¡æ‹‰æ–¯ç”µè¯è´¹å¡åŠ æ°´ç”µè´¹å°±å•Šå“ˆæ’’åœ°æ–¹åº“å“ˆæ–¯ç”µè¯è´¹å¡è¨ä¸åŽå‘ç”Ÿå‰ªçŸ­å‘äº†å¡è¨äº¬ä¸œæ–¹ç¼´è´¹ã€ifåœ£è¯žèŠ‚ç½šæ¬¾åŠ é˜¿æ–¯é¡¿å‘è´§é˜¿æ–¯é¡¿å‡è‚¥æ’’æ—¦äº†å’–å•¡æœºæ”¶åˆ°å•Šå‰‘ç¥žå’–å•¡å“ˆæ¡‘å°±æ¬¾åˆ°å‘è´§çˆ±ä¸Šç§¯åˆ†å¡æ°´äº•åŠè·¯å£å‡è‚¥æ‹‰æ–¯å…‹å¥–åˆ†æ‹‰æ–¯å…‹å¥–æ³•æ‹‰å…‹æ°´ç…Žæœå•Šæ‹‰æ–¯å…‹å¥–åœ°æ–¹é˜¿æ‹‰å±±å£ç¼´è´¹ä¹ä¿Šå‡¯å‡è‚¥æ‹‰æ–¯å…‹å¥–å‘äº†å¡è¨äº¬ä¸œæ–¹çœ‹äº¬ä¸œæ–¹<br/></p>'),('d1311a01-20f0-4645-b764-b4066613134f','fa8d3d9d-2de5-4cfe-845f-951041bcc461','53d1b3ed-59a1-4715-a7b2-9027b0d551e0',0,0,'å‘¨ä½³note',''),('d322e34c-e8f3-4a29-9bb1-55fa4395879f','3','046b0110-67f9-48c3-bef3-b0b23bda9d4e',0,0,'å•Šå•Šå•Šå•Š','<p>çŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜Žå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜ŽçŒçŒçŒ</p><p>çŒçŒçŒçŒçŒçŒçŒè¿‡å˜Žå˜Žå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜Žå˜Žå˜Žå˜Žå˜Žä¸ªçŒçŒçŒçŒå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒå˜Žå˜ŽçŒçŒçŒçŒçŒçŒçŒçŒçŒçŒ</p><p>é˜¿è¨å¾·é£žæ´’åœ°æ–¹æ’’çš„å‘ç”Ÿå¤§æ’’åœ°æ–¹ç››å¤§æ’’æ—¦é˜¿æ–¯è’‚èŠ¬æ’’çš„å‘ç”Ÿå¤§é˜¿æ–¯è’‚èŠ¬é˜¿è¨å¾·é˜¿æ–¯è’‚èŠ¬é˜¿è¨å¾·é˜¿æ–¯è’‚èŠ¬é˜¿æ–¯è’‚èŠ¬æ’’åœ°æ–¹é˜¿æ–¯è’‚èŠ¬é˜¿æ–¯è’‚èŠ¬é˜¿æ–¯è’‚èŠ¬é˜¿æ–¯è’‚èŠ¬<br/></p>'),('ddddddddddddddddddddddddddd','1','ce997ee1-0adf-4d71-9be9-fe32807c34fb',0,0,'ddddddddddddddddd','								</pre>'),('e49eff6a-0ff1-4c57-b529-c7e6257388d4','1','3febebb3-a1b7-45ac-83ba-50cdb41e5fc1',0,0,'æµ‹è¯•ç¬”è®°â€”â€”1',''),('eeeeeeeeeeeeeeeeeeeee','1','ce997ee1-0adf-4d71-9be9-fe32807c34fb',0,0,'eeeeeeee','<pre class=\"prettyprint linenums\">\r\n&lt;script type=\"text/javascript\"&gt;\r\n	function get_dom(e){\r\n		return document.getElementById(e);\r\n	}\r\n	function set_height(){\r\n		var pc_height=window.innerHeight;\r\n		pc_height=pc_height-131;\r\n		get_dom(\'first_side_right\').style.height=(pc_height-31)+\'px\';\r\n		get_dom(\'second_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'four_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'input_note_text\').value=pc_height+\'px\';\r\n		get_dom(\'third_side_right\').style.height=(pc_height-15)+\'px\';\r\n		get_dom(\'fifth_side_right\').style.height=(pc_height-15)+\'px\';\r\n	}\r\n	set_height();\r\n	window.onresize=function(){\r\n		set_height();//pengchuan\r\n	}\r\n	function get_dom(e){\r\n		return document.getElementById(e);\r\n	}\r\n	function set_height(){\r\n		var pc_height=window.innerHeight;\r\n		pc_height=pc_height-131;\r\n		get_dom(\'first_side_right\').style.height=(pc_height-31)+\'px\';\r\n		get_dom(\'second_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'four_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'input_note_text\').value=pc_height+\'px\';\r\n		get_dom(\'third_side_right\').style.height=(pc_height-15)+\'px\';\r\n		get_dom(\'fifth_side_right\').style.height=(pc_height-15)+\'px\';\r\n	}\r\n	set_height();\r\n	window.onresize=function(){\r\n		set_height();//pengchuan\r\n	}\r\n	function get_dom(e){\r\n		return document.getElementById(e);\r\n	}\r\n	function set_height(){\r\n		var pc_height=window.innerHeight;\r\n		pc_height=pc_height-131;\r\n		get_dom(\'first_side_right\').style.height=(pc_height-31)+\'px\';\r\n		get_dom(\'second_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'four_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'input_note_text\').value=pc_height+\'px\';\r\n		get_dom(\'third_side_right\').style.height=(pc_height-15)+\'px\';\r\n		get_dom(\'fifth_side_right\').style.height=(pc_height-15)+\'px\';\r\n	}\r\n	set_height();\r\n	window.onresize=function(){\r\n		set_height();//pengchuan\r\n	}\r\n	function get_dom(e){\r\n		return document.getElementById(e);\r\n	}\r\n	function set_height(){\r\n		var pc_height=window.innerHeight;\r\n		pc_height=pc_height-131;\r\n		get_dom(\'first_side_right\').style.height=(pc_height-31)+\'px\';\r\n		get_dom(\'second_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'four_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'input_note_text\').value=pc_height+\'px\';\r\n		get_dom(\'third_side_right\').style.height=(pc_height-15)+\'px\';\r\n		get_dom(\'fifth_side_right\').style.height=(pc_height-15)+\'px\';\r\n	}\r\n	set_height();\r\n	window.onresize=function(){\r\n		set_height();//pengchuan\r\n	}\r\n	function get_dom(e){\r\n		return document.getElementById(e);\r\n	}\r\n	function set_height(){\r\n		var pc_height=window.innerHeight;\r\n		pc_height=pc_height-131;\r\n		get_dom(\'first_side_right\').style.height=(pc_height-31)+\'px\';\r\n		get_dom(\'second_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'four_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'input_note_text\').value=pc_height+\'px\';\r\n		get_dom(\'third_side_right\').style.height=(pc_height-15)+\'px\';\r\n		get_dom(\'fifth_side_right\').style.height=(pc_height-15)+\'px\';\r\n	}\r\n	set_height();\r\n	window.onresize=function(){\r\n		set_height();//pengchuan\r\n	}\r\n	function get_dom(e){\r\n		return document.getElementById(e);\r\n	}\r\n	function set_height(){\r\n		var pc_height=window.innerHeight;\r\n		pc_height=pc_height-131;\r\n		get_dom(\'first_side_right\').style.height=(pc_height-31)+\'px\';\r\n		get_dom(\'second_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'four_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'input_note_text\').value=pc_height+\'px\';\r\n		get_dom(\'third_side_right\').style.height=(pc_height-15)+\'px\';\r\n		get_dom(\'fifth_side_right\').style.height=(pc_height-15)+\'px\';\r\n	}\r\n	set_height();\r\n	window.onresize=function(){\r\n		set_height();//pengchuan\r\n	}\r\n	function get_dom(e){\r\n		return document.getElementById(e);\r\n	}\r\n	function set_height(){\r\n		var pc_height=window.innerHeight;\r\n		pc_height=pc_height-131;\r\n		get_dom(\'first_side_right\').style.height=(pc_height-31)+\'px\';\r\n		get_dom(\'second_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'four_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'input_note_text\').value=pc_height+\'px\';\r\n		get_dom(\'third_side_right\').style.height=(pc_height-15)+\'px\';\r\n		get_dom(\'fifth_side_right\').style.height=(pc_height-15)+\'px\';\r\n	}\r\n	set_height();\r\n	window.onresize=function(){\r\n		set_height();//pengchuan\r\n	}\r\n&lt;/script&gt;\r\n								</pre>'),('ffdf744f-0845-49bf-b7b3-81b3cd622cf9','fa8d3d9d-2de5-4cfe-845f-951041bcc461','9187ffd3-4c1e-4768-9f2f-c600e835b823',0,0,'æµ‹è¯•ç¬”è®°â€”â€”2',''),('sssssssssssssssssssssssssssssss','1','ce997ee1-0adf-4d71-9be9-fe32807c34fb',0,0,'ssssssssssssssssssssssssssss','ssssssssssssssssssssss'),('wwwwwwwwwwwwwwwwwww','1','ce997ee1-0adf-4d71-9be9-fe32807c34fb',0,0,'æˆ‘å‹’ä¸ªåŽ»','æˆ‘å‹’ä¸ªåŽ»~~~~~');
/*!40000 ALTER TABLE `cn_note_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cn_note_status`
--

DROP TABLE IF EXISTS `cn_note_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cn_note_status` (
  `cn_note_status_id` varchar(100) NOT NULL COMMENT 'ç¬”è®°çŠ¶æ€ID',
  `cn_note_status_code` varchar(100) DEFAULT NULL COMMENT 'ç¬”è®°çŠ¶æ€Code',
  `cn_note_status_name` varchar(500) DEFAULT NULL COMMENT 'ç¬”è®°çŠ¶æ€åå­—',
  PRIMARY KEY (`cn_note_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cn_note_status`
--

LOCK TABLES `cn_note_status` WRITE;
/*!40000 ALTER TABLE `cn_note_status` DISABLE KEYS */;
INSERT INTO `cn_note_status` VALUES ('1','normal','normal');
/*!40000 ALTER TABLE `cn_note_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cn_note_type`
--

DROP TABLE IF EXISTS `cn_note_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cn_note_type` (
  `cn_note_type_id` varchar(100) NOT NULL COMMENT 'ç¬”è®°æœ¬ç±»åž‹ID',
  `cn_note_type_code` varchar(100) DEFAULT NULL COMMENT 'ç¬”è®°æœ¬ç±»åž‹Code',
  `cn_note_type_name` varchar(500) DEFAULT NULL COMMENT 'ç¬”è®°æœ¬ç±»åž‹åç§°',
  `cn_note_type_desc` text COMMENT 'ç¬”è®°æœ¬ç±»åž‹è¯´æ˜Ž',
  PRIMARY KEY (`cn_note_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cn_note_type`
--

LOCK TABLES `cn_note_type` WRITE;
/*!40000 ALTER TABLE `cn_note_type` DISABLE KEYS */;
INSERT INTO `cn_note_type` VALUES ('1','normal','normal',NULL);
/*!40000 ALTER TABLE `cn_note_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cn_notebook`
--

DROP TABLE IF EXISTS `cn_notebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cn_notebook` (
  `cn_notebook_id` varchar(100) NOT NULL COMMENT 'ç¬”è®°æœ¬ID',
  `cn_user_id` varchar(100) DEFAULT NULL COMMENT 'ç”¨æˆ·ID',
  `cn_notebook_type_id` varchar(100) DEFAULT NULL COMMENT 'ç¬”è®°æœ¬ç±»åž‹ID',
  `cn_notebook_name` varchar(500) DEFAULT NULL COMMENT 'ç¬”è®°æœ¬å',
  `cn_notebook_desc` text COMMENT 'ç¬”è®°æœ¬è¯´æ˜Ž',
  `cn_notebook_createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cn_notebook_id`),
  KEY `FK_Note_User_Reference` (`cn_user_id`),
  KEY `FK_Reference_6` (`cn_notebook_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cn_notebook`
--

LOCK TABLES `cn_notebook` WRITE;
/*!40000 ALTER TABLE `cn_notebook` DISABLE KEYS */;
INSERT INTO `cn_notebook` VALUES ('31020487-2c59-477e-8ac3-ec665bb05af2','688e744d-fb34-4ca6-8459-9ac3fef2bda7',NULL,'é»?è®¤ç¬?è®°æ?¬',NULL,'2015-01-07 08:46:24'),('b224ace6-f0a3-4c4c-ba75-4c6092c54fda','688e744d-fb34-4ca6-8459-9ac3fef2bda7',NULL,'zzzz',NULL,'2015-01-07 08:47:11'),('fa443fd6-9965-4c57-a2e2-4dce19c5b8d5','688e744d-fb34-4ca6-8459-9ac3fef2bda7',NULL,'?????',NULL,'2015-01-07 08:45:24');
/*!40000 ALTER TABLE `cn_notebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cn_notebook_type`
--

DROP TABLE IF EXISTS `cn_notebook_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cn_notebook_type` (
  `cn_notebook_type_id` varchar(100) NOT NULL COMMENT 'ç¬”è®°æœ¬ç±»åž‹ID',
  `cn_notebook_type_code` varchar(100) DEFAULT NULL COMMENT 'ç¬”è®°æœ¬ç±»åž‹Code',
  `cn_notebook_type_name` varchar(500) DEFAULT NULL COMMENT 'ç¬”è®°æœ¬ç±»åž‹åç§°',
  `cn_notebook_type_desc` text COMMENT 'ç¬”è®°æœ¬ç±»åž‹è¯´æ˜Ž',
  PRIMARY KEY (`cn_notebook_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cn_notebook_type`
--

LOCK TABLES `cn_notebook_type` WRITE;
/*!40000 ALTER TABLE `cn_notebook_type` DISABLE KEYS */;
INSERT INTO `cn_notebook_type` VALUES ('1','favorites','favorites','æ”¶è—'),('2','recycle','recycle','å›žæ”¶ç«™'),('3','action','action','æ´»åŠ¨'),('4','push','push','æŽ¨é€'),('5','normal','normal','æ­£å¸¸'),('6','defalut','defalut','é»˜è®¤');
/*!40000 ALTER TABLE `cn_notebook_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cn_share`
--

DROP TABLE IF EXISTS `cn_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cn_share` (
  `cn_share_id` varchar(100) NOT NULL COMMENT 'å…±äº«ID',
  `cn_share_title` varchar(500) DEFAULT NULL COMMENT 'å…±äº«æ ‡é¢˜',
  `cn_share_body` text COMMENT 'å…±äº«å†…å®¹',
  `cn_note_id` varchar(100) DEFAULT NULL COMMENT 'ç¬”è®°id',
  PRIMARY KEY (`cn_share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cn_share`
--

LOCK TABLES `cn_share` WRITE;
/*!40000 ALTER TABLE `cn_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `cn_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cn_user`
--

DROP TABLE IF EXISTS `cn_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cn_user` (
  `cn_user_id` varchar(100) NOT NULL COMMENT 'ç”¨æˆ·ID',
  `cn_user_name` varchar(100) DEFAULT NULL COMMENT 'ç”¨æˆ·å',
  `cn_user_password` varchar(100) DEFAULT NULL COMMENT 'å¯†ç ',
  `cn_user_token` varchar(100) DEFAULT NULL COMMENT 'ä»¤ç‰Œ',
  `cn_user_desc` text COMMENT 'è¯´æ˜Ž',
  `cn_user_nick` varchar(100) DEFAULT NULL COMMENT 'æ˜µç§°',
  PRIMARY KEY (`cn_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cn_user`
--

LOCK TABLES `cn_user` WRITE;
/*!40000 ALTER TABLE `cn_user` DISABLE KEYS */;
INSERT INTO `cn_user` VALUES ('688e744d-fb34-4ca6-8459-9ac3fef2bda7','zhouj','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'zzz');
/*!40000 ALTER TABLE `cn_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-07 16:56:29
