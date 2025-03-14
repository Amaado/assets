-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: proyecto_orm
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `id_depto` int(11) NOT NULL AUTO_INCREMENT,
  `nom_depto` char(32) NOT NULL,
  `id_sede` int(11) NOT NULL,
  PRIMARY KEY (`id_depto`),
  KEY `id_sede` (`id_sede`),
  CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES
(1,'Recursos Humanos',1),
(2,'Tecnología',2),
(3,'Marketing',3),
(4,'Finanzas',1),
(5,'Desarrollo',2),
(6,'Atención al Cliente',3);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `dni` char(9) NOT NULL,
  `nom_emp` char(40) NOT NULL,
  `id_depto` int(11) NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `fk_depto_sede` (`id_depto`),
  CONSTRAINT `fk_depto_sede` FOREIGN KEY (`id_depto`) REFERENCES `departamento` (`id_depto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES
('12345678A','Juan Pérez',1),
('23456789B','Ana López',2),
('34567890C','Carlos García',3),
('76543210Z','Pedro Martínez',3),
('87654321Y','Marta Fernández',2),
('98765432X','Luis García',1);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_datos_prof`
--

DROP TABLE IF EXISTS `empleado_datos_prof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado_datos_prof` (
  `dni` char(9) NOT NULL,
  `categoria` char(2) NOT NULL,
  `sueldo_bruto_anual` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  CONSTRAINT `fk_empleado_depto` FOREIGN KEY (`dni`) REFERENCES `empleado` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_datos_prof`
--

LOCK TABLES `empleado_datos_prof` WRITE;
/*!40000 ALTER TABLE `empleado_datos_prof` DISABLE KEYS */;
INSERT INTO `empleado_datos_prof` VALUES
('12345678A','A1',30000.00),
('23456789B','B1',45000.00),
('34567890C','C1',35000.00),
('76543210Z','C2',38000.00),
('87654321Y','B2',55000.00),
('98765432X','A2',42000.00);
/*!40000 ALTER TABLE `empleado_datos_prof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `id_proy` int(11) NOT NULL AUTO_INCREMENT,
  `f_inicio` date NOT NULL,
  `f_fin` date DEFAULT NULL,
  `nom_proy` char(20) NOT NULL,
  PRIMARY KEY (`id_proy`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES
(1,'2025-01-01','2025-12-31','Proyecto Alpha'),
(2,'2025-02-01','2025-08-31','Proyecto Beta'),
(3,'2025-03-01',NULL,'Proyecto Gamma'),
(4,'2025-06-01','2025-12-31','Proyecto Delta'),
(5,'2025-07-15','2025-11-30','Proyecto Epsilon'),
(6,'2025-08-01',NULL,'Proyecto Zeta');
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_sede`
--

DROP TABLE IF EXISTS `proyecto_sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_sede` (
  `id_proy` int(11) NOT NULL,
  `id_sede` int(11) NOT NULL,
  `f_inicio` date NOT NULL,
  `f_fin` date DEFAULT NULL,
  PRIMARY KEY (`id_proy`,`id_sede`),
  KEY `fk_proysede_sede` (`id_sede`),
  CONSTRAINT `fk_proysede_proy` FOREIGN KEY (`id_proy`) REFERENCES `proyecto` (`id_proy`),
  CONSTRAINT `fk_proysede_sede` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_sede`
--

LOCK TABLES `proyecto_sede` WRITE;
/*!40000 ALTER TABLE `proyecto_sede` DISABLE KEYS */;
INSERT INTO `proyecto_sede` VALUES
(1,1,'2025-01-01','2025-12-31'),
(2,2,'2025-02-01','2025-08-31'),
(3,3,'2025-03-01',NULL);
/*!40000 ALTER TABLE `proyecto_sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sede` (
  `id_sede` int(11) NOT NULL AUTO_INCREMENT,
  `nom_sede` char(20) NOT NULL,
  PRIMARY KEY (`id_sede`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES
(1,'Sede Central'),
(2,'Sede Norte'),
(3,'Sede Sur'),
(4,'Sede Madrid'),
(5,'Sede Barcelona'),
(6,'Sede Valencia');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-09 15:00:03
