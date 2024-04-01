CREATE DATABASE  IF NOT EXISTS `veterinaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `veterinaria`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: veterinaria
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `dim_dueño`
--

DROP TABLE IF EXISTS `dim_dueño`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_dueño` (
  `id_dueño` int NOT NULL AUTO_INCREMENT,
  `nombre_dueño` varchar(30) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_dueño`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_dueño`
--

LOCK TABLES `dim_dueño` WRITE;
/*!40000 ALTER TABLE `dim_dueño` DISABLE KEYS */;
INSERT INTO `dim_dueño` VALUES (1,'María','0991238976','Calle 23 x 45 s/n'),(2,'Laura','9491238976','colonia padre 34 c'),(3,'Maribel','1991238976','calle 34 x 45'),(4,'Rubí','9911238976','34 x 5 ni 1'),(5,'Daniela','9391238976','Calle 34 x 56 colonia'),(6,'Mario','9992238976','Calle 11 x 18 s/n');
/*!40000 ALTER TABLE `dim_dueño` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_mascota`
--

DROP TABLE IF EXISTS `dim_mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_mascota` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre_mascota` varchar(30) DEFAULT NULL,
  `fk_veterinario` int NOT NULL,
  `fk_dueño` int NOT NULL,
  PRIMARY KEY (`id_mascota`),
  KEY `fk_veterinario` (`fk_veterinario`),
  KEY `fk_dueño` (`fk_dueño`),
  CONSTRAINT `dim_mascota_ibfk_1` FOREIGN KEY (`fk_veterinario`) REFERENCES `veterinario` (`id_v`),
  CONSTRAINT `dim_mascota_ibfk_2` FOREIGN KEY (`fk_dueño`) REFERENCES `dueño` (`id_dueño`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_mascota`
--

LOCK TABLES `dim_mascota` WRITE;
/*!40000 ALTER TABLE `dim_mascota` DISABLE KEYS */;
INSERT INTO `dim_mascota` VALUES (1,'Pupi',1,2),(2,'Perla',4,1),(3,'Baxter',5,3),(4,'Garfield',3,5),(5,'Pelos',2,4),(6,'Conchito',6,1);
/*!40000 ALTER TABLE `dim_mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_medicina`
--

DROP TABLE IF EXISTS `dim_medicina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_medicina` (
  `id_medicina` int NOT NULL AUTO_INCREMENT,
  `nombre_medicina` varchar(30) DEFAULT NULL,
  `fk_tipo` int NOT NULL,
  `precio` double DEFAULT NULL,
  PRIMARY KEY (`id_medicina`),
  KEY `fk_tipo` (`fk_tipo`),
  CONSTRAINT `dim_medicina_ibfk_1` FOREIGN KEY (`fk_tipo`) REFERENCES `tipo` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_medicina`
--

LOCK TABLES `dim_medicina` WRITE;
/*!40000 ALTER TABLE `dim_medicina` DISABLE KEYS */;
INSERT INTO `dim_medicina` VALUES (1,'Isoflurano 200g',1,120),(2,'Desecante Gel 10g',2,500),(3,'Adarfac 50g',3,300),(4,'Ruinald Omega 60g',4,100),(5,'Gotas 150g',5,900);
/*!40000 ALTER TABLE `dim_medicina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_veterinario`
--

DROP TABLE IF EXISTS `dim_veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_veterinario` (
  `id_vet` int NOT NULL AUTO_INCREMENT,
  `nombre_vet` varchar(30) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_vet`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_veterinario`
--

LOCK TABLES `dim_veterinario` WRITE;
/*!40000 ALTER TABLE `dim_veterinario` DISABLE KEYS */;
INSERT INTO `dim_veterinario` VALUES (1,'Yulissa Pérez','9995678909'),(2,'Wiliam López','9933456790'),(3,'Jorge López','9993454790'),(4,'Rousaura Tamara','9994456790'),(5,'Carolina Briceño','9995456790'),(6,'Carlos Palomo','9992456790'),(7,'Pablo Eúan','9990456790'),(8,'Alondra Martínez','9992456790'),(9,'Laura Alvarez','9993456790');
/*!40000 ALTER TABLE `dim_veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dueño`
--

DROP TABLE IF EXISTS `dueño`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dueño` (
  `id_dueño` int NOT NULL AUTO_INCREMENT,
  `nombre_dueño` varchar(30) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `fk_mascota` int NOT NULL,
  PRIMARY KEY (`id_dueño`),
  KEY `fk_mascota` (`fk_mascota`),
  CONSTRAINT `dueño_ibfk_1` FOREIGN KEY (`fk_mascota`) REFERENCES `mascotas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dueño`
--

LOCK TABLES `dueño` WRITE;
/*!40000 ALTER TABLE `dueño` DISABLE KEYS */;
INSERT INTO `dueño` VALUES (1,'María','0991238976','Calle 23 x 45 s/n',1),(2,'Laura','9491238976','colonia padre 34 c',2),(3,'Maribel','1991238976','calle 34 x 45',3),(4,'Rubí','9911238976','34 x 5 ni 1',4),(5,'Daniela','9391238976','Calle 34 x 56 colonia',5),(6,'Mario','9992238976','Calle 11 x 18 s/n',6);
/*!40000 ALTER TABLE `dueño` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hecho_visita`
--

DROP TABLE IF EXISTS `hecho_visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hecho_visita` (
  `id_visita` int NOT NULL AUTO_INCREMENT,
  `fk_mascota` int NOT NULL,
  `fk_veterinario` int NOT NULL,
  `fk_medicina` int NOT NULL,
  `precio_medicina` double DEFAULT NULL,
  PRIMARY KEY (`id_visita`),
  KEY `fk_mascota` (`fk_mascota`),
  KEY `fk_veterinario` (`fk_veterinario`),
  KEY `fk_medicina` (`fk_medicina`),
  CONSTRAINT `hecho_visita_ibfk_1` FOREIGN KEY (`fk_mascota`) REFERENCES `dim_mascota` (`id_mascota`),
  CONSTRAINT `hecho_visita_ibfk_2` FOREIGN KEY (`fk_veterinario`) REFERENCES `dim_veterinario` (`id_vet`),
  CONSTRAINT `hecho_visita_ibfk_3` FOREIGN KEY (`fk_medicina`) REFERENCES `dim_medicina` (`id_medicina`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hecho_visita`
--

LOCK TABLES `hecho_visita` WRITE;
/*!40000 ALTER TABLE `hecho_visita` DISABLE KEYS */;
INSERT INTO `hecho_visita` VALUES (1,2,4,1,120),(2,6,6,1,120),(3,1,1,2,500),(4,3,5,3,300),(5,5,2,4,100),(6,4,3,5,900);
/*!40000 ALTER TABLE `hecho_visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `fk_medicina` int NOT NULL,
  `fk_veterinario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_medicina` (`fk_medicina`),
  KEY `fk_veterinario` (`fk_veterinario`),
  CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`fk_medicina`) REFERENCES `medicinas` (`id_medicina`),
  CONSTRAINT `mascotas_ibfk_2` FOREIGN KEY (`fk_veterinario`) REFERENCES `veterinario` (`id_v`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascotas`
--

LOCK TABLES `mascotas` WRITE;
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
INSERT INTO `mascotas` VALUES (1,'Pupi',2,1),(2,'Perla',1,4),(3,'Baxter',3,5),(4,'Garfield',5,3),(5,'Pelos',4,2),(6,'Conchito',1,6);
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicinas`
--

DROP TABLE IF EXISTS `medicinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicinas` (
  `id_medicina` int NOT NULL AUTO_INCREMENT,
  `nombre_medicina` varchar(30) DEFAULT NULL,
  `fk_tipo` int NOT NULL,
  PRIMARY KEY (`id_medicina`),
  KEY `fk_tipo` (`fk_tipo`),
  CONSTRAINT `medicinas_ibfk_1` FOREIGN KEY (`fk_tipo`) REFERENCES `tipo` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicinas`
--

LOCK TABLES `medicinas` WRITE;
/*!40000 ALTER TABLE `medicinas` DISABLE KEYS */;
INSERT INTO `medicinas` VALUES (1,'Isoflurano 200g',1),(2,'Desecante Gel 10g',2),(3,'Adarfac 50g',3),(4,'Ruinald Omega 60g',4),(5,'Gotas 150g',5);
/*!40000 ALTER TABLE `medicinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(30) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'Antiparasitarios',120),(2,'Inyectables',500),(3,'Orales',300),(4,'Tópicos intraoculares',100),(5,'Antibióticos',900);
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinario`
--

DROP TABLE IF EXISTS `veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinario` (
  `id_v` int NOT NULL AUTO_INCREMENT,
  `nombre_vet` varchar(30) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_v`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinario`
--

LOCK TABLES `veterinario` WRITE;
/*!40000 ALTER TABLE `veterinario` DISABLE KEYS */;
INSERT INTO `veterinario` VALUES (1,'Yulissa Pérez','9995678909'),(2,'Wiliam López','9933456790'),(3,'Jorge López','9993454790'),(4,'Rousaura Tamara','9994456790'),(5,'Carolina Briceño','9995456790'),(6,'Carlos Palomo','9992456790'),(7,'Pablo Eúan','9990456790'),(8,'Alondra Martínez','9992456790'),(9,'Laura Alvarez','9993456790');
/*!40000 ALTER TABLE `veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'veterinaria'
--

--
-- Dumping routines for database 'veterinaria'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-21  0:41:23
