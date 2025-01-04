-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cant_stop_game
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.6-MariaDB-0+deb12u1-log

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
-- Table structure for table `columns`
--

DROP TABLE IF EXISTS `columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `column_number` int(11) NOT NULL,
  `max_height` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `column_number` (`column_number`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns`
--

LOCK TABLES `columns` WRITE;
/*!40000 ALTER TABLE `columns` DISABLE KEYS */;
INSERT INTO `columns` VALUES (1,2,3),(2,3,5),(3,4,7),(4,5,9),(5,6,11),(6,7,13),(7,8,11),(8,9,9),(9,10,7),(10,11,5),(11,12,3);
/*!40000 ALTER TABLE `columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dice_rolls`
--

DROP TABLE IF EXISTS `dice_rolls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dice_rolls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `pair_1a` int(11) NOT NULL,
  `pair_1b` int(11) NOT NULL,
  `pair_2a` int(11) NOT NULL,
  `pair_2b` int(11) NOT NULL,
  `pair_3a` int(11) NOT NULL,
  `pair_3b` int(11) NOT NULL,
  `roll_time` timestamp NULL DEFAULT current_timestamp(),
  `has_rolled` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `dice_rolls_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dice_rolls_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dice_rolls`
--

LOCK TABLES `dice_rolls` WRITE;
/*!40000 ALTER TABLE `dice_rolls` DISABLE KEYS */;
INSERT INTO `dice_rolls` VALUES (13,9,5,12,2,7,7,7,7,'2024-12-15 18:00:12',0),(14,9,5,5,12,7,10,7,10,'2024-12-15 18:02:23',0),(15,9,5,8,7,10,5,7,8,'2024-12-15 18:02:24',0),(16,9,5,11,7,12,6,7,11,'2024-12-15 18:02:25',0),(17,9,5,4,5,5,4,2,7,'2024-12-15 18:02:26',0),(18,9,5,5,10,8,7,8,7,'2024-12-15 18:02:27',0),(19,9,5,10,7,11,6,6,11,'2024-12-15 18:08:02',0),(20,9,5,6,7,10,3,7,6,'2024-12-15 18:08:03',0),(21,9,5,6,6,5,7,7,5,'2024-12-15 18:08:04',0),(22,9,5,7,10,11,6,9,8,'2024-12-15 18:08:05',0),(23,9,5,8,11,9,10,10,9,'2024-12-15 18:08:21',0),(24,9,5,8,9,8,9,11,6,'2024-12-15 18:08:21',0),(25,9,5,3,6,5,4,3,6,'2024-12-15 18:08:22',0),(26,9,5,6,8,6,8,4,10,'2024-12-15 18:08:23',0),(27,9,5,5,9,9,5,8,6,'2024-12-15 18:10:46',0),(28,9,5,7,5,7,5,10,2,'2024-12-15 18:10:47',0),(29,9,5,9,12,10,11,10,11,'2024-12-15 18:10:48',0),(30,9,5,8,7,7,8,4,11,'2024-12-15 18:14:13',0),(31,9,5,8,5,5,8,4,9,'2024-12-15 18:20:29',0),(32,9,5,12,3,7,8,8,7,'2024-12-15 18:20:30',0),(33,9,5,11,4,9,6,7,8,'2024-12-15 18:20:30',0),(34,9,5,9,7,7,9,8,8,'2024-12-15 18:20:31',0),(35,9,5,10,10,10,10,8,12,'2024-12-15 18:20:38',0),(36,9,5,4,6,6,4,2,8,'2024-12-15 18:20:39',0),(37,9,5,8,6,7,7,7,7,'2024-12-15 18:20:40',0),(38,9,5,7,10,10,7,10,7,'2024-12-15 18:20:40',0),(39,9,5,3,9,5,7,8,4,'2024-12-15 18:22:06',0),(40,9,5,7,7,9,5,8,6,'2024-12-15 18:22:07',0),(41,9,5,2,3,3,2,2,3,'2024-12-15 18:22:08',0),(42,9,5,7,8,6,9,6,9,'2024-12-15 18:22:09',0),(43,9,5,5,6,7,4,3,8,'2024-12-15 18:22:09',0),(44,9,5,5,10,10,5,8,7,'2024-12-15 18:22:11',0),(45,9,5,8,12,10,10,10,10,'2024-12-15 18:22:30',0),(46,9,5,6,7,5,8,6,7,'2024-12-15 18:22:31',0),(47,9,5,3,7,3,7,8,2,'2024-12-16 00:07:06',0),(48,9,5,10,8,9,9,11,7,'2024-12-16 00:08:53',0),(49,9,5,4,9,7,6,4,9,'2024-12-16 00:08:58',0),(50,9,5,9,3,6,6,5,7,'2024-12-16 00:21:25',0),(51,10,5,9,5,5,9,8,6,'2024-12-22 12:57:02',0),(52,10,5,7,8,10,5,8,7,'2024-12-22 14:33:35',0),(53,10,5,6,5,3,8,6,5,'2024-12-22 14:34:28',0),(54,10,5,5,8,6,7,8,5,'2024-12-22 14:34:29',0),(55,10,5,6,6,6,6,4,8,'2024-12-22 14:34:30',0),(56,10,5,9,11,11,9,12,8,'2024-12-22 14:34:31',0),(57,11,5,8,11,9,10,10,9,'2024-12-22 19:46:56',0),(58,11,5,7,5,2,10,5,7,'2024-12-22 19:50:01',0),(59,11,5,7,7,9,5,8,6,'2024-12-22 19:50:02',0),(62,14,9,11,4,9,6,7,8,'2024-12-24 23:44:51',0),(63,14,9,6,4,8,2,6,4,'2024-12-24 23:49:13',0),(64,14,9,8,4,6,6,8,4,'2024-12-24 23:49:14',0),(65,14,9,8,5,4,9,5,8,'2024-12-25 00:18:30',1),(66,14,9,7,7,7,7,8,6,'2024-12-25 00:20:50',1),(67,14,9,5,7,3,9,8,4,'2024-12-25 00:20:53',1),(68,16,9,10,6,8,8,8,8,'2024-12-25 00:50:50',0),(69,16,9,4,9,9,4,6,7,'2024-12-25 01:03:14',0),(70,16,9,7,6,8,5,10,3,'2024-12-25 01:07:03',0),(71,17,9,7,6,8,5,6,7,'2024-12-25 13:58:30',0),(72,17,9,4,7,5,6,8,3,'2024-12-25 14:01:16',0),(73,17,9,8,8,9,7,7,9,'2024-12-25 14:06:14',0),(74,17,9,8,9,6,11,9,8,'2024-12-25 14:20:58',0),(75,17,9,8,6,3,11,7,7,'2024-12-25 14:25:55',0),(76,17,9,8,5,3,10,6,7,'2024-12-25 14:47:12',0),(77,17,9,6,8,7,7,7,7,'2024-12-25 14:47:36',0),(78,17,9,5,6,6,5,8,3,'2024-12-25 14:47:50',0),(79,17,9,8,3,4,7,3,8,'2024-12-25 14:48:01',0),(80,17,9,5,4,4,5,4,5,'2024-12-25 14:48:10',0),(81,17,9,7,4,6,5,8,3,'2024-12-25 14:48:41',0),(82,17,9,9,6,11,4,7,8,'2024-12-25 14:51:12',0),(83,17,9,9,5,8,6,7,7,'2024-12-25 14:51:35',0),(84,17,9,9,5,8,6,9,5,'2024-12-25 14:51:43',0),(85,17,9,11,6,6,11,10,7,'2024-12-25 14:52:05',0),(86,17,9,9,10,12,7,10,9,'2024-12-25 14:53:13',1),(87,18,9,8,7,7,8,10,5,'2024-12-25 15:23:28',0),(88,18,9,8,3,5,6,6,5,'2024-12-25 15:32:22',0),(89,18,9,6,3,3,6,2,7,'2024-12-25 15:32:44',0),(90,18,9,3,6,4,5,4,5,'2024-12-25 16:03:33',0),(91,18,9,7,6,5,8,3,10,'2024-12-25 16:04:30',0),(92,18,9,7,12,11,8,11,8,'2024-12-25 16:04:36',1),(93,19,9,10,7,12,5,7,10,'2024-12-25 16:52:23',0),(94,19,9,7,9,8,8,9,7,'2024-12-25 17:04:43',0),(95,19,9,5,6,9,2,5,6,'2024-12-25 17:07:26',0),(96,19,9,7,8,5,10,9,6,'2024-12-25 17:10:50',0),(97,19,9,5,6,4,7,8,3,'2024-12-25 17:11:04',0),(98,19,9,5,6,3,8,5,6,'2024-12-25 17:11:16',0),(99,19,9,7,4,4,7,2,9,'2024-12-25 17:12:19',1),(100,20,9,11,3,7,7,8,6,'2024-12-25 17:50:59',0),(101,20,9,3,12,7,8,7,8,'2024-12-25 17:53:51',0),(102,20,9,7,8,10,5,8,7,'2024-12-25 17:54:07',0),(103,20,10,5,3,5,3,4,4,'2024-12-25 18:54:44',0),(104,20,10,10,8,7,11,9,9,'2024-12-25 18:55:29',0),(105,20,10,7,5,6,6,7,5,'2024-12-25 18:55:59',0),(106,20,10,7,3,6,4,5,5,'2024-12-25 19:03:43',0),(107,20,9,6,3,7,2,6,3,'2024-12-25 19:08:04',0),(108,20,9,6,10,7,9,5,11,'2024-12-25 19:08:31',0),(109,20,9,9,6,7,8,5,10,'2024-12-25 19:09:23',0),(110,20,10,5,7,5,7,10,2,'2024-12-25 19:10:12',0),(111,20,10,7,4,7,4,7,4,'2024-12-25 19:10:27',0),(112,20,10,4,3,4,3,3,4,'2024-12-25 19:10:45',0),(113,20,9,10,5,9,6,8,7,'2024-12-25 19:12:43',0),(114,20,9,3,6,7,2,3,6,'2024-12-25 19:13:00',0),(115,20,9,4,6,8,2,4,6,'2024-12-25 20:39:48',0),(116,20,10,5,8,7,6,3,10,'2024-12-25 20:45:16',0),(117,20,10,8,6,5,9,7,7,'2024-12-25 20:46:07',1),(118,20,9,6,10,8,8,6,10,'2024-12-25 22:02:24',0),(119,20,9,5,7,2,10,7,5,'2024-12-25 22:09:26',1),(120,21,9,9,4,6,7,4,9,'2024-12-25 22:10:37',0),(121,21,9,6,7,2,11,7,6,'2024-12-25 22:13:15',0),(122,21,10,4,11,8,7,7,8,'2024-12-25 22:14:34',0),(123,21,10,5,9,6,8,5,9,'2024-12-25 22:14:52',0),(124,21,9,7,8,7,8,5,10,'2024-12-25 22:17:03',0),(125,21,9,9,7,8,8,11,5,'2024-12-25 22:17:38',0),(126,21,9,9,2,5,6,5,6,'2024-12-25 22:18:12',0),(127,21,9,6,6,3,9,7,5,'2024-12-25 22:18:23',0),(128,21,10,5,4,5,4,7,2,'2024-12-25 22:19:24',0),(129,21,10,8,8,9,7,7,9,'2024-12-25 22:21:22',0),(130,21,10,9,5,9,5,8,6,'2024-12-25 22:21:54',0),(131,21,9,4,7,5,6,6,5,'2024-12-25 22:23:17',0),(132,21,9,10,7,12,5,7,10,'2024-12-25 22:25:37',0),(133,21,9,6,10,6,10,8,8,'2024-12-25 22:26:18',0),(134,21,9,11,6,7,10,11,6,'2024-12-25 22:26:43',0),(135,21,10,3,10,6,7,6,7,'2024-12-25 22:28:35',0),(136,21,10,5,5,6,4,7,3,'2024-12-25 22:30:17',0),(137,21,10,6,7,6,7,9,4,'2024-12-25 22:30:40',0),(138,21,10,12,7,7,12,12,7,'2024-12-25 22:30:54',0),(139,21,10,11,3,6,8,7,7,'2024-12-25 22:32:06',0),(140,21,9,5,10,7,8,9,6,'2024-12-25 23:11:24',0),(141,21,9,7,11,10,8,11,7,'2024-12-25 23:12:16',0),(142,21,9,9,4,8,5,8,5,'2024-12-25 23:12:26',0),(143,21,9,6,11,6,11,7,10,'2024-12-25 23:12:35',0),(144,21,9,3,6,6,3,4,5,'2024-12-25 23:13:53',0),(145,21,10,6,6,4,8,6,6,'2024-12-25 23:15:01',0),(146,21,10,8,4,6,6,4,8,'2024-12-25 23:17:06',0),(147,21,10,11,3,7,7,6,8,'2024-12-25 23:17:14',0),(148,21,10,6,9,6,9,5,10,'2024-12-25 23:17:26',0),(149,21,10,6,10,9,7,7,9,'2024-12-25 23:17:40',0),(150,21,9,7,4,3,8,5,6,'2024-12-25 23:40:15',0),(151,21,9,3,6,6,3,4,5,'2024-12-25 23:42:30',0),(152,21,9,7,2,3,6,3,6,'2024-12-25 23:44:42',0),(153,21,10,10,7,11,6,8,9,'2024-12-25 23:48:59',0),(154,21,10,7,10,11,6,9,8,'2024-12-25 23:51:32',0),(155,21,10,7,5,3,9,6,6,'2024-12-25 23:52:05',0),(156,21,10,8,9,10,7,9,8,'2024-12-25 23:53:26',0),(157,21,10,9,11,9,11,8,12,'2024-12-25 23:53:42',0),(158,21,9,6,7,9,4,4,9,'2024-12-25 23:54:57',0),(159,21,9,8,10,11,7,9,9,'2024-12-25 23:55:11',0),(160,21,10,7,11,8,10,9,9,'2024-12-25 23:56:26',0),(161,21,10,11,6,11,6,7,10,'2024-12-26 03:28:13',0),(162,21,10,4,8,5,7,7,5,'2024-12-26 03:30:48',0),(163,21,10,3,9,7,5,4,8,'2024-12-26 03:50:13',0),(164,21,10,10,2,7,5,7,5,'2024-12-26 03:50:39',0),(165,21,10,7,9,6,10,5,11,'2024-12-26 03:51:36',0),(166,21,10,2,6,2,6,6,2,'2024-12-26 03:53:00',0),(167,21,9,7,6,6,7,8,5,'2024-12-26 03:54:06',0),(168,21,9,8,12,11,9,11,9,'2024-12-26 03:55:10',0),(169,21,9,12,5,7,10,10,7,'2024-12-26 13:39:17',0),(170,21,10,6,9,10,5,9,6,'2024-12-26 13:39:51',0),(171,21,10,7,6,8,5,6,7,'2024-12-26 13:44:22',0),(172,21,10,6,10,9,7,7,9,'2024-12-26 14:14:23',0),(173,21,10,7,8,7,8,7,8,'2024-12-26 14:14:33',0),(174,21,10,7,6,2,11,6,7,'2024-12-26 14:14:44',0),(175,21,9,8,6,6,8,8,6,'2024-12-26 14:15:41',0),(176,21,9,6,7,10,3,7,6,'2024-12-26 14:15:53',0),(177,21,9,9,5,8,6,5,9,'2024-12-26 14:28:31',0),(178,21,9,10,8,7,11,9,9,'2024-12-26 14:32:18',0),(179,21,9,8,6,9,5,7,7,'2024-12-26 14:32:34',0),(180,21,9,10,5,8,7,5,10,'2024-12-26 14:34:18',0),(181,21,10,6,11,8,9,7,10,'2024-12-26 14:36:23',0),(182,21,10,11,2,7,6,7,6,'2024-12-26 14:43:12',0),(183,22,9,10,7,7,10,12,5,'2024-12-26 15:47:43',0),(184,22,9,6,6,7,5,3,9,'2024-12-26 15:48:15',0),(185,22,9,5,4,7,2,5,4,'2024-12-26 15:50:11',1),(186,24,9,8,5,6,7,9,4,'2024-12-26 15:56:22',0),(187,24,9,9,7,4,12,9,7,'2024-12-26 15:56:40',0),(188,24,9,10,8,10,8,8,10,'2024-12-26 15:56:50',0),(189,24,10,6,6,7,5,9,3,'2024-12-26 15:59:16',0),(190,24,10,11,3,8,6,7,7,'2024-12-26 16:03:55',0),(191,24,10,12,10,11,11,11,11,'2024-12-26 16:04:15',0),(192,24,9,6,5,9,2,6,5,'2024-12-26 16:05:49',0),(193,24,9,8,6,10,4,6,8,'2024-12-26 16:06:13',0),(194,24,9,8,8,6,10,8,8,'2024-12-26 16:06:31',0),(195,24,9,8,6,5,9,5,9,'2024-12-26 16:07:13',0),(196,24,9,8,6,9,5,9,5,'2024-12-26 16:07:30',0),(197,24,9,11,3,7,7,8,6,'2024-12-26 16:07:39',0),(198,24,10,12,9,11,10,10,11,'2024-12-26 16:09:50',0),(199,24,10,5,4,4,5,6,3,'2024-12-26 16:10:07',0),(200,24,10,5,6,3,8,5,6,'2024-12-26 16:10:22',0),(201,24,9,4,11,8,7,7,8,'2024-12-26 16:11:35',0),(202,24,9,9,8,8,9,10,7,'2024-12-26 16:12:01',0),(203,24,9,4,4,2,6,4,4,'2024-12-26 16:12:10',0),(204,24,10,10,3,7,6,8,5,'2024-12-26 16:12:36',0),(205,24,10,4,6,8,2,4,6,'2024-12-26 16:12:59',0),(206,24,10,9,5,9,5,8,6,'2024-12-26 16:13:10',0),(207,24,9,8,12,8,12,8,12,'2024-12-26 16:13:49',0),(208,24,9,4,6,4,6,4,6,'2024-12-26 16:14:02',0),(209,24,9,6,7,6,7,7,6,'2024-12-26 16:14:11',0),(210,24,10,10,4,8,6,6,8,'2024-12-26 16:14:30',0),(211,24,10,7,6,9,4,7,6,'2024-12-26 16:14:39',0),(212,24,10,7,6,2,11,6,7,'2024-12-26 16:14:47',0),(213,24,10,7,12,8,11,8,11,'2024-12-26 16:15:02',0),(214,24,10,9,4,6,7,6,7,'2024-12-26 16:15:20',0),(215,24,9,5,11,6,10,7,9,'2024-12-26 16:16:54',0),(216,24,9,8,2,5,5,5,5,'2024-12-26 16:17:03',0),(217,24,9,6,3,3,6,2,7,'2024-12-26 16:17:09',0),(218,24,10,7,2,7,2,7,2,'2024-12-26 16:18:06',0),(219,24,10,10,4,5,9,7,7,'2024-12-26 16:18:21',0),(220,24,10,9,5,7,7,6,8,'2024-12-26 16:18:29',0),(221,24,10,4,7,5,6,4,7,'2024-12-26 16:18:48',0),(222,24,10,6,6,6,6,6,6,'2024-12-26 16:18:57',0),(223,24,9,9,9,7,11,8,10,'2024-12-26 16:19:57',0),(224,24,9,2,5,3,4,4,3,'2024-12-26 16:20:04',0),(225,24,9,3,12,7,8,7,8,'2024-12-26 16:20:11',0),(226,24,10,5,5,3,7,6,4,'2024-12-26 16:20:21',0),(227,24,10,11,9,10,10,11,9,'2024-12-26 16:20:31',0),(228,24,10,5,7,7,5,2,10,'2024-12-26 16:20:40',0),(229,24,9,6,9,7,8,10,5,'2024-12-26 16:20:52',0),(230,24,9,7,6,5,8,3,10,'2024-12-26 16:21:09',0),(231,24,10,6,5,4,7,7,4,'2024-12-26 16:22:00',0),(232,24,10,8,2,5,5,5,5,'2024-12-26 16:22:12',0),(233,24,10,2,6,6,2,2,6,'2024-12-26 16:22:20',0),(234,24,9,4,3,5,2,4,3,'2024-12-26 16:24:05',0),(235,24,9,2,3,3,2,2,3,'2024-12-26 16:24:38',0),(236,24,10,7,7,11,3,6,8,'2024-12-26 16:26:12',0),(237,24,10,8,8,8,8,8,8,'2024-12-26 16:26:21',0),(238,24,10,11,9,9,11,10,10,'2024-12-26 16:26:29',0),(239,24,10,2,6,6,2,2,6,'2024-12-26 16:27:02',0),(240,24,9,9,4,7,6,5,8,'2024-12-26 16:27:19',0),(241,24,9,5,8,4,9,6,7,'2024-12-26 16:27:37',0),(242,24,9,7,5,2,10,5,7,'2024-12-26 16:27:51',0),(243,24,9,7,4,4,7,4,7,'2024-12-26 16:29:43',0),(244,24,9,9,4,7,6,9,4,'2024-12-26 16:29:52',0),(245,24,9,9,3,6,6,5,7,'2024-12-26 16:30:05',0),(246,24,10,9,8,7,10,9,8,'2024-12-26 16:30:26',0),(247,24,10,7,10,11,6,11,6,'2024-12-26 16:31:35',0),(248,24,10,7,10,9,8,9,8,'2024-12-26 16:31:51',0),(249,24,10,9,4,6,7,6,7,'2024-12-26 16:32:00',0),(250,24,10,4,9,6,7,7,6,'2024-12-26 16:32:14',0),(251,24,10,7,8,6,9,6,9,'2024-12-26 16:33:00',0),(252,24,10,9,7,7,9,12,4,'2024-12-26 16:33:15',0),(253,24,10,10,7,10,7,9,8,'2024-12-26 16:33:35',0),(254,24,10,9,8,8,9,12,5,'2024-12-26 16:33:51',0),(255,24,10,3,11,6,8,7,7,'2024-12-26 16:34:00',0),(256,24,10,3,4,5,2,3,4,'2024-12-26 16:34:27',0),(257,24,9,9,7,6,10,9,7,'2024-12-26 16:34:39',0),(258,24,9,8,5,6,7,3,10,'2024-12-26 16:34:48',0),(259,24,9,3,9,4,8,7,5,'2024-12-26 16:35:02',0),(260,24,9,5,6,7,4,3,8,'2024-12-26 16:35:12',0),(261,24,9,10,8,8,10,10,8,'2024-12-26 16:35:23',0),(262,24,10,8,7,8,7,3,12,'2024-12-26 16:35:45',0),(263,24,10,7,7,6,8,9,5,'2024-12-26 16:35:58',0),(264,24,9,7,6,11,2,7,6,'2024-12-26 16:37:50',0),(265,24,9,10,6,6,10,8,8,'2024-12-26 16:38:54',0),(266,24,9,5,9,6,8,5,9,'2024-12-26 16:39:12',0),(267,24,9,7,8,6,9,6,9,'2024-12-26 16:39:22',0),(268,24,9,6,3,5,4,6,3,'2024-12-26 16:39:34',0),(269,24,10,7,5,2,10,5,7,'2024-12-26 16:39:45',0),(270,24,10,10,6,8,8,10,6,'2024-12-26 16:40:18',0),(271,24,10,9,8,9,8,7,10,'2024-12-26 16:40:28',0),(272,24,9,9,7,10,6,5,11,'2024-12-26 16:41:42',0),(273,24,9,6,8,8,6,6,8,'2024-12-26 16:42:07',0),(274,24,9,10,6,9,7,5,11,'2024-12-26 16:42:15',0),(275,24,9,9,6,7,8,9,6,'2024-12-26 16:42:23',0),(276,24,9,9,10,10,9,8,11,'2024-12-26 16:42:32',0),(277,24,10,8,6,8,6,8,6,'2024-12-26 16:43:21',0),(278,24,10,9,10,9,10,11,8,'2024-12-26 16:43:29',0),(279,24,10,6,6,6,6,10,2,'2024-12-26 16:43:39',0),(280,25,11,4,7,5,6,6,5,'2024-12-26 21:11:14',0),(281,25,11,11,7,7,11,10,8,'2024-12-26 21:13:26',0),(282,25,11,6,5,6,5,9,2,'2024-12-26 21:13:37',0),(283,25,12,8,5,8,5,7,6,'2024-12-26 21:22:21',0),(284,25,12,7,7,10,4,7,7,'2024-12-26 21:22:32',0),(285,25,12,4,6,7,3,5,5,'2024-12-26 21:22:38',0),(286,25,12,8,9,10,7,7,10,'2024-12-26 21:22:51',0),(287,25,11,6,4,7,3,5,5,'2024-12-26 21:26:43',0),(288,25,11,6,3,4,5,5,4,'2024-12-26 21:26:55',0),(289,25,11,5,8,7,6,5,8,'2024-12-26 21:27:04',0),(290,25,11,5,7,8,4,5,7,'2024-12-26 21:27:15',0),(291,25,11,7,7,10,4,7,7,'2024-12-26 21:27:24',0),(292,25,12,7,11,7,11,8,10,'2024-12-26 21:30:30',0),(293,25,12,10,6,7,9,11,5,'2024-12-26 21:30:39',0),(294,25,12,5,3,4,4,5,3,'2024-12-26 21:30:49',0),(295,25,11,6,9,8,7,7,8,'2024-12-26 21:31:23',0),(296,25,11,12,7,7,12,12,7,'2024-12-26 21:31:34',0),(297,25,11,4,3,4,3,3,4,'2024-12-26 21:31:44',0),(298,25,12,9,8,11,6,9,8,'2024-12-26 21:32:00',0),(299,25,12,7,9,8,8,7,9,'2024-12-26 21:32:57',0),(300,25,12,10,9,10,9,7,12,'2024-12-26 21:33:05',0),(301,25,11,7,4,4,7,4,7,'2024-12-26 21:33:32',0),(302,25,11,5,9,5,9,8,6,'2024-12-26 21:34:01',0),(303,25,11,12,11,12,11,11,12,'2024-12-26 21:34:14',0),(304,25,12,12,9,10,11,11,10,'2024-12-26 21:34:26',0),(305,25,12,5,3,2,6,3,5,'2024-12-26 21:34:51',0),(306,25,11,6,6,9,3,5,7,'2024-12-26 21:36:00',0),(307,25,11,8,4,4,8,6,6,'2024-12-26 21:36:25',0),(308,25,11,6,6,6,6,8,4,'2024-12-26 21:36:34',0),(309,25,12,4,7,8,3,3,8,'2024-12-26 21:38:52',0),(310,25,12,8,8,7,9,9,7,'2024-12-26 21:39:15',0),(311,25,12,8,9,9,8,8,9,'2024-12-26 21:39:36',0),(312,25,12,11,6,10,7,8,9,'2024-12-26 21:39:48',0),(313,25,11,7,11,7,11,6,12,'2024-12-26 21:40:47',0),(314,25,11,6,3,3,6,2,7,'2024-12-26 21:41:35',0),(315,25,12,9,6,6,9,10,5,'2024-12-26 21:41:55',0),(316,25,12,5,7,5,7,8,4,'2024-12-26 21:42:08',0),(317,25,12,7,7,8,6,5,9,'2024-12-26 21:42:30',0),(318,25,11,6,8,5,9,5,9,'2024-12-26 21:44:03',0),(319,25,11,6,8,7,7,11,3,'2024-12-26 21:45:03',0),(320,25,11,7,8,3,12,7,8,'2024-12-26 21:45:20',0),(321,25,12,5,10,9,6,7,8,'2024-12-26 21:45:33',0),(322,25,12,4,6,6,4,2,8,'2024-12-26 21:45:46',0),(323,25,12,4,11,8,7,7,8,'2024-12-26 21:46:05',0),(324,25,11,12,5,7,10,10,7,'2024-12-26 21:46:39',0),(325,25,11,8,5,9,4,8,5,'2024-12-26 21:46:51',0),(326,25,11,9,4,9,4,7,6,'2024-12-26 21:46:57',0),(327,25,12,3,9,6,6,7,5,'2024-12-26 21:47:57',0),(328,25,12,5,10,9,6,9,6,'2024-12-26 21:48:07',0),(329,25,12,3,5,6,2,3,5,'2024-12-26 21:48:18',0),(330,25,11,10,8,9,9,7,11,'2024-12-26 21:49:08',0),(331,25,11,4,11,8,7,7,8,'2024-12-26 21:49:35',0),(332,25,11,7,9,7,9,8,8,'2024-12-26 21:49:48',0),(333,25,12,6,8,7,7,5,9,'2024-12-26 21:50:13',0),(334,25,12,6,7,7,6,6,7,'2024-12-26 21:51:07',0),(335,25,11,10,8,9,9,7,11,'2024-12-26 21:52:54',0),(336,25,11,6,8,4,10,8,6,'2024-12-26 21:54:45',0),(337,25,11,11,11,12,10,11,11,'2024-12-26 21:54:58',0),(338,25,12,8,7,6,9,5,10,'2024-12-26 21:56:35',0),(339,25,12,10,8,9,9,7,11,'2024-12-26 21:57:05',0),(340,25,12,6,9,5,10,6,9,'2024-12-26 21:57:18',0),(341,25,11,6,8,8,6,6,8,'2024-12-26 21:58:39',0),(342,25,11,5,6,8,3,6,5,'2024-12-26 21:59:29',0),(343,25,11,6,3,6,3,5,4,'2024-12-26 21:59:41',0),(344,25,11,5,6,6,5,8,3,'2024-12-26 22:01:01',0),(345,25,12,6,3,7,2,6,3,'2024-12-26 22:51:29',0),(346,25,11,6,12,10,8,10,8,'2024-12-26 23:47:49',0),(347,25,11,2,8,7,3,3,7,'2024-12-26 23:51:43',0),(348,25,11,9,12,9,12,9,12,'2024-12-26 23:57:40',0),(349,25,12,6,6,9,3,5,7,'2024-12-27 00:02:37',0),(350,25,12,8,10,12,6,10,8,'2024-12-27 00:02:51',0),(351,25,12,8,9,9,8,6,11,'2024-12-27 00:03:03',0),(352,25,11,6,8,5,9,9,5,'2024-12-27 00:06:37',0),(353,25,11,5,4,5,4,3,6,'2024-12-27 00:08:27',0),(354,25,11,9,6,7,8,7,8,'2024-12-27 00:09:21',0),(355,25,12,3,3,4,2,3,3,'2024-12-27 00:15:39',0),(356,25,12,10,4,6,8,8,6,'2024-12-27 00:17:57',0),(357,25,12,10,7,10,7,9,8,'2024-12-27 00:18:16',0),(358,25,11,6,9,8,7,5,10,'2024-12-27 00:18:47',0),(359,25,12,5,2,5,2,5,2,'2024-12-27 00:37:29',0),(360,25,11,10,8,7,11,9,9,'2024-12-27 00:39:05',0),(361,25,11,6,5,5,6,6,5,'2024-12-27 00:42:04',0),(362,25,11,9,10,8,11,10,9,'2024-12-27 00:42:19',0),(363,25,11,7,5,9,3,8,4,'2024-12-27 00:45:12',0),(364,25,12,10,3,6,7,7,6,'2024-12-27 00:46:53',0),(365,25,12,6,9,8,7,9,6,'2024-12-27 00:47:09',0),(366,25,12,7,5,7,5,4,8,'2024-12-27 00:47:21',0),(367,25,12,8,8,7,9,7,9,'2024-12-27 00:51:00',0),(368,25,12,10,9,10,9,7,12,'2024-12-27 00:53:49',0),(369,25,12,12,7,7,12,12,7,'2024-12-27 00:58:20',0),(370,25,12,10,9,9,10,10,9,'2024-12-27 01:00:42',0),(371,25,12,3,8,5,6,5,6,'2024-12-27 01:00:51',0),(372,25,12,7,6,5,8,5,8,'2024-12-27 01:01:13',0),(373,25,12,9,10,11,8,11,8,'2024-12-27 01:01:28',0),(374,26,11,8,3,7,4,6,5,'2024-12-27 01:19:47',0),(375,26,11,10,9,9,10,12,7,'2024-12-27 01:22:16',0),(376,26,11,9,8,10,7,10,7,'2024-12-27 01:26:59',0),(377,26,11,6,7,7,6,6,7,'2024-12-27 01:27:11',0),(378,26,11,9,11,12,8,11,9,'2024-12-27 01:31:56',0),(379,26,12,8,12,11,9,11,9,'2025-01-02 19:43:37',0),(380,26,12,10,6,8,8,6,10,'2025-01-02 21:28:56',0),(381,26,11,3,11,6,8,7,7,'2025-01-03 00:01:28',0),(382,26,12,7,7,7,7,10,4,'2025-01-03 00:37:56',0),(383,26,11,3,7,4,6,5,5,'2025-01-03 00:39:14',0),(384,27,11,5,9,9,5,6,8,'2025-01-03 01:18:08',0),(385,27,11,9,10,11,8,11,8,'2025-01-03 01:23:48',0),(386,27,11,9,5,8,6,9,5,'2025-01-03 01:25:12',0),(387,27,12,10,7,7,10,8,9,'2025-01-03 01:36:19',0),(388,27,12,11,9,9,11,10,10,'2025-01-03 01:36:47',0),(389,27,12,5,7,8,4,5,7,'2025-01-03 01:36:59',0),(390,27,12,8,12,12,8,12,8,'2025-01-03 01:37:15',0),(391,27,11,2,5,5,2,2,5,'2025-01-03 01:51:19',0),(392,27,11,9,6,7,8,11,4,'2025-01-03 01:53:09',0),(393,27,11,11,6,10,7,8,9,'2025-01-03 01:54:23',0),(394,27,12,6,11,10,7,11,6,'2025-01-03 01:55:21',0),(395,27,12,9,3,7,5,6,6,'2025-01-03 01:56:21',0),(396,27,12,6,9,10,5,7,8,'2025-01-03 02:00:05',0),(397,27,12,8,8,9,7,5,11,'2025-01-03 02:00:47',0),(398,27,12,4,7,7,4,2,9,'2025-01-03 02:02:27',0),(399,27,12,9,8,10,7,8,9,'2025-01-03 02:02:40',0),(400,28,11,9,7,7,9,8,8,'2025-01-03 02:48:56',0),(401,28,11,11,6,7,10,11,6,'2025-01-03 02:50:06',0),(402,28,12,7,6,8,5,4,9,'2025-01-03 02:52:27',0),(403,28,12,9,10,10,9,12,7,'2025-01-03 02:52:40',0),(404,28,11,10,7,9,8,10,7,'2025-01-03 02:56:13',0),(405,28,11,8,9,9,8,8,9,'2025-01-03 02:56:41',0),(406,29,11,6,9,7,8,8,7,'2025-01-03 03:07:00',0),(407,29,11,7,7,11,3,8,6,'2025-01-03 03:12:54',0),(408,29,11,8,4,5,7,3,9,'2025-01-03 03:16:53',0),(409,29,11,3,8,7,4,5,6,'2025-01-03 03:18:05',0),(410,29,11,5,8,8,5,4,9,'2025-01-03 03:18:18',0),(411,29,11,4,8,3,9,7,5,'2025-01-03 03:20:18',0),(412,29,12,6,5,4,7,7,4,'2025-01-03 03:21:29',0),(413,29,12,9,8,9,8,5,12,'2025-01-03 03:21:40',0),(414,29,12,8,5,7,6,4,9,'2025-01-03 03:22:25',0),(415,29,11,10,5,7,8,6,9,'2025-01-03 03:25:04',0),(416,29,11,5,9,7,7,8,6,'2025-01-03 03:27:22',0),(417,29,12,7,5,8,4,5,7,'2025-01-03 03:29:05',0),(418,29,12,9,7,9,7,4,12,'2025-01-03 03:29:20',0),(419,30,11,4,6,2,8,6,4,'2025-01-03 03:36:15',0),(420,30,11,7,11,6,12,7,11,'2025-01-03 03:36:38',0),(421,30,11,8,8,4,12,8,8,'2025-01-03 03:36:48',0),(422,30,12,7,6,5,8,9,4,'2025-01-03 03:40:30',0),(423,30,12,5,7,8,4,7,5,'2025-01-03 03:40:38',0),(424,30,12,10,8,12,6,8,10,'2025-01-03 03:40:45',0),(425,30,11,8,8,7,9,7,9,'2025-01-03 03:42:12',0),(426,30,11,6,8,6,8,8,6,'2025-01-03 03:43:11',0),(427,30,11,8,6,7,7,3,11,'2025-01-03 03:43:27',0),(428,30,12,8,6,7,7,11,3,'2025-01-03 03:45:35',0),(429,30,12,5,9,7,7,8,6,'2025-01-03 03:46:05',0),(430,31,11,6,5,5,6,6,5,'2025-01-03 17:42:12',0),(431,31,11,8,10,9,9,7,11,'2025-01-03 17:43:43',0),(432,31,12,12,5,8,9,9,8,'2025-01-03 17:47:53',0),(433,31,12,12,3,7,8,8,7,'2025-01-03 17:50:31',0),(434,31,11,7,7,7,7,2,12,'2025-01-03 17:59:50',0),(435,31,11,5,5,5,5,6,4,'2025-01-03 18:02:28',0),(436,31,11,7,7,7,7,2,12,'2025-01-03 18:04:08',0),(437,31,12,11,7,12,6,7,11,'2025-01-03 18:10:50',0),(438,31,12,5,7,3,9,8,4,'2025-01-03 18:11:43',0),(439,31,11,4,7,5,6,6,5,'2025-01-03 18:13:11',0),(440,31,11,5,10,5,10,7,8,'2025-01-03 18:13:36',0),(441,31,11,6,10,5,11,7,9,'2025-01-03 18:13:45',0),(442,31,12,2,7,5,4,4,5,'2025-01-03 18:17:20',0),(443,31,12,6,9,11,4,8,7,'2025-01-03 18:17:30',0),(444,31,11,7,6,8,5,6,7,'2025-01-03 18:40:08',0),(445,31,11,4,6,4,6,6,4,'2025-01-03 19:13:48',0),(446,31,11,3,4,3,4,3,4,'2025-01-03 19:14:11',0),(447,31,11,10,7,7,10,8,9,'2025-01-03 19:14:18',0),(448,31,11,4,8,6,6,4,8,'2025-01-03 19:14:25',0),(449,31,12,6,8,8,6,6,8,'2025-01-03 19:17:44',1),(450,31,11,6,7,7,6,8,5,'2025-01-03 19:19:22',0),(451,31,11,4,9,5,8,6,7,'2025-01-03 19:19:38',0),(452,32,11,7,10,8,9,6,11,'2025-01-04 02:32:14',0);
/*!40000 ALTER TABLE `dice_rolls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player1_id` int(11) NOT NULL,
  `player2_id` int(11) DEFAULT NULL,
  `current_turn_player` int(11) NOT NULL,
  `status` enum('waiting','in_progress','completed') DEFAULT 'waiting',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `winner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `player1_id` (`player1_id`),
  KEY `player2_id` (`player2_id`),
  KEY `winner_id` (`winner_id`),
  CONSTRAINT `games_ibfk_1` FOREIGN KEY (`player1_id`) REFERENCES `players` (`id`),
  CONSTRAINT `games_ibfk_2` FOREIGN KEY (`player2_id`) REFERENCES `players` (`id`),
  CONSTRAINT `games_ibfk_3` FOREIGN KEY (`winner_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,1,2,2,'completed','2024-11-10 13:00:52','2024-11-10 14:39:36',2),(5,2,2,2,'in_progress','2024-12-14 13:21:18','2024-12-14 18:32:31',NULL),(7,1,2,1,'in_progress','2024-12-15 13:44:37','2024-12-15 13:44:43',NULL),(8,1,2,1,'in_progress','2024-12-15 14:55:21','2024-12-15 14:56:55',NULL),(9,5,6,5,'in_progress','2024-12-15 17:48:22','2024-12-15 17:48:38',NULL),(10,5,6,4,'in_progress','2024-12-15 18:09:32','2024-12-22 19:41:08',NULL),(11,5,6,4,'in_progress','2024-12-22 19:45:32','2024-12-22 19:53:20',NULL),(12,5,6,5,'in_progress','2024-12-22 23:34:27','2024-12-22 23:34:30',NULL),(13,6,7,6,'in_progress','2024-12-24 19:28:17','2024-12-24 19:29:12',NULL),(14,9,10,9,'in_progress','2024-12-24 23:42:33','2024-12-24 23:42:54',NULL),(15,9,10,9,'in_progress','2024-12-25 00:24:31','2024-12-25 00:24:34',NULL),(16,9,10,9,'in_progress','2024-12-25 00:50:35','2024-12-25 00:50:38',NULL),(17,9,10,9,'in_progress','2024-12-25 13:58:17','2024-12-25 13:58:21',NULL),(18,9,10,9,'in_progress','2024-12-25 15:23:16','2024-12-25 15:23:20',NULL),(19,9,10,10,'in_progress','2024-12-25 16:52:07','2024-12-25 17:12:19',NULL),(20,9,10,10,'in_progress','2024-12-25 17:49:18','2024-12-25 22:09:26',NULL),(21,9,10,10,'completed','2024-12-25 22:10:27','2024-12-26 14:44:22',10),(22,9,9,9,'in_progress','2024-12-26 15:46:49','2024-12-26 15:46:51',NULL),(23,9,9,9,'in_progress','2024-12-26 15:52:30','2024-12-26 15:52:37',NULL),(24,9,10,10,'completed','2024-12-26 15:54:18','2024-12-26 16:43:59',10),(25,11,12,12,'completed','2024-12-26 21:06:17','2024-12-27 01:01:47',12),(26,11,12,11,'completed','2024-12-27 01:17:43','2025-01-03 00:44:27',11),(27,11,12,12,'in_progress','2025-01-03 01:06:06','2025-01-03 02:02:18',NULL),(28,11,12,12,'in_progress','2025-01-03 02:04:48','2025-01-03 03:14:11',NULL),(29,11,12,12,'in_progress','2025-01-03 03:06:23','2025-01-03 03:28:45',NULL),(30,11,12,12,'in_progress','2025-01-03 03:35:18','2025-01-03 03:44:12',NULL),(31,11,12,11,'completed','2025-01-03 17:41:34','2025-01-03 19:19:43',11),(32,11,12,11,'in_progress','2025-01-04 00:14:47','2025-01-04 00:18:06',NULL),(33,11,12,11,'in_progress','2025-01-04 00:21:54','2025-01-04 00:22:16',NULL);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_columns`
--

DROP TABLE IF EXISTS `player_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `column_number` int(11) NOT NULL,
  `progress` int(11) DEFAULT 0,
  `is_won` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `game_id` (`game_id`,`player_id`,`column_number`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_columns_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  CONSTRAINT `player_columns_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_columns`
--

LOCK TABLES `player_columns` WRITE;
/*!40000 ALTER TABLE `player_columns` DISABLE KEYS */;
INSERT INTO `player_columns` VALUES (1,1,2,8,13,1),(14,1,2,2,3,1),(17,1,2,12,3,1),(123,9,5,0,0,0),(124,9,5,6,11,1),(135,9,5,9,1,0),(136,9,5,3,1,0),(137,10,5,0,0,0),(138,10,5,9,1,0),(139,10,5,5,1,0),(145,10,5,12,1,0),(146,10,5,8,1,0),(147,11,5,0,0,0),(150,11,5,8,2,0),(151,11,5,6,2,0),(154,11,5,9,1,0),(155,11,5,5,1,0),(156,12,5,0,0,0),(157,12,5,7,1,0),(158,12,5,5,1,0),(159,13,6,0,0,0),(160,13,6,8,1,0),(161,13,6,6,1,0),(162,14,9,8,1,0),(163,14,9,4,1,0),(164,16,9,10,1,0),(165,16,9,6,2,0),(166,16,9,4,1,0),(167,16,9,9,1,0),(168,16,9,7,1,0),(170,20,10,5,2,0),(171,20,10,3,2,0),(172,20,10,9,2,0),(173,20,9,2,1,0),(174,20,9,7,4,0),(175,20,9,8,2,0),(176,21,9,2,1,0),(177,21,9,4,2,0),(178,21,9,9,2,0),(179,21,10,4,4,0),(180,21,10,11,5,1),(181,21,10,5,1,0),(182,21,9,5,9,1),(183,21,9,8,10,0),(184,21,9,10,4,0),(185,21,10,7,5,0),(186,21,10,2,2,0),(187,21,10,8,12,1),(189,21,9,6,7,0),(190,21,9,12,1,0),(191,21,10,6,11,1),(200,21,9,3,3,0),(212,21,9,7,4,0),(216,21,10,9,1,0),(218,22,9,3,1,0),(219,22,9,5,1,0),(220,22,9,12,1,0),(221,24,10,6,13,1),(222,24,10,7,13,1),(223,24,10,11,3,0),(224,24,9,4,4,0),(225,24,9,9,4,0),(226,24,9,11,1,0),(229,24,10,4,1,0),(231,24,10,8,4,0),(233,24,9,5,4,0),(234,24,9,7,7,0),(236,24,9,3,2,0),(238,24,9,10,6,0),(241,24,10,5,4,0),(242,24,10,2,1,0),(243,24,9,2,5,1),(251,24,10,10,8,1),(252,24,10,3,1,0),(253,24,10,12,1,0),(254,24,10,9,1,0),(258,24,9,8,1,0),(265,25,12,7,15,1),(266,25,12,6,11,1),(267,25,12,3,3,0),(268,25,11,5,10,1),(269,25,11,4,4,0),(270,25,11,8,12,1),(272,25,12,11,6,1),(273,25,12,5,7,0),(275,25,12,10,5,0),(276,25,12,2,2,0),(278,25,11,7,1,0),(280,25,12,4,3,0),(282,25,12,9,8,0),(283,25,11,6,5,0),(284,25,11,12,1,0),(285,25,11,2,1,0),(290,25,12,8,3,0),(295,25,11,10,4,0),(312,25,11,9,4,0),(314,25,12,12,2,0),(335,26,11,7,15,1),(336,26,11,4,7,0),(337,26,11,12,4,1),(339,26,11,10,1,0),(341,26,11,6,1,0),(344,26,11,8,1,0),(345,26,12,8,11,1),(347,26,11,3,1,0),(348,26,11,11,1,0),(349,26,12,4,8,1),(350,26,11,5,11,1),(354,27,11,5,3,0),(355,27,11,9,8,0),(356,27,11,10,5,0),(357,27,11,2,1,0),(359,27,11,7,2,0),(360,27,12,9,10,1),(361,27,12,10,2,0),(362,27,12,7,1,0),(365,27,12,5,2,0),(366,27,12,11,1,0),(367,28,11,8,4,0),(368,28,11,11,3,0),(369,28,11,6,9,0),(370,28,12,4,1,0),(371,28,12,9,7,0),(372,28,12,12,2,0),(373,28,11,9,11,1),(376,29,11,6,13,1),(377,29,11,9,11,1),(378,29,11,11,3,0),(380,29,11,3,3,0),(382,29,11,8,2,0),(383,29,12,4,5,0),(384,29,12,7,13,1),(385,29,12,8,1,0),(390,30,11,4,5,0),(391,30,11,6,9,0),(392,30,11,7,16,1),(393,30,12,4,1,0),(394,30,12,5,7,0),(395,30,12,8,11,1),(398,30,11,9,1,0),(399,30,11,8,1,0),(401,31,11,6,11,1),(402,31,11,5,9,1),(403,31,11,9,7,0),(404,31,12,3,4,0),(405,31,12,5,1,0),(406,31,12,12,3,1),(408,31,11,2,2,0),(409,31,11,12,2,0),(412,31,12,6,1,0),(414,31,11,10,2,0),(415,31,12,2,1,0),(416,31,12,7,1,0),(417,31,12,9,1,0),(418,31,11,7,13,1),(419,31,11,4,3,0),(420,31,11,3,1,0),(422,32,11,11,5,1);
/*!40000 ALTER TABLE `player_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `player_token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `player_token` (`player_token`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'John','e968767e1de0605e53c97799f067dcb1','2024-11-09 14:47:18'),(2,'Mike','c4b0478f179b13c86ba67abc6d92ce4a','2024-11-09 14:47:38'),(3,'Mike','43783ab43953a88baf51f42e5631c523','2024-11-09 15:25:01'),(4,'John','064e360f681c5c45d8daee31f7a76b49','2024-11-09 15:25:09'),(5,'John','6982d77f40b5897abfc79dc378139a0b','2024-12-15 17:45:36'),(6,'miaou','79131fd005861bf89b1dad7bbdba01d0','2024-12-15 17:45:44'),(7,'George','fdc77ccab85be7b056fcca37257c24ba','2024-12-16 11:41:06'),(8,'George','7b617583bd009370d723f436999a2513','2024-12-16 11:41:41'),(9,'Player1','70899a38611b3fd984ec56b57b774ec7','2024-12-24 23:41:33'),(10,'Player2','5270f87ebec43cc56a4c361cac90ec60','2024-12-24 23:41:37'),(11,'Player3','29719ac082827b6ce67b18494effe893','2024-12-26 21:04:36'),(12,'Player4','47c51c7b873529d35ae1d70f1999820d','2024-12-26 21:04:43');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turn_markers`
--

DROP TABLE IF EXISTS `turn_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turn_markers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `column_number` int(11) NOT NULL,
  `temp_progress` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `game_id` (`game_id`,`player_id`,`column_number`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `turn_markers_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  CONSTRAINT `turn_markers_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=533 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turn_markers`
--

LOCK TABLES `turn_markers` WRITE;
/*!40000 ALTER TABLE `turn_markers` DISABLE KEYS */;
INSERT INTO `turn_markers` VALUES (1,17,9,8,8),(2,17,9,5,4),(3,17,9,4,3),(16,18,9,10,1),(17,18,9,5,4),(19,18,9,6,2),(442,27,12,2,1),(443,27,12,10,1),(444,27,12,7,1),(471,29,12,7,2),(472,29,12,5,1),(487,30,12,8,2),(488,30,12,6,2),(519,31,11,7,2),(521,32,11,6,7),(522,32,11,11,5);
/*!40000 ALTER TABLE `turn_markers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-04  4:40:39