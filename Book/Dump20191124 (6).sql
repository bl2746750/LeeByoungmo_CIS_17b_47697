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
  `init_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `status` (`status`),
  CONSTRAINT `entity_game_ibfk_1` FOREIGN KEY (`status`) REFERENCES `enum_game_status` (`enum_game_status`),
  CONSTRAINT `entity_game_ibfk_2` FOREIGN KEY (`status`) REFERENCES `enum_game_status` (`enum_game_status`),
  CONSTRAINT `entity_game_ibfk_3` FOREIGN KEY (`status`) REFERENCES `enum_game_status` (`enum_game_status`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_game`
--

LOCK TABLES `entity_game` WRITE;
/*!40000 ALTER TABLE `entity_game` DISABLE KEYS */;
INSERT INTO `entity_game` VALUES (58,0,'2019-11-22 05:35:18',1);
/*!40000 ALTER TABLE `entity_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_message_board`
--

DROP TABLE IF EXISTS `entity_message_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_message_board` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `game_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `msg_loc` varchar(50) DEFAULT NULL,
  `hands` int(10) DEFAULT NULL,
  `result` int(10) DEFAULT NULL,
  PRIMARY KEY (`msg_id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `entity_message_board_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `entity_game` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_message_board`
--

LOCK TABLES `entity_message_board` WRITE;
/*!40000 ALTER TABLE `entity_message_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_message_board` ENABLE KEYS */;
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
  `p_id` int(2) DEFAULT NULL,
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
INSERT INTO `entity_users` VALUES (3,'blee12','$2y$10$WE6X/VqXiNQZoFnEkgAsyOh.GvkKmuBdJcz9oFS2rfSnwyggNekdC',1000,'2019-11-23 14:05:55',1,1,-1),(4,'libmo34','$2y$10$pG6Ra2TjzxI0bbcdZfzAHuQYLggms5USnAhnqVG08g9jIGSryfbgG',1000,'2019-11-23 14:06:01',1,1,-1);
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
-- Table structure for table `xref_card_dist`
--

DROP TABLE IF EXISTS `xref_card_dist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_card_dist` (
  `card_dist_num` int(10) NOT NULL AUTO_INCREMENT,
  `card_num` int(10) DEFAULT NULL,
  `user_num` int(10) DEFAULT NULL,
  `img_loc` varchar(50) DEFAULT NULL,
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
  `msg_loc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`transaction_num`),
  KEY `game_num` (`game_num`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `xref_pot_transaction_ibfk_1` FOREIGN KEY (`game_num`) REFERENCES `entity_game` (`game_id`),
  CONSTRAINT `xref_pot_transaction_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_pot_transaction`
--

LOCK TABLES `xref_pot_transaction` WRITE;
/*!40000 ALTER TABLE `xref_pot_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `xref_pot_transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-24 21:57:53
-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: survey
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
-- Table structure for table `entity_questions`
--

DROP TABLE IF EXISTS `entity_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) NOT NULL,
  `answers` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_questions`
--

LOCK TABLES `entity_questions` WRITE;
/*!40000 ALTER TABLE `entity_questions` DISABLE KEYS */;
INSERT INTO `entity_questions` VALUES (45,'	test1','[\"test11\",\"test22\"]'),(46,'	test2','[\"test(1)\",\"test(2)\"]');
/*!40000 ALTER TABLE `entity_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_survey`
--

DROP TABLE IF EXISTS `entity_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_survey` (
  `survey_id` int(10) NOT NULL AUTO_INCREMENT,
  `survey_name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `session` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_survey`
--

LOCK TABLES `entity_survey` WRITE;
/*!40000 ALTER TABLE `entity_survey` DISABLE KEYS */;
INSERT INTO `entity_survey` VALUES (1,'test','test survey','2019-11-10','2019-11-11',NULL),(2,'test2','test2','2019-11-11','2019-11-12',NULL),(3,'','','0000-00-00','0000-00-00',NULL),(4,'','','0000-00-00','0000-00-00',NULL),(5,'','','0000-00-00','0000-00-00',NULL),(6,'','','0000-00-00','0000-00-00',NULL);
/*!40000 ALTER TABLE `entity_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_users`
--

DROP TABLE IF EXISTS `entity_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_users` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sign_up_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin` (`admin`),
  CONSTRAINT `entity_users_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `enum_admin` (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_users`
--

LOCK TABLES `entity_users` WRITE;
/*!40000 ALTER TABLE `entity_users` DISABLE KEYS */;
INSERT INTO `entity_users` VALUES (3,'blee55@student.rccd.edu','$2y$10$XBvpStIdqi1z1HyYCtgh/OGT3uNnrAF/EL.IsuN7yOFuxnoigq1iq','2019-11-10 07:24:12',1),(6,'libmo@hanmail.net','$2y$10$VzTlcHx5dVp4lZqVYVWGXu2gNK.k5CjeXBrB9PV3HErfzsnUGmSu2','2019-11-10 07:23:19',NULL);
/*!40000 ALTER TABLE `entity_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_admin`
--

DROP TABLE IF EXISTS `enum_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enum_admin` (
  `num` int(10) NOT NULL,
  `description` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_admin`
--

LOCK TABLES `enum_admin` WRITE;
/*!40000 ALTER TABLE `enum_admin` DISABLE KEYS */;
INSERT INTO `enum_admin` VALUES (0,'user'),(1,'admin');
/*!40000 ALTER TABLE `enum_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_answer`
--

DROP TABLE IF EXISTS `xref_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_answer` (
  `answer_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `question_id` int(10) DEFAULT NULL,
  `answer` int(7) DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `question_id` (`question_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `xref_answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `entity_questions` (`id`),
  CONSTRAINT `xref_answer_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`id`),
  CONSTRAINT `xref_answer_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `entity_questions` (`id`),
  CONSTRAINT `xref_answer_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_answer`
--

LOCK TABLES `xref_answer` WRITE;
/*!40000 ALTER TABLE `xref_answer` DISABLE KEYS */;
INSERT INTO `xref_answer` VALUES (59,3,45,0),(60,3,45,0),(61,3,45,0),(62,3,46,0),(63,3,45,0),(64,3,46,0);
/*!40000 ALTER TABLE `xref_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_survey_question`
--

DROP TABLE IF EXISTS `xref_survey_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_survey_question` (
  `survey_reg_num` int(10) NOT NULL AUTO_INCREMENT,
  `survey_num` int(10) DEFAULT NULL,
  `question_num` int(10) DEFAULT NULL,
  PRIMARY KEY (`survey_reg_num`),
  KEY `question_num` (`question_num`),
  KEY `survey_num` (`survey_num`),
  CONSTRAINT `xref_survey_question_ibfk_1` FOREIGN KEY (`question_num`) REFERENCES `entity_questions` (`id`),
  CONSTRAINT `xref_survey_question_ibfk_2` FOREIGN KEY (`survey_num`) REFERENCES `entity_survey` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_survey_question`
--

LOCK TABLES `xref_survey_question` WRITE;
/*!40000 ALTER TABLE `xref_survey_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `xref_survey_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_survey_users`
--

DROP TABLE IF EXISTS `xref_survey_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_survey_users` (
  `survey_user_reg_num` int(10) NOT NULL AUTO_INCREMENT,
  `survey_num` int(10) DEFAULT NULL,
  `user_num` int(7) DEFAULT NULL,
  PRIMARY KEY (`survey_user_reg_num`),
  KEY `user_num` (`user_num`),
  KEY `survey_num` (`survey_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_survey_users`
--

LOCK TABLES `xref_survey_users` WRITE;
/*!40000 ALTER TABLE `xref_survey_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `xref_survey_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-24 21:57:53
-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: shopping_mall
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
-- Table structure for table `entity_products`
--

DROP TABLE IF EXISTS `entity_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_products` (
  `product_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(250) DEFAULT NULL,
  `price` decimal(16,0) DEFAULT NULL,
  `num_of_stock` int(10) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_img` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_products`
--

LOCK TABLES `entity_products` WRITE;
/*!40000 ALTER TABLE `entity_products` DISABLE KEYS */;
INSERT INTO `entity_products` VALUES (1,'1366107','New Apple MacBook Pro 13.3\" with Touch Bar - Intel Core i5 - 8GB Memory - 256GB SSD - Space Gray',1200,62,'2019-11-11 19:09:40','images/1.jfif'),(2,'1373148','HP 14\" Laptop 10th Gen Intel Core i5 - 1080p',400,62,'2019-11-11 19:09:40','images/2.jfif'),(3,'1366105','New Apple MacBook Pro 13.3\" with Touch Bar - Intel Core i5 - 8GB Memory - 128GB SSD - Space Gray',1000,98,'2019-11-11 19:09:40','images/3.jfif'),(4,'1373095','Dell Inspiron 17 Laptop - 10th Gen Intel Core i7-1065G7 - GeForce MX230 - 1080p',800,29,'2019-11-11 19:09:40','images/4.jfif'),(5,'1273996','HP 14\" Laptop - Intel Core i5',580,80,'2019-11-11 19:09:40','images/5.jfif'),(6,'1366113','New Apple MacBook Pro 13.3\" with Touch Bar - Intel Core i5 - 8GB Memory - 256GB SSD - Silver',1200,10,'2019-11-11 19:09:40','images/6.jfif'),(7,'1374520','Lenovo Flex 14 2-in-1 Touchscreen Laptop - Ryzen 7 - 1080p',550,60,'2019-11-11 19:09:40','images/7.jfif'),(8,'1267254','HP Pavilion x360 14\" Touchscreen 2-in-1 Laptop - Intel Core i5 - 1080p',500,99,'2019-11-11 19:09:40','images/8.jfif'),(9,'1327140','Dell Inspiron 14 5000 Series 2-in-1 Touchscreen Laptop - AMD Ryzen 5 - 1080p',400,37,'2019-11-11 19:09:40','images/9.jfif'),(10,'1275691','Microsoft Surface Pro 6 Bundle - Intel Core i5 - 2736 x 1824 Display - Black Surface Pro Type Cover',850,77,'2019-11-11 19:09:40','images/10.jfif'),(11,'1373418','LG Gram 17\" Laptop - Intel Core i7 - WQXGA (2560 x 1600) - Ultra Thin and Light at 2.95lbs',1500,37,'2019-11-11 19:09:40','images/11.jfif');
/*!40000 ALTER TABLE `entity_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_suppliers`
--

DROP TABLE IF EXISTS `entity_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_suppliers` (
  `supplier_id` int(10) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(50) DEFAULT NULL,
  `contact_name` varchar(200) DEFAULT NULL,
  `phone_num` int(10) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_suppliers`
--

LOCK TABLES `entity_suppliers` WRITE;
/*!40000 ALTER TABLE `entity_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_users`
--

DROP TABLE IF EXISTS `entity_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_users` (
  `user_num` int(10) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_phone_number` int(10) DEFAULT NULL,
  `user_address` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`user_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_users`
--

LOCK TABLES `entity_users` WRITE;
/*!40000 ALTER TABLE `entity_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_sales_status`
--

DROP TABLE IF EXISTS `enum_sales_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enum_sales_status` (
  `enum_sold_status` int(10) NOT NULL,
  `sold_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enum_sold_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_sales_status`
--

LOCK TABLES `enum_sales_status` WRITE;
/*!40000 ALTER TABLE `enum_sales_status` DISABLE KEYS */;
INSERT INTO `enum_sales_status` VALUES (0,'Ordered'),(1,'Sold');
/*!40000 ALTER TABLE `enum_sales_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_receiving`
--

DROP TABLE IF EXISTS `xref_receiving`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_receiving` (
  `receiving_id` int(10) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `receiving_qnty` int(10) DEFAULT NULL,
  `cost_per_prod` decimal(16,0) DEFAULT NULL,
  `receiving_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`receiving_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `xref_receiving_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `entity_suppliers` (`supplier_id`),
  CONSTRAINT `xref_receiving_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `entity_products` (`product_id`),
  CONSTRAINT `xref_receiving_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `entity_suppliers` (`supplier_id`),
  CONSTRAINT `xref_receiving_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `entity_products` (`product_id`),
  CONSTRAINT `xref_receiving_ibfk_5` FOREIGN KEY (`supplier_id`) REFERENCES `entity_suppliers` (`supplier_id`),
  CONSTRAINT `xref_receiving_ibfk_6` FOREIGN KEY (`product_id`) REFERENCES `entity_products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_receiving`
--

LOCK TABLES `xref_receiving` WRITE;
/*!40000 ALTER TABLE `xref_receiving` DISABLE KEYS */;
/*!40000 ALTER TABLE `xref_receiving` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_sold`
--

DROP TABLE IF EXISTS `xref_sold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_sold` (
  `sold_num` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `price_per_item` decimal(16,0) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `total_paid` decimal(16,0) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `sold_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`sold_num`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  CONSTRAINT `xref_sold_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `entity_products` (`product_id`),
  CONSTRAINT `xref_sold_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`user_num`),
  CONSTRAINT `xref_sold_ibfk_3` FOREIGN KEY (`status`) REFERENCES `enum_sales_status` (`enum_sold_status`),
  CONSTRAINT `xref_sold_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `entity_products` (`product_id`),
  CONSTRAINT `xref_sold_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`user_num`),
  CONSTRAINT `xref_sold_ibfk_6` FOREIGN KEY (`status`) REFERENCES `enum_sales_status` (`enum_sold_status`),
  CONSTRAINT `xref_sold_ibfk_7` FOREIGN KEY (`product_id`) REFERENCES `entity_products` (`product_id`),
  CONSTRAINT `xref_sold_ibfk_8` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`user_num`),
  CONSTRAINT `xref_sold_ibfk_9` FOREIGN KEY (`status`) REFERENCES `enum_sales_status` (`enum_sold_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_sold`
--

LOCK TABLES `xref_sold` WRITE;
/*!40000 ALTER TABLE `xref_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `xref_sold` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-24 21:57:54
