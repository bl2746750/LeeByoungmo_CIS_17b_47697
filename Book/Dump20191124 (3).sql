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

-- Dump completed on 2019-11-24 21:44:16
