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
  `stage` int(10) DEFAULT NULL,
  `dcards_array` varchar(500) DEFAULT NULL,
  `betting_order` int(10) DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `status` (`status`),
  CONSTRAINT `entity_game_ibfk_1` FOREIGN KEY (`status`) REFERENCES `enum_game_status` (`enum_game_sttus`),
  CONSTRAINT `entity_game_ibfk_2` FOREIGN KEY (`status`) REFERENCES `enum_game_status` (`enum_game_sttus`),
  CONSTRAINT `entity_game_ibfk_3` FOREIGN KEY (`status`) REFERENCES `enum_game_status` (`enum_game_sttus`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_game`
--

LOCK TABLES `entity_game` WRITE;
/*!40000 ALTER TABLE `entity_game` DISABLE KEYS */;
INSERT INTO `entity_game` VALUES (1,0,0,NULL,2147483647,NULL,NULL),(2,0,0,NULL,2147483647,NULL,NULL),(3,0,0,NULL,0,NULL,NULL),(4,0,0,NULL,0,NULL,NULL),(5,0,0,NULL,0,NULL,NULL),(6,0,0,NULL,0,NULL,NULL),(7,0,0,NULL,0,NULL,NULL),(8,0,0,NULL,0,NULL,NULL),(9,0,0,NULL,0,NULL,NULL),(10,0,0,NULL,0,NULL,NULL),(11,0,0,NULL,0,NULL,NULL),(12,0,0,NULL,0,NULL,NULL),(13,0,0,1,NULL,NULL,NULL),(14,0,0,0,NULL,NULL,NULL),(15,0,0,0,NULL,NULL,NULL),(16,0,105,2,1,'[17,23,11,39,6,48,32,2,21,13,45,34,12,7,18,9,15,27,30,3,50,8,25,35,31,4,14,40,42,1,44,37,47,46,51,29,19,33,20,38,16,22,26,28,49,24,5,43,36,10,41,0]',0),(17,0,0,2,NULL,NULL,NULL),(18,0,15,2,1,'[47,38,50,13,35,37,10,29,25,51,22,0,31,3,21,19,14,42,33,49,23,40,32,34,48,45,2,43,7,20,39,28,11,27,4,6,24,36,30,8,18,41,44,46,15,16,1,12,17,5,9,26]',0),(19,0,45,2,1,'[41,20,6,10,40,39,26,3,38,9,2,4,25,45,35,23,46,19,11,33,17,44,32,0,43,12,50,34,37,15,36,22,42,18,16,24,1,48,28,49,27,14,30,29,5,8,21,47,51,13,7,31]',1),(20,0,15,2,1,'[4,45,18,33,38,32,7,24,46,43,20,28,36,11,34,15,13,37,19,25,10,26,39,5,29,49,30,50,35,22,14,0,2,48,47,21,44,42,31,41,12,3,1,51,9,8,16,27,6,40,17,23]',0),(21,0,0,2,NULL,NULL,NULL),(22,0,15,2,1,'[51,45,50,15,11,6,1,35,37,4,18,46,38,40,10,25,36,19,34,32,28,5,9,44,42,7,48,30,27,47,43,23,31,22,26,2,16,12,24,20,33,29,3,41,17,21,49,0,8,14,13,39]',0),(23,0,0,2,NULL,NULL,NULL),(24,0,15,2,1,'[2,33,7,12,47,28,48,50,38,19,49,1,17,10,8,15,41,18,29,43,34,0,9,20,23,35,22,31,4,32,14,51,24,5,6,27,26,39,44,25,16,13,21,30,3,45,40,11,42,37,46,36]',0),(25,0,30,2,1,'[35,26,0,9,23,3,15,42,38,2,49,13,43,37,32,36,18,6,1,30,25,16,45,19,8,4,14,27,22,28,44,17,47,7,40,24,29,10,21,41,39,5,51,34,12,31,48,20,50,33,11,46]',1),(26,0,180,2,1,'[2,0,32,24,13,25,44,10,5,20,21,19,34,30,8,27,6,4,14,51,41,46,49,39,3,9,1,47,23,16,11,29,18,31,50,28,17,45,48,40,42,26,37,7,15,12,22,35,38,43,36,33]',0),(27,0,15,2,1,'[50,7,37,19,2,4,0,23,44,22,12,1,3,29,18,20,21,16,30,5,45,13,43,31,27,33,38,39,10,51,47,41,28,34,36,8,11,42,25,40,49,9,14,24,26,17,48,32,35,6,46,15]',1),(28,0,30,2,1,'[6,14,41,29,32,11,46,10,50,22,42,36,40,7,45,34,19,18,27,47,1,43,23,24,49,31,25,30,13,26,17,4,12,21,33,51,35,37,9,20,28,16,2,8,0,15,38,44,3,48,5,39]',0),(29,0,15,2,1,'[28,48,9,46,29,44,23,16,5,39,35,43,1,8,34,2,0,25,47,24,18,27,26,33,32,14,49,17,51,42,12,50,3,19,13,21,36,6,40,30,22,15,7,4,20,10,45,37,11,38,31,41]',1),(30,0,15,2,1,'[13,50,44,36,19,1,17,3,28,43,40,21,7,15,6,51,22,31,20,23,34,33,29,18,26,49,48,16,11,10,45,2,27,25,32,41,47,12,5,39,42,24,4,14,8,46,38,37,30,35,9,0]',0),(31,0,30,2,1,'[41,50,9,10,23,35,45,48,30,32,17,37,38,20,28,6,51,15,2,27,44,5,36,43,13,3,22,34,39,0,16,18,42,40,4,33,8,49,11,29,19,14,47,1,7,31,26,21,24,25,46,12]',1),(32,1,15,2,1,'[38,23,18,45,1,39,51,49,19,2,28,30,17,21,36,25,13,26,15,34,42,4,48,35,7,44,32,0,37,27,12,14,20,6,10,9,24,16,22,47,50,31,29,46,33,8,43,3,5,41,11,40]',0);
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
  CONSTRAINT `entity_users_ibfk_2` FOREIGN KEY (`status`) REFERENCES `enum_user_status` (`enum_user_status`),
  CONSTRAINT `entity_users_ibfk_3` FOREIGN KEY (`status`) REFERENCES `enum_user_status` (`enum_user_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_users`
--

LOCK TABLES `entity_users` WRITE;
/*!40000 ALTER TABLE `entity_users` DISABLE KEYS */;
INSERT INTO `entity_users` VALUES (1,'abcdefg','$2y$10$l85uIvfxaHz8nDPz9PtZieP6Z0rx.E9rWKabDZ5m8/aZBfGrAf5/K',720,3,'2019-12-02 14:01:47'),(2,'abc111','$2y$10$T0KlFNBmQT1ePcx4Iu50cOPKb6RzwB7/SPaM1Lqiz8zvrA.FrvsVa',1000,NULL,'2019-11-30 10:57:52'),(3,'lee1234','$2y$10$ikHLTgioetpPJNqGHzbvm.hZRW7h1NDLlSwbCRMJXBzt34CG1roj.',740,3,'2019-12-02 14:01:47'),(4,'blee12','$2y$10$Gd24MwlcFDTowAa2efxGKe/ENtGSjobDXJygc4NW8dL2E6fx3.rme',1000,0,'2019-12-02 07:03:23');
/*!40000 ALTER TABLE `entity_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_game_status`
--

DROP TABLE IF EXISTS `enum_game_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enum_game_status` (
  `enum_game_sttus` int(10) NOT NULL,
  `game_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enum_game_sttus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_game_status`
--

LOCK TABLES `enum_game_status` WRITE;
/*!40000 ALTER TABLE `enum_game_status` DISABLE KEYS */;
INSERT INTO `enum_game_status` VALUES (0,'Ended'),(1,'playing'),(2,'etc');
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
INSERT INTO `enum_player_status` VALUES (0,'Inactive'),(1,'Active');
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
INSERT INTO `enum_user_status` VALUES (0,'Not Logged-in'),(1,'Logged-in'),(2,'Waiting'),(3,'Playing');
/*!40000 ALTER TABLE `enum_user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_game_player`
--

DROP TABLE IF EXISTS `view_game_player`;
/*!50001 DROP VIEW IF EXISTS `view_game_player`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_game_player` (
  `game_id` tinyint NOT NULL,
  `game_status` tinyint NOT NULL,
  `num_players` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `user_status` tinyint NOT NULL,
  `user_name` tinyint NOT NULL,
  `player_id` tinyint NOT NULL,
  `in_pot_balance` tinyint NOT NULL,
  `player_status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
  `p_cards` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`play_game_num`),
  KEY `game_id` (`game_id`),
  KEY `user_id` (`user_id`),
  KEY `active_status` (`active_status`),
  CONSTRAINT `xref_play_game_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `entity_game` (`game_id`),
  CONSTRAINT `xref_play_game_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`user_id`),
  CONSTRAINT `xref_play_game_ibfk_3` FOREIGN KEY (`active_status`) REFERENCES `enum_player_status` (`enum_player_status`),
  CONSTRAINT `xref_play_game_ibfk_4` FOREIGN KEY (`game_id`) REFERENCES `entity_game` (`game_id`),
  CONSTRAINT `xref_play_game_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`user_id`),
  CONSTRAINT `xref_play_game_ibfk_6` FOREIGN KEY (`active_status`) REFERENCES `enum_player_status` (`enum_player_status`),
  CONSTRAINT `xref_play_game_ibfk_7` FOREIGN KEY (`game_id`) REFERENCES `entity_game` (`game_id`),
  CONSTRAINT `xref_play_game_ibfk_8` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`user_id`),
  CONSTRAINT `xref_play_game_ibfk_9` FOREIGN KEY (`active_status`) REFERENCES `enum_player_status` (`enum_player_status`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_play_game`
--

LOCK TABLES `xref_play_game` WRITE;
/*!40000 ALTER TABLE `xref_play_game` DISABLE KEYS */;
INSERT INTO `xref_play_game` VALUES (1,1,1,0,0,1,NULL),(2,1,3,1,0,1,NULL),(3,2,1,0,0,1,NULL),(4,2,3,1,0,1,NULL),(5,3,1,0,0,1,NULL),(6,3,3,1,0,1,NULL),(7,4,1,0,0,1,NULL),(8,4,3,1,0,1,NULL),(9,5,1,0,0,1,NULL),(10,5,3,1,0,1,NULL),(11,11,1,0,0,1,NULL),(12,11,3,1,0,1,NULL),(13,4,1,0,0,1,NULL),(14,4,3,1,0,1,NULL),(15,14,1,0,0,1,NULL),(16,14,3,1,0,1,NULL),(17,15,1,0,0,1,NULL),(18,15,3,1,0,1,NULL),(19,16,1,0,35,1,'[51,30]'),(20,16,3,1,70,1,'[41,7]'),(48,17,1,0,0,1,NULL),(49,17,3,1,0,1,NULL),(50,18,1,0,5,1,'[null,null]'),(51,18,3,1,10,1,'[null,null]'),(52,19,1,0,30,1,'[27,14]'),(53,19,3,1,15,1,'[13,42]'),(54,20,1,0,5,1,'[null,null]'),(55,20,3,1,10,1,'[null,null]'),(56,21,1,0,0,1,NULL),(57,21,3,1,0,1,NULL),(58,22,1,0,5,1,'[null,null]'),(59,22,3,1,10,1,'[null,null]'),(60,23,3,0,0,1,NULL),(61,23,1,1,0,1,NULL),(62,24,3,0,5,1,'[null,null]'),(63,24,1,1,10,1,'[null,null]'),(64,25,3,0,20,1,'[39,11]'),(65,25,1,1,10,1,'[8,37]'),(66,26,3,0,60,1,'[47,20]'),(67,26,1,1,120,1,'[38,32]'),(68,27,3,0,10,1,'[null,null]'),(69,27,1,1,5,1,'[null,null]'),(70,28,1,0,10,1,'[50,4]'),(71,28,3,1,20,1,'[19,49]'),(72,29,3,0,10,1,'[null,null]'),(73,29,1,1,5,1,'[null,null]'),(74,30,3,0,5,1,'[13,44]'),(75,30,1,1,10,1,'[50,36]'),(76,31,1,0,20,1,'[50,10]'),(77,31,3,1,10,1,'[41,9]'),(78,32,3,0,5,1,'[38,18]'),(79,32,1,1,10,1,'[23,45]');
/*!40000 ALTER TABLE `xref_play_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `view_game_player`
--

/*!50001 DROP TABLE IF EXISTS `view_game_player`*/;
/*!50001 DROP VIEW IF EXISTS `view_game_player`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_game_player` AS select `entity_game`.`game_id` AS `game_id`,`entity_game`.`status` AS `game_status`,`entity_game`.`num_players` AS `num_players`,`xref_play_game`.`user_id` AS `user_id`,`entity_users`.`status` AS `user_status`,`entity_users`.`user_name` AS `user_name`,`xref_play_game`.`p_id` AS `player_id`,`xref_play_game`.`in_pot_balance` AS `in_pot_balance`,`xref_play_game`.`active_status` AS `player_status` from ((`xref_play_game` join `entity_game`) join `entity_users`) where `xref_play_game`.`game_id` = `entity_game`.`game_id` and `xref_play_game`.`user_id` = `entity_users`.`user_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-02 14:27:12
