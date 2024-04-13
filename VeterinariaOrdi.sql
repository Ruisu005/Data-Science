CREATE DATABASE  IF NOT EXISTS `veterinario` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `veterinario`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: veterinario
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
-- Table structure for table `animales`
--

DROP TABLE IF EXISTS `animales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animales` (
  `Idanimales` int NOT NULL,
  `Idcliente` int DEFAULT NULL,
  `Idtipo` int DEFAULT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Raza` varchar(150) NOT NULL,
  `Sexo` varchar(150) NOT NULL,
  `Edad` varchar(10) NOT NULL,
  PRIMARY KEY (`Idanimales`),
  KEY `Idcliente` (`Idcliente`),
  KEY `Idtipo` (`Idtipo`),
  CONSTRAINT `animales_ibfk_1` FOREIGN KEY (`Idcliente`) REFERENCES `cliente` (`Idcliente`),
  CONSTRAINT `animales_ibfk_2` FOREIGN KEY (`Idtipo`) REFERENCES `tpanimales` (`Idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animales`
--

LOCK TABLES `animales` WRITE;
/*!40000 ALTER TABLE `animales` DISABLE KEYS */;
INSERT INTO `animales` VALUES (1,1,1,'Luna','Labrador Retriever','Hembra','3 años'),(2,2,2,'Simba','Maine Coon ','Macho','2 años'),(3,3,3,'Coco','Conejo enano','Macho','1 año'),(4,4,4,'Tortuga','Tortuga rusa','Hembra','5 años'),(5,5,5,'Chester','Hamster sirio','Macho','6 meses'),(6,6,1,'Bella','Golden Retriever','Hembra','4 años'),(7,7,2,'Whiskers','Persa','Macho','3 años'),(8,8,2,'Nube','Angora','Hembra','1 año'),(9,9,3,'Pancho','Conejo cabeza de león','Macho','2 años'),(10,10,4,'Leonardo','Tortuga de orejas rojas','Macho','8 años'),(11,11,5,'Daisy','Hamster ruso','Hembra','1 año'),(12,12,1,'Rocky','Bulldog inglés','Macho','5 años'),(13,13,2,'Mimi','Siames','Hembra','2 años'),(14,14,2,'Oliver','British Shorthair','Macho ','4 años'),(15,15,3,'Copito','Conejo belier','Macho','3 años'),(16,16,4,'Sheldon','Tortuga mora','Macho','10 años'),(17,17,5,'Ginger','Hamster chino','Hembra','8 meses'),(18,18,1,'Lola','Poodle ','Hembra ','6 años'),(19,19,2,'Lula','Ragdoll','Hembra',' 1 año'),(20,20,2,'Tigger','Bengalí','Macho','3 años'),(21,21,3,'Floppy','Conejo gigante de Flandes','Macho','2 años'),(22,22,4,'Michelangelo','Tortuga de caja','Macho','15 años'),(23,23,5,'Snowball','Hamster dorado','Hembra','1 año'),(24,24,1,'Max','Border Collie','Macho',' 7 años'),(25,25,2,'Whiskey','Scottish Fold','Macho','5 años'),(26,26,2,'Cleo','Sphynx','Hembra','4 años'),(27,27,3,'Bola de Nieve','Conejo blanco de Florida','Hembra','1 año'),(28,28,4,'Donatello','Tortuga de orejas amarillas','Macho','12 años'),(29,29,5,'Peanut','Hamster enano','Macho','6 meses'),(30,30,1,'Bella','Shih Tzu','Hembra','2 años'),(40,40,2,'Luna','Siamés','Hembra','3 años'),(41,41,2,'Whiskers','Maine Coon','Macho','4 años'),(42,42,3,'Oreo','Conejo holandés','Macho','2 años'),(43,43,4,'Raphael','Tortuga pintada','Macho','20 años'),(44,44,5,'Marshmallow','Hamster panda','Hembra',' 1 año '),(45,45,1,'Rocky','Rottweiler ','Macho','4 años'),(46,46,2,'Luna','Persa','Hembra','5 años'),(47,47,2,'Gizmo','Sphynx',' Macho','3 años'),(48,48,3,'Thor','Conejo enano','Macho','1 año'),(49,49,4,'Leonardo','Tortuga boba','Macho',' 25 años'),(50,50,5,'Cocoa','Hamster sirio','Hembra','2 años'),(51,51,1,'Luna','Boxer','Hembra','6 años'),(52,52,2,'Luna','British Shorthair','Hembra','2 años'),(53,53,2,'Simón','American Curl','Macho','4 años'),(54,54,3,'Bugs','Conejo rex','Macho','3 años'),(55,55,4,'Raphael','Tortuga de tierra','Macho','30 años'),(56,56,5,'Cinnamon','Hamster ruso','Hembra','1 año'),(57,57,1,'Buddy','Golden Retriever','Macho','8 años'),(58,17,2,'Luna','Scottish Fold','Hembra',' 1 año'),(59,43,2,'Luna','Maine Coon','Hembra','4 años');
/*!40000 ALTER TABLE `animales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Idcliente` int NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Direccion` varchar(150) NOT NULL,
  `Ciudad` varchar(150) NOT NULL,
  `Zona` varchar(150) NOT NULL,
  `Telefono` int NOT NULL,
  PRIMARY KEY (`Idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'María','Calle 23 x 45 s/n','Merida','Norte',991238976),(2,'Laura','colonia padre 34 c','Merida','Sur',992147825),(3,'Maribel','calle 34 x 45','Merida','Oriente',991238976),(4,'Rubí','34 x 5 ni 1','Merida','Poniente',911238987),(5,'Daniela','Calle 34 x 56 colonia','Merida','Norte',391238976),(6,'Mario','Calle 11 x 18 s/n','Merida','Oriente',992238976),(7,'Rodrigo','calle 1 x 78  ','Merida','Sur',992147824),(8,'Samuel ','calle 45 x 84 y 91  ','Merida','Norte',999351974),(9,'Sofia ','calle 78 x 25 y 27 ','Merida','Oriente',994253687),(10,'isabella ','calle 12 x 15 y 17','Merida','Sur',999634127),(11,'Victor ','calle 33 x 45 y 49 ','Merida','Norte',999541733),(12,'Elena ','calle 21 x 78 y 80 c ','Merida','Poniente',997852143),(13,'Maria paula ','calle 78 x 45 y 47 ','Merida','Oriente',978453412),(14,'Monica ','calle 41 x 32 y 34 ','Merida','Norte',925436874),(15,'Lucia ','calle 89 x 12 y 15 ','Merida','Poniente',993148041),(16,'Pablo ','calle 65 x 52 y 54 ','Merida','Sur',960331025),(17,'Gabriel ','calle 54 x 26 y 28 ','Merida','Oriente',984301672),(18,'Isaac ','calle 13 x 48 y 50 ','Merida','Oriente',994632584),(19,'Matias ','calle 34 x 56 y 58 ','Kanasin','sur',978140235),(20,'Dylan ','calle 20 x 43 y 45 ','Kanasin','sur',906087838),(21,'Jose ','calle 74 x 89 y 90 ','Kanasin','sur',960183170),(22,'Arianna ','calle 85 x 12 y 15 ','Kanasin','sur',999583651),(23,'Luis ','calle 95 x 10 y 11 ','Kanasin','sur',999963520),(24,'Camila ','calle 04 x 65 a y 67 ','Merida','Norte',920157630),(25,'Emma ','calle 45 c x 89 y 91','Merida','Poniente',901623748),(26,'Amanda ','calle 78 x 42 y 45 ','Merida','Oriente',910294731),(27,'william ','calle 42 x 65 y 67 ','Merida','Sur',985321799),(28,'Nicol ','calle 80 x 10 y 12','Merida','Sur',999450132),(29,'emilio ','calle 65 x 31 y 33 ','Merida','Oriente',999743012),(30,'Diego ','calle 48 x 71 y 73 ','Merida','Norte',996120341),(31,'Maria Luisa ','calle 80 x 90 y 92 ','Kanasin','sur',998514652),(32,'Valeria ','calle 25 x 45 y 47 ','Merida','Norte',997841352),(33,'Jimena ','calle 99 x 23 y 25 ','Merida','Sur',993528142),(34,'Gabriela ','calle 10 x 54 y 56 ','Merida','Poniente',992006748),(35,'Ana','calle 77 x 92 y 94 ','Kanasin','sur',995410341),(36,'Mia ','calle 40 x 62 y 64 ','Merida','Norte',994750817),(37,'Andrea ','calle 33 x 81 y 84 ','Merida','Norte',991387452),(38,'Elizabeth ','calle 30 x 65 y 67','Merida','Oriente',999134792),(39,'Alexander ','calle 45 x 85 y 87','Merida','Sur',999251873),(40,'Cristian ','calle 12 a x 10 y 12 b ','Merida','Poniente',999380123),(41,'Sebastian ','calle 6 x 21 y 23 ','Merida','Poniente',999520060),(42,'Alejandro ','calle 26 x 35 y 37 ','Merida','Norte',990803401),(43,'Antony ','calle 20 x 103 y 105 ','Kanasin','sur',999408044),(44,'Pablo ','calle 106 x 2 y 4 ','Valladolid','sur',993158740),(45,'Yamily ','calle 2 x 45 y 47 ','Valladolid','sur',999303281),(46,'Martha ','calle 36 x 17 y 19 ','Uman','Noroeste',992022141),(47,'Estefania ','calle 38 x 17 y 18 ','Uman','Noroeste',996473152),(48,'Michell ','calle 42 x 40 y 44 ','Uman','Noroeste',992135785),(49,'Veronica ','calle 56 x 24 y 26 ','Merida','Oriente',997564632),(50,'Hector ','calle 13 x 25 y 27 ','Merida','Oriente',995563117),(51,'Jorge ','calle 13 x 15 y 17 ','Merida','Norte',994357123),(52,'Dario ','calle 15 x 10 y 12 ','Merida','Sur',992378963),(53,'Danna ','calle 17 x 38 y 40 ','Merida','Norte',992598434),(54,'Elisa ','calle 58 x 30 y 32','Merida','Poniente',990279963),(55,'Eliam ','calle 92 x 14 y 16 ','Merida','Poniente',991237012),(56,'Claudia ','calle 31 x 26 y 28 ','Merida','Sur',991145873),(57,'Daylin ','calle 20 x 33 y 35','Merida','Norte',990236479);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fecha`
--

DROP TABLE IF EXISTS `fecha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fecha` (
  `Idfecha` int NOT NULL,
  `Dia` int NOT NULL,
  `Mes` varchar(100) NOT NULL,
  `Año` int NOT NULL,
  `Dia_semana` varchar(100) NOT NULL,
  PRIMARY KEY (`Idfecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fecha`
--

LOCK TABLES `fecha` WRITE;
/*!40000 ALTER TABLE `fecha` DISABLE KEYS */;
INSERT INTO `fecha` VALUES (1,11,'Enero',2024,'Jueves'),(2,12,'Enero',2024,'Viernes'),(3,13,'Enero',2024,'Sabado'),(4,14,'Enero',2024,'Domingo'),(5,15,'Enero',2024,'Lunes'),(6,16,'Enero',2024,'Martes'),(7,17,'Enero',2024,'Miercoles'),(8,18,'Enero',2024,'Jueves'),(9,19,'Enero',2024,'Viernes'),(10,20,'Enero',2024,'Sabado'),(11,21,'Enero',2024,'Domingo'),(12,22,'Enero',2024,'Lunes'),(13,23,'Enero',2024,'Martes'),(14,24,'Enero',2024,'Miercoles'),(15,25,'Enero',2024,'Jueves'),(16,26,'Enero',2024,'Viernes'),(17,27,'Enero',2024,'Sabado'),(18,28,'Enero',2024,'Domingo'),(19,29,'Enero',2024,'Lunes'),(20,30,'Enero',2024,'Martes'),(21,31,'Enero',2024,'Miercoles'),(22,1,'Febrero',2024,'Jueves'),(23,2,'Febrero',2024,'Viernes'),(24,3,'Febrero',2024,'Sabado'),(25,4,'Febrero',2024,'Domingo'),(26,5,'Febrero',2024,'Lunes'),(27,6,'Febrero',2024,'Martes'),(28,7,'Febrero',2024,'Miercoles'),(29,8,'Febrero',2024,'Jueves'),(30,9,'Febrero',2024,'Viernes'),(31,10,'Febrero',2024,'Sabado'),(32,11,'Febrero',2024,'Domingo'),(33,12,'Febrero',2024,'Lunes'),(34,13,'Febrero',2024,'Martes'),(35,14,'Febrero',2024,'Miercoles'),(36,15,'Febrero',2024,'Jueves'),(37,16,'Febrero',2024,'Viernes'),(38,17,'Febrero',2024,'Sabado'),(39,18,'Febrero',2024,'Domingo'),(40,19,'Febrero',2024,'Lunes'),(41,20,'Febrero',2024,'Martes'),(42,21,'Febrero',2024,'Miercoles'),(43,22,'Febrero',2024,'Jueves'),(44,23,'Febrero',2024,'Viernes'),(45,24,'Febrero',2024,'Sabado'),(46,25,'Febrero',2024,'Domingo'),(47,26,'Febrero',2024,'Lunes'),(48,27,'Febrero',2024,'Martes'),(49,28,'Febrero',2024,'Miercoles'),(50,29,'Febrero',2024,'Jueves'),(51,1,'Marzo',2024,'Viernes'),(52,2,'Marzo',2024,'Sabado'),(53,3,'Marzo',2024,'Domingo'),(54,4,'Marzo',2024,'Lunes'),(55,5,'Marzo',2024,'Martes'),(56,6,'Marzo',2024,'Miercoles'),(57,7,'Marzo',2024,'Jueves'),(58,8,'Marzo',2024,'Viernes'),(59,9,'Marzo',2024,'Sabado'),(60,10,'Marzo',2024,'Domingo'),(61,11,'Marzo',2024,'Lunes'),(62,12,'Marzo',2024,'Martes'),(63,13,'Marzo',2024,'Miercoles'),(64,14,'Marzo',2024,'Jueves'),(65,15,'Marzo',2024,'Viernes'),(66,16,'Marzo',2024,'Sabado'),(67,17,'Marzo',2024,'Domingo'),(68,18,'Marzo',2024,'Lunes'),(69,19,'Marzo',2024,'Martes'),(70,20,'Marzo',2024,'Miercoles'),(71,21,'Marzo',2024,'Jueves'),(72,22,'Marzo',2024,'Viernes'),(73,23,'Marzo',2024,'Sabado'),(74,24,'Marzo',2024,'Domingo'),(75,25,'Marzo',2024,'Lunes'),(76,26,'Marzo',2024,'Martes'),(77,27,'Marzo',2024,'Miercoles'),(78,28,'Marzo',2024,'Jueves'),(79,29,'Marzo',2024,'Viernes'),(80,30,'Marzo',2024,'Sabado'),(81,31,'Marzo',2024,'Domingo'),(82,1,'Abril',2024,'Lunes'),(83,2,'Abril',2024,'Martes'),(84,3,'Abril',2024,'Miercoles'),(85,4,'Abril',2024,'Jueves'),(86,5,'Abril',2024,'Viernes'),(87,6,'Abril',2024,'Sabado'),(88,7,'Abril',2024,'Domingo'),(89,8,'Abril',2024,'Lunes'),(90,9,'Abril',2024,'Martes'),(91,10,'Abril',2024,'Miercoles'),(92,11,'Abril',2024,'Jueves');
/*!40000 ALTER TABLE `fecha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos` (
  `Idmedicamentos` int NOT NULL,
  `Idtpmedicamentos` int DEFAULT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Precio` int DEFAULT NULL,
  PRIMARY KEY (`Idmedicamentos`),
  KEY `Idtpmedicamentos` (`Idtpmedicamentos`),
  CONSTRAINT `medicamentos_ibfk_1` FOREIGN KEY (`Idtpmedicamentos`) REFERENCES `tpmedicamentos` (`Idtpmedicamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
INSERT INTO `medicamentos` VALUES (1,1,'Isoflurano 200g',500),(2,2,'Desecante Gel 10g',900),(3,3,'Adarfac 50g',850),(4,4,'Ruinald Omega 60g',920),(5,5,'Gotas 150g',150),(6,1,'advantage ',510),(7,1,'pet max',620),(8,2,'cerenia ',100),(9,3,'Aquaden',250),(10,4,'SANTGAR',70),(11,4,'Azodyl ',340),(12,5,'Bamitol Ungüento',210),(13,1,'Rinotraqueítis',500),(14,2,'Calicivirus',120),(15,3,'Leucosis',200),(16,4,'Lyssavirus',310),(17,5,'Clamidiosis felina',100),(18,5,'Chlamydophila felis',170),(20,4,'Bravecto',260),(21,3,'Frontline Plus',190),(22,2,'Seresto',610),(23,1,'Advantage',365),(24,1,'Mixomatosis',230),(25,2,'Meloxicam',180),(26,3,'Carprofeno',295),(27,4,'Buprenorfina',395),(28,5,'Tramadol',240),(29,1,'RabVac 3',780),(30,2,'Imrab',435),(31,3,'Fenbendazol',524),(33,4,'Ivermectina',250),(34,5,'Praziquantel',480),(35,1,'Metronidazol',50);
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpanimales`
--

DROP TABLE IF EXISTS `tpanimales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpanimales` (
  `Idtipo` int NOT NULL,
  `Animales` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpanimales`
--

LOCK TABLES `tpanimales` WRITE;
/*!40000 ALTER TABLE `tpanimales` DISABLE KEYS */;
INSERT INTO `tpanimales` VALUES (1,'Perro'),(2,'Gato'),(3,'Conejo'),(4,'Toruga'),(5,'hámster');
/*!40000 ALTER TABLE `tpanimales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpmedicamentos`
--

DROP TABLE IF EXISTS `tpmedicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpmedicamentos` (
  `Idtpmedicamentos` int NOT NULL,
  `tiposdemedicamentos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Idtpmedicamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpmedicamentos`
--

LOCK TABLES `tpmedicamentos` WRITE;
/*!40000 ALTER TABLE `tpmedicamentos` DISABLE KEYS */;
INSERT INTO `tpmedicamentos` VALUES (1,'Antiparasitarios'),(2,'Inyectables'),(3,'Orales'),(4,'Tópicos intraoculares'),(5,'Antibióticos');
/*!40000 ALTER TABLE `tpmedicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamientos`
--

DROP TABLE IF EXISTS `tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamientos` (
  `Idtratamiento` int NOT NULL,
  `Tipos_tratamientos` varchar(100) DEFAULT NULL,
  `Precio` int DEFAULT NULL,
  PRIMARY KEY (`Idtratamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamientos`
--

LOCK TABLES `tratamientos` WRITE;
/*!40000 ALTER TABLE `tratamientos` DISABLE KEYS */;
INSERT INTO `tratamientos` VALUES (1,'Higiene y peluqueria',250),(2,'Vacunacion',150),(3,'desparasitación',500),(4,'chequeo de salud',100),(5,'Cirugia',15000),(6,'Analisis',950),(7,'Dermatologia',2000),(8,'Ecografia',800),(9,'Basicos',850);
/*!40000 ALTER TABLE `tratamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinario`
--

DROP TABLE IF EXISTS `veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinario` (
  `Idveterinario` int NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Telefono` int NOT NULL,
  PRIMARY KEY (`Idveterinario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinario`
--

LOCK TABLES `veterinario` WRITE;
/*!40000 ALTER TABLE `veterinario` DISABLE KEYS */;
INSERT INTO `veterinario` VALUES (1,'Yulissa Pérez',995678909),(2,'Wiliam López',993345679),(3,'Jorge López',999345479),(4,'Rousaura Tamara',999445679),(5,'Carolina Briceño',999545679),(6,'Carlos Palomo',999245679),(7,'Pablo Eúan',999045679),(8,'Alondra Martínez',999245679),(9,'Laura Alvarez',999345679);
/*!40000 ALTER TABLE `veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitas`
--

DROP TABLE IF EXISTS `visitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitas` (
  `Idvisita` int NOT NULL,
  `Idanimales` int DEFAULT NULL,
  `Idfecha` int DEFAULT NULL,
  `Idtratamiento` int DEFAULT NULL,
  `Idmedicamentos` int DEFAULT NULL,
  `Idveterinario` int DEFAULT NULL,
  `Monto_a_pagar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Idvisita`),
  KEY `Idanimales` (`Idanimales`),
  KEY `Idfecha` (`Idfecha`),
  KEY `Idtratamiento` (`Idtratamiento`),
  KEY `Idmedicamentos` (`Idmedicamentos`),
  KEY `Idveterinario` (`Idveterinario`),
  CONSTRAINT `visitas_ibfk_1` FOREIGN KEY (`Idanimales`) REFERENCES `animales` (`Idanimales`),
  CONSTRAINT `visitas_ibfk_10` FOREIGN KEY (`Idveterinario`) REFERENCES `veterinario` (`Idveterinario`),
  CONSTRAINT `visitas_ibfk_2` FOREIGN KEY (`Idfecha`) REFERENCES `fecha` (`Idfecha`),
  CONSTRAINT `visitas_ibfk_3` FOREIGN KEY (`Idtratamiento`) REFERENCES `tratamientos` (`Idtratamiento`),
  CONSTRAINT `visitas_ibfk_4` FOREIGN KEY (`Idmedicamentos`) REFERENCES `medicamentos` (`Idmedicamentos`),
  CONSTRAINT `visitas_ibfk_5` FOREIGN KEY (`Idveterinario`) REFERENCES `veterinario` (`Idveterinario`),
  CONSTRAINT `visitas_ibfk_6` FOREIGN KEY (`Idanimales`) REFERENCES `animales` (`Idanimales`),
  CONSTRAINT `visitas_ibfk_7` FOREIGN KEY (`Idfecha`) REFERENCES `fecha` (`Idfecha`),
  CONSTRAINT `visitas_ibfk_8` FOREIGN KEY (`Idtratamiento`) REFERENCES `tratamientos` (`Idtratamiento`),
  CONSTRAINT `visitas_ibfk_9` FOREIGN KEY (`Idmedicamentos`) REFERENCES `medicamentos` (`Idmedicamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitas`
--

LOCK TABLES `visitas` WRITE;
/*!40000 ALTER TABLE `visitas` DISABLE KEYS */;
INSERT INTO `visitas` VALUES (1,1,1,1,1,1,'1500'),(2,2,2,2,5,2,'2535'),(3,3,3,3,9,1,'3570'),(4,4,4,4,13,3,'4605'),(5,5,5,5,17,4,'5640'),(6,6,6,6,21,1,'6675'),(7,7,7,7,25,5,'2710'),(8,8,8,8,29,6,'2710'),(9,9,9,9,33,1,'2710'),(10,10,10,9,1,7,'2710'),(11,11,11,8,2,8,'2710'),(12,12,12,7,3,1,'2710'),(13,13,13,6,4,9,'2710'),(14,14,14,5,5,1,'2710'),(15,15,15,4,6,2,'2710'),(16,16,16,3,7,3,'2710'),(17,17,17,2,8,4,'2710'),(18,18,18,1,9,5,'2710'),(19,19,19,2,10,6,'2710'),(20,20,20,4,11,7,'2710'),(21,21,21,6,12,8,'2710'),(22,22,22,8,13,9,'2710'),(23,23,23,3,14,9,'1450'),(24,24,24,6,15,9,'1500'),(25,25,25,9,16,9,'1550'),(26,26,26,1,17,7,'1600'),(27,27,27,1,18,9,'1650'),(28,28,28,9,20,9,'1700'),(29,29,29,9,20,8,'1750'),(30,40,30,1,21,9,'1800'),(31,41,31,9,22,9,'1850'),(32,42,32,9,23,9,'1900'),(33,43,33,9,24,3,'1950'),(34,44,34,9,25,9,'2000'),(35,45,35,9,26,9,'2050'),(36,46,36,9,27,1,'2100'),(37,47,37,9,28,9,'2150'),(38,48,38,9,29,9,'2200'),(39,49,39,9,30,9,'2250'),(40,40,40,9,31,2,'2300'),(41,41,41,9,30,9,'2350'),(42,42,42,9,33,9,'2400'),(43,43,43,9,34,9,'2450'),(44,44,44,9,35,1,'2500'),(45,45,45,1,1,2,'2550'),(46,46,46,2,2,3,'2600'),(47,47,47,3,3,3,'2650'),(48,48,48,4,4,4,'2700'),(49,49,49,5,5,5,'2750'),(50,50,50,6,6,6,'2500');
/*!40000 ALTER TABLE `visitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'veterinario'
--

--
-- Dumping routines for database 'veterinario'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-13 17:26:17
