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

-- Dump completed on 2019-11-18 15:13:06
