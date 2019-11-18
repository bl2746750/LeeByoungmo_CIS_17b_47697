-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: upload
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
-- Table structure for table `blee_shoppingcart_entity_products`
--

DROP TABLE IF EXISTS `blee_shoppingcart_entity_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_shoppingcart_entity_products` (
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
-- Dumping data for table `blee_shoppingcart_entity_products`
--

LOCK TABLES `blee_shoppingcart_entity_products` WRITE;
/*!40000 ALTER TABLE `blee_shoppingcart_entity_products` DISABLE KEYS */;
INSERT INTO `blee_shoppingcart_entity_products` VALUES (1,'1366107','New Apple MacBook Pro 13.3\" with Touch Bar - Intel Core i5 - 8GB Memory - 256GB SSD - Space Gray',1200,62,'2019-11-11 19:09:40','images/1.jfif'),(2,'1373148','HP 14\" Laptop 10th Gen Intel Core i5 - 1080p',400,62,'2019-11-11 19:09:40','images/2.jfif'),(3,'1366105','New Apple MacBook Pro 13.3\" with Touch Bar - Intel Core i5 - 8GB Memory - 128GB SSD - Space Gray',1000,98,'2019-11-11 19:09:40','images/3.jfif'),(4,'1373095','Dell Inspiron 17 Laptop - 10th Gen Intel Core i7-1065G7 - GeForce MX230 - 1080p',800,29,'2019-11-11 19:09:40','images/4.jfif'),(5,'1273996','HP 14\" Laptop - Intel Core i5',580,80,'2019-11-11 19:09:40','images/5.jfif'),(6,'1366113','New Apple MacBook Pro 13.3\" with Touch Bar - Intel Core i5 - 8GB Memory - 256GB SSD - Silver',1200,10,'2019-11-11 19:09:40','images/6.jfif'),(7,'1374520','Lenovo Flex 14 2-in-1 Touchscreen Laptop - Ryzen 7 - 1080p',550,60,'2019-11-11 19:09:40','images/7.jfif'),(8,'1267254','HP Pavilion x360 14\" Touchscreen 2-in-1 Laptop - Intel Core i5 - 1080p',500,99,'2019-11-11 19:09:40','images/8.jfif'),(9,'1327140','Dell Inspiron 14 5000 Series 2-in-1 Touchscreen Laptop - AMD Ryzen 5 - 1080p',400,37,'2019-11-11 19:09:40','images/9.jfif'),(10,'1275691','Microsoft Surface Pro 6 Bundle - Intel Core i5 - 2736 x 1824 Display - Black Surface Pro Type Cover',850,77,'2019-11-11 19:09:40','images/10.jfif'),(11,'1373418','LG Gram 17\" Laptop - Intel Core i7 - WQXGA (2560 x 1600) - Ultra Thin and Light at 2.95lbs',1500,37,'2019-11-11 19:09:40','images/11.jfif');
/*!40000 ALTER TABLE `blee_shoppingcart_entity_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_shoppingcart_entity_suppliers`
--

DROP TABLE IF EXISTS `blee_shoppingcart_entity_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_shoppingcart_entity_suppliers` (
  `supplier_id` int(10) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(50) DEFAULT NULL,
  `contact_name` varchar(200) DEFAULT NULL,
  `phone_num` int(10) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_shoppingcart_entity_suppliers`
--

LOCK TABLES `blee_shoppingcart_entity_suppliers` WRITE;
/*!40000 ALTER TABLE `blee_shoppingcart_entity_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `blee_shoppingcart_entity_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_shoppingcart_entity_users`
--

DROP TABLE IF EXISTS `blee_shoppingcart_entity_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_shoppingcart_entity_users` (
  `user_num` int(10) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_phone_number` int(10) DEFAULT NULL,
  `user_address` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`user_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_shoppingcart_entity_users`
--

LOCK TABLES `blee_shoppingcart_entity_users` WRITE;
/*!40000 ALTER TABLE `blee_shoppingcart_entity_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `blee_shoppingcart_entity_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_shoppingcart_enum_sales_status`
--

DROP TABLE IF EXISTS `blee_shoppingcart_enum_sales_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_shoppingcart_enum_sales_status` (
  `enum_sold_status` int(10) NOT NULL,
  `sold_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enum_sold_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_shoppingcart_enum_sales_status`
--

LOCK TABLES `blee_shoppingcart_enum_sales_status` WRITE;
/*!40000 ALTER TABLE `blee_shoppingcart_enum_sales_status` DISABLE KEYS */;
INSERT INTO `blee_shoppingcart_enum_sales_status` VALUES (0,'Ordered'),(1,'Sold');
/*!40000 ALTER TABLE `blee_shoppingcart_enum_sales_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_shoppingcart_xref_receiving`
--

DROP TABLE IF EXISTS `blee_shoppingcart_xref_receiving`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_shoppingcart_xref_receiving` (
  `receiving_id` int(10) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `receiving_qnty` int(10) DEFAULT NULL,
  `cost_per_prod` decimal(16,0) DEFAULT NULL,
  `receiving_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`receiving_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `blee_shoppingcart_xref_receiving_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `blee_shoppingcart_entity_suppliers` (`supplier_id`),
  CONSTRAINT `blee_shoppingcart_xref_receiving_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `blee_shoppingcart_entity_products` (`product_id`),
  CONSTRAINT `blee_shoppingcart_xref_receiving_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `blee_shoppingcart_entity_suppliers` (`supplier_id`),
  CONSTRAINT `blee_shoppingcart_xref_receiving_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `blee_shoppingcart_entity_products` (`product_id`),
  CONSTRAINT `blee_shoppingcart_xref_receiving_ibfk_5` FOREIGN KEY (`supplier_id`) REFERENCES `blee_shoppingcart_entity_suppliers` (`supplier_id`),
  CONSTRAINT `blee_shoppingcart_xref_receiving_ibfk_6` FOREIGN KEY (`product_id`) REFERENCES `blee_shoppingcart_entity_products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_shoppingcart_xref_receiving`
--

LOCK TABLES `blee_shoppingcart_xref_receiving` WRITE;
/*!40000 ALTER TABLE `blee_shoppingcart_xref_receiving` DISABLE KEYS */;
/*!40000 ALTER TABLE `blee_shoppingcart_xref_receiving` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_shoppingcart_xref_sold`
--

DROP TABLE IF EXISTS `blee_shoppingcart_xref_sold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_shoppingcart_xref_sold` (
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
  CONSTRAINT `blee_shoppingcart_xref_sold_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `blee_shoppingcart_entity_products` (`product_id`),
  CONSTRAINT `blee_shoppingcart_xref_sold_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `blee_shoppingcart_entity_users` (`user_num`),
  CONSTRAINT `blee_shoppingcart_xref_sold_ibfk_3` FOREIGN KEY (`status`) REFERENCES `blee_shoppingcart_enum_sales_status` (`enum_sold_status`),
  CONSTRAINT `blee_shoppingcart_xref_sold_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `blee_shoppingcart_entity_products` (`product_id`),
  CONSTRAINT `blee_shoppingcart_xref_sold_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `blee_shoppingcart_entity_users` (`user_num`),
  CONSTRAINT `blee_shoppingcart_xref_sold_ibfk_6` FOREIGN KEY (`status`) REFERENCES `blee_shoppingcart_enum_sales_status` (`enum_sold_status`),
  CONSTRAINT `blee_shoppingcart_xref_sold_ibfk_7` FOREIGN KEY (`product_id`) REFERENCES `blee_shoppingcart_entity_products` (`product_id`),
  CONSTRAINT `blee_shoppingcart_xref_sold_ibfk_8` FOREIGN KEY (`user_id`) REFERENCES `blee_shoppingcart_entity_users` (`user_num`),
  CONSTRAINT `blee_shoppingcart_xref_sold_ibfk_9` FOREIGN KEY (`status`) REFERENCES `blee_shoppingcart_enum_sales_status` (`enum_sold_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_shoppingcart_xref_sold`
--

LOCK TABLES `blee_shoppingcart_xref_sold` WRITE;
/*!40000 ALTER TABLE `blee_shoppingcart_xref_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `blee_shoppingcart_xref_sold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_survey_engine_entity_questions`
--

DROP TABLE IF EXISTS `blee_survey_engine_entity_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_survey_engine_entity_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) NOT NULL,
  `answers` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_survey_engine_entity_questions`
--

LOCK TABLES `blee_survey_engine_entity_questions` WRITE;
/*!40000 ALTER TABLE `blee_survey_engine_entity_questions` DISABLE KEYS */;
INSERT INTO `blee_survey_engine_entity_questions` VALUES (45,'	test1','[\"test11\",\"test22\"]'),(46,'	test2','[\"test(1)\",\"test(2)\"]');
/*!40000 ALTER TABLE `blee_survey_engine_entity_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_survey_engine_entity_survey`
--

DROP TABLE IF EXISTS `blee_survey_engine_entity_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_survey_engine_entity_survey` (
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
-- Dumping data for table `blee_survey_engine_entity_survey`
--

LOCK TABLES `blee_survey_engine_entity_survey` WRITE;
/*!40000 ALTER TABLE `blee_survey_engine_entity_survey` DISABLE KEYS */;
INSERT INTO `blee_survey_engine_entity_survey` VALUES (1,'test','test survey','2019-11-10','2019-11-11',NULL),(2,'test2','test2','2019-11-11','2019-11-12',NULL),(3,'','','0000-00-00','0000-00-00',NULL),(4,'','','0000-00-00','0000-00-00',NULL),(5,'','','0000-00-00','0000-00-00',NULL),(6,'','','0000-00-00','0000-00-00',NULL);
/*!40000 ALTER TABLE `blee_survey_engine_entity_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_survey_engine_entity_users`
--

DROP TABLE IF EXISTS `blee_survey_engine_entity_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_survey_engine_entity_users` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sign_up_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin` (`admin`),
  CONSTRAINT `blee_survey_engine_entity_users_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `blee_survey_engine_enum_admin` (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_survey_engine_entity_users`
--

LOCK TABLES `blee_survey_engine_entity_users` WRITE;
/*!40000 ALTER TABLE `blee_survey_engine_entity_users` DISABLE KEYS */;
INSERT INTO `blee_survey_engine_entity_users` VALUES (3,'blee55@student.rccd.edu','$2y$10$XBvpStIdqi1z1HyYCtgh/OGT3uNnrAF/EL.IsuN7yOFuxnoigq1iq','2019-11-10 07:24:12',1),(6,'libmo@hanmail.net','$2y$10$VzTlcHx5dVp4lZqVYVWGXu2gNK.k5CjeXBrB9PV3HErfzsnUGmSu2','2019-11-10 07:23:19',NULL);
/*!40000 ALTER TABLE `blee_survey_engine_entity_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_survey_engine_enum_admin`
--

DROP TABLE IF EXISTS `blee_survey_engine_enum_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_survey_engine_enum_admin` (
  `num` int(10) NOT NULL,
  `description` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_survey_engine_enum_admin`
--

LOCK TABLES `blee_survey_engine_enum_admin` WRITE;
/*!40000 ALTER TABLE `blee_survey_engine_enum_admin` DISABLE KEYS */;
INSERT INTO `blee_survey_engine_enum_admin` VALUES (0,'user'),(1,'admin');
/*!40000 ALTER TABLE `blee_survey_engine_enum_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_survey_engine_xref_answer`
--

DROP TABLE IF EXISTS `blee_survey_engine_xref_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_survey_engine_xref_answer` (
  `answer_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `question_id` int(10) DEFAULT NULL,
  `answer` int(7) DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `question_id` (`question_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `blee_survey_engine_xref_answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `blee_survey_engine_entity_questions` (`id`),
  CONSTRAINT `blee_survey_engine_xref_answer_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `blee_survey_engine_entity_users` (`id`),
  CONSTRAINT `blee_survey_engine_xref_answer_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `blee_survey_engine_entity_questions` (`id`),
  CONSTRAINT `blee_survey_engine_xref_answer_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `blee_survey_engine_entity_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_survey_engine_xref_answer`
--

LOCK TABLES `blee_survey_engine_xref_answer` WRITE;
/*!40000 ALTER TABLE `blee_survey_engine_xref_answer` DISABLE KEYS */;
INSERT INTO `blee_survey_engine_xref_answer` VALUES (59,3,45,0),(60,3,45,0),(61,3,45,0),(62,3,46,0),(63,3,45,0),(64,3,46,0);
/*!40000 ALTER TABLE `blee_survey_engine_xref_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_survey_engine_xref_survey_question`
--

DROP TABLE IF EXISTS `blee_survey_engine_xref_survey_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_survey_engine_xref_survey_question` (
  `survey_reg_num` int(10) NOT NULL AUTO_INCREMENT,
  `survey_num` int(10) DEFAULT NULL,
  `question_num` int(10) DEFAULT NULL,
  PRIMARY KEY (`survey_reg_num`),
  KEY `question_num` (`question_num`),
  KEY `survey_num` (`survey_num`),
  CONSTRAINT `blee_survey_engine_xref_survey_question_ibfk_1` FOREIGN KEY (`question_num`) REFERENCES `blee_survey_engine_entity_questions` (`id`),
  CONSTRAINT `blee_survey_engine_xref_survey_question_ibfk_2` FOREIGN KEY (`survey_num`) REFERENCES `blee_survey_engine_entity_survey` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_survey_engine_xref_survey_question`
--

LOCK TABLES `blee_survey_engine_xref_survey_question` WRITE;
/*!40000 ALTER TABLE `blee_survey_engine_xref_survey_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `blee_survey_engine_xref_survey_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_survey_engine_xref_survey_users`
--

DROP TABLE IF EXISTS `blee_survey_engine_xref_survey_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_survey_engine_xref_survey_users` (
  `survey_user_reg_num` int(10) NOT NULL AUTO_INCREMENT,
  `survey_num` int(10) DEFAULT NULL,
  `user_num` int(7) DEFAULT NULL,
  PRIMARY KEY (`survey_user_reg_num`),
  KEY `user_num` (`user_num`),
  KEY `survey_num` (`survey_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_survey_engine_xref_survey_users`
--

LOCK TABLES `blee_survey_engine_xref_survey_users` WRITE;
/*!40000 ALTER TABLE `blee_survey_engine_xref_survey_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `blee_survey_engine_xref_survey_users` ENABLE KEYS */;
UNLOCK TABLES;

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
  `num_player` int(10) DEFAULT NULL,
  `init_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `status` (`status`),
  CONSTRAINT `blee_texasholdem_entity_game_ibfk_1` FOREIGN KEY (`status`) REFERENCES `blee_texasholdem_enum_game_status` (`enum_game_status`),
  CONSTRAINT `blee_texasholdem_entity_game_ibfk_2` FOREIGN KEY (`status`) REFERENCES `blee_texasholdem_enum_game_status` (`enum_game_status`),
  CONSTRAINT `blee_texasholdem_entity_game_ibfk_3` FOREIGN KEY (`status`) REFERENCES `blee_texasholdem_enum_game_status` (`enum_game_status`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_texasholdem_entity_game`
--

LOCK TABLES `blee_texasholdem_entity_game` WRITE;
/*!40000 ALTER TABLE `blee_texasholdem_entity_game` DISABLE KEYS */;
INSERT INTO `blee_texasholdem_entity_game` VALUES (1,NULL,2,'2019-11-12 10:40:37',NULL),(2,NULL,2,'2019-11-12 10:40:37',NULL),(3,NULL,2,'2019-11-12 10:40:37',NULL),(4,NULL,2,'2019-11-12 10:40:37',NULL),(5,NULL,2,'2019-11-12 10:40:37',NULL),(6,NULL,2,'2019-11-12 10:40:37',NULL),(7,NULL,2,'2019-11-12 10:40:37',NULL),(8,NULL,2,'2019-11-12 10:41:12',NULL),(9,NULL,2,'2019-11-12 10:43:01',NULL),(10,NULL,2,'2019-11-12 10:43:45',NULL),(11,NULL,2,'2019-11-12 10:44:12',NULL),(12,NULL,2,'2019-11-12 10:44:19',NULL),(13,NULL,2,'2019-11-12 10:44:24',NULL),(14,NULL,2,'2019-11-12 10:45:01',NULL),(15,NULL,2,'2019-11-12 10:46:09',NULL),(16,NULL,2,'2019-11-12 10:47:23',NULL),(17,NULL,2,'2019-11-12 10:48:07',NULL),(18,NULL,2,'2019-11-12 10:48:32',NULL),(19,NULL,2,'2019-11-12 10:50:52',NULL),(20,NULL,2,'2019-11-12 10:55:17',NULL),(21,NULL,2,'2019-11-12 10:55:50',NULL),(22,NULL,2,'2019-11-12 10:56:58',NULL),(23,NULL,2,'2019-11-12 10:58:01',NULL),(24,NULL,2,'2019-11-12 11:00:43',NULL),(25,NULL,2,'2019-11-12 11:00:52',NULL),(26,NULL,2,'2019-11-12 11:03:19',NULL),(27,NULL,2,'2019-11-12 17:04:56',NULL),(28,NULL,2,'2019-11-12 17:05:23',NULL),(29,NULL,2,'2019-11-12 17:06:18',NULL),(30,NULL,2,'2019-11-12 17:12:02',NULL),(31,NULL,2,'2019-11-12 17:13:05',NULL),(32,NULL,2,'2019-11-12 17:15:56',NULL),(33,NULL,2,'2019-11-12 17:16:34',NULL),(34,NULL,2,'2019-11-12 17:16:57',NULL),(35,NULL,2,'2019-11-12 17:17:39',NULL),(36,NULL,2,'2019-11-12 17:24:26',NULL),(37,NULL,2,'2019-11-12 17:25:57',NULL),(38,NULL,2,'2019-11-12 17:25:58',NULL),(39,NULL,2,'2019-11-12 17:26:19',NULL),(40,NULL,2,'2019-11-12 17:26:22',NULL),(41,NULL,2,'2019-11-12 17:27:11',NULL),(42,NULL,2,'2019-11-12 17:27:56',NULL),(43,NULL,2,'2019-11-12 17:29:37',NULL),(44,NULL,2,'2019-11-12 17:35:40',NULL),(45,NULL,2,'2019-11-12 17:40:14',NULL),(46,NULL,2,'2019-11-12 17:40:29',NULL),(47,NULL,2,'2019-11-12 17:49:17',NULL),(48,NULL,2,'2019-11-12 17:50:39',NULL),(49,NULL,2,'2019-11-12 17:51:44',NULL),(50,NULL,2,'2019-11-12 17:57:25',NULL),(51,NULL,2,'2019-11-12 17:57:41',NULL),(52,NULL,2,'2019-11-12 18:03:21',NULL),(53,NULL,2,'2019-11-12 18:05:09',NULL),(54,NULL,2,'2019-11-12 18:05:51',NULL),(55,NULL,2,'2019-11-12 18:07:14',NULL),(56,0,3,'2019-11-18 19:24:52',1);
/*!40000 ALTER TABLE `blee_texasholdem_entity_game` ENABLE KEYS */;
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
  PRIMARY KEY (`user_id`),
  KEY `status` (`status`),
  KEY `logged_in` (`logged_in`),
  CONSTRAINT `blee_texasholdem_entity_users_ibfk_1` FOREIGN KEY (`status`) REFERENCES `blee_texasholdem_enum_status` (`status_num`),
  CONSTRAINT `blee_texasholdem_entity_users_ibfk_10` FOREIGN KEY (`logged_in`) REFERENCES `blee_texasholdem_enum_log_status` (`enum_log`),
  CONSTRAINT `blee_texasholdem_entity_users_ibfk_2` FOREIGN KEY (`logged_in`) REFERENCES `blee_texasholdem_enum_log_status` (`enum_log`),
  CONSTRAINT `blee_texasholdem_entity_users_ibfk_3` FOREIGN KEY (`logged_in`) REFERENCES `blee_texasholdem_enum_log_status` (`enum_log`),
  CONSTRAINT `blee_texasholdem_entity_users_ibfk_4` FOREIGN KEY (`logged_in`) REFERENCES `blee_texasholdem_enum_log_status` (`enum_log`),
  CONSTRAINT `blee_texasholdem_entity_users_ibfk_5` FOREIGN KEY (`logged_in`) REFERENCES `blee_texasholdem_enum_log_status` (`enum_log`),
  CONSTRAINT `blee_texasholdem_entity_users_ibfk_6` FOREIGN KEY (`logged_in`) REFERENCES `blee_texasholdem_enum_log_status` (`enum_log`),
  CONSTRAINT `blee_texasholdem_entity_users_ibfk_7` FOREIGN KEY (`logged_in`) REFERENCES `blee_texasholdem_enum_log_status` (`enum_log`),
  CONSTRAINT `blee_texasholdem_entity_users_ibfk_8` FOREIGN KEY (`logged_in`) REFERENCES `blee_texasholdem_enum_log_status` (`enum_log`),
  CONSTRAINT `blee_texasholdem_entity_users_ibfk_9` FOREIGN KEY (`logged_in`) REFERENCES `blee_texasholdem_enum_log_status` (`enum_log`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_texasholdem_entity_users`
--

LOCK TABLES `blee_texasholdem_entity_users` WRITE;
/*!40000 ALTER TABLE `blee_texasholdem_entity_users` DISABLE KEYS */;
INSERT INTO `blee_texasholdem_entity_users` VALUES (3,'blee55@student.rccd.edu','$2y$10$WE6X/VqXiNQZoFnEkgAsyOh.GvkKmuBdJcz9oFS2rfSnwyggNekdC',1000,'2019-11-18 19:06:25',0,1),(4,'libmo@hanmail.net','$2y$10$pG6Ra2TjzxI0bbcdZfzAHuQYLggms5USnAhnqVG08g9jIGSryfbgG',1000,'2019-11-17 19:24:19',0,0);
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
  PRIMARY KEY (`card_dist_num`),
  KEY `card_num` (`card_num`),
  KEY `user_num` (`user_num`),
  CONSTRAINT `blee_texasholdem_xref_card_dist_ibfk_1` FOREIGN KEY (`card_num`) REFERENCES `blee_texasholdem_entity_cards` (`card_num`),
  CONSTRAINT `blee_texasholdem_xref_card_dist_ibfk_2` FOREIGN KEY (`user_num`) REFERENCES `blee_texasholdem_entity_users` (`user_id`)
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
  PRIMARY KEY (`transaction_num`),
  KEY `game_num` (`game_num`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `blee_texasholdem_xref_pot_transaction_ibfk_1` FOREIGN KEY (`game_num`) REFERENCES `blee_texasholdem_entity_game` (`game_id`),
  CONSTRAINT `blee_texasholdem_xref_pot_transaction_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `blee_texasholdem_entity_users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_texasholdem_xref_pot_transaction`
--

LOCK TABLES `blee_texasholdem_xref_pot_transaction` WRITE;
/*!40000 ALTER TABLE `blee_texasholdem_xref_pot_transaction` DISABLE KEYS */;
INSERT INTO `blee_texasholdem_xref_pot_transaction` VALUES (1,56,3,NULL),(2,56,4,NULL),(3,56,4,NULL),(4,56,3,NULL),(5,56,3,NULL),(6,56,3,NULL),(7,56,3,NULL),(8,56,3,NULL),(9,56,3,NULL),(10,56,3,NULL),(11,56,3,NULL),(12,56,3,NULL),(13,56,3,NULL),(14,56,3,NULL),(15,56,4,NULL),(16,56,3,NULL),(17,56,3,NULL),(18,56,3,NULL),(19,56,4,NULL),(20,56,3,NULL);
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

-- Dump completed on 2019-11-18 15:20:13
