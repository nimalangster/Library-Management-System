CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `library`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `bookId` int(11) NOT NULL,
  `isbnNo` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `publisher` varchar(45) DEFAULT NULL,
  `noOfPages` int(11) DEFAULT NULL,
  `mainClassificationId` int(11) DEFAULT NULL,
  `subClassificationId` int(11) DEFAULT NULL,
  `yearOfPublishing` int(11) DEFAULT NULL,
  `lastPrintedYear` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  KEY `mainClassification_idx` (`mainClassificationId`),
  KEY `subClassification_idx` (`subClassificationId`),
  CONSTRAINT `mainClassification` FOREIGN KEY (`mainClassificationId`) REFERENCES `main_classification` (`mainclassificationId`) ON UPDATE NO ACTION,
  CONSTRAINT `subClassification` FOREIGN KEY (`subClassificationId`) REFERENCES `sub_classification` (`subClassificationId`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'ISBN 883-443-334','Trigonometry','L.Lee','Ben',0,13,8,2009,2010),(2,'','Art of ENT','','',0,1,25,0,0),(3,'ISBN 123-443-334','Hinduism','Gandhi','Sun',0,29,29,0,0),(4,'ISBN 4454-3433-242','Green Tea','Mathews','Harrods',130,1,2,1955,1971),(6,'isbn123','Tree','Green','Harrods',456,14,5,1512,1528),(12,'ISBN 123-443-334','Science of Accupuncture','Lee','Yuang',456,1,2,1941,1954),(34,'ISBN 123-443-334','Archie','Star','Sun',399,28,13,2013,2014),(235,'ISBN 123-443-334','test','','',145,1,9,2000,2001),(345,'ISBN 123-443-334','title','','',0,29,29,0,0),(454,'ISBN 123-443-334','Spy1','','',0,26,10,0,0),(3234,'ISBN 123-443-334','Dynamics','Green','Ben',123,13,4,1998,2014),(3456,'ISBN  2345-3335-55','Nuclear Physics','Foster','Ben',456,14,5,1990,1991),(4545,'ISBN 123-443-334','title1','asddas','',0,2,3,0,0),(34523,'ISBN 234-665-334','Sculpture','Venkat','Max',0,2,3,1516,1534),(65432,'ISBN 2345-5443-2333','Neurology','Ferry','Max',765,1,2,2009,2010);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_classification`
--

DROP TABLE IF EXISTS `main_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_classification` (
  `mainclassificationId` int(11) NOT NULL AUTO_INCREMENT,
  `mainClassificationName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mainclassificationId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_classification`
--

LOCK TABLES `main_classification` WRITE;
/*!40000 ALTER TABLE `main_classification` DISABLE KEYS */;
INSERT INTO `main_classification` VALUES (1,'Medicine'),(2,'Arts'),(12,'Engineering'),(13,'Mathematics'),(14,'Science'),(15,'Geography'),(24,'Non Fiction'),(26,'Fiction '),(28,'Novels'),(29,'Culture');
/*!40000 ALTER TABLE `main_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_classification`
--

DROP TABLE IF EXISTS `sub_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_classification` (
  `subClassificationId` int(11) NOT NULL AUTO_INCREMENT,
  `subClassificationName` varchar(45) DEFAULT NULL,
  `mainClassificationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`subClassificationId`),
  KEY `FK_mainClassification_idx` (`mainClassificationId`),
  CONSTRAINT `FK_mainClassification` FOREIGN KEY (`mainClassificationId`) REFERENCES `main_classification` (`mainclassificationId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_classification`
--

LOCK TABLES `sub_classification` WRITE;
/*!40000 ALTER TABLE `sub_classification` DISABLE KEYS */;
INSERT INTO `sub_classification` VALUES (2,'Ayurvedic',1),(3,'Fine Arts',2),(4,'Applied Maths',13),(5,'Nuclear science ',14),(7,'Drawing',2),(8,'Algebra',13),(9,'Accupuncture',1),(10,'Thriller',26),(11,'Software Engineering',12),(12,'Civil Engineering',12),(13,'Detective',28),(15,'Natural Science',14),(25,'ENT',1),(26,'Pure mathematics',13),(28,'neurology',1),(29,'Hindu',29),(30,'Dental',1),(31,'Land',15),(32,'Water',15),(33,'Horror',28);
/*!40000 ALTER TABLE `sub_classification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-21 13:05:24
