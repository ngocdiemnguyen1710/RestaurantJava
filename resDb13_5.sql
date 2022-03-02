-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: resdb
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `billId` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `empId` int NOT NULL,
  `serviceId` int NOT NULL,
  `eventId` int NOT NULL,
  `hallId` int NOT NULL,
  `datePay` date DEFAULT NULL,
  `bookDetailId` int DEFAULT NULL,
  PRIMARY KEY (`billId`),
  KEY `customerId_bill_idx` (`customerId`),
  KEY `empId_bill_idx` (`empId`),
  KEY `serviceId_bill_idx` (`serviceId`),
  KEY `eventId_bill_idx` (`eventId`),
  KEY `hallId_bill_idx` (`hallId`),
  KEY `bookDetailId_idx` (`bookDetailId`),
  CONSTRAINT `bookDetailId` FOREIGN KEY (`bookDetailId`) REFERENCES `book_detail` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customerId_bill` FOREIGN KEY (`customerId`) REFERENCES `customers` (`customerId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `empId_bill` FOREIGN KEY (`empId`) REFERENCES `employees` (`empId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `eventId_bill` FOREIGN KEY (`eventId`) REFERENCES `events` (`eventId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hallId_bill` FOREIGN KEY (`hallId`) REFERENCES `halls` (`hallId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `serviceId_bill` FOREIGN KEY (`serviceId`) REFERENCES `services` (`serviceId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,1,1,1,1,1,'2021-05-05',NULL),(2,2,2,2,2,2,'2021-05-06',NULL),(30,1,1,18,3,4,'2021-05-13',8),(31,1,1,18,3,4,'2021-05-13',8),(32,1,1,18,3,4,'2021-05-13',8),(33,1,1,18,3,4,'2021-05-13',8),(34,1,1,18,3,4,'2021-05-13',8),(35,1,1,18,3,4,'2021-05-13',8);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_detail`
--

DROP TABLE IF EXISTS `book_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `serviceId` int NOT NULL,
  `eventId` int NOT NULL,
  `hallId` int NOT NULL,
  `dateUse` date DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `numberGuest` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerId_customers_idx` (`customerId`),
  KEY `serviceId_services_idx` (`serviceId`),
  KEY `eventId_events_idx` (`eventId`),
  KEY `hallId_halls_idx` (`hallId`),
  CONSTRAINT `customerId_customers_book` FOREIGN KEY (`customerId`) REFERENCES `customers` (`customerId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `eventId_events_book` FOREIGN KEY (`eventId`) REFERENCES `events` (`eventId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hallId_halls` FOREIGN KEY (`hallId`) REFERENCES `halls` (`hallId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `serviceId_services_book` FOREIGN KEY (`serviceId`) REFERENCES `services` (`serviceId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_detail`
--

LOCK TABLES `book_detail` WRITE;
/*!40000 ALTER TABLE `book_detail` DISABLE KEYS */;
INSERT INTO `book_detail` VALUES (1,1,1,1,1,'2021-04-30','Test lan 1',110),(2,2,2,2,2,'2021-05-01','Test lan 2',120),(6,3,18,3,3,'2021-04-30','Test thanh toan',12),(7,2,1,2,3,'2021-04-30','test thanh toan 2',12),(8,1,18,3,4,'2021-04-30','Test thanh toan 3',12);
/*!40000 ALTER TABLE `book_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`customerId`),
  KEY `fk_customers_user1_idx` (`user_id`),
  CONSTRAINT `fk_customers_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'James','01234567','USA',7),(2,'Harry','12304567','USA',6),(3,'Teo','1456230','VN',7),(4,'Test','012345678','Tay Ninh',7);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `empId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mail` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`empId`),
  KEY `fk_employees_user1_idx` (`user_id`),
  CONSTRAINT `fk_employees_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Ngoc Hue','ngochue@gmail.com','ghjkl','1999-09-27',6),(2,'Ngoc Diem','fghjk','jkl','1999-01-01',6),(5,'Helen','helen@gmail.com','USA','1999-01-02',6),(6,'Money','helen@gmail.com','USA','1999-01-02',7),(10,'Hue','heledn@gmail.com','USA','2020-07-04',7),(11,'Pham Tien','helen@gmail.com','USA','2020-07-04',6),(12,'gh','cvbn','vbn','1999-01-02',7),(15,'dsqq','heledn@gmail.com','USA','1999-01-02',6),(19,'Tien Phat','heledn@gmail.com','USA','2020-07-07',6);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `eventId` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Su Kien 1',1000),(2,'Su Kien 2',2000),(3,'Su kien 3',300);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedbackId` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`feedbackId`),
  KEY `customerId_idx` (`customerId`),
  CONSTRAINT `customerId_feed` FOREIGN KEY (`customerId`) REFERENCES `customers` (`customerId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `halls` (
  `hallId` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `seat` int DEFAULT NULL,
  PRIMARY KEY (`hallId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls`
--

LOCK TABLES `halls` WRITE;
/*!40000 ALTER TABLE `halls` DISABLE KEYS */;
INSERT INTO `halls` VALUES (1,'Sanh 1',110),(2,'Sanh 2',120),(3,'Sanh 3',130),(4,'Sanh 4',140);
/*!40000 ALTER TABLE `halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `serviceId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `unit_price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`serviceId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Dịch vụ 1',2000),(2,'Dịch vụ 2',3000),(18,'Dich Vu 3',3000),(19,'Dich vu 4',4000);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role_user` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'nd','$2a$10$VJyJeUDbKWtd1QtQQdzTP.tSuTzvTR.pZjNWMM5mOyvcd.mOG7r1G','ROLE_USER'),(7,'diem','$2a$10$gHCa.qBeO7Wj33MyBW1bTejiBaw93J1m8PLog4effi9.U2Mv68FQ.','ROLE_ADMIN'),(8,'hue','$2a$10$isv4B5HVi5yzVv8YrDb/Nu7daXlX6nF9XA59cNk7lpwlacwiko/2.','ROLE_ADMIN');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-13 15:33:14
