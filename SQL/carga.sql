-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 17-Jun-2019 às 00:51
-- Versão do servidor: 5.7.24
-- versão do PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

DROP TABLE IF EXISTS `aluno`;
CREATE TABLE IF NOT EXISTS `aluno` (
  `aluno_id` int(11) NOT NULL,
  `ra` varchar(45) NOT NULL,
  PRIMARY KEY (`aluno_id`),
  UNIQUE KEY `ra_UNIQUE` (`ra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`aluno_id`, `ra`) VALUES
(1, '818101221'),
(2, '818101222'),
(3, '818143167'),
(4, '818143168'),
(5, '818143169'),
(6, '818143170'),
(7, '818143171'),
(8, '818143172'),
(9, '818143173'),
(10, '818143174'),
(11, '818143175'),
(12, '818143176'),
(13, '818143177'),
(14, '818143178'),
(15, '818143179'),
(16, '818143180'),
(17, '818143181'),
(18, '818143182'),
(19, '818143183'),
(20, '818143184'),
(21, '818143185'),
(22, '818143186'),
(23, '818143187'),
(24, '818143188'),
(25, '818143189'),
(26, '818143190'),
(27, '818143191'),
(28, '818143192'),
(29, '818143193'),
(30, '818143194'),
(32, '818143195'),
(33, '818143196'),
(34, '818143197'),
(35, '818143198'),
(36, '818143199'),
(37, '818143200'),
(38, '818143201'),
(39, '818143202'),
(40, '818143203'),
(41, '818143204'),
(42, '818143205'),
(43, '818143206'),
(44, '818143207'),
(45, '818143208'),
(46, '818143209'),
(47, '818143210'),
(48, '818143211'),
(49, '818143212'),
(50, '818143213'),
(51, '818143214'),
(52, '818143215'),
(53, '818143216'),
(54, '818143217'),
(55, '818143218'),
(56, '818143219'),
(57, '818143220'),
(58, '818143221'),
(59, '818143222'),
(60, '818143223'),
(61, '818143224'),
(62, '818143225'),
(63, '818143226'),
(64, '818143227'),
(65, '818143228'),
(66, '818143229'),
(67, '818143230'),
(68, '818143231'),
(69, '818143232'),
(70, '818143233'),
(71, '818143234'),
(72, '818143235'),
(73, '818143236'),
(74, '818143237'),
(75, '818143238'),
(76, '818143239'),
(77, '818143240'),
(78, '818143241'),
(79, '818143242'),
(81, '818143243'),
(82, '818143244'),
(83, '818143245'),
(84, '818143246'),
(85, '818143247'),
(86, '818143248'),
(87, '818143249'),
(88, '818143250'),
(89, '818143251'),
(90, '818143252'),
(91, '818143253'),
(92, '818143254'),
(93, '818143255'),
(94, '818143256'),
(95, '818143257'),
(97, '818143258'),
(98, '818143259'),
(99, '818143260'),
(100, '818143261'),
(101, '818143262'),
(102, '818143263'),
(103, '818143264'),
(104, '818143265'),
(105, '818143266'),
(106, '818143267'),
(107, '818143268'),
(108, '818143269'),
(109, '818143270'),
(110, '818143271'),
(111, '818143272'),
(112, '818143273'),
(113, '818143274'),
(114, '818143275'),
(115, '818143276'),
(116, '818143277'),
(117, '818143278'),
(118, '818143279'),
(119, '818143280'),
(120, '818143281'),
(96, '818143300'),
(31, '818144194'),
(80, '818144242');

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividade`
--

DROP TABLE IF EXISTS `atividade`;
CREATE TABLE IF NOT EXISTS `atividade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tema_id` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `formato_entrega` varchar(45) DEFAULT NULL,
  `dt_inicio` datetime DEFAULT NULL,
  `dt_fim` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_atividade_tema1_idx` (`tema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `atividade`
--

INSERT INTO `atividade` (`id`, `tema_id`, `numero`, `descricao`, `formato_entrega`, `dt_inicio`, `dt_fim`) VALUES
(1, 2, 1, 'Introdução a inteligência artificial.', 'Github', '2019-01-25 00:00:00', '2019-06-30 00:00:00'),
(2, 2, 2, 'Reconhecendo imagens.', 'Github', '2019-01-25 00:00:00', '2019-06-30 00:00:00'),
(3, 2, 3, 'Artigo sobre inteligência artificial.', 'E-mail', '2019-01-25 00:00:00', '2019-06-30 00:00:00'),
(4, 2, 4, 'TCC.', 'E-mail e Presencial', '2019-01-25 00:00:00', '2019-06-30 00:00:00'),
(5, 1, 1, 'Pesquisa sobre a origem da internet.', 'E-mail', '2019-01-11 00:00:00', '2019-06-30 00:00:00'),
(6, 1, 2, 'Evolução dos computadores.', 'E-mail', '2019-01-11 00:00:00', '2019-06-30 00:00:00'),
(7, 1, 3, 'Primeiro programa em C.', 'Github', '2019-06-30 00:00:00', '2019-06-30 00:00:00'),
(8, 1, 4, 'Introdução a POO.', 'Github', '2019-06-30 00:00:00', '2019-06-30 00:00:00'),
(9, 3, 1, 'Introdução a linguagem de programação JAVA', 'Github', '2019-01-18 00:00:00', '2019-06-18 00:00:00'),
(10, 3, 2, 'Programa de calculo de IMC.', 'Github', '2019-01-18 00:00:00', '2019-06-18 00:00:00'),
(11, 3, 3, 'CRUD.', 'Github', '2019-01-18 00:00:00', '2019-12-18 00:00:00'),
(12, 3, 4, 'Introdução ao JSP.', 'Github', '2019-01-18 00:00:00', '2019-11-18 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
CREATE TABLE IF NOT EXISTS `avaliacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entrega_id` int(11) NOT NULL,
  `turma_aluno_id` int(11) NOT NULL,
  `nota` decimal(4,2) DEFAULT NULL,
  `dt_avaliacao` datetime DEFAULT NULL,
  `comentarios` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Avaliacao_entregas1_idx` (`entrega_id`),
  KEY `fk_Avaliacao_Aluno_has_turma1_idx` (`turma_aluno_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `avaliacao`
--

INSERT INTO `avaliacao` (`id`, `entrega_id`, `turma_aluno_id`, `nota`, `dt_avaliacao`, `comentarios`) VALUES
(1, 1, 71, '9.85', '2019-06-17 00:00:00', 'Bom'),
(2, 1, 72, '9.73', '2019-06-17 00:00:00', 'Bom'),
(3, 1, 73, '9.80', '2019-06-17 00:00:00', 'Bom'),
(4, 1, 74, '9.85', '2019-06-17 00:00:00', 'Bom'),
(5, 1, 75, '9.85', '2019-06-17 00:00:00', 'Bom'),
(6, 5, 21, '7.85', '2019-06-17 00:00:00', 'Ok.'),
(7, 5, 22, '7.85', '2019-06-17 00:00:00', 'Ok.'),
(8, 5, 23, '7.85', '2019-06-17 00:00:00', 'Ok.'),
(9, 5, 24, '7.85', '2019-06-17 00:00:00', 'Ok.'),
(10, 5, 25, '7.85', '2019-06-17 00:00:00', 'Ok.'),
(11, 29, 11, '10.00', '2019-06-17 00:00:00', 'Excelente!'),
(12, 29, 12, '10.00', '2019-06-17 00:00:00', 'Excelente!'),
(13, 29, 13, '10.00', '2019-06-17 00:00:00', 'Excelente!'),
(14, 29, 14, '10.00', '2019-06-17 00:00:00', 'Excelente!');

-- --------------------------------------------------------

--
-- Estrutura da tabela `banca`
--

DROP TABLE IF EXISTS `banca`;
CREATE TABLE IF NOT EXISTS `banca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo_id` int(11) NOT NULL,
  `data` datetime DEFAULT NULL,
  `sala` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_banca_grupo1_idx` (`grupo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrega`
--

DROP TABLE IF EXISTS `entrega`;
CREATE TABLE IF NOT EXISTS `entrega` (
  `grupo_id` int(11) NOT NULL,
  `atividade_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_cadastro` datetime NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grupo_has_entregas_entregas1_idx` (`atividade_id`),
  KEY `fk_grupo_has_entregas_grupo1_idx` (`grupo_id`),
  KEY `idx_grupo_ativ` (`grupo_id`,`atividade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `entrega`
--

INSERT INTO `entrega` (`grupo_id`, `atividade_id`, `id`, `dt_cadastro`, `link`) VALUES
(14, 1, 1, '2019-06-03 00:00:00', 'https://github.com/'),
(14, 2, 2, '2019-06-02 00:00:00', 'https://github.com/'),
(14, 3, 3, '2019-06-05 00:00:00', NULL),
(14, 4, 4, '2019-06-13 00:00:00', NULL),
(1, 5, 5, '2019-06-26 00:00:00', NULL),
(1, 6, 6, '2019-06-26 00:00:00', NULL),
(1, 7, 7, '2019-06-26 00:00:00', 'https://github.com/'),
(1, 8, 8, '2019-06-26 00:00:00', 'https://github.com/'),
(6, 1, 9, '2019-06-26 00:00:00', 'https://github.com/'),
(6, 2, 10, '2019-06-26 00:00:00', 'https://github.com/'),
(6, 4, 11, '2019-06-26 00:00:00', NULL),
(7, 5, 12, '2019-06-26 00:00:00', NULL),
(7, 6, 13, '2019-06-26 00:00:00', NULL),
(8, 1, 14, '2019-06-26 00:00:00', 'https://github.com/'),
(8, 2, 15, '2019-06-26 00:00:00', 'https://github.com/'),
(8, 3, 16, '2019-06-26 00:00:00', 'https://github.com/'),
(3, 9, 17, '2019-06-09 00:00:00', 'https://github.com/'),
(3, 10, 18, '2019-06-09 00:00:00', 'https://github.com/'),
(3, 12, 19, '2019-01-18 00:00:00', 'https://github.com/'),
(3, 1, 20, '2019-01-18 00:00:00', 'https://github.com/'),
(5, 1, 21, '2019-01-18 00:00:00', 'https://github.com/'),
(5, 2, 22, '2019-01-18 00:00:00', 'https://github.com/'),
(5, 4, 23, '2019-01-18 00:00:00', NULL),
(9, 6, 24, '2019-01-18 00:00:00', NULL),
(9, 11, 25, '2019-01-18 00:00:00', 'https://github.com/'),
(9, 4, 26, '2019-01-18 00:00:00', NULL),
(2, 3, 27, '2019-06-02 00:00:00', 'https://github.com/'),
(2, 2, 28, '2019-06-02 00:00:00', 'https://github.com/'),
(2, 3, 29, '2019-06-02 00:00:00', NULL),
(2, 5, 30, '2019-06-02 00:00:00', NULL),
(10, 1, 31, '2019-06-02 00:00:00', 'https://github.com/'),
(10, 10, 32, '2019-06-02 00:00:00', 'https://github.com/'),
(10, 8, 33, '2019-06-02 00:00:00', 'https://github.com/'),
(10, 4, 34, '2019-06-02 00:00:00', NULL),
(11, 1, 35, '2019-06-02 00:00:00', 'https://github.com/'),
(11, 3, 36, '2019-06-02 00:00:00', 'https://github.com/'),
(11, 10, 37, '2019-06-02 00:00:00', 'https://github.com/'),
(11, 6, 38, '2019-06-02 00:00:00', NULL),
(11, 11, 39, '2019-06-02 00:00:00', 'https://github.com/'),
(12, 1, 40, '2019-06-02 00:00:00', 'https://github.com/'),
(12, 2, 41, '2019-06-02 00:00:00', 'https://github.com/'),
(12, 4, 42, '2019-06-02 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo`
--

DROP TABLE IF EXISTS `grupo`;
CREATE TABLE IF NOT EXISTS `grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orientador_id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grupo_Professor1_idx` (`orientador_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `grupo`
--

INSERT INTO `grupo` (`id`, `orientador_id`, `numero`, `nome`) VALUES
(1, 121, 1, 'CCP-01'),
(2, 121, 1, 'SI-01'),
(3, 121, 1, 'ECP-01'),
(4, 122, 1, 'ADS-01'),
(5, 122, 2, 'ECP-02'),
(6, 122, 2, 'CCP-02'),
(7, 123, 3, 'CCP-03'),
(8, 123, 4, 'CCP-04'),
(9, 123, 3, 'ECP-03'),
(10, 124, 2, 'SI-02'),
(11, 125, 3, 'SI-03'),
(12, 125, 4, 'SI-04'),
(13, 126, 2, 'ADS-02'),
(14, 126, 3, 'ADS-03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

DROP TABLE IF EXISTS `professor`;
CREATE TABLE IF NOT EXISTS `professor` (
  `professor_id` int(11) NOT NULL,
  `administrador` int(11) DEFAULT '0',
  `matricula` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`professor_id`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`),
  KEY `fk_Professor_Usuario_idx` (`professor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`professor_id`, `administrador`, `matricula`) VALUES
(121, 1, '201901'),
(122, 1, '201902'),
(123, 1, '201903'),
(124, 0, '201904'),
(125, 0, '201905'),
(126, 0, '201906'),
(127, 0, '201907');

-- --------------------------------------------------------

--
-- Estrutura da tabela `professores_banca`
--

DROP TABLE IF EXISTS `professores_banca`;
CREATE TABLE IF NOT EXISTS `professores_banca` (
  `banca_id` int(11) NOT NULL,
  `Professor_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avaliacao` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_banca_has_Professor_Professor1_idx` (`Professor_id`),
  KEY `fk_banca_has_Professor_banca1_idx` (`banca_id`),
  KEY `idx_banca_prof` (`banca_id`,`Professor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tema`
--

DROP TABLE IF EXISTS `tema`;
CREATE TABLE IF NOT EXISTS `tema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_cadastro` datetime DEFAULT NULL,
  `titulo` varchar(100) NOT NULL,
  `introducao` varchar(250) DEFAULT NULL,
  `requisitos` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tema`
--

INSERT INTO `tema` (`id`, `dt_cadastro`, `titulo`, `introducao`, `requisitos`) VALUES
(1, '2019-06-01 00:00:00', 'Tecnologia e Informatica.', NULL, NULL),
(2, '2019-06-01 00:00:00', 'Inteligência artificial.', NULL, NULL),
(3, '2019-06-01 00:00:00', 'Internet das coisas.', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

DROP TABLE IF EXISTS `turma`;
CREATE TABLE IF NOT EXISTS `turma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semestre_letivo` int(11) DEFAULT NULL,
  `ano_letivo` int(11) DEFAULT NULL,
  `sigla` varchar(45) DEFAULT NULL,
  `tema_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uk_sigla_ano_semestre` (`semestre_letivo`,`ano_letivo`,`sigla`),
  KEY `fk_turma_tema1_idx` (`tema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`id`, `semestre_letivo`, `ano_letivo`, `sigla`, `tema_id`) VALUES
(1, 1, 2019, 'SIN3AN', 1),
(2, 1, 2019, 'CCP3AN', 2),
(3, 1, 2019, 'ECP3AN', 2),
(4, 1, 2019, 'ADS1AN', 2),
(5, 2, 2018, 'SIN2AN', 3),
(6, 2, 2018, 'CCP2AN', 1),
(7, 2, 2018, 'ECP2AN', 1),
(8, 1, 2018, 'SIN1AN', 3),
(9, 1, 2018, 'ECP1AN', 3),
(10, 1, 2018, 'CCP1AN', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma_aluno`
--

DROP TABLE IF EXISTS `turma_aluno`;
CREATE TABLE IF NOT EXISTS `turma_aluno` (
  `Aluno_id` int(11) NOT NULL,
  `turma_id` int(11) NOT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_Aluno_has_turma_turma1_idx` (`turma_id`),
  KEY `fk_Aluno_has_turma_Aluno1_idx` (`Aluno_id`),
  KEY `fk_Aluno_has_turma_grupo1_idx` (`grupo_id`),
  KEY `idx_aluno_turma` (`Aluno_id`,`turma_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `turma_aluno`
--

INSERT INTO `turma_aluno` (`Aluno_id`, `turma_id`, `grupo_id`, `id`) VALUES
(1, 1, 2, 1),
(2, 1, 2, 2),
(3, 1, 2, 3),
(4, 1, 2, 4),
(5, 1, 2, 5),
(6, 1, 10, 6),
(7, 1, 10, 7),
(8, 1, 10, 8),
(9, 1, 10, 9),
(10, 1, 10, 10),
(11, 5, 2, 11),
(12, 5, 2, 12),
(13, 5, 2, 13),
(14, 5, 2, 14),
(15, 5, 10, 15),
(16, 8, 12, 16),
(17, 8, 12, 17),
(18, 8, 12, 18),
(19, 8, 12, 19),
(20, 8, 12, 20),
(21, 2, 1, 21),
(22, 2, 1, 22),
(23, 2, 1, 23),
(24, 2, 1, 24),
(25, 2, 1, 25),
(26, 2, 6, 26),
(27, 2, 6, 27),
(28, 2, 6, 28),
(29, 2, 6, 29),
(30, 2, 6, 30),
(31, 6, 7, 31),
(32, 6, 7, 32),
(33, 6, 7, 33),
(34, 6, 7, 34),
(35, 6, 7, 35),
(36, 6, 8, 36),
(37, 6, 8, 37),
(38, 6, 8, 38),
(39, 6, 8, 39),
(40, 6, 8, 40),
(41, 10, 8, 41),
(42, 10, 8, 42),
(43, 10, 8, 43),
(44, 10, 8, 44),
(45, 10, 8, 45),
(46, 3, 3, 46),
(47, 3, 3, 47),
(48, 3, 3, 48),
(49, 3, 3, 49),
(50, 3, 3, 50),
(51, 7, 9, 51),
(52, 7, 9, 52),
(53, 7, 9, 53),
(54, 7, 9, 54),
(55, 7, 9, 55),
(56, 9, 5, 56),
(57, 9, 5, 57),
(58, 9, 5, 58),
(59, 9, 5, 59),
(60, 9, 5, 60),
(61, 3, 9, 61),
(62, 3, 9, 62),
(63, 3, 9, 63),
(64, 3, 9, 64),
(65, 3, 9, 65),
(66, 3, 5, 66),
(67, 3, 5, 67),
(68, 3, 5, 68),
(69, 3, 5, 69),
(70, 3, 5, 70),
(71, 4, 14, 71),
(72, 4, 14, 72),
(73, 4, 14, 73),
(74, 4, 14, 74),
(75, 4, 14, 75);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'Bruno Rocha', 'brocha@usjt.br', 'aluno123'),
(2, 'Amadeu Rocha', 'arocha@usjt.br', 'aluno123'),
(3, 'Carlos Andrade', 'candrade@usjt.br', 'aluno123'),
(4, 'Lucas da Silva', 'lsilva@usjt.br', 'aluno123'),
(5, 'Venceslau Moura', 'vmoura@usjt.br', 'aluno123'),
(6, 'Katy Yamaha', 'kyamaha@usjt.br', 'aluno123'),
(7, 'Murillo da Silva', 'msilva@usjt.br', 'aluno123'),
(8, 'Mara Vasconcelos', 'mvasconcelos@usjt.br', 'aluno123'),
(9, 'Maira Castilho', 'mcastilho@usjt.br', 'aluno123'),
(10, 'Larissa Oliveira', 'loliveira@usjt.br', 'aluno123'),
(11, 'Paulo Lettang', 'plettang@usjt.br', 'aluno123'),
(12, 'Jane Sousa', 'j.sousa@usjt.br', 'aluno123'),
(13, 'Nathan Abravanel', 'nabravanel@usjt.br', 'aluno123'),
(14, 'José Almeida', 'jalmeida@usjt.br', 'aluno123'),
(15, 'Beatriz Matos', 'bmatos@usjt.br', 'aluno123'),
(16, 'Danielle Correia ', 'dcorreia@usjt.br', 'aluno123'),
(17, 'Naiara Bruzzao', 'nbruzzao@usjt.br', 'aluno123'),
(18, 'Naara Brito', 'nbrito@usjt.br', 'aluno123'),
(19, 'Janaina Sousa', 'jsousa@usjt.br', 'aluno123'),
(20, 'Bruno Rocha', 'bruno.rocha@usjt.br', 'aluno123'),
(21, 'Sara Campolina', 'scampolina@usjt.br', 'aluno123'),
(22, 'Nicholas Amaral', 'namaral@usjt.br', 'aluno123'),
(23, 'Maria da Rosas Pimentel', 'mpimentel@usjt.br', 'aluno123'),
(24, 'Luan Lima', 'llima@usjt.br', 'aluno123'),
(25, 'Paulo Porfirio', 'pporfirio@usjt.br', 'aluno123'),
(26, 'Emilly Moura', 'emoura@usjt.br', 'aluno123'),
(27, 'Lilian Navarro', 'lnavarro@usjt.br', 'aluno123'),
(28, 'Caio Pereira', 'cpereira@usjt.br', 'aluno123'),
(29, 'Samantha Alves', 'salves@usjt.br', 'aluno123'),
(30, 'Gabriel Moreira', 'gmoreira@usjt.br', 'aluno123'),
(31, 'Jaqueline Goes', 'jgoes@usjt.br', 'aluno123'),
(32, 'Bruna Simões', 'bsimoes@usjt.br', 'aluno123'),
(33, 'Carlos Garcia', 'c.garcia@usjt.br', 'aluno123'),
(34, 'Matheus Sousa', 'msousa@usjt.br', 'aluno123'),
(35, 'Patricia Almeida', 'palmeida@usjt.br', 'aluno123'),
(36, 'Jairo Lima', 'jlima@usjt.br', 'aluno123'),
(37, 'Amanda Botafogo', 'abotafogo@usjt.br', 'aluno123'),
(38, 'Roberta Cabral', 'rcabral@usjt.br', 'aluno123'),
(39, 'Camila Mendes', 'cmendes@usjt.br', 'aluno123'),
(40, 'Patricia Albuquerque ', 'palbuquerque@usjt.br', 'aluno123'),
(41, 'Leticia Leitão', 'lleitão@usjt.br', 'aluno123'),
(42, 'Renato Teixeira ', 'rteixeira@usjt.br', 'aluno123'),
(43, 'Beatriz Aragão ', 'baragão@usjt.br', 'aluno123'),
(44, 'Bruno Galhardo', 'bgalhardo@usjt.br', 'aluno123'),
(45, 'Horácio Marrero ', 'hmarrero@usjt.br', 'aluno123'),
(46, 'Marisa Padilha ', 'mpadilha@usjt.br', 'aluno123'),
(47, 'Renata Bogado ', 'rbogado@usjt.br', 'aluno123'),
(48, 'Abílio Mascarenhas ', 'amascarenhas@usjt.br', 'aluno123'),
(49, 'Anna Tabares', 'atabares@usjt.br', 'aluno123'),
(50, 'Florinda Ayres', 'fayres@usjt.br', 'aluno123'),
(51, 'Flávia Torcato ', 'ftorcato@usjt.br', 'aluno123'),
(52, 'Júlia Alves', 'jlves@usjt.br', 'aluno123'),
(53, 'Luzia Rabelo', 'lrabelo@usjt.br', 'aluno123'),
(54, 'Tália Guerrero ', 'tguerrero@usjt.br', 'aluno123'),
(55, 'Laura Prada', 'lprada@usjt.br', 'aluno123'),
(56, 'Camilo Piratininga', 'cpiratininga@usjt.br', 'aluno123'),
(57, 'Cleiton Faro', 'cfaro@usjt.br', 'aluno123'),
(58, 'Talita Villaça', 'tvillaca@usjt.br', 'aluno123'),
(59, 'Renan Couto', 'rcouto@usjt.br', 'aluno123'),
(60, 'Gina Magalhães', 'gmagalhaes@usjt.br', 'aluno123'),
(61, 'Josias Meneses', 'jmeneses@usjt.br', 'aluno123'),
(62, 'Ana Prada', 'aprada@usjt.br', 'aluno123'),
(63, 'Anna Garcia', 'agarcia@usjt.br', 'aluno123'),
(64, 'Cecília García', 'cgarcia@usjt.br', 'aluno123'),
(65, 'Fabiana Barreto', 'fbarreto@usjt.br', 'aluno123'),
(66, 'Gaspar Valiente', 'gvaliente@usjt.br', 'aluno123'),
(67, 'Iracema Estrella', 'iestrella@usjt.br', 'aluno123'),
(68, 'Luísa Moreno', 'lmoreno@usjt.br', 'aluno123'),
(69, 'Matias Souto', 'msouto@usjt.br', 'aluno123'),
(70, 'Reginaldo Matoso', 'rmatoso@usjt.br', 'aluno123'),
(71, 'Solange Peres', 'speres@usjt.br', 'aluno123'),
(72, 'Teodora Castella', 'tcastella@usjt.br', 'aluno123'),
(73, 'Ângela Pereira', 'apereira@usjt.br', 'aluno123'),
(74, 'Samuel Carballo', 'scarballo@usjt.br', 'aluno123'),
(75, 'Poliana Saloio', 'psaloio@usjt.br', 'aluno123'),
(76, 'Anabela Vilalobos', 'avilalobos@usjt.br', 'aluno123'),
(77, 'Caetano Silvestre', 'csilvestre@usjt.br', 'aluno123'),
(78, 'Isabelle Mourão', 'imourao@usjt.br', 'aluno123'),
(79, 'Casimiro Viveros', 'cviceros@usjt.br', 'aluno123'),
(80, 'Filinto Cordero', 'fscordero@usjt.br', 'aluno123'),
(81, 'Irene Morera', 'imorera@usjt.br', 'aluno123'),
(82, 'Carina Furquim', 'cfurquim@usjt.br', 'aluno123'),
(83, 'Rômulo   Hidalgo', 'rhidalgo@usjt.br', 'aluno123'),
(84, 'Filipa Novais', 'fnovais@usjt.br', 'aluno123'),
(85, 'Gláucio Álvares', 'g.alvares@usjt.br', 'aluno123'),
(86, 'Gláucio Álvares', 'galvares@usjt.br', 'aluno123'),
(87, 'Eunice Pestana', 'epestana@usjt.br', 'aluno123'),
(88, 'Milu Uchoa', 'muchoa@usjt.br', 'aluno123'),
(89, 'Paula Cachão', 'pcachao@usjt.br', 'aluno123'),
(90, 'Joel Ramires', 'jramires@usjt.br', 'aluno123'),
(91, 'Roni Cardoso', 'rcardoso@usjt.br', 'aluno123'),
(92, 'Emiliana Mafra', 'emafra@usjt.br', 'aluno123'),
(93, 'Leonor Figueiredo', 'lfigueiredo@usjt.br', 'aluno123'),
(94, 'Nádia Puerto', 'npuerto@usjt.br', 'aluno123'),
(95, 'Lucinda Falcão', 'lfalcao@usjt.br', 'aluno123'),
(96, 'Ângela Souto', 'asouto@usjt.br', 'aluno123'),
(97, 'Sérgio Barros', 'sbarros@usjt.br', 'aluno123'),
(98, 'Anita Sarabia', 'asarabia@usjt.br', 'aluno123'),
(99, 'Giovana Penha', 'gpenha@usjt.br', 'aluno123'),
(100, 'Viridiano Quinaz', 'vquinaz@usjt.br', 'aluno123'),
(101, 'Lília Pena', 'lpena@usjt.br', 'aluno123'),
(102, 'Napoleão Peláez', 'npelaez@usjt.br', 'aluno123'),
(103, 'Emília Varejão', 'evarejao@usjt.br', 'aluno123'),
(104, 'Raul Pacheco', 'rpacheco@usjt.br', 'aluno123'),
(105, 'Tainá Durán', 'tduran@usjt.br', 'aluno123'),
(106, 'Nídia Pirajá', 'npiraja@usjt.br', 'aluno123'),
(107, 'Fabiano Borja', 'fborja@usjt.br', 'aluno123'),
(108, 'Gláucio Junquera', 'gjunquera@usjt.br', 'aluno123'),
(109, 'Olívia Sobral', 'osobral@usjt.br', 'aluno123'),
(110, 'Alexandra Mendoça', 'amendoca@usjt.br', 'aluno123'),
(111, 'Alexandre Mangueira', 'amangueira@usjt.br', 'aluno123'),
(112, 'Caetano Linares', 'clinares@usjt.br', 'aluno123'),
(113, 'Clarisse Márquez', 'cmarquez@usjt.br', 'aluno123'),
(114, 'Elisabete Telles', 'etelles@usjt.br', 'aluno123'),
(115, 'Ofélia Marques', 'omarques@usjt.br', 'aluno123'),
(116, 'Ramiro Rangel', 'rrangel@usjt.br', 'aluno123'),
(117, 'Tânia Guedes', 'tguedes@usjt.br', 'aluno123'),
(118, 'Verônica Guedes', 'v.guedes@usjt.br', 'aluno123'),
(119, 'Verônica Guedes', 'vguedes@usjt.br', 'aluno123'),
(120, 'Noémia Brandán', 'nbrandan@usjt.br', 'aluno123'),
(121, 'Fernanda Araujo Azevedo', 'prof.fazevedo@usjt.br', 'prof123'),
(122, 'Camila Rocha Rodrigues', 'prof.crodrigues@usjt.br', 'prof123'),
(123, 'Ana Pinto Rocha', 'prof.apinto@usjt.br', 'prof123'),
(124, 'Renan Souza Melo', 'prof.rmelo@usjt.br', 'prof123'),
(125, 'Estevan Lima Pinto', 'prof.epinto@usjt.br', 'prof123'),
(126, 'Joao Lima Costa', 'prof.jcosta@usjt.br', 'prof123'),
(127, 'Gustavo Casagrande', 'casagrande@usjt.br', 'prof123');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `fk_Aluno_Usuario1` FOREIGN KEY (`aluno_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `atividade`
--
ALTER TABLE `atividade`
  ADD CONSTRAINT `fk_atividade_tema1` FOREIGN KEY (`tema_id`) REFERENCES `tema` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `fk_Avaliacao_Aluno_has_turma1` FOREIGN KEY (`turma_aluno_id`) REFERENCES `turma_aluno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Avaliacao_entregas1` FOREIGN KEY (`entrega_id`) REFERENCES `entrega` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `banca`
--
ALTER TABLE `banca`
  ADD CONSTRAINT `fk_banca_grupo1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `fk_grupo_has_entregas_entregas1` FOREIGN KEY (`atividade_id`) REFERENCES `atividade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grupo_has_entregas_grupo1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `fk_grupo_Professor1` FOREIGN KEY (`orientador_id`) REFERENCES `professor` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `fk_Professor_Usuario` FOREIGN KEY (`professor_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `professores_banca`
--
ALTER TABLE `professores_banca`
  ADD CONSTRAINT `fk_banca_has_Professor_Professor1` FOREIGN KEY (`Professor_id`) REFERENCES `professor` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_banca_has_Professor_banca1` FOREIGN KEY (`banca_id`) REFERENCES `banca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `fk_turma_tema1` FOREIGN KEY (`tema_id`) REFERENCES `tema` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `turma_aluno`
--
ALTER TABLE `turma_aluno`
  ADD CONSTRAINT `fk_Aluno_has_turma_Aluno1` FOREIGN KEY (`Aluno_id`) REFERENCES `aluno` (`aluno_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Aluno_has_turma_grupo1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Aluno_has_turma_turma1` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
