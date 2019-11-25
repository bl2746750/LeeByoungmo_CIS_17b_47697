-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: upload1
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
-- Table structure for table `blee_book_entity_author`
--

DROP TABLE IF EXISTS `blee_book_entity_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_book_entity_author` (
  `author_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_book_entity_author`
--

LOCK TABLES `blee_book_entity_author` WRITE;
/*!40000 ALTER TABLE `blee_book_entity_author` DISABLE KEYS */;
INSERT INTO `blee_book_entity_author` VALUES (0,'Robin Nixon'),(1,'Tony Gaddis'),(2,'Larry Ullman'),(3,'Thomas H Cormen'),(4,'Nicolai M. Josuttis'),(5,'Randy Harris');
/*!40000 ALTER TABLE `blee_book_entity_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_book_entity_book`
--

DROP TABLE IF EXISTS `blee_book_entity_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_book_entity_book` (
  `book_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_book_entity_book`
--

LOCK TABLES `blee_book_entity_book` WRITE;
/*!40000 ALTER TABLE `blee_book_entity_book` DISABLE KEYS */;
INSERT INTO `blee_book_entity_book` VALUES (0,'Learning PHP, MySQL & JavaScript'),(1,'PHP for the Web'),(2,'Starting Out with C++ from Control Structures to Objects'),(3,'Introduction to Algorithms'),(4,'The C++ Standard Library: A Tutorial and Reference (2nd Edition)'),(5,'Modern Physics');
/*!40000 ALTER TABLE `blee_book_entity_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_book_entity_publisher`
--

DROP TABLE IF EXISTS `blee_book_entity_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_book_entity_publisher` (
  `publisher_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_book_entity_publisher`
--

LOCK TABLES `blee_book_entity_publisher` WRITE;
/*!40000 ALTER TABLE `blee_book_entity_publisher` DISABLE KEYS */;
INSERT INTO `blee_book_entity_publisher` VALUES (0,'O\'Reilly'),(1,'Peachpit Press'),(2,'Pearson'),(3,'MIT Press'),(4,'Addison');
/*!40000 ALTER TABLE `blee_book_entity_publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_book_enum_subject`
--

DROP TABLE IF EXISTS `blee_book_enum_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_book_enum_subject` (
  `enum` int(10) NOT NULL,
  `subject` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_book_enum_subject`
--

LOCK TABLES `blee_book_enum_subject` WRITE;
/*!40000 ALTER TABLE `blee_book_enum_subject` DISABLE KEYS */;
INSERT INTO `blee_book_enum_subject` VALUES (0,'CS'),(1,'Science');
/*!40000 ALTER TABLE `blee_book_enum_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `blee_book_view_book_info`
--

DROP TABLE IF EXISTS `blee_book_view_book_info`;
/*!50001 DROP VIEW IF EXISTS `blee_book_view_book_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `blee_book_view_book_info` (
  `Title` tinyint NOT NULL,
  `Author` tinyint NOT NULL,
  `Publisher` tinyint NOT NULL,
  `Subject` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `blee_book_xref_book_author`
--

DROP TABLE IF EXISTS `blee_book_xref_book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_book_xref_book_author` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `book_id` int(10) DEFAULT NULL,
  `author_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_book_xref_book_author`
--

LOCK TABLES `blee_book_xref_book_author` WRITE;
/*!40000 ALTER TABLE `blee_book_xref_book_author` DISABLE KEYS */;
INSERT INTO `blee_book_xref_book_author` VALUES (0,0,0),(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);
/*!40000 ALTER TABLE `blee_book_xref_book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blee_book_xref_book_subject`
--

DROP TABLE IF EXISTS `blee_book_xref_book_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blee_book_xref_book_subject` (
  `subject_id` int(10) NOT NULL AUTO_INCREMENT,
  `enum_sub_id` int(10) DEFAULT NULL,
  `book_id` int(10) DEFAULT NULL,
  `publisher_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blee_book_xref_book_subject`
--

LOCK TABLES `blee_book_xref_book_subject` WRITE;
/*!40000 ALTER TABLE `blee_book_xref_book_subject` DISABLE KEYS */;
INSERT INTO `blee_book_xref_book_subject` VALUES (0,0,0,0),(1,0,2,2),(2,0,3,3),(3,0,4,4),(4,1,5,2),(6,0,1,1);
/*!40000 ALTER TABLE `blee_book_xref_book_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `blee_book_view_book_info`
--

/*!50001 DROP TABLE IF EXISTS `blee_book_view_book_info`*/;
/*!50001 DROP VIEW IF EXISTS `blee_book_view_book_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `blee_book_view_book_info` AS select `blee_book_entity_book`.`title` AS `Title`,`blee_book_entity_author`.`name` AS `Author`,`blee_book_entity_publisher`.`company_name` AS `Publisher`,`blee_book_enum_subject`.`subject` AS `Subject` from (((((`blee_book_entity_book` join `blee_book_xref_book_subject`) join `blee_book_entity_publisher`) join `blee_book_enum_subject`) join `blee_book_xref_book_author`) join `blee_book_entity_author`) where `blee_book_entity_book`.`book_id` = `blee_book_xref_book_subject`.`book_id` and `blee_book_entity_publisher`.`publisher_id` = `blee_book_xref_book_subject`.`publisher_id` and `blee_book_xref_book_subject`.`enum_sub_id` = `blee_book_enum_subject`.`enum` and `blee_book_entity_book`.`book_id` = `blee_book_xref_book_author`.`book_id` and `blee_book_entity_author`.`author_id` = `blee_book_xref_book_author`.`author_id` */;
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

-- Dump completed on 2019-11-24 21:23:30
