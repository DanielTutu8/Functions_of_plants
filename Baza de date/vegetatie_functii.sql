-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: vegetatie
-- ------------------------------------------------------
-- Server version	5.7.24-log

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
-- Table structure for table `functii`
--

DROP TABLE IF EXISTS `functii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `functii` (
  `idfunctie` int(11) NOT NULL AUTO_INCREMENT,
  `idcaracteristica` int(11) DEFAULT NULL,
  `idplanta` int(11) DEFAULT NULL,
  `DataDescoperire` varchar(45) DEFAULT NULL,
  `Daunatoare` varchar(45) DEFAULT NULL,
  `Dimensiune` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idfunctie`),
  KEY `fk_link_1_idx` (`idplanta`),
  KEY `fk_link_2_idx` (`idcaracteristica`),
  CONSTRAINT `fk_link_1` FOREIGN KEY (`idplanta`) REFERENCES `plante` (`idplanta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_link_2` FOREIGN KEY (`idcaracteristica`) REFERENCES `caracteristici` (`idcaracteristica`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functii`
--

LOCK TABLES `functii` WRITE;
/*!40000 ALTER TABLE `functii` DISABLE KEYS */;
INSERT INTO `functii` VALUES (10,30,19,'10ian1990','Nu','Marecd'),(11,30,19,'fsdd','sfdsf','fdsfdsf');
/*!40000 ALTER TABLE `functii` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-24 21:34:05
