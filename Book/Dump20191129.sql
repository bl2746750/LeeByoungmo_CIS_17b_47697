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
  `game_object` text DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `status` (`status`),
  CONSTRAINT `entity_game_ibfk_1` FOREIGN KEY (`status`) REFERENCES `enum_game_status` (`enum_game_status`),
  CONSTRAINT `entity_game_ibfk_2` FOREIGN KEY (`status`) REFERENCES `enum_game_status` (`enum_game_status`),
  CONSTRAINT `entity_game_ibfk_3` FOREIGN KEY (`status`) REFERENCES `enum_game_status` (`enum_game_status`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_game`
--

LOCK TABLES `entity_game` WRITE;
/*!40000 ALTER TABLE `entity_game` DISABLE KEYS */;
INSERT INTO `entity_game` VALUES (58,0,'2019-11-29 01:47:29',0,NULL),(59,0,'2019-11-29 10:56:40',2,'O:4:\"Deal\":10:{s:13:\"\0Deal\0game_id\";s:2:\"59\";s:14:\"\0Deal\0nPlayers\";i:2;s:14:\"\0Deal\0activeNP\";i:2;s:7:\"players\";a:2:{i:0;O:6:\"Player\":8:{s:12:\"\0Player\0p_id\";i:0;s:12:\"\0Player\0u_id\";s:1:\"3\";s:13:\"\0Player\0pName\";s:6:\"blee12\";s:16:\"\0Player\0nBalance\";s:4:\"1000\";s:15:\"\0Player\0myCards\";a:2:{i:0;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:22;s:11:\"\0Card\0nFace\";i:10;s:11:\"\0Card\0nSuit\";i:1;s:15:\"\0Card\0sFaceName\";s:3:\"ten\";s:15:\"\0Card\0sSuitName\";s:6:\"hearts\";s:11:\"\0Card\0sPict\";s:19:\"Cards/tenhearts.jpg\";}i:1;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:0;s:11:\"\0Card\0nFace\";i:14;s:11:\"\0Card\0nSuit\";i:0;s:15:\"\0Card\0sFaceName\";s:3:\"ace\";s:15:\"\0Card\0sSuitName\";s:6:\"spades\";s:11:\"\0Card\0sPict\";s:19:\"Cards/acespades.jpg\";}}s:14:\"\0Player\0active\";i:1;s:16:\"\0Player\0user_loc\";a:2:{i:0;s:3:\"001\";i:1;s:3:\"002\";}s:24:\"\0Player\0user_message_loc\";s:3:\"000\";}i:1;O:6:\"Player\":8:{s:12:\"\0Player\0p_id\";i:1;s:12:\"\0Player\0u_id\";s:1:\"4\";s:13:\"\0Player\0pName\";s:7:\"libmo34\";s:16:\"\0Player\0nBalance\";s:4:\"1000\";s:15:\"\0Player\0myCards\";a:2:{i:0;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:46;s:11:\"\0Card\0nFace\";i:8;s:11:\"\0Card\0nSuit\";i:3;s:15:\"\0Card\0sFaceName\";s:5:\"eight\";s:15:\"\0Card\0sSuitName\";s:5:\"clubs\";s:11:\"\0Card\0sPict\";s:20:\"Cards/eightclubs.jpg\";}i:1;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:21;s:11:\"\0Card\0nFace\";i:9;s:11:\"\0Card\0nSuit\";i:1;s:15:\"\0Card\0sFaceName\";s:4:\"nine\";s:15:\"\0Card\0sSuitName\";s:6:\"hearts\";s:11:\"\0Card\0sPict\";s:20:\"Cards/ninehearts.jpg\";}}s:14:\"\0Player\0active\";i:1;s:16:\"\0Player\0user_loc\";a:2:{i:0;s:3:\"005\";i:1;s:3:\"006\";}s:24:\"\0Player\0user_message_loc\";s:3:\"004\";}}s:12:\"\0Deal\0dCards\";a:52:{i:0;r:37;i:1;r:12;i:2;r:44;i:3;r:19;i:4;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:51;s:11:\"\0Card\0nFace\";i:13;s:11:\"\0Card\0nSuit\";i:3;s:15:\"\0Card\0sFaceName\";s:4:\"king\";s:15:\"\0Card\0sSuitName\";s:5:\"clubs\";s:11:\"\0Card\0sPict\";s:19:\"Cards/kingclubs.jpg\";}i:5;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:38;s:11:\"\0Card\0nFace\";i:13;s:11:\"\0Card\0nSuit\";i:2;s:15:\"\0Card\0sFaceName\";s:4:\"king\";s:15:\"\0Card\0sSuitName\";s:8:\"diamonds\";s:11:\"\0Card\0sPict\";s:22:\"Cards/kingdiamonds.jpg\";}i:6;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:44;s:11:\"\0Card\0nFace\";i:6;s:11:\"\0Card\0nSuit\";i:3;s:15:\"\0Card\0sFaceName\";s:3:\"six\";s:15:\"\0Card\0sSuitName\";s:5:\"clubs\";s:11:\"\0Card\0sPict\";s:18:\"Cards/sixclubs.jpg\";}i:7;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:14;s:11:\"\0Card\0nFace\";i:2;s:11:\"\0Card\0nSuit\";i:1;s:15:\"\0Card\0sFaceName\";s:3:\"two\";s:15:\"\0Card\0sSuitName\";s:6:\"hearts\";s:11:\"\0Card\0sPict\";s:19:\"Cards/twohearts.jpg\";}i:8;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:19;s:11:\"\0Card\0nFace\";i:7;s:11:\"\0Card\0nSuit\";i:1;s:15:\"\0Card\0sFaceName\";s:5:\"seven\";s:15:\"\0Card\0sSuitName\";s:6:\"hearts\";s:11:\"\0Card\0sPict\";s:21:\"Cards/sevenhearts.jpg\";}i:9;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:12;s:11:\"\0Card\0nFace\";i:13;s:11:\"\0Card\0nSuit\";i:0;s:15:\"\0Card\0sFaceName\";s:4:\"king\";s:15:\"\0Card\0sSuitName\";s:6:\"spades\";s:11:\"\0Card\0sPict\";s:20:\"Cards/kingspades.jpg\";}i:10;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:2;s:11:\"\0Card\0nFace\";i:3;s:11:\"\0Card\0nSuit\";i:0;s:15:\"\0Card\0sFaceName\";s:5:\"three\";s:15:\"\0Card\0sSuitName\";s:6:\"spades\";s:11:\"\0Card\0sPict\";s:21:\"Cards/threespades.jpg\";}i:11;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:36;s:11:\"\0Card\0nFace\";i:11;s:11:\"\0Card\0nSuit\";i:2;s:15:\"\0Card\0sFaceName\";s:4:\"jack\";s:15:\"\0Card\0sSuitName\";s:8:\"diamonds\";s:11:\"\0Card\0sPict\";s:22:\"Cards/jackdiamonds.jpg\";}i:12;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:30;s:11:\"\0Card\0nFace\";i:5;s:11:\"\0Card\0nSuit\";i:2;s:15:\"\0Card\0sFaceName\";s:4:\"five\";s:15:\"\0Card\0sSuitName\";s:8:\"diamonds\";s:11:\"\0Card\0sPict\";s:22:\"Cards/fivediamonds.jpg\";}i:13;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:13;s:11:\"\0Card\0nFace\";i:14;s:11:\"\0Card\0nSuit\";i:1;s:15:\"\0Card\0sFaceName\";s:3:\"ace\";s:15:\"\0Card\0sSuitName\";s:6:\"hearts\";s:11:\"\0Card\0sPict\";s:19:\"Cards/acehearts.jpg\";}i:14;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:34;s:11:\"\0Card\0nFace\";i:9;s:11:\"\0Card\0nSuit\";i:2;s:15:\"\0Card\0sFaceName\";s:4:\"nine\";s:15:\"\0Card\0sSuitName\";s:8:\"diamonds\";s:11:\"\0Card\0sPict\";s:22:\"Cards/ninediamonds.jpg\";}i:15;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:31;s:11:\"\0Card\0nFace\";i:6;s:11:\"\0Card\0nSuit\";i:2;s:15:\"\0Card\0sFaceName\";s:3:\"six\";s:15:\"\0Card\0sSuitName\";s:8:\"diamonds\";s:11:\"\0Card\0sPict\";s:21:\"Cards/sixdiamonds.jpg\";}i:16;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:29;s:11:\"\0Card\0nFace\";i:4;s:11:\"\0Card\0nSuit\";i:2;s:15:\"\0Card\0sFaceName\";s:4:\"four\";s:15:\"\0Card\0sSuitName\";s:8:\"diamonds\";s:11:\"\0Card\0sPict\";s:22:\"Cards/fourdiamonds.jpg\";}i:17;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:6;s:11:\"\0Card\0nFace\";i:7;s:11:\"\0Card\0nSuit\";i:0;s:15:\"\0Card\0sFaceName\";s:5:\"seven\";s:15:\"\0Card\0sSuitName\";s:6:\"spades\";s:11:\"\0Card\0sPict\";s:21:\"Cards/sevenspades.jpg\";}i:18;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:26;s:11:\"\0Card\0nFace\";i:14;s:11:\"\0Card\0nSuit\";i:2;s:15:\"\0Card\0sFaceName\";s:3:\"ace\";s:15:\"\0Card\0sSuitName\";s:8:\"diamonds\";s:11:\"\0Card\0sPict\";s:21:\"Cards/acediamonds.jpg\";}i:19;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:1;s:11:\"\0Card\0nFace\";i:2;s:11:\"\0Card\0nSuit\";i:0;s:15:\"\0Card\0sFaceName\";s:3:\"two\";s:15:\"\0Card\0sSuitName\";s:6:\"spades\";s:11:\"\0Card\0sPict\";s:19:\"Cards/twospades.jpg\";}i:20;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:50;s:11:\"\0Card\0nFace\";i:12;s:11:\"\0Card\0nSuit\";i:3;s:15:\"\0Card\0sFaceName\";s:5:\"queen\";s:15:\"\0Card\0sSuitName\";s:5:\"clubs\";s:11:\"\0Card\0sPict\";s:20:\"Cards/queenclubs.jpg\";}i:21;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:48;s:11:\"\0Card\0nFace\";i:10;s:11:\"\0Card\0nSuit\";i:3;s:15:\"\0Card\0sFaceName\";s:3:\"ten\";s:15:\"\0Card\0sSuitName\";s:5:\"clubs\";s:11:\"\0Card\0sPict\";s:18:\"Cards/tenclubs.jpg\";}i:22;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:3;s:11:\"\0Card\0nFace\";i:4;s:11:\"\0Card\0nSuit\";i:0;s:15:\"\0Card\0sFaceName\";s:4:\"four\";s:15:\"\0Card\0sSuitName\";s:6:\"spades\";s:11:\"\0Card\0sPict\";s:20:\"Cards/fourspades.jpg\";}i:23;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:40;s:11:\"\0Card\0nFace\";i:2;s:11:\"\0Card\0nSuit\";i:3;s:15:\"\0Card\0sFaceName\";s:3:\"two\";s:15:\"\0Card\0sSuitName\";s:5:\"clubs\";s:11:\"\0Card\0sPict\";s:18:\"Cards/twoclubs.jpg\";}i:24;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:32;s:11:\"\0Card\0nFace\";i:7;s:11:\"\0Card\0nSuit\";i:2;s:15:\"\0Card\0sFaceName\";s:5:\"seven\";s:15:\"\0Card\0sSuitName\";s:8:\"diamonds\";s:11:\"\0Card\0sPict\";s:23:\"Cards/sevendiamonds.jpg\";}i:25;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:37;s:11:\"\0Card\0nFace\";i:12;s:11:\"\0Card\0nSuit\";i:2;s:15:\"\0Card\0sFaceName\";s:5:\"queen\";s:15:\"\0Card\0sSuitName\";s:8:\"diamonds\";s:11:\"\0Card\0sPict\";s:23:\"Cards/queendiamonds.jpg\";}i:26;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:27;s:11:\"\0Card\0nFace\";i:2;s:11:\"\0Card\0nSuit\";i:2;s:15:\"\0Card\0sFaceName\";s:3:\"two\";s:15:\"\0Card\0sSuitName\";s:8:\"diamonds\";s:11:\"\0Card\0sPict\";s:21:\"Cards/twodiamonds.jpg\";}i:27;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:28;s:11:\"\0Card\0nFace\";i:3;s:11:\"\0Card\0nSuit\";i:2;s:15:\"\0Card\0sFaceName\";s:5:\"three\";s:15:\"\0Card\0sSuitName\";s:8:\"diamonds\";s:11:\"\0Card\0sPict\";s:23:\"Cards/threediamonds.jpg\";}i:28;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:4;s:11:\"\0Card\0nFace\";i:5;s:11:\"\0Card\0nSuit\";i:0;s:15:\"\0Card\0sFaceName\";s:4:\"five\";s:15:\"\0Card\0sSuitName\";s:6:\"spades\";s:11:\"\0Card\0sPict\";s:20:\"Cards/fivespades.jpg\";}i:29;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:16;s:11:\"\0Card\0nFace\";i:4;s:11:\"\0Card\0nSuit\";i:1;s:15:\"\0Card\0sFaceName\";s:4:\"four\";s:15:\"\0Card\0sSuitName\";s:6:\"hearts\";s:11:\"\0Card\0sPict\";s:20:\"Cards/fourhearts.jpg\";}i:30;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:20;s:11:\"\0Card\0nFace\";i:8;s:11:\"\0Card\0nSuit\";i:1;s:15:\"\0Card\0sFaceName\";s:5:\"eight\";s:15:\"\0Card\0sSuitName\";s:6:\"hearts\";s:11:\"\0Card\0sPict\";s:21:\"Cards/eighthearts.jpg\";}i:31;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:33;s:11:\"\0Card\0nFace\";i:8;s:11:\"\0Card\0nSuit\";i:2;s:15:\"\0Card\0sFaceName\";s:5:\"eight\";s:15:\"\0Card\0sSuitName\";s:8:\"diamonds\";s:11:\"\0Card\0sPict\";s:23:\"Cards/eightdiamonds.jpg\";}i:32;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:35;s:11:\"\0Card\0nFace\";i:10;s:11:\"\0Card\0nSuit\";i:2;s:15:\"\0Card\0sFaceName\";s:3:\"ten\";s:15:\"\0Card\0sSuitName\";s:8:\"diamonds\";s:11:\"\0Card\0sPict\";s:21:\"Cards/tendiamonds.jpg\";}i:33;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:43;s:11:\"\0Card\0nFace\";i:5;s:11:\"\0Card\0nSuit\";i:3;s:15:\"\0Card\0sFaceName\";s:4:\"five\";s:15:\"\0Card\0sSuitName\";s:5:\"clubs\";s:11:\"\0Card\0sPict\";s:19:\"Cards/fiveclubs.jpg\";}i:34;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:45;s:11:\"\0Card\0nFace\";i:7;s:11:\"\0Card\0nSuit\";i:3;s:15:\"\0Card\0sFaceName\";s:5:\"seven\";s:15:\"\0Card\0sSuitName\";s:5:\"clubs\";s:11:\"\0Card\0sPict\";s:20:\"Cards/sevenclubs.jpg\";}i:35;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:5;s:11:\"\0Card\0nFace\";i:6;s:11:\"\0Card\0nSuit\";i:0;s:15:\"\0Card\0sFaceName\";s:3:\"six\";s:15:\"\0Card\0sSuitName\";s:6:\"spades\";s:11:\"\0Card\0sPict\";s:19:\"Cards/sixspades.jpg\";}i:36;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:10;s:11:\"\0Card\0nFace\";i:11;s:11:\"\0Card\0nSuit\";i:0;s:15:\"\0Card\0sFaceName\";s:4:\"jack\";s:15:\"\0Card\0sSuitName\";s:6:\"spades\";s:11:\"\0Card\0sPict\";s:20:\"Cards/jackspades.jpg\";}i:37;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:9;s:11:\"\0Card\0nFace\";i:10;s:11:\"\0Card\0nSuit\";i:0;s:15:\"\0Card\0sFaceName\";s:3:\"ten\";s:15:\"\0Card\0sSuitName\";s:6:\"spades\";s:11:\"\0Card\0sPict\";s:19:\"Cards/tenspades.jpg\";}i:38;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:42;s:11:\"\0Card\0nFace\";i:4;s:11:\"\0Card\0nSuit\";i:3;s:15:\"\0Card\0sFaceName\";s:4:\"four\";s:15:\"\0Card\0sSuitName\";s:5:\"clubs\";s:11:\"\0Card\0sPict\";s:19:\"Cards/fourclubs.jpg\";}i:39;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:11;s:11:\"\0Card\0nFace\";i:12;s:11:\"\0Card\0nSuit\";i:0;s:15:\"\0Card\0sFaceName\";s:5:\"queen\";s:15:\"\0Card\0sSuitName\";s:6:\"spades\";s:11:\"\0Card\0sPict\";s:21:\"Cards/queenspades.jpg\";}i:40;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:18;s:11:\"\0Card\0nFace\";i:6;s:11:\"\0Card\0nSuit\";i:1;s:15:\"\0Card\0sFaceName\";s:3:\"six\";s:15:\"\0Card\0sSuitName\";s:6:\"hearts\";s:11:\"\0Card\0sPict\";s:19:\"Cards/sixhearts.jpg\";}i:41;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:25;s:11:\"\0Card\0nFace\";i:13;s:11:\"\0Card\0nSuit\";i:1;s:15:\"\0Card\0sFaceName\";s:4:\"king\";s:15:\"\0Card\0sSuitName\";s:6:\"hearts\";s:11:\"\0Card\0sPict\";s:20:\"Cards/kinghearts.jpg\";}i:42;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:24;s:11:\"\0Card\0nFace\";i:12;s:11:\"\0Card\0nSuit\";i:1;s:15:\"\0Card\0sFaceName\";s:5:\"queen\";s:15:\"\0Card\0sSuitName\";s:6:\"hearts\";s:11:\"\0Card\0sPict\";s:21:\"Cards/queenhearts.jpg\";}i:43;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:49;s:11:\"\0Card\0nFace\";i:11;s:11:\"\0Card\0nSuit\";i:3;s:15:\"\0Card\0sFaceName\";s:4:\"jack\";s:15:\"\0Card\0sSuitName\";s:5:\"clubs\";s:11:\"\0Card\0sPict\";s:19:\"Cards/jackclubs.jpg\";}i:44;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:39;s:11:\"\0Card\0nFace\";i:14;s:11:\"\0Card\0nSuit\";i:3;s:15:\"\0Card\0sFaceName\";s:3:\"ace\";s:15:\"\0Card\0sSuitName\";s:5:\"clubs\";s:11:\"\0Card\0sPict\";s:18:\"Cards/aceclubs.jpg\";}i:45;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:17;s:11:\"\0Card\0nFace\";i:5;s:11:\"\0Card\0nSuit\";i:1;s:15:\"\0Card\0sFaceName\";s:4:\"five\";s:15:\"\0Card\0sSuitName\";s:6:\"hearts\";s:11:\"\0Card\0sPict\";s:20:\"Cards/fivehearts.jpg\";}i:46;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:7;s:11:\"\0Card\0nFace\";i:8;s:11:\"\0Card\0nSuit\";i:0;s:15:\"\0Card\0sFaceName\";s:5:\"eight\";s:15:\"\0Card\0sSuitName\";s:6:\"spades\";s:11:\"\0Card\0sPict\";s:21:\"Cards/eightspades.jpg\";}i:47;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:15;s:11:\"\0Card\0nFace\";i:3;s:11:\"\0Card\0nSuit\";i:1;s:15:\"\0Card\0sFaceName\";s:5:\"three\";s:15:\"\0Card\0sSuitName\";s:6:\"hearts\";s:11:\"\0Card\0sPict\";s:21:\"Cards/threehearts.jpg\";}i:48;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:23;s:11:\"\0Card\0nFace\";i:11;s:11:\"\0Card\0nSuit\";i:1;s:15:\"\0Card\0sFaceName\";s:4:\"jack\";s:15:\"\0Card\0sSuitName\";s:6:\"hearts\";s:11:\"\0Card\0sPict\";s:20:\"Cards/jackhearts.jpg\";}i:49;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:47;s:11:\"\0Card\0nFace\";i:9;s:11:\"\0Card\0nSuit\";i:3;s:15:\"\0Card\0sFaceName\";s:4:\"nine\";s:15:\"\0Card\0sSuitName\";s:5:\"clubs\";s:11:\"\0Card\0sPict\";s:19:\"Cards/nineclubs.jpg\";}i:50;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:8;s:11:\"\0Card\0nFace\";i:9;s:11:\"\0Card\0nSuit\";i:0;s:15:\"\0Card\0sFaceName\";s:4:\"nine\";s:15:\"\0Card\0sSuitName\";s:6:\"spades\";s:11:\"\0Card\0sPict\";s:20:\"Cards/ninespades.jpg\";}i:51;O:4:\"Card\":6:{s:12:\"\0Card\0number\";i:41;s:11:\"\0Card\0nFace\";i:3;s:11:\"\0Card\0nSuit\";i:3;s:15:\"\0Card\0sFaceName\";s:5:\"three\";s:15:\"\0Card\0sSuitName\";s:5:\"clubs\";s:11:\"\0Card\0sPict\";s:20:\"Cards/threeclubs.jpg\";}}s:14:\"\0Deal\0bigBlind\";i:0;s:16:\"\0Deal\0smallBlind\";i:1;s:14:\"\0Deal\0comm_loc\";a:5:{i:0;s:3:\"106\";i:1;s:3:\"107\";i:2;s:3:\"108\";i:3;s:3:\"109\";i:4;s:3:\"110\";}s:10:\"\0Deal\0link\";N;s:17:\"\0Deal\0cardDisplay\";a:4:{i:0;a:3:{i:0;s:1:\"4\";i:1;s:3:\"005\";i:2;s:20:\"Cards/eightclubs.jpg\";}i:1;a:3:{i:0;s:1:\"3\";i:1;s:3:\"001\";i:2;s:19:\"Cards/tenhearts.jpg\";}i:2;a:3:{i:0;s:1:\"4\";i:1;s:3:\"006\";i:2;s:20:\"Cards/ninehearts.jpg\";}i:3;a:3:{i:0;s:1:\"3\";i:1;s:3:\"002\";i:2;s:19:\"Cards/acespades.jpg\";}}}');
/*!40000 ALTER TABLE `entity_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_pot_transaction`
--

DROP TABLE IF EXISTS `entity_pot_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_pot_transaction` (
  `transaction_num` int(10) NOT NULL AUTO_INCREMENT,
  `game_num` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  PRIMARY KEY (`transaction_num`),
  KEY `user_id` (`user_id`),
  KEY `game_num` (`game_num`),
  CONSTRAINT `entity_pot_transaction_ibfk_1` FOREIGN KEY (`game_num`) REFERENCES `entity_game` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_pot_transaction`
--

LOCK TABLES `entity_pot_transaction` WRITE;
/*!40000 ALTER TABLE `entity_pot_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_pot_transaction` ENABLE KEYS */;
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
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
INSERT INTO `entity_users` VALUES (3,'blee12','$2y$10$WE6X/VqXiNQZoFnEkgAsyOh.GvkKmuBdJcz9oFS2rfSnwyggNekdC',1000,'2019-11-29 08:55:05',2,1,0),(4,'libmo34','$2y$10$pG6Ra2TjzxI0bbcdZfzAHuQYLggms5USnAhnqVG08g9jIGSryfbgG',1000,'2019-11-29 08:55:05',2,1,1);
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
INSERT INTO `enum_status` VALUES (0,'Waiting'),(1,'Ready'),(2,'Playing');
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
  `url` varchar(250) DEFAULT NULL,
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
-- Table structure for table `xref_message_board`
--

DROP TABLE IF EXISTS `xref_message_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_message_board` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `game_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `msg_loc` varchar(50) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `entry_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`msg_id`),
  KEY `game_id` (`game_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `xref_message_board_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `entity_game` (`game_id`),
  CONSTRAINT `xref_message_board_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_message_board`
--

LOCK TABLES `xref_message_board` WRITE;
/*!40000 ALTER TABLE `xref_message_board` DISABLE KEYS */;
INSERT INTO `xref_message_board` VALUES (30,58,4,'000','Player 0\nlibmo34\n1000','2019-11-26 14:47:23'),(31,58,3,'004','Player 1\nblee12\n1000','2019-11-26 14:47:23'),(32,58,4,'000','Player 0\nlibmo34\n1000','2019-11-26 14:49:28'),(33,58,3,'004','Player 1\nblee12\n1000','2019-11-26 14:49:28'),(34,58,3,'000','Player 0\nblee12\n1000','2019-11-26 14:56:42'),(35,58,4,'004','Player 1\nlibmo34\n1000','2019-11-26 14:56:42'),(36,58,4,'000','Player 0\nlibmo34\n1000','2019-11-26 15:03:53'),(37,58,3,'004','Player 1\nblee12\n1000','2019-11-26 15:03:53'),(38,58,3,'000','Player 0\nblee12\n1000','2019-11-26 15:31:32'),(39,58,4,'004','Player 1\nlibmo34\n1000','2019-11-26 15:31:32'),(40,58,4,'000','Player 0\nlibmo34\n1000','2019-11-26 15:37:09'),(41,58,3,'004','Player 1\nblee12\n1000','2019-11-26 15:37:09'),(42,58,3,'000','Player 0<br />blee12<br />1000','2019-11-27 04:13:45'),(43,58,4,'004','Player 1<br />libmo34<br />1000','2019-11-27 04:13:45'),(44,58,3,'000','Player 0<br />blee12<br />1000','2019-11-27 05:09:49'),(45,58,4,'004','Player 1<br />libmo34<br />1000','2019-11-27 05:09:49'),(46,58,4,'000','Player 0<br />libmo34<br />1000','2019-11-27 06:31:53'),(47,58,3,'004','Player 1<br />blee12<br />1000','2019-11-27 06:31:53'),(48,58,3,'000','Player 0<br />blee12<br />1000','2019-11-27 06:52:08'),(49,58,4,'004','Player 1<br />libmo34<br />1000','2019-11-27 06:52:08'),(50,58,3,'000','Player 0<br />blee12<br />1000','2019-11-27 07:19:33'),(51,58,4,'004','Player 1<br />libmo34<br />1000','2019-11-27 07:19:33'),(52,58,3,'','Player 1<br />blee12<br />1000','2019-11-27 07:50:25'),(53,58,3,'','Player 1<br />blee12<br />1000','2019-11-27 07:51:39'),(54,58,3,'','Player 1<br />blee12<br />1000','2019-11-27 07:51:39'),(55,58,3,'','Player 1<br />blee12<br />1000','2019-11-27 08:39:15'),(56,58,3,'','Player 1/nblee12/n1000','2019-11-27 08:57:57'),(57,58,3,'','Player 1\nblee12\n1000','2019-11-27 08:58:25'),(58,58,3,'','Player 1\nblee12\n1000','2019-11-27 08:58:43'),(59,58,3,'','Player 1\nblee12\n1000','2019-11-27 09:10:47'),(60,58,3,'','Player 1\nblee12\n1000','2019-11-27 09:11:07'),(61,58,3,'','Player 1\nblee12\n1000','2019-11-27 09:11:25'),(62,58,3,'000','Player 1\nblee12\n1000','2019-11-27 09:16:55'),(63,58,4,'004','Player 2\nlibmo34\n1000','2019-11-27 09:16:55'),(64,58,3,'','','2019-11-27 11:04:23'),(65,58,3,'','','2019-11-27 11:05:30'),(66,58,3,'','','2019-11-27 11:05:50'),(67,58,3,'','','2019-11-27 11:06:47'),(68,58,4,'000','','2019-11-27 22:48:46'),(69,58,3,'004','','2019-11-27 22:48:46');
/*!40000 ALTER TABLE `xref_message_board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-29  5:15:53
