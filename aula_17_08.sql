-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Ago-2024 às 19:28
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `aula 17/08`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `animais`
--

CREATE TABLE `animais` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `especie` varchar(100) DEFAULT NULL,
  `raca` varchar(100) DEFAULT NULL,
  `fk_Clientes_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `animais`
--

INSERT INTO `animais` (`id`, `nome`, `especie`, `raca`, `fk_Clientes_id`) VALUES
(1, 'Rex', 'Cachorro', 'Labrador', 1),
(2, 'Miau', 'Gato', 'Siamês', 1),
(3, 'Rex', 'Cachorro', 'Poodle', 2),
(4, 'Fofinha', 'Coelho', 'Angorá', 3),
(5, 'Spike', 'Cachorro', 'Bulldog', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `telefone`, `endereco`) VALUES
(1, 'Maria Silva', '(11) 98765-4321', 'Rua A, 123'),
(2, 'João Santos', '(21) 91234-5678', 'Avenida B, 456'),
(3, 'Ana Oliveira', '(31) 99876-5432', 'Praça C, 789'),
(4, 'Carlos Pereira', '(41) 93456-7890', 'Rua D, 101'),
(5, 'Beatriz Lima', '(51) 92345-6789', 'Avenida E, 202');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'Ração Premium', 'Ração para cães adultos de alta qualidade', 120.00),
(2, 'Areia para Gato', 'Areia higiênica para gatos', 30.00),
(3, 'Brinquedo para Cachorro', 'Brinquedo durável para cães', 50.00),
(4, 'Cama para Cachorro', 'Cama confortável para cães grandes', 150.00),
(5, 'Cesta para Gato', 'Cesta macia para gatos', 80.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_animais`
--

CREATE TABLE `produtos_animais` (
  `fk_Animais_id` int(11) DEFAULT NULL,
  `fk_Produto_id` int(11) DEFAULT NULL,
  `data_uso_produto` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produtos_animais`
--

INSERT INTO `produtos_animais` (`fk_Animais_id`, `fk_Produto_id`, `data_uso_produto`) VALUES
(1, 1, '2024-08-01'),
(2, 2, '2024-08-02'),
(3, 3, '2024-08-03'),
(4, 5, '2024-08-04'),
(5, 4, '2024-08-05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'Banho e Tosa', 'Banho e corte de pelo para cães e gatos', 100.00),
(2, 'Consulta Veterinária', 'Consulta com médico veterinário', 200.00),
(3, 'Vacinação', 'Vacinação para cães e gatos', 150.00),
(4, 'Desverminação', 'Tratamento contra vermes', 75.00),
(5, 'Clínica de Emergência', 'Atendimento veterinário de emergência', 250.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos_animais`
--

CREATE TABLE `servicos_animais` (
  `fk_Animais_id` int(11) DEFAULT NULL,
  `fk_Servico_id` int(11) DEFAULT NULL,
  `data_servico` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `servicos_animais`
--

INSERT INTO `servicos_animais` (`fk_Animais_id`, `fk_Servico_id`, `data_servico`) VALUES
(1, 1, '2024-08-10'),
(2, 2, '2024-08-11'),
(3, 3, '2024-08-12'),
(4, 4, '2024-08-13'),
(5, 5, '2024-08-14');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `animais`
--
ALTER TABLE `animais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Animais_2` (`fk_Clientes_id`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produtos_animais`
--
ALTER TABLE `produtos_animais`
  ADD KEY `FK_Produtos_animais_1` (`fk_Animais_id`),
  ADD KEY `FK_Produtos_animais_2` (`fk_Produto_id`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `servicos_animais`
--
ALTER TABLE `servicos_animais`
  ADD KEY `FK_Servicos_animais_1` (`fk_Animais_id`),
  ADD KEY `FK_Servicos_animais_2` (`fk_Servico_id`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `animais`
--
ALTER TABLE `animais`
  ADD CONSTRAINT `FK_Animais_2` FOREIGN KEY (`fk_Clientes_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `produtos_animais`
--
ALTER TABLE `produtos_animais`
  ADD CONSTRAINT `FK_Produtos_animais_1` FOREIGN KEY (`fk_Animais_id`) REFERENCES `animais` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_Produtos_animais_2` FOREIGN KEY (`fk_Produto_id`) REFERENCES `produto` (`id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `servicos_animais`
--
ALTER TABLE `servicos_animais`
  ADD CONSTRAINT `FK_Servicos_animais_1` FOREIGN KEY (`fk_Animais_id`) REFERENCES `animais` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_Servicos_animais_2` FOREIGN KEY (`fk_Servico_id`) REFERENCES `servico` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
