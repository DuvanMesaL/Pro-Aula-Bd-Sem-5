CREATE DATABASE  IF NOT EXISTS `appeventmanager` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `appeventmanager`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: appeventmanager
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `empresasorganizadoras`
--

DROP TABLE IF EXISTS `empresasorganizadoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresasorganizadoras` (
  `EmpresaID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `Calle` varchar(255) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Estado` varchar(100) DEFAULT NULL,
  `CodigoPostal` varchar(10) DEFAULT NULL,
  `Descripcion` text,
  PRIMARY KEY (`EmpresaID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresasorganizadoras`
--

LOCK TABLES `empresasorganizadoras` WRITE;
/*!40000 ALTER TABLE `empresasorganizadoras` DISABLE KEYS */;
INSERT INTO `empresasorganizadoras` VALUES (1,'Empresa A','contacto@empresaa.com','Calle Empresa 1','Ciudad A','Estado A','11111','Descripción de Empresa A'),(2,'Empresa B','contacto@empresab.com','Calle Empresa 2','Ciudad B','Estado B','22222','Descripción de Empresa B'),(3,'Empresa A','contacto@empresaa.com','Calle Empresa 1','Ciudad A','Estado A','11111','Descripción de Empresa A'),(4,'Empresa B','contacto@empresab.com','Calle Empresa 2','Ciudad B','Estado B','22222','Descripción de Empresa B'),(5,'Empresa C','contacto@empresac.com','Calle Empresa 3','Ciudad C','Estado C','33333','Descripción de Empresa C');
/*!40000 ALTER TABLE `empresasorganizadoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `EventoID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `LugarID` int DEFAULT NULL,
  `ClienteID` int DEFAULT NULL,
  `Descripcion` text,
  PRIMARY KEY (`EventoID`),
  KEY `FK_Eventos_Lugares` (`LugarID`),
  KEY `FK_Eventos_Usuarios` (`ClienteID`),
  CONSTRAINT `FK_Eventos_Lugares` FOREIGN KEY (`LugarID`) REFERENCES `lugares` (`LugarID`),
  CONSTRAINT `FK_Eventos_Usuarios` FOREIGN KEY (`ClienteID`) REFERENCES `usuarios` (`UsuarioID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'Evento A','Tipo A','2024-06-01',1,1,'Descripción del Evento A'),(2,'Evento B','Tipo B','2024-07-01',2,2,'Descripción del Evento B'),(3,'Evento A','Tipo A','2024-06-01',1,1,'Descripción del Evento A'),(4,'Evento B','Tipo B','2024-07-01',2,2,'Descripción del Evento B'),(5,'Evento C','Tipo C','2024-08-01',1,1,'Descripción del Evento C');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugares`
--

DROP TABLE IF EXISTS `lugares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugares` (
  `LugarID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `Calle` varchar(255) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Estado` varchar(100) DEFAULT NULL,
  `CodigoPostal` varchar(10) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Capacidad` int DEFAULT NULL,
  `Descripcion` text,
  PRIMARY KEY (`LugarID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugares`
--

LOCK TABLES `lugares` WRITE;
/*!40000 ALTER TABLE `lugares` DISABLE KEYS */;
INSERT INTO `lugares` VALUES (1,'Lugar A','Calle Lugar 1','Ciudad A','Estado A','11111','Tipo A',100,'Descripción del Lugar A'),(2,'Lugar B','Calle Lugar 2','Ciudad B','Estado B','22222','Tipo B',200,'Descripción del Lugar B'),(3,'Lugar A','Calle Lugar 1','Ciudad A','Estado A','11111','Tipo A',100,'Descripción del Lugar A'),(4,'Lugar B','Calle Lugar 2','Ciudad B','Estado B','22222','Tipo B',200,'Descripción del Lugar B'),(5,'Lugar C','Calle Lugar 3','Ciudad C','Estado C','33333','Tipo C',300,'Descripción del Lugar C');
/*!40000 ALTER TABLE `lugares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `PermisoID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PermisoID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,'Leer'),(2,'Escribir'),(3,'Leer'),(4,'Escribir'),(5,'Eliminar');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planificaciones`
--

DROP TABLE IF EXISTS `planificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planificaciones` (
  `PlanificacionID` int NOT NULL AUTO_INCREMENT,
  `EventoID` int DEFAULT NULL,
  `ProveedorID` int DEFAULT NULL,
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

--
-- Table structure for table `presupuestos`
--

DROP TABLE IF EXISTS `presupuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presupuestos` (
  `PresupuestoID` int NOT NULL AUTO_INCREMENT,
  `EventoID` int DEFAULT NULL,
  `EmpresaID` int DEFAULT NULL,
  `Monto` decimal(10,2) DEFAULT NULL,
  `FechaEnvio` date DEFAULT NULL,
  `Descripcion` text,
  PRIMARY KEY (`PresupuestoID`),
  KEY `FK_Presupuestos_Eventos` (`EventoID`),
  KEY `FK_Presupuestos_EmpresasOrganizadoras` (`EmpresaID`),
  CONSTRAINT `FK_Presupuestos_EmpresasOrganizadoras` FOREIGN KEY (`EmpresaID`) REFERENCES `empresasorganizadoras` (`EmpresaID`),
  CONSTRAINT `FK_Presupuestos_Eventos` FOREIGN KEY (`EventoID`) REFERENCES `eventos` (`EventoID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presupuestos`
--

LOCK TABLES `presupuestos` WRITE;
/*!40000 ALTER TABLE `presupuestos` DISABLE KEYS */;
INSERT INTO `presupuestos` VALUES (1,1,1,1000.00,'2024-05-19','Presupuesto para Evento A'),(2,2,2,2000.00,'2024-05-20','Presupuesto para Evento B'),(3,1,1,1000.00,'2024-05-19','Presupuesto para Evento A'),(4,2,2,2000.00,'2024-05-20','Presupuesto para Evento B'),(5,1,1,1500.00,'2024-06-19','Presupuesto para Evento C');
/*!40000 ALTER TABLE `presupuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `ProveedorID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Descripcion` text,
  PRIMARY KEY (`ProveedorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Proveedor A','contacto@proveedora.com','Tipo A','Descripción del Proveedor A'),(2,'Proveedor B','contacto@proveedorb.com','Tipo B','Descripción del Proveedor B'),(3,'Proveedor A','contacto@proveedora.com','Tipo A','Descripción del Proveedor A'),(4,'Proveedor B','contacto@proveedorb.com','Tipo B','Descripción del Proveedor B'),(5,'Proveedor C','contacto@proveedorc.com','Tipo C','Descripción del Proveedor C');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `RolID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RolID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(2,'Usuario'),(3,'Administrador'),(4,'Usuario'),(5,'Moderador');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolpermiso`
--

DROP TABLE IF EXISTS `rolpermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rolpermiso` (
  `RolPermisoID` int NOT NULL AUTO_INCREMENT,
  `RolID` int DEFAULT NULL,
  `PermisoID` int DEFAULT NULL,
  PRIMARY KEY (`RolPermisoID`),
  KEY `FK_RolPermiso_Roles` (`RolID`),
  KEY `FK_RolPermiso_Permisos` (`PermisoID`),
  CONSTRAINT `FK_RolPermiso_Permisos` FOREIGN KEY (`PermisoID`) REFERENCES `permisos` (`PermisoID`),
  CONSTRAINT `FK_RolPermiso_Roles` FOREIGN KEY (`RolID`) REFERENCES `roles` (`RolID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolpermiso`
--

LOCK TABLES `rolpermiso` WRITE;
/*!40000 ALTER TABLE `rolpermiso` DISABLE KEYS */;
INSERT INTO `rolpermiso` VALUES (1,1,1),(2,2,2),(3,1,1),(4,2,2),(5,1,2);
/*!40000 ALTER TABLE `rolpermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonosempresa`
--

DROP TABLE IF EXISTS `telefonosempresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonosempresa` (
  `TelefonoID` int NOT NULL AUTO_INCREMENT,
  `EmpresaID` int DEFAULT NULL,
  `Numero` varchar(20) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TelefonoID`),
  KEY `FK_TelefonosEmpresa_EmpresasOrganizadoras` (`EmpresaID`),
  CONSTRAINT `FK_TelefonosEmpresa_EmpresasOrganizadoras` FOREIGN KEY (`EmpresaID`) REFERENCES `empresasorganizadoras` (`EmpresaID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonosempresa`
--

LOCK TABLES `telefonosempresa` WRITE;
/*!40000 ALTER TABLE `telefonosempresa` DISABLE KEYS */;
INSERT INTO `telefonosempresa` VALUES (1,1,'1234567890','Oficina'),(2,2,'0987654321','Soporte'),(3,1,'1234567890','Oficina'),(4,2,'0987654321','Soporte'),(5,1,'2233445566','Ventas');
/*!40000 ALTER TABLE `telefonosempresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonosproveedores`
--

DROP TABLE IF EXISTS `telefonosproveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonosproveedores` (
  `TelefonoID` int NOT NULL AUTO_INCREMENT,
  `ProveedorID` int DEFAULT NULL,
  `Numero` varchar(20) DEFAULT NULL,
  `Emergencia` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`TelefonoID`),
  KEY `FK_TelefonosProveedores_Proveedores` (`ProveedorID`),
  CONSTRAINT `FK_TelefonosProveedores_Proveedores` FOREIGN KEY (`ProveedorID`) REFERENCES `proveedores` (`ProveedorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonosproveedores`
--

LOCK TABLES `telefonosproveedores` WRITE;
/*!40000 ALTER TABLE `telefonosproveedores` DISABLE KEYS */;
INSERT INTO `telefonosproveedores` VALUES (1,1,'1234567890',1),(2,2,'0987654321',0),(3,1,'1234567890',1),(4,2,'0987654321',0),(5,1,'3344556677',1);
/*!40000 ALTER TABLE `telefonosproveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonosusuario`
--

DROP TABLE IF EXISTS `telefonosusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonosusuario` (
  `TelefonoID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int DEFAULT NULL,
  `Numero` varchar(20) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TelefonoID`),
  KEY `FK_TelefonosUsuario_Usuarios` (`UsuarioID`),
  CONSTRAINT `FK_TelefonosUsuario_Usuarios` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonosusuario`
--

LOCK TABLES `telefonosusuario` WRITE;
/*!40000 ALTER TABLE `telefonosusuario` DISABLE KEYS */;
INSERT INTO `telefonosusuario` VALUES (1,1,'1234567890','Móvil'),(2,2,'0987654321','Casa'),(3,1,'1234567890','Móvil'),(4,2,'0987654321','Casa'),(5,1,'1122334455','Trabajo');
/*!40000 ALTER TABLE `telefonosusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `UsuarioID` int NOT NULL AUTO_INCREMENT,
  `PrimerNombre` varchar(255) DEFAULT NULL,
  `SegundoNombre` varchar(255) DEFAULT NULL,
  `PrimerApellido` varchar(255) DEFAULT NULL,
  `SegundoApellido` varchar(255) DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `Contraseña` varchar(255) DEFAULT NULL,
  `Calle` varchar(255) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Estado` varchar(100) DEFAULT NULL,
  `CodigoPostal` varchar(10) DEFAULT NULL,
  `RolID` int DEFAULT NULL,
  PRIMARY KEY (`UsuarioID`),
  KEY `FK_Usuarios_Roles` (`RolID`),
  CONSTRAINT `FK_Usuarios_Roles` FOREIGN KEY (`RolID`) REFERENCES `roles` (`RolID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan','Carlos','Pérez','García','juan.perez@example.com','password123','Calle Falsa 123','Ciudad','Estado','12345',1),(2,'María','Luisa','Martínez','López','maria.martinez@example.com','password123','Avenida Siempre Viva 742','Otra Ciudad','Otro Estado','54321',2),(3,'Juan','Carlos','Pérez','García','juan.perez@example.com','password123','Calle Falsa 123','Ciudad','Estado','12345',1),(4,'María','Luisa','Martínez','López','maria.martinez@example.com','password123','Avenida Siempre Viva 742','Otra Ciudad','Otro Estado','54321',2),(5,'Luis','Fernando','Gómez','Pérez','luis.gomez@example.com','password123','Calle Nueva 123','Ciudad X','Estado Y','67890',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `viewbudgetsbyevent`
--

DROP TABLE IF EXISTS `viewbudgetsbyevent`;
/*!50001 DROP VIEW IF EXISTS `viewbudgetsbyevent`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewbudgetsbyevent` AS SELECT 
 1 AS `EventID`,
 1 AS `EventName`,
 1 AS `BudgetID`,
 1 AS `Amount`,
 1 AS `SentDate`,
 1 AS `Company`,
 1 AS `Description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `viewclientswithupcomingevents`
--

DROP TABLE IF EXISTS `viewclientswithupcomingevents`;
/*!50001 DROP VIEW IF EXISTS `viewclientswithupcomingevents`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewclientswithupcomingevents` AS SELECT 
 1 AS `ClientID`,
 1 AS `Client`,
 1 AS `EventName`,
 1 AS `EventDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `viewcontactdetailscompanies`
--

DROP TABLE IF EXISTS `viewcontactdetailscompanies`;
/*!50001 DROP VIEW IF EXISTS `viewcontactdetailscompanies`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewcontactdetailscompanies` AS SELECT 
 1 AS `CompanyName`,
 1 AS `Email`,
 1 AS `Phone`,
 1 AS `PhoneType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `viewcontactdetailsproviders`
--

DROP TABLE IF EXISTS `viewcontactdetailsproviders`;
/*!50001 DROP VIEW IF EXISTS `viewcontactdetailsproviders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewcontactdetailsproviders` AS SELECT 
 1 AS `ProviderName`,
 1 AS `Email`,
 1 AS `Phone`,
 1 AS `Emergency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vieweventsbycompany`
--

DROP TABLE IF EXISTS `vieweventsbycompany`;
/*!50001 DROP VIEW IF EXISTS `vieweventsbycompany`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vieweventsbycompany` AS SELECT 
 1 AS `EventoID`,
 1 AS `EventName`,
 1 AS `EventType`,
 1 AS `EventDate`,
 1 AS `Venue`,
 1 AS `Client`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vieweventsbyprovider`
--

DROP TABLE IF EXISTS `vieweventsbyprovider`;
/*!50001 DROP VIEW IF EXISTS `vieweventsbyprovider`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vieweventsbyprovider` AS SELECT 
 1 AS `ProviderID`,
 1 AS `ProviderName`,
 1 AS `EventID`,
 1 AS `EventName`,
 1 AS `EventType`,
 1 AS `EventDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vieweventsbyvenue`
--

DROP TABLE IF EXISTS `vieweventsbyvenue`;
/*!50001 DROP VIEW IF EXISTS `vieweventsbyvenue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vieweventsbyvenue` AS SELECT 
 1 AS `VenueID`,
 1 AS `VenueName`,
 1 AS `EventID`,
 1 AS `EventName`,
 1 AS `EventType`,
 1 AS `EventDate`,
 1 AS `Client`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vieweventsclientsproviders`
--

DROP TABLE IF EXISTS `vieweventsclientsproviders`;
/*!50001 DROP VIEW IF EXISTS `vieweventsclientsproviders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vieweventsclientsproviders` AS SELECT 
 1 AS `EventID`,
 1 AS `EventName`,
 1 AS `Client`,
 1 AS `Provider`,
 1 AS `ProviderType`,
 1 AS `Details`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `viewpermissionsbyrole`
--

DROP TABLE IF EXISTS `viewpermissionsbyrole`;
/*!50001 DROP VIEW IF EXISTS `viewpermissionsbyrole`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewpermissionsbyrole` AS SELECT 
 1 AS `Role`,
 1 AS `Permission`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `viewprovidersbyevent`
--

DROP TABLE IF EXISTS `viewprovidersbyevent`;
/*!50001 DROP VIEW IF EXISTS `viewprovidersbyevent`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewprovidersbyevent` AS SELECT 
 1 AS `EventoID`,
 1 AS `EventName`,
 1 AS `ProveedorID`,
 1 AS `ProviderName`,
 1 AS `ProviderType`,
 1 AS `Details`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `viewbudgetsbyevent`
--

/*!50001 DROP VIEW IF EXISTS `viewbudgetsbyevent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewbudgetsbyevent` AS select `e`.`EventoID` AS `EventID`,`e`.`Nombre` AS `EventName`,`p`.`PresupuestoID` AS `BudgetID`,`p`.`Monto` AS `Amount`,`p`.`FechaEnvio` AS `SentDate`,`eo`.`Nombre` AS `Company`,`p`.`Descripcion` AS `Description` from ((`presupuestos` `p` join `eventos` `e` on((`p`.`EventoID` = `e`.`EventoID`))) join `empresasorganizadoras` `eo` on((`p`.`EmpresaID` = `eo`.`EmpresaID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewclientswithupcomingevents`
--

/*!50001 DROP VIEW IF EXISTS `viewclientswithupcomingevents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewclientswithupcomingevents` AS select `u`.`UsuarioID` AS `ClientID`,concat(`u`.`PrimerNombre`,' ',`u`.`PrimerApellido`) AS `Client`,`e`.`Nombre` AS `EventName`,`e`.`Fecha` AS `EventDate` from (`usuarios` `u` join `eventos` `e` on((`u`.`UsuarioID` = `e`.`ClienteID`))) where (`e`.`Fecha` >= curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewcontactdetailscompanies`
--

/*!50001 DROP VIEW IF EXISTS `viewcontactdetailscompanies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewcontactdetailscompanies` AS select `eo`.`Nombre` AS `CompanyName`,`eo`.`Correo` AS `Email`,`te`.`Numero` AS `Phone`,`te`.`Tipo` AS `PhoneType` from (`empresasorganizadoras` `eo` left join `telefonosempresa` `te` on((`eo`.`EmpresaID` = `te`.`EmpresaID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewcontactdetailsproviders`
--

/*!50001 DROP VIEW IF EXISTS `viewcontactdetailsproviders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewcontactdetailsproviders` AS select `p`.`Nombre` AS `ProviderName`,`p`.`Correo` AS `Email`,`tp`.`Numero` AS `Phone`,`tp`.`Emergencia` AS `Emergency` from (`proveedores` `p` left join `telefonosproveedores` `tp` on((`p`.`ProveedorID` = `tp`.`ProveedorID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vieweventsbycompany`
--

/*!50001 DROP VIEW IF EXISTS `vieweventsbycompany`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vieweventsbycompany` AS select `e`.`EventoID` AS `EventoID`,`e`.`Nombre` AS `EventName`,`e`.`Tipo` AS `EventType`,`e`.`Fecha` AS `EventDate`,`l`.`Nombre` AS `Venue`,concat(`u`.`PrimerNombre`,' ',`u`.`PrimerApellido`) AS `Client` from ((`eventos` `e` join `lugares` `l` on((`e`.`LugarID` = `l`.`LugarID`))) join `usuarios` `u` on((`e`.`ClienteID` = `u`.`UsuarioID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vieweventsbyprovider`
--

/*!50001 DROP VIEW IF EXISTS `vieweventsbyprovider`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vieweventsbyprovider` AS select `p`.`ProveedorID` AS `ProviderID`,`p`.`Nombre` AS `ProviderName`,`e`.`EventoID` AS `EventID`,`e`.`Nombre` AS `EventName`,`e`.`Tipo` AS `EventType`,`e`.`Fecha` AS `EventDate` from ((`planificaciones` `pp` join `proveedores` `p` on((`pp`.`ProveedorID` = `p`.`ProveedorID`))) join `eventos` `e` on((`pp`.`EventoID` = `e`.`EventoID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vieweventsbyvenue`
--

/*!50001 DROP VIEW IF EXISTS `vieweventsbyvenue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vieweventsbyvenue` AS select `l`.`LugarID` AS `VenueID`,`l`.`Nombre` AS `VenueName`,`e`.`EventoID` AS `EventID`,`e`.`Nombre` AS `EventName`,`e`.`Tipo` AS `EventType`,`e`.`Fecha` AS `EventDate`,concat(`u`.`PrimerNombre`,' ',`u`.`PrimerApellido`) AS `Client` from ((`lugares` `l` join `eventos` `e` on((`l`.`LugarID` = `e`.`LugarID`))) join `usuarios` `u` on((`e`.`ClienteID` = `u`.`UsuarioID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vieweventsclientsproviders`
--

/*!50001 DROP VIEW IF EXISTS `vieweventsclientsproviders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vieweventsclientsproviders` AS select `e`.`EventoID` AS `EventID`,`e`.`Nombre` AS `EventName`,concat(`u`.`PrimerNombre`,' ',`u`.`PrimerApellido`) AS `Client`,`p`.`Nombre` AS `Provider`,`pp`.`Tipo` AS `ProviderType`,`pp`.`Detalles` AS `Details` from (((`eventos` `e` join `usuarios` `u` on((`e`.`ClienteID` = `u`.`UsuarioID`))) join `planificaciones` `pp` on((`e`.`EventoID` = `pp`.`EventoID`))) join `proveedores` `p` on((`pp`.`ProveedorID` = `p`.`ProveedorID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewpermissionsbyrole`
--

/*!50001 DROP VIEW IF EXISTS `viewpermissionsbyrole`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewpermissionsbyrole` AS select `r`.`Nombre` AS `Role`,`pe`.`Nombre` AS `Permission` from ((`rolpermiso` `rp` join `roles` `r` on((`rp`.`RolID` = `r`.`RolID`))) join `permisos` `pe` on((`rp`.`PermisoID` = `pe`.`PermisoID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewprovidersbyevent`
--

/*!50001 DROP VIEW IF EXISTS `viewprovidersbyevent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewprovidersbyevent` AS select `e`.`EventoID` AS `EventoID`,`e`.`Nombre` AS `EventName`,`p`.`ProveedorID` AS `ProveedorID`,`p`.`Nombre` AS `ProviderName`,`p`.`Tipo` AS `ProviderType`,`pp`.`Detalles` AS `Details` from ((`planificaciones` `pp` join `proveedores` `p` on((`pp`.`ProveedorID` = `p`.`ProveedorID`))) join `eventos` `e` on((`pp`.`EventoID` = `e`.`EventoID`))) */;
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

<<<<<<< HEAD
-- Dump completed on 2024-05-20  1:44:57
=======
-- Dump completed on 2024-05-20  0:26:01
>>>>>>> 330afb3f9e2534a7bd6ab2d7353101e4779cacaf
