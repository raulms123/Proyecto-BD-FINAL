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
  `Especialidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idArbitro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitro`
--

LOCK TABLES `arbitro` WRITE;
/*!40000 ALTER TABLE `arbitro` DISABLE KEYS */;
INSERT INTO `arbitro` VALUES (1,'Juan Perez','Argentina','MMA'),(2,'Maria Rodriguez','España','Boxeo'),(3,'John Smith','Estados Unidos','Jiu-Jitsu'),(4,'Ana García','México','Lucha Libre'),(5,'Michael Johnson','Canadá','Muay Thai'),(6,'Sophie Martin','Francia','Kickboxing'),(7,'David Lee','Corea del Sur','Taekwondo'),(8,'Luis Chavez','Perú','Judo'),(9,'Elena Sanchez','Colombia','Wrestling'),(10,'Andrea Rossi','Italia','Karate'),(11,'Mohammed Ali','Egipto','Boxeo'),(12,'Oliver Müller','Alemania','MMA'),(13,'Chen Wei','China','Kung Fu'),(14,'Tatiana Petrova','Rusia','Sambo'),(15,'Diego Fernandez','Argentina','Capoeira'),(16,'Sophia Johnson','Estados Unidos','Krav Maga'),(17,'Miguel Rodriguez','México','Taekwondo'),(18,'Marcelo Costa','Brasil','Lucha Libre'),(19,'Sara Gomez','España','Kickboxing'),(20,'Hiroshi Tanaka','Japón','Jiu-Jitsu');
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
  `Fecha/Hora` datetime DEFAULT NULL,
  `Resultado` int(11) DEFAULT NULL,
  `MetodoFinalizacion` varchar(45) DEFAULT NULL,
  `Duracion` int(11) DEFAULT NULL,
  `Arbitro_idArbitro` int(11) NOT NULL,
  `Ronda_NumeroRonda` int(11) NOT NULL,
  `Evento_idEvento` int(11) NOT NULL,
  PRIMARY KEY (`idCombate`),
  KEY `fk_Combate_Arbitro1_idx` (`Arbitro_idArbitro`),
  KEY `fk_Combate_Ronda1_idx` (`Ronda_NumeroRonda`),
  KEY `fk_Combate_Evento1_idx` (`Evento_idEvento`),
  CONSTRAINT `fk_Combate_Arbitro1` FOREIGN KEY (`Arbitro_idArbitro`) REFERENCES `arbitro` (`idArbitro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Combate_Evento1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Combate_Ronda1` FOREIGN KEY (`Ronda_NumeroRonda`) REFERENCES `ronda` (`NumeroRonda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combate`
--

LOCK TABLES `combate` WRITE;
/*!40000 ALTER TABLE `combate` DISABLE KEYS */;
INSERT INTO `combate` VALUES (1,'2024-01-01 12:00:00',1,'KO',300,1,1,1),(2,'2024-02-01 15:00:00',2,'Sumisión',420,2,1,2),(3,'2024-03-01 18:00:00',3,'Decisión',600,3,2,3),(4,'2024-04-01 14:00:00',1,'KO',180,4,2,4),(5,'2024-05-01 16:00:00',2,'Sumisión',360,5,3,5),(6,'2024-06-01 17:00:00',3,'Decisión',540,6,3,6),(7,'2024-07-01 13:00:00',1,'KO',240,7,4,7),(8,'2024-08-01 14:00:00',2,'Sumisión',480,8,4,8),(9,'2024-09-01 15:00:00',3,'Decisión',720,9,5,9),(10,'2024-10-01 16:00:00',1,'KO',300,10,5,10),(11,'2024-11-01 17:00:00',2,'Sumisión',540,11,6,11),(12,'2024-12-01 18:00:00',3,'Decisión',780,12,6,12),(13,'2025-01-01 12:00:00',1,'KO',360,13,7,13),(14,'2025-02-01 15:00:00',2,'Sumisión',600,14,7,14),(15,'2025-03-01 18:00:00',3,'Decisión',840,15,8,15);
/*!40000 ALTER TABLE `combate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `detalles_combates`
--

DROP TABLE IF EXISTS `detalles_combates`;
/*!50001 DROP VIEW IF EXISTS `detalles_combates`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detalles_combates` AS SELECT 
 1 AS `idCombate`,
 1 AS `Fecha/Hora`,
 1 AS `Luchador1`,
 1 AS `Luchador2`,
 1 AS `Ganador`,
 1 AS `Resultado`,
 1 AS `MetodoFinalizacion`,
 1 AS `Duracion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `detalles_combates_division`
--

DROP TABLE IF EXISTS `detalles_combates_division`;
/*!50001 DROP VIEW IF EXISTS `detalles_combates_division`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detalles_combates_division` AS SELECT 
 1 AS `idCombate`,
 1 AS `Fecha/Hora`,
 1 AS `Luchador1`,
 1 AS `Luchador2`,
 1 AS `DivisionLuchador1`,
 1 AS `DivisionLuchador2`,
 1 AS `Resultado`,
 1 AS `MetodoFinalizacion`,
 1 AS `Duracion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `detalles_combates_resultado`
--

DROP TABLE IF EXISTS `detalles_combates_resultado`;
/*!50001 DROP VIEW IF EXISTS `detalles_combates_resultado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detalles_combates_resultado` AS SELECT 
 1 AS `idCombate`,
 1 AS `Fecha/Hora`,
 1 AS `Luchador1`,
 1 AS `Luchador2`,
 1 AS `Resultado`,
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
  PRIMARY KEY (`idDivision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,'Peso Medio',NULL,NULL),(2,'Peso Gallo',NULL,NULL),(3,'Peso Ligero',NULL,NULL),(4,'Peso Semipesado',NULL,NULL),(5,'Peso Mosca',NULL,NULL),(6,'Peso Pluma',NULL,NULL),(7,'Peso Wélter',NULL,NULL);
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
INSERT INTO `entrenador` VALUES ('Aamir Waleed','Academia de Combate \"Pantera Negra\"','Boxeo'),('Abayomi Adewale','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Abdullah Muhammad','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Abeni Abiodun','Academia de Combate \"Pantera Negra\"','Boxeo'),('Adam Kowalski','Academia de Combate \"Pantera Negra\"','Boxeo'),('Adam Wójcik','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Adisa Ogunlade','Academia de Combate \"Pantera Negra\"','Boxeo'),('Adnan Ahmad','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Ahmad Tariq','Dojo \"Fénix Dorado\"','Karate'),('Ahmed Ali','Academia de Combate \"Pantera Negra\"','Boxeo'),('Aisha Ahmad','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Alejandra Sánchez','Academia de Combate \"Dragón Blanco\"','Muay Thai'),('Ali Khan','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Amir Abdullah','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Ana Pérez','Academia de Combate \"Pantera Negra\"','Boxeo'),('Andrea López','Dojo \"Dragón Dorado\"','Muay Thai'),('Antonio Jiménez','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Ayo Okeke','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Babatunde Okeke','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Bakari Umar','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Bartosz Nowak','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Bartłomiej Nowak','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Bilal Hassan','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Bisi Adewale','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Carla Fernández','Academia de Combate \"Fénix Blanco\"','Jiu-Jitsu'),('Carlos López','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Carmen Ruiz','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Catalina García','Escuela de Lucha \"Fénix Rojo\"','Taekwondo'),('Cezary Wojcik','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Chidi Okafor','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Chike Nzube','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Chinwe Eze','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Czesław Kowalczyk','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Dada Nnamdi','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Damilola Oni','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Daniel López','Escuela de Lucha \"Dragón Dorado\"','Taekwondo'),('Dara Okafor','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Dariusz Lewandowski','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('David Medina','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('David Pérez','Dojo \"Pantera Blanca\"','Taekwondo'),('Dawid Michalski','Dojo \"Fénix Dorado\"','Karate'),('Diego Martínez','Academia de Combate \"León Guerrero\"','Jiu-Jitsu'),('Ebele Okoro','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Ejiofor Adeyemi','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Elena Rubio','Dojo \"Fénix Dorado\"','Karate'),('Emeka Nwachukwu','Dojo \"Fénix Dorado\"','Karate'),('Emil Kaczmarek','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Eryk Sikora','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Fahad Ahmed','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Faisal Yusuf','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Fatima Mahmoud','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Femi Oladele','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Femi Onuoha','Dojo \"Fénix Dorado\"','Karate'),('Filip Michalski','Dojo \"Fénix Dorado\"','Karate'),('Florencia Martínez','Dojo \"Dragón Rojo\"','Karate'),('Folake Nwachukwu','Dojo \"Fénix Dorado\"','Karate'),('Francisco Martínez','Dojo \"León Negro\"','Boxeo'),('Francisco Ramirez','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Franciszek Kaczmarek','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Gabriela Martínez','Centro de Entrenamiento \"Tigre Blanco\"','Kickboxing'),('Gafar Ngubane','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Gbolahan Adewale','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Grzegorz Jankowski','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Grzegorz Nowak','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Hakeem Adisa','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Hakim Umar','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Hamza Hassan','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Hassan Ali','Dojo \"Fénix Dorado\"','Karate'),('Henryk Wojciechowski','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Hisham Mahmoud','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Hubert Kowalczyk','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Hussein Ahmad','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Ibrahim Ahmed','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Idowu Odumosu','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Ifeanyichukwu Okafor','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Ifioma Uzor','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Igor Kowal','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Igor Sikora','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Imran Waleed','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Isabel Navarro','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Isabella Sánchez','Centro de Entrenamiento \"Tigre Negro\"','Kickboxing'),('Ismail Ali','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Jabari Nnamdi','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Jacek Nowakowski','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Jamal Hassan','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Jan Nowakowski','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Javier Pérez','Centro de Entrenamiento \"Pantera Rojo\"','Taekwondo'),('Javier Sánchez','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Jelani Igwe','Academia de Combate \"Pantera Negra\"','Boxeo'),('Jide Adebayo','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Joaquín Fernández','Dojo \"Tigre Blanco\"','Muay Thai'),('José Rodríguez','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('José Sánchez','Academia de Artes Marciales \"Águila Azul\"','Karate'),('Juan López','Academia de Combate \"Pantera Dorada\"','Kickboxing'),('Juan Martinez','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Juan Ramírez','Escuela de Lucha \"Dragón Negro\"','Boxeo'),('Kamau Osagie','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Kamil Wojciechowski','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Kareem Ali','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Karim Mahmoud','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Karol Wojciechowski','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Khalid Omar','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Kofi Adekunle','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Kwame Adeyemi','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Lamidi Onuoha','Dojo \"Fénix Dorado\"','Karate'),('Lamidi Osagie','Dojo \"Fénix Dorado\"','Karate'),('Laura Fernández','Dojo \"Fénix Dorado\"','Karate'),('Leila Khan','Dojo \"Fénix Dorado\"','Karate'),('Lekan Adeyemi','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Leszek Wojtas','Dojo \"Fénix Dorado\"','Karate'),('Lucas Rodríguez','Academia de Combate \"Pantera Roja\"','Muay Thai'),('Lucía Fernández','Escuela de Lucha \"Águila Azul\"','Jiu-Jitsu'),('Lucía Martínez','Centro de Entrenamiento \"Dragón Blanco\"','Boxeo'),('Lucía Rodríguez','Dojo \"Dragón Dorado\"','Boxeo'),('Luis González','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Mandla Ngubane','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Marek Grabowski','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('María García','Gimnasio \"Tigre Blanco\"','Muay Thai'),('María Pérez','Dojo \"Fénix Dorado\"','Kickboxing'),('María Rodríguez','Centro de Entrenamiento \"Tigre Blanco\"','Kickboxing'),('Mariusz Grabowski','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Marta Díaz','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Martín Rodríguez','Centro de Entrenamiento \"Lobo Solitario\"','Karate'),('Martín Sánchez','Academia de Combate \"Águila Rojo\"','Taekwondo'),('Martina Rodríguez','Centro de Entrenamiento \"Águila Negra\"','Boxeo'),('Maryam Hassan','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Mateo Pérez','Centro de Entrenamiento \"Águila Azul\"','Muay Thai'),('Matías García','Centro de Entrenamiento \"León Guerrero\"','Karate'),('Miguel Torres','Academia de Combate \"Pantera Negra\"','Boxeo'),('Mohammed Khalil','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Musa Egwu','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Mustafa Hassan','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Nabil Ahmad','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Najib Hassan','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Nasir Hassan','Dojo \"Fénix Dorado\"','Karate'),('Nicolás Fernández','Academia de Combate \"Pantera Negra\"','Karate'),('Nkosi Adisa','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Nnamdi Abiodun','Academia de Combate \"Pantera Negra\"','Boxeo'),('Nneka Onuoha','Dojo \"Fénix Dorado\"','Karate'),('Norbert Sikorski','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Norbert Wójcik','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Obinna Nnamdi','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Olawale Odumosu','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Olek Kaczmarek','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Oluwafemi Adisa','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Omar Abdullah','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Omar Mahmoud','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Omolara Adewale','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Omotunde Igwe','Academia de Combate \"Pantera Negra\"','Boxeo'),('Onyeka Igwe','Academia de Combate \"Pantera Negra\"','Boxeo'),('Osei Okeke','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Oskar Kaczmarczyk','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Pablo Rodríguez','Escuela de Lucha \"León Guerrero\"','Boxeo'),('Paki Adekunle','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Pape Eze','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Paula Serrano','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Paweł Wojciechowski','Academia de Combate \"Pantera Negra\"','Boxeo'),('Pedro Gómez','Dojo \"Fénix Dorado\"','Karate'),('Piotr Wojciechowski','Academia de Combate \"Pantera Negra\"','Boxeo'),('Quincy Oni','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Rahma Hassan','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Rahman Osagie','Dojo \"Fénix Dorado\"','Karate'),('Rasheed Adekunle','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Rashid Ali','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Rashidi Okoro','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Robert Wójcik','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Robert Wrona','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Roberto Sánchez','Academia de Combate \"Tigre Negro\"','Boxeo'),('Rosa Molina','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Saad Khan','Dojo \"Fénix Dorado\"','Karate'),('Sadiq Egwu','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Saidi Nwachukwu','Dojo \"Fénix Dorado\"','Karate'),('Salim Khalid','Academia de Combate \"Pantera Negra\"','Boxeo'),('Sami Hussein','Dojo \"Fénix Dorado\"','Karate'),('Sanaa Ahmed','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Santiago López','Escuela de Lucha \"Fénix Dorado\"','Karate'),('Santiago Martínez','Academia de Combate \"Fénix Azul\"','Jiu-Jitsu'),('Sara Bravo','Academia de Combate \"Pantera Negra\"','Boxeo'),('Sara Martínez','Centro de Entrenamiento \"León Guerrero\"','Muay Thai'),('Sebastián Fernández','Centro de Entrenamiento \"Fénix Azul\"','Karate'),('Sebastián Rodríguez','Dojo \"Tigre Azul\"','Boxeo'),('Sebastian Sikorski','Dojo \"Fénix Dorado\"','Karate'),('Sofía Pérez','Academia de Combate \"Fénix Dorado\"','Jiu-Jitsu'),('Stanisław Sikorski','Dojo \"Fénix Dorado\"','Karate'),('Tadeusz Lewandowski','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Tamer Hussein','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Tariq Ibrahim','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Tayo Adewale','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Temi Osagie','Dojo \"Fénix Dorado\"','Karate'),('Tendai Abiodun','Academia de Combate \"Pantera Negra\"','Boxeo'),('Tomás González','Centro de Entrenamiento \"Fénix Blanco\"','Jiu-Jitsu'),('Tomasz Lewandowski','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Uche Okeke','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Umaru Igwe','Club de Artes Marciales \"Lobo Solitario\"','Kickboxing'),('Uzoma Egwu','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Vala Adekunle','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Valentina Fernández','Dojo \"Águila Azul\"','Kickboxing'),('Valentina López','Centro de Entrenamiento \"León Blanco\"','Jiu-Jitsu'),('Valentina Martínez','Academia de Combate \"Águila Roja\"','Muay Thai'),('Valentina Pérez','Academia de Artes Marciales \"Lobo Negro\"','Jiu-Jitsu'),('Valeria González','Dojo \"Águila Dorada\"','Jiu-Jitsu'),('Valeria López','Centro de Entrenamiento \"Lobo Rojo\"','Muay Thai'),('Valeria Rodríguez','Escuela de Lucha \"Tigre Blanco\"','Kickboxing'),('Vusi Eze','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Waldemar Wrobel','Academia de Combate \"Pantera Negra\"','Boxeo'),('Wale Oni','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Waleed Hassan','Academia de Combate \"Pantera Negra\"','Boxeo'),('Wasiu Okafor','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Wojciech Wrobel','Academia de Combate \"Pantera Negra\"','Boxeo'),('Yakubu Okoro','Centro de Entrenamiento \"Águila de Fuego\"','Taekwondo'),('Yao Onuoha','Dojo \"Fénix Dorado\"','Karate'),('Yasin Ibrahim','Gimnasio \"Tigre Blanco\"','Muay Thai'),('Youssef Hassan','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Yusuf Hassan','Dojo \"Fénix Dorado\"','Karate'),('Zain Abdullah','Escuela de Lucha \"León Guerrero\"','Lucha Libre'),('Zakaria Khan','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Zara Odumosu','Academia de Combate \"Pantera Negra\"','Boxeo'),('Zaynab Ali','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Zbigniew Kowalczyk','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Zdzisław Kowalczyk','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Zikomo Nwachukwu','Dojo \"Fénix Dorado\"','Karate'),('Zuberi Nnamdi','Academia de Artes Marciales \"Dragón Rojo\"','Jiu-Jitsu'),('Łukasz Wojtas','Dojo \"Fénix Dorado\"','Karate');
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
  `Fecha/Hora` datetime DEFAULT NULL,
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
INSERT INTO `evento` VALUES (1,'Campeonato de MMA','2024-02-20 18:00:00','Estadio Nacional',15000),(2,'Torneo de Boxeo','2024-03-15 20:30:00','Arena Ciudad de México',10000),(3,'Gran Prix de Jiu-Jitsu','2024-04-10 10:00:00','Ginásio do Ibirapuera',8000),(4,'Festival de Lucha Libre','2024-05-05 19:00:00','Arena México',12000),(5,'Gala de Muay Thai','2024-06-20 17:30:00','Rajadamnern Stadium',9000),(6,'Campeonato de Kickboxing','2024-07-15 21:00:00','Palais Omnisports de Paris-Bercy',11000),(7,'Torneo de Taekwondo','2024-08-10 14:00:00','Seoul Olympic Park',8500),(8,'Gran Premio de Judo','2024-09-05 12:00:00','Nippon Budokan',9500),(9,'Torneo de Wrestling','2024-10-20 16:30:00','Ryōgoku Kokugikan',7000),(10,'Competición de Karate','2024-11-15 19:30:00','PalaLottomatica',8000),(11,'Campeonato de Boxeo','2025-01-10 20:00:00','MGM Grand Garden Arena',18000),(12,'Torneo de MMA','2025-02-25 18:30:00','Madison Square Garden',16000),(13,'Gran Prix de Jiu-Jitsu','2025-03-20 10:00:00','Ginásio do Ibirapuera',8500),(14,'Festival de Lucha Libre','2025-04-15 19:00:00','Arena México',13000),(15,'Gala de Muay Thai','2025-05-10 17:30:00','Rajadamnern Stadium',9200),(16,'Campeonato de Kickboxing','2025-06-05 21:00:00','Palais Omnisports de Paris-Bercy',10500),(17,'Torneo de Taekwondo','2025-07-20 14:00:00','Seoul Olympic Park',8700),(18,'Gran Premio de Judo','2025-08-15 12:00:00','Nippon Budokan',9700),(19,'Torneo de Wrestling','2025-09-10 16:30:00','Ryōgoku Kokugikan',7200),(20,'Competición de Karate','2025-10-25 19:30:00','PalaLottomatica',8200);
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
  `FechaNacimiento` date DEFAULT NULL,
  `Peso` int(11) DEFAULT NULL,
  `Altura` int(11) DEFAULT NULL,
  `Record` varchar(50) DEFAULT NULL,
  `Equipo` varchar(45) DEFAULT NULL,
  `Titulo_NombreTitutlo` varchar(100) DEFAULT NULL,
  `Division_idDivision` int(11) NOT NULL,
  `Entrenador_NombreEntrenador` varchar(45) NOT NULL,
  PRIMARY KEY (`idLuchador`),
  KEY `fk_Luchador_Titulo1_idx` (`Titulo_NombreTitutlo`),
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
INSERT INTO `luchador` VALUES (1,'Alexandre Pantoja','Mexico','1990-05-15',180,80,'20','Team Alpha','Campeón Peso Mosca',1,'Juan Martinez'),(2,'Alex Pereira','Brazil','1992-08-21',170,65,'15','Team Beta','Campeón Peso Semipesado',2,'María García'),(3,'Dricus du Plessis','USA','1988-04-10',175,70,'18','Team Gamma','Campeón Peso Medio',3,'José Rodríguez'),(4,'León Edwards','Australia','1995-11-30',160,55,'12','Team Delta','Campeón Peso Wélter',4,'Laura Fernández'),(5,'Islam Makhachev','Rusia','1991-02-28',185,75,'22','Team Epsilon','Campeón Peso Ligero',5,'Carlos López'),(6,'Alexander Volkanovski','Rusia','1989-09-05',168,63,'17','Team Zeta','Campeón Peso Pluma',6,'Ana Pérez'),(7,'Sean O\'malley','USA','1993-06-20',172,68,'19','Team Eta','Campeón Peso Gallo',7,'Luis González'),(8,'Jessica Chang','Taiwan','1994-03-25',164,60,'14','Team Theta',NULL,4,'Marta Díaz'),(9,'William Brown','UK','1990-07-17',178,73,'21','Team Iota',NULL,1,'Javier Sánchez'),(10,'Emma Wilson','New Zealand','1987-12-12',163,58,'16','Team Kappa',NULL,2,'Carmen Ruiz'),(11,'Daniel White','Ireland','1996-01-05',181,78,'23','Team Lambda',NULL,3,'Pedro Gómez'),(12,'Olivia Miller','Germany','1992-10-08',170,65,'18','Team Mu',NULL,4,'Rosa Molina'),(13,'Matthew Davis','France','1988-05-20',176,71,'20','Team Nu',NULL,5,'Miguel Torres'),(14,'Isabella Moore','Italy','1994-09-15',169,64,'15','Team Xi',NULL,6,'Isabel Navarro'),(15,'Christopher Taylor','Brazil','1993-04-03',174,69,'19','Team Omicron',NULL,7,'Antonio Jiménez'),(16,'Sophie Brown','Argentina','1991-08-28',167,62,'14','Team Pi',NULL,2,'Paula Serrano'),(17,'Andrew Martin','Russia','1995-02-10',182,77,'22','Team Rho',NULL,1,'Francisco Ramirez'),(18,'Grace Thompson','South Africa','1989-11-05',166,61,'17','Team Sigma',NULL,2,'Elena Rubio'),(19,'David Anderson','Sweden','1990-06-18',179,72,'20','Team Tau',NULL,3,'David Medina'),(20,'Lily Harris','Norway','1993-03-22',171,67,'18','Team Upsilon',NULL,4,'Sara Bravo'),(21,'Jacob Wilson','Finland','1988-09-10',177,70,'21','Team Phi',NULL,5,'Juan Martinez'),(22,'Sophia Johnson','Denmark','1991-04-05',165,63,'16','Team Chi',NULL,6,'María García'),(23,'Alexander Lee','Poland','1994-10-20',173,68,'19','Team Psi',NULL,7,'José Rodríguez'),(24,'Emma Martinez','Netherlands','1992-07-15',168,65,'14','Team Omega',NULL,6,'Laura Fernández'),(25,'Mia Rodriguez','Switzerland','1989-12-28',180,75,'22','Team Alpha',NULL,1,'Carlos López'),(26,'James Brown','Belgium','1996-08-02',172,70,'18','Team Beta',NULL,2,'Ana Pérez'),(27,'Emma Johnson','Portugal','1993-05-25',167,66,'20','Team Gamma',NULL,3,'Luis González'),(28,'Noah Wilson','Austria','1990-01-08',175,72,'19','Team Delta',NULL,4,'Marta Díaz'),(29,'Ava Thompson','Czech Republic','1988-10-12',169,67,'15','Team Epsilon',NULL,5,'Javier Sánchez'),(30,'Benjamin Miller','Hungary','1991-06-15',181,76,'21','Team Zeta',NULL,6,'Carmen Ruiz'),(31,'Olivia Smith','Greece','1995-03-20',170,64,'16','Team Eta',NULL,7,'Pedro Gómez'),(32,'Lucas Johnson','Turkey','1992-09-05',174,69,'14','Team Theta',NULL,5,'Rosa Molina'),(33,'Emily Davis','Ukraine','1989-05-30',178,74,'23','Team Iota',NULL,1,'Miguel Torres'),(34,'Daniel Garcia','Chile','1993-12-18',168,67,'17','Team Kappa',NULL,2,'Isabel Navarro'),(35,'Mia Martin','Colombia','1990-07-01',176,71,'20','Team Lambda',NULL,3,'Antonio Jiménez'),(36,'David Brown','Peru','1994-04-25',172,68,'18','Team Mu',NULL,4,'Paula Serrano'),(37,'Sophia Wilson','Venezuela','1988-11-10',170,65,'22','Team Nu',NULL,5,'Francisco Ramirez'),(38,'Alexander Johnson','Ecuador','1991-06-05',169,64,'19','Team Xi',NULL,6,'Elena Rubio'),(39,'Emma Anderson','Paraguay','1995-03-15',173,68,'15','Team Omicron',NULL,7,'David Medina'),(40,'Lucas Martinez','Bolivia','1992-08-28',175,70,'14','Team Pi',NULL,3,'Sara Bravo'),(41,'Olivia Harris','Uruguay','1990-02-10',180,75,'21','Team Rho',NULL,1,'Juan Martinez'),(42,'Lucas Wilson','Panama','1993-10-05',167,66,'18','Team Sigma',NULL,2,'María García'),(43,'Daniel Johnson','Costa Rica','1989-07-18',175,72,'20','Team Tau',NULL,3,'José Rodríguez'),(44,'Sophia Garcia','Puerto Rico','1994-04-02',169,67,'19','Team Upsilon',NULL,4,'Laura Fernández'),(45,'Oliver Rodriguez','Jamaica','1988-12-15',173,68,'15','Team Phi',NULL,5,'Carlos López'),(46,'Sophia Brown','Trinidad and Tobago','1991-09-28',170,65,'22','Team Chi',NULL,6,'Ana Pérez'),(47,'Alexander Thompson','Dominican Republic','1995-06-10',166,63,'17','Team Psi',NULL,7,'Luis González'),(48,'Emma Wilson','Barbados','1992-03-25',172,68,'14','Team Omega',NULL,6,'Marta Díaz'),(49,'Isaac Smith','United States','1992-06-10',183,85,'18','Team Alpha',NULL,1,'Juan Martinez'),(50,'Hannah Johnson','Canada','1995-03-15',172,68,'14','Team Beta',NULL,2,'María García'),(51,'Lucas Brown','Mexico','1990-11-20',178,72,'20','Team Gamma',NULL,3,'José Rodríguez'),(52,'Sophia Wilson','Australia','1993-08-05',167,65,'16','Team Delta',NULL,4,'Laura Fernández'),(53,'Alexander Martin','China','1991-12-18',180,76,'22','Team Epsilon',NULL,5,'Carlos López'),(54,'Olivia Lee','South Korea','1988-09-30',175,70,'21','Team Zeta',NULL,6,'Ana Pérez'),(55,'Emma Kim','Japan','1994-04-12',169,66,'18','Team Eta',NULL,7,'Luis González'),(56,'Noah Chang','Taiwan','1992-01-25',174,68,'15','Team Theta',NULL,1,'Marta Díaz'),(57,'Sophia Anderson','United Kingdom','1989-07-20',181,73,'21','Team Iota',NULL,2,'Javier Sánchez'),(58,'Daniel Wilson','New Zealand','1991-04-05',176,70,'20','Team Kappa',NULL,3,'Carmen Ruiz'),(59,'Oliver Garcia','Ireland','1996-03-18',170,65,'16','Team Lambda',NULL,4,'Pedro Gómez'),(60,'Sophia Brown','Germany','1993-10-30',178,72,'18','Team Mu',NULL,5,'Rosa Molina'),(61,'Isabella Davis','France','1988-05-25',169,66,'19','Team Nu',NULL,6,'Miguel Torres'),(62,'Lucas Moore','Italy','1995-02-10',172,68,'14','Team Xi',NULL,7,'Isabel Navarro'),(63,'Olivia Martin','Brazil','1990-09-15',177,71,'22','Team Omicron',NULL,1,'Antonio Jiménez'),(64,'Benjamin Thompson','Argentina','1993-08-28',165,64,'15','Team Pi',NULL,2,'Paula Serrano'),(65,'Emma Smith','Russia','1989-11-20',180,75,'20','Team Rho',NULL,3,'Francisco Ramirez'),(66,'Lucas Wilson','South Africa','1992-06-05',173,70,'19','Team Sigma',NULL,4,'Elena Rubio'),(67,'Daniel Anderson','Sweden','1995-03-10',168,67,'16','Team Tau',NULL,5,'David Medina'),(68,'Sophia Harris','Norway','1991-10-25',182,74,'21','Team Upsilon',NULL,6,'Sara Bravo'),(69,'Alexander Wilson','Finland','1988-07-08',175,71,'20','Team Phi',NULL,7,'Juan Martinez'),(70,'Emma Johnson','Denmark','1993-04-12',178,73,'22','Team Chi',NULL,1,'María García'),(71,'Sophia Lee','Poland','1990-09-05',168,67,'19','Team Psi',NULL,2,'José Rodríguez'),(72,'Alexander Martinez','Netherlands','1994-05-18',171,68,'18','Team Omega',NULL,3,'Laura Fernández'),(73,'Olivia Rodriguez','Switzerland','1989-12-30',175,70,'17','Team Alpha',NULL,4,'Carlos López'),(74,'Lucas Brown','Belgium','1996-09-02',170,68,'15','Team Beta',NULL,5,'Ana Pérez'),(75,'Sophia Wilson','Portugal','1993-05-15',179,72,'21','Team Gamma',NULL,6,'Luis González'),(76,'Daniel Chang','Austria','1990-01-28',183,76,'23','Team Delta',NULL,7,'Marta Díaz'),(77,'Olivia Anderson','Czech Republic','1988-08-20',174,69,'19','Team Epsilon',NULL,1,'Javier Sánchez'),(78,'Lucas Wilson','Hungary','1991-07-15',170,67,'18','Team Zeta',NULL,2,'Carmen Ruiz'),(79,'Emma Smith','Greece','1995-04-30',177,72,'20','Team Eta',NULL,3,'Pedro Gómez'),(80,'Alexander Brown','Turkey','1992-09-15',171,70,'16','Team Theta',NULL,4,'Rosa Molina'),(81,'Sophia Wilson','Ukraine','1989-06-20',168,65,'15','Team Iota',NULL,5,'Miguel Torres'),(82,'Daniel Martinez','Chile','1993-01-08',180,74,'22','Team Kappa',NULL,6,'Isabel Navarro'),(83,'Olivia Johnson','Colombia','1990-10-12',172,68,'21','Team Lambda',NULL,7,'Antonio Jiménez'),(84,'Lucas Rodriguez','Peru','1994-07-25',177,71,'20','Team Mu',NULL,1,'Paula Serrano'),(85,'Sophia Smith','Venezuela','1988-02-18',170,67,'19','Team Nu',NULL,2,'Francisco Ramirez'),(86,'Alexander Johnson','Ecuador','1991-11-30',175,70,'18','Team Xi',NULL,3,'Elena Rubio'),(87,'Emma Anderson','Paraguay','1995-08-05',179,73,'17','Team Omicron',NULL,4,'David Medina'),(88,'Sophia Martinez','Bolivia','1992-03-20',167,66,'16','Team Pi',NULL,5,'Sara Bravo'),(89,'Daniel Wilson','Uruguay','1989-12-15',180,75,'21','Team Rho',NULL,6,'Juan Martinez'),(90,'Olivia Johnson','Panama','1993-07-28',168,67,'20','Team Sigma',NULL,7,'María García'),(91,'Lucas Rodriguez','Costa Rica','1990-04-10',182,74,'22','Team Tau',NULL,1,'José Rodríguez'),(92,'Sophia Wilson','Puerto Rico','1991-11-05',173,69,'18','Team Upsilon',NULL,2,'Laura Fernández'),(93,'Alexander Johnson','Jamaica','1994-06-20',168,66,'17','Team Phi',NULL,3,'Carlos López'),(94,'Emma Smith','Trinidad and Tobago','1989-03-25',171,68,'16','Team Chi',NULL,4,'Ana Pérez'),(95,'Sophia Rodriguez','Dominican Republic','1992-12-10',175,70,'21','Team Psi',NULL,5,'Luis González'),(96,'Daniel Martinez','Barbados','1995-09-28',178,72,'20','Team Omega',NULL,6,'Marta Díaz'),(97,'Olivia Johnson','Bahamas','1990-06-12',169,67,'18','Team Alpha',NULL,7,'Javier Sánchez'),(98,'Lucas Smith','Guatemala','1993-03-15',180,73,'17','Team Beta',NULL,1,'Carmen Ruiz'),(99,'Sophia Wilson','Honduras','1988-08-20',172,68,'15','Team Gamma',NULL,2,'Pedro Gómez'),(100,'Alexander Martinez','Nicaragua','1991-05-30',178,71,'20','Team Delta',NULL,3,'Rosa Molina'),(101,'Emma Thompson','Belize','1994-02-12',168,65,'18','Team Epsilon',NULL,4,'Miguel Torres'),(102,'Sophia Anderson','El Salvador','1989-09-25',171,68,'16','Team Zeta',NULL,5,'Isabel Navarro'),(103,'Alexander Rodriguez','Haiti','1992-06-10',175,70,'22','Team Eta',NULL,6,'Antonio Jiménez'),(104,'Emma Johnson','Cuba','1993-03-05',177,72,'21','Team Theta',NULL,7,'Paula Serrano'),(105,'Olivia Smith','Dominica','1990-12-18',180,75,'20','Team Iota',NULL,1,'Francisco Ramirez'),(106,'Lucas Wilson','Saint Lucia','1993-08-28',173,69,'19','Team Kappa',NULL,2,'Elena Rubio'),(107,'Sophia Lee','Saint Vincent and the Grenadines','1991-04-15',179,73,'17','Team Lambda',NULL,3,'David Medina'),(108,'Alexander Garcia','Antigua and Barbuda','1988-11-30',181,74,'16','Team Mu',NULL,4,'Sara Bravo'),(109,'Emma Martinez','Saint Kitts and Nevis','1995-09-05',172,70,'15','Team Nu',NULL,5,'Juan Martinez'),(110,'Sophia Davis','Saint Vincent and the Grenadines','1990-04-20',177,71,'22','Team Xi',NULL,6,'María García'),(111,'Daniel Anderson','Trinidad and Tobago','1993-01-08',174,69,'20','Team Omicron',NULL,7,'José Rodríguez'),(112,'Olivia Garcia','Barbados','1990-10-12',180,75,'18','Team Pi',NULL,1,'Laura Fernández'),(113,'Lucas Rodriguez','Belize','1994-07-25',169,66,'17','Team Rho',NULL,2,'Carlos López'),(114,'Sophia Smith','Bahamas','1988-02-18',172,68,'16','Team Sigma',NULL,3,'Ana Pérez'),(115,'Alexander Wilson','Guatemala','1991-11-30',175,70,'21','Team Tau',NULL,4,'Luis González'),(116,'Emma Thompson','Honduras','1995-08-05',178,73,'20','Team Upsilon',NULL,5,'Marta Díaz'),(117,'Sophia Anderson','Nicaragua','1988-06-20',169,67,'19','Team Phi',NULL,6,'Javier Sánchez'),(118,'Alexander Rodriguez','El Salvador','1992-03-05',171,68,'18','Team Chi',NULL,7,'Carmen Ruiz'),(119,'Emma Johnson','Haiti','1990-12-18',175,70,'17','Team Psi',NULL,1,'Pedro Gómez'),(120,'Olivia Smith','Cuba','1993-09-28',178,73,'22','Team Omega',NULL,2,'Rosa Molina'),(121,'Lucas Wilson','Dominica','1991-02-10',173,69,'21','Team Alpha',NULL,3,'Francisco Ramirez'),(122,'Sophia Lee','Saint Lucia','1994-09-15',179,73,'20','Team Beta',NULL,4,'Elena Rubio'),(123,'Alexander Garcia','Saint Vincent and the Grenadines','1989-04-02',172,68,'18','Team Gamma',NULL,5,'David Medina'),(124,'Emma Martinez','Antigua and Barbuda','1995-01-08',177,71,'17','Team Delta',NULL,6,'Sara Bravo'),(125,'Sophia Davis','Saint Kitts and Nevis','1990-10-12',180,75,'16','Team Epsilon',NULL,7,'Juan Martinez'),(126,'Daniel Anderson','Saint Vincent and the Grenadines','1993-07-28',169,66,'20','Team Zeta',NULL,1,'María García'),(127,'Olivia Garcia','Barbados','1990-04-10',174,69,'19','Team Eta',NULL,2,'José Rodríguez'),(128,'Lucas Rodriguez','Belize','1994-11-05',171,68,'18','Team Theta',NULL,3,'Laura Fernández'),(129,'Sophia Smith','Bahamas','1988-08-20',175,70,'17','Team Iota',NULL,4,'Carlos López'),(130,'Alexander Wilson','Guatemala','1991-05-30',178,73,'16','Team Kappa',NULL,5,'Ana Pérez'),(131,'Emma Thompson','Honduras','1995-02-12',169,67,'21','Team Lambda',NULL,6,'Luis González'),(132,'Sophia Anderson','Nicaragua','1988-06-20',172,68,'20','Team Mu',NULL,7,'Marta Díaz'),(133,'Alexander Rodriguez','El Salvador','1992-03-05',177,71,'19','Team Nu',NULL,1,'Javier Sánchez'),(134,'Emma Johnson','Haiti','1990-12-18',180,75,'18','Team Xi',NULL,2,'Carmen Ruiz'),(135,'Olivia Smith','Cuba','1993-09-28',169,66,'17','Team Omicron',NULL,3,'Pedro Gómez'),(136,'Lucas Wilson','Dominica','1991-02-10',172,68,'16','Team Pi',NULL,4,'Rosa Molina'),(137,'Sophia Lee','Saint Lucia','1994-09-15',179,73,'21','Team Rho',NULL,5,'Francisco Ramirez'),(138,'Alexander Garcia','Saint Vincent and the Grenadines','1989-04-02',172,68,'20','Team Sigma',NULL,6,'Elena Rubio'),(139,'Emma Martinez','Antigua and Barbuda','1995-01-08',177,71,'19','Team Tau',NULL,7,'David Medina'),(140,'Sophia Davis','Saint Kitts and Nevis','1990-10-12',180,75,'18','Team Upsilon',NULL,1,'Sara Bravo'),(141,'Daniel Anderson','Saint Vincent and the Grenadines','1993-07-28',169,66,'17','Team Phi',NULL,2,'Juan Martinez'),(142,'Olivia Garcia','Barbados','1990-04-10',174,69,'16','Team Chi',NULL,3,'María García'),(143,'Lucas Rodriguez','Belize','1994-11-05',171,68,'15','Team Psi',NULL,4,'José Rodríguez'),(144,'Sophia Smith','Bahamas','1988-08-20',175,70,'21','Team Omega',NULL,5,'Laura Fernández'),(145,'Alexander Wilson','Guatemala','1991-05-30',178,73,'20','Team Alpha',NULL,6,'Carlos López'),(146,'Emma Thompson','Honduras','1995-02-12',169,67,'19','Team Beta',NULL,7,'Ana Pérez'),(147,'Sophia Anderson','Nicaragua','1988-06-20',172,68,'18','Team Gamma',NULL,1,'Luis González'),(148,'Alexander Rodriguez','El Salvador','1992-03-05',177,71,'17','Team Delta',NULL,2,'Marta Díaz'),(149,'Emma Johnson','Haiti','1990-12-18',180,75,'16','Team Epsilon',NULL,3,'Javier Sánchez'),(150,'Olivia Smith','Cuba','1993-09-28',169,66,'21','Team Zeta',NULL,4,'Carmen Ruiz'),(151,'Lucas Wilson','Dominica','1991-02-10',172,68,'16','Team Eta',NULL,5,'Pedro Gómez'),(152,'Sophia Lee','Saint Lucia','1994-09-15',179,73,'21','Team Theta',NULL,6,'Rosa Molina'),(153,'Alexander Garcia','Saint Vincent and the Grenadines','1989-04-02',172,68,'20','Team Iota',NULL,7,'Francisco Ramirez'),(154,'Emma Martinez','Antigua and Barbuda','1995-01-08',177,71,'19','Team Kappa',NULL,1,'Elena Rubio'),(155,'Sophia Davis','Saint Kitts and Nevis','1990-10-12',180,75,'18','Team Lambda',NULL,2,'David Medina'),(156,'Daniel Anderson','Saint Vincent and the Grenadines','1993-07-28',169,66,'17','Team Mu',NULL,3,'Sara Bravo'),(157,'Olivia Garcia','Barbados','1990-04-10',174,69,'16','Team Nu',NULL,4,'Juan Martinez'),(158,'Lucas Rodriguez','Belize','1994-11-05',171,68,'15','Team Xi',NULL,5,'María García'),(159,'Sophia Smith','Bahamas','1988-08-20',175,70,'21','Team Omicron',NULL,6,'José Rodríguez'),(160,'Alexander Wilson','Guatemala','1991-05-30',178,73,'20','Team Pi',NULL,7,'Laura Fernández'),(161,'Emma Thompson','Honduras','1995-02-12',169,67,'19','Team Rho',NULL,1,'Carlos López'),(162,'Sophia Anderson','Nicaragua','1988-06-20',172,68,'18','Team Sigma',NULL,2,'Ana Pérez'),(163,'Alexander Rodriguez','El Salvador','1992-03-05',177,71,'17','Team Tau',NULL,3,'Luis González'),(164,'Emma Johnson','Haiti','1990-12-18',180,75,'16','Team Upsilon',NULL,4,'Marta Díaz'),(165,'Olivia Smith','Cuba','1993-09-28',169,66,'21','Team Phi',NULL,5,'Javier Sánchez'),(166,'Lucas Wilson','Dominica','1991-02-10',172,68,'20','Team Chi',NULL,6,'Carmen Ruiz'),(167,'Sophia Lee','Saint Lucia','1994-09-15',179,73,'19','Team Psi',NULL,7,'Pedro Gómez'),(168,'Alexander Garcia','Saint Vincent and the Grenadines','1989-04-02',172,68,'18','Team Omega',NULL,1,'Rosa Molina'),(169,'Emma Martinez','Antigua and Barbuda','1995-01-08',177,71,'17','Team Alpha',NULL,2,'Francisco Ramirez'),(170,'Sophia Davis','Saint Kitts and Nevis','1990-10-12',180,75,'16','Team Beta',NULL,3,'Elena Rubio'),(171,'Daniel Anderson','Saint Vincent and the Grenadines','1993-07-28',169,66,'21','Team Gamma',NULL,4,'David Medina'),(172,'Olivia Garcia','Barbados','1990-04-10',174,69,'20','Team Delta',NULL,5,'Sara Bravo'),(173,'Lucas Rodriguez','Belize','1994-11-05',171,68,'19','Team Epsilon',NULL,6,'Juan Martinez'),(174,'Sophia Smith','Bahamas','1988-08-20',175,70,'18','Team Zeta',NULL,7,'María García'),(175,'Alexander Wilson','Guatemala','1991-05-30',178,73,'17','Team Eta',NULL,1,'José Rodríguez'),(176,'Emma Thompson','Honduras','1995-02-12',169,67,'16','Team Theta',NULL,2,'Laura Fernández'),(177,'Sophia Anderson','Nicaragua','1988-06-20',172,68,'21','Team Iota',NULL,3,'Carlos López'),(178,'Alexander Rodriguez','El Salvador','1992-03-05',177,71,'20','Team Kappa',NULL,4,'Ana Pérez'),(179,'Emma Johnson','Haiti','1990-12-18',180,75,'19','Team Lambda',NULL,5,'Luis González'),(180,'Olivia Smith','Cuba','1993-09-28',169,66,'18','Team Mu',NULL,6,'Marta Díaz'),(181,'Lucas Wilson','Dominica','1991-02-10',172,68,'17','Team Nu',NULL,7,'Javier Sánchez'),(182,'Sophia Lee','Saint Lucia','1994-09-15',179,73,'16','Team Xi',NULL,1,'Carmen Ruiz'),(183,'Alexander Garcia','Saint Vincent and the Grenadines','1989-04-02',172,68,'21','Team Omicron',NULL,2,'Pedro Gómez'),(184,'Emma Martinez','Antigua and Barbuda','1995-01-08',177,71,'20','Team Pi',NULL,3,'Rosa Molina'),(185,'Sophia Davis','Saint Kitts and Nevis','1990-10-12',180,75,'19','Team Rho',NULL,4,'Francisco Ramirez'),(186,'Daniel Anderson','Saint Vincent and the Grenadines','1993-07-28',169,66,'18','Team Sigma',NULL,5,'Elena Rubio'),(187,'Olivia Garcia','Barbados','1990-04-10',174,69,'17','Team Tau',NULL,6,'David Medina'),(188,'Lucas Rodriguez','Belize','1994-11-05',171,68,'16','Team Upsilon',NULL,7,'Sara Bravo'),(189,'Sophia Smith','Bahamas','1988-08-20',175,70,'21','Team Phi',NULL,1,'Juan Martinez'),(190,'Alexander Wilson','Guatemala','1991-05-30',178,73,'20','Team Chi',NULL,2,'María García'),(191,'Emma Thompson','Honduras','1995-02-12',169,67,'19','Team Psi',NULL,3,'José Rodríguez'),(192,'Sophia Anderson','Nicaragua','1988-06-20',172,68,'18','Team Omega',NULL,4,'Laura Fernández'),(193,'Alexander Rodriguez','El Salvador','1992-03-05',177,71,'17','Team Alpha',NULL,5,'Carlos López'),(194,'Emma Johnson','Haiti','1990-12-18',180,75,'16','Team Beta',NULL,6,'Ana Pérez'),(195,'Olivia Smith','Cuba','1993-09-28',169,66,'21','Team Gamma',NULL,7,'Luis González'),(196,'Lucas Wilson','Dominica','1991-02-10',172,68,'20','Team Delta',NULL,1,'Marta Díaz'),(197,'Sophia Lee','Saint Lucia','1994-09-15',179,73,'19','Team Epsilon',NULL,2,'Javier Sánchez'),(198,'Alexander Garcia','Saint Vincent and the Grenadines','1989-04-02',172,68,'18','Team Zeta',NULL,3,'Carmen Ruiz'),(199,'Emma Martinez','Antigua and Barbuda','1995-01-08',177,71,'17','Team Eta',NULL,4,'Pedro Gómez'),(200,'Sophia Davis','Saint Kitts and Nevis','1990-10-12',180,75,'16','Team Theta',NULL,5,'Rosa Molina');
/*!40000 ALTER TABLE `luchador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participacion`
--

DROP TABLE IF EXISTS `participacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participacion` (
  `idCombate` int(11) NOT NULL,
  `idLuchador` int(11) NOT NULL,
  `Ganador` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCombate`,`idLuchador`),
  KEY `idLuchador` (`idLuchador`),
  CONSTRAINT `participacion_ibfk_1` FOREIGN KEY (`idCombate`) REFERENCES `combate` (`idCombate`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `participacion_ibfk_2` FOREIGN KEY (`idLuchador`) REFERENCES `luchador` (`idLuchador`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participacion`
--

LOCK TABLES `participacion` WRITE;
/*!40000 ALTER TABLE `participacion` DISABLE KEYS */;
INSERT INTO `participacion` VALUES (1,1,16),(1,16,16),(2,4,83),(2,83,83),(3,5,185),(3,185,185),(4,8,8),(4,112,8),(5,10,10),(5,161,10),(6,12,149),(6,149,149),(7,14,14),(7,99,14),(8,16,118),(8,118,118),(9,17,54),(9,54,54),(10,20,20),(10,187,20),(11,21,21),(11,123,21),(12,154,154),(12,164,154),(13,13,13),(13,25,13),(14,129,129),(14,164,129),(15,29,118),(15,118,118);
/*!40000 ALTER TABLE `participacion` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `ronda` VALUES (1,310,'Max Holloway'),(2,295,'Dustin Poirier'),(3,320,'Amanda Nunes'),(4,280,'Kamaru Usman'),(5,300,'Francis Ngannou'),(6,270,'Valentina Shevchenko'),(7,285,'Robert Whittaker'),(8,315,'Jorge Masvidal'),(9,290,'Tony Ferguson'),(10,305,'Justin Gaethje');
/*!40000 ALTER TABLE `ronda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulo`
--

DROP TABLE IF EXISTS `titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titulo` (
  `NombreTitutlo` varchar(45) NOT NULL,
  PRIMARY KEY (`NombreTitutlo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulo`
--

LOCK TABLES `titulo` WRITE;
/*!40000 ALTER TABLE `titulo` DISABLE KEYS */;
INSERT INTO `titulo` VALUES ('Campeón Peso Gallo'),('Campeón Peso Ligero'),('Campeón Peso Medio'),('Campeón Peso Mosca'),('Campeón Peso Pluma'),('Campeón Peso Semipesado'),('Campeón Peso Wélter');
/*!40000 ALTER TABLE `titulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `CalcularEdad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularEdad`(FechaNacimiento DATE) RETURNS int(11)
BEGIN

    DECLARE edad INT;

    SET edad = TIMESTAMPDIFF(YEAR, FechaNacimiento, CURDATE());

    RETURN edad;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `NombreCompleto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `NombreCompleto`(Nombre VARCHAR(100), Apellido VARCHAR(100)) RETURNS varchar(200) CHARSET utf8 COLLATE utf8_general_ci
BEGIN

    DECLARE nombre_completo VARCHAR(200);

    SET nombre_completo = CONCAT(Nombre, ' ', Apellido);

    RETURN nombre_completo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListarLuchadoresPorEquipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarLuchadoresPorEquipo`(IN equipo VARCHAR(100))
BEGIN

    DECLARE done INT DEFAULT FALSE;

    DECLARE nombre_luchador VARCHAR(200);

    DECLARE cur CURSOR FOR SELECT Nombre FROM Luchador WHERE Equipo = equipo;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;



    -- Crear una tabla temporal para almacenar los resultados

    CREATE TEMPORARY TABLE IF NOT EXISTS TempLuchadores (

        Luchador VARCHAR(200)

    );



    -- Limpiar la tabla temporal antes de llenarla

    TRUNCATE TABLE TempLuchadores;



    OPEN cur;



    read_loop: LOOP

        FETCH cur INTO nombre_luchador;

        IF done THEN

            LEAVE read_loop;

        END IF;

        -- Insertar el nombre del luchador en la tabla temporal

        INSERT INTO TempLuchadores (Luchador) VALUES (nombre_luchador);

    END LOOP;



    CLOSE cur;



    -- Seleccionar todos los registros de la tabla temporal

    SELECT * FROM TempLuchadores;



    -- Eliminar la tabla temporal

    DROP TEMPORARY TABLE TempLuchadores;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarDetallesLuchador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarDetallesLuchador`(IN luchador_id INT)
BEGIN

    DECLARE edad_luchador INT;

    DECLARE nombre_luchador VARCHAR(200);

    

    SELECT CalcularEdad(FechaNacimiento) INTO edad_luchador FROM Luchador WHERE idLuchador = luchador_id;

    SELECT NombreCompleto(Nombre, Apellido) INTO nombre_luchador FROM Luchador WHERE idLuchador = luchador_id;

    

    SELECT CONCAT('El luchador ', nombre_luchador, ' tiene ', edad_luchador, ' años.') AS Detalles;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerGanadorCombate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerGanadorCombate`(IN combate_id INT, OUT ganador VARCHAR(100))
BEGIN

    SELECT Ganador INTO ganador FROM Ronda WHERE idCombate = combate_id LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `detalles_combates`
--

/*!50001 DROP VIEW IF EXISTS `detalles_combates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detalles_combates` AS select `c`.`idCombate` AS `idCombate`,`c`.`Fecha/Hora` AS `Fecha/Hora`,`l1`.`Nombre` AS `Luchador1`,`l2`.`Nombre` AS `Luchador2`,case when `p`.`Ganador` = `l1`.`idLuchador` then `l1`.`Nombre` else `l2`.`Nombre` end AS `Ganador`,`c`.`Resultado` AS `Resultado`,`c`.`MetodoFinalizacion` AS `MetodoFinalizacion`,`c`.`Duracion` AS `Duracion` from (((`participacion` `p` join `combate` `c` on(`p`.`idCombate` = `c`.`idCombate`)) join `luchador` `l1` on(`p`.`idLuchador` = `l1`.`idLuchador`)) join `luchador` `l2` on(`p`.`idLuchador` <> `l2`.`idLuchador` and `p`.`idCombate` = (select `participacion`.`idCombate` from `participacion` where `participacion`.`idCombate` = `p`.`idCombate` limit 1))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `detalles_combates_division`
--

/*!50001 DROP VIEW IF EXISTS `detalles_combates_division`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detalles_combates_division` AS select `c`.`idCombate` AS `idCombate`,`c`.`Fecha/Hora` AS `Fecha/Hora`,`l1`.`Nombre` AS `Luchador1`,`l2`.`Nombre` AS `Luchador2`,`d`.`NombreDivision` AS `DivisionLuchador1`,`d2`.`NombreDivision` AS `DivisionLuchador2`,`c`.`Resultado` AS `Resultado`,`c`.`MetodoFinalizacion` AS `MetodoFinalizacion`,`c`.`Duracion` AS `Duracion` from (((((`participacion` `p` join `combate` `c` on(`p`.`idCombate` = `c`.`idCombate`)) join `luchador` `l1` on(`p`.`idLuchador` = `l1`.`idLuchador`)) join `luchador` `l2` on(`p`.`idLuchador` <> `l2`.`idLuchador` and `p`.`idCombate` = (select `participacion`.`idCombate` from `participacion` where `participacion`.`idCombate` = `p`.`idCombate` limit 1))) join `division` `d` on(`l1`.`Division_idDivision` = `d`.`idDivision`)) join `division` `d2` on(`l2`.`Division_idDivision` = `d2`.`idDivision`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `detalles_combates_resultado`
--

/*!50001 DROP VIEW IF EXISTS `detalles_combates_resultado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detalles_combates_resultado` AS select `c`.`idCombate` AS `idCombate`,`c`.`Fecha/Hora` AS `Fecha/Hora`,`l1`.`Nombre` AS `Luchador1`,`l2`.`Nombre` AS `Luchador2`,case `c`.`Resultado` when 1 then 'Victoria de ' or `l1`.`Nombre` <> 0 when 2 then 'Victoria de ' or `l2`.`Nombre` <> 0 else 'Empate' end AS `Resultado`,`c`.`MetodoFinalizacion` AS `MetodoFinalizacion`,`c`.`Duracion` AS `Duracion` from (((`participacion` `p` join `combate` `c` on(`p`.`idCombate` = `c`.`idCombate`)) join `luchador` `l1` on(`p`.`idLuchador` = `l1`.`idLuchador`)) join `luchador` `l2` on(`p`.`idLuchador` <> `l2`.`idLuchador` and `p`.`idCombate` = (select `participacion`.`idCombate` from `participacion` where `participacion`.`idCombate` = `p`.`idCombate` limit 1))) */;
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

-- Dump completed on 2024-06-19 17:29:18
