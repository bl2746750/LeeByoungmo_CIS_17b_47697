CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `test`;
-- MySQL dump 10.16  Distrib 10.1.34-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	10.1.34-MariaDB

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
  PRIMARY KEY (`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_course`
--

LOCK TABLES `entity_course` WRITE;
/*!40000 ALTER TABLE `entity_course` DISABLE KEYS */;
INSERT INTO `entity_course` VALUES (47697,'Advanced Objects','CIS17B',3,1,2019),(47698,'C++Objects','CIS17A',3,2,2018);
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
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idInustructor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_instructor`
--

LOCK TABLES `entity_instructor` WRITE;
/*!40000 ALTER TABLE `entity_instructor` DISABLE KEYS */;
INSERT INTO `entity_instructor` VALUES (1150258,'Mark','E','Lehr','mark.lehr@rcc.edu'),(1150259,'Paul','C','Conrad','paul.conrad@rcc.edu');
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
INSERT INTO `entity_student` VALUES (1102528,'lehr','e','mark'),(1102589,'lehrin','c','marko'),(1102590,'lairin','d','macko');
/*!40000 ALTER TABLE `entity_student` ENABLE KEYS */;
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
  PRIMARY KEY (`idxref_ass_student`)
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
  PRIMARY KEY (`idxref_course_ass`)
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
  PRIMARY KEY (`idxref_instruc_course`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_inst_course`
--

LOCK TABLES `xref_inst_course` WRITE;
/*!40000 ALTER TABLE `xref_inst_course` DISABLE KEYS */;
INSERT INTO `xref_inst_course` VALUES (1,1150258,47697),(2,1150259,47698);
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

-- Dump completed on 2019-10-28 19:26:06
