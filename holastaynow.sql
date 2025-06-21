-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: holastaynow
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--
# CREATE DATABASE holastaynow;
#
# Use holastaynow;



DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userMail` text NOT NULL,
  `userPassword` text NOT NULL,
  `userRole` int(11) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'1@1','1',1),(2,'2@2','2',2),(3,'3@3','3',3),(4,'4@4','4',4);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `billID` int(11) NOT NULL AUTO_INCREMENT,
  `roomID` int(11) NOT NULL,
  `service` decimal(19,4) NOT NULL,
  `electric` decimal(19,4) NOT NULL,
  `water` decimal(19,4) NOT NULL,
  `roomFee` decimal(19,4) NOT NULL,
  `other` decimal(19,4) NOT NULL,
  `penMoney` decimal(19,4) NOT NULL,
  `createAt` datetime NOT NULL,
  `deadline` datetime NOT NULL,
  `payAt` datetime DEFAULT NULL,
  PRIMARY KEY (`billID`),
  KEY `FK_bill_room` (`roomID`),
  CONSTRAINT `FK_bill_room` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guideline`
--

DROP TABLE IF EXISTS `guideline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guideline` (
  `guideID` int(11) NOT NULL AUTO_INCREMENT,
  `guideName` text NOT NULL,
  `img` text NOT NULL,
  PRIMARY KEY (`guideID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guideline`
--

LOCK TABLES `guideline` WRITE;
/*!40000 ALTER TABLE `guideline` DISABLE KEYS */;
/*!40000 ALTER TABLE `guideline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` text NOT NULL,
  `itemImg` longblob NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `newID` int(11) NOT NULL AUTO_INCREMENT,
  `newTitle` text NOT NULL,
  `description` text NOT NULL,
  `img` text NOT NULL,
  `creatAt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`newID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_payments_account` (`userId`),
  CONSTRAINT `FK_payments_account` FOREIGN KEY (`userId`) REFERENCES `account` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalty`
--

DROP TABLE IF EXISTS `penalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penalty` (
  `penID` int(11) NOT NULL AUTO_INCREMENT,
  `reportID` int(11) NOT NULL,
  `accuseID` int(11) NOT NULL,
  `roomID` int(11) NOT NULL,
  `description` text NOT NULL,
  `penDate` datetime NOT NULL,
  `ruleID` int(11) NOT NULL,
  `penStatus` tinyint(1) NOT NULL,
  PRIMARY KEY (`penID`),
  KEY `FK_penalty_room` (`roomID`),
  KEY `FK_penalty_rule` (`ruleID`),
  KEY `FK_penalty_accuse` (`accuseID`),
  CONSTRAINT `FK_penalty_accuse` FOREIGN KEY (`accuseID`) REFERENCES `account` (`userID`),
  CONSTRAINT `FK_penalty_room` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`),
  CONSTRAINT `FK_penalty_rule` FOREIGN KEY (`ruleID`) REFERENCES `rule` (`ruleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty`
--

LOCK TABLES `penalty` WRITE;
/*!40000 ALTER TABLE `penalty` DISABLE KEYS */;
/*!40000 ALTER TABLE `penalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penaltys`
--

DROP TABLE IF EXISTS `penaltys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penaltys` (
  `penID` int(11) NOT NULL AUTO_INCREMENT,
  `roomID` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `penDate` date DEFAULT NULL,
  `ruleID` int(11) DEFAULT NULL,
  `penStatus` int(11) DEFAULT NULL,
  `evidenceImg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`penID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penaltys`
--

LOCK TABLES `penaltys` WRITE;
/*!40000 ALTER TABLE `penaltys` DISABLE KEYS */;
/*!40000 ALTER TABLE `penaltys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renter`
--

DROP TABLE IF EXISTS `renter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `renter` (
  `renterID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `roomID` int(11) DEFAULT NULL,
  `renterStatus` tinyint(1) NOT NULL,
  `renterHaveRoom` tinyint(1) NOT NULL,
  `balance` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`renterID`),
  KEY `FK_renter_user` (`userID`),
  KEY `FK_renter_room` (`roomID`),
  CONSTRAINT `FK_renter_room` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`),
  CONSTRAINT `FK_renter_user` FOREIGN KEY (`userID`) REFERENCES `account` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renter`
--

LOCK TABLES `renter` WRITE;
/*!40000 ALTER TABLE `renter` DISABLE KEYS */;
/*!40000 ALTER TABLE `renter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `requestID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `requestType` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `createAt` datetime NOT NULL,
  `resStatus` varchar(50) NOT NULL,
  PRIMARY KEY (`requestID`),
  KEY `FK_request_user` (`userID`),
  KEY `FK_request_type` (`requestType`),
  CONSTRAINT `FK_request_type` FOREIGN KEY (`requestType`) REFERENCES `requesttype` (`reqTypeID`),
  CONSTRAINT `FK_request_user` FOREIGN KEY (`userID`) REFERENCES `account` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requesttype`
--

DROP TABLE IF EXISTS `requesttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requesttype` (
  `reqTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reqTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requesttype`
--

LOCK TABLES `requesttype` WRITE;
/*!40000 ALTER TABLE `requesttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `requesttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `roomID` int(11) NOT NULL,
  `roomFloor` int(11) NOT NULL,
  `roomNumber` int(11) NOT NULL,
  `roomSize` int(11) NOT NULL,
  `roomFee` decimal(19,4) NOT NULL,
  `roomImg` text DEFAULT NULL,
  `roomStatus` int(11) DEFAULT NULL,
  `roomOccupant` int(11) DEFAULT NULL,
  `roomDepartment` char(10) DEFAULT NULL,
  `vipID` int(11) DEFAULT NULL,
  PRIMARY KEY (`roomID`),
  KEY `FK_room_vip` (`vipID`),
  CONSTRAINT `FK_room_vip` FOREIGN KEY (`vipID`) REFERENCES `vip` (`vipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomitem`
--

DROP TABLE IF EXISTS `roomitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomitem` (
  `roomItemID` int(11) NOT NULL AUTO_INCREMENT,
  `roomID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`roomItemID`),
  KEY `FK_roomItem_room` (`roomID`),
  KEY `FK_roomItem_item` (`itemID`),
  CONSTRAINT `FK_roomItem_item` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`),
  CONSTRAINT `FK_roomItem_room` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomitem`
--

LOCK TABLES `roomitem` WRITE;
/*!40000 ALTER TABLE `roomitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `roomitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rule` (
  `ruleID` int(11) NOT NULL AUTO_INCREMENT,
  `ruleName` text NOT NULL,
  `img` text NOT NULL,
  `scoreChange` int(11) NOT NULL,
  `penMoney` decimal(19,4) NOT NULL,
  PRIMARY KEY (`ruleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security`
--

DROP TABLE IF EXISTS `security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `security` (
  `seID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `xShift` int(11) NOT NULL,
  `seStatus` tinyint(1) NOT NULL,
  `Department` char(10) DEFAULT NULL,
  PRIMARY KEY (`seID`),
  KEY `FK_security_user` (`userID`),
  CONSTRAINT `FK_security_user` FOREIGN KEY (`userID`) REFERENCES `account` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security`
--

LOCK TABLES `security` WRITE;
/*!40000 ALTER TABLE `security` DISABLE KEYS */;
/*!40000 ALTER TABLE `security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slider` (
  `SliderId` int(11) NOT NULL AUTO_INCREMENT,
  `SliderName` varchar(255) NOT NULL,
  `SliderImg` text DEFAULT NULL,
  `SliderDate` varchar(255) DEFAULT NULL,
  `SliderStatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`SliderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider`
--

LOCK TABLES `slider` WRITE;
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage`
--

DROP TABLE IF EXISTS `usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage` (
  `usageID` int(11) NOT NULL AUTO_INCREMENT,
  `roomID` int(11) NOT NULL,
  `electricNum` float NOT NULL,
  `waterBlock` float NOT NULL,
  `createAt` datetime NOT NULL,
  `payAt` datetime DEFAULT NULL,
  PRIMARY KEY (`usageID`),
  KEY `FK_usage_room` (`roomID`),
  CONSTRAINT `FK_usage_room` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage`
--

LOCK TABLES `usage` WRITE;
/*!40000 ALTER TABLE `usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usageprice`
--

DROP TABLE IF EXISTS `usageprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usageprice` (
  `UsageID` int(11) NOT NULL,
  `Electric_Price` float NOT NULL,
  `Water_Block_Price` float NOT NULL,
  KEY `FK_usagePrice_usage` (`UsageID`),
  CONSTRAINT `FK_usagePrice_usage` FOREIGN KEY (`UsageID`) REFERENCES `usage` (`usageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usageprice`
--

LOCK TABLES `usageprice` WRITE;
/*!40000 ALTER TABLE `usageprice` DISABLE KEYS */;
/*!40000 ALTER TABLE `usageprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userGender` varchar(10) NOT NULL,
  `userBirth` date NOT NULL,
  `userAddress` text NOT NULL,
  `userPhone` varchar(20) NOT NULL,
  `userAvatar` text NOT NULL,
  PRIMARY KEY (`userID`),
  CONSTRAINT `FK_user_account` FOREIGN KEY (`userID`) REFERENCES `account` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'quat','Other','2003-02-11','','0345584960',''),(2,'vip','Male','2002-03-02','','0976543210',''),(3,'vip','Male','2002-03-04','','0976543210',''),(4,'vip','Male','2002-03-03','','0976543210','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vip`
--

DROP TABLE IF EXISTS `vip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vip` (
  `vipID` int(11) NOT NULL AUTO_INCREMENT,
  `vipName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vipID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vip`
--

LOCK TABLES `vip` WRITE;
/*!40000 ALTER TABLE `vip` DISABLE KEYS */;
INSERT INTO `vip` VALUES (1,'VIP 1'),(2,'VIP 2'),(3,'VIP 3');
/*!40000 ALTER TABLE `vip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-16 20:50:54
-- Dump completed on 2025-06-16 20:50:54

-- First, ensure all users referenced by other tables exist.
-- Move all INSERT statements for the 'account' table here.
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (111, 'nguyenanhtu@gmail.com', 'pass1234', 2);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (322, 'phamvannam@gmail.com', 'pass1234', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (412, 'tranlananh@gmail.com', 'pass1234', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (215, 'levanduy@gmail.com', 'pass1234', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (6, 'nguyenthimai@gmail.com', 'pass1234', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (7, 'hoangvanlong@gmail.com', 'pass1234', 3);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (8, 'dothihang@gmail.com', 'pass1234', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (9, 'vuvantuan@gmail.com', 'pass1234', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (10, 'nguyenvananh@gmail.com', 'pass1234', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (11, 'phanvanhung@gmail.com', 'pass1234', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (12, 'buithihang@gmail.com', 'pass1234', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (13, 'travanhung@gmail.com', 'pass1234', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (14, 'dangthiha@gmail.com', 'pass1234', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (15, 'nguyenvanlinh@gmail.com', '11111', 2);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (16, 'nguyenthihong@gmail.com', 'pass1234', 3);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (17, 'levanquan@gmail.com', 'pass1234', 3);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (18, 'tranthithu@gmail.com', 'pass1234', 3);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (19, 'phamvankhoi@gmail.com', 'pass1234', 3);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (20, 'admin@gmail.com', 'admin123', 4);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (21, 'hoatt@gmail.com', 'password123', 0);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (22, 'binhnv@gmail.com', 'password123', 0);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (23, 'lanpt@gmail.com', 'password123', 0);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (24, 'haile@gmail.com', 'password123', 0);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (25, 'loannt@gmail.com', 'password123', 0);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (26, 'hoatd@gmail.com', 'password123', 0);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (27, 'ngankn@gmail.com', 'password123', 0);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (28, 'tuanntm@gmail.com', 'password123', 0);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (29, 'thaottt@gmail.com', 'password123', 0);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (30, 'minhvp@gmail.com', 'password123', 0);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (31, 'ngoquocan@gmail.com', '12345678abC@', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (32, 'abc@gmail.com', '123456789abC!', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (34, 'hehehe1@gmail.com', '1234567891abC@', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (38, 'quocphongoccho3@gmail.com', '12345678A!', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (39, 'quocphongoccho@gmail.com', '12345678A!', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (40, 'Creeper2k3@gmail.com', '23456789!', 0);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (41, 'q.anisreal03@gmail.com', '07122003abC@', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (43, 'elr1232003@gmail.com', '07122003abC@', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (44, 'anstillhere03@gmail.com', '07122003', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (47, 'hungdosy16@gmail.com', '123456', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (48, 'hungdosy17@gmail.com', '123456789A!', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (49, 'ngtatricuong20003@gmail.com', '123123', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (50, 'cuongntthe173555@fpt.edu.vn', '123123', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (1049, 'elearningoln391@gmail.com', 'Cuong123123', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (1050, 'ngtatricuong2003@gmail.com', 'cuong123', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (1051, 'choimotminh2020@gmail.com', 'Cuong123@', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (1052, 'phuduc0707@gmail.com', 'cuong123', 1);
INSERT INTO account (userID, userMail, userPassword, userRole) VALUES (2052, 'quandahe176865@fpt.edu.vn', 'Cuong123@', 1);

-- Then, insert into tables that depend on 'account' (like 'user').
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (333, 'Phạm Quang Thắng', 'Male', '2002-03-02', '39 Lê Hồng Phong, TP. Hải Phòng', '0976543210', './Image/user/avatar3.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (433, 'Trần Thị Lan Anh', 'Female', '2003-12-10', '105 Trần Phú, TP. Vinh, Nghệ An', '0965432109', './Image/user/avatar4.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (533, 'Lê Văn Duy', 'Male', '2003-08-25', '30 Đại Cồ Việt, Hai Bà Trưng, Hà Nội', '0932109876', './Image/user/avatar5.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (633, 'Nguyễn Thị Mai', 'Female', '2003-06-18', '15 Hoàng Cầu, Đống Đa, Hà Nội', '0943210987', './Image/user/avatar6.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (7, 'Hoàng Văn Long', 'Male', '2003-02-28', '70 Lê Duẩn, Hoàn Kiếm, Hà Nội', '0910987654', './Image/user/avatar7.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (8, 'Đỗ Thị Hằng', 'Female', '2004-09-07', '45 Lý Thường Kiệt, Hà Tĩnh', '0921098765', './Image/user/avatar8.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (9, 'Vũ Văn Tuấn', 'Male', '2005-11-12', '112 Lý Thường Kiệt, Hà Tĩnh', '0909876543', './Image/user/avatar9.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (10, 'Nguyễn Vân Anh', 'Other', '2005-07-22', '5 Hàng Bài, Hoàn Kiếm, Hà Nội', '0998765432', './Image/user/avatar10.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (11, 'Phan Văn Hùng', 'Male', '2005-04-03', '51 Nguyễn Thái Học, Cà Mau', '0954321098', './Image/user/avatar11.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (12, 'Bùi Thị Hằng', 'Female', '2005-01-30', '36 Trần Nhân Tông, Hải Dương', '0912345678', './Image/user/avatar12.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (13, 'Trần Văn Hùng', 'Male', '2000-08-14', '35 Lê Thánh Tông, Hoàn Kiếm, Hà Nội', '0987654321', './Image/user/avatar13.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (14, 'Đặng Thị Hà', 'Other', '2000-03-17', '80 Lê Lai, TP. Biên Hòa, Đồng Nai', '0987654321', './Image/user/avatar14.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (16, 'Nguyễn Hoàng Hồng', 'Male', '1987-05-25', '92 Điện Biên Phủ, Lào Cai', '0987654321', './Image/user/avatar16.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (17, 'Lê Văn Quân', 'Male', '1985-09-12', '18 Trần Phú, Ba Đình, Hà Nội', '0987654321', './Image/user/avatar17.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (18, 'Trần Thị Thu', 'Female', '1996-11-30', '42 Trần Phú, Nam Định', '0987654321', './Image/user/avatar18.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (19, 'Phạm Văn Khôi', 'Male', '1986-02-08', '20 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', '0987654321', './Image/user/avatar19.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (20, 'Admin', 'Unknown', '1989-07-18', 'Unknown', '0987654321', './Image/user/avatar20.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (21, 'Trần Thị Hoa', 'Female', '1990-08-10', '30 Đường Lê Lợi, Hai Bà Trưng, Hà Nội', '0987654321', './Image/user/avatar21.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (22, 'Nguyễn Văn Bình', 'Male', '1994-06-05', '40 Phố Huế, Hai Bà Trưng, Hà Nội', '0987654322', './Image/user/avatar22.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (23, 'Phạm Thị Lan', 'Female', '1998-02-18', '50 Hàng Bài, Hoàn Kiếm, Hà Nội', '0987654323', './Image/user/avatar23.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (24, 'Lê Văn Hải', 'Male', '2000-12-25', '60 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', '0987654324', './Image/user/avatar24.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (25, 'Nguyễn Thị Loan', 'Female', '1996-10-03', '70 Trần Phú, Ba Đình, Hà Nội', '0987654325', './Image/user/avatar25.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (26, 'Trần Đức Hòa', 'Male', '1992-04-15', '80 Bà Triệu, Hai Bà Trưng, Hà Nội', '0987654326', './Image/user/avatar26.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (27, 'Lê Thị Kim Ngân', 'Female', '1993-07-20', '90 Lê Duẩn, Hai Bà Trưng, Hà Nội', '0987654327', './Image/user/avatar27.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (28, 'Nguyễn Minh Tuấn', 'Male', '1988-09-28', '100 Hàng Bài, Hoàn Kiếm, Hà Nội', '0987654328', './Image/user/avatar28.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (29, 'Trần Thị Thanh Thảo', 'Female', '1991-11-17', '110 Hàng Điếu, Hoàn Kiếm, Hà Nội', '0987654329', './Image/user/avatar29.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (30, 'Phạm Văn Minh', 'Male', '1985-05-30', '120 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', '0987654330', './Image/user/avatar30.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (31, 'nguyen van a', 'Male', '2021-01-01', 'hanoi', '0123456789', 'abc.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (32, 'nguyen Thi B', 'Female', '2023-02-02', 'hanoi', '0987654322', 'nguyenthib.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (34, 'ngoquocquoc', 'Male', '2026-06-16', 'hanoi', '0101020305', 'sds.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (38, 'taotestthu', 'Female', '1212-12-12', 'hanoi', '0203040507', 'abc.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (39, 'taotestthu1', 'Female', '1212-12-12', 'hanoi', '0203040507', 'abc.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (40, 'taotestthu2', 'Male', '1212-12-12', 'hanoi', '0123456543', 'abc.jpg');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (41, 'Renter', 'Male', '2003-12-07', 'Thuong Tin, Ha Noi', '0869239011', '');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (43, 'Nguyễn Hồng Phúc', 'Male', '2003-12-09', 'Thuong Tin, Ha Noi', '0537543212', '');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (44, 'Đỗ Sỹ Hưng', 'Male', '2003-12-07', 'Thuong Tin, Ha Noi', '0869239012', '');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (47, 'Đỗ Thị Hưng', 'Female', '2023-01-01', 'donganh', '0433256786', '');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (48, 'Ngô Quốc Ân', 'Male', '2003-12-07', 'hanoi', '0985444545', '');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (49, 'cuong', 'Male', '2003-04-20', 'Phu tho', '0395866168', '');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (1051, 'ngtatricuong2003@gmail.com', 'Male', '1900-01-01', 'Phu Tho', '0395866168', '');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (1052, 'duc', 'Male', '2001-03-12', 'HA noi', '0912345678', '');
INSERT INTO user (userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar) VALUES (2052, 'quan', 'Male', '2024-08-25', 'Phu tho', '0912345678', '');

-- Now that all referenced userIDs exist, you can insert into renter.
INSERT INTO renter (renterID, userID, roomID, renterStatus, renterHaveRoom, balance) VALUES (1641, 50, NULL, 0, 0, 0.0000);
INSERT INTO renter (renterID, userID, roomID, renterStatus, renterHaveRoom, balance) VALUES (1642, 50, NULL, 0, 0, 0.0000);
INSERT INTO renter (renterID, userID, roomID, renterStatus, renterHaveRoom, balance) VALUES (1643, 50, NULL, 0, 0, 0.0000);
INSERT INTO renter (renterID, userID, roomID, renterStatus, renterHaveRoom, balance) VALUES (1644, 1049, NULL, 0, 0, 0.0000);
INSERT INTO renter (renterID, userID, roomID, renterStatus, renterHaveRoom, balance) VALUES (1645, 1049, NULL, 0, 0, 0.0000);
INSERT INTO renter (renterID, userID, roomID, renterStatus, renterHaveRoom, balance) VALUES (1646, 1049, NULL, 0, 0, 0.0000);
INSERT INTO renter (renterID, userID, roomID, renterStatus, renterHaveRoom, balance) VALUES (1647, 1049, NULL, 0, 0, 0.0000);
INSERT INTO renter (renterID, userID, roomID, renterStatus, renterHaveRoom, balance) VALUES (1648, 1049, NULL, 0, 0, 20200000.0000);
INSERT INTO renter (renterID, userID, roomID, renterStatus, renterHaveRoom, balance) VALUES (1649, 50, NULL, 0, 0, 650000.0000);
INSERT INTO renter (renterID, userID, roomID, renterStatus, renterHaveRoom, balance) VALUES (1655, 3, 3, 1, 1, 0.0000);

-- Continue with the rest of your inserts.
INSERT INTO penaltys (penID, roomID, description, penDate, ruleID, penStatus, evidenceImg) VALUES (1, 1, 'mat trat tu 4', '2024-09-06', 1, -1, 'https://tamguong.vn/wp-content/uploads/2020/10/tri_rung_toc_bang_bia.jpg');
INSERT INTO penaltys (penID, roomID, description, penDate, ruleID, penStatus, evidenceImg) VALUES (3, 10, 'on ao', '2024-08-08', 1, 1, 'https://th.bing.com/th/id/OIP._io-6aUEROOvygQo6mh7UgHaE8?rs=1&pid=ImgDetMain');
INSERT INTO penaltys (penID, roomID, description, penDate, ruleID, penStatus, evidenceImg) VALUES (5, 14, 'Lam hong phong', '2024-08-12', 1, 1, 'https://tamguong.vn/wp-content/uploads/2020/10/tri_rung_toc_bang_bia.jpg');
INSERT INTO penaltys (penID, roomID, description, penDate, ruleID, penStatus, evidenceImg) VALUES (6, 7, 'Quay riu', '2024-08-06', 1, 1, 'https://tamguong.vn/wp-content/uploads/2020/10/tri_rung_toc_bang_bia.jpg');

INSERT INTO request (requestID, userID, requestType, title, description, createAt, resStatus) VALUES (329, 32, 8, 'cash', 'i want to rent this room', '2024-08-20 00:00:00', 'Abandoned');
INSERT INTO request (requestID, userID, requestType, title, description, createAt, resStatus) VALUES (330, 31, 1, 'sửa điều hòa', 'tôi muốn sửa điều hòa tại phòng 101', '2024-08-20 00:00:00', 'Accepted');
INSERT INTO request (requestID, userID, requestType, title, description, createAt, resStatus) VALUES (331, 41, 8, 'want to rent room', 'rent room', '2024-08-20 00:00:00', 'Accepted');
INSERT INTO request (requestID, userID, requestType, title, description, createAt, resStatus) VALUES (332, 32, 1, 'nguoi mien nui chat', 'test ', '2024-08-20 00:00:00', 'Denied');
INSERT INTO request (requestID, userID, requestType, title, description, createAt, resStatus) VALUES (333, 41, 1, 'great', 'kho qua', '2024-08-20 00:00:00', 'Accepted');
INSERT INTO request (requestID, userID, requestType, title, description, createAt, resStatus) VALUES (334, 47, 1, 'tôi muốn sửa điều hòa ', 'tôi muốn sửa điều hòa phòng 101', '2024-08-20 00:00:00', 'Accepted');
INSERT INTO request (requestID, userID, requestType, title, description, createAt, resStatus) VALUES (335, 1, 1, 'tôi muốn sửa điều hòa ', 'Room 301', '2024-08-20 00:00:00', 'Abandoned');
INSERT INTO request (requestID, userID, requestType, title, description, createAt, resStatus) VALUES (336, 1, 1, 'Sua May giat', 'Room 301', '2024-08-20 00:00:00', 'Abandoned');
INSERT INTO request (requestID, userID, requestType, title, description, createAt, resStatus) VALUES (337, 1, 4, 'Toi Muon Nuoi Thu Cung', 'Room 301', '2024-08-20 00:00:00', 'Abandoned');
INSERT INTO request (requestID, userID, requestType, title, description, createAt, resStatus) VALUES (338, 1049, 1, '321312', '123131312', '2024-08-20 00:00:00', 'Abandoned');
INSERT INTO request (requestID, userID, requestType, title, description, createAt, resStatus) VALUES (339, 1049, 8, 'fewfwe', 'fewfwfew', '2024-08-20 00:00:00', 'Accepted');
INSERT INTO request (requestID, userID, requestType, title, description, createAt, resStatus) VALUES (340, 1050, 1, 'test', 'test', '2024-08-20 00:00:00', 'Accepted');
INSERT INTO request (requestID, userID, requestType, title, description, createAt, resStatus) VALUES (341, 1, 1, 'hello quan 1', 'hello quan1', '2024-08-25 00:00:00', 'Accepted');

INSERT INTO requestType (reqTypeID, typeName) VALUES (1, 'Fix/Repair/Maintain');
INSERT INTO requestType (reqTypeID, typeName) VALUES (2, 'Install/Uninstall Device');
INSERT INTO requestType (reqTypeID, typeName) VALUES (3, 'Key Missing');
INSERT INTO requestType (reqTypeID, typeName) VALUES (4, 'Pet-Friendly Options');
INSERT INTO requestType (reqTypeID, typeName) VALUES (5, 'Item Missing/Broken Report');
INSERT INTO requestType (reqTypeID, typeName) VALUES (6, 'Temporarily postpone room rental');
INSERT INTO requestType (reqTypeID, typeName) VALUES (7, 'Report');
INSERT INTO requestType (reqTypeID, typeName) VALUES (8, 'Using Cash To Pay ');
INSERT INTO requestType (reqTypeID, typeName) VALUES (9, '.ETC');

INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (22, 4, 502, 1, 1000.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (23, 1, 503, 1, 2425.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (24, 1, 504, 1, 2753.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (25, 2, 505, 1, 2556.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (26, 4, 601, 1, 2864.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (27, 1, 602, 1, 1003.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (28, 2, 603, 1, 1893.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (29, 4, 604, 1, 2590.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (30, 2, 605, 1, 2139.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (31, 1, 701, 1, 1711.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (32, 1, 702, 1, 2135.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (33, 4, 703, 1, 2469.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (34, 2, 704, 1, 1376.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (35, 3, 705, 1, 2435.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (36, 2, 801, 1, 1434.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (37, 2, 802, 1, 2924.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (38, 4, 803, 1, 2996.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (39, 4, 804, 1, 2206.0000, NULL, 1, 0, 'B');
INSERT INTO room (roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomStatus, roomOccupant, roomDepartment) VALUES (40, 2, 805, 1, 1913.0000, NULL, 1, 0, 'B');

INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (6, 2, 1, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (7, 2, 3, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (8, 2, 5, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (9, 2, 6, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (10, 2, 8, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (11, 3, 2, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (12, 3, 4, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (13, 3, 6, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (14, 3, 7, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (15, 3, 9, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (16, 4, 3, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (17, 4, 5, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (18, 4, 7, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (19, 4, 8, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (20, 4, 10, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (21, 5, 1, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (22, 5, 2, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (23, 5, 3, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (24, 5, 4, 4);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (25, 5, 5, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (26, 6, 1, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (27, 6, 2, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (28, 6, 3, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (29, 6, 4, 4);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (30, 6, 5, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (31, 7, 1, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (32, 7, 3, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (33, 7, 5, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (34, 7, 6, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (35, 7, 8, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (36, 8, 2, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (37, 8, 4, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (38, 8, 6, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (39, 8, 7, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (40, 8, 9, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (41, 9, 3, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (42, 9, 5, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (43, 9, 7, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (44, 9, 8, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (45, 9, 10, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (46, 10, 1, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (47, 10, 2, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (48, 10, 3, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (49, 10, 4, 4);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (50, 10, 5, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (51, 11, 1, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (52, 11, 3, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (53, 11, 5, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (54, 11, 6, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (55, 11, 8, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (56, 12, 2, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (57, 12, 4, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (58, 12, 6, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (59, 12, 7, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (60, 12, 9, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (61, 13, 3, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (62, 13, 5, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (63, 13, 7, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (64, 13, 8, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (65, 13, 10, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (66, 14, 1, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (67, 14, 2, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (68, 14, 3, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (69, 14, 4, 4);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (70, 14, 5, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (71, 15, 1, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (72, 15, 3, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (73, 15, 5, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (74, 15, 6, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (75, 15, 8, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (76, 16, 2, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (77, 16, 4, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (78, 16, 6, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (79, 16, 7, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (80, 16, 9, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (81, 17, 3, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (82, 17, 5, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (83, 17, 7, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (84, 17, 8, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (85, 17, 10, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (86, 18, 1, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (87, 18, 2, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (88, 18, 3, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (89, 18, 4, 4);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (90, 18, 5, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (91, 19, 1, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (92, 19, 3, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (93, 19, 5, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (94, 19, 6, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (95, 19, 8, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (96, 20, 2, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (97, 20, 4, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (98, 20, 6, 1);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (99, 20, 7, 3);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (100, 20, 9, 2);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (103, 1, 10, 4);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (109, 1, 4, 4);
INSERT INTO roomItem (roomItemID, roomID, itemID, quantity) VALUES (110, 1, 5, 1000);

INSERT INTO rule (ruleID, ruleName, img, scoreChange, penMoney) VALUES (1, 'No Smoking', './Image/rule/rule1.jpg', -10, 100.0000);
INSERT INTO rule (ruleID, ruleName, img, scoreChange, penMoney) VALUES (2, 'Quiet Hours', './Image/rule//rule2.jpg', -5, 50.0000);
INSERT INTO rule (ruleID, ruleName, img, scoreChange, penMoney) VALUES (3, 'No Pets Allowed', './Image/rule//rule3.jpg', -15, 150.0000);
INSERT INTO rule (ruleID, ruleName, img, scoreChange, penMoney) VALUES (4, 'Visitor Restrictions', './Image/rule//rule4.jpg', -10, 80.0000);
INSERT INTO rule (ruleID, ruleName, img, scoreChange, penMoney) VALUES (9, 'testrule1', 'https://www.bing.com/images/search?view=detailV2&ccid=%2bE1Dd1C6&id=4D3202C9E0EFA49B6F1E9ABD3560E0AF08225481&thid=OIP.-E1Dd1C6XMZcnnLi1MGmbgHaCx&mediaurl=https%3a%2f%2fcdn.pixabay.com%2fphoto%2f2016%2f10%2f19%2f09%2f41%2frules-1752536_960_720.png&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.f84d437750ba5cc65c9e72e2d4c1a66e%3frik%3dgVQiCK%252fgYDW9mg%26pid%3dImgRaw%26r%3d0&exph=359&expw=960&q=rule&simid=608002649291948912&FORM=IRPRST&ck=07F380DBBCFFA7B782F589E51FD6EBA6&selectedIndex=0&itb=0', 1331, 1443.0000);
INSERT INTO rule (ruleID, ruleName, img, scoreChange, penMoney) VALUES (10, 'cam hut thuoc', 'https://www.google.com.vn/url?sa=i&url=http%3A%2F%2Fcdccamau.vn%2Fphong-chong-benh-khong-lay-nhiem%2Fhut-thuoc-la-la-dang-tu-huy-hoai-minh-va-dau-doc-nhung-xung-quanh-72526&psig=AOvVaw03NvtCAE49fTosmdXwEHEW&ust=1731833152758000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCJCN_7G74IkDFQAAAAAdAAAAABAE', 4, 4.0000);

INSERT INTO security (seID, userID, xShift, seStatus, Department) VALUES (1, 19, 2, 1, 'A');
INSERT INTO security (seID, userID, xShift, seStatus, Department) VALUES (2, 18, 1, 1, 'A');
INSERT INTO security (seID, userID, xShift, seStatus, Department) VALUES (3, 17, 2, 1, 'B');
INSERT INTO security (seID, userID, xShift, seStatus, Department) VALUES (4, 16, 2, 1, 'B');

INSERT INTO Slider (SliderId, SliderName, SliderImg, SliderDate, SliderStatus) VALUES (1, 'Slider 1', '', '2024-08-24', 1);
INSERT INTO Slider (SliderId, SliderName, SliderImg, SliderDate, SliderStatus) VALUES (2, 'Slider 2', '', '2024-08-24', 1);
INSERT INTO Slider (SliderId, SliderName, SliderImg, SliderDate, SliderStatus) VALUES (4, 'Slider 4', '', '2024-08-24', 1);

INSERT INTO `usage` (usageID, roomID, electricNum, waterBlock, createAt, payAt) VALUES (1, 1, 210, 16.5, '2024-08-15 00:00:00', '2024-08-15 00:00:00');
INSERT INTO `usage` (usageID, roomID, electricNum, waterBlock, createAt, payAt) VALUES (2, 2, 212, 12.2, '2024-08-15 00:00:00', '2024-08-15 00:00:00');
INSERT INTO `usage` (usageID, roomID, electricNum, waterBlock, createAt, payAt) VALUES (3, 3, 228, 18.21, '2024-08-15 00:00:00', '2024-08-15 00:00:00');
INSERT INTO `usage` (usageID, roomID, electricNum, waterBlock, createAt, payAt) VALUES (4, 4, 210, 16.5, '2024-08-15 00:00:00', '2024-08-15 00:00:00');
INSERT INTO `usage` (usageID, roomID, electricNum, waterBlock, createAt, payAt) VALUES (5, 5, 210, 16.5, '2024-08-15 00:00:00', '2024-08-15 00:00:00');
INSERT INTO `usage` (usageID, roomID, electricNum, waterBlock, createAt, payAt) VALUES (6, 6, 210, 16.5, '2024-08-15 00:00:00', '2024-08-15 00:00:00');
INSERT INTO `usage` (usageID, roomID, electricNum, waterBlock, createAt, payAt) VALUES (7, 7, 210, 16.5, '2024-08-15 00:00:00', '2024-08-15 00:00:00');

INSERT INTO usagePrice (UsageID, Electric_Price, Water_Block_Price) VALUES (1, 2.5, 10);

INSERT INTO payments (id, userId, money, status, createdAt, updatedAt) VALUES 
(27, 4, 1000, 1, '2024-08-23 00:00:00', '2024-08-23 00:00:00'),
(28, 4, 10000, 1, '2024-08-23 00:00:00', '2024-08-23 00:00:00'),
(29, 4, 100000, 0, '2024-08-23 00:00:00', '2024-08-23 00:00:00'),
(30, 48, 100, 0, '2024-08-23 00:00:00', '2024-08-23 00:00:00'),
(31, 48, 1000, 0, '2024-08-23 00:00:00', '2024-08-23 00:00:00'),
(47, 1, 100, 1, '2024-08-25 00:00:00', '2024-08-25 00:00:00'),
(48, 1052, 1550, 1, '2024-08-25 00:00:00', '2024-08-25 00:00:00'),
(1048, 1, 1000, 1, '2024-08-25 00:00:00', '2024-08-25 00:00:00');
INSERT INTO news (newTitle, description, img, creatAt) VALUES
('20% Discount for Long-Term Rental Contracts', 
 'Tenants signing contracts of 12 months or more will receive a 20% discount on the first month.', 
 'https://example.com/images/discount-longterm.jpg', 
 '2025-06-01 08:00:00'),

('5 Tips to Choose a Safe and Comfortable Room', 
 'From checking facilities to evaluating location and neighborhood security.', 
 'https://example.com/images/safe-renting-tips.jpg', 
 '2025-06-02 10:30:00'),

('Rental Law Updates in 2025', 
 'New regulations for rental contracts will take effect starting July.', 
 'https://example.com/images/law-update.jpg', 
 '2025-06-03 09:15:00'),

('Top 10 Budget-Friendly Student Rental Areas in Ho Chi Minh City', 
 'A list of student-friendly rental zones rated highly for price and amenities.', 
 'https://example.com/images/student-areas.jpg', 
 '2025-06-04 14:20:00'),

('Earn Reward Points When Booking Through the App', 
 'Our loyalty program offers attractive gifts and discounts for frequent renters.', 
 'https://example.com/images/reward-points.jpg', 
 '2025-06-05 11:45:00'),

('Beware of Rental Scams – What to Watch Out For', 
 'Helpful tips to avoid fake listings and rental frauds.', 
 'https://example.com/images/rental-scams.jpg', 
 '2025-06-06 16:10:00'),

('Introducing Smart Locks in Selected Properties', 
 'Enhance your safety with app-controlled smart locks in premium rooms.', 
 'https://example.com/images/smart-locks.jpg', 
 '2025-06-07 13:55:00'),

('Get Notified When a New Room Matches Your Preferences', 
 'Turn on alerts and never miss a good rental opportunity again.', 
 'https://example.com/images/room-alerts.jpg', 
 '2025-06-08 12:25:00'),

('How to Handle Disputes With Landlords Legally', 
 'Know your rights and how to resolve conflicts professionally.', 
 'https://example.com/images/dispute-resolution.jpg', 
 '2025-06-09 15:40:00'),

('Top Trending Amenities in Rental Rooms 2025', 
 'Wi-Fi, air conditioning, and more – what renters value the most this year.', 
 'https://example.com/images/rental-amenities.jpg', 
 '2025-06-10 09:00:00');
 INSERT INTO item (itemID, itemName, itemImg) VALUES (1, 'Chair', './Image/item/chair.jpg');
INSERT INTO item (itemID, itemName, itemImg) VALUES (2, 'Table', './Image/item/table.jpg');
INSERT INTO item (itemID, itemName, itemImg) VALUES (3, 'Single Bed', './Image/item/single_bed.jpg');
INSERT INTO item (itemID, itemName, itemImg) VALUES (4, 'Fan', './Image/item/fan.jpg');
INSERT INTO item (itemID, itemName, itemImg) VALUES (5, 'Desk Lamp', './Image/item/desk_lamp.jpg');
INSERT INTO item (itemID, itemName, itemImg) VALUES (6, 'Bookshelf', './Image/item/bookshelf.jpg');
INSERT INTO item (itemID, itemName, itemImg) VALUES (7, 'Wardrobe', './Image/item/wardrobe.jpg');
INSERT INTO item (itemID, itemName, itemImg) VALUES (8, 'Curtains', './Image/item/curtains.jpg');
INSERT INTO item (itemID, itemName, itemImg) VALUES (9, 'TV', './Image/item/tv.jpg');
INSERT INTO item (itemID, itemName, itemImg) VALUES (10, 'Sofa', './Image/item/sofa.jpg');
INSERT INTO guideline (guideID, guideName, img) VALUES (1, 'Fire Safety Guidelines', './Image/guideline/guideline1.jpg');
INSERT INTO guideline (guideID, guideName, img) VALUES (2, 'Room Cleaning Guidelines', './Image/guideline/guideline2.jpg');
INSERT INTO guideline (guideID, guideName, img) VALUES (3, 'Noise Reduction Guidelines', './Image/guideline/guideline3.jpg');
INSERT INTO guideline (guideID, guideName, img) VALUES (10, 'Rental Payment Guidelines', 'https://shop.aedigi.com/wp-content/uploads/Screenshot_1-1.jpg');
INSERT INTO guideline (guideID, guideName, img) VALUES (11, 'Tenant Rights and Responsibilities', 'https://www.goodlord.co/hubfs/Infosheets/Tenants%20rights%20and%20responsibilities%20fact%20sheet_Cover_FINAL.png');
INSERT INTO guideline (guideID, guideName, img) VALUES (14, 'xin chao viet nam', 'https://th.bing.com/th/id/R.517739c9d899d1c1a9fc7b9d3da5c192?rik=ifC%2fbxQOFaLhQA&pid=ImgRaw&r=0');

INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (15, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (17, 1, 0.0000, 0.0000, 0.0000, 1165.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-25 09:17:33.480');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (19, 5, 0.0000, 0.0000, 0.0000, 3500000.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (23, 3, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (24, 4, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-26 17:11:27.940');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (26, 6, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (27, 7, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (28, 8, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (29, 9, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (31, 11, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (32, 12, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (33, 13, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-25 03:28:47.367');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (34, 14, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (35, 15, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (36, 16, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (37, 17, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (39, 19, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (40, 20, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (41, 21, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (42, 22, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (43, 23, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (44, 24, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (45, 25, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (46, 26, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (47, 27, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (48, 28, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (49, 29, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (50, 30, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (51, 31, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (52, 32, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (53, 33, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-20 00:00:00', '2024-08-20 00:00:00', '2024-08-20 00:00:00');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (55, 10, 100.0000, 350.0000, 1000.0000, 2500.0000, 100.0000, 100.0000, '2024-08-25 03:00:28', '2024-09-25 03:00:28', NULL);
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (56, 13, 0.0000, 0.0000, 0.0000, 1800.0000, 0.0000, 0.0000, '2024-08-25 03:26:18', '2024-09-25 03:26:18', '2024-08-25 03:28:47.367');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1055, 1, 0.0000, 0.0000, 0.0000, 1165.0000, 0.0000, 0.0000, '2024-08-25 09:15:16', '2024-09-25 09:15:16', '2024-08-25 09:17:33.480');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1058, 4, 0.0000, 0.0000, 0.0000, 1700.0000, 0.0000, 0.0000, '2024-08-25 10:31:20', '2024-09-25 10:31:20', '2024-08-26 17:11:27.940');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1059, 4, 0.0000, 0.0000, 0.0000, 1700.0000, 0.0000, 0.0000, '2024-08-25 11:24:45', '2024-09-25 11:24:45', '2024-08-26 17:11:27.940');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1060, 4, 0.0000, 0.0000, 0.0000, 1700.0000, 0.0000, 0.0000, '2024-08-26 17:07:58', '2024-09-26 17:07:58', '2024-08-26 17:11:27.940');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1061, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-26 20:10:36', '2024-09-26 20:10:36', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1062, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-27 13:52:11', '2024-09-27 13:52:11', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1063, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-27 23:27:14', '2024-09-27 23:27:14', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1065, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 03:11:47', '2024-09-28 03:11:47', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1066, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 03:31:39', '2024-09-28 03:31:39', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1067, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 03:40:40', '2024-09-28 03:40:40', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1068, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 03:44:21', '2024-09-28 03:44:21', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1069, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 03:46:04', '2024-09-28 03:46:04', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1070, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 03:47:46', '2024-09-28 03:47:46', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1071, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 03:54:15', '2024-09-28 03:54:15', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1072, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 03:57:18', '2024-09-28 03:57:18', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1073, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 04:03:53', '2024-09-28 04:03:53', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1074, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 04:17:29', '2024-09-28 04:17:29', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1075, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 04:59:20', '2024-09-28 04:59:20', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1076, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 05:07:26', '2024-09-28 05:07:26', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1077, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 05:09:37', '2024-09-28 05:09:37', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1078, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 05:10:22', '2024-09-28 05:10:22', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1079, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 05:10:53', '2024-09-28 05:10:53', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1080, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 05:25:13', '2024-09-28 05:25:13', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1081, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 05:56:20', '2024-09-28 05:56:20', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1082, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 06:31:44', '2024-09-28 06:31:44', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1083, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 06:44:23', '2024-09-28 06:44:23', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1084, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 16:43:22', '2024-09-28 16:43:22', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1085, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 20:37:48', '2024-09-28 20:37:48', '2024-11-16 15:40:43.673');
INSERT INTO bill (billID, roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) VALUES (1086, 2, 0.0000, 0.0000, 0.0000, 1300.0000, 0.0000, 0.0000, '2024-08-28 20:41:37', '2024-09-28 20:41:37', '2024-11-16 15:40:43.673');