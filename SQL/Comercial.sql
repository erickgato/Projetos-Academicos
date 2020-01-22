-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 11-Out-2019 às 18:21
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
-- Database: `erickgato`
--
CREATE DATABASE IF NOT EXISTS `erickgato` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `erickgato`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `telefone` varchar(10) DEFAULT NULL,
  `cidade` varchar(40) DEFAULT NULL,
  `UF` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`codigo`, `nome`, `telefone`, `cidade`, `UF`) VALUES
(100, 'Luis Paulo', '3355-1027', 'Curitiba', 'PR'),
(102, 'José antonio', '3453-3528', 'Lapa', 'PR'),
(105, 'Carlos Lima', '3233-3456', 'Joinville', 'SC'),
(110, 'Maria de Castro', '3441-8930', 'Ponta Grossa', 'PR'),
(114, 'Danilo Silva', '3353-4020', 'Curitiba', 'PR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

DROP TABLE IF EXISTS `estoque`;
CREATE TABLE IF NOT EXISTS `estoque` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(80) DEFAULT NULL,
  `un` varchar(40) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `estmin` int(11) DEFAULT NULL,
  `ptoped` int(11) DEFAULT NULL,
  `codfor` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_estoque_fornecedor` (`codfor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`codigo`, `descricao`, `un`, `preco`, `qtd`, `estmin`, `ptoped`, `codfor`) VALUES
(2000, 'Termômetro ', 'un', '12.00', 36, 5, 15, 501),
(2010, 'Termômetro digital', 'un', '36.00', 12, 5, 15, 501),
(2020, 'Compressa cirúrgica ', 'Pct c/10', '2.50', 40, 10, 50, 535),
(3004, 'Espaladrapo', 'R1 c/10m', '1.50', 130, 20, 100, 535),
(4011, 'Agulha\r\nDesc.\r\n10mmX1mm', 'Cx.\\r \\c/100 un', '25.00', 43, 15, 60, 550),
(4013, 'Agulha\r\nDesc.\r\n12mmX2mm', 'Cx.r c/100 un', '25.50', 43, 15, 60, 550),
(4025, 'Agulha\r\nDesc\r\n15mmX1mm', 'cx c/100 un', '38.00', 43, 15, 60, 550),
(5001, 'AP.Pressão', 'un', '205.00', 6, 1, 5, 590);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE IF NOT EXISTS `fornecedor` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `telefone` varchar(10) DEFAULT NULL,
  `cidade` varchar(40) DEFAULT NULL,
  `UF` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`codigo`, `nome`, `telefone`, `cidade`, `UF`) VALUES
(501, 'ABC Cirúrgica', '3772-4001', 'São paulo', 'SP'),
(502, 'Thermo', '38735030', 'Salvador', 'BA'),
(535, 'Distrib.Silva', '3444-5523', 'Joinville', 'SC'),
(550, 'CLS', '3352-2353', 'Curitiba', 'PR'),
(590, 'AKL Equip.', '330-8252', 'Porto Alegre', 'RS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens`
--

DROP TABLE IF EXISTS `itens`;
CREATE TABLE IF NOT EXISTS `itens` (
  `codped` int(11) NOT NULL,
  `coditem` int(11) NOT NULL,
  `qtdped` int(11) DEFAULT NULL,
  `subtotal` varchar(100) DEFAULT NULL,
  KEY `fk_itens_pedido` (`codped`),
  KEY `fk_itens_estoque` (`coditem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `itens`
--

INSERT INTO `itens` (`codped`, `coditem`, `qtdped`, `subtotal`) VALUES
(1, 2010, 3, '108.00'),
(1, 2020, 10, '25.00'),
(2, 3004, 30, '45.00'),
(3, 4011, 2, '50.00'),
(3, 4013, 5, '137.50'),
(3, 4025, 4, '152.00'),
(4, 3004, 20, '30.00'),
(5, 3004, 10, '15.00'),
(5, 4013, 5, '137.50');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `codigo` int(11) NOT NULL,
  `codcli` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_pedido_cliente` (`codcli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`codigo`, `codcli`, `data`, `valor`) VALUES
(1, 100, '2003-10-03', '133.00'),
(2, 102, '2003-10-04', '45.00'),
(3, 105, '2003-11-05', '339.50'),
(4, 110, '2003-11-10', '30.00'),
(5, 100, '2003-10-12', '152.50');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `fk_estoque_fornecedor` FOREIGN KEY (`codfor`) REFERENCES `fornecedor` (`codigo`);

--
-- Limitadores para a tabela `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `fk_itens_estoque` FOREIGN KEY (`coditem`) REFERENCES `estoque` (`codigo`),
  ADD CONSTRAINT `fk_itens_pedido` FOREIGN KEY (`codped`) REFERENCES `pedido` (`codigo`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`codcli`) REFERENCES `cliente` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
