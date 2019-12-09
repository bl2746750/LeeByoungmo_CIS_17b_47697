-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: texas_holdem
-- ------------------------------------------------------
-- Server version	10.4.8-MariaDB

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
-- Table structure for table `entity_dcards_array`
--

DROP TABLE IF EXISTS `entity_dcards_array`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_dcards_array` (
  `dcards_id` int(10) NOT NULL AUTO_INCREMENT,
  `game_id` int(10) DEFAULT NULL,
  `dCards_array` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`dcards_id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `entity_dcards_array_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `entity_game` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_dcards_array`
--

LOCK TABLES `entity_dcards_array` WRITE;
/*!40000 ALTER TABLE `entity_dcards_array` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_dcards_array` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_game`
--

DROP TABLE IF EXISTS `entity_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_game` (
  `game_id` int(10) NOT NULL AUTO_INCREMENT,
  `status` int(10) DEFAULT NULL,
  `pot_balance` int(10) DEFAULT NULL,
  `num_players` int(10) DEFAULT NULL,
  `small_blind` int(10) DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `status` (`status`),
  CONSTRAINT `entity_game_ibfk_1` FOREIGN KEY (`status`) REFERENCES `enum_game_status` (`enum_game_status`),
  CONSTRAINT `entity_game_ibfk_3` FOREIGN KEY (`status`) REFERENCES `enum_game_status` (`enum_game_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_game`
--

LOCK TABLES `entity_game` WRITE;
/*!40000 ALTER TABLE `entity_game` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_users`
--

DROP TABLE IF EXISTS `entity_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `balance` int(10) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user_id`),
  KEY `status` (`status`),
  CONSTRAINT `entity_users_ibfk_1` FOREIGN KEY (`status`) REFERENCES `enum_user_status` (`enum_user_status`),
  CONSTRAINT `entity_users_ibfk_2` FOREIGN KEY (`status`) REFERENCES `enum_user_status` (`enum_user_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_users`
--

LOCK TABLES `entity_users` WRITE;
/*!40000 ALTER TABLE `entity_users` DISABLE KEYS */;
INSERT INTO `entity_users` VALUES (3,'abcd12','$2y$10$nS2BkawA2TiVohj5OoTP0e9qWG4JrONQlgaUgyWapcBPK0GPs1WOu',1000,NULL,'2019-11-30 09:48:36'),(4,'abcdefg','$2y$10$xG642DiQMzrgAxikNVovVe.bcke2zzOFuzoKdDhoNzifgl8tVTAvy',1000,NULL,'2019-11-30 10:05:58');
/*!40000 ALTER TABLE `entity_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_game_status`
--

DROP TABLE IF EXISTS `enum_game_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enum_game_status` (
  `enum_game_status` int(10) NOT NULL,
  `game_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enum_game_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_game_status`
--

LOCK TABLES `enum_game_status` WRITE;
/*!40000 ALTER TABLE `enum_game_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `enum_game_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_player_status`
--

DROP TABLE IF EXISTS `enum_player_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enum_player_status` (
  `enum_player_status` int(10) NOT NULL,
  `player_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enum_player_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_player_status`
--

LOCK TABLES `enum_player_status` WRITE;
/*!40000 ALTER TABLE `enum_player_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `enum_player_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_user_status`
--

DROP TABLE IF EXISTS `enum_user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enum_user_status` (
  `enum_user_status` int(10) NOT NULL,
  `user_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enum_user_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_user_status`
--

LOCK TABLES `enum_user_status` WRITE;
/*!40000 ALTER TABLE `enum_user_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `enum_user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_play_game`
--

DROP TABLE IF EXISTS `xref_play_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_play_game` (
  `play_game_num` int(10) NOT NULL AUTO_INCREMENT,
  `game_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `p_id` int(10) DEFAULT NULL,
  `in_pot_balance` int(10) DEFAULT NULL,
  `active_status` int(10) DEFAULT NULL,
  `balance` int(10) DEFAULT NULL,
  PRIMARY KEY (`play_game_num`),
  KEY `game_id` (`game_id`),
  KEY `user_id` (`user_id`),
  KEY `active_status` (`active_status`),
  CONSTRAINT `xref_play_game_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `entity_game` (`game_id`),
  CONSTRAINT `xref_play_game_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`user_id`),
  CONSTRAINT `xref_play_game_ibfk_3` FOREIGN KEY (`active_status`) REFERENCES `enum_player_status` (`enum_player_status`),
  CONSTRAINT `xref_play_game_ibfk_4` FOREIGN KEY (`game_id`) REFERENCES `entity_game` (`game_id`),
  CONSTRAINT `xref_play_game_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`user_id`),
  CONSTRAINT `xref_play_game_ibfk_6` FOREIGN KEY (`active_status`) REFERENCES `enum_player_status` (`enum_player_status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_play_game`
--

LOCK TABLES `xref_play_game` WRITE;
/*!40000 ALTER TABLE `xref_play_game` DISABLE KEYS */;
/*!40000 ALTER TABLE `xref_play_game` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-30  2:42:35
