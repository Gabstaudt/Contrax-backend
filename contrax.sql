-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: contrax
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `assinatura`
--

DROP TABLE IF EXISTS `assinatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assinatura` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `contrato_id` int DEFAULT NULL,
  `data_assinatura` timestamp NULL DEFAULT NULL,
  `assinatura_digital` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assinatura`
--

LOCK TABLES `assinatura` WRITE;
/*!40000 ALTER TABLE `assinatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `assinatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assinaturas`
--

DROP TABLE IF EXISTS `assinaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assinaturas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_assinatura` datetime DEFAULT NULL,
  `assinatura_digital` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ContratoId` int DEFAULT NULL,
  `UsuarioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ContratoId` (`ContratoId`),
  KEY `UsuarioId` (`UsuarioId`),
  CONSTRAINT `assinaturas_ibfk_100` FOREIGN KEY (`UsuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `assinaturas_ibfk_99` FOREIGN KEY (`ContratoId`) REFERENCES `contratos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assinaturas`
--

LOCK TABLES `assinaturas` WRITE;
/*!40000 ALTER TABLE `assinaturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `assinaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clausula`
--

DROP TABLE IF EXISTS `clausula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clausula` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `conteudo` text,
  `tipo` varchar(100) DEFAULT NULL,
  `contrato_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clausula`
--

LOCK TABLES `clausula` WRITE;
/*!40000 ALTER TABLE `clausula` DISABLE KEYS */;
/*!40000 ALTER TABLE `clausula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clausulas`
--

DROP TABLE IF EXISTS `clausulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clausulas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conteudo` text,
  `tipo` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ContratoId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ContratoId` (`ContratoId`),
  CONSTRAINT `clausulas_ibfk_1` FOREIGN KEY (`ContratoId`) REFERENCES `contratos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clausulas`
--

LOCK TABLES `clausulas` WRITE;
/*!40000 ALTER TABLE `clausulas` DISABLE KEYS */;
/*!40000 ALTER TABLE `clausulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descricao` text,
  `data_upload` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_vencimento` date DEFAULT NULL,
  `assinatura_status` varchar(20) DEFAULT NULL,
  `arquivo_path` text,
  `empresa_id` int DEFAULT NULL,
  `criado_por_id` int DEFAULT NULL,
  `criado_em` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `contrato_chk_1` CHECK ((`assinatura_status` in (_utf8mb4'pendente',_utf8mb4'assinado',_utf8mb4'expirado')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato_partes`
--

DROP TABLE IF EXISTS `contrato_partes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato_partes` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `contratoId` int NOT NULL,
  `usuarioId` int NOT NULL,
  PRIMARY KEY (`contratoId`,`usuarioId`),
  KEY `usuarioId` (`usuarioId`),
  CONSTRAINT `contrato_partes_ibfk_1` FOREIGN KEY (`contratoId`) REFERENCES `contratos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contrato_partes_ibfk_2` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato_partes`
--

LOCK TABLES `contrato_partes` WRITE;
/*!40000 ALTER TABLE `contrato_partes` DISABLE KEYS */;
/*!40000 ALTER TABLE `contrato_partes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratopasta`
--

DROP TABLE IF EXISTS `contratopasta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratopasta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contrato_id` int DEFAULT NULL,
  `pasta_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratopasta`
--

LOCK TABLES `contratopasta` WRITE;
/*!40000 ALTER TABLE `contratopasta` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratopasta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_vencimento` datetime DEFAULT NULL,
  `arquivo_path` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `nome` varchar(255) NOT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'ativo',
  `EmpresaId` int DEFAULT NULL,
  `criadoPorId` int DEFAULT NULL,
  `pastaId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EmpresaId` (`EmpresaId`),
  KEY `criadoPorId` (`criadoPorId`),
  KEY `pastaId` (`pastaId`),
  CONSTRAINT `contratos_ibfk_71` FOREIGN KEY (`EmpresaId`) REFERENCES `empresas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `contratos_ibfk_72` FOREIGN KEY (`criadoPorId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `contratos_ibfk_73` FOREIGN KEY (`pastaId`) REFERENCES `pastas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos`
--

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;
INSERT INTO `contratos` VALUES (1,'2025-10-13 00:00:00','src\\uploads\\1747978073914-DAS-PGMEI-58803589000146-AC2025.pdf','2025-05-23 05:27:53','2025-05-23 05:27:53','',NULL,NULL,'ativo',NULL,NULL,7),(3,'2025-10-13 00:00:00','src\\uploads\\1747979151313-historico_20240028255_(1).pdf','2025-05-23 05:45:51','2025-05-23 05:45:51','gabriella teste','2025-05-23 00:00:00',40000.00,'ativo',NULL,NULL,7),(4,'2025-06-10 00:00:00','src\\uploads\\1747979241129-historico_20240028255_(1).pdf','2025-05-23 05:47:21','2025-05-23 05:47:21','gabriella teste contrato','2025-05-23 00:00:00',40000.00,'ativo',NULL,NULL,7),(5,'2025-05-21 00:00:00','src\\uploads\\1748001514985-historico_20240028255_(1).pdf','2025-05-23 11:58:35','2025-05-23 11:58:35','teste de contrato ','2025-05-23 00:00:00',45200.00,'ativo',NULL,6,7),(6,'2025-05-25 00:00:00','src\\uploads\\1748005311505-historico_20240028255_(1).pdf','2025-05-23 13:01:51','2025-05-23 13:01:51','teste a vencer','2025-05-23 00:00:00',50000.00,'ativo',NULL,6,NULL),(7,'2025-05-28 00:00:00','src\\uploads\\1748011151585-historico_20240028255_(1).pdf','2025-05-23 14:39:11','2025-05-23 14:39:11','teste visu','2025-05-23 00:00:00',50000.00,'ativo',NULL,6,NULL),(8,'2025-10-13 00:00:00','src\\uploads\\1748013041403-historico_20240028255_(1).pdf','2025-05-23 15:10:41','2025-05-23 15:10:41','bibi','2025-05-23 00:00:00',405000.00,'ativo',NULL,6,NULL),(9,'2025-05-30 00:00:00','src\\uploads\\1748311892384-DAS-PGMEI-58803589000146-AC2025_(1).pdf','2025-05-27 02:11:32','2025-05-27 02:11:32','testando','2025-05-27 00:00:00',200.00,'ativo',NULL,6,NULL),(10,'2025-05-29 00:00:00','src\\uploads\\1748314038639-DAS-PGMEI-58803589000146-AC2025_(1).pdf','2025-05-27 02:47:18','2025-05-27 02:47:18','gabriella testando','2025-05-27 00:00:00',200.00,'ativo',NULL,6,NULL),(11,'2025-05-29 00:00:00','src\\uploads\\1748314321029-DAS-PGMEI-58803589000146-AC2025_(1).pdf','2025-05-27 02:52:01','2025-05-27 02:52:01','Gabriella','2025-05-27 00:00:00',200.00,'ativo',NULL,6,NULL),(12,'2025-05-30 00:00:00','src\\uploads\\1748317650351-DAS-PGMEI-58803589000146-AC2025_(1).pdf','2025-05-27 03:47:30','2025-05-27 03:47:30','contrato x','2025-05-27 00:00:00',500.00,'ativo',NULL,6,NULL),(13,'2025-05-15 00:00:00','src\\uploads\\1748317690779-DAS-PGMEI-58803589000146-AC2025_(1).pdf','2025-05-27 03:48:10','2025-05-27 03:48:10','contraato 5','2025-05-27 00:00:00',500.00,'ativo',NULL,6,NULL);
/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos_pastas`
--

DROP TABLE IF EXISTS `contratos_pastas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratos_pastas` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ContratoId` int NOT NULL,
  `PastaId` int NOT NULL,
  PRIMARY KEY (`ContratoId`,`PastaId`),
  KEY `PastaId` (`PastaId`),
  CONSTRAINT `contratos_pastas_ibfk_1` FOREIGN KEY (`ContratoId`) REFERENCES `contratos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contratos_pastas_ibfk_2` FOREIGN KEY (`PastaId`) REFERENCES `pastas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos_pastas`
--

LOCK TABLES `contratos_pastas` WRITE;
/*!40000 ALTER TABLE `contratos_pastas` DISABLE KEYS */;
INSERT INTO `contratos_pastas` VALUES ('2025-05-27 03:47:30','2025-05-27 03:47:30',12,7),('2025-05-27 03:48:10','2025-05-27 03:48:10',13,2);
/*!40000 ALTER TABLE `contratos_pastas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `email_admin_responsavel` varchar(255) DEFAULT NULL,
  `criado_em` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cnpj` varchar(255) NOT NULL,
  `email_admin_responsavel` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnpj` (`cnpj`),
  UNIQUE KEY `cnpj_2` (`cnpj`),
  UNIQUE KEY `cnpj_3` (`cnpj`),
  UNIQUE KEY `cnpj_4` (`cnpj`),
  UNIQUE KEY `cnpj_5` (`cnpj`),
  UNIQUE KEY `cnpj_6` (`cnpj`),
  UNIQUE KEY `cnpj_7` (`cnpj`),
  UNIQUE KEY `cnpj_8` (`cnpj`),
  UNIQUE KEY `cnpj_9` (`cnpj`),
  UNIQUE KEY `cnpj_10` (`cnpj`),
  UNIQUE KEY `cnpj_11` (`cnpj`),
  UNIQUE KEY `cnpj_12` (`cnpj`),
  UNIQUE KEY `cnpj_13` (`cnpj`),
  UNIQUE KEY `cnpj_14` (`cnpj`),
  UNIQUE KEY `cnpj_15` (`cnpj`),
  UNIQUE KEY `cnpj_16` (`cnpj`),
  UNIQUE KEY `cnpj_17` (`cnpj`),
  UNIQUE KEY `cnpj_18` (`cnpj`),
  UNIQUE KEY `cnpj_19` (`cnpj`),
  UNIQUE KEY `cnpj_20` (`cnpj`),
  UNIQUE KEY `cnpj_21` (`cnpj`),
  UNIQUE KEY `cnpj_22` (`cnpj`),
  UNIQUE KEY `cnpj_23` (`cnpj`),
  UNIQUE KEY `cnpj_24` (`cnpj`),
  UNIQUE KEY `cnpj_25` (`cnpj`),
  UNIQUE KEY `cnpj_26` (`cnpj`),
  UNIQUE KEY `cnpj_27` (`cnpj`),
  UNIQUE KEY `cnpj_28` (`cnpj`),
  UNIQUE KEY `cnpj_29` (`cnpj`),
  UNIQUE KEY `cnpj_30` (`cnpj`),
  UNIQUE KEY `cnpj_31` (`cnpj`),
  UNIQUE KEY `cnpj_32` (`cnpj`),
  UNIQUE KEY `cnpj_33` (`cnpj`),
  UNIQUE KEY `cnpj_34` (`cnpj`),
  UNIQUE KEY `cnpj_35` (`cnpj`),
  UNIQUE KEY `cnpj_36` (`cnpj`),
  UNIQUE KEY `cnpj_37` (`cnpj`),
  UNIQUE KEY `cnpj_38` (`cnpj`),
  UNIQUE KEY `cnpj_39` (`cnpj`),
  UNIQUE KEY `cnpj_40` (`cnpj`),
  UNIQUE KEY `cnpj_41` (`cnpj`),
  UNIQUE KEY `cnpj_42` (`cnpj`),
  UNIQUE KEY `cnpj_43` (`cnpj`),
  UNIQUE KEY `cnpj_44` (`cnpj`),
  UNIQUE KEY `cnpj_45` (`cnpj`),
  UNIQUE KEY `cnpj_46` (`cnpj`),
  UNIQUE KEY `cnpj_47` (`cnpj`),
  UNIQUE KEY `cnpj_48` (`cnpj`),
  UNIQUE KEY `cnpj_49` (`cnpj`),
  UNIQUE KEY `cnpj_50` (`cnpj`),
  UNIQUE KEY `cnpj_51` (`cnpj`),
  UNIQUE KEY `cnpj_52` (`cnpj`),
  UNIQUE KEY `cnpj_53` (`cnpj`),
  UNIQUE KEY `cnpj_54` (`cnpj`),
  UNIQUE KEY `cnpj_55` (`cnpj`),
  UNIQUE KEY `cnpj_56` (`cnpj`),
  UNIQUE KEY `cnpj_57` (`cnpj`),
  UNIQUE KEY `cnpj_58` (`cnpj`),
  UNIQUE KEY `cnpj_59` (`cnpj`),
  UNIQUE KEY `cnpj_60` (`cnpj`),
  UNIQUE KEY `cnpj_61` (`cnpj`),
  UNIQUE KEY `cnpj_62` (`cnpj`),
  UNIQUE KEY `cnpj_63` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'Empresa Modelo LTDA','12345678000199','admin@empresa.com','2025-05-23 01:51:57','2025-05-23 01:51:57');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integracaoassinatura`
--

DROP TABLE IF EXISTS `integracaoassinatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integracaoassinatura` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contrato_id` int DEFAULT NULL,
  `plataforma` varchar(100) DEFAULT NULL,
  `id_externo` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integracaoassinatura`
--

LOCK TABLES `integracaoassinatura` WRITE;
/*!40000 ALTER TABLE `integracaoassinatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `integracaoassinatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integracoes_assinatura`
--

DROP TABLE IF EXISTS `integracoes_assinatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integracoes_assinatura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plataforma` varchar(255) DEFAULT NULL,
  `id_externo` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ContratoId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ContratoId` (`ContratoId`),
  CONSTRAINT `integracoes_assinatura_ibfk_1` FOREIGN KEY (`ContratoId`) REFERENCES `contratos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integracoes_assinatura`
--

LOCK TABLES `integracoes_assinatura` WRITE;
/*!40000 ALTER TABLE `integracoes_assinatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `integracoes_assinatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacao`
--

DROP TABLE IF EXISTS `notificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacao` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mensagem` text,
  `tipo` varchar(50) DEFAULT NULL,
  `visualizado` tinyint(1) DEFAULT '0',
  `usuario_id` int DEFAULT NULL,
  `contrato_id` int DEFAULT NULL,
  `data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacao`
--

LOCK TABLES `notificacao` WRITE;
/*!40000 ALTER TABLE `notificacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacoes`
--

DROP TABLE IF EXISTS `notificacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mensagem` text,
  `tipo` varchar(255) DEFAULT NULL,
  `visualizado` tinyint(1) DEFAULT '0',
  `data` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UsuarioId` int DEFAULT NULL,
  `ContratoId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UsuarioId` (`UsuarioId`),
  KEY `ContratoId` (`ContratoId`),
  CONSTRAINT `notificacoes_ibfk_97` FOREIGN KEY (`UsuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `notificacoes_ibfk_98` FOREIGN KEY (`ContratoId`) REFERENCES `contratos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacoes`
--

LOCK TABLES `notificacoes` WRITE;
/*!40000 ALTER TABLE `notificacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasta`
--

DROP TABLE IF EXISTS `pasta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `empresa_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasta`
--

LOCK TABLES `pasta` WRITE;
/*!40000 ALTER TABLE `pasta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pastas`
--

DROP TABLE IF EXISTS `pastas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pastas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pastas`
--

LOCK TABLES `pastas` WRITE;
/*!40000 ALTER TABLE `pastas` DISABLE KEYS */;
INSERT INTO `pastas` VALUES (2,'2025-05-27 00:59:31','2025-05-27 00:59:31','pasta 1','descrição1'),(3,'2025-05-27 01:45:49','2025-05-27 01:45:49','pasa 3','djsd'),(5,'2025-05-27 02:34:20','2025-05-27 02:34:20','fdf','sdfsd'),(6,'2025-05-27 02:47:18','2025-05-27 02:47:18','pasta 55','paa um teste novo'),(7,'2025-05-27 02:52:00','2025-05-27 02:52:00','pasta teste 10','Pasta de novo teste do modal');
/*!40000 ALTER TABLE `pastas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `empresa_id` int DEFAULT NULL,
  `criado_em` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `usuario_chk_1` CHECK ((`tipo` in (_utf8mb4'admin',_utf8mb4'advogado',_utf8mb4'colaborador')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `EmpresaId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `email_2` (`email`),
  UNIQUE KEY `email_3` (`email`),
  UNIQUE KEY `email_4` (`email`),
  UNIQUE KEY `email_5` (`email`),
  UNIQUE KEY `email_6` (`email`),
  UNIQUE KEY `email_7` (`email`),
  UNIQUE KEY `email_8` (`email`),
  UNIQUE KEY `email_9` (`email`),
  UNIQUE KEY `email_10` (`email`),
  UNIQUE KEY `email_11` (`email`),
  UNIQUE KEY `email_12` (`email`),
  UNIQUE KEY `email_13` (`email`),
  UNIQUE KEY `email_14` (`email`),
  UNIQUE KEY `email_15` (`email`),
  UNIQUE KEY `email_16` (`email`),
  UNIQUE KEY `email_17` (`email`),
  UNIQUE KEY `email_18` (`email`),
  UNIQUE KEY `email_19` (`email`),
  UNIQUE KEY `email_20` (`email`),
  UNIQUE KEY `email_21` (`email`),
  UNIQUE KEY `email_22` (`email`),
  UNIQUE KEY `email_23` (`email`),
  UNIQUE KEY `email_24` (`email`),
  UNIQUE KEY `email_25` (`email`),
  UNIQUE KEY `email_26` (`email`),
  UNIQUE KEY `email_27` (`email`),
  UNIQUE KEY `email_28` (`email`),
  UNIQUE KEY `email_29` (`email`),
  UNIQUE KEY `email_30` (`email`),
  UNIQUE KEY `email_31` (`email`),
  UNIQUE KEY `email_32` (`email`),
  UNIQUE KEY `email_33` (`email`),
  UNIQUE KEY `email_34` (`email`),
  UNIQUE KEY `email_35` (`email`),
  UNIQUE KEY `email_36` (`email`),
  UNIQUE KEY `email_37` (`email`),
  UNIQUE KEY `email_38` (`email`),
  UNIQUE KEY `email_39` (`email`),
  UNIQUE KEY `email_40` (`email`),
  UNIQUE KEY `email_41` (`email`),
  UNIQUE KEY `email_42` (`email`),
  UNIQUE KEY `email_43` (`email`),
  UNIQUE KEY `email_44` (`email`),
  UNIQUE KEY `email_45` (`email`),
  UNIQUE KEY `email_46` (`email`),
  UNIQUE KEY `email_47` (`email`),
  UNIQUE KEY `email_48` (`email`),
  UNIQUE KEY `email_49` (`email`),
  UNIQUE KEY `email_50` (`email`),
  UNIQUE KEY `email_51` (`email`),
  UNIQUE KEY `email_52` (`email`),
  UNIQUE KEY `email_53` (`email`),
  UNIQUE KEY `email_54` (`email`),
  KEY `EmpresaId` (`EmpresaId`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`EmpresaId`) REFERENCES `empresas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (6,'Gabriella ad','gabii@contrax.com','$2b$10$wY/OXMX49B0TRAi5FQykuelvkaZQFtDUaIjw3Fm52rxncW9jHJ3Tq','admin','2025-05-23 01:52:01','2025-05-23 01:52:01',NULL),(7,'usuario teste','teste@contrax.com','$2b$10$WKUCrETrwJPS0EjCW34Rx.AkwJQGBzszWyR1.4oo6CsF/z12SdEWe','admin','2025-05-23 08:55:26','2025-05-23 08:55:26',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-27  1:21:38
