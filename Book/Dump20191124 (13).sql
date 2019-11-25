-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: gradebook
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
-- Table structure for table `entity_assignment`
--

DROP TABLE IF EXISTS `entity_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_assignment` (
  `idassignment` int(10) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `points` int(10) DEFAULT NULL,
  PRIMARY KEY (`idassignment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_assignment`
--

LOCK TABLES `entity_assignment` WRITE;
/*!40000 ALTER TABLE `entity_assignment` DISABLE KEYS */;
INSERT INTO `entity_assignment` VALUES (1,'Midterm','Class Powerpoint Presentation with Code',100),(2,'Serialization','Objectify your Objects',20),(3,'Midterm','Structrues',100);
/*!40000 ALTER TABLE `entity_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_course`
--

DROP TABLE IF EXISTS `entity_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_course` (
  `idCourse` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `designation` varchar(6) DEFAULT NULL,
  `units` tinyint(3) DEFAULT NULL,
  `idSemester` int(10) DEFAULT NULL,
  `year` int(3) DEFAULT NULL,
  PRIMARY KEY (`idCourse`),
  KEY `idSemester` (`idSemester`),
  CONSTRAINT `entity_course_ibfk_1` FOREIGN KEY (`idSemester`) REFERENCES `enum_semester` (`idSemester`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_course`
--

LOCK TABLES `entity_course` WRITE;
/*!40000 ALTER TABLE `entity_course` DISABLE KEYS */;
INSERT INTO `entity_course` VALUES (23061,'General Chemistry I','CHM1A',5,4,2019),(28227,'English1A','ENG1A',4,1,2017),(28520,'Linear Algebra','MAT3',4,3,2019),(28615,'Modern Physics','PHY4D',4,1,2019),(28804,'Native American Cultures','ANT4',3,1,2017),(47697,'Advanced Object','CIS17B',3,1,2019),(47698,'Data Structure','CIS17C',3,1,2019);
/*!40000 ALTER TABLE `entity_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_instructor`
--

DROP TABLE IF EXISTS `entity_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_instructor` (
  `idInustructor` int(11) NOT NULL,
  `firstName` varchar(15) DEFAULT NULL,
  `MI` char(1) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `id_dept` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idInustructor`),
  KEY `id_dept` (`id_dept`),
  CONSTRAINT `entity_instructor_ibfk_1` FOREIGN KEY (`id_dept`) REFERENCES `enum_dept` (`idDepartment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_instructor`
--

LOCK TABLES `entity_instructor` WRITE;
/*!40000 ALTER TABLE `entity_instructor` DISABLE KEYS */;
INSERT INTO `entity_instructor` VALUES (1150258,'Mark','E','Lehr','mark.lehr@rcc.edu','CIS'),(1150259,'Paul','C','Conrad','paul.conrad@rcc.edu','CIS'),(1150260,'Bhattacharya','D','Dipen','Dipen.Bhattacharya@mvc.edu','PHY'),(1150261,'Jarrod',NULL,'Williamson','jarrod.williamson@rcc.edu','CHE'),(1150262,'Fen',NULL,'Johnson','fen.johnson@mvc.edu','MAT'),(1150263,'Larisa',NULL,'Broyles','larisa.broyles@mvc.edu','ANT'),(1150264,'Sean',NULL,'Drake','sean.drake@mvc.edu','MAT'),(1150265,'Joshua',NULL,'Pearson','joshua.pearson@rccd.edu','ENG');
/*!40000 ALTER TABLE `entity_instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_student`
--

DROP TABLE IF EXISTS `entity_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_student` (
  `idstudent` int(10) NOT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `mi` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idstudent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_student`
--

LOCK TABLES `entity_student` WRITE;
/*!40000 ALTER TABLE `entity_student` DISABLE KEYS */;
INSERT INTO `entity_student` VALUES (1102528,'lehr','e','mark'),(1102589,'lehrin','c','marko'),(1102590,'lairin','d','macko'),(2746750,'Lee',NULL,'Byoungmo');
/*!40000 ALTER TABLE `entity_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_dept`
--

DROP TABLE IF EXISTS `enum_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enum_dept` (
  `idDepartment` varchar(10) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idDepartment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_dept`
--

LOCK TABLES `enum_dept` WRITE;
/*!40000 ALTER TABLE `enum_dept` DISABLE KEYS */;
INSERT INTO `enum_dept` VALUES ('ANT','Anthropology'),('CHE','Chemistry'),('CIS','CIS'),('ENG','English'),('MAT','Math'),('PHY','Physics');
/*!40000 ALTER TABLE `enum_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_semester`
--

DROP TABLE IF EXISTS `enum_semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enum_semester` (
  `idSemester` int(10) NOT NULL,
  `semester` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idSemester`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_semester`
--

LOCK TABLES `enum_semester` WRITE;
/*!40000 ALTER TABLE `enum_semester` DISABLE KEYS */;
INSERT INTO `enum_semester` VALUES (1,'Fall'),(2,'Winter'),(3,'Spring'),(4,'Summer');
/*!40000 ALTER TABLE `enum_semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_assignment_strudent`
--

DROP TABLE IF EXISTS `xref_assignment_strudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_assignment_strudent` (
  `idxref_ass_student` int(10) NOT NULL,
  `id_student` int(10) DEFAULT NULL,
  `id_assignment` int(10) DEFAULT NULL,
  `grade` char(1) DEFAULT NULL,
  `comments` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idxref_ass_student`),
  KEY `id_assignment` (`id_assignment`),
  KEY `id_student` (`id_student`),
  CONSTRAINT `xref_assignment_strudent_ibfk_1` FOREIGN KEY (`id_assignment`) REFERENCES `entity_assignment` (`idassignment`),
  CONSTRAINT `xref_assignment_strudent_ibfk_2` FOREIGN KEY (`id_student`) REFERENCES `entity_student` (`idstudent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_assignment_strudent`
--

LOCK TABLES `xref_assignment_strudent` WRITE;
/*!40000 ALTER TABLE `xref_assignment_strudent` DISABLE KEYS */;
INSERT INTO `xref_assignment_strudent` VALUES (1,1102528,1,'A','Great'),(2,1102589,2,'B','Good'),(3,1102590,3,'C','Not so Good');
/*!40000 ALTER TABLE `xref_assignment_strudent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_course_assignment`
--

DROP TABLE IF EXISTS `xref_course_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_course_assignment` (
  `idxref_course_ass` int(10) NOT NULL,
  `id_course` int(10) DEFAULT NULL,
  `id_assignment` int(10) DEFAULT NULL,
  PRIMARY KEY (`idxref_course_ass`),
  KEY `id_course` (`id_course`),
  KEY `id_assignment` (`id_assignment`),
  CONSTRAINT `xref_course_assignment_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `entity_course` (`idCourse`),
  CONSTRAINT `xref_course_assignment_ibfk_2` FOREIGN KEY (`id_assignment`) REFERENCES `entity_assignment` (`idassignment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_course_assignment`
--

LOCK TABLES `xref_course_assignment` WRITE;
/*!40000 ALTER TABLE `xref_course_assignment` DISABLE KEYS */;
INSERT INTO `xref_course_assignment` VALUES (1,47697,1),(2,47697,2),(3,47698,3);
/*!40000 ALTER TABLE `xref_course_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_inst_course`
--

DROP TABLE IF EXISTS `xref_inst_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_inst_course` (
  `idxref_instruc_course` int(10) NOT NULL,
  `idinstructor` int(10) DEFAULT NULL,
  `idcourse` int(10) DEFAULT NULL,
  PRIMARY KEY (`idxref_instruc_course`),
  KEY `idinstructor` (`idinstructor`),
  KEY `idcourse` (`idcourse`),
  CONSTRAINT `xref_inst_course_ibfk_1` FOREIGN KEY (`idinstructor`) REFERENCES `entity_instructor` (`idInustructor`),
  CONSTRAINT `xref_inst_course_ibfk_2` FOREIGN KEY (`idcourse`) REFERENCES `entity_course` (`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_inst_course`
--

LOCK TABLES `xref_inst_course` WRITE;
/*!40000 ALTER TABLE `xref_inst_course` DISABLE KEYS */;
INSERT INTO `xref_inst_course` VALUES (1,1150258,47697),(2,1150259,47698),(3,1150260,28615),(4,1150261,23061),(5,1150263,28804),(6,1150265,28227),(7,1150262,28520);
/*!40000 ALTER TABLE `xref_inst_course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-24 22:23:17
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

-- Dump completed on 2019-11-24 22:23:18
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

-- Dump completed on 2019-11-24 22:23:18
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
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `blee_book_xref_book_author_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `blee_book_entity_author` (`author_id`),
  CONSTRAINT `blee_book_xref_book_author_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `blee_book_entity_book` (`book_id`)
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
  PRIMARY KEY (`subject_id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `book_id` (`book_id`),
  KEY `enum_sub_id` (`enum_sub_id`),
  CONSTRAINT `blee_book_xref_book_subject_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `blee_book_entity_publisher` (`publisher_id`),
  CONSTRAINT `blee_book_xref_book_subject_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `blee_book_entity_book` (`book_id`),
  CONSTRAINT `blee_book_xref_book_subject_ibfk_3` FOREIGN KEY (`enum_sub_id`) REFERENCES `blee_book_enum_subject` (`enum`)
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

-- Dump completed on 2019-11-24 22:23:18
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

-- Dump completed on 2019-11-24 22:23:19
