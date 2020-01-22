-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Out-2019 às 12:24
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `fluxoalunos`
--
CREATE DATABASE IF NOT EXISTS `fluxoalunos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fluxoalunos`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `CodAluno` int(11) NOT NULL,
  `fk_CodUnidade` int(11) NOT NULL,
  `Nome` varchar(150) NOT NULL DEFAULT 'NULL',
  `sobrenome` varchar(40) NOT NULL DEFAULT 'NULL',
  `DataNascimento` date NOT NULL,
  `CPF` varchar(40) DEFAULT NULL,
  `fk_CodResponsavel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `aluno`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `bairro`
--

CREATE TABLE `bairro` (
  `CodBairro` int(11) NOT NULL,
  `Nome` varchar(125) DEFAULT NULL,
  `fk_CodCidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `bairro`
--



-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `CodCidade` int(11) NOT NULL,
  `fk_CodEstado` int(11) DEFAULT NULL,
  `Nome` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`CodCidade`, `fk_CodEstado`, `Nome`) VALUES
(1, 1, 'Sao Jose dos Pinhais'),
(2, 1, 'Pinhais'),
(3, 2, 'São Paulo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `CodContato` int(11) NOT NULL,
  `Descricao` varchar(35) DEFAULT NULL,
  `fk_codResponsavel` int(11) DEFAULT NULL,
  `fk_tipoContato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `contato`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `CodEstado` int(11) NOT NULL,
  `UF` char(3) DEFAULT NULL,
  `Nome` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`CodEstado`, `UF`, `Nome`) VALUES
(1, 'PR', 'Paraná'),
(2, 'SP', 'São paulo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `CodFuncionario` int(11) NOT NULL,
  `Nome` varchar(125) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionario`
--



-- --------------------------------------------------------

--
-- Estrutura da tabela `logradouro`
--

CREATE TABLE `logradouro` (
  `CodLogradouro` int(11) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `fk_TipoLogradouro` int(11) DEFAULT NULL,
  `CEP` int(11) DEFAULT NULL,
  `fk_CodBairro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `logradouro`
--



-- --------------------------------------------------------

--
-- Estrutura da tabela `registroocorrencia`
--

CREATE TABLE `registroocorrencia` (
  `NumRegistro` int(11) NOT NULL,
  `fk_CodAluno` int(11) DEFAULT NULL,
  `fk_TipoOcorrencia` int(11) DEFAULT NULL,
  `Observacao` text DEFAULT NULL,
  `DataOcorrencia` date DEFAULT NULL,
  `fk_CodFuncionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `registroocorrencia`
--



-- --------------------------------------------------------

--
-- Estrutura da tabela `responsavel`
--

CREATE TABLE `responsavel` (
  `CodResponsavel` int(11) NOT NULL,
  `RG` int(11) NOT NULL,
  `CPF` varchar(45) DEFAULT NULL,
  `DataNascimento` date DEFAULT NULL,
  `Nome` varchar(125) DEFAULT NULL,
  `fk_CodLogradouro` int(11) NOT NULL,
  `NumCasa` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Estrutura da tabela `tipocontato`
--

CREATE TABLE `tipocontato` (
  `CodTipo` int(11) NOT NULL,
  `Descricao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipocontato`
--

INSERT INTO `tipocontato` (`CodTipo`, `Descricao`) VALUES
(1, 'Telefone'),
(2, 'Email');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipologradouro`
--

CREATE TABLE `tipologradouro` (
  `CodTipo` int(11) NOT NULL,
  `NomeTipo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipologradouro`
--

INSERT INTO `tipologradouro` (`CodTipo`, `NomeTipo`) VALUES
(1, 'Rua'),
(2, 'Avenida');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoocorrencia`
--

CREATE TABLE `tipoocorrencia` (
  `CodOcorrencia` int(11) NOT NULL,
  `Descricao` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipoocorrencia`
--

INSERT INTO `tipoocorrencia` (`CodOcorrencia`, `Descricao`) VALUES
(1, 'Sair antecipado'),
(2, 'Chegar atrasado'),
(3, 'Gazear');

-- --------------------------------------------------------

--
-- Estrutura da tabela `unidade`
--

CREATE TABLE `unidade` (
  `CodUnidade` int(11) NOT NULL,
  `NomeUnidade` varchar(100) DEFAULT NULL,
  `CNPJ` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `unidade`
--

INSERT INTO `unidade` (`CodUnidade`, `NomeUnidade`, `CNPJ`) VALUES
(1, 'SESI', '03.802.018/0054-07'),
(2, 'SENAI', '03.776.284/0039-73');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`CodAluno`),
  ADD UNIQUE KEY `CPF_UNIQUE` (`CPF`);

--
-- Índices para tabela `bairro`
--
ALTER TABLE `bairro`
  ADD PRIMARY KEY (`CodBairro`);

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`CodCidade`);

--
-- Índices para tabela `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`CodContato`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`CodEstado`),
  ADD UNIQUE KEY `UF_UNIQUE` (`UF`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`CodFuncionario`);

--
-- Índices para tabela `logradouro`
--
ALTER TABLE `logradouro`
  ADD PRIMARY KEY (`CodLogradouro`),
  ADD UNIQUE KEY `CEP_UNIQUE` (`CEP`);

--
-- Índices para tabela `registroocorrencia`
--
ALTER TABLE `registroocorrencia`
  ADD PRIMARY KEY (`NumRegistro`),
  ADD KEY `fk_registroocorencia_aluno` (`fk_CodAluno`),
  ADD KEY `fk_registroocorencia_codfuncionario` (`fk_CodFuncionario`),
  ADD KEY `fk_registroocorrencia_TipoOcorrencia` (`fk_TipoOcorrencia`);

--
-- Índices para tabela `responsavel`
--
ALTER TABLE `responsavel`
  ADD PRIMARY KEY (`CodResponsavel`),
  ADD UNIQUE KEY `RG_UNIQUE` (`RG`),
  ADD UNIQUE KEY `CPF_UNIQUE` (`CPF`);

--
-- Índices para tabela `tipocontato`
--
ALTER TABLE `tipocontato`
  ADD PRIMARY KEY (`CodTipo`);

--
-- Índices para tabela `tipologradouro`
--
ALTER TABLE `tipologradouro`
  ADD PRIMARY KEY (`CodTipo`);

--
-- Índices para tabela `tipoocorrencia`
--
ALTER TABLE `tipoocorrencia`
  ADD PRIMARY KEY (`CodOcorrencia`);

--
-- Índices para tabela `unidade`
--
ALTER TABLE `unidade`
  ADD PRIMARY KEY (`CodUnidade`),
  ADD UNIQUE KEY `CNPJ_UNIQUE` (`CNPJ`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `CodAluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=337;

--
-- AUTO_INCREMENT de tabela `bairro`
--
ALTER TABLE `bairro`
  MODIFY `CodBairro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `CodCidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `contato`
--
ALTER TABLE `contato`
  MODIFY `CodContato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `CodEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `CodFuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `logradouro`
--
ALTER TABLE `logradouro`
  MODIFY `CodLogradouro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de tabela `registroocorrencia`
--
ALTER TABLE `registroocorrencia`
  MODIFY `NumRegistro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT de tabela `responsavel`
--
ALTER TABLE `responsavel`
  MODIFY `CodResponsavel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de tabela `tipocontato`
--
ALTER TABLE `tipocontato`
  MODIFY `CodTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tipologradouro`
--
ALTER TABLE `tipologradouro`
  MODIFY `CodTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tipoocorrencia`
--
ALTER TABLE `tipoocorrencia`
  MODIFY `CodOcorrencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `unidade`
--
ALTER TABLE `unidade`
  MODIFY `CodUnidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `registroocorrencia`
--
ALTER TABLE `registroocorrencia`
  ADD CONSTRAINT `fk_registroocorencia_aluno` FOREIGN KEY (`fk_CodAluno`) REFERENCES `aluno` (`CodAluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registroocorencia_codfuncionario` FOREIGN KEY (`fk_CodFuncionario`) REFERENCES `funcionario` (`CodFuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registroocorrencia_TipoOcorrencia` FOREIGN KEY (`fk_TipoOcorrencia`) REFERENCES `tipoocorrencia` (`CodOcorrencia`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
