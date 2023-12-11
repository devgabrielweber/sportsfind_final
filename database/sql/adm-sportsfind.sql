-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Dec 10, 2023 at 04:29 PM
-- Server version: 8.1.0
-- PHP Version: 8.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adm-sportsfind`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint UNSIGNED NOT NULL,
  `esporte` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exigeDocumento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint UNSIGNED NOT NULL,
  `nome` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `email`, `telefone`, `created_at`, `updated_at`) VALUES
(1, 'Cristiano Ronaldo', 'cr7@gmail.com', '(49) 98883-6841', '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(2, 'Lionel Messi', 'messi@gmail.com', '(49) 96846-6848', '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(3, 'Neymar Jr.', 'neymarjr@gmail.com', '(49) 98465-8974', '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(4, 'Paolo Maldini', 'maldini@gmail.com', '(49) 96485-3215', '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(5, 'Hiury', 'hyu@gmail.com', '(49) 98883-0613', '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(6, 'Weber', 'weber@gmail.com', '(49) 96516-7524', '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(7, 'Murilo', 'muriloviz@gmail.com', '(49) 98487-3265', '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(8, 'Riboli', 'ribolinho@gmail.com', '(49) 98521-6478', '2023-12-06 17:47:24', '2023-12-06 17:47:24');

-- --------------------------------------------------------

--
-- Table structure for table `documentos`
--

CREATE TABLE `documentos` (
  `id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `titular` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plano` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documentos`
--

INSERT INTO `documentos` (`id`, `cliente_id`, `titular`, `numero`, `foto`, `plano`, `created_at`, `updated_at`) VALUES
(2, 2, 'Messi', '30', 'messi.jpg', 'Plano Lenda', '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(3, 3, 'Neymar', '11', 'ney.jpg', 'Plano Starter', '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(4, 4, 'Paolo Maldini', '3', 'maldini.jpg', 'Plano Pro', '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(5, 5, 'Hiury', '3688', '20231206181002.png', 'Plano Pro', '2023-12-06 18:10:02', '2023-12-06 18:10:02'),
(6, 6, 'Weber', '14', '20231206181521.jpg', 'Plano Starter', '2023-12-06 18:11:39', '2023-12-06 18:15:22');

-- --------------------------------------------------------

--
-- Table structure for table `espacos`
--

CREATE TABLE `espacos` (
  `id` bigint UNSIGNED NOT NULL,
  `nome` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `esporte` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valorHora` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `espacos`
--

INSERT INTO `espacos` (`id`, `nome`, `esporte`, `endereco`, `descricao`, `foto`, `valorHora`, `created_at`, `updated_at`) VALUES
(2, 'Tennynson', 'Tênis | Tênis de Mesa', 'Rua das Cerejeiras, 42-E. Bairro Presidente Médici. Chapecó - SC', 'Espaço amplo com quadra para tênis e mesas para a prática de tênis de mesa/ping-pong. Contamos com todos os equipamentos já inclusos e ambiente diferenciado', 'foto2.jpg', 29.99, '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(3, 'Aqua Kingdom', 'Natação', 'Rua das Mangueiras, 526-D. Bairro Centro. Xaxim - SC', 'Espaço completo com piscina olímpica disponível para aluguel de equipes e delegações. Lanchonete próxima e academia.', 'foto3.jpg', 159.99, '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(4, 'Campo HS', 'Paintball', 'Rua das Araucárias, 76-D. Bairro Líder. Xanxerê - SC', 'Campo de paintball localizado na saída da cidade, com 2000 m² completamente ambientados para você se divertir com os amigos', 'foto4.jpg', 149.99, '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(5, 'Next Step Quadra', 'Futsal', 'Rua das Barões da Pisadinha, 776-E. Bairro Efapi. Chapecó - SC', 'Quadra coberta de futsal, conta com arquibancada, vestiários, bar, além de equipamentos e uniformes', 'foto5.jpg', 49.99, '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(6, 'liug', 'iliug', 'iugliu', 'ougou', '20231206180515.png', 57476.00, '2023-12-06 18:05:15', '2023-12-06 18:05:15'),
(7, 'marcos', 'marcos', 'marcos', 'marcos', '20231206180752.jpg', 1.99, '2023-12-06 18:07:52', '2023-12-06 18:07:52'),
(8, 'askjashd', 'qhkajsd', 'khakjskdhk', 'aksjdd', '20231206181718.jpg', 9666.00, '2023-12-06 18:17:18', '2023-12-06 18:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_22_175119_create_categorias_table', 1),
(6, '2023_11_22_175120_create_clientes_table', 1),
(7, '2023_11_22_175121_create_documentos_table', 1),
(8, '2023_11_22_175122_create_espacos_table', 1),
(9, '2023_11_22_175123_create_reservas_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservas`
--

CREATE TABLE `reservas` (
  `id` bigint UNSIGNED NOT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime NOT NULL,
  `valor` double(8,2) NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `espaco_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservas`
--

INSERT INTO `reservas` (`id`, `inicio`, `fim`, `valor`, `cliente_id`, `espaco_id`, `created_at`, `updated_at`) VALUES
(2, '2023-12-06 12:00:00', '2023-12-06 16:59:59', 119.99, 1, 3, '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(3, '2023-12-05 11:00:00', '2023-12-05 11:59:59', 49.99, 2, 2, '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(4, '2023-12-05 12:00:00', '2023-12-05 16:59:59', 429.99, 3, 4, '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(5, '2023-12-05 10:00:00', '2023-12-05 10:59:59', 49.99, 4, 4, '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(6, '2023-12-07 12:00:00', '2023-12-08 11:59:59', 1169.99, 5, 3, '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(7, '2023-12-06 12:00:00', '2023-12-06 12:30:00', 29.99, 6, 2, '2023-12-06 17:47:24', '2023-12-06 17:47:24'),
(9, '2023-12-06 12:00:00', '2023-12-06 12:30:00', 379.99, 8, 5, '2023-12-06 17:47:24', '2023-12-06 17:47:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documentos_cliente_id_foreign` (`cliente_id`);

--
-- Indexes for table `espacos`
--
ALTER TABLE `espacos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservas_cliente_id_foreign` (`cliente_id`),
  ADD KEY `reservas_espaco_id_foreign` (`espaco_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `espacos`
--
ALTER TABLE `espacos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `documentos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Constraints for table `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `reservas_espaco_id_foreign` FOREIGN KEY (`espaco_id`) REFERENCES `espacos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
