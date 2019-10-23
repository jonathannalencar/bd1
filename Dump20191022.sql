CREATE DATABASE  IF NOT EXISTS `agencia` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `agencia`;
-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: agencia
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `agencia_viagem`
--

DROP TABLE IF EXISTS `agencia_viagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencia_viagem` (
  `ID_AGENC` int(11) NOT NULL AUTO_INCREMENT,
  `NOME_AGENC` varchar(50) NOT NULL,
  `CNPJ` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_AGENC`),
  UNIQUE KEY `CNPJ` (`CNPJ`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencia_viagem`
--

LOCK TABLES `agencia_viagem` WRITE;
/*!40000 ALTER TABLE `agencia_viagem` DISABLE KEYS */;
INSERT INTO `agencia_viagem` VALUES (1,'ViagemEmpresarial','15.014.547/022196');
/*!40000 ALTER TABLE `agencia_viagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `IDDEP` int(11) NOT NULL AUTO_INCREMENT,
  `NOMEDEP` varchar(50) NOT NULL,
  `ORCAMENTO` int(11) NOT NULL,
  `CENTRO_CUSTO` int(11) NOT NULL,
  PRIMARY KEY (`IDDEP`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'diretoria',15000,1054600),(2,'ti',15000,1054830),(3,'sac',15000,1054800),(4,'sustentabilidade',15000,1054800);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `IDFUNC` int(11) NOT NULL AUTO_INCREMENT,
  `PRONTUARIO` int(11) NOT NULL,
  `NOMEFUNC` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `SENHA` varchar(100) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `ID_DEP` int(11) DEFAULT NULL,
  `CARGO` varchar(30) NOT NULL,
  `PERFIL` varchar(30) DEFAULT NULL,
  `SEXO` varchar(20) NOT NULL,
  PRIMARY KEY (`IDFUNC`),
  UNIQUE KEY `PRONTUARIO` (`PRONTUARIO`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,350534,'christian brandao','christian.lasa@lasa.com.br','#lasa2021','16530244700',2,'ADM','ADMINISTRADOR','Masculino'),(2,155623,'eduarda','eduarda.nunes12@gmail.com','123456','15612529724',1,'diretora','USUARIO','Feminino'),(3,564738,'jonathan neves alencar','jonathannalencar@gmail.com','senha123','04145050467',2,'chefao da porra toda','ADMINSITRADOR','Masculino'),(4,274652,'luis felipe da silva souza','luisp1927@hotmail.com','22304106','27645376654',1,'ESTAGIARIO','USUARIO','Masculino');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicita_aerea`
--

DROP TABLE IF EXISTS `solicita_aerea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicita_aerea` (
  `ID_SOLICITA_AEREA` int(11) NOT NULL AUTO_INCREMENT,
  `DATA_IDA` varchar(50) NOT NULL,
  `DATA_VOLTA` varchar(50) NOT NULL,
  `ORIGEM` varchar(50) NOT NULL,
  `DESTINO` varchar(50) NOT NULL,
  `ID_SOLICITAA_FUNC` int(11) NOT NULL,
  `ID_SOLICITA_VALOR` int(11) NOT NULL,
  PRIMARY KEY (`ID_SOLICITA_AEREA`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicita_aerea`
--

LOCK TABLES `solicita_aerea` WRITE;
/*!40000 ALTER TABLE `solicita_aerea` DISABLE KEYS */;
INSERT INTO `solicita_aerea` VALUES (1,'10/11/2019','15/11/2019','rio de janeiro','salvador',1,3),(2,'10/05/2019','20/05/2019','rio de janeiro','chile',1,6),(3,'10/05/2019','11/05/2019','rio de janeiro','chile',1,16),(4,'18/10/2019','30/10/2019','rio de janeiro','chile',3,16),(5,'10/05/2019','20/05/2019','rio de janeiro','salvador',3,19);
/*!40000 ALTER TABLE `solicita_aerea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicita_hospedagem`
--

DROP TABLE IF EXISTS `solicita_hospedagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicita_hospedagem` (
  `ID_SOLICITA_HOSPEDAGEM` int(11) NOT NULL AUTO_INCREMENT,
  `DATA_ENTRADA` varchar(50) NOT NULL,
  `DATA_SAIDA` varchar(50) NOT NULL,
  `DESTINO_HOTEL` varchar(50) NOT NULL,
  `ID_SOLICITAH_FUNC` int(11) NOT NULL,
  `ID_SOLICITA_VALOR` int(11) NOT NULL,
  PRIMARY KEY (`ID_SOLICITA_HOSPEDAGEM`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicita_hospedagem`
--

LOCK TABLES `solicita_hospedagem` WRITE;
/*!40000 ALTER TABLE `solicita_hospedagem` DISABLE KEYS */;
INSERT INTO `solicita_hospedagem` VALUES (1,'10/10/2019','15/10/2019','rio de janeiro',1,2),(2,'10/05/2019','16/05/2019','ilha grande',1,5),(3,'10/01/1000','10/01/1000','teste',1,8),(4,'10/01/1000','10/01/1000','teste',1,9),(5,'10/01/1000','10/01/1000','teste',1,10),(6,'10/01/1000','10/01/1000','teste',1,11),(7,'10/01/1000','10/01/1000','teste',1,12),(8,'10/01/1000','10/01/1000','teste',1,13),(9,'10/01/1000','10/01/1000','teste',1,14),(10,'10/01/1000','10/01/1000','teste',1,15),(11,'17/10/2019','17/10/2020','rio de janeiro',4,20);
/*!40000 ALTER TABLE `solicita_hospedagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicita_locacao`
--

DROP TABLE IF EXISTS `solicita_locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicita_locacao` (
  `ID_SOLICITA_LOCACAO` int(11) NOT NULL AUTO_INCREMENT,
  `DATA_ENTRADA` varchar(50) NOT NULL,
  `DATA_SAIDA` varchar(50) NOT NULL,
  `CIDADE_RETIRADA` varchar(50) NOT NULL,
  `ID_SOLICITAL_FUNC` int(11) NOT NULL,
  `ID_SOLICITA_VALOR` int(11) NOT NULL,
  PRIMARY KEY (`ID_SOLICITA_LOCACAO`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicita_locacao`
--

LOCK TABLES `solicita_locacao` WRITE;
/*!40000 ALTER TABLE `solicita_locacao` DISABLE KEYS */;
INSERT INTO `solicita_locacao` VALUES (1,'18/10/2019','25/10/2019','rio de janeiro',3,18);
/*!40000 ALTER TABLE `solicita_locacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valor`
--

DROP TABLE IF EXISTS `valor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valor` (
  `ID_VALOR` int(11) NOT NULL AUTO_INCREMENT,
  `VALOR` int(11) NOT NULL,
  `DATA_SOLICITACAO` varchar(50) NOT NULL,
  `NOME_TIPO` varchar(50) NOT NULL,
  `ID_VALOR_FUNC` int(11) NOT NULL,
  `APROVADO` varchar(10) NOT NULL,
  PRIMARY KEY (`ID_VALOR`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valor`
--

LOCK TABLES `valor` WRITE;
/*!40000 ALTER TABLE `valor` DISABLE KEYS */;
INSERT INTO `valor` VALUES (17,560,'17/10/2019 09:38:06','LOCACAO',3,'PENDENTE'),(16,1525,'17/10/2019 09:36:36','AEREO',3,'NAO'),(3,1700,'17/10/2019 01:03:52','AEREO',1,'NAO'),(4,240,'17/10/2019 01:47:04','LOCACAO',1,'NAO'),(5,660,'17/10/2019 01:47:33','HOSPEDAGEM',1,'NAO'),(6,1525,'17/10/2019 01:47:56','AEREO',1,'NAO'),(7,720,'17/10/2019 01:48:31','LOCACAO',1,'NAO'),(8,0,'17/10/2019 01:49:06','HOSPEDAGEM',1,'NAO'),(9,0,'17/10/2019 01:49:09','HOSPEDAGEM',1,'NAO'),(10,0,'17/10/2019 01:49:11','HOSPEDAGEM',1,'NAO'),(11,0,'17/10/2019 01:49:12','HOSPEDAGEM',1,'NAO'),(12,0,'17/10/2019 01:49:14','HOSPEDAGEM',1,'NAO'),(13,0,'17/10/2019 01:49:16','HOSPEDAGEM',1,'NAO'),(14,0,'17/10/2019 01:49:18','HOSPEDAGEM',1,'NAO'),(15,0,'17/10/2019 01:49:20','HOSPEDAGEM',1,'NAO'),(18,560,'17/10/2019 09:39:15','LOCACAO',3,'PENDENTE'),(19,1700,'17/10/2019 09:41:08','AEREO',3,'PENDENTE'),(20,40260,'17/10/2019 10:26:26','HOSPEDAGEM',4,'PENDENTE');
/*!40000 ALTER TABLE `valor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'agencia'
--

--
-- Dumping routines for database 'agencia'
--
/*!50003 DROP PROCEDURE IF EXISTS `ALTERASENHA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ALTERASENHA`(IDFUNC1 INT, SENHAANT VARCHAR(100), SENHANOVA VARCHAR(100))
BEGIN
	IF (SENHAANT IN (SELECT SENHA FROM FUNCIONARIO WHERE IDFUNC = IDFUNC1))
	THEN
        UPDATE FUNCIONARIO SET SENHA = SENHANOVA WHERE IDFUNC = IDFUNC1;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `APROVAR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `APROVAR`(EMAIL1 VARCHAR(50), SENHA1 VARCHAR(100), IDAPROV1 INT, APROV1 ENUM('S','N','P'))
BEGIN
	DECLARE IDFUNC1 INT;
	SET IDFUNC1 = ( 
		SELECT IDFUNC FROM FUNCIONARIO
		WHERE EMAIL = EMAIL1 AND SENHA = SENHA1);
	IF (IDFUNC1 IN (SELECT ID_GERENTE FROM DEPARTAMENTO))
		THEN
			UPDATE APROVACAO SET APROV = APROV1
			WHERE IDAPROV = IDAPROV1;
		ELSE
			SELECT 'VOCE NAO POSSUI ACESSO A ESSA ABA' AS '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GASTOSFUNC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GASTOSFUNC`(EMAIL1 VARCHAR(50), SENHA1 VARCHAR(100))
BEGIN
	DECLARE IDFUNC1 INT;
	SET IDFUNC1 = ( 
		SELECT IDFUNC FROM FUNCIONARIO
		WHERE EMAIL = EMAIL1 AND SENHA = SENHA1);
	IF (IDFUNC1 IN (SELECT ID_GERENTE FROM DEPARTAMENTO))
		THEN
			SELECT IDFUNC, NOMEFUNC, SUM(VALOR) AS 'TOTAL GASTO', EMAIL FROM APROVACAO
			JOIN SOLICITA
			ON ID_SOLIC = IDSOLIC
			JOIN FUNCIONARIO
			ON IDFUNC = ID_FUNC
			JOIN DEPARTAMENTO
			ON ID_DEP = IDDEP
			WHERE ID_GERENTE = IDFUNC1
			GROUP BY IDFUNC, NOMEFUNC;
		ELSE
			SELECT 'VOCE NAO POSSUI ACESSO A ESSA ABA' AS '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `HISTORICO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `HISTORICO`(EMAIL1 VARCHAR(50), SENHA1 VARCHAR(100))
BEGIN
	DECLARE IDFUNC1 INT;
	SET IDFUNC1 = ( 
		SELECT IDFUNC FROM FUNCIONARIO
		WHERE EMAIL = EMAIL1 AND SENHA = SENHA1);
	SELECT A.IDAPROV, A.VALOR, A.JUSTIFICATIVA, A.APROV,S.TIPO, S.ID_FUNC FROM APROVACAO AS A
	INNER JOIN SOLICITA AS S
	ON A.ID_SOLIC = S.IDSOLIC
	WHERE S.ID_FUNC = IDFUNC1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LOGIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LOGIN`(EMAIL1 VARCHAR(50), SENHA1 VARCHAR(100))
BEGIN
	SELECT COUNT(*) FROM FUNCIONARIO
	WHERE EMAIL = EMAIL1 AND SENHA = SENHA1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MEUHISTORICO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MEUHISTORICO`(EMAIL1 VARCHAR(50), SENHA1 VARCHAR(100))
BEGIN
	DECLARE IDFUNC1 INT;
	SET IDFUNC1 = ( 
		SELECT IDFUNC FROM FUNCIONARIO
		WHERE EMAIL = EMAIL1 AND SENHA = SENHA1);
	SELECT IDAPROV, IDSOLIC, VALOR, JUSTIFICATIVA, SOLICITA.TIPO, APROV FROM APROVACAO
	JOIN SOLICITA
	ON IDSOLIC = ID_SOLIC
	WHERE ID_FUNC = IDFUNC1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NOVASOLICITACAO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NOVASOLICITACAO`(EMAIL1 VARCHAR(50), SENHA1 VARCHAR(100), IDAGENCIA1 INT, TIPO1 ENUM('1', '2', '3'), JUSTIFICATIVA1 VARCHAR(140))
BEGIN
	DECLARE IDFUNC1 INT;
	SET IDFUNC1 = ( 
		SELECT IDFUNC FROM FUNCIONARIO
		WHERE EMAIL = EMAIL1 AND SENHA = SENHA1);
	INSERT INTO SOLICITA VALUES(NULL, NOW(), IDFUNC1, IDAGENCIA1,JUSTIFICATIVA1, TIPO1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PARAAPROVAR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PARAAPROVAR`(EMAIL1 VARCHAR(50), SENHA1 VARCHAR(100))
BEGIN
	DECLARE IDFUNC1 INT;
	SET IDFUNC1 = ( 
		SELECT IDFUNC FROM FUNCIONARIO
		WHERE EMAIL = EMAIL1 AND SENHA = SENHA1);
	IF (IDFUNC1 IN (SELECT ID_GERENTE FROM DEPARTAMENTO))
		THEN
			SELECT A.APROV, A.VALOR, S.JUSTIFICATIVA, S.TIPO, S.ID_FUNC FROM APROVACAO AS A
			INNER JOIN SOLICITA AS S
			ON A.ID_SOLIC = S.IDSOLIC
			JOIN FUNCIONARIO
			ON IDFUNC = ID_FUNC
			JOIN DEPARTAMENTO
			ON ID_GERENTE = IDFUNC
			WHERE ID_GERENTE = IDFUNC1 AND APROV = 'P';
		ELSE
			SELECT 'VOCE NAO POSSUI ACESSO A ESSA ABA' AS '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TABLEAPROVACAO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TABLEAPROVACAO`(IDDEP1 INT)
BEGIN
	SELECT ID_VALOR, F.NOMEFUNC, NOME_TIPO, VALOR FROM VALOR 
    JOIN FUNCIONARIO AS F 
    ON IDFUNC = ID_VALOR_FUNC
	WHERE ID_DEP = IDDEP1 AND APROVADO = 'PENDENTE';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TABLEAPROVACAOADM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TABLEAPROVACAOADM`()
BEGIN
	SELECT ID_VALOR, F.NOMEFUNC, NOME_TIPO, VALOR FROM VALOR 
    JOIN FUNCIONARIO AS F 
    ON IDFUNC = ID_VALOR_FUNC
	WHERE APROVADO = 'PENDENTE';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-22 21:40:44
