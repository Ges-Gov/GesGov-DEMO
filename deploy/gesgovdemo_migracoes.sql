-- ============================================================
-- GesGov Demo (demo.gesgov.pt) — BASE DE DADOS COMPLETA
-- ============================================================
-- Para importar numa BD VAZIA (ex.: `gesgovdemo`) no phpMyAdmin.
-- ⚠️ Cada tabela começa com DROP TABLE IF EXISTS: NUNCA importar
-- na BD de outro site (nem na do gesgov.pt!). Confirma o nome da BD
-- no topo do phpMyAdmin e no includes/db_config.php antes de importar.
-- Esquema + migrações 001–032 + conteúdo da GesGov (gesgov.pt).
-- ============================================================

-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gesgovdemo
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_utilizadores`
--

DROP TABLE IF EXISTS `admin_utilizadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_utilizadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tipo` enum('admin','operador','vogal','presidente_assembleia','admin_denuncias') NOT NULL DEFAULT 'operador',
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `perfil_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_utilizadores`
--

LOCK TABLES `admin_utilizadores` WRITE;
/*!40000 ALTER TABLE `admin_utilizadores` DISABLE KEYS */;
INSERT INTO `admin_utilizadores` VALUES
(12,'admin','Administrador','9881e5330518dfa90c0a00f48ecf6289','admin',1,NULL);
/*!40000 ALTER TABLE `admin_utilizadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alertas`
--

DROP TABLE IF EXISTS `alertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `alertas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `mensagem` text NOT NULL,
  `tipo` varchar(50) DEFAULT 'info',
  `ativo` tinyint(1) DEFAULT 1,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `criado_em` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alertas`
--

LOCK TABLES `alertas` WRITE;
/*!40000 ALTER TABLE `alertas` DISABLE KEYS */;
/*!40000 ALTER TABLE `alertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assembleia_competencias_blocos`
--

DROP TABLE IF EXISTS `assembleia_competencias_blocos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assembleia_competencias_blocos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `subtitulo` varchar(255) DEFAULT NULL,
  `conteudo` text DEFAULT NULL,
  `lista` text DEFAULT NULL,
  `icone` varchar(30) DEFAULT NULL,
  `tipo` enum('fiscalizacao','deliberativa','comunidade','transparencia','timeline','destaque') NOT NULL DEFAULT 'fiscalizacao',
  `ordem` int(11) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assembleia_competencias_blocos`
--

LOCK TABLES `assembleia_competencias_blocos` WRITE;
/*!40000 ALTER TABLE `assembleia_competencias_blocos` DISABLE KEYS */;
INSERT INTO `assembleia_competencias_blocos` VALUES
(5,'Competências de Apreciação e Fiscalização','Acompanhamento da atividade autárquica','Compete à Assembleia acompanhar e fiscalizar a atividade da Junta de Freguesia, garantindo transparência, rigor e responsabilidade na gestão local.','Eleger os membros da mesa da Assembleia e do executivo da Junta\nAprovar o regimento e os regulamentos internos\nAcompanhar e fiscalizar a atividade da Junta de Freguesia\nConstituir delegações para o estudo de problemas de interesse para a freguesia\nSolicitar informações sobre assuntos de interesse municipal\nDeliberar sobre a administração de bens e águas públicas da freguesia\nAceitar doações, legados e heranças a benefício de inventário\nApreciar os relatórios de auditoria\nReceber os relatórios de atividade do Presidente da Junta\nVotar moções de censura\nDeliberar sobre outras matérias de interesse para a freguesia','bi-search','fiscalizacao',1,1,'2026-06-26 10:53:22',NULL),
(6,'Competências Deliberativas','Decisões estruturantes para a freguesia','A Assembleia delibera sobre documentos e matérias fundamentais para o funcionamento democrático e institucional da freguesia.','Aprovar as opções do plano, a proposta de orçamento e as suas revisões\nApreciar os relatórios de atividade e as contas de gerência\nAutorizar a Junta a contrair empréstimos\nAutorizar a Junta a fixar taxas\nAutorizar a participação em empresas municipais\nAutorizar acordos de cooperação intermunicipal\nDeliberar sobre o regime de tempo de exercício de funções do Presidente da Junta\nAutorizar a aquisição e alienação de bens imóveis\nAprovar posturas e regulamentos\nRatificar atos praticados ao abrigo de delegação de competências da Câmara Municipal\nAprovar o mapa de pessoal\nAutorizar apoios financeiros a instituições culturais e desportivas\nRegulamentar o pastoreio de gado\nAprovar os símbolos heráldicos da freguesia (brasão, selo e bandeira)','bi-clipboard-check','deliberativa',2,1,'2026-06-26 10:53:22',NULL),
(7,'Competências Relacionadas com a Comunidade','Participação cívica e proximidade','A Assembleia é também um espaço de debate público, valorizando a participação dos cidadãos e a defesa dos interesses da comunidade.','Promover o debate democrático sobre temas locais\nValorizar a participação dos cidadãos nas sessões públicas\nAcompanhar projetos relevantes para o desenvolvimento da freguesia\nDefender os interesses da população junto dos órgãos competentes','bi-people','comunidade',3,1,'2026-06-26 10:53:22',NULL),
(8,'Transparência e Responsabilidade','Decisões registadas e divulgadas','A atuação da Assembleia assenta nos princípios da legalidade, transparência, responsabilidade e proximidade com os cidadãos.','As decisões são registadas em ata\nOs documentos relevantes são divulgados publicamente\nA informação reforça a confiança nas instituições locais','bi-journal-text','transparencia',4,1,'2026-06-26 10:53:22',NULL);
/*!40000 ALTER TABLE `assembleia_competencias_blocos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assembleia_competencias_config`
--

DROP TABLE IF EXISTS `assembleia_competencias_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assembleia_competencias_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hero_kicker` varchar(150) DEFAULT 'Atribuições e Competências',
  `hero_titulo` varchar(255) NOT NULL,
  `hero_subtitulo` text DEFAULT NULL,
  `intro_titulo` varchar(255) DEFAULT NULL,
  `intro_texto` text DEFAULT NULL,
  `destaque_1_titulo` varchar(150) DEFAULT NULL,
  `destaque_1_valor` varchar(100) DEFAULT NULL,
  `destaque_2_titulo` varchar(150) DEFAULT NULL,
  `destaque_2_valor` varchar(100) DEFAULT NULL,
  `destaque_3_titulo` varchar(150) DEFAULT NULL,
  `destaque_3_valor` varchar(100) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `atualizado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assembleia_competencias_config`
--

LOCK TABLES `assembleia_competencias_config` WRITE;
/*!40000 ALTER TABLE `assembleia_competencias_config` DISABLE KEYS */;
INSERT INTO `assembleia_competencias_config` VALUES
(1,'Atribuições e Competências','Atribuições e Competências','Conheça as principais competências da Assembleia de Freguesia: fiscalização, deliberação, participação democrática e acompanhamento da atividade autárquica.','Órgão deliberativo da freguesia','A Assembleia de Freguesia acompanha, aprecia e fiscaliza a atividade da Junta de Freguesia, deliberando sobre matérias fundamentais para a vida da comunidade local.','Fiscalização','Acompanhamento da Junta','Deliberação','Planos, orçamento e contas','Participação','Debate democrático local',1,NULL);
/*!40000 ALTER TABLE `assembleia_competencias_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assembleia_composicao`
--

DROP TABLE IF EXISTS `assembleia_composicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assembleia_composicao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cargo` varchar(150) NOT NULL,
  `grupo` varchar(100) NOT NULL DEFAULT 'Vogais',
  `partido` varchar(100) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `destaque` tinyint(1) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assembleia_composicao`
--

LOCK TABLES `assembleia_composicao` WRITE;
/*!40000 ALTER TABLE `assembleia_composicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `assembleia_composicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assembleia_documentos`
--

DROP TABLE IF EXISTS `assembleia_documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assembleia_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `ficheiro` varchar(255) NOT NULL,
  `data_documento` date DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `destaque` tinyint(1) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assembleia_documentos`
--

LOCK TABLES `assembleia_documentos` WRITE;
/*!40000 ALTER TABLE `assembleia_documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `assembleia_documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assembleia_funcionamento_blocos`
--

DROP TABLE IF EXISTS `assembleia_funcionamento_blocos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assembleia_funcionamento_blocos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `subtitulo` varchar(255) DEFAULT NULL,
  `conteudo` text DEFAULT NULL,
  `icone` varchar(30) DEFAULT NULL,
  `tipo` enum('card','timeline','destaque') NOT NULL DEFAULT 'card',
  `ordem` int(11) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assembleia_funcionamento_blocos`
--

LOCK TABLES `assembleia_funcionamento_blocos` WRITE;
/*!40000 ALTER TABLE `assembleia_funcionamento_blocos` DISABLE KEYS */;
/*!40000 ALTER TABLE `assembleia_funcionamento_blocos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assembleia_funcionamento_config`
--

DROP TABLE IF EXISTS `assembleia_funcionamento_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assembleia_funcionamento_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hero_kicker` varchar(150) DEFAULT 'Funcionamento da Assembleia',
  `hero_titulo` varchar(255) NOT NULL,
  `hero_subtitulo` text DEFAULT NULL,
  `intro_titulo` varchar(255) DEFAULT NULL,
  `intro_texto` text DEFAULT NULL,
  `destaque_1_titulo` varchar(150) DEFAULT NULL,
  `destaque_1_valor` varchar(80) DEFAULT NULL,
  `destaque_2_titulo` varchar(150) DEFAULT NULL,
  `destaque_2_valor` varchar(80) DEFAULT NULL,
  `destaque_3_titulo` varchar(150) DEFAULT NULL,
  `destaque_3_valor` varchar(80) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `atualizado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assembleia_funcionamento_config`
--

LOCK TABLES `assembleia_funcionamento_config` WRITE;
/*!40000 ALTER TABLE `assembleia_funcionamento_config` DISABLE KEYS */;
INSERT INTO `assembleia_funcionamento_config` VALUES
(2,'Funcionamento da Assembleia','Funcionamento da Assembleia','Como funcionam as sessões da Assembleia de Freguesia: periodicidade, natureza pública e participação dos cidadãos.','Sessões ordinárias e extraordinárias','A Assembleia de Freguesia reúne regularmente ao longo do ano em sessões ordinárias, podendo ainda realizar sessões extraordinárias sempre que se justifique tratar de assuntos urgentes ou de especial importância para a freguesia. As reuniões são, regra geral, públicas, reforçando a transparência e a proximidade entre os órgãos do poder local e os munícipes. Os cidadãos podem participar ativamente nas sessões, apresentando sugestões, críticas e propostas, fortalecendo o envolvimento cívico e o escrutínio democrático. O Presidente da Junta de Freguesia participa nas sessões por inerência do cargo. A Assembleia aprova orçamentos, aprecia relatórios de atividade, fiscaliza o desempenho da Junta e delibera sobre regulamentos e demais assuntos submetidos pelo executivo.','Sessões ordinárias','Ao longo do ano','Sessões extraordinárias','Por convocação','Reuniões','Regra geral públicas',1,NULL);
/*!40000 ALTER TABLE `assembleia_funcionamento_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assembleia_sessao_anexos`
--

DROP TABLE IF EXISTS `assembleia_sessao_anexos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assembleia_sessao_anexos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessao_id` int(11) NOT NULL,
  `utilizador_id` int(11) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  `ficheiro_original` varchar(255) NOT NULL,
  `ficheiro_guardado` varchar(255) NOT NULL,
  `extensao` varchar(20) DEFAULT NULL,
  `tamanho_bytes` int(11) DEFAULT NULL,
  `origem` enum('admin','presidente_assembleia','vogal') NOT NULL DEFAULT 'vogal',
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_sessao_id` (`sessao_id`),
  KEY `idx_utilizador_id` (`utilizador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assembleia_sessao_anexos`
--

LOCK TABLES `assembleia_sessao_anexos` WRITE;
/*!40000 ALTER TABLE `assembleia_sessao_anexos` DISABLE KEYS */;
/*!40000 ALTER TABLE `assembleia_sessao_anexos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assembleia_sessao_documentos`
--

DROP TABLE IF EXISTS `assembleia_sessao_documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assembleia_sessao_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessao_id` int(11) NOT NULL,
  `documento_id` int(11) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_sessao_documento` (`sessao_id`,`documento_id`),
  KEY `idx_sessao_id` (`sessao_id`),
  KEY `idx_documento_id` (`documento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assembleia_sessao_documentos`
--

LOCK TABLES `assembleia_sessao_documentos` WRITE;
/*!40000 ALTER TABLE `assembleia_sessao_documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `assembleia_sessao_documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assembleia_sessoes`
--

DROP TABLE IF EXISTS `assembleia_sessoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assembleia_sessoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `tipo` varchar(100) DEFAULT 'Sessão Ordinária',
  `descricao` text DEFAULT NULL,
  `local_sessao` varchar(255) DEFAULT NULL,
  `data_sessao` date NOT NULL,
  `hora_sessao` time NOT NULL,
  `estado` enum('agendada','realizada','cancelada') NOT NULL DEFAULT 'agendada',
  `ordem_trabalhos` text DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `destaque` tinyint(1) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assembleia_sessoes`
--

LOCK TABLES `assembleia_sessoes` WRITE;
/*!40000 ALTER TABLE `assembleia_sessoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `assembleia_sessoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assembleia_votacoes`
--

DROP TABLE IF EXISTS `assembleia_votacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assembleia_votacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessao_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `estado` enum('rascunho','aberta','fechada') NOT NULL DEFAULT 'rascunho',
  `tipo_votacao` enum('publica','secreta') NOT NULL DEFAULT 'publica',
  `resultado_final` varchar(100) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assembleia_votacoes`
--

LOCK TABLES `assembleia_votacoes` WRITE;
/*!40000 ALTER TABLE `assembleia_votacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `assembleia_votacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assembleia_votos`
--

DROP TABLE IF EXISTS `assembleia_votos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assembleia_votos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `votacao_id` int(11) NOT NULL,
  `utilizador_id` int(11) NOT NULL,
  `voto` enum('favor','contra','abstencao') NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_voto_utilizador` (`votacao_id`,`utilizador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assembleia_votos`
--

LOCK TABLES `assembleia_votos` WRITE;
/*!40000 ALTER TABLE `assembleia_votos` DISABLE KEYS */;
/*!40000 ALTER TABLE `assembleia_votos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `associacoes`
--

DROP TABLE IF EXISTS `associacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `associacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `morada` text DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `outros_contactos` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associacoes`
--

LOCK TABLES `associacoes` WRITE;
/*!40000 ALTER TABLE `associacoes` DISABLE KEYS */;
INSERT INTO `associacoes` VALUES
(89,'Freguesia de Santiago do Cacém, Santa Cruz e São Bartolomeu da Serra','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-00.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(90,'JF Alcácer do Sal (Santiago)','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-01.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(91,'Junta de Freguesia de Aldeia Velha','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-02.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(92,'Junta de Freguesia de Amora','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-03.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(93,'Junta de Freguesia de Arraiolos','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-04.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(94,'Junta de Freguesia de Caia, São Pedro e Alcáçova','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-05.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(95,'Junta de Freguesia de Carvalhal','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-06.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(96,'Junta de Freguesia de Castelo','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-07.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(97,'Junta de Freguesia de Comporta','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-08.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(98,'Junta de Freguesia de Figueira e Barros','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-09.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(99,'Junta de Freguesia de Foros de Salvaterra','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-10.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(100,'Junta de Freguesia de Grândola','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-11.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(101,'Junta de Freguesia de Nossa Senhora da Expectação','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-12.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(102,'Junta de Freguesia de Nossa Senhora da Vila','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-13.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(103,'Junta de Freguesia de Nossa Senhora do Bispo','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-14.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(104,'Junta de Freguesia de Pavia','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-15.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(105,'Junta de Freguesia de Rio Moinhos - Borba','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-16.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(106,'Junta de Freguesia de Samora Correia','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-17.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(107,'Junta de Freguesia de Santa Maria de Marvão','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-18.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(108,'Junta de Freguesia de Santiago - Sesimbra','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-19.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(109,'Junta de Freguesia de Santiago do Escoural','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-20.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(110,'Junta de Freguesia de São Domingos','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-21.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(111,'Junta de Freguesia de São João Baptista','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-22.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(112,'Junta de Freguesia de São Vicente e Ventosa','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-23.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(113,'Junta de Freguesia de Silveiras','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-24.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(114,'Junta de Freguesia de Sines','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-25.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(115,'Junta de Freguesia de Vale de Água','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-26.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(116,'Junta de Freguesia de Vila Boim','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-27.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(117,'Junta de Freguesia do Ciborro','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-28.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(118,'Junta de Freguesia do Ervedal','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-29.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(119,'Junta de Freguesia do Seixal','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-30.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(120,'Junta Freguesia do Vimieiro','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-31.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(121,'União de Freguesias de Ameixial, Santa Vitória e São Bento de Estremoz','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-32.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(122,'União de Freguesias de Atalaia e Alto Estanqueiro','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-33.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(123,'União de Freguesias de Benavila e Valongo','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-34.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(124,'União de Freguesias de Figueiró dos Vinhos e Bairradas','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-35.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(125,'União de Freguesias de Montijo e Afonsoeiro','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-36.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(126,'Junta de Freguesia de Quinta do Conde','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-37.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(127,'Junta de Freguesia de Paio Pires','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-38.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(128,'Junta de Freguesia de Sarilhos Grandes','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-39.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(129,'Junta de Freguesia de Portimão','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-40.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(130,'Freguesia de Sousel','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-41.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(131,'Junta de Freguesia do Granho','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-42.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(132,'Junta de Freguesia de Terrugem','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-43.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(133,'Torrão — Alcácer do Sal','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-44.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(134,'Junta de Freguesia de Cano — Sousel','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-45.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(135,'Junta de Freguesia de Casa Branca — Sousel','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-46.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(136,'Junta de Freguesia de Cabeção','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-47.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(137,'Junta de Freguesia de Brotas','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-48.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(138,'Freguesia de Avis','Autarquia parceira da GesGov.',NULL,NULL,'parceiro-49.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `associacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidadaos`
--

DROP TABLE IF EXISTS `cidadaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidadaos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  `criado_em` datetime DEFAULT current_timestamp(),
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_expira` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidadaos`
--

LOCK TABLES `cidadaos` WRITE;
/*!40000 ALTER TABLE `cidadaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cidadaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comercio_local`
--

DROP TABLE IF EXISTS `comercio_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comercio_local` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `morada` text DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `outros_contactos` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comercio_local`
--

LOCK TABLES `comercio_local` WRITE;
/*!40000 ALTER TABLE `comercio_local` DISABLE KEYS */;
INSERT INTO `comercio_local` VALUES
(135,'Construção de WebSite e Ferramentas Digitais','Serviço GesGov','966 234 640',NULL,'geral@gesgov.pt',NULL,NULL,NULL,'https://gesgov.pt/servicos',NULL,NULL,'Construímos plataformas digitais — como este site.'),
(136,'Contabilidade Pública (SNC-AP)','Serviço GesGov','966 234 640',NULL,'geral@gesgov.pt',NULL,NULL,NULL,'https://gesgov.pt/servicos',NULL,NULL,'SNC-AP – Sistema de Normalização Contabilística para as Administrações Públicas.'),
(137,'RGPD - Regulamento Geral de Proteção de Dados','Serviço GesGov','966 234 640',NULL,'geral@gesgov.pt',NULL,NULL,NULL,'https://gesgov.pt/servicos',NULL,NULL,'Lei n.º 58/2019, de 8 de agosto.'),
(138,'Procedimentos Concursais','Serviço GesGov','966 234 640',NULL,'geral@gesgov.pt',NULL,NULL,NULL,'https://gesgov.pt/servicos',NULL,NULL,'Elaboração completa de processos de contratação de funcionários públicos, acompanhando todas as fases do procedimento concursal.'),
(139,'Consultoria Jurídica','Serviço GesGov','966 234 640',NULL,'geral@gesgov.pt',NULL,NULL,NULL,'https://gesgov.pt/servicos',NULL,NULL,'Consultoria jurídica especializada para autarquias locais.'),
(140,'Gestão de Inventário','Serviço GesGov','966 234 640',NULL,'geral@gesgov.pt',NULL,NULL,NULL,'https://gesgov.pt/servicos',NULL,NULL,'Implementação de processos para manter o inventário sempre atualizado, em conformidade com as exigências legais.'),
(141,'Contratação Pública (Código dos Contratos Públicos)','Serviço GesGov','966 234 640',NULL,'geral@gesgov.pt',NULL,NULL,NULL,'https://gesgov.pt/servicos',NULL,NULL,'Decreto-Lei n.º 18/2008.'),
(142,'SIADAP — Avaliação de Desempenho','Serviço GesGov','966 234 640',NULL,'geral@gesgov.pt',NULL,NULL,NULL,'https://gesgov.pt/servicos',NULL,NULL,'Apoio técnico e administrativo ao SIADAP, desde a elaboração do regulamento até às atas e fichas de avaliação.'),
(143,'Recursos Humanos','Serviço GesGov','966 234 640',NULL,'geral@gesgov.pt',NULL,NULL,NULL,'https://gesgov.pt/servicos',NULL,NULL,'Processamento salarial e elaboração dos mapas obrigatórios, mensais e anuais, exigidos às autarquias locais.');
/*!40000 ALTER TABLE `comercio_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracoes_site`
--

DROP TABLE IF EXISTS `configuracoes_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracoes_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_site` varchar(255) DEFAULT NULL,
  `municipio` varchar(255) DEFAULT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dominio` varchar(255) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `morada` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `cor_principal` varchar(20) DEFAULT '#0d3b66',
  `cor_secundaria` varchar(20) DEFAULT '#f0b429',
  `footer` text DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `horario` text DEFAULT NULL,
  `email_notificacoes` varchar(255) DEFAULT NULL,
  `alertas_ativos` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracoes_site`
--

LOCK TABLES `configuracoes_site` WRITE;
/*!40000 ALTER TABLE `configuracoes_site` DISABLE KEYS */;
INSERT INTO `configuracoes_site` VALUES
(2,'GesGov - Soluções Integradas para Autarquias','Site de demonstração','Ao lado das Freguesias','geral@gesgov.pt','https://demo.gesgov.pt','966 234 640','Rua 5 de Outubro, n.º 8, 7470-118 Casa Branca','logo-gesgov.png','#01478E','#A2A1A0','© 2026 GesGov - Soluções Integradas para Autarquias • Site de demonstração','https://www.facebook.com/gesgov','https://www.instagram.com/ges_gov/','Contacte-nos pelo 966 234 640 ou geral@gesgov.pt','geral@gesgov.pt',1);
/*!40000 ALTER TABLE `configuracoes_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactos_pagina_config`
--

DROP TABLE IF EXISTS `contactos_pagina_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactos_pagina_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hero_kicker` varchar(150) DEFAULT 'Contactos',
  `hero_titulo` varchar(255) NOT NULL DEFAULT 'Contactos',
  `hero_subtitulo` text DEFAULT NULL,
  `bloco_titulo` varchar(255) DEFAULT NULL,
  `bloco_texto` text DEFAULT NULL,
  `mapa_embed` text DEFAULT NULL,
  `horario_titulo` varchar(255) DEFAULT NULL,
  `horario_texto` text DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `atualizado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos_pagina_config`
--

LOCK TABLES `contactos_pagina_config` WRITE;
/*!40000 ALTER TABLE `contactos_pagina_config` DISABLE KEYS */;
INSERT INTO `contactos_pagina_config` VALUES
(1,'Contactos','Contactos','Fale connosco: estamos em Casa Branca e no CAME, em Sousel.','GesGov - Soluções Integradas para Autarquias','Sede: Rua 5 de Outubro, n.º 8, 7470-118 Casa Branca\nEscritório: Zona Industrial de Sousel, Lote 5, Edifício CAME, 7470-200 Sousel\nTel. 966 234 640 · geral@gesgov.pt',NULL,'Site de demonstração','Este é o site de demonstração da GesGov: o mesmo site, com o mesmo backoffice, que entregamos às Juntas de Freguesia. Os pedidos e formulários de teste chegam à GesGov.',1,NULL);
/*!40000 ALTER TABLE `contactos_pagina_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactos_uteis`
--

DROP TABLE IF EXISTS `contactos_uteis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactos_uteis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `morada` varchar(255) DEFAULT NULL,
  `horario` varchar(255) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `icone` varchar(50) DEFAULT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `destaque` tinyint(1) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `atualizado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos_uteis`
--

LOCK TABLES `contactos_uteis` WRITE;
/*!40000 ALTER TABLE `contactos_uteis` DISABLE KEYS */;
INSERT INTO `contactos_uteis` VALUES
(52,'GesGov — Sede','GesGov','966 234 640','geral@gesgov.pt','Rua 5 de Outubro, n.º 8, 7470-118 Casa Branca',NULL,NULL,NULL,1,1,1,NULL),
(53,'GesGov — Escritório CAME','GesGov','966 234 640','geral@gesgov.pt','Zona Industrial de Sousel, Lote 5, Edifício CAME, 7470-200 Sousel',NULL,NULL,NULL,2,1,1,NULL),
(54,'DGAL — Direção-Geral das Autarquias Locais','Links úteis',NULL,NULL,NULL,NULL,'https://www.portalautarquico.dgal.gov.pt',NULL,3,0,1,NULL),
(55,'ANAFRE — Associação Nacional de Freguesias','Links úteis',NULL,NULL,NULL,NULL,'https://www.anafre.pt',NULL,4,0,1,NULL),
(56,'Tribunal de Contas','Links úteis',NULL,NULL,NULL,NULL,'https://www.tcontas.pt',NULL,5,0,1,NULL),
(57,'Portal das Finanças','Links úteis',NULL,NULL,NULL,NULL,'https://www.portaldasfinancas.gov.pt',NULL,6,0,1,NULL),
(58,'Segurança Social Direta','Links úteis',NULL,NULL,NULL,NULL,'https://app.seg-social.pt',NULL,7,0,1,NULL),
(59,'Caixa Geral de Aposentações','Links úteis',NULL,NULL,NULL,NULL,'https://www.cga.pt',NULL,8,0,1,NULL);
/*!40000 ALTER TABLE `contactos_uteis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratacao_publica`
--

DROP TABLE IF EXISTS `contratacao_publica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratacao_publica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `numero_procedimento` varchar(100) DEFAULT NULL,
  `carreira` varchar(100) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `area_funcional` varchar(150) DEFAULT NULL,
  `vagas` smallint(5) unsigned DEFAULT NULL,
  `tipo_vinculo` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  `valor` decimal(12,2) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `requisitos` text DEFAULT NULL,
  `ficheiro` varchar(255) DEFAULT NULL,
  `data_publicacao` date DEFAULT NULL,
  `inicio_candidaturas` date DEFAULT NULL,
  `fim_candidaturas` date DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratacao_publica`
--

LOCK TABLES `contratacao_publica` WRITE;
/*!40000 ALTER TABLE `contratacao_publica` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratacao_publica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratacao_publica_anexos`
--

DROP TABLE IF EXISTS `contratacao_publica_anexos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratacao_publica_anexos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `procedimento_id` int(11) NOT NULL,
  `ficheiro` varchar(255) NOT NULL,
  `ficheiro_original` varchar(255) DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratacao_publica_anexos`
--

LOCK TABLES `contratacao_publica_anexos` WRITE;
/*!40000 ALTER TABLE `contratacao_publica_anexos` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratacao_publica_anexos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratacao_publica_pagina`
--

DROP TABLE IF EXISTS `contratacao_publica_pagina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratacao_publica_pagina` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hero_kicker` varchar(150) NOT NULL DEFAULT 'Transparência e Gestão Pública',
  `hero_titulo` varchar(255) NOT NULL DEFAULT 'Contratação Pública',
  `texto` text DEFAULT NULL,
  `botao_texto` varchar(150) NOT NULL DEFAULT 'Ver no Portal BASE',
  `botao_link` varchar(500) DEFAULT NULL,
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratacao_publica_pagina`
--

LOCK TABLES `contratacao_publica_pagina` WRITE;
/*!40000 ALTER TABLE `contratacao_publica_pagina` DISABLE KEYS */;
INSERT INTO `contratacao_publica_pagina` VALUES
(1,'Transparência e Gestão Pública','Contratação Pública','Os procedimentos de contratação pública desta freguesia são publicados no Portal BASE, a plataforma oficial e obrigatória para a divulgação de contratos públicos em Portugal.','Ver no Portal BASE',NULL,'2026-09-30 08:53:59');
/*!40000 ALTER TABLE `contratacao_publica_pagina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denuncias`
--

DROP TABLE IF EXISTS `denuncias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `denuncias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `tipo` varchar(120) NOT NULL,
  `categoria` varchar(120) NOT NULL,
  `assunto` varchar(255) NOT NULL,
  `data_ocorrencia` date DEFAULT NULL,
  `local_ocorrencia` varchar(255) DEFAULT NULL,
  `descricao` text NOT NULL,
  `anonima` tinyint(1) DEFAULT 1,
  `nome` varchar(180) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `email` varchar(180) DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'recebida',
  `prioridade` varchar(50) DEFAULT 'normal',
  `observacoes_admin` text DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denuncias`
--

LOCK TABLES `denuncias` WRITE;
/*!40000 ALTER TABLE `denuncias` DISABLE KEYS */;
/*!40000 ALTER TABLE `denuncias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denuncias_anexos`
--

DROP TABLE IF EXISTS `denuncias_anexos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `denuncias_anexos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `denuncia_id` int(11) NOT NULL,
  `ficheiro` varchar(255) NOT NULL,
  `ficheiro_original` varchar(255) DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denuncias_anexos`
--

LOCK TABLES `denuncias_anexos` WRITE;
/*!40000 ALTER TABLE `denuncias_anexos` DISABLE KEYS */;
/*!40000 ALTER TABLE `denuncias_anexos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denuncias_mensagens`
--

DROP TABLE IF EXISTS `denuncias_mensagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `denuncias_mensagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `denuncia_id` int(11) NOT NULL,
  `origem` enum('admin','denunciante') DEFAULT 'admin',
  `mensagem` text NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denuncias_mensagens`
--

LOCK TABLES `denuncias_mensagens` WRITE;
/*!40000 ALTER TABLE `denuncias_mensagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `denuncias_mensagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denuncias_utilizadores`
--

DROP TABLE IF EXISTS `denuncias_utilizadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `denuncias_utilizadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `email` varchar(180) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denuncias_utilizadores`
--

LOCK TABLES `denuncias_utilizadores` WRITE;
/*!40000 ALTER TABLE `denuncias_utilizadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `denuncias_utilizadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentos`
--

DROP TABLE IF EXISTS `documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `categoria` varchar(100) NOT NULL,
  `ficheiro` varchar(255) NOT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  `data_documento` date DEFAULT NULL,
  `criado_em` datetime DEFAULT current_timestamp(),
  `area` varchar(100) DEFAULT 'assembleia',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos`
--

LOCK TABLES `documentos` WRITE;
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dpo_mensagens`
--

DROP TABLE IF EXISTS `dpo_mensagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dpo_mensagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `origem` enum('dpo','cidadao') DEFAULT 'dpo',
  `mensagem` text NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dpo_mensagens`
--

LOCK TABLES `dpo_mensagens` WRITE;
/*!40000 ALTER TABLE `dpo_mensagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `dpo_mensagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dpo_pedidos`
--

DROP TABLE IF EXISTS `dpo_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dpo_pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `nome` varchar(180) NOT NULL,
  `email` varchar(180) NOT NULL,
  `mensagem` text NOT NULL,
  `aceita_politica` tinyint(1) DEFAULT 0,
  `autoriza_resposta` tinyint(1) DEFAULT 0,
  `estado` varchar(50) DEFAULT 'recebido',
  `observacoes_admin` text DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dpo_pedidos`
--

LOCK TABLES `dpo_pedidos` WRITE;
/*!40000 ALTER TABLE `dpo_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `dpo_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dpo_utilizadores`
--

DROP TABLE IF EXISTS `dpo_utilizadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dpo_utilizadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `email` varchar(180) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dpo_utilizadores`
--

LOCK TABLES `dpo_utilizadores` WRITE;
/*!40000 ALTER TABLE `dpo_utilizadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `dpo_utilizadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `data_evento` datetime DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `local` varchar(255) DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `imagem_foco_x` tinyint(3) unsigned NOT NULL DEFAULT 50,
  `imagem_foco_y` tinyint(3) unsigned NOT NULL DEFAULT 50,
  `categoria` varchar(60) DEFAULT NULL,
  `inscricoes_ativas` tinyint(1) NOT NULL DEFAULT 0,
  `inscricoes_vagas` int(10) unsigned DEFAULT NULL,
  `inscricoes_ate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES
(4,'CGA – Validação','Caixa Geral de Aposentações deve ser feita pelas entidades empregadoras até ao dia 6 do mês seguinte àquele em que foi disponibilizada.\n\nPrazos e Obrigações da Relação Contributiva\n\nDisponibilização: A CGA disponibiliza a RC previsional no dia 12 de cada mês na área reservada da plataforma CGA Directa.\n\nPrazo limite: Até ao dia 6 do mês seguinte, a entidade deve verificar, alterar, validar e confirmar os dados.\n\nValidação prévia: A confirmação exige que a declaração não apresente erros.\n\nAuto-confirmação: Se a entidade não realizar nenhuma ação até ao dia 6, ocorre a auto-confirmação automática dos valores disponibilizados.','2026-09-06 00:00:00','evento-cga-validacao.jpg',NULL,NULL,'Online — CGA Directa',NULL,50,50,'Institucional',0,NULL,NULL),
(5,'Convite: Inauguração do Escritório GesGov – CAME, Sousel','CONVITE\n\nInauguração do Escritório GesGov – CAME, Sousel\n\n7 de setembro | 18h00\n\nA GesGov tem a honra de convidar V. Ex.ª para a inauguração do seu novo escritório no CAME – Centro de Apoio às Microempresas, na Zona Industrial de Sousel, que terá lugar no próximo dia 7 de setembro, pelas 18h00.\n\nEste momento assinala uma nova etapa no percurso da GesGov e será também uma oportunidade para dar a conhecer a equipa GesGov, apresentar os serviços atualmente disponibilizados e partilhar a nossa visão e os projetos que estamos a preparar para o futuro, reforçando a proximidade e a colaboração com as Autarquias.\n\nApós a sessão de apresentação e inauguração do espaço, teremos o gosto de receber os nossos convidados para um jantar de convívio.\n\nPrograma\n\n18h00 – Receção dos convidados\n\n18h15 – Inauguração do escritório GesGov\n\n18h30 – Apresentação da equipa, serviços e projetos futuros\n\n19h30 – Jantar de convívio\n\nLocal: CAME – Centro de Apoio às Microempresas\n\nZona Industrial de Sousel, Lote 5, Edifício CAME\n\n7470-200 Sousel\n\nAgradecemos a confirmação de presença, de forma a podermos assegurar atempadamente a organização e logística do evento.\n\nSerá uma honra contar com a presença de V. Ex.ª neste momento especial para a GesGov.\n\nGesGov','2026-09-07 18:00:00','evento-convite-inauguracao-do-escritorio-gesgov-came-sousel.jpg','38.952806','-7.684907','CAME – Centro de Apoio às Microempresas, Zona Industrial de Sousel, Lote 5, 7470-200 Sousel',NULL,50,50,'Institucional',0,NULL,NULL),
(6,'Inauguração Escritório GesGov','A GesGov inicia uma nova etapa em Sousel!\n\nOntem foi um dia muito especial para toda a equipa GesGov: inaugurámos oficialmente o nosso novo escritório no CAME – Centro de Apoio às Microempresas, em Sousel.\n\nMais do que a abertura de um novo espaço, este momento representa a concretização de um projeto e, sobretudo, o reforço de um compromisso: estar cada vez mais próximos das autarquias, dos seus eleitos, trabalhadores e territórios.\n\nTivemos a honra de contar com a presença do Presidente do Município de Sousel, Eng.º Manuel Valério, bem como de autarcas da Junta de Freguesia de Casa Branca, Junta de Freguesia de Cano, Junta de Freguesia de Sousel, Junta de Freguesia de Fronteira, Freguesia Nª Srª Expectação Campo Maior, Freguesia São João Baptista, Junta de Freguesia de Vila Boim, Freguesia Avis, Freguesia de Ervedal, União das Freguesias de Benavila e Valongo e Freguesia de Rio de Moinhos - Borba.\n\nA todos os que estiveram connosco, e também aos muitos clientes, parceiros e amigos que nos fizeram chegar mensagens de felicitações e incentivo, deixamos o nosso sincero agradecimento. A vossa presença e as vossas palavras tornaram este momento ainda mais especial.\n\nFoi também a oportunidade de apresentarmos a equipa multidisciplinar que dá corpo a este projeto:\n\n• Pedro Prates — Gestor Autárquico\n\n• João Pinto — Técnico Oficial de Contas\n\n• Daniela Pegacho — Jurista\n\n• Carlos Baptista — Consultor Informático\n\n• Filipe Dordio — Engenheiro Informático\n\n• João Pereira — Marketing Digital e 3D\n\nÁreas diferentes, conhecimento especializado e um propósito comum.\n\nEsta é a equipa que estará sempre ao lado das autarquias, disponível para acrescentar e partilhar conhecimento, compreender desafios e encontrar soluções eficientes, eficazes e especializadas.\n\nAbrimos uma nova porta em Sousel, mas queremos, acima de tudo, abrir novas oportunidades de colaboração, proximidade e partilha com o Poder Local.\n\nObrigado a todos os que fizeram parte deste primeiro dia.\n\nContinuamos juntos. Continuamos próximos. Continuamos a construir a GesGov.','2026-09-07 18:00:00','evento-inauguracao-escritorio-gesgov.jpg','38.952806','-7.684907','CAME – Centro de Apoio às Microempresas, Zona Industrial de Sousel, Lote 5, 7470-200 Sousel',NULL,50,50,'Institucional',0,NULL,NULL),
(7,'Entrega ficheiros SISAL','SISAL (Sistema de Informação para o Subsetor da Administração Local) é a plataforma da Direção-Geral das Autarquias Locais (DGAL) usada para recolher e validar a informação orçamental e económico-financeira das entidades públicas locais.','2026-09-10 00:00:00','evento-entrega-ficheiros-sisal.jpg',NULL,NULL,'Online — SISAL (DGAL)',NULL,50,50,'Institucional',0,NULL,NULL),
(8,'Plano de Formação GesGov - Montemor-o-Novo - Alterações ao CCP, LCPA e Procedimentos de Despesa Pública','A GesGov tem o prazer de convidar os órgãos executivos e os trabalhadores das autarquias, em particular os profissionais com responsabilidades nas áreas financeira, administrativa, contratação pública e aprovisionamento, a participar num conjunto de ações de formação gratuitas, dedicadas a temas de especial relevância para a gestão autárquica.\n\nAo longo de um dia de trabalho, serão apresentadas, analisadas e debatidas as principais matérias relacionadas com:\n\n* Alterações ao Código dos Contratos Públicos – principais novidades e implicações práticas para as autarquias;\n\n* Alterações à Lei dos Compromissos e dos Pagamentos em Atraso (LCPA) – enquadramento e impacto na gestão financeira;\n\n* Elaboração de uma proposta – aspetos essenciais a considerar na preparação e análise de propostas no âmbito da contratação pública;\n\n* Ciclo do processo de despesa – abordagem prática a todo o circuito, desde a identificação da necessidade e cabimentação até à contratação, compromisso, processamento e pagamento.\n\nPretende-se que estas sessões constituam não apenas um momento de atualização de conhecimentos, mas também um espaço de partilha de experiências, esclarecimento de dúvidas e debate de situações práticas com que os eleitos e técnicos das autarquias se deparam no exercício das suas funções.\n\nDATAS E LOCAIS\n\n14 de outubro | Montemor-o-Novo\n\nAuditório da Junta de Freguesia de Nossa Senhora da Vila\n\nLargo Dr. Banha de Andrade, Montemor-o-Novo\n\nHORÁRIO\n\nDas 09h30 às 17h00\n\nPARTICIPAÇÃO GRATUITA | INSCRIÇÃO OBRIGATÓRIA\n\nA participação é gratuita, mas está sujeita a inscrição prévia obrigatória, através do seguinte formulário\n\nAtendendo à capacidade dos auditórios, o número de participantes é limitado aos lugares disponíveis em cada sessão, pelo que recomendamos a realização da inscrição com a maior brevidade possível.\n\nOs eventos vão estar disponíveis na nossa agenda, com inscrição individual por evento.\n\nA inscrição será considerada válida após confirmação pela GesGov.\n\nEsperamos contar com a sua presença neste espaço de atualização, reflexão e partilha sobre matérias essenciais à gestão financeira e à contratação pública nas autarquias.\n\nCom os melhores cumprimentos,\n\nGesGov','2026-10-14 09:30:00','evento-plano-de-formacao-gesgov-montemor-o-novo-alteracoes-ao-ccp-lcpa-e-procedimentos-de-despesa-publica.jpg',NULL,NULL,'Auditório da Junta de Freguesia de Nossa Senhora da Vila, Largo Dr. Banha de Andrade, Montemor-o-Novo','2026-10-14 19:00:00',50,50,'Educação',0,NULL,NULL),
(9,'Plano de Formação GesGov - Sesimbra - Alterações ao CCP, LCPA e Procedimentos de Despesa Pública','A GesGov tem o prazer de convidar os órgãos executivos e os trabalhadores das autarquias, em particular os profissionais com responsabilidades nas áreas financeira, administrativa, contratação pública e aprovisionamento, a participar num conjunto de ações de formação gratuitas, dedicadas a temas de especial relevância para a gestão autárquica.\n\nAo longo de um dia de trabalho, serão apresentadas, analisadas e debatidas as principais matérias relacionadas com:\n\n* Alterações ao Código dos Contratos Públicos – principais novidades e implicações práticas para as autarquias;\n\n* Alterações à Lei dos Compromissos e dos Pagamentos em Atraso (LCPA) – enquadramento e impacto na gestão financeira;\n\n* Elaboração de uma proposta – aspetos essenciais a considerar na preparação e análise de propostas no âmbito da contratação pública;\n\n* Ciclo do processo de despesa – abordagem prática a todo o circuito, desde a identificação da necessidade e cabimentação até à contratação, compromisso, processamento e pagamento.\n\nPretende-se que estas sessões constituam não apenas um momento de atualização de conhecimentos, mas também um espaço de partilha de experiências, esclarecimento de dúvidas e debate de situações práticas com que os eleitos e técnicos das autarquias se deparam no exercício das suas funções.\n\nDATAS E LOCAIS\n\n21 de outubro | Sampaio – Sesimbra\n\nAuditório do Centro de Estudos Culturais e de Ação Social Raio de Luz\n\nAvenida D. Manuel da Silva Martins, n.º 8, Sampaio, 2970-585 Sesimbra\n\nHORÁRIO\n\nDas 09h30 às 17h00\n\nPARTICIPAÇÃO GRATUITA | INSCRIÇÃO OBRIGATÓRIA\n\nA participação é gratuita, mas está sujeita a inscrição prévia obrigatória, através do seguinte formulário\n\nAtendendo à capacidade dos auditórios, o número de participantes é limitado aos lugares disponíveis em cada sessão, pelo que recomendamos a realização da inscrição com a maior brevidade possível.\n\nOs eventos vão estar disponíveis na nossa agenda, com inscrição individual por evento.\n\nA inscrição será considerada válida após confirmação pela GesGov.\n\nEsperamos contar com a sua presença neste espaço de atualização, reflexão e partilha sobre matérias essenciais à gestão financeira e à contratação pública nas autarquias.\n\nCom os melhores cumprimentos,\n\nGesGov','2026-10-21 09:30:00','evento-plano-de-formacao-gesgov-sesimbra-alteracoes-ao-ccp-lcpa-e-procedimentos-de-despesa-publica.jpg',NULL,NULL,'Auditório do Centro Raio de Luz, Av. D. Manuel da Silva Martins, n.º 8, Sampaio, 2970-585 Sesimbra','2026-10-21 17:00:00',50,50,'Educação',0,NULL,NULL),
(10,'Plano de Formação GesGov - Samora Correia - Alterações ao CCP, LCPA e Procedimentos de Despesa Pública','A GesGov tem o prazer de convidar os órgãos executivos e os trabalhadores das autarquias, em particular os profissionais com responsabilidades nas áreas financeira, administrativa, contratação pública e aprovisionamento, a participar num conjunto de ações de formação gratuitas, dedicadas a temas de especial relevância para a gestão autárquica.\n\nAo longo de um dia de trabalho, serão apresentadas, analisadas e debatidas as principais matérias relacionadas com:\n\n* Alterações ao Código dos Contratos Públicos – principais novidades e implicações práticas para as autarquias;\n\n* Alterações à Lei dos Compromissos e dos Pagamentos em Atraso (LCPA) – enquadramento e impacto na gestão financeira;\n\n* Elaboração de uma proposta – aspetos essenciais a considerar na preparação e análise de propostas no âmbito da contratação pública;\n\n* Ciclo do processo de despesa – abordagem prática a todo o circuito, desde a identificação da necessidade e cabimentação até à contratação, compromisso, processamento e pagamento.\n\nPretende-se que estas sessões constituam não apenas um momento de atualização de conhecimentos, mas também um espaço de partilha de experiências, esclarecimento de dúvidas e debate de situações práticas com que os eleitos e técnicos das autarquias se deparam no exercício das suas funções.\n\nDATAS E LOCAIS\n\n28 de outubro | Samora Correia\n\nAuditório do Palácio do Infantado\n\nPraça da República, Samora Correia\n\nHORÁRIO\n\nDas 09h30 às 17h00\n\nPARTICIPAÇÃO GRATUITA | INSCRIÇÃO OBRIGATÓRIA\n\nA participação é gratuita, mas está sujeita a inscrição prévia obrigatória, através do seguinte formulário\n\nAtendendo à capacidade dos auditórios, o número de participantes é limitado aos lugares disponíveis em cada sessão, pelo que recomendamos a realização da inscrição com a maior brevidade possível.\n\nOs eventos vão estar disponíveis na nossa agenda, com inscrição individual por evento.\n\nA inscrição será considerada válida após confirmação pela GesGov.\n\nEsperamos contar com a sua presença neste espaço de atualização, reflexão e partilha sobre matérias essenciais à gestão financeira e à contratação pública nas autarquias.\n\nCom os melhores cumprimentos,\n\nGesGov','2026-10-28 09:30:00','evento-plano-de-formacao-gesgov-samora-correia-alteracoes-ao-ccp-lcpa-e-procedimentos-de-despesa-publica.jpg',NULL,NULL,'Auditório do Palácio do Infantado, Samora Correia','2026-10-28 17:00:00',50,50,'Educação',0,NULL,NULL),
(11,'Plano de Formação GesGov - Campo Maior - Alterações ao CCP, LCPA e Procedimentos de Despesa Pública','A GesGov tem o prazer de convidar os órgãos executivos e os trabalhadores das autarquias, em particular os profissionais com responsabilidades nas áreas financeira, administrativa, contratação pública e aprovisionamento, a participar num conjunto de ações de formação gratuitas, dedicadas a temas de especial relevância para a gestão autárquica.\n\nAo longo de um dia de trabalho, serão apresentadas, analisadas e debatidas as principais matérias relacionadas com:\n\n* Alterações ao Código dos Contratos Públicos – principais novidades e implicações práticas para as autarquias;\n\n* Alterações à Lei dos Compromissos e dos Pagamentos em Atraso (LCPA) – enquadramento e impacto na gestão financeira;\n\n* Elaboração de uma proposta – aspetos essenciais a considerar na preparação e análise de propostas no âmbito da contratação pública;\n\n* Ciclo do processo de despesa – abordagem prática a todo o circuito, desde a identificação da necessidade e cabimentação até à contratação, compromisso, processamento e pagamento.\n\nPretende-se que estas sessões constituam não apenas um momento de atualização de conhecimentos, mas também um espaço de partilha de experiências, esclarecimento de dúvidas e debate de situações práticas com que os eleitos e técnicos das autarquias se deparam no exercício das suas funções.\n\nDATAS E LOCAIS\n\n5 de novembro | Campo Maior\n\nAuditório do CIFA – Centro Interpretativo da Fortificação Abaluartada\n\nPraça Velha, 1A, 7370-117 Campo Maior\n\nHORÁRIO\n\nDas 09h30 às 17h00\n\nPARTICIPAÇÃO GRATUITA | INSCRIÇÃO OBRIGATÓRIA\n\nA participação é gratuita, mas está sujeita a inscrição prévia obrigatória, através do seguinte formulário\n\nAtendendo à capacidade dos auditórios, o número de participantes é limitado aos lugares disponíveis em cada sessão, pelo que recomendamos a realização da inscrição com a maior brevidade possível.\n\nOs eventos vão estar disponíveis na nossa agenda, com inscrição individual por evento.\n\nA inscrição será considerada válida após confirmação pela GesGov.\n\nEsperamos contar com a sua presença neste espaço de atualização, reflexão e partilha sobre matérias essenciais à gestão financeira e à contratação pública nas autarquias.\n\nCom os melhores cumprimentos,\n\nGesGov','2026-11-05 09:30:00','evento-plano-de-formacao-gesgov-campo-maior-alteracoes-ao-ccp-lcpa-e-procedimentos-de-despesa-publica.jpg',NULL,NULL,'Auditório do CIFA – Centro Interpretativo da Fortificação Abaluartada, Praça Velha, 1A, 7370-117 Campo Maior','2026-11-05 17:00:00',50,50,'Educação',0,NULL,NULL);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos_campos_extra`
--

DROP TABLE IF EXISTS `eventos_campos_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos_campos_extra` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `evento_id` int(10) unsigned NOT NULL,
  `label` varchar(190) NOT NULL,
  `tipo` enum('texto','checkbox') NOT NULL DEFAULT 'texto',
  `obrigatorio` tinyint(1) NOT NULL DEFAULT 0,
  `ordem` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_eventos_campos_extra_evento` (`evento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos_campos_extra`
--

LOCK TABLES `eventos_campos_extra` WRITE;
/*!40000 ALTER TABLE `eventos_campos_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventos_campos_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos_inscricoes`
--

DROP TABLE IF EXISTS `eventos_inscricoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos_inscricoes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `evento_id` int(10) unsigned NOT NULL,
  `nome` varchar(190) NOT NULL,
  `email` varchar(190) NOT NULL,
  `telefone` varchar(40) DEFAULT NULL,
  `num_pessoas` smallint(5) unsigned NOT NULL DEFAULT 1,
  `observacoes` text DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `campos_extra` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eventos_inscricoes_evento` (`evento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos_inscricoes`
--

LOCK TABLES `eventos_inscricoes` WRITE;
/*!40000 ALTER TABLE `eventos_inscricoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventos_inscricoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executivo_membros`
--

DROP TABLE IF EXISTS `executivo_membros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `executivo_membros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cargo` varchar(150) NOT NULL,
  `pelouros` text DEFAULT NULL,
  `biografia` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `ordem` int(11) DEFAULT 0,
  `ativo` tinyint(1) DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executivo_membros`
--

LOCK TABLES `executivo_membros` WRITE;
/*!40000 ALTER TABLE `executivo_membros` DISABLE KEYS */;
INSERT INTO `executivo_membros` VALUES
(34,'Pedro Miguel Ourives Prates','Diretor Executivo','Contabilidade\nRecursos Humanos\nSIADAP\nAcompanhamento presencial dos clientes','Licenciado em Gestão Autárquica. Desempenha funções junto das autarquias locais desde 2000, em informática, contabilidade, património, contratação pública, recursos humanos, SIADAP, licenciamentos e legislação autárquica. Na GesGov acompanha presencialmente os clientes e lidera a contabilidade, os recursos humanos e o SIADAP.','geral@gesgov.pt','equipa-0.jpg',1,1,'2026-09-30 11:52:43'),
(35,'Daniela Pegacho','Jurista','Contratação Pública\nRegulamentos\nPareceres jurídicos','Licenciada em Direito e Mestre em Ciências Jurídico-Criminais. Experiência em contratação pública em projetos de grande dimensão; desempenhou funções na Comunidade Intermunicipal do Alto Alentejo e na Câmara Municipal de Sousel. Projeto de referência: Barragem do Pisão (procedimentos de concursos públicos e pareceres jurídicos). Na GesGov é responsável pela contratação pública, regulamentos e pareceres.',NULL,'equipa-1.jpg',2,1,'2026-09-30 11:52:43'),
(36,'João Pinto','Técnico Oficial de Contas','Área financeira\nRelatórios financeiros\nSubmissão de mapas','Licenciado em Gestão, pós-graduado em Contabilidade Pública (SNC-AP) e Técnico Oficial de Contas. Nove anos de experiência com autarquias, em empresas de contabilidade e de produção de software. Na GesGov acompanha pessoalmente os clientes na área financeira das freguesias.',NULL,'equipa-2.jpg',3,1,'2026-09-30 11:52:43'),
(37,'Carlos Baptista','Consultor Informático','Redes e sistemas\nSegurança informática\nContinuidade de negócio','Formação especializada em informática, redes e sistemas, com 40 anos de atividade profissional em tecnologias de informação. Na GesGov lidera a consultoria informática prestada às autarquias locais.',NULL,'equipa-3.jpg',4,1,'2026-09-30 11:52:43'),
(38,'Filipe Dordio','Engenheiro Informático','Plataformas digitais\nSites das autarquias','Licenciado em Engenharia Informática – Engenharia de Software. Desenvolve plataformas digitais simples, intuitivas e diferenciadoras, desenhadas a partir das necessidades reais das autarquias.',NULL,'equipa-4.jpg',5,1,'2026-09-30 11:52:43'),
(39,'João Pereira','Consultor de Marketing Digital','Comunicação digital\nFotografia e vídeo\nBoletins e visualização 3D','Licenciado em Marketing Digital. Trabalha em fotografia, vídeo, redes sociais, mailings, boletins de freguesia e visualização 3D, transformando informação institucional em comunicação próxima e consistente.',NULL,'equipa-5.jpg',6,1,'2026-09-30 11:52:43');
/*!40000 ALTER TABLE `executivo_membros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pergunta` varchar(255) NOT NULL,
  `resposta` text NOT NULL,
  `ordem` int(11) DEFAULT 0,
  `ativo` tinyint(1) DEFAULT 1,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES
(1,'Como posso contactar a Junta de Freguesia?','Pode contactar-nos por telefone, email ou presencialmente, através dos dados disponíveis na página de Contactos. Também pode usar a secção \"Pedidos à Junta\" para comunicar diretamente pelo site.',1,1,'2026-06-23 12:04:30'),
(2,'Como faço uma denúncia através do Canal de Denúncias?','Na página \"Canal de Denúncias\" encontra um formulário onde pode submeter a sua denúncia, com ou sem identificação. Após o envio, recebe um código único para acompanhar o estado da denúncia em \"Acompanhar Denúncia\".',2,1,'2026-06-23 12:04:30'),
(3,'Como posso solicitar um documento ou requerimento à Junta?','Através da página \"Requerimentos\", disponível na Junta Virtual, pode submeter o seu pedido online. Acompanhe o estado e a resposta na sua área pessoal.',3,1,'2026-06-23 12:04:30'),
(4,'Como consulto atas, editais e outros documentos públicos?','Na página \"Documentos\" da Freguesia tem acesso a atas, editais, convocatórias, regulamentos e outros documentos, organizados por categoria.',4,1,'2026-06-23 12:04:30'),
(5,'Como posso reportar uma ocorrência (ex.: iluminação, limpeza, via pública)?','Use a página \"Pedidos à Junta\" para indicar, inclusive no mapa, o local exato da ocorrência e descrever a situação.',5,1,'2026-06-23 12:04:30'),
(6,'Onde posso ver notícias e eventos da freguesia?','As secções \"Notícias\" e \"Eventos\" do site são atualizadas regularmente com a informação e atividades da freguesia da freguesia.',6,1,'2026-06-23 12:04:30'),
(7,'O que é o SIAC e é obrigatório fazer o registo do meu animal de companhia?','O SIAC (Sistema de Informação de Animais de Companhia) promove a identificação de animais de companhia de forma simplificada numa única plataforma. A aplicação de microchip e o registo na base de dados do SIAC são obrigatórios para cães e gatos. O registo é feito na Junta de Freguesia, com licença anual a obter entre os meses de março e junho, mediante apresentação de certificado de vacinação antirrábica, cartão de cidadão e comprovativo de registo no SIAC. A não realização do registo pode dar origem a um processo de contraordenação.',7,1,'2026-06-30 14:54:37'),
(8,'Que documentos preciso para pedir um atestado de residência?','Para emitir um atestado de residência deve apresentar documento de identificação (cartão de cidadão com número de identificação fiscal, ou passaporte/título de residência válido). Cidadãos estrangeiros necessitam ainda do testemunho de dois residentes recenseados na freguesia.',8,1,'2026-06-30 14:54:37'),
(9,'Que documentos preciso para um atestado de situação económica?','É necessário apresentar documento de identificação, declarações de IRS, recibos de vencimento recentes, comprovativos de pensão (quando aplicável) e declaração de composição do agregado familiar emitida pela Segurança Social.',9,1,'2026-06-30 14:54:37'),
(10,'Como faço uma declaração de união de facto?','A declaração e a dissolução de união de facto exigem documento de identificação, certidão de nascimento e o testemunho de dois residentes recenseados na freguesia.',10,1,'2026-06-30 14:54:37');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galeria_albuns`
--

DROP TABLE IF EXISTS `galeria_albuns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `galeria_albuns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `capa` varchar(255) DEFAULT NULL,
  `origem` enum('manual','evento','ponto') NOT NULL DEFAULT 'manual',
  `origem_id` int(11) DEFAULT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_origem` (`origem`,`origem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galeria_albuns`
--

LOCK TABLES `galeria_albuns` WRITE;
/*!40000 ALTER TABLE `galeria_albuns` DISABLE KEYS */;
INSERT INTO `galeria_albuns` VALUES
(153,'Escritório GesGov — CAME, Sousel',NULL,'evento-convite-inauguracao-do-escritorio-gesgov-came-sousel.jpg','ponto',120,120,1,'2026-09-30 11:52:43'),
(154,'Sede GesGov — Casa Branca',NULL,'noticia-gesgov-apoia-as-festas-de-casa-branca.jpg','ponto',121,121,1,'2026-09-30 11:52:43'),
(156,'Inauguração Escritório GesGov',NULL,'evento-inauguracao-escritorio-gesgov.jpg','evento',6,10,1,'2026-09-30 11:52:43');
/*!40000 ALTER TABLE `galeria_albuns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galeria_imagens`
--

DROP TABLE IF EXISTS `galeria_imagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `galeria_imagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `ficheiro` varchar(255) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_album` (`album_id`),
  CONSTRAINT `fk_galeria_imagens_album` FOREIGN KEY (`album_id`) REFERENCES `galeria_albuns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galeria_imagens`
--

LOCK TABLES `galeria_imagens` WRITE;
/*!40000 ALTER TABLE `galeria_imagens` DISABLE KEYS */;
INSERT INTO `galeria_imagens` VALUES
(181,153,'evento-convite-inauguracao-do-escritorio-gesgov-came-sousel.jpg','Escritório GesGov — CAME, Sousel',1,1,'2026-09-30 11:52:43'),
(182,154,'noticia-gesgov-apoia-as-festas-de-casa-branca.jpg','Sede GesGov — Casa Branca',1,1,'2026-09-30 11:52:43'),
(184,153,'noticia-inauguracao-escritorio-gesgov.jpg','A equipa GesGov no CAME',2,1,'2026-09-30 11:52:43'),
(185,153,'noticia-gesgov-inaugura-novo-escritorio-no-came-em-sousel.jpg','Inauguração, com o Presidente da Câmara Municipal de Sousel',3,1,'2026-09-30 11:52:43'),
(187,156,'evento-inauguracao-escritorio-gesgov.jpg','A equipa GesGov',1,1,'2026-09-30 11:52:43'),
(188,156,'noticia-gesgov-inaugura-novo-escritorio-no-came-em-sousel.jpg','Com o Presidente da Câmara Municipal de Sousel',2,1,'2026-09-30 11:52:43');
/*!40000 ALTER TABLE `galeria_imagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heraldica_elementos`
--

DROP TABLE IF EXISTS `heraldica_elementos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `heraldica_elementos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `icone` varchar(30) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heraldica_elementos`
--

LOCK TABLES `heraldica_elementos` WRITE;
/*!40000 ALTER TABLE `heraldica_elementos` DISABLE KEYS */;
INSERT INTO `heraldica_elementos` VALUES
(48,'Azul GesGov','A cor principal, #01478E — a palavra «Ges» do logótipo, em gradiente para um azul mais claro, e a barra inclinada por baixo.','bi-palette',NULL,1,1,'2026-09-30 11:52:43',NULL),
(49,'Cinzento','A cor secundária, #A2A1A0, que acompanha o azul nas peças da marca.','bi-palette2',NULL,2,1,'2026-09-30 11:52:43',NULL),
(50,'Braille','A linha em pontos de Braille sob a palavra «Gov» lembra que um serviço público tem de ser acessível a todos.','bi-universal-access',NULL,3,1,'2026-09-30 11:52:43',NULL),
(51,'Missão','Prestar serviços de qualidade, cimentados em conhecimentos especializados em autarquias locais, trabalhando em prol das entidades políticas mais próximas da população.','bi-bullseye',NULL,4,1,'2026-09-30 11:52:43',NULL),
(52,'Valores','Experiência profissional, transparência, conhecimento, legalidade, prossecução do interesse público e boa administração.','bi-shield-check',NULL,5,1,'2026-09-30 11:52:43',NULL);
/*!40000 ALTER TABLE `heraldica_elementos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heraldica_pagina`
--

DROP TABLE IF EXISTS `heraldica_pagina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `heraldica_pagina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hero_kicker` varchar(150) DEFAULT 'Heráldica',
  `hero_titulo` varchar(255) NOT NULL DEFAULT 'Heráldica',
  `hero_subtitulo` text DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `texto_intro` text DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `fonte_texto` varchar(255) DEFAULT NULL,
  `fonte_url` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `atualizado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heraldica_pagina`
--

LOCK TABLES `heraldica_pagina` WRITE;
/*!40000 ALTER TABLE `heraldica_pagina` DISABLE KEYS */;
INSERT INTO `heraldica_pagina` VALUES
(1,'Identidade','Identidade GesGov','Logótipo, cores e valores da GesGov — Soluções Integradas para Autarquias.','O logótipo GesGov','Numa Junta de Freguesia, esta página mostra o brasão, a bandeira e o selo, com a ordenação heráldica publicada em Diário da República. No site de demonstração mostra a identidade da GesGov: o logótipo, as cores institucionais e os valores da empresa.','logo-gesgov.png','gesgov.pt — Sobre Nós','https://gesgov.pt/sobre-nos',1,NULL);
/*!40000 ALTER TABLE `heraldica_pagina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homepage_config`
--

DROP TABLE IF EXISTS `homepage_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `homepage_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hero_titulo` varchar(255) DEFAULT NULL,
  `hero_subtitulo` text DEFAULT NULL,
  `boasvindas_titulo` varchar(255) DEFAULT NULL,
  `boasvindas_texto` text DEFAULT NULL,
  `cta_titulo` varchar(255) DEFAULT NULL,
  `cta_texto` text DEFAULT NULL,
  `cta_botao_texto` varchar(120) DEFAULT NULL,
  `cta_botao_link` varchar(255) DEFAULT NULL,
  `mostrar_hero` tinyint(1) DEFAULT 1,
  `mostrar_boasvindas` tinyint(1) DEFAULT 1,
  `mostrar_pontos` tinyint(1) DEFAULT 1,
  `mostrar_mapa` tinyint(1) DEFAULT 1,
  `mostrar_noticias_eventos` tinyint(1) DEFAULT 1,
  `mostrar_servicos` tinyint(1) DEFAULT 1,
  `mostrar_cta_final` tinyint(1) DEFAULT 1,
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `galeria_kicker` varchar(150) DEFAULT 'Granho em imagens',
  `galeria_titulo` varchar(255) DEFAULT 'Uma freguesia com identidade',
  `mostrar_galeria` tinyint(1) DEFAULT 1,
  `presidente_titulo` varchar(255) DEFAULT 'Mensagem do Presidente',
  `presidente_mensagem` text DEFAULT NULL,
  `presidente_nome` varchar(255) DEFAULT NULL,
  `presidente_cargo` varchar(150) DEFAULT 'Presidente da Junta de Freguesia',
  `presidente_foto` varchar(255) DEFAULT NULL,
  `mostrar_mensagem_presidente` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homepage_config`
--

LOCK TABLES `homepage_config` WRITE;
/*!40000 ALTER TABLE `homepage_config` DISABLE KEYS */;
INSERT INTO `homepage_config` VALUES
(2,'GesGov — o site da sua Junta de Freguesia','Site de demonstração: notícias, agenda, serviços online, transparência e backoffice, com o conteúdo real da GesGov.','Bem-vindo ao site de demonstração da GesGov','Este é o site que a GesGov entrega às Juntas de Freguesia, preenchido com a informação da própria GesGov: a equipa no lugar do executivo, as notícias e a agenda da empresa, e as 50 autarquias parceiras. Explore as páginas e o backoffice.','Quer um site assim para a sua Junta?','Fale com a GesGov: 966 234 640 · geral@gesgov.pt','Contactar a GesGov','contactos.php',1,1,1,1,1,1,1,'2026-09-30 11:52:43','A GesGov em imagens','A GesGov em imagens',1,'Mensagem do Diretor Executivo','Pedro Miguel Ourives Prates é Licenciado em Gestão Autárquica e possui mais de 25 anos de experiência profissional junto de autarquias locais. Ao longo do seu percurso, desenvolveu competências em áreas centrais da administração pública, nomeadamente informática, contabilidade autárquica, gestão de património, contratação pública, gestão de recursos humanos, avaliação de desempenho de funcionários públicos (SIADAP), RGPD, licenciamentos no âmbito do regime jurídico das autarquias locais, análise e implementação de processos e procedimentos concursais.\n\nCom uma sólida formação académica em Gestão Autárquica e um profundo conhecimento da legislação aplicável às autarquias locais, especializou-se na análise, planeamento e implementação de soluções que visam aumentar a eficiência e transparência da administração pública.\n\n«É um passo importante no crescimento da GesGov, mas sobretudo um compromisso renovado com os nossos clientes. Queremos continuar a crescer com uma equipa especializada, disponível e próxima das Autarquias, contribuindo diariamente para uma gestão pública local mais eficiente.» — na inauguração do escritório no CAME, a 7 de setembro de 2026.','Pedro Miguel Ourives Prates','Diretor Executivo e fundador da GesGov','equipa-0.jpg',1);
/*!40000 ALTER TABLE `homepage_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homepage_destaque`
--

DROP TABLE IF EXISTS `homepage_destaque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `homepage_destaque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('slider','video') DEFAULT 'slider',
  `titulo` varchar(255) DEFAULT NULL,
  `subtitulo` text DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `video_ficheiro` varchar(255) DEFAULT NULL,
  `botao_texto` varchar(100) DEFAULT NULL,
  `botao_link` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homepage_destaque`
--

LOCK TABLES `homepage_destaque` WRITE;
/*!40000 ALTER TABLE `homepage_destaque` DISABLE KEYS */;
/*!40000 ALTER TABLE `homepage_destaque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homepage_galeria`
--

DROP TABLE IF EXISTS `homepage_galeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `homepage_galeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagem` varchar(255) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `ordem` int(11) DEFAULT 0,
  `ativo` tinyint(1) DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homepage_galeria`
--

LOCK TABLES `homepage_galeria` WRITE;
/*!40000 ALTER TABLE `homepage_galeria` DISABLE KEYS */;
/*!40000 ALTER TABLE `homepage_galeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_operacionais`
--

DROP TABLE IF EXISTS `logs_operacionais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_operacionais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `mensagem` text DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_operacionais`
--

LOCK TABLES `logs_operacionais` WRITE;
/*!40000 ALTER TABLE `logs_operacionais` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_operacionais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcacoes_atendimento`
--

DROP TABLE IF EXISTS `marcacoes_atendimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcacoes_atendimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cidadao_id` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `assunto` varchar(150) NOT NULL,
  `data_marcacao` date NOT NULL,
  `hora_marcacao` time NOT NULL,
  `mensagem` text DEFAULT NULL,
  `estado` enum('pendente','confirmada','cancelada','concluida') DEFAULT 'pendente',
  `resposta` text DEFAULT NULL,
  `criado_em` datetime DEFAULT current_timestamp(),
  `atualizado_em` datetime DEFAULT NULL,
  `responsavel` varchar(150) DEFAULT NULL,
  `observacoes_admin` text DEFAULT NULL,
  `tipo_atendimento` enum('presencial','virtual') NOT NULL DEFAULT 'presencial',
  `link_reuniao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcacoes_atendimento`
--

LOCK TABLES `marcacoes_atendimento` WRITE;
/*!40000 ALTER TABLE `marcacoes_atendimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `marcacoes_atendimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migracoes`
--

DROP TABLE IF EXISTS `migracoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migracoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ficheiro` varchar(190) NOT NULL,
  `aplicada_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `ficheiro` (`ficheiro`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migracoes`
--

LOCK TABLES `migracoes` WRITE;
/*!40000 ALTER TABLE `migracoes` DISABLE KEYS */;
INSERT INTO `migracoes` VALUES
(1,'001_tema_config.sql','2026-07-13 10:43:35'),
(2,'001_tema_config_seed.sql','2026-07-13 10:43:35'),
(3,'002_separadores_fundo.sql','2026-07-13 10:43:35'),
(4,'003_marca_logo.sql','2026-07-13 10:47:30'),
(5,'003_marca_logo_seed.sql','2026-07-13 10:47:30'),
(6,'004_faqs.sql','2026-07-13 10:56:20'),
(7,'005_galeria_albuns.sql','2026-07-13 11:11:33'),
(8,'006_evento_foco.sql','2026-07-13 11:29:30'),
(9,'007_perfis.sql','2026-07-13 14:49:37'),
(10,'008_tema_admin.sql','2026-07-13 14:55:50'),
(11,'008_tema_admin_seed.sql','2026-07-13 14:55:50'),
(12,'009_mensagem_presidente.sql','2026-07-13 15:25:57'),
(13,'010_alinhar_colunas.sql','2026-07-13 15:37:12'),
(14,'011_album_freguesia.sql','2026-07-13 20:35:28'),
(15,'012_albuns_pontos_existentes.sql','2026-07-13 20:56:25'),
(16,'013_mostrar_galeria.sql','2026-07-13 21:05:22'),
(17,'014_categorias.sql','2026-09-30 08:53:59'),
(18,'015_heraldica_elementos_imagem.sql','2026-09-30 08:53:59'),
(19,'016_eventos_inscricoes.sql','2026-09-30 08:53:59'),
(20,'017_eventos_campos_extra.sql','2026-09-30 08:53:59'),
(21,'018_contratacao_publica_pagina.sql','2026-09-30 08:53:59'),
(22,'019_procedimentos_concursais_campos.sql','2026-09-30 08:53:59'),
(23,'020_ocorrencias_avancado.sql','2026-09-30 08:53:59'),
(24,'021_ocorrencias_origem_estado_interno.sql','2026-09-30 08:53:59'),
(25,'022_ocorrencias_entidades_prioridades_estados_acoes.sql','2026-09-30 08:53:59'),
(26,'023_ocorrencias_tags_ordem.sql','2026-09-30 08:53:59'),
(27,'031_newsletter.sql','2026-09-30 08:53:59'),
(28,'032_eventos_coordenadas.sql','2026-09-30 08:53:59');
/*!40000 ALTER TABLE `migracoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelos_requerimentos`
--

DROP TABLE IF EXISTS `modelos_requerimentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelos_requerimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `tipo` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `ficheiro` varchar(255) NOT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  `criado_em` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelos_requerimentos`
--

LOCK TABLES `modelos_requerimentos` WRITE;
/*!40000 ALTER TABLE `modelos_requerimentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `modelos_requerimentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_config`
--

DROP TABLE IF EXISTS `newsletter_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_config` (
  `id` int(11) NOT NULL DEFAULT 1,
  `auto_ativo` tinyint(1) NOT NULL DEFAULT 0,
  `dia_envio` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `ultimo_envio` varchar(7) DEFAULT NULL,
  `conteudo_manual` longtext DEFAULT NULL,
  `destaque_tipo` enum('noticia','evento') DEFAULT NULL,
  `destaque_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_config`
--

LOCK TABLES `newsletter_config` WRITE;
/*!40000 ALTER TABLE `newsletter_config` DISABLE KEYS */;
INSERT INTO `newsletter_config` VALUES
(1,0,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `newsletter_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_envios`
--

DROP TABLE IF EXISTS `newsletter_envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_envios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mes_referencia` varchar(7) NOT NULL,
  `conteudo_html` longtext NOT NULL,
  `total_destinatarios` int(11) NOT NULL DEFAULT 0,
  `enviado_em` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_mes` (`mes_referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_envios`
--

LOCK TABLES `newsletter_envios` WRITE;
/*!40000 ALTER TABLE `newsletter_envios` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_subscribers`
--

DROP TABLE IF EXISTS `newsletter_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `origem` enum('site','manual') NOT NULL DEFAULT 'manual',
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_subscribers`
--

LOCK TABLES `newsletter_subscribers` WRITE;
/*!40000 ALTER TABLE `newsletter_subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `data` datetime DEFAULT current_timestamp(),
  `imagem_foco_x` tinyint(3) unsigned NOT NULL DEFAULT 50,
  `imagem_foco_y` tinyint(3) unsigned NOT NULL DEFAULT 50,
  `categoria` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
INSERT INTO `noticias` VALUES
(86,'Conflitos de interesses: entrada em vigor do modelo oficial adiada para 2027','A Portaria n.º 345-B/2026/1, de 14 de agosto, altera a Portaria n.º 185/2024/1 e adia para 31 de julho de 2027 a entrada em vigor do modelo de declaração de inexistência de conflitos de interesses aplicável às entidades públicas abrangidas pelo Regime Geral da Prevenção da Corrupção (RGPC).\n\nNa prática, esta alteração não cria um novo modelo nem elimina os deveres de isenção, imparcialidade e prevenção de favorecimento. O seu efeito é adiar a aplicação obrigatória do modelo de declaração aprovado pela Portaria n.º 185/2024/1, concedendo mais tempo às entidades para prepararem procedimentos, sistemas internos e ações de sensibilização.\n\nQuem está abrangido?\n\nMembros dos órgãos de administração, dirigentes e trabalhadores das entidades públicas abrangidas pelo RGPC.\n\nEm que situações se aplica a declaração?\n\nO modelo previsto destina-se aos procedimentos em que estas pessoas intervenham nas seguintes áreas:\n\ncontratação pública;\n\nconcessão de subsídios, subvenções ou benefícios;\n\nlicenciamentos urbanísticos, ambientais, comerciais e industriais;\n\nprocedimentos sancionatórios.\n\nObrigações a reter\n\nAté à entrada em vigor do modelo, as entidades devem manter e reforçar as medidas internas de prevenção de conflitos de interesses, assegurando a isenção e a imparcialidade de quem participa em decisões ou procedimentos.\n\nQuando exista, ou seja previsível, uma situação suscetível de comprometer a imparcialidade, a pessoa interveniente deve comunicá-la ao superior hierárquico ou, na sua ausência, ao responsável pelo cumprimento normativo, nos termos aplicáveis.\n\nO adiamento deve ser aproveitado para rever circuitos de decisão, definir responsáveis, preparar modelos e registos internos, formar as equipas e garantir que os processos estarão prontos para cumprir o regime a partir de 31 de julho de 2027.\n\nA Portaria n.º 345-B/2026/1 entrou em vigor em 15 de agosto de 2026 e produz efeitos desde 14 de agosto de 2024.','noticia-conflitos-de-interesses-entrada-em-vigor-do-modelo-oficial-adiada-para-2027.jpg','2026-08-14 00:00:00',50,50,'Institucional'),
(87,'GesGov Apoia as Festas de Casa Branca','A GesGov orgulha-se de ter apoiado as Festas Populares de Casa Branca, realizadas nos dias 14, 15 e 16 de agosto.\n\nEnquanto consultora dedicada às autarquias, acreditamos no potencial do interior, na proximidade às comunidades e na valorização das nossas raízes. É em Casa Branca que temos a nossa sede e é no concelho de Sousel, no CAME — Centro de Apoio ao Mundo Empresarial — que mantemos também o nosso escritório.\n\nApoiar estas festas foi, para nós, uma forma de celebrar a nossa terra, as suas tradições e todas as pessoas que a fazem crescer.\n\nDa nossa terra, para as autarquias de todo o país.','noticia-gesgov-apoia-as-festas-de-casa-branca.jpg','2026-08-15 00:00:00',50,50,'Eventos e Festividades'),
(88,'Código dos Contratos Públicos vai mudar: o que sabemos até agora','O Governo aprovou, em Conselho de Ministros, uma proposta de revisão do Código dos Contratos Públicos (CCP) — a maior reforma das regras da contratação pública desde 2017. A proposta esteve em consulta pública entre 8 e 21 de maio de 2026 e promete alterar de forma significativa a forma como municípios e freguesias contratam bens, serviços e empreitadas. Aguarda-se agora a publicação da versão final em Diário da República para que o novo regime entre em vigor.\n\nAinda antes dessa publicação, já é possível identificar as principais linhas da reforma:\n\n• Limiares mais altos para ajuste direto e consulta prévia — no ajuste direto, o limite para bens e serviços sobe de 20.000 € para 75.000 €, e para empreitadas sobe de 30.000 € para 150.000 € (mais do quíntuplo). Na consulta prévia, o limite para bens e serviços passa de 75.000 € para 130.000 €, e para empreitadas sobe de 150.000 € para 1.000.000 €. Na prática, muitas freguesias vão poder recorrer a procedimentos mais simples e rápidos num número bastante maior de contratações.\n\n• Princípio do \"só uma vez\" — as entidades e os operadores económicos deixam de ter de voltar a entregar documentos que já estejam na posse da Administração Pública, reduzindo a burocracia (o Governo estima uma poupança de mais de 3 milhões de documentos por ano).\n\n• Critérios de adjudicação mais amplos — além do preço, ganham peso critérios como a qualidade, a inovação e a sustentabilidade das propostas.\n\n• Digitalização e Inteligência Artificial — os procedimentos passam a poder integrar ferramentas digitais e de IA de apoio à análise e tramitação, mantendo garantias de transparência nas decisões.\n\n• \"Iniciativa espontânea\" — uma nova figura que permite a empresas e entidades apresentar à Administração soluções para necessidades públicas, ainda antes de existir um procedimento formal.\n\n• Revisão de preços obrigatória — passa a ser exigida em contratos de longa duração (superiores a três anos), para acautelar desequilíbrios financeiros supervenientes.\n\n• Reforço da resolução alternativa de litígios — com o objetivo de desbloquear processos com maior rapidez e menor custo.\n\nPara as freguesias, esta reforma representa uma oportunidade real de simplificar processos de contratação — mas exige também uma preparação atempada das equipas responsáveis, para que as novas regras sejam aplicadas com segurança desde o primeiro dia.\n\nSessões de esclarecimento GesGov\n\nPara apoiar os seus clientes e parceiros na compreensão e preparação para estas alterações, a GesGov irá realizar sessões de esclarecimento dedicadas às Alterações ao Código dos Contratos Públicos.\n\nConsulte a proposta\n\nO texto da proposta pode ser consultado na página oficial da consulta pública, em consultalex.gov.pt (ver também o comunicado do Portal BASE).\n\nSessões de esclarecimento GesGov\n\n- Comunicado do Conselho de Ministros de 16 de abril de 2026 (aprovação na generalidade) — portugal.gov.pt\n\n- Comunicado do Conselho de Ministros de 25 de junho de 2026 (Decreto-Lei aprovado) — portugal.gov.pt\n\n- Consulta Pública \"Alteração do Código dos Contratos Públicos\" (8–21 mai. 2026) — base.gov.pt e consultalex.gov.pt','noticia-reforma-do-codigo-dos-contratos-publicos.jpg','2026-08-28 00:00:00',50,50,'Institucional'),
(89,'Nova Newsletter GesGov: mais perto das Freguesias','A GesGov lança uma nova newsletter dedicada às freguesias — mais uma ferramenta pensada para aproximar a GesGov dos seus clientes e parceiros, mantendo-os informados, organizados e preparados para o dia a dia da gestão autárquica.\n\nSabemos que o quotidiano de uma freguesia é feito de prazos, novidades legislativas e desafios que exigem resposta rápida. Foi a pensar nisso que criámos uma newsletter simples e direta, com informação relevante entregue diretamente na caixa de correio dos nossos clientes e potenciais clientes.\n\nO que vai encontrar na newsletter GesGov\n\n• Notícias — acompanhamento das principais novidades legislativas e institucionais com impacto direto na atividade das freguesias (por exemplo, alterações ao Código dos Contratos Públicos, ao RGPD ou à contabilidade pública), explicadas em linguagem clara e acessível.\n\n• Eventos — informação sobre sessões de esclarecimento, webinars e formações organizadas pela GesGov e por outras entidades relevantes para o setor autárquico, para que nunca perca uma oportunidade de se atualizar.\n\n• Agenda de Obrigações Legais — um calendário prático com os principais prazos recorrentes que as freguesias têm de cumprir — como submissões à CGA, Segurança Social, Finanças, DGAL ou Tribunal de Contas — para que nenhuma data importante passe despercebida.\n\nCom esta newsletter, a GesGov reforça o seu compromisso de ser um parceiro próximo e atento às necessidades reais das freguesias, simplificando o acesso à informação que faz a diferença na gestão autárquica do dia a dia.\n\nSubscreva já\n\nA newsletter GesGov está disponível para clientes e potenciais clientes. Subscreva e comece a receber notícias, eventos e a agenda de obrigações legais diretamente no seu email.','noticia-nova-newsletter-gesgov-mais-perto-das-freguesias.jpg','2026-09-01 00:00:00',50,50,'Institucional'),
(90,'Setembro é mês de Assembleia de Freguesia Ordinária','Setembro é um dos meses em que se realiza, na generalidade das freguesias, uma sessão ordinária da Assembleia de Freguesia. Nos termos do artigo 9.º da Lei n.º 75/2013, de 12 de setembro (Regime Jurídico das Autarquias Locais), a Assembleia de Freguesia reúne várias vezes por ano em sessão ordinária, sendo esta uma das sessões-chave do calendário autárquico — momento em que se presta contas da atividade e situação financeira da freguesia e se decidem assuntos estruturantes para o mandato.\n\nA GesGov deixa aqui um alerta e um resumo dos pontos que, com maior frequência, integram a ordem de trabalhos destas sessões, para que juntas e assembleias de freguesia possam preparar a documentação com a devida antecedência.\n\nPontos mais comuns na ordem de trabalhos\n\n• Situação financeira e atividade da junta — apreciação da informação escrita do presidente da junta sobre a atividade e a situação financeira da freguesia, obrigatória em cada sessão ordinária (art. 9.º, n.º 2, alínea e) da Lei n.º 75/2013), devendo ser remetida aos membros da assembleia com, pelo menos, cinco dias de antecedência.\n\n• Revisões orçamentais — apreciação e votação de alterações às Grandes Opções do Plano e ao Orçamento da freguesia (art. 9.º, n.º 1, alínea a)).\n\n• Propostas de regulamentos — aprovação ou alteração de regulamentos externos da freguesia, como regulamentos de tarifas e taxas, de cemitérios ou de utilização de equipamentos e espaços públicos (art. 9.º, n.º 1, alínea f)).\n\n• Contratos de delegação de competências — autorização para a celebração, revisão ou cessação de contratos de delegação de competências e acordos de execução com a câmara municipal (art. 9.º, n.º 1, alínea g)).\n\n• Protocolos e acordos de colaboração — autorização para a celebração de protocolos com associações, IPSS, escolas ou outras entidades públicas e privadas que desenvolvam atividade na freguesia (art. 9.º, n.º 1, alíneas h), i) e j)).\n\nA composição concreta da ordem de trabalhos varia de freguesia para freguesia, consoante os assuntos pendentes em cada momento — a lista acima reúne os pontos que, na prática, surgem com maior regularidade nas convocatórias de sessões ordinárias consultadas pela GesGov.\n\nComo preparar a sessão\n\nRecomenda-se que a junta de freguesia reúna com antecedência toda a documentação de suporte (informação financeira, propostas de regulamento, minutas de contratos e protocolos), publicite atempadamente o edital e a convocatória e disponibilize os documentos aos membros da assembleia dentro dos prazos legais, de forma a permitir uma discussão informada em sessão.','noticia-setembro-e-mes-de-assembleia-de-freguesia-ordinaria.jpg','2026-09-01 00:00:00',50,50,'Institucional'),
(91,'Inauguração Escritório GesGov','A GesGov inicia uma nova etapa em Sousel!\n\nOntem foi um dia muito especial para toda a equipa GesGov: inaugurámos oficialmente o nosso novo escritório no CAME – Centro de Apoio às Microempresas, em Sousel.\n\nMais do que a abertura de um novo espaço, este momento representa a concretização de um projeto e, sobretudo, o reforço de um compromisso: estar cada vez mais próximos das autarquias, dos seus eleitos, trabalhadores e territórios.\n\nTivemos a honra de contar com a presença do Presidente do Município de Sousel, Eng.º Manuel Valério, bem como de autarcas da Junta de Freguesia de Casa Branca, Junta de Freguesia de Cano, Junta de Freguesia de Sousel, Junta de Freguesia de Fronteira, Freguesia Nª Srª Expectação Campo Maior, Freguesia São João Baptista, Junta de Freguesia de Vila Boim, Freguesia Avis, Freguesia de Ervedal, União das Freguesias de Benavila e Valongo e Freguesia de Rio de Moinhos - Borba.\n\nA todos os que estiveram connosco, e também aos muitos clientes, parceiros e amigos que nos fizeram chegar mensagens de felicitações e incentivo, deixamos o nosso sincero agradecimento. A vossa presença e as vossas palavras tornaram este momento ainda mais especial.\n\nFoi também a oportunidade de apresentarmos a equipa multidisciplinar que dá corpo a este projeto:\n\n• Pedro Prates — Gestor Autárquico\n\n• João Pinto — Técnico Oficial de Contas\n\n• Daniela Pegacho — Jurista\n\n• Carlos Baptista — Consultor Informático\n\n• Filipe Dordio — Engenheiro Informático\n\n• João Pereira — Marketing Digital e 3D\n\nÁreas diferentes, conhecimento especializado e um propósito comum.\n\nEsta é a equipa que estará sempre ao lado das autarquias, disponível para acrescentar e partilhar conhecimento, compreender desafios e encontrar soluções eficientes, eficazes e especializadas.\n\nAbrimos uma nova porta em Sousel, mas queremos, acima de tudo, abrir novas oportunidades de colaboração, proximidade e partilha com o Poder Local.\n\nObrigado a todos os que fizeram parte deste primeiro dia.\n\nContinuamos juntos. Continuamos próximos. Continuamos a construir a GesGov.','noticia-inauguracao-escritorio-gesgov.jpg','2026-09-07 00:00:00',50,50,'Institucional'),
(92,'GesGov inaugura novo escritório no CAME, em Sousel','A GesGov – Soluções Integradas para Autarquias inaugurou, no passado dia 7 de setembro, o seu novo escritório no CAME – Centro de Apoio às Microempresas, em Sousel, assinalando uma nova etapa no crescimento e consolidação da empresa.\n\nA inauguração contou com a presença do Presidente da Câmara Municipal de Sousel, Eng.º Manuel Valério, bem como de clientes, parceiros, colaboradores, amigos e convidados da GesGov, que se associaram a este momento particularmente importante para toda a equipa.\n\nAtualmente, a GesGov presta serviços de consultoria e apoio especializado a autarquias em diversas áreas da gestão pública local, designadamente contabilidade e gestão financeira, contratação pública, recursos humanos, SIADAP, RGPD, procedimentos concursais, consultoria jurídica e soluções de apoio administrativo e digital.\n\nO escritório de Sousel conta já com uma equipa de cerca de seis colaboradores, reunindo diferentes áreas de especialização e permitindo reforçar a capacidade de resposta e o acompanhamento próximo dos nossos clientes.\n\nA escolha do CAME para esta nova etapa permite igualmente à GesGov integrar um espaço vocacionado para o desenvolvimento da atividade empresarial, contribuindo simultaneamente para a criação de emprego qualificado e para a dinamização económica local.\n\nPara Pedro Prates, Diretor Executivo da GesGov, esta inauguração representa mais do que a abertura de um novo espaço físico:\n\n“É um passo importante no crescimento da GesGov, mas sobretudo um compromisso renovado com os nossos clientes. Queremos continuar a crescer com uma equipa especializada, disponível e próxima das Autarquias, contribuindo diariamente para uma gestão pública local mais eficiente.”\n\nA GesGov agradece, de forma especial, ao Exmo. Senhor Presidente da Câmara Municipal de Sousel, Eng.º Manuel Valério, a presença na inauguração e as palavras dirigidas à nossa equipa, bem como ao Município de Sousel pelo acolhimento e apoio nesta nova etapa.\n\nO nosso agradecimento estende-se igualmente a todos os clientes, parceiros, amigos e convidados que estiveram presentes e que tornaram este momento ainda mais especial.\n\nCrescemos, reforçamos a equipa e aumentamos a nossa capacidade de resposta, mantendo aquilo que está na origem da GesGov: estar próximos das Autarquias e das pessoas que todos os dias trabalham ao serviço das suas comunidades.\n\nA todos, o nosso muito obrigado por fazerem parte deste caminho.\n\nGesGov – Soluções Integradas para Autarquias','noticia-gesgov-inaugura-novo-escritorio-no-came-em-sousel.jpg','2026-09-10 00:00:00',50,50,'Institucional'),
(93,'Alteração à Lei dos Compromissos e Pagamentos em Atraso','Foi publicado o Decreto-Lei n.º 180/2026, de 9 de setembro, que altera o Decreto-Lei n.º 127/2012 e atualiza as regras de aplicação da Lei dos Compromissos e dos Pagamentos em Atraso (LCPA).\n\nO que muda?\n\nEntre as principais alterações destacamos:\n\n🔹 Pagamentos em atraso – passam a ser consideradas em atraso as contas que permaneçam por pagar para além dos prazos legais de 30 ou 60 dias;\n\n🔹 Fundos disponíveis – são atualizadas as regras para o seu apuramento, considerando fatores como a receita disponível, execução orçamental e cumprimento das metas;\n\n🔹 Receita efetiva própria – são introduzidos ajustamentos à forma como a previsão da receita é considerada no cálculo dos fundos disponíveis;\n\n🔹 Juros de mora – terminado o prazo legal de pagamento, o credor passa a ter expressamente reconhecido o direito aos juros de mora legais, sem necessidade de interpelação.\n\nO novo regime encontra-se em vigor desde 10 de setembro de 2026.\n\nPara as Autarquias Locais, estas alterações reforçam a necessidade de um acompanhamento rigoroso dos compromissos, fundos disponíveis, execução financeira e prazos de pagamento.\n\nConsulte o Decreto-Lei n.º 180/2026, de 9 de setembro, e acompanhe no site da GesGov a informação detalhada sobre esta alteração legislativa.\n\nGesGov – Soluções Integradas para Autarquias\n\nAo lado das Autarquias, acompanhando a legislação e apoiando a sua aplicação prática.','noticia-alteracao-a-lei-dos-compromissos-e-pagamentos-em-atraso.jpg','2026-09-14 00:00:00',50,50,'Institucional'),
(94,'GesGov reforça equipa multidisciplinar e amplia serviços especializados às Autarquias','Mais conhecimento. Mais especialização. Mais capacidade de resposta. Sempre próximos das Autarquias.\n\nA GesGov – Soluções Integradas para Autarquias reforçou a sua equipa multidisciplinar, reunindo profissionais de diferentes áreas de especialização com um objetivo comum: prestar às Autarquias Locais um serviço cada vez mais completo, próximo, especializado e orientado para a resolução dos seus desafios diários.\n\nEste reforço permite-nos aumentar a capacidade de resposta e consolidar um modelo de acompanhamento em que cada Autarquia pode contar com profissionais especializados nas diferentes áreas da gestão pública local.\n\nUma equipa multidisciplinar ao serviço das Autarquias\n\nPEDRO PRATES | CEO · GESTÃO AUTÁRQUICA\n\nLicenciado em Gestão Autárquica, desempenha funções junto das Autarquias Locais desde 2000.\n\nA sua experiência abrange áreas como informática, contabilidade, património, contratação pública, recursos humanos, SIADAP, licenciamentos e legislação autárquica.\n\nNa GesGov, assegura o acompanhamento presencial dos clientes, liderando particularmente as áreas de Contabilidade, Recursos Humanos e SIADAP.\n\nJOÃO PINTO | TÉCNICO OFICIAL DE CONTAS · ÁREA FINANCEIRA\n\nLicenciado em Gestão, Pós-Graduado em Contabilidade Pública – SNC-AP e Técnico Oficial de Contas, conta com 9 anos de experiência de trabalho com Autarquias, em empresas de contabilidade e de produção de software.\n\nÉ especializado na elaboração de relatórios financeiros, validação da situação financeira e preparação e submissão de mapas, assegurando na GesGov o acompanhamento personalizado dos clientes na área financeira das Freguesias.\n\nDANIELA PEGACHO | JURISTA · CONTRATAÇÃO PÚBLICA\n\nLicenciada em Direito e Mestre em Ciências Jurídico-Criminais, possui experiência em contratação pública, incluindo projetos de grande dimensão, tendo desempenhado funções na Comunidade Intermunicipal do Alto Alentejo e na Câmara Municipal de Sousel.\n\nEntre os projetos em que participou destaca-se a Barragem do Pisão, nomeadamente ao nível dos procedimentos de concursos públicos e pareceres jurídicos.\n\nNa GesGov, é responsável pelas áreas de Contratação Pública, Consultoria Jurídica, Regulamentos e Pareceres.\n\nCARLOS BAPTISTA | CONSULTORIA INFORMÁTICA · REDES E SISTEMAS\n\nCom formação especializada em informática, redes e sistemas e cerca de 40 anos de atividade profissional nas Tecnologias de Informação, possui uma vasta experiência em gestão de redes, sistemas, continuidade, segurança e organização tecnológica.\n\nNa GesGov, lidera a área de Consultoria Informática, apoiando as Autarquias na gestão, organização e segurança das suas infraestruturas tecnológicas.\n\nFILIPE DORDIO | ENGENHARIA INFORMÁTICA · PLATAFORMAS DIGITAIS\n\nLicenciado em Engenharia Informática – Engenharia de Software, desenvolve plataformas digitais simples, intuitivas e diferenciadoras, concebidas a partir das necessidades concretas dos seus utilizadores.\n\nNa GesGov, contribui para transformar a nossa ambição tecnológica em ferramentas digitais úteis, acessíveis e adaptadas à realidade das Autarquias.\n\nJOÃO PEREIRA | MARKETING DIGITAL · CONTEÚDOS\n\nLicenciado em Marketing Digital, desenvolve trabalho nas áreas de fotografia, vídeo, redes sociais, mailings, boletins de freguesia e visualização 3D.\n\nNa GesGov, trabalha a comunicação em articulação com as plataformas digitais, contribuindo para transformar informação institucional em conteúdos claros, próximos e consistentes, facilitando a comunicação das Autarquias com os seus cidadãos.\n\nSoluções integradas para a gestão autárquica\n\nCom esta equipa, a GesGov reforça a sua capacidade para disponibilizar um conjunto integrado de serviços especializados:\n\nContabilidade Pública · SNC-AP\n\nProcedimentos de Contratação Pública\n\nSIADAP\n\nProcessamento de Salários\n\nGestão e Registo de Inventário\n\nApoio Administrativo\n\nProcedimentos Concursais\n\nPlataformas Digitais\n\nRGPD\n\nConsultoria Jurídica\n\nConsultoria Informática\n\nFormação\n\nÁreas diferentes. Conhecimento especializado. Um propósito comum.\n\nEsta é a equipa que estará ao lado das Autarquias, disponível para acrescentar e partilhar conhecimento, compreender desafios e encontrar soluções eficientes, eficazes e especializadas.\n\nPorque acreditamos que uma Autarquia bem apoiada tem mais capacidade para se concentrar no que verdadeiramente importa: servir melhor a sua população.\n\nGesGov – Soluções Integradas para Autarquias\n\n🌐 www.gesgov.pt\n\nConhecimento especializado. Soluções integradas. Proximidade com as Autarquias.','noticia-gesgov-reforca-equipa-multidisciplinar-e-amplia-servicos-especializados-as-autarquias.jpg','2026-09-21 00:00:00',50,50,'Institucional');
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias_imagens`
--

DROP TABLE IF EXISTS `noticias_imagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticias_imagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noticia_id` int(11) NOT NULL,
  `ficheiro` varchar(255) NOT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `noticia_id` (`noticia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias_imagens`
--

LOCK TABLES `noticias_imagens` WRITE;
/*!40000 ALTER TABLE `noticias_imagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticias_imagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacoes`
--

DROP TABLE IF EXISTS `notificacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `mensagem` text NOT NULL,
  `tipo` enum('geral','urgente','evento','servico','documento') DEFAULT 'geral',
  `ativo` tinyint(1) DEFAULT 1,
  `criado_em` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacoes`
--

LOCK TABLES `notificacoes` WRITE;
/*!40000 ALTER TABLE `notificacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacoes_lidas`
--

DROP TABLE IF EXISTS `notificacoes_lidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacoes_lidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificacao_id` int(11) NOT NULL,
  `cidadao_id` int(11) NOT NULL,
  `lida_em` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unica_leitura` (`notificacao_id`,`cidadao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacoes_lidas`
--

LOCK TABLES `notificacoes_lidas` WRITE;
/*!40000 ALTER TABLE `notificacoes_lidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacoes_lidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocorrencias_acoes`
--

DROP TABLE IF EXISTS `ocorrencias_acoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocorrencias_acoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_acao` (`designacao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocorrencias_acoes`
--

LOCK TABLES `ocorrencias_acoes` WRITE;
/*!40000 ALTER TABLE `ocorrencias_acoes` DISABLE KEYS */;
INSERT INTO `ocorrencias_acoes` VALUES
(1,'Enviar por E-mail',10,1,'2026-09-30 08:53:59'),
(2,'Enviar por Ofício',20,1,'2026-09-30 08:53:59'),
(3,'Agendar Visita',30,1,'2026-09-30 08:53:59'),
(4,'Resolver Internamente',40,1,'2026-09-30 08:53:59'),
(5,'Arquivar sem Ação',50,1,'2026-09-30 08:53:59');
/*!40000 ALTER TABLE `ocorrencias_acoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocorrencias_assuntos`
--

DROP TABLE IF EXISTS `ocorrencias_assuntos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocorrencias_assuntos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `designacao` varchar(150) NOT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_categoria` (`categoria_id`),
  CONSTRAINT `fk_ocorrencias_assuntos_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `ocorrencias_categorias` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocorrencias_assuntos`
--

LOCK TABLES `ocorrencias_assuntos` WRITE;
/*!40000 ALTER TABLE `ocorrencias_assuntos` DISABLE KEYS */;
INSERT INTO `ocorrencias_assuntos` VALUES
(1,3,'Árvore/ramo em risco',20,1,'2026-09-30 08:53:59'),
(2,3,'Corte de relva/mato',10,1,'2026-09-30 08:53:59'),
(3,2,'Poste danificado',20,1,'2026-09-30 08:53:59'),
(4,2,'Candeeiro fundido',10,1,'2026-09-30 08:53:59'),
(5,1,'Dejetos de animais',30,1,'2026-09-30 08:53:59'),
(6,1,'Contentor danificado',20,1,'2026-09-30 08:53:59'),
(7,1,'Lixo acumulado',10,1,'2026-09-30 08:53:59'),
(8,4,'Passeio danificado',30,1,'2026-09-30 08:53:59'),
(9,4,'Sinalização em falta/danificada',20,1,'2026-09-30 08:53:59'),
(10,4,'Buraco na via',10,1,'2026-09-30 08:53:59');
/*!40000 ALTER TABLE `ocorrencias_assuntos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocorrencias_categorias`
--

DROP TABLE IF EXISTS `ocorrencias_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocorrencias_categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_categoria` (`designacao`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocorrencias_categorias`
--

LOCK TABLES `ocorrencias_categorias` WRITE;
/*!40000 ALTER TABLE `ocorrencias_categorias` DISABLE KEYS */;
INSERT INTO `ocorrencias_categorias` VALUES
(1,'Limpeza urbana',10,1,'2026-09-30 08:53:59'),
(2,'Iluminação pública',20,1,'2026-09-30 08:53:59'),
(3,'Espaços verdes',30,1,'2026-09-30 08:53:59'),
(4,'Vias e passeios',40,1,'2026-09-30 08:53:59'),
(5,'Sugestão',50,1,'2026-09-30 08:53:59'),
(6,'Outro',60,1,'2026-09-30 08:53:59');
/*!40000 ALTER TABLE `ocorrencias_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocorrencias_entidades_externas`
--

DROP TABLE IF EXISTS `ocorrencias_entidades_externas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocorrencias_entidades_externas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` varchar(150) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_entidade` (`designacao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocorrencias_entidades_externas`
--

LOCK TABLES `ocorrencias_entidades_externas` WRITE;
/*!40000 ALTER TABLE `ocorrencias_entidades_externas` DISABLE KEYS */;
INSERT INTO `ocorrencias_entidades_externas` VALUES
(1,'Junta de Freguesia',NULL,10,1,'2026-09-30 08:53:59'),
(2,'Câmara Municipal',NULL,20,1,'2026-09-30 08:53:59'),
(3,'GNR - Guarda Nacional Republicana',NULL,30,1,'2026-09-30 08:53:59'),
(4,'EDP/E-REDES',NULL,40,1,'2026-09-30 08:53:59'),
(5,'Serviços Municipalizados de Água e Saneamento',NULL,50,1,'2026-09-30 08:53:59');
/*!40000 ALTER TABLE `ocorrencias_entidades_externas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocorrencias_estados`
--

DROP TABLE IF EXISTS `ocorrencias_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocorrencias_estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(30) NOT NULL,
  `designacao` varchar(60) NOT NULL,
  `cor` varchar(20) NOT NULL DEFAULT '#495057',
  `valor_percentual` int(11) NOT NULL DEFAULT 0,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_estado_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocorrencias_estados`
--

LOCK TABLES `ocorrencias_estados` WRITE;
/*!40000 ALTER TABLE `ocorrencias_estados` DISABLE KEYS */;
INSERT INTO `ocorrencias_estados` VALUES
(1,'pendente','Pendente','#f59f00',15,10,1,'2026-09-30 08:53:59'),
(2,'em_analise','Em análise','#2563eb',55,20,1,'2026-09-30 08:53:59'),
(3,'resolvido','Resolvido','#2b8a3e',100,30,1,'2026-09-30 08:53:59'),
(4,'arquivado','Arquivado','#6b7280',100,40,1,'2026-09-30 08:53:59');
/*!40000 ALTER TABLE `ocorrencias_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocorrencias_prioridades`
--

DROP TABLE IF EXISTS `ocorrencias_prioridades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocorrencias_prioridades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(30) NOT NULL,
  `designacao` varchar(60) NOT NULL,
  `cor` varchar(20) NOT NULL DEFAULT '#495057',
  `ordem` int(11) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_prioridade_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocorrencias_prioridades`
--

LOCK TABLES `ocorrencias_prioridades` WRITE;
/*!40000 ALTER TABLE `ocorrencias_prioridades` DISABLE KEYS */;
INSERT INTO `ocorrencias_prioridades` VALUES
(1,'critico','Crítico','#c92a2a',10,1,'2026-09-30 08:53:59'),
(2,'urgente','Urgente','#e8590c',20,1,'2026-09-30 08:53:59'),
(3,'normal','Normal','#495057',30,1,'2026-09-30 08:53:59'),
(4,'baixo','Baixo','#adb5bd',40,1,'2026-09-30 08:53:59');
/*!40000 ALTER TABLE `ocorrencias_prioridades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocorrencias_tags`
--

DROP TABLE IF EXISTS `ocorrencias_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocorrencias_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designacao` varchar(100) NOT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_tag` (`designacao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocorrencias_tags`
--

LOCK TABLES `ocorrencias_tags` WRITE;
/*!40000 ALTER TABLE `ocorrencias_tags` DISABLE KEYS */;
INSERT INTO `ocorrencias_tags` VALUES
(1,'Urgente',0,1,'2026-09-30 08:53:59'),
(2,'Reincidente',0,1,'2026-09-30 08:53:59'),
(3,'Via pública',0,1,'2026-09-30 08:53:59'),
(4,'Zona escolar',0,1,'2026-09-30 08:53:59'),
(5,'Zona residencial',0,1,'2026-09-30 08:53:59');
/*!40000 ALTER TABLE `ocorrencias_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagina_freguesia`
--

DROP TABLE IF EXISTS `pagina_freguesia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagina_freguesia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hero_kicker` varchar(120) DEFAULT 'A Freguesia',
  `hero_titulo` varchar(255) DEFAULT 'Granho',
  `hero_subtitulo` text DEFAULT NULL,
  `hero_imagem` varchar(255) DEFAULT NULL,
  `intro_titulo` varchar(255) DEFAULT NULL,
  `intro_texto` longtext DEFAULT NULL,
  `historia_titulo` varchar(255) DEFAULT NULL,
  `historia_texto` longtext DEFAULT NULL,
  `identidade_titulo` varchar(255) DEFAULT NULL,
  `identidade_texto` longtext DEFAULT NULL,
  `patrimonio_titulo` varchar(255) DEFAULT NULL,
  `patrimonio_texto` longtext DEFAULT NULL,
  `localidades_titulo` varchar(255) DEFAULT NULL,
  `localidades_texto` text DEFAULT NULL,
  `galeria_titulo` varchar(255) DEFAULT NULL,
  `botao1_texto` varchar(120) DEFAULT NULL,
  `botao1_link` varchar(255) DEFAULT NULL,
  `botao2_texto` varchar(120) DEFAULT NULL,
  `botao2_link` varchar(255) DEFAULT NULL,
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagina_freguesia`
--

LOCK TABLES `pagina_freguesia` WRITE;
/*!40000 ALTER TABLE `pagina_freguesia` DISABLE KEYS */;
INSERT INTO `pagina_freguesia` VALUES
(1,'Sobre Nós','GesGov','Empresa especializada em consultoria autárquica — este é o site que entregamos às Juntas de Freguesia.','hero-escritorio.jpg','Quem somos','A GesGov é uma empresa especializada em consultoria autárquica, fundada em 2024 por Pedro Miguel Ourives Prates, Licenciado em Gestão Autárquica, com experiência em autarquias acumulada ao longo de 25 anos em funções técnicas e de coordenação em formação e implementação de sistemas informáticos.','Porque existimos','Desta experiência e da necessidade de mercado em recursos humanos qualificados, conhecedores de legislação específica para autarquias em áreas como contratação pública, procedimentos concursais, RGPD, SNC-AP ou SIADAP, e ainda de constantes desafios colocados ao funcionalismo público para desmaterialização de processos, automatização, sustentabilidade, eficiência e eficácia, surge a GesGov como resposta.','Missão','Prestar serviços de qualidade, cimentados em conhecimentos especializados em autarquias locais, trabalhando em prol das entidades políticas mais próximas da população, dotando os executivos e colaboradores de conhecimento e aptidão na gestão de uma autarquia.','O que fazemos','A GesGov tem serviços para autarquias em áreas como a informática, contabilidade, gestão de património, contratação pública, gestão de recursos humanos, avaliação de desempenho (SIADAP), licenciamentos, procedimentos concursais, RGPD, produção de sites para autarquias e elaboração de regulamentos internos e externos, e disponibiliza uma rede de parceiros com respostas concretas para as necessidades das autarquias.','Onde estamos','Casa Branca|Sede — Rua 5 de Outubro, n.º 8, 7470-118 Casa Branca\nSousel|Escritório — Zona Industrial de Sousel, Lote 5, Edifício CAME, 7470-200 Sousel','A GesGov em imagens','Conhecer a equipa','/executivo.php','Ver no mapa','/mapa.php','2026-09-30 11:52:43');
/*!40000 ALTER TABLE `pagina_freguesia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagina_historia`
--

DROP TABLE IF EXISTS `pagina_historia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagina_historia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hero_kicker` varchar(120) DEFAULT 'História',
  `hero_titulo` varchar(255) DEFAULT 'História da Freguesia',
  `hero_subtitulo` text DEFAULT NULL,
  `hero_imagem` varchar(255) DEFAULT NULL,
  `intro_titulo` varchar(255) DEFAULT NULL,
  `intro_texto` longtext DEFAULT NULL,
  `bloco1_titulo` varchar(255) DEFAULT NULL,
  `bloco1_texto` longtext DEFAULT NULL,
  `bloco2_titulo` varchar(255) DEFAULT NULL,
  `bloco2_texto` longtext DEFAULT NULL,
  `timeline_titulo` varchar(255) DEFAULT NULL,
  `timeline_texto` longtext DEFAULT NULL,
  `galeria_titulo` varchar(255) DEFAULT NULL,
  `botao1_texto` varchar(120) DEFAULT NULL,
  `botao1_link` varchar(255) DEFAULT NULL,
  `botao2_texto` varchar(120) DEFAULT NULL,
  `botao2_link` varchar(255) DEFAULT NULL,
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagina_historia`
--

LOCK TABLES `pagina_historia` WRITE;
/*!40000 ALTER TABLE `pagina_historia` DISABLE KEYS */;
INSERT INTO `pagina_historia` VALUES
(1,'História','A história da GesGov','Da experiência de 25 anos nas autarquias a uma equipa multidisciplinar ao lado das Freguesias.','noticia-inauguracao-escritorio-gesgov.jpg','Quem somos','A GesGov é uma empresa especializada em consultoria autárquica, fundada em 2024 por Pedro Miguel Ourives Prates, Licenciado em Gestão Autárquica, com experiência em autarquias acumulada ao longo de 25 anos em funções técnicas e de coordenação em formação e implementação de sistemas informáticos.\n\nDesta experiência e da necessidade de mercado em recursos humanos qualificados, conhecedores de legislação específica para autarquias em áreas como contratação pública, procedimentos concursais, RGPD, SNC-AP ou SIADAP, e ainda de constantes desafios colocados ao funcionalismo público para desmaterialização de processos, automatização, sustentabilidade, eficiência e eficácia, surge a GesGov como resposta.','Visão e valores','Visão: criar e prestar serviços de excelência para autarquias, criando espaços de conhecimento e formação direcionado a autarcas e colaboradores, com o objetivo de promover políticas planeadas na utilização de recursos de uma autarquia, cumprindo todos os requisitos legais, fomentando a transparência, eficiência e eficácia.\n\nValores: compromisso com as autarquias baseado em experiência profissional, transparência, conhecimento, e em princípios como a legalidade, prossecução do interesse público e boa administração.','Porque optar por apoio externo','As constantes alterações de legislação e a exigência crescente para com as autarquias locais, assim como a necessidade de acesso a informação fidedigna para a tomada de decisão, trouxe-nos novos desafios. Qualificar recursos humanos é um processo que requer conhecimentos e experiência. Recorrer a quadros técnicos qualificados e especializados externos é a opção financeiramente mais acessível, vantajosa, imediata e garante de eficiência e eficácia na gestão de recursos públicos.','Principais datas','2000|Pedro Prates começa a trabalhar junto das autarquias locais.\n2024|Fundação da GesGov, com sede em Casa Branca (Sousel).\nagosto de 2026|A GesGov apoia as Festas Populares de Casa Branca (14 a 16 de agosto).\nsetembro de 2026|Lançamento da newsletter GesGov para as freguesias.\n7 de setembro de 2026|Inauguração do escritório no CAME – Centro de Apoio às Microempresas, em Sousel, com o Presidente da Câmara Municipal de Sousel.\nsetembro de 2026|Reforço da equipa multidisciplinar: seis colaboradores e 50 autarquias parceiras.\noutubro–novembro de 2026|Plano de Formação GesGov: Montemor-o-Novo, Sesimbra, Samora Correia e Campo Maior.','A GesGov em imagens',NULL,NULL,NULL,NULL,'2026-09-30 11:52:43');
/*!40000 ALTER TABLE `pagina_historia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_mensagens`
--

DROP TABLE IF EXISTS `pedido_mensagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_mensagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `cidadao_id` int(11) DEFAULT NULL,
  `autor_tipo` enum('cidadao','admin') NOT NULL,
  `autor_nome` varchar(255) NOT NULL,
  `mensagem` text NOT NULL,
  `criado_em` datetime DEFAULT current_timestamp(),
  `lida` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_mensagens`
--

LOCK TABLES `pedido_mensagens` WRITE;
/*!40000 ALTER TABLE `pedido_mensagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_mensagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_timeline`
--

DROP TABLE IF EXISTS `pedido_timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `criado_em` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_timeline`
--

LOCK TABLES `pedido_timeline` WRITE;
/*!40000 ALTER TABLE `pedido_timeline` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_timeline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_typing`
--

DROP TABLE IF EXISTS `pedido_typing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_typing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `tipo` enum('cidadao','admin') NOT NULL,
  `atualizado_em` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `pedido_tipo_unique` (`pedido_id`,`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_typing`
--

LOCK TABLES `pedido_typing` WRITE;
/*!40000 ALTER TABLE `pedido_typing` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_typing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_emails_externos`
--

DROP TABLE IF EXISTS `pedidos_emails_externos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_emails_externos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `destinatario` varchar(255) NOT NULL,
  `assunto` varchar(255) NOT NULL,
  `corpo` text NOT NULL,
  `enviado_por_nome` varchar(150) DEFAULT NULL,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_pedido` (`pedido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_emails_externos`
--

LOCK TABLES `pedidos_emails_externos` WRITE;
/*!40000 ALTER TABLE `pedidos_emails_externos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_emails_externos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_funcionarios`
--

DROP TABLE IF EXISTS `pedidos_funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_funcionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_pedido_funcionario` (`pedido_id`,`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_funcionarios`
--

LOCK TABLES `pedidos_funcionarios` WRITE;
/*!40000 ALTER TABLE `pedidos_funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_imagens`
--

DROP TABLE IF EXISTS `pedidos_imagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_imagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `criado_em` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_imagens`
--

LOCK TABLES `pedidos_imagens` WRITE;
/*!40000 ALTER TABLE `pedidos_imagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_imagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_junta`
--

DROP TABLE IF EXISTS `pedidos_junta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_junta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) DEFAULT NULL,
  `cidadao_id` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `categoria` varchar(100) NOT NULL,
  `subcategoria` varchar(150) DEFAULT NULL,
  `assunto` varchar(255) NOT NULL,
  `mensagem` text NOT NULL,
  `localizacao` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'pendente',
  `resposta` text DEFAULT NULL,
  `criado_em` datetime DEFAULT current_timestamp(),
  `atualizado_em` datetime DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `publico` tinyint(1) DEFAULT 1,
  `operador_id` int(11) DEFAULT NULL,
  `prioridade` varchar(30) NOT NULL DEFAULT 'normal',
  `competencia` varchar(120) DEFAULT 'Junta de Freguesia',
  `origem` varchar(30) NOT NULL DEFAULT 'website',
  `estado_interno` varchar(30) NOT NULL DEFAULT 'por_tratar',
  `nome_original` varchar(255) DEFAULT NULL,
  `email_original` varchar(255) DEFAULT NULL,
  `telefone_original` varchar(50) DEFAULT NULL,
  `categoria_original` varchar(100) DEFAULT NULL,
  `subcategoria_original` varchar(150) DEFAULT NULL,
  `assunto_original` varchar(255) DEFAULT NULL,
  `mensagem_original` text DEFAULT NULL,
  `localizacao_original` varchar(255) DEFAULT NULL,
  `acao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_junta`
--

LOCK TABLES `pedidos_junta` WRITE;
/*!40000 ALTER TABLE `pedidos_junta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_junta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_notas_internas`
--

DROP TABLE IF EXISTS `pedidos_notas_internas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_notas_internas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `autor_nome` varchar(150) NOT NULL,
  `nota` text NOT NULL,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_pedido` (`pedido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_notas_internas`
--

LOCK TABLES `pedidos_notas_internas` WRITE;
/*!40000 ALTER TABLE `pedidos_notas_internas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_notas_internas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_tags`
--

DROP TABLE IF EXISTS `pedidos_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_pedido_tag` (`pedido_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_tags`
--

LOCK TABLES `pedidos_tags` WRITE;
/*!40000 ALTER TABLE `pedidos_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_tratamentos`
--

DROP TABLE IF EXISTS `pedidos_tratamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_tratamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `autor_nome` varchar(150) NOT NULL,
  `nota` text NOT NULL,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_pedido` (`pedido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_tratamentos`
--

LOCK TABLES `pedidos_tratamentos` WRITE;
/*!40000 ALTER TABLE `pedidos_tratamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_tratamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfis`
--

DROP TABLE IF EXISTS `perfis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `permissoes` text DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfis`
--

LOCK TABLES `perfis` WRITE;
/*!40000 ALTER TABLE `perfis` DISABLE KEYS */;
INSERT INTO `perfis` VALUES
(1,'Secretaria','Conteúdos do site e atendimento ao munícipe.','freguesia,home,virtual',1,'2026-07-13 14:49:37'),
(2,'Assembleia','Apenas a área da Assembleia de Freguesia.','assembleia',1,'2026-07-13 14:49:37'),
(3,'Conteúdos','Só notícias, eventos e restantes conteúdos.','freguesia,home',1,'2026-07-13 14:49:37');
/*!40000 ALTER TABLE `perfis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pontos_interesse`
--

DROP TABLE IF EXISTS `pontos_interesse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pontos_interesse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `localizacao` varchar(255) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pontos_interesse`
--

LOCK TABLES `pontos_interesse` WRITE;
/*!40000 ALTER TABLE `pontos_interesse` DISABLE KEYS */;
INSERT INTO `pontos_interesse` VALUES
(120,'Escritório GesGov — CAME, Sousel','Inaugurado a 7 de setembro de 2026 no CAME – Centro de Apoio às Microempresas, na Zona Industrial de Sousel. Conta com uma equipa de cerca de seis colaboradores, de diferentes áreas de especialização.','evento-convite-inauguracao-do-escritorio-gesgov-came-sousel.jpg','Zona Industrial de Sousel, Lote 5, Edifício CAME, 7470-200 Sousel','38.952806','-7.684907'),
(121,'Sede GesGov — Casa Branca','A sede da GesGov fica em Casa Branca, no concelho de Sousel. «É em Casa Branca que temos a nossa sede» — da notícia do apoio às Festas Populares de Casa Branca.','noticia-gesgov-apoia-as-festas-de-casa-branca.jpg','Rua 5 de Outubro, n.º 8, 7470-118 Casa Branca','38.9480072','-7.8109961');
/*!40000 ALTER TABLE `pontos_interesse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recursos_humanos_config`
--

DROP TABLE IF EXISTS `recursos_humanos_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recursos_humanos_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hero_kicker` varchar(150) DEFAULT 'Recursos Humanos',
  `hero_titulo` varchar(255) NOT NULL DEFAULT 'Recursos Humanos',
  `hero_subtitulo` text DEFAULT NULL,
  `intro_titulo` varchar(255) DEFAULT NULL,
  `intro_texto` text DEFAULT NULL,
  `destaque_1_titulo` varchar(150) DEFAULT NULL,
  `destaque_1_valor` varchar(100) DEFAULT NULL,
  `destaque_2_titulo` varchar(150) DEFAULT NULL,
  `destaque_2_valor` varchar(100) DEFAULT NULL,
  `destaque_3_titulo` varchar(150) DEFAULT NULL,
  `destaque_3_valor` varchar(100) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `atualizado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recursos_humanos_config`
--

LOCK TABLES `recursos_humanos_config` WRITE;
/*!40000 ALTER TABLE `recursos_humanos_config` DISABLE KEYS */;
INSERT INTO `recursos_humanos_config` VALUES
(2,'Recursos Humanos','Recursos Humanos','Transparência, mérito e valorização das pessoas ao serviço da freguesia.','Pessoas ao serviço da comunidade','Os trabalhadores da Junta de Freguesia são o principal motor da prestação de serviços de proximidade à população. A gestão de recursos humanos assenta num ambiente de trabalho colaborativo, baseado na responsabilidade, ética, respeito e dedicação ao serviço público, na formação contínua dos colaboradores para manter o conhecimento atualizado e melhorar a qualidade do serviço, no recrutamento e seleção por mérito, numa comunicação interna clara e alinhada com os objetivos estratégicos, e em medidas de bem-estar e equilíbrio entre vida profissional e pessoal.','Concursos a decorrer','Sem concursos a decorrer','Recrutamento','Seleção por mérito','Portais de emprego público','BEP, Portal do Emprego Público, DRE, GovGo',1,NULL);
/*!40000 ALTER TABLE `recursos_humanos_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recursos_humanos_documentos`
--

DROP TABLE IF EXISTS `recursos_humanos_documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recursos_humanos_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `categoria` enum('mapa_pessoal','recrutamento_concursos','avaliacao_siadap','plano_formacao','organigrama','transparencia_legislacao','outros') NOT NULL DEFAULT 'outros',
  `estado` enum('ativo','aberto','encerrado','arquivo') NOT NULL DEFAULT 'ativo',
  `descricao` text DEFAULT NULL,
  `ficheiro_original` varchar(255) DEFAULT NULL,
  `ficheiro_guardado` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `destaque` tinyint(1) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_categoria` (`categoria`),
  KEY `idx_estado` (`estado`),
  KEY `idx_ativo` (`ativo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recursos_humanos_documentos`
--

LOCK TABLES `recursos_humanos_documentos` WRITE;
/*!40000 ALTER TABLE `recursos_humanos_documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `recursos_humanos_documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requerimentos`
--

DROP TABLE IF EXISTS `requerimentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `requerimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cidadao_id` int(11) DEFAULT NULL,
  `codigo` varchar(50) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `tipo` varchar(150) NOT NULL,
  `assunto` varchar(255) NOT NULL,
  `mensagem` text DEFAULT NULL,
  `estado` enum('pendente','em_analise','deferido','indeferido','concluido') DEFAULT 'pendente',
  `resposta` text DEFAULT NULL,
  `criado_em` datetime DEFAULT current_timestamp(),
  `atualizado_em` datetime DEFAULT NULL,
  `documento_pdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requerimentos`
--

LOCK TABLES `requerimentos` WRITE;
/*!40000 ALTER TABLE `requerimentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `requerimentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requerimentos_ficheiros`
--

DROP TABLE IF EXISTS `requerimentos_ficheiros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `requerimentos_ficheiros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requerimento_id` int(11) NOT NULL,
  `ficheiro` varchar(255) NOT NULL,
  `nome_original` varchar(255) DEFAULT NULL,
  `criado_em` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requerimentos_ficheiros`
--

LOCK TABLES `requerimentos_ficheiros` WRITE;
/*!40000 ALTER TABLE `requerimentos_ficheiros` DISABLE KEYS */;
/*!40000 ALTER TABLE `requerimentos_ficheiros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seccoes_homepage`
--

DROP TABLE IF EXISTS `seccoes_homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `seccoes_homepage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chave` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `conteudo` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccoes_homepage`
--

LOCK TABLES `seccoes_homepage` WRITE;
/*!40000 ALTER TABLE `seccoes_homepage` DISABLE KEYS */;
/*!40000 ALTER TABLE `seccoes_homepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `separadores_fundo`
--

DROP TABLE IF EXISTS `separadores_fundo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `separadores_fundo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chave` varchar(60) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `atualizado_em` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `chave` (`chave`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `separadores_fundo`
--

LOCK TABLES `separadores_fundo` WRITE;
/*!40000 ALTER TABLE `separadores_fundo` DISABLE KEYS */;
INSERT INTO `separadores_fundo` VALUES
(163,'freguesia','sep-equipa.jpg','2026-09-30 11:52:43'),
(164,'historia','sep-equipa.jpg','2026-09-30 11:52:43'),
(165,'heraldica','sep-parceiros.jpg','2026-09-30 11:52:43'),
(166,'pontos','sep-equipa.jpg','2026-09-30 11:52:43'),
(167,'galeria','sep-equipa.jpg','2026-09-30 11:52:43'),
(168,'noticias','sep-noticias.jpg','2026-09-30 11:52:43'),
(169,'eventos','sep-noticias.jpg','2026-09-30 11:52:43'),
(170,'contactos','sep-parceiros.jpg','2026-09-30 11:52:43'),
(171,'executivo','sep-equipa.jpg','2026-09-30 11:52:43'),
(172,'associacoes','sep-parceiros.jpg','2026-09-30 11:52:43');
/*!40000 ALTER TABLE `separadores_fundo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides_homepage`
--

DROP TABLE IF EXISTS `slides_homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slides_homepage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `subtitulo` text DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `link_destino` varchar(255) DEFAULT NULL,
  `ativo` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides_homepage`
--

LOCK TABLES `slides_homepage` WRITE;
/*!40000 ALTER TABLE `slides_homepage` DISABLE KEYS */;
INSERT INTO `slides_homepage` VALUES
(44,'GesGov — Soluções Integradas para Autarquias','O site que entregamos às Juntas de Freguesia, com o conteúdo real da GesGov.','noticia-inauguracao-escritorio-gesgov.jpg','freguesia.php',1),
(45,'Uma equipa ao lado das Freguesias','Contabilidade, contratação pública, jurídico, informática e comunicação.','noticia-gesgov-reforca-equipa-multidisciplinar-e-amplia-servicos-especializados-as-autarquias.jpg','executivo.php',1),
(46,'Plano de Formação GesGov','Alterações ao CCP, LCPA e procedimentos de despesa pública — outubro e novembro de 2026.','evento-plano-de-formacao-gesgov-montemor-o-novo-alteracoes-ao-ccp-lcpa-e-procedimentos-de-despesa-publica.jpg','eventos.php',1);
/*!40000 ALTER TABLE `slides_homepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema_config`
--

DROP TABLE IF EXISTS `tema_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tema_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chave` varchar(60) NOT NULL,
  `valor` varchar(120) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `atualizado_em` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `chave` (`chave`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema_config`
--

LOCK TABLES `tema_config` WRITE;
/*!40000 ALTER TABLE `tema_config` DISABLE KEYS */;
INSERT INTO `tema_config` VALUES
(1,'fundo','#F6F8FB','Cor de fundo do site (body)','2026-09-30 11:52:43'),
(2,'topbar_bg','var(--cor-secundaria)','Fundo da barra de topo','2026-07-13 10:32:32'),
(3,'topbar_texto','#1E2329','Texto da barra de topo','2026-09-30 11:52:43'),
(4,'topbar_borda','var(--cor-principal)','Bordo inferior da barra de topo','2026-09-30 09:37:25'),
(5,'hero_1','#F6F8FB','Gradiente do herói — cor inicial','2026-09-30 11:52:43'),
(6,'hero_2','#DCE7F3','Gradiente do herói — cor final','2026-09-30 11:52:43'),
(7,'hero_texto','#1E2329','Texto dos heróis (sem imagem de fundo)','2026-09-30 11:52:43'),
(8,'acento','#2A8BC9','Cor de acento (bordos, kicker, badges)','2026-09-30 11:52:43'),
(9,'acento_escuro','#01478E','Acento escuro (texto do kicker, títulos do rodapé)','2026-09-30 11:52:43'),
(10,'footer_bg','#EEF2F7','Fundo do rodapé','2026-09-30 11:52:43'),
(11,'footer_texto','#3a3f47','Texto do rodapé','2026-07-13 10:32:32'),
(12,'kicker_img_texto','#CFE6F7','Texto do kicker quando o herói tem imagem de fundo','2026-09-30 11:52:43'),
(13,'tema_camada','1','1=aplica a camada de tema; 0=mantém o tema original das páginas','2026-07-13 10:39:24'),
(26,'logo_iniciais','GG','Iniciais da freguesia (fallback do logótipo no rodapé)','2026-09-30 11:52:43'),
(27,'favicon','favicon-gesgov.png','Ficheiro do favicon em assets/img/ (vazio = usa o logo)','2026-09-30 11:52:43'),
(30,'admin_escuro','#11151B','Tom escuro do backoffice (títulos, sidebar)','2026-07-13 14:55:50');
/*!40000 ALTER TABLE `tema_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gesgovdemo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
