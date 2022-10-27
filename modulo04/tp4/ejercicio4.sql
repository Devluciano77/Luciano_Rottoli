-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `Id_Empleado` int NOT NULL AUTO_INCREMENT,
  `DNI` varchar(8) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Fecha_alta` date NOT NULL,
  `LOCALIDAD_Codigo_localidad` int NOT NULL,
  PRIMARY KEY (`Id_Empleado`,`LOCALIDAD_Codigo_localidad`),
  KEY `fk_EMPLEADO_LOCALIDAD1_idx` (`LOCALIDAD_Codigo_localidad`),
  CONSTRAINT `fk_EMPLEADO_LOCALIDAD1` FOREIGN KEY (`LOCALIDAD_Codigo_localidad`) REFERENCES `localidad` (`Codigo_localidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'50685586','Javier','3743421600','javier@gmail.com','2022-10-10',1),(2,'50685959','Jano','3743421700','jano@gmail.com','2022-10-10',1),(3,'50685556','Mariana','3743421800','Mariana@gmail.com','2022-10-10',2);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidad` (
  `Codigo_localidad` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Codigo_Postal` varchar(5) NOT NULL,
  `PROVINCIA_ID_Provincia` int NOT NULL,
  `PROVINCIA_PAIS_ID_pais` int NOT NULL,
  PRIMARY KEY (`Codigo_localidad`,`PROVINCIA_ID_Provincia`,`PROVINCIA_PAIS_ID_pais`),
  KEY `fk_LOCALIDAD_PROVINCIA1_idx` (`PROVINCIA_ID_Provincia`,`PROVINCIA_PAIS_ID_pais`),
  CONSTRAINT `fk_LOCALIDAD_PROVINCIA1` FOREIGN KEY (`PROVINCIA_ID_Provincia`, `PROVINCIA_PAIS_ID_pais`) REFERENCES `provincia` (`ID_Provincia`, `PAIS_ID_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (1,'Posadas','3232',1,1),(2,'Capiovi','3233',1,1),(3,'Obera','5555',1,1);
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `ID_pais` int NOT NULL AUTO_INCREMENT,
  `Nombre_Pais` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_pais`),
  UNIQUE KEY `Nombre_Pais_UNIQUE` (`Nombre_Pais`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Argentina'),(2,'Brasil'),(3,'Uruguay');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `ID_Provincia` int NOT NULL AUTO_INCREMENT,
  `Nombre_Provincia` varchar(45) NOT NULL,
  `PAIS_ID_pais` int NOT NULL,
  PRIMARY KEY (`ID_Provincia`,`PAIS_ID_pais`),
  KEY `fk_PROVINCIA_PAIS_idx` (`PAIS_ID_pais`),
  CONSTRAINT `fk_PROVINCIA_PAIS` FOREIGN KEY (`PAIS_ID_pais`) REFERENCES `pais` (`ID_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Misiones',1),(2,'Corrientes',1),(3,'Chaco',1);
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-27 17:48:19
