-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arbitro`
--

DROP TABLE IF EXISTS `arbitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitro` (
  `idArbitro` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Pais` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idArbitro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitro`
--

LOCK TABLES `arbitro` WRITE;
/*!40000 ALTER TABLE `arbitro` DISABLE KEYS */;
INSERT INTO `arbitro` VALUES (1,'Herb Dean','Estados Unidos'),(2,'John McCarthy','Estados Unidos'),(3,'Mike Beltran','Estados Unidos'),(4,'Dan Miragliotta','Estados Unidos'),(5,'Keith Peterson','Estados Unidos'),(6,'Mario Yamasaki','Brasil'),(7,'Marc Goddard','Reino Unido'),(8,'Andrey Epshtein','Rusia'),(9,'Yuji Shimada','Japón'),(10,'David M. Sullivan','Canadá');
/*!40000 ALTER TABLE `arbitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combate`
--

DROP TABLE IF EXISTS `combate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combate` (
  `idCombate` int(11) NOT NULL,
  `Resultado` int(11) DEFAULT NULL,
  `MetodoFinalizacion` varchar(45) DEFAULT NULL,
  `Duracion` int(11) DEFAULT NULL,
  `Arbitro_idArbitro` int(11) NOT NULL,
  `Ronda_NumeroRonda` int(11) NOT NULL,
  `Evento_idEvento` int(11) NOT NULL,
  `Luchador_idLuchador_rojo` int(11) NOT NULL,
  `Luchador_idLuchador_azul` int(11) NOT NULL,
  PRIMARY KEY (`idCombate`),
  KEY `fk_Combate_Arbitro1_idx` (`Arbitro_idArbitro`),
  KEY `fk_Combate_Ronda1_idx` (`Ronda_NumeroRonda`),
  KEY `fk_Combate_Evento1_idx` (`Evento_idEvento`),
  KEY `fk_Combate_Luchador1_idx` (`Luchador_idLuchador_rojo`),
  KEY `fk_Combate_Luchador2_idx` (`Luchador_idLuchador_azul`),
  CONSTRAINT `fk_Combate_Arbitro1` FOREIGN KEY (`Arbitro_idArbitro`) REFERENCES `arbitro` (`idArbitro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Combate_Evento1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Combate_Luchador1` FOREIGN KEY (`Luchador_idLuchador_rojo`) REFERENCES `luchador` (`idLuchador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Combate_Luchador2` FOREIGN KEY (`Luchador_idLuchador_azul`) REFERENCES `luchador` (`idLuchador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Combate_Ronda1` FOREIGN KEY (`Ronda_NumeroRonda`) REFERENCES `ronda` (`NumeroRonda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combate`
--

LOCK TABLES `combate` WRITE;
/*!40000 ALTER TABLE `combate` DISABLE KEYS */;
INSERT INTO `combate` VALUES (1,1,'KO/TKO',180,1,1,1,1,2),(2,2,'Sumisión',240,2,2,2,3,4),(3,3,'Decisión Unánime',300,3,3,3,5,6),(4,1,'KO/TKO',150,4,4,4,7,8),(5,2,'Sumisión',210,5,5,5,9,10),(6,1,'KO/TKO',180,6,6,6,11,12),(7,3,'Decisión Unánime',270,7,7,7,13,14),(8,1,'KO/TKO',120,8,8,8,15,16),(9,2,'Sumisión',210,9,9,9,17,18),(10,3,'Decisión Unánime',240,10,10,10,19,20),(11,1,'KO/TKO',195,1,1,1,21,22),(12,2,'Sumisión',210,2,2,2,23,24),(13,3,'Decisión Unánime',270,3,3,3,25,26),(14,1,'KO/TKO',180,4,4,4,27,28),(15,2,'Sumisión',230,5,5,5,29,30),(16,1,'KO/TKO',185,6,6,6,31,32),(17,3,'Decisión Unánime',240,7,7,7,33,34),(18,1,'KO/TKO',175,8,8,8,35,36),(19,2,'Sumisión',220,9,9,9,37,38),(20,3,'Decisión Unánime',260,10,10,10,39,40);
/*!40000 ALTER TABLE `combate` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TRG_Verificar_Luchadores_Combate

BEFORE INSERT ON Combate

FOR EACH ROW

BEGIN

    IF NEW.Luchador_idLuchador_rojo = NEW.Luchador_idLuchador_azul THEN

        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT = 'Un luchador no puede participar en ambos lados del combate.';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TRG_Actualizar_Record

AFTER INSERT ON Combate

FOR EACH ROW

BEGIN

    -- Si el resultado es 1, el luchador rojo ganó.

    IF NEW.Resultado = 1 THEN

        UPDATE Luchador

        SET Record = Record + 1

        WHERE idLuchador = NEW.Luchador_idLuchador_rojo;

    -- Si el resultado es 2, el luchador azul ganó.

    ELSEIF NEW.Resultado = 2 THEN

        UPDATE Luchador

        SET Record = Record + 1

        WHERE idLuchador = NEW.Luchador_idLuchador_azul;

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `combates_por_ronda`
--

DROP TABLE IF EXISTS `combates_por_ronda`;
/*!50001 DROP VIEW IF EXISTS `combates_por_ronda`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `combates_por_ronda` AS SELECT 
 1 AS `NumeroRonda`,
 1 AS `idCombate`,
 1 AS `Luchador_Rojo`,
 1 AS `Luchador_Azul`,
 1 AS `MetodoFinalizacion`,
 1 AS `Duracion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `division` (
  `idDivision` int(11) NOT NULL,
  `NombreDivision` varchar(45) DEFAULT NULL,
  `LImiteInferiorPeso` int(11) DEFAULT NULL,
  `LimiteSuperiorPeso` int(11) DEFAULT NULL,
  `idCampeon` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDivision`),
  KEY `fk_Division_Campeon` (`idCampeon`),
  CONSTRAINT `fk_Division_Campeon` FOREIGN KEY (`idCampeon`) REFERENCES `luchador` (`idLuchador`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,'Peso Mosca',0,125,1),(2,'Peso Gallo',125,135,2),(3,'Peso Pluma',135,145,3),(4,'Peso Ligero',145,155,4),(5,'Peso Wélter',155,170,5),(6,'Peso Medio',170,185,6),(7,'Peso Semipesado',185,205,7),(8,'Peso Pesado',205,265,8);
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrenador`
--

DROP TABLE IF EXISTS `entrenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenador` (
  `NombreEntrenador` varchar(45) NOT NULL,
  `Academia` varchar(45) DEFAULT NULL,
  `Especialidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NombreEntrenador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenador`
--

LOCK TABLES `entrenador` WRITE;
/*!40000 ALTER TABLE `entrenador` DISABLE KEYS */;
INSERT INTO `entrenador` VALUES ('André Pederneiras','Nova União','MMA'),('Andreas Michael','Allstars Training Center','Boxeo'),('Bob Perez','Silverback Fight Club','MMA'),('Colin Oyama','Team Oyama','MMA'),('Daniel Valverde','MMA Masters','Jiu-Jitsu'),('Dave Lovell','Team Renegade','Boxeo'),('Diego Lima','Chute Boxe','Muay Thai'),('Eddie Bravo','10th Planet Jiu-Jitsu','Jiu-Jitsu'),('Eric Albarracin','Fight Ready','Wrestling'),('Eric Nicksick','Xtreme Couture','MMA'),('Eugene Bareman','City Kickboxing','MMA'),('Fabricio Itte','Gracie Jiu-Jitsu','Jiu-Jitsu'),('Fernand Lopez','MMA Factory','MMA'),('Gilliard Paraná','Paraná Vale Tudo','MMA'),('Greg Jackson','Jackson Wink MMA','MMA'),('Henry Hooft','Sanford MMA','Kickboxing'),('Ivan Flores','Hawaii Elite MMA','Boxeo'),('Javier Mendez','American Kickboxing Academy','Kickboxing'),('John Crouch','MMA Lab','MMA'),('John Hackleman','Teixeira MMA & Fitness','MMA'),('John Hutchinson','Tiger Muay Thai','Muay Thai'),('John Kavanagh','SBG Ireland','MMA'),('Marc Montoya','Factory X','MMA'),('Marcus Marinelli','Strong Style MMA','MMA'),('Martin Karaivanov','Jetsaam Gym','MMA'),('Matt Serra','Serra-Longo Fight Team','Jiu-Jitsu'),('Mike Brown','American Top Team','MMA'),('Mike Valle','Valle Flow Striking','MMA'),('Pavel Fedotov','Tiger Muay Thai','Muay Thai'),('Pedro Jordão','Black Tiger Fight Club','MMA'),('Raúl Arvizu','Entram Gym','MMA'),('Ray Thompson','Upstate Karate','Karate'),('Rener Gracie','Gracie Jiu-Jitsu','Jiu-Jitsu'),('Robert Jocz','WCA Fight Team','MMA'),('Rodrigo Ruiz','Thai Brasil','Muay Thai'),('Shaun Sullivan','Lion\'s High Performance Center','MMA'),('Trevor Wittman','Sanford MMA','Boxeo'),('Tyson Chartier','New England Cartel','Boxeo');
/*!40000 ALTER TABLE `entrenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Ubicacion` varchar(45) DEFAULT NULL,
  `Asistencias` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'UFC 299: Jones vs Miocic','Madison Square Garden, New York',20000),(2,'UFC 300: Volkanovski vs Oliveira','T-Mobile Arena, Las Vegas',22000),(3,'UFC 301: Adesanya vs Pereira','Rod Laver Arena, Melbourne',18000),(4,'UFC 302: Usman vs Covington 3','AT&T Stadium, Arlington',25000),(5,'UFC 303: Nunes vs Shevchenko 4','O2 Arena, London',15000),(6,'UFC 304: McGregor vs Gaethje 2','Madison Square Garden, New York',21000);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luchador`
--

DROP TABLE IF EXISTS `luchador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `luchador` (
  `idLuchador` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Pais` varchar(45) DEFAULT NULL,
  `Peso` int(11) DEFAULT NULL,
  `Altura` int(11) DEFAULT NULL,
  `Record` int(11) DEFAULT NULL,
  `Equipo` varchar(45) DEFAULT NULL,
  `Division_idDivision` int(11) NOT NULL,
  `Entrenador_NombreEntrenador` varchar(45) NOT NULL,
  PRIMARY KEY (`idLuchador`),
  KEY `fk_Luchador_Division1_idx` (`Division_idDivision`),
  KEY `fk_Luchador_Entrenador1_idx` (`Entrenador_NombreEntrenador`),
  CONSTRAINT `fk_Luchador_Division1` FOREIGN KEY (`Division_idDivision`) REFERENCES `division` (`idDivision`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Luchador_Entrenador1` FOREIGN KEY (`Entrenador_NombreEntrenador`) REFERENCES `entrenador` (`NombreEntrenador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luchador`
--

LOCK TABLES `luchador` WRITE;
/*!40000 ALTER TABLE `luchador` DISABLE KEYS */;
INSERT INTO `luchador` VALUES (1,'Alexander Volkanovski','Australia',145,168,26,'City Kickboxing',3,'Eugene Bareman'),(2,'Israel Adesanya','Nigeria',185,193,24,'City Kickboxing',6,'Eugene Bareman'),(3,'Jon Jones','USA',205,193,27,'Jackson Wink MMA',7,'Greg Jackson'),(4,'Francis Ngannou','Camerún',265,193,17,'Xtreme Couture',8,'Eric Nicksick'),(5,'Kamaru Usman','Nigeria',170,183,20,'Sanford MMA',5,'Trevor Wittman'),(6,'Charles Oliveira','Brasil',155,178,34,'Chute Boxe',4,'Diego Lima'),(7,'Brandon Moreno','México',125,170,21,'Entram Gym',1,'Raúl Arvizu'),(8,'Aljamain Sterling','USA',135,170,22,'Serra-Longo Fight Team',2,'Matt Serra'),(9,'Max Holloway','USA',145,180,23,'Hawaii Elite MMA',3,'Ivan Flores'),(10,'Conor McGregor','Irlanda',155,175,22,'SBG Ireland',4,'John Kavanagh'),(11,'Dustin Poirier','USA',155,175,29,'American Top Team',4,'Mike Brown'),(12,'Justin Gaethje','USA',155,180,24,'Elevation Fight Team',4,'Trevor Wittman'),(13,'Colby Covington','USA',170,180,17,'MMA Masters',5,'Daniel Valverde'),(14,'Leon Edwards','Reino Unido',170,188,21,'Team Renegade',5,'Dave Lovell'),(15,'Paulo Costa','Brasil',185,183,14,'Team Borrachinha',6,'Eric Albarracin'),(16,'Robert Whittaker','Australia',185,182,24,'Gracie Jiu-Jitsu',6,'Fabricio Itte'),(17,'Jan Blachowicz','Polonia',205,188,29,'WCA Fight Team',7,'Robert Jocz'),(18,'Jiri Prochazka','República Checa',205,193,29,'Jetsaam Gym',7,'Martin Karaivanov'),(19,'Stipe Miocic','USA',240,193,20,'Strong Style MMA',8,'Marcus Marinelli'),(20,'Ciryl Gane','Francia',250,193,12,'MMA Factory',8,'Fernand Lopez'),(21,'Petr Yan','Rusia',135,170,16,'Tiger Muay Thai',2,'John Hutchinson'),(22,'Sean O\'Malley','USA',135,180,17,'MMA Lab',2,'John Crouch'),(23,'Henry Cejudo','USA',135,163,16,'Fight Ready',2,'Eric Albarracin'),(24,'José Aldo','Brasil',135,170,31,'Nova União',2,'André Pederneiras'),(25,'Calvin Kattar','USA',145,180,23,'New England Cartel',3,'Tyson Chartier'),(26,'Yair Rodríguez','México',145,180,16,'Valle Flow Striking',3,'Mike Valle'),(27,'Brian Ortega','USA',145,175,15,'Gracie Jiu-Jitsu',3,'Rener Gracie'),(28,'Islam Makhachev','Rusia',155,178,24,'American Kickboxing Academy',4,'Javier Mendez'),(29,'Tony Ferguson','USA',155,180,26,'10th Planet Jiu-Jitsu',4,'Eddie Bravo'),(30,'Michael Chandler','USA',155,173,23,'Sanford MMA',4,'Henry Hooft'),(31,'Jorge Masvidal','USA',170,180,35,'American Top Team',5,'Mike Brown'),(32,'Gilbert Burns','Brasil',170,178,21,'Sanford MMA',5,'Henri Hooft'),(33,'Khamzat Chimaev','Suecia',170,188,12,'Allstars Training Center',5,'Andreas Michael'),(34,'Stephen Thompson','USA',170,183,17,'Upstate Karate',5,'Ray Thompson'),(35,'Sean Strickland','USA',185,185,26,'Xtreme Couture',6,'Eric Nicksick'),(36,'Derek Brunson','USA',185,185,23,'Sanford MMA',6,'Henri Hooft'),(37,'Glover Teixeira','Brasil',205,188,33,'Teixeira MMA & Fitness',7,'John Hackleman'),(38,'Anthony Smith','USA',205,193,36,'Factory X',7,'Marc Montoya'),(39,'Tai Tuivasa','Australia',265,188,14,'Lion\'s High Performance Center',8,'Shaun Sullivan'),(40,'Derrick Lewis','USA',265,191,26,'Silverback Fight Club',8,'Bob Perez'),(41,'Andrei Arlovski','Bielorrusia',240,191,34,'ATT',8,'Mike Brown'),(42,'Alexander Romanov','Moldavia',260,188,17,'LION MMA',8,'Andrei Grosu'),(43,'Marina Rodriguez','Brasil',115,170,17,'Thai Brasil',4,'Rodrigo Ruiz'),(44,'Amanda Nunes','Brasil',135,173,23,'American Top Team',2,'Mike Brown'),(45,'Valentina Shevchenko','Kirguistán',125,165,23,'Tiger Muay Thai',1,'Pavel Fedotov'),(46,'Rose Namajunas','USA',115,165,11,'303 Training Center',5,'Trevor Wittman'),(47,'Carla Esparza','USA',115,160,19,'Team Oyama',2,'Colin Oyama'),(48,'Weili Zhang','China',115,163,23,'Black Tiger Fight Club',3,'Pedro Jordão'),(49,'Joanna Jędrzejczyk','Polonia',115,167,16,'American Top Team',4,'Mike Brown'),(50,'Jessica Andrade','Brasil',125,155,24,'Paraná Vale Tudo',1,'Gilliard Paraná');
/*!40000 ALTER TABLE `luchador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `luchadores_por_division`
--

DROP TABLE IF EXISTS `luchadores_por_division`;
/*!50001 DROP VIEW IF EXISTS `luchadores_por_division`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `luchadores_por_division` AS SELECT 
 1 AS `NombreDivision`,
 1 AS `Luchador`,
 1 AS `Peso`,
 1 AS `Altura`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ronda`
--

DROP TABLE IF EXISTS `ronda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ronda` (
  `NumeroRonda` int(11) NOT NULL,
  `Duracion` int(11) DEFAULT NULL,
  `Ganador` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NumeroRonda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ronda`
--

LOCK TABLES `ronda` WRITE;
/*!40000 ALTER TABLE `ronda` DISABLE KEYS */;
INSERT INTO `ronda` VALUES (1,300,'Luchador Rojo'),(2,240,'Luchador Azul'),(3,180,'Luchador Rojo'),(4,150,'Luchador Azul'),(5,180,'Luchador Rojo'),(6,210,'Luchador Azul'),(7,275,'Luchador Rojo'),(8,180,'Luchador Azul'),(9,240,'Luchador Rojo'),(10,300,'Luchador Rojo'),(11,330,'Luchador Azul'),(12,270,'Luchador Rojo'),(13,300,'Luchador Azul'),(14,255,'Luchador Rojo'),(15,330,'Luchador Azul');
/*!40000 ALTER TABLE `ronda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `CalcularPorcentajeVictorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularPorcentajeVictorias`(record INT) RETURNS decimal(5,2)
    DETERMINISTIC
BEGIN

    RETURN (record * 100.0) / 50; -- Supongamos un máximo de 50 combates.

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `EsCategoriaPeso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `EsCategoriaPeso`(idLuchador INT, nombreDivision VARCHAR(45)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN

    DECLARE divisionLuchador VARCHAR(45);

    SELECT NombreDivision INTO divisionLuchador

    FROM Division

    INNER JOIN Luchador ON Division.idDivision = Luchador.Division_idDivision

    WHERE Luchador.idLuchador = idLuchador;



    RETURN divisionLuchador = nombreDivision;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ObtenerArbitroPorLuchador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ObtenerArbitroPorLuchador`(luchadorId INT) RETURNS varchar(45) CHARSET utf8 COLLATE utf8_general_ci
    DETERMINISTIC
BEGIN

    DECLARE arbitroNombre VARCHAR(45);

    SELECT a.Nombre INTO arbitroNombre

    FROM Combate c

    JOIN Arbitro a ON c.Arbitro_idArbitro = a.idArbitro

    WHERE c.Luchador_idLuchador_rojo = luchadorId OR c.Luchador_idLuchador_azul = luchadorId;

    

    RETURN arbitroNombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CombatesPorArbitro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CombatesPorArbitro`(nombreArbitro VARCHAR(45))
BEGIN

    DECLARE done INT DEFAULT 0;

    DECLARE combateID INT;

    DECLARE eventoNombre VARCHAR(45);

    DECLARE combateCursor CURSOR FOR

        SELECT Combate.idCombate, Evento.Nombre

        FROM Combate

        INNER JOIN Evento ON Combate.Evento_idEvento = Evento.idEvento

        INNER JOIN Arbitro ON Combate.Arbitro_idArbitro = Arbitro.idArbitro

        WHERE Arbitro.Nombre = nombreArbitro;



    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;



    OPEN combateCursor;



    combate_loop: LOOP

        FETCH combateCursor INTO combateID, eventoNombre;

        IF done THEN

            LEAVE combate_loop;

        END IF;



        SELECT CONCAT('Combate ID: ', combateID, ' en el evento: ', eventoNombre) AS DetalleCombate;

    END LOOP;



    CLOSE combateCursor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LuchadoresPorcentajeVictorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LuchadoresPorcentajeVictorias`(limite DECIMAL(5,2))
BEGIN

    SELECT idLuchador, Nombre, Record, CalcularPorcentajeVictorias(Record) AS PorcentajeVictorias

    FROM Luchador

    WHERE CalcularPorcentajeVictorias(Record) > limite;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LuchadoresPorDivision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LuchadoresPorDivision`(nombreDivision VARCHAR(45))
BEGIN

    SELECT Luchador.idLuchador, Luchador.Nombre, Luchador.Pais, Division.NombreDivision

    FROM Luchador

    INNER JOIN Division ON Luchador.Division_idDivision = Division.idDivision

    WHERE Division.NombreDivision = nombreDivision;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarLuchadoresPorCategoriaPeso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarLuchadoresPorCategoriaPeso`(nombreDivision VARCHAR(45))
BEGIN

    SELECT idLuchador, Nombre

    FROM Luchador

    WHERE EsCategoriaPeso(idLuchador, nombreDivision) = TRUE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarLuchadoresYArbitrosPorCategoriaPeso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarLuchadoresYArbitrosPorCategoriaPeso`(nombreDivision VARCHAR(45))
BEGIN

    SELECT 

        l.idLuchador, 

        l.Nombre AS Luchador, 

        l.Record AS Victorias, 

        a.Nombre AS Arbitro

    FROM Luchador l

    JOIN Combate c ON l.idLuchador = c.Luchador_idLuchador_rojo OR l.idLuchador = c.Luchador_idLuchador_azul

    JOIN Arbitro a ON c.Arbitro_idArbitro = a.idArbitro

    WHERE EsCategoriaPeso(l.idLuchador, nombreDivision) = TRUE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `combates_por_ronda`
--

/*!50001 DROP VIEW IF EXISTS `combates_por_ronda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `combates_por_ronda` AS select `r`.`NumeroRonda` AS `NumeroRonda`,`c`.`idCombate` AS `idCombate`,`l1`.`Nombre` AS `Luchador_Rojo`,`l2`.`Nombre` AS `Luchador_Azul`,`c`.`MetodoFinalizacion` AS `MetodoFinalizacion`,`c`.`Duracion` AS `Duracion` from (((`combate` `c` join `ronda` `r` on(`c`.`Ronda_NumeroRonda` = `r`.`NumeroRonda`)) join `luchador` `l1` on(`c`.`Luchador_idLuchador_rojo` = `l1`.`idLuchador`)) join `luchador` `l2` on(`c`.`Luchador_idLuchador_azul` = `l2`.`idLuchador`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `luchadores_por_division`
--

/*!50001 DROP VIEW IF EXISTS `luchadores_por_division`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `luchadores_por_division` AS select `d`.`NombreDivision` AS `NombreDivision`,`l`.`Nombre` AS `Luchador`,`l`.`Peso` AS `Peso`,`l`.`Altura` AS `Altura` from (`luchador` `l` join `division` `d` on(`l`.`Division_idDivision` = `d`.`idDivision`)) order by `d`.`NombreDivision`,`l`.`Nombre` */;
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

-- Dump completed on 2024-12-11 23:52:40
