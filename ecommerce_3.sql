-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: Proyecto_Ecommerce3
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `cesta`
--

DROP TABLE IF EXISTS `cesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cesta` (
  `idcesta` int(11) NOT NULL AUTO_INCREMENT,
  `precio` decimal(2,0) DEFAULT NULL,
  `suma` decimal(2,0) DEFAULT NULL,
  `idproducto2` int(11) DEFAULT NULL,
  `uui2` varchar(255) DEFAULT 'null',
  PRIMARY KEY (`idcesta`),
  KEY `uno_idx` (`uui2`),
  KEY `dos_idx` (`idproducto2`),
  CONSTRAINT `dos` FOREIGN KEY (`idproducto2`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `uno` FOREIGN KEY (`uui2`) REFERENCES `users` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cesta`
--

LOCK TABLES `cesta` WRITE;
/*!40000 ALTER TABLE `cesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizacion`
--

DROP TABLE IF EXISTS `localizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localizacion` (
  `idlocalizacion` int(11) NOT NULL AUTO_INCREMENT,
  `ayuntamiento` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idlocalizacion`),
  KEY `usuarios_localizacion_idx` (`uuid`),
  CONSTRAINT `usuarios_localizacion` FOREIGN KEY (`uuid`) REFERENCES `users` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizacion`
--

LOCK TABLES `localizacion` WRITE;
/*!40000 ALTER TABLE `localizacion` DISABLE KEYS */;
INSERT INTO `localizacion` VALUES (2,'FERROL',NULL),(3,'CORUNA',NULL);
/*!40000 ALTER TABLE `localizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `idpedido` int(11) NOT NULL AUTO_INCREMENT,
  `suma` decimal(2,0) DEFAULT NULL,
  `idcesta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `producto` varchar(255) DEFAULT NULL,
  `precio` decimal(2,0) DEFAULT NULL,
  `descripcioncorta` varchar(255) DEFAULT NULL,
  `descripcioncompleta` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `idlocalizacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `usuarios_producto_idx` (`uuid`),
  KEY `localizacion_producto_idx` (`idlocalizacion`),
  CONSTRAINT `localizacion_producto` FOREIGN KEY (`idlocalizacion`) REFERENCES `localizacion` (`idlocalizacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuarios_producto` FOREIGN KEY (`uuid`) REFERENCES `users` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (39,'Patatas',20,'muy bien','Miel de eucalipto en montes de la Comarca','c4b94819-001c-4b13-a0c4-35b0f4142e5f',2),(41,'Patatas',2,'muy bien','Miel de eucalipto en montes de la Comarca','c4b94819-001c-4b13-a0c4-35b0f4142e5f',3);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idusuarios` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activatedat` datetime DEFAULT NULL,
  `createdat` datetime NOT NULL,
  PRIMARY KEY (`idusuarios`),
  KEY `cesta_usuarios_idx` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'c4b94819-001c-4b13-a0c4-35b0f4142e5f','anxotest01@yopmail.com','$2b$10$5VYGb6HTwBFzhaQv.ZqKe.Kb1PzERpNZaoobkv4.gs9ULtXJ0dOxy','2019-04-27 15:43:29','2019-04-27 15:42:19'),(7,'fff9bbc9-08c1-42c2-8f09-af7723a82713','anxotest02@yopmail.com','$2b$10$6DWMFRE2g1bk20vI/rC93.cuJRjgV6BevgFYP/GL1xqgdS5V2mX2S','2019-04-27 15:51:40','2019-04-27 15:51:21');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_activation`
--

DROP TABLE IF EXISTS `users_activation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_activation` (
  `id_activacion` int(11) NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(255) NOT NULL DEFAULT 'DEFAULT',
  `verification_code` varchar(45) NOT NULL,
  `createdat` datetime NOT NULL,
  `verificatedat` datetime DEFAULT NULL,
  PRIMARY KEY (`id_activacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_activation`
--

LOCK TABLES `users_activation` WRITE;
/*!40000 ALTER TABLE `users_activation` DISABLE KEYS */;
INSERT INTO `users_activation` VALUES (1,'c4b94819-001c-4b13-a0c4-35b0f4142e5f','4e80bdb7-5684-4c02-8299-31fabb6c95fb','2019-04-27 15:42:19','2019-04-27 15:43:29'),(2,'fff9bbc9-08c1-42c2-8f09-af7723a82713','fef95dbf-1e81-4769-bfbb-204f311300d9','2019-04-27 15:51:21','2019-04-27 15:51:40');
/*!40000 ALTER TABLE `users_activation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Proyecto_Ecommerce3'
--

--
-- Dumping routines for database 'Proyecto_Ecommerce3'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-01 17:08:01
