-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: appeventmanager
-- ------------------------------------------------------
-- Server version	5.7.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `planificaciones`
--

DROP TABLE IF EXISTS `planificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planificaciones` (
  `PlanificacionID` int(11) NOT NULL AUTO_INCREMENT,
  `EventoID` int(11) DEFAULT NULL,
  `ProveedorID` int(11) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Detalles` text,
  PRIMARY KEY (`PlanificacionID`),
  KEY `FK_Planificaciones_Eventos` (`EventoID`),
  KEY `FK_Planificaciones_Proveedores` (`ProveedorID`),
  CONSTRAINT `FK_Planificaciones_Eventos` FOREIGN KEY (`EventoID`) REFERENCES `eventos` (`EventoID`),
  CONSTRAINT `FK_Planificaciones_Proveedores` FOREIGN KEY (`ProveedorID`) REFERENCES `proveedores` (`ProveedorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planificaciones`
--

LOCK TABLES `planificaciones` WRITE;
/*!40000 ALTER TABLE `planificaciones` DISABLE KEYS */;
INSERT INTO `planificaciones` VALUES (1,1,1,'Tipo A','Detalles de la Planificación A'),(2,2,2,'Tipo B','Detalles de la Planificación B'),(3,1,1,'Tipo A','Detalles de la Planificación A'),(4,2,2,'Tipo B','Detalles de la Planificación B'),(5,1,1,'Tipo C','Detalles de la Planificación C');
/*!40000 ALTER TABLE `planificaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19 23:19:03
