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
-- Table structure for table `entity_cards`
--

DROP TABLE IF EXISTS `entity_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_cards` (
  `card_num` int(10) NOT NULL,
  `face_num` int(10) DEFAULT NULL,
  `face_name` varchar(50) DEFAULT NULL,
  `suit_num` int(10) DEFAULT NULL,
  `suit_name` varchar(50) DEFAULT NULL,
  `card_pict_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`card_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_cards`
--

LOCK TABLES `entity_cards` WRITE;
/*!40000 ALTER TABLE `entity_cards` DISABLE KEYS */;
INSERT INTO `entity_cards` VALUES (0,14,'Ace',0,'Spades','Cards/acespades.jpg'),(1,2,'Two',0,'Spades','Cards/twospades.jpg'),(2,3,'Three',0,'Spades','Cards/threespades.jpg'),(3,4,'Four',0,'Spades','Cards/fourspades.jpg'),(4,5,'Five',0,'Spades','Cards/fivespades.jpg'),(5,6,'Six',0,'Spades','Cards/sixspades.jpg'),(6,7,'Seven',0,'Spades','Cards/sevenspades.jpg'),(7,8,'Eight',0,'Spades','Cards/eightspades.jpg'),(8,9,'Nine',0,'Spades','Cards/ninespades.jpg'),(9,10,'Ten',0,'Spades','Cards/tenspades.jpg'),(10,11,'Jack',0,'Spades','Cards/jackspades.jpg'),(11,12,'Queen',0,'Spades','Cards/queenspades.jpg'),(12,13,'King',0,'Spades','Cards/kingspades.jpg'),(13,14,'Ace',1,'Hearts','Cards/acehearts.jpg'),(14,2,'Two',1,'Hearts','Cards/twohearts.jpg'),(15,3,'Three',1,'Hearts','Cards/threehearts.jpg'),(16,4,'Four',1,'Hearts','Cards/fourhearts.jpg'),(17,5,'Five',1,'Hearts','Cards/fivehearts.jpg'),(18,6,'Six',1,'Hearts','Cards/sixhearts.jpg'),(19,7,'Seven',1,'Hearts','Cards/sevenhearts.jpg'),(20,8,'Eight',1,'Hearts','Cards/eighthearts.jpg'),(21,9,'Nine',1,'Hearts','Cards/ninehearts.jpg'),(22,10,'Ten',1,'Hearts','Cards/tenhearts.jpg'),(23,11,'Jack',1,'Hearts','Cards/jackhearts.jpg'),(24,12,'Queen',1,'Hearts','Cards/queenhearts.jpg'),(25,13,'King',1,'Hearts','Cards/kinghearts.jpg'),(26,14,'Ace',2,'Diamonds','Cards/acediamonds.jpg'),(27,2,'Two',2,'Diamonds','Cards/twodiamonds.jpg'),(28,3,'Three',2,'Diamonds','Cards/threediamonds.jpg'),(29,4,'Four',2,'Diamonds','Cards/fourdiamonds.jpg'),(30,5,'Five',2,'Diamonds','Cards/fivediamonds.jpg'),(31,6,'Six',2,'Diamonds','Cards/sixdiamonds.jpg'),(32,7,'Seven',2,'Diamonds','Cards/sevendiamonds.jpg'),(33,8,'Eight',2,'Diamonds','Cards/eightdiamonds.jpg'),(34,9,'Nine',2,'Diamonds','Cards/ninediamonds.jpg'),(35,10,'Ten',2,'Diamonds','Cards/tendiamonds.jpg'),(36,11,'Jack',2,'Diamonds','Cards/jackdiamonds.jpg'),(37,12,'Queen',2,'Diamonds','Cards/queendiamonds.jpg'),(38,13,'King',2,'Diamonds','Cards/kingdiamonds.jpg'),(39,14,'Ace',3,'Clubs','Cards/aceclubs.jpg'),(40,2,'Two',3,'Clubs','Cards/twoclubs.jpg'),(41,3,'Three',3,'Clubs','Cards/threeclubs.jpg'),(42,4,'Four',3,'Clubs','Cards/fourclubs.jpg'),(43,5,'Five',3,'Clubs','Cards/fiveclubs.jpg'),(44,6,'Six',3,'Clubs','Cards/sixclubs.jpg'),(45,7,'Seven',3,'Clubs','Cards/sevenclubs.jpg'),(46,8,'Eight',3,'Clubs','Cards/eightclubs.jpg'),(47,9,'Nine',3,'Clubs','Cards/nineclubs.jpg'),(48,10,'Ten',3,'Clubs','Cards/tenclubs.jpg'),(49,11,'Jack',3,'Clubs','Cards/jackclubs.jpg'),(50,12,'Queen',3,'Clubs','Cards/queenclubs.jpg'),(51,13,'King',3,'Clubs','Cards/kingclubs.jpg');
/*!40000 ALTER TABLE `entity_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_game`
--

DROP TABLE IF EXISTS `entity_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_game` (
  `game_id` int(10) NOT NULL AUTO_INCREMENT,
  `pot_balance` int(10) DEFAULT NULL,
  `num_player` int(10) DEFAULT NULL,
  `init_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `status` (`status`),
  CONSTRAINT `entity_game_ibfk_1` FOREIGN KEY (`status`) REFERENCES `enum_game_status` (`enum_game_status`),
  CONSTRAINT `entity_game_ibfk_2` FOREIGN KEY (`status`) REFERENCES `enum_game_status` (`enum_game_status`),
  CONSTRAINT `entity_game_ibfk_3` FOREIGN KEY (`status`) REFERENCES `enum_game_status` (`enum_game_status`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_game`
--

LOCK TABLES `entity_game` WRITE;
/*!40000 ALTER TABLE `entity_game` DISABLE KEYS */;
INSERT INTO `entity_game` VALUES (1,NULL,2,'2019-11-12 10:40:37',NULL),(2,NULL,2,'2019-11-12 10:40:37',NULL),(3,NULL,2,'2019-11-12 10:40:37',NULL),(4,NULL,2,'2019-11-12 10:40:37',NULL),(5,NULL,2,'2019-11-12 10:40:37',NULL),(6,NULL,2,'2019-11-12 10:40:37',NULL),(7,NULL,2,'2019-11-12 10:40:37',NULL),(8,NULL,2,'2019-11-12 10:41:12',NULL),(9,NULL,2,'2019-11-12 10:43:01',NULL),(10,NULL,2,'2019-11-12 10:43:45',NULL),(11,NULL,2,'2019-11-12 10:44:12',NULL),(12,NULL,2,'2019-11-12 10:44:19',NULL),(13,NULL,2,'2019-11-12 10:44:24',NULL),(14,NULL,2,'2019-11-12 10:45:01',NULL),(15,NULL,2,'2019-11-12 10:46:09',NULL),(16,NULL,2,'2019-11-12 10:47:23',NULL),(17,NULL,2,'2019-11-12 10:48:07',NULL),(18,NULL,2,'2019-11-12 10:48:32',NULL),(19,NULL,2,'2019-11-12 10:50:52',NULL),(20,NULL,2,'2019-11-12 10:55:17',NULL),(21,NULL,2,'2019-11-12 10:55:50',NULL),(22,NULL,2,'2019-11-12 10:56:58',NULL),(23,NULL,2,'2019-11-12 10:58:01',NULL),(24,NULL,2,'2019-11-12 11:00:43',NULL),(25,NULL,2,'2019-11-12 11:00:52',NULL),(26,NULL,2,'2019-11-12 11:03:19',NULL),(27,NULL,2,'2019-11-12 17:04:56',NULL),(28,NULL,2,'2019-11-12 17:05:23',NULL),(29,NULL,2,'2019-11-12 17:06:18',NULL),(30,NULL,2,'2019-11-12 17:12:02',NULL),(31,NULL,2,'2019-11-12 17:13:05',NULL),(32,NULL,2,'2019-11-12 17:15:56',NULL),(33,NULL,2,'2019-11-12 17:16:34',NULL),(34,NULL,2,'2019-11-12 17:16:57',NULL),(35,NULL,2,'2019-11-12 17:17:39',NULL),(36,NULL,2,'2019-11-12 17:24:26',NULL),(37,NULL,2,'2019-11-12 17:25:57',NULL),(38,NULL,2,'2019-11-12 17:25:58',NULL),(39,NULL,2,'2019-11-12 17:26:19',NULL),(40,NULL,2,'2019-11-12 17:26:22',NULL),(41,NULL,2,'2019-11-12 17:27:11',NULL),(42,NULL,2,'2019-11-12 17:27:56',NULL),(43,NULL,2,'2019-11-12 17:29:37',NULL),(44,NULL,2,'2019-11-12 17:35:40',NULL),(45,NULL,2,'2019-11-12 17:40:14',NULL),(46,NULL,2,'2019-11-12 17:40:29',NULL),(47,NULL,2,'2019-11-12 17:49:17',NULL),(48,NULL,2,'2019-11-12 17:50:39',NULL),(49,NULL,2,'2019-11-12 17:51:44',NULL),(50,NULL,2,'2019-11-12 17:57:25',NULL),(51,NULL,2,'2019-11-12 17:57:41',NULL),(52,NULL,2,'2019-11-12 18:03:21',NULL),(53,NULL,2,'2019-11-12 18:05:09',NULL),(54,NULL,2,'2019-11-12 18:05:51',NULL),(55,NULL,2,'2019-11-12 18:07:14',NULL),(56,0,1,'2019-11-13 07:56:51',1);
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
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `balance` int(10) DEFAULT NULL,
  `reg_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(1) DEFAULT NULL,
  `logged_in` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `status` (`status`),
  KEY `logged_in` (`logged_in`),
  CONSTRAINT `entity_users_ibfk_1` FOREIGN KEY (`status`) REFERENCES `enum_status` (`status_num`),
  CONSTRAINT `entity_users_ibfk_10` FOREIGN KEY (`logged_in`) REFERENCES `enum_log_status` (`enum_log`),
  CONSTRAINT `entity_users_ibfk_2` FOREIGN KEY (`logged_in`) REFERENCES `enum_log_status` (`enum_log`),
  CONSTRAINT `entity_users_ibfk_3` FOREIGN KEY (`logged_in`) REFERENCES `enum_log_status` (`enum_log`),
  CONSTRAINT `entity_users_ibfk_4` FOREIGN KEY (`logged_in`) REFERENCES `enum_log_status` (`enum_log`),
  CONSTRAINT `entity_users_ibfk_5` FOREIGN KEY (`logged_in`) REFERENCES `enum_log_status` (`enum_log`),
  CONSTRAINT `entity_users_ibfk_6` FOREIGN KEY (`logged_in`) REFERENCES `enum_log_status` (`enum_log`),
  CONSTRAINT `entity_users_ibfk_7` FOREIGN KEY (`logged_in`) REFERENCES `enum_log_status` (`enum_log`),
  CONSTRAINT `entity_users_ibfk_8` FOREIGN KEY (`logged_in`) REFERENCES `enum_log_status` (`enum_log`),
  CONSTRAINT `entity_users_ibfk_9` FOREIGN KEY (`logged_in`) REFERENCES `enum_log_status` (`enum_log`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_users`
--

LOCK TABLES `entity_users` WRITE;
/*!40000 ALTER TABLE `entity_users` DISABLE KEYS */;
INSERT INTO `entity_users` VALUES (3,'blee55@student.rccd.edu','$2y$10$WE6X/VqXiNQZoFnEkgAsyOh.GvkKmuBdJcz9oFS2rfSnwyggNekdC',1000,'2019-11-13 07:54:27',1,1),(4,'libmo@hanmail.net','$2y$10$pG6Ra2TjzxI0bbcdZfzAHuQYLggms5USnAhnqVG08g9jIGSryfbgG',1000,'2019-11-13 07:29:32',0,0);
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
INSERT INTO `enum_game_status` VALUES (0,'terminated'),(1,'available to join'),(2,'not available');
/*!40000 ALTER TABLE `enum_game_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_log_status`
--

DROP TABLE IF EXISTS `enum_log_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enum_log_status` (
  `enum_log` int(10) NOT NULL,
  `log_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enum_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_log_status`
--

LOCK TABLES `enum_log_status` WRITE;
/*!40000 ALTER TABLE `enum_log_status` DISABLE KEYS */;
INSERT INTO `enum_log_status` VALUES (0,'Logged Out'),(1,'Logged In');
/*!40000 ALTER TABLE `enum_log_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_status`
--

DROP TABLE IF EXISTS `enum_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enum_status` (
  `status_num` int(1) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`status_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_status`
--

LOCK TABLES `enum_status` WRITE;
/*!40000 ALTER TABLE `enum_status` DISABLE KEYS */;
INSERT INTO `enum_status` VALUES (0,'Inactive'),(1,'Active');
/*!40000 ALTER TABLE `enum_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `game_status`
--

DROP TABLE IF EXISTS `game_status`;
/*!50001 DROP VIEW IF EXISTS `game_status`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `game_status` (
  `game_id` tinyint NOT NULL,
  `enum_game_status` tinyint NOT NULL,
  `game_status` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `player_num` tinyint NOT NULL,
  `user_status` tinyint NOT NULL,
  `num_of_players` tinyint NOT NULL,
  `player_name` tinyint NOT NULL,
  `player_balance` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `xref_card_dist`
--

DROP TABLE IF EXISTS `xref_card_dist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_card_dist` (
  `card_dist_num` int(10) NOT NULL AUTO_INCREMENT,
  `card_num` int(10) DEFAULT NULL,
  `user_num` int(10) DEFAULT NULL,
  PRIMARY KEY (`card_dist_num`),
  KEY `card_num` (`card_num`),
  KEY `user_num` (`user_num`),
  CONSTRAINT `xref_card_dist_ibfk_1` FOREIGN KEY (`card_num`) REFERENCES `entity_cards` (`card_num`),
  CONSTRAINT `xref_card_dist_ibfk_2` FOREIGN KEY (`user_num`) REFERENCES `entity_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_card_dist`
--

LOCK TABLES `xref_card_dist` WRITE;
/*!40000 ALTER TABLE `xref_card_dist` DISABLE KEYS */;
/*!40000 ALTER TABLE `xref_card_dist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_pot_transaction`
--

DROP TABLE IF EXISTS `xref_pot_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_pot_transaction` (
  `transaction_num` int(10) NOT NULL AUTO_INCREMENT,
  `game_num` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `player_num` int(7) DEFAULT NULL,
  PRIMARY KEY (`transaction_num`),
  KEY `game_num` (`game_num`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `xref_pot_transaction_ibfk_1` FOREIGN KEY (`game_num`) REFERENCES `entity_game` (`game_id`),
  CONSTRAINT `xref_pot_transaction_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_pot_transaction`
--

LOCK TABLES `xref_pot_transaction` WRITE;
/*!40000 ALTER TABLE `xref_pot_transaction` DISABLE KEYS */;
INSERT INTO `xref_pot_transaction` VALUES (1,56,3,NULL,0),(2,56,4,NULL,0),(3,56,4,NULL,0),(4,56,3,NULL,1),(5,56,3,NULL,2),(6,56,3,NULL,3),(7,56,3,NULL,4),(8,56,3,NULL,5),(9,56,3,NULL,6),(10,56,3,NULL,7),(11,56,3,NULL,0),(12,56,3,NULL,1),(13,56,3,NULL,2),(14,56,3,NULL,0);
/*!40000 ALTER TABLE `xref_pot_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `game_status`
--

/*!50001 DROP TABLE IF EXISTS `game_status`*/;
/*!50001 DROP VIEW IF EXISTS `game_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `game_status` AS select `entity_game`.`game_id` AS `game_id`,`entity_game`.`status` AS `enum_game_status`,`enum_game_status`.`game_status` AS `game_status`,`xref_pot_transaction`.`user_id` AS `user_id`,`xref_pot_transaction`.`player_num` AS `player_num`,`entity_users`.`status` AS `user_status`,`entity_game`.`num_player` AS `num_of_players`,`entity_users`.`email` AS `player_name`,`entity_users`.`balance` AS `player_balance` from (((`xref_pot_transaction` join `entity_game`) join `entity_users`) join `enum_game_status`) where `xref_pot_transaction`.`game_num` = `entity_game`.`game_id` and `xref_pot_transaction`.`user_id` = `entity_users`.`user_id` and `entity_game`.`status` = `enum_game_status`.`enum_game_status` */;
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

-- Dump completed on 2019-11-13 10:52:39
