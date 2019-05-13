-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: Proyecto_Ecommerce3
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `usuarios_producto_idx` (`uuid`),
  KEY `localizacion_producto_idx` (`idlocalizacion`),
  CONSTRAINT `localizacion_producto` FOREIGN KEY (`idlocalizacion`) REFERENCES `localizacion` (`idlocalizacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuarios_producto` FOREIGN KEY (`uuid`) REFERENCES `users` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (91,'Calabacines',4,'https://static.wixstatic.com/media/0f7c29_863134f617054b878eaa1c2af0c5a6ab~mv2.jpg/v1/fill/w_650,h_433,al_c,q_90/file.jpg','Se vende por unidad','c4b94819-001c-4b13-a0c4-35b0f4142e5f',2,NULL),(92,'Melón',10,'https://www.agronewscastillayleon.com/sites/default/files/styles/node-detail/public/field/image/propiedades-del-melon.jpg?itok=iu_pIlna','Se venden por unidad','c4b94819-001c-4b13-a0c4-35b0f4142e5f',2,NULL),(96,'Tomate',4,'https://ideasdebabel.files.wordpress.com/2007/10/tomates.jpg','Se vende por rama','fff9bbc9-08c1-42c2-8f09-af7723a82713',3,NULL),(97,'Naranja',3,'http://files.dantor.webnode.es/system_preview_detail_200000248-66621675bf-public/Naranjas.jpg','Se venden por kilo','fff9bbc9-08c1-42c2-8f09-af7723a82713',3,NULL),(98,'Lechuga',6,'http://lechugashermanosmarin.es/images/lechugas/lechuga-lollo_bionda.jpg','Se vende por unidad','c4b94819-001c-4b13-a0c4-35b0f4142e5f',2,NULL),(99,'Pimientos',5,'https://www.tuberculos.org/zanahoria/','Se venden por kilo','c4b94819-001c-4b13-a0c4-35b0f4142e5f',2,NULL),(104,'sadasd',85,'asdasd','asdasdasdas','c4b94819-001c-4b13-a0c4-35b0f4142e5f',2,'https://res.cloudinary.com/holayadios/raw/upload/v1557535729/un4x2ir7dwk96zs4lagf.png'),(105,'sadasd',85,'asdasd','asdasdasdas','c4b94819-001c-4b13-a0c4-35b0f4142e5f',2,'https://res.cloudinary.com/holayadios/raw/upload/v1557536510/gl8ctxnaxqgflrmw9mqt.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'c4b94819-001c-4b13-a0c4-35b0f4142e5f','anxotest01@yopmail.com','$2b$10$5VYGb6HTwBFzhaQv.ZqKe.Kb1PzERpNZaoobkv4.gs9ULtXJ0dOxy','2019-04-27 15:43:29','2019-04-27 15:42:19'),(7,'fff9bbc9-08c1-42c2-8f09-af7723a82713','anxotest02@yopmail.com','$2b$10$6DWMFRE2g1bk20vI/rC93.cuJRjgV6BevgFYP/GL1xqgdS5V2mX2S','2019-04-27 15:51:40','2019-04-27 15:51:21'),(8,'4116be4a-a5f3-4b41-9b61-46737802001a','anxotest03@yopmail.com','$2b$10$PpRXH4X2w8LdcVTNaAVn/O5rKwxgnm3PxzdYQAXsUWlpLjj3aHKIa','2019-05-09 17:51:51','2019-05-09 17:51:34'),(9,'82623fa2-cc40-4f55-8702-985d2b2e9e30','anxotest04@yopmail.com','$2b$10$UTyK8OoB7aEUVd7VgLY/b.d4KZ87O8Bid9k0HwBq/Z1lob8J4SPPK','2019-05-09 18:00:58','2019-05-09 18:00:36');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_activation`
--

LOCK TABLES `users_activation` WRITE;
/*!40000 ALTER TABLE `users_activation` DISABLE KEYS */;
INSERT INTO `users_activation` VALUES (1,'c4b94819-001c-4b13-a0c4-35b0f4142e5f','4e80bdb7-5684-4c02-8299-31fabb6c95fb','2019-04-27 15:42:19','2019-04-27 15:43:29'),(2,'fff9bbc9-08c1-42c2-8f09-af7723a82713','fef95dbf-1e81-4769-bfbb-204f311300d9','2019-04-27 15:51:21','2019-04-27 15:51:40'),(3,'4116be4a-a5f3-4b41-9b61-46737802001a','8682ea88-d4f1-4267-a23a-11b912e1469b','2019-05-09 17:51:34','2019-05-09 17:51:51'),(4,'82623fa2-cc40-4f55-8702-985d2b2e9e30','d652b044-a347-485f-ba14-9b8b910a5044','2019-05-09 18:00:36','2019-05-09 18:00:58');
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

-- Dump completed on 2019-05-13  9:44:21
