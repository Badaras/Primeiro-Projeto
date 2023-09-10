CREATE DATABASE  IF NOT EXISTS `primeiroprojetobd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `primeiroprojetobd`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: primeiroprojetobd
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `estado_codigo` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `cidade_ibfk_1` (`estado_codigo`),
  CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`estado_codigo`) REFERENCES `estado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `dataCadastro` date NOT NULL,
  `aprovado` tinyint(1) NOT NULL,
  `pessoa_codigo` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `pessoa_codigo` (`pessoa_codigo`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`pessoa_codigo`) REFERENCES `pessoa` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `sigla` varchar(2) NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'CE','Ceará'),(2,'SP','São Paulo');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fabricante` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabricante`
--

LOCK TABLES `fabricante` WRITE;
/*!40000 ALTER TABLE `fabricante` DISABLE KEYS */;
/*!40000 ALTER TABLE `fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `carteiraTrabalho` varchar(50) NOT NULL,
  `dataAdmissao` date NOT NULL,
  `pessoa_codigo` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `pessoa_codigo` (`pessoa_codigo`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`pessoa_codigo`) REFERENCES `pessoa` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemvenda`
--

DROP TABLE IF EXISTS `itemvenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemvenda` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `quantidade` smallint NOT NULL,
  `valorParcial` decimal(7,2) NOT NULL,
  `produto_codigo` int NOT NULL,
  `funcionario_codigo` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `produto_codigo` (`produto_codigo`),
  KEY `funcionario_codigo` (`funcionario_codigo`),
  CONSTRAINT `itemvenda_ibfk_1` FOREIGN KEY (`produto_codigo`) REFERENCES `produto` (`codigo`),
  CONSTRAINT `itemvenda_ibfk_2` FOREIGN KEY (`funcionario_codigo`) REFERENCES `funcionario` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemvenda`
--

LOCK TABLES `itemvenda` WRITE;
/*!40000 ALTER TABLE `itemvenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemvenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `rg` varchar(255) NOT NULL,
  `numero` smallint DEFAULT NULL,
  `bairro` varchar(255) NOT NULL,
  `cep` varchar(255) NOT NULL,
  `complemento` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `celular` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cidade_codigo` int NOT NULL,
  `rua` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `cidade_codigo` (`cidade_codigo`),
  CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`cidade_codigo`) REFERENCES `cidade` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `quantidade` smallint NOT NULL,
  `fabricante_codigo` int NOT NULL,
  `preco` decimal(6,2) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fabricante_id` (`fabricante_codigo`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`fabricante_codigo`) REFERENCES `fabricante` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `senha` varchar(50) NOT NULL,
  `tipo` char(1) NOT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `pessoa_codigo` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `pessoa_codigo` (`pessoa_codigo`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`pessoa_codigo`) REFERENCES `pessoa` (`codigo`)
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
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `horarioVenda` date NOT NULL,
  `precoTotal` decimal(7,2) NOT NULL,
  `cliente_codigo` int DEFAULT NULL,
  `funcionario_codigo` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `funcionario_codigo` (`funcionario_codigo`),
  KEY `venda_ibfk_1` (`cliente_codigo`),
  CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`cliente_codigo`) REFERENCES `cliente` (`codigo`),
  CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`funcionario_codigo`) REFERENCES `funcionario` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'primeiroprojetobd'
--

--
-- Dumping routines for database 'primeiroprojetobd'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-09 21:08:47
