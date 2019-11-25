-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: upload3
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
-- Table structure for table `blee_texasholdem_entity_cards`
--

DROP TABLE IF EXISTS `blee_texasholdem_entity_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_texasholdem_entity_cards` (
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
-- Dumping data for table `blee_texasholdem_entity_cards`
--

LOCK TABLES `blee_texasholdem_entity_cards` WRITE;
/*!40000 ALTER TABLE `blee_texasholdem_entity_cards` DISABLE KEYS */;
INSERT INTO `blee_texasholdem_entity_cards` VALUES (0,14,'Ace',0,'Spades','Cards/acespades.jpg'),(1,2,'Two',0,'Spades','Cards/twospades.jpg'),(2,3,'Three',0,'Spades','Cards/threespades.jpg'),(3,4,'Four',0,'Spades','Cards/fourspades.jpg'),(4,5,'Five',0,'Spades','Cards/fivespades.jpg'),(5,6,'Six',0,'Spades','Cards/sixspades.jpg'),(6,7,'Seven',0,'Spades','Cards/sevenspades.jpg'),(7,8,'Eight',0,'Spades','Cards/eightspades.jpg'),(8,9,'Nine',0,'Spades','Cards/ninespades.jpg'),(9,10,'Ten',0,'Spades','Cards/tenspades.jpg'),(10,11,'Jack',0,'Spades','Cards/jackspades.jpg'),(11,12,'Queen',0,'Spades','Cards/queenspades.jpg'),(12,13,'King',0,'Spades','Cards/kingspades.jpg'),(13,14,'Ace',1,'Hearts','Cards/acehearts.jpg'),(14,2,'Two',1,'Hearts','Cards/twohearts.jpg'),(15,3,'Three',1,'Hearts','Cards/threehearts.jpg'),(16,4,'Four',1,'Hearts','Cards/fourhearts.jpg'),(17,5,'Five',1,'Hearts','Cards/fivehearts.jpg'),(18,6,'Six',1,'Hearts','Cards/sixhearts.jpg'),(19,7,'Seven',1,'Hearts','Cards/sevenhearts.jpg'),(20,8,'Eight',1,'Hearts','Cards/eighthearts.jpg'),(21,9,'Nine',1,'Hearts','Cards/ninehearts.jpg'),(22,10,'Ten',1,'Hearts','Cards/tenhearts.jpg'),(23,11,'Jack',1,'Hearts','Cards/jackhearts.jpg'),(24,12,'Queen',1,'Hearts','Cards/queenhearts.jpg'),(25,13,'King',1,'Hearts','Cards/kinghearts.jpg'),(26,14,'Ace',2,'Diamonds','Cards/acediamonds.jpg'),(27,2,'Two',2,'Diamonds','Cards/twodiamonds.jpg'),(28,3,'Three',2,'Diamonds','Cards/threediamonds.jpg'),(29,4,'Four',2,'Diamonds','Cards/fourdiamonds.jpg'),(30,5,'Five',2,'Diamonds','Cards/fivediamonds.jpg'),(31,6,'Six',2,'Diamonds','Cards/sixdiamonds.jpg'),(32,7,'Seven',2,'Diamonds','Cards/sevendiamonds.jpg'),(33,8,'Eight',2,'Diamonds','Cards/eightdiamonds.jpg'),(34,9,'Nine',2,'Diamonds','Cards/ninediamonds.jpg'),(35,10,'Ten',2,'Diamonds','Cards/tendiamonds.jpg'),(36,11,'Jack',2,'Diamonds','Cards/jackdiamonds.jpg'),(37,12,'Queen',2,'Diamonds','Cards/queendiamonds.jpg'),(38,13,'King',2,'Diamonds','Cards/kingdiamonds.jpg'),(39,14,'Ace',3,'Clubs','Cards/aceclubs.jpg'),(40,2,'Two',3,'Clubs','Cards/twoclubs.jpg'),(41,3,'Three',3,'Clubs','Cards/threeclubs.jpg'),(42,4,'Four',3,'Clubs','Cards/fourclubs.jpg'),(43,5,'Five',3,'Clubs','Cards/fiveclubs.jpg'),(44,6,'Six',3,'Clubs','Cards/sixclubs.jpg'),(45,7,'Seven',3,'Clubs','Cards/sevenclubs.jpg'),(46,8,'Eight',3,'Clubs','Cards/eightclubs.jpg'),(47,9,'Nine',3,'Clubs','Cards/nineclubs.jpg'),(48,10,'Ten',3,'Clubs','Cards/tenclubs.jpg'),(49,11,'Jack',3,'Clubs','Cards/jackclubs.jpg'),(50,12,'Queen',3,'Clubs','Cards/queenclubs.jpg'),(51,13,'King',3,'Clubs','Cards/kingclubs.jpg');
/*!40000 ALTER TABLE `blee_texasholdem_entity_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_texasholdem_entity_game`
--

DROP TABLE IF EXISTS `blee_texasholdem_entity_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_texasholdem_entity_game` (
  `game_id` int(10) NOT NULL AUTO_INCREMENT,
  `pot_balance` int(10) DEFAULT NULL,
  `init_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_texasholdem_entity_game`
--

LOCK TABLES `blee_texasholdem_entity_game` WRITE;
/*!40000 ALTER TABLE `blee_texasholdem_entity_game` DISABLE KEYS */;
INSERT INTO `blee_texasholdem_entity_game` VALUES (58,0,'2019-11-22 05:35:18',1);
/*!40000 ALTER TABLE `blee_texasholdem_entity_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_texasholdem_entity_message_board`
--

DROP TABLE IF EXISTS `blee_texasholdem_entity_message_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_texasholdem_entity_message_board` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `game_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `msg_loc` varchar(50) DEFAULT NULL,
  `hands` int(10) DEFAULT NULL,
  `result` int(10) DEFAULT NULL,
  PRIMARY KEY (`msg_id`),
  KEY `game_id` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_texasholdem_entity_message_board`
--

LOCK TABLES `blee_texasholdem_entity_message_board` WRITE;
/*!40000 ALTER TABLE `blee_texasholdem_entity_message_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `blee_texasholdem_entity_message_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_texasholdem_entity_users`
--

DROP TABLE IF EXISTS `blee_texasholdem_entity_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_texasholdem_entity_users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `balance` int(10) DEFAULT NULL,
  `reg_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(1) DEFAULT NULL,
  `logged_in` int(10) DEFAULT NULL,
  `p_id` int(2) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `status` (`status`),
  KEY `logged_in` (`logged_in`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_texasholdem_entity_users`
--

LOCK TABLES `blee_texasholdem_entity_users` WRITE;
/*!40000 ALTER TABLE `blee_texasholdem_entity_users` DISABLE KEYS */;
INSERT INTO `blee_texasholdem_entity_users` VALUES (3,'blee12','$2y$10$WE6X/VqXiNQZoFnEkgAsyOh.GvkKmuBdJcz9oFS2rfSnwyggNekdC',1000,'2019-11-23 14:05:55',1,1,-1),(4,'libmo34','$2y$10$pG6Ra2TjzxI0bbcdZfzAHuQYLggms5USnAhnqVG08g9jIGSryfbgG',1000,'2019-11-23 14:06:01',1,1,-1);
/*!40000 ALTER TABLE `blee_texasholdem_entity_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_texasholdem_enum_game_status`
--

DROP TABLE IF EXISTS `blee_texasholdem_enum_game_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_texasholdem_enum_game_status` (
  `enum_game_status` int(10) NOT NULL,
  `game_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enum_game_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_texasholdem_enum_game_status`
--

LOCK TABLES `blee_texasholdem_enum_game_status` WRITE;
/*!40000 ALTER TABLE `blee_texasholdem_enum_game_status` DISABLE KEYS */;
INSERT INTO `blee_texasholdem_enum_game_status` VALUES (0,'terminated'),(1,'available to join'),(2,'not available');
/*!40000 ALTER TABLE `blee_texasholdem_enum_game_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_texasholdem_enum_log_status`
--

DROP TABLE IF EXISTS `blee_texasholdem_enum_log_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_texasholdem_enum_log_status` (
  `enum_log` int(10) NOT NULL,
  `log_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enum_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_texasholdem_enum_log_status`
--

LOCK TABLES `blee_texasholdem_enum_log_status` WRITE;
/*!40000 ALTER TABLE `blee_texasholdem_enum_log_status` DISABLE KEYS */;
INSERT INTO `blee_texasholdem_enum_log_status` VALUES (0,'Logged Out'),(1,'Logged In');
/*!40000 ALTER TABLE `blee_texasholdem_enum_log_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_texasholdem_enum_status`
--

DROP TABLE IF EXISTS `blee_texasholdem_enum_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_texasholdem_enum_status` (
  `status_num` int(1) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`status_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_texasholdem_enum_status`
--

LOCK TABLES `blee_texasholdem_enum_status` WRITE;
/*!40000 ALTER TABLE `blee_texasholdem_enum_status` DISABLE KEYS */;
INSERT INTO `blee_texasholdem_enum_status` VALUES (0,'Inactive'),(1,'Active');
/*!40000 ALTER TABLE `blee_texasholdem_enum_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_texasholdem_xref_card_dist`
--

DROP TABLE IF EXISTS `blee_texasholdem_xref_card_dist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_texasholdem_xref_card_dist` (
  `card_dist_num` int(10) NOT NULL AUTO_INCREMENT,
  `card_num` int(10) DEFAULT NULL,
  `user_num` int(10) DEFAULT NULL,
  `img_loc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`card_dist_num`),
  KEY `card_num` (`card_num`),
  KEY `user_num` (`user_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_texasholdem_xref_card_dist`
--

LOCK TABLES `blee_texasholdem_xref_card_dist` WRITE;
/*!40000 ALTER TABLE `blee_texasholdem_xref_card_dist` DISABLE KEYS */;
/*!40000 ALTER TABLE `blee_texasholdem_xref_card_dist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_texasholdem_xref_pot_transaction`
--

DROP TABLE IF EXISTS `blee_texasholdem_xref_pot_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_texasholdem_xref_pot_transaction` (
  `transaction_num` int(10) NOT NULL AUTO_INCREMENT,
  `game_num` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `msg_loc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`transaction_num`),
  KEY `game_num` (`game_num`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_texasholdem_xref_pot_transaction`
--

LOCK TABLES `blee_texasholdem_xref_pot_transaction` WRITE;
/*!40000 ALTER TABLE `blee_texasholdem_xref_pot_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `blee_texasholdem_xref_pot_transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-24 22:07:19
