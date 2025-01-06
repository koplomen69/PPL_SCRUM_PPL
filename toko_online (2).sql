-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2024 at 02:53 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksis`
--

CREATE TABLE `detail_transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_transaksi` bigint(20) UNSIGNED NOT NULL,
  `id_barang` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_transaksis`
--

INSERT INTO `detail_transaksis` (`id`, `id_transaksi`, `id_barang`, `qty`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 202406081, 1, 1, 24000, 1, '2024-06-08 07:41:24', '2024-06-08 07:41:39');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_06_07_030459_create_m_resis_table', 1),
(6, '2023_06_11_235625_create_products_table', 1),
(7, '2023_06_12_000108_create_transaksis_table', 1),
(8, '2023_07_29_011712_detail_transaksi', 1),
(9, '2023_08_05_094100_tbl_cart', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_resis`
--

CREATE TABLE `m_resis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `awb` varchar(255) NOT NULL,
  `logistic` varchar(255) NOT NULL,
  `warehouse` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(255) NOT NULL,
  `nama_product` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `kategory` varchar(255) NOT NULL,
  `harga` bigint(20) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `quantity_out` int(11) NOT NULL DEFAULT 0,
  `foto` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `nama_product`, `type`, `kategory`, `harga`, `discount`, `quantity`, `quantity_out`, `foto`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'BOOK001', 'The Great Adventure', 'book', 'fiction', 150000, 10, 50, 5, 'great_adventure.jpg', 1, NOW(), NOW()),
(2, 'BOOK002', 'Learning Laravel', 'book', 'programming', 200000, 15, 30, 10, 'learning_laravel.jpg', 1, NOW(), NOW()),
(3, 'BOOK003', 'History of Art', 'book', 'non-fiction', 120000, 5, 100, 20, 'history_of_art.jpg', 1, NOW(), NOW()),
(4, 'BOOK004', 'Web Development Basics', 'book', 'programming', 180000, 0, 40, 15, 'web_development_basics.jpg', 1, NOW(), NOW()),
(5, 'BOOK005', 'The Mystery Novel', 'book', 'fiction', 160000, 20, 60, 8, 'mystery_novel.jpg', 1, NOW(), NOW()),
(6, 'BOOK006', 'Advanced PHP Techniques', 'book', 'programming', 250000, 25, 25, 12, 'advanced_php.jpg', 1, NOW(), NOW()),
(7, 'BOOK007', 'Science of Cooking', 'book', 'non-fiction', 140000, 10, 80, 25, 'science_of_cooking.jpg', 1, NOW(), NOW()),
(8, 'BOOK008', 'The World of Shakespeare', 'book', 'literature', 130000, 0, 120, 50, 'shakespeare_world.jpg', 1, NOW(), NOW()),
(9, 'BOOK009', 'Introduction to Machine Learning', 'book', 'programming', 220000, 5, 60, 18, 'machine_learning.jpg', 1, NOW(), NOW()),
(10, 'BOOK010', 'Mystery in the Forest', 'book', 'fiction', 180000, 12, 45, 15, 'mystery_forest.jpg', 1, NOW(), NOW()),
(11, 'BOOK011', 'Web Design Principles', 'book', 'design', 170000, 20, 35, 5, 'web_design_principles.jpg', 1, NOW(), NOW()),
(12, 'BOOK012', 'Deep Dive into Algorithms', 'book', 'programming', 210000, 30, 50, 8, 'deep_dive_algorithms.jpg', 1, NOW(), NOW()),
(13, 'BOOK013', 'Understanding AI', 'book', 'non-fiction', 250000, 15, 90, 12, 'understanding_ai.jpg', 1, NOW(), NOW()),
(14, 'BOOK014', 'Learning Python for Beginners', 'book', 'programming', 160000, 18, 70, 10, 'learning_python.jpg', 1, NOW(), NOW()),
(15, 'BOOK015', 'Culinary Mastery', 'book', 'non-fiction', 140000, 10, 120, 40, 'culinary_mastery.jpg', 1, NOW(), NOW()),
(16, 'BOOK016', 'Graphic Design Fundamentals', 'book', 'design', 180000, 5, 40, 18, 'graphic_design.jpg', 1, NOW(), NOW()),
(17, 'BOOK017', 'Understanding Cloud Computing', 'book', 'programming', 200000, 0, 50, 30, 'cloud_computing.jpg', 1, NOW(), NOW()),
(18, 'BOOK018', 'Mastering Laravel', 'book', 'programming', 240000, 10, 45, 10, 'mastering_laravel.jpg', 1, NOW(), NOW()),
(19, 'BOOK019', 'Adventures in Space', 'book', 'fiction', 190000, 8, 80, 5, 'adventures_in_space.jpg', 1, NOW(), NOW()),
(20, 'BOOK020', 'The Art of Web Development', 'book', 'programming', 170000, 25, 60, 20, 'art_of_web_dev.jpg', 1, NOW(), NOW()),
(21, 'BOOK021', 'Building Your First App', 'book', 'programming', 150000, 15, 55, 12, 'first_app.jpg', 1, NOW(), NOW()),
(22, 'BOOK022', 'Philosophy of Mind', 'book', 'non-fiction', 210000, 0, 30, 15, 'philosophy_of_mind.jpg', 1, NOW(), NOW()),
(23, 'BOOK023', 'Digital Painting Techniques', 'book', 'art', 160000, 10, 25, 8, 'digital_painting.jpg', 1, NOW(), NOW()),
(24, 'BOOK024', 'JavaScript for Beginners', 'book', 'programming', 140000, 5, 60, 20, 'javascript_beginners.jpg', 1, NOW(), NOW()),
(25, 'BOOK025', 'Yoga for Beginners', 'book', 'health', 120000, 0, 100, 30, 'yoga_beginners.jpg', 1, NOW(), NOW()),
(26, 'BOOK026', 'Exploring the Universe', 'book', 'non-fiction', 220000, 18, 40, 18, 'exploring_universe.jpg', 1, NOW(), NOW()),
(27, 'BOOK027', 'Code Complete', 'book', 'programming', 260000, 25, 50, 15, 'code_complete.jpg', 1, NOW(), NOW()),
(28, 'BOOK028', 'Data Structures Simplified', 'book', 'programming', 180000, 12, 60, 20, 'data_structures.jpg', 1, NOW(), NOW()),
(29, 'BOOK029', 'Creative Writing 101', 'book', 'literature', 130000, 10, 45, 10, 'creative_writing_101.jpg', 1, NOW(), NOW()),
(30, 'BOOK030', 'Photography Fundamentals', 'book', 'art', 170000, 8, 70, 12, 'photography_fundamentals.jpg', 1, NOW(), NOW()),
(31, 'BOOK031', 'Designing for the Web', 'book', 'design', 190000, 20, 80, 18, 'designing_for_web.jpg', 1, NOW(), NOW()),
(32, 'BOOK032', 'The Great Gatsby', 'book', 'fiction', 160000, 10, 40, 10, 'great_gatsby.jpg', 1, NOW(), NOW()),
(33, 'BOOK033', 'The Art of Negotiation', 'book', 'self-help', 180000, 15, 50, 8, 'art_of_negotiation.jpg', 1, NOW(), NOW()),
(34, 'BOOK034', 'Building Scalable Apps', 'book', 'programming', 200000, 12, 30, 10, 'scalable_apps.jpg', 1, NOW(), NOW()),
(35, 'BOOK035', 'Digital Marketing Guide', 'book', 'marketing', 210000, 18, 60, 15, 'digital_marketing_guide.jpg', 1, NOW(), NOW()),
(36, 'BOOK036', 'Understanding Blockchain', 'book', 'programming', 230000, 10, 80, 18, 'understanding_blockchain.jpg', 1, NOW(), NOW()),
(37, 'BOOK037', 'Photography for Beginners', 'book', 'art', 140000, 5, 90, 30, 'photography_beginners.jpg', 1, NOW(), NOW()),
(38, 'BOOK038', 'Principles of Graphic Design', 'book', 'design', 200000, 8, 100, 20, 'graphic_design_principles.jpg', 1, NOW(), NOW()),
(39, 'BOOK039', 'Mastering CSS', 'book', 'programming', 150000, 10, 50, 5, 'mastering_css.jpg', 1, NOW(), NOW()),
(40, 'BOOK040', 'The Science of Happiness', 'book', 'self-help', 180000, 12, 60, 25, 'science_of_happiness.jpg', 1, NOW(), NOW()),
(41, 'BOOK041', 'Design Patterns in Java', 'book', 'programming', 220000, 15, 40, 8, 'design_patterns_java.jpg', 1, NOW(), NOW()),
(42, 'BOOK042', 'Introduction to Databases', 'book', 'programming', 160000, 20, 50, 12, 'intro_databases.jpg', 1, NOW(), NOW()),
(43, 'BOOK043', 'Building Your Personal Brand', 'book', 'self-help', 140000, 10, 60, 15, 'personal_brand.jpg', 1, NOW(), NOW()),
(44, 'BOOK044', 'The Power of Mindfulness', 'book', 'self-help', 150000, 25, 75, 20, 'mindfulness_power.jpg', 1, NOW(), NOW()),
(45, 'BOOK045', 'The Psychology of Color', 'book', 'design', 170000, 0, 50, 8, 'psychology_of_color.jpg', 1, NOW(), NOW()),
(46, 'BOOK046', 'The Future of AI', 'book', 'non-fiction', 210000, 15, 90, 5, 'future_of_ai.jpg', 1, NOW(), NOW()),
(47, 'BOOK047', 'Mastering the Art of Cooking', 'book', 'non-fiction', 230000, 10, 40, 12, 'mastering_cooking.jpg', 1, NOW(), NOW()),
(48, 'BOOK048', 'Fundamentals of JavaScript', 'book', 'programming', 180000, 20, 80, 25, 'fundamentals_javascript.jpg', 1, NOW(), NOW()),
(49, 'BOOK049', 'Digital Transformation', 'book', 'business', 250000, 12, 50, 10, 'digital_transformation.jpg', 1, NOW(), NOW()),
(50, 'BOOK050', 'The Digital Entrepreneur', 'book', 'business', 220000, 5, 65, 15, 'digital_entrepreneur.jpg', 1, NOW(), NOW());


-- --------------------------------------------------------

--
-- Table structure for table `tbl_carts`
--

CREATE TABLE `tbl_carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idUser` varchar(255) NOT NULL,
  `id_barang` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_carts`
--

INSERT INTO `tbl_carts` (`id`, `idUser`, `id_barang`, `qty`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'guest123', 1, 1, 24000, 1, '2024-06-08 07:41:20', '2024-06-08 07:41:24');

-- --------------------------------------------------------

--
-- Table structure for table `transaksis`
--

CREATE TABLE `transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code_transaksi` varchar(255) NOT NULL,
  `total_qty` varchar(255) NOT NULL,
  `total_harga` varchar(255) NOT NULL,
  `nama_customer` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_tlp` varchar(255) NOT NULL,
  `ekspedisi` varchar(255) NOT NULL,
  `status` enum('Unpaid','Paid') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksis`
--

INSERT INTO `transaksis` (`id`, `code_transaksi`, `total_qty`, `total_harga`, `nama_customer`, `alamat`, `no_tlp`, `ekspedisi`, `status`, `created_at`, `updated_at`) VALUES
(1, '202406081', '1', '35640', 'dedi manja', 'dedi manja', '123', 'jnt', 'Unpaid', '2024-06-08 07:41:39', '2024-06-08 07:41:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nik` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` int(11) NOT NULL DEFAULT 1,
  `is_mamber` tinyint(1) NOT NULL DEFAULT 1,
  `foto` varchar(255) NOT NULL DEFAULT 'default.png',
  `alamat` varchar(255) NOT NULL,
  `tlp` varchar(255) NOT NULL,
  `tglLahir` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `role` int(11) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nik`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `is_mamber`, `foto`, `alamat`, `tlp`, `tglLahir`, `is_active`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Member787', 'zulfa', 'zulfaazka354@yahoo.com', NULL, '$2y$10$a6sHSzICWPV6wxihyv9rIOMSnxBpiRYTFQ52JXeCyNbA8wx8DShvK', 1, 0, 'default.png', 'zulfa zulfa', '123', '2024-06-08', 1, 0, NULL, '2024-06-08 07:32:10', '2024-06-08 07:32:10'),
(2, '20240611765', 'Dr. Zackary Hoppe', 'xbeahan@example.net', NULL, '$2y$10$t9M8Oxr2OmHYP/obmOfmjedZkh6pwwb2smef2ioLq2bG/F0wA/hrS', 1, 0, 'default.png', '2946 Herman Turnpike\nNorth Sheilaview, NH 90192', '1-520-858-9763', '1985-05-05', 1, 1, NULL, '2024-06-11 13:31:40', '2024-06-11 13:31:40'),
(3, '20240611502', 'Prof. Aliya Schowalter', 'fritz45@example.org', NULL, '$2y$10$RmL.C4gVNR3EiUbtM9y9z.Q473t6GJAyF7pIg64ggxeULU07pYhCK', 1, 0, 'default.png', '9408 Angelina Drive Suite 296\nWest Ahmed, UT 05972', '(726) 663-7141', '1977-09-22', 1, 0, NULL, '2024-06-11 13:31:40', '2024-06-11 13:31:40'),
(4, '2024061116', 'Else O\'Reilly II', 'sritchie@example.org', NULL, '$2y$10$qPzwKUNbBxvIeKaPDsHhO.jVSu5JFGULbdv/Qw8e34Gy3rnSUj0tW', 1, 0, 'default.png', '6819 Maymie Rue Suite 704\nZoetown, WA 46063', '+19406043093', '1985-02-25', 1, 0, NULL, '2024-06-11 13:31:40', '2024-06-11 13:31:40'),
(5, '20240611141', 'Lambert Ortiz', 'enola03@example.net', NULL, '$2y$10$T6qWBAHSwkwAOaVywkxzk.ITzghO2x0DufF9oIPAc0AcyECO/xNBW', 1, 0, 'default.png', '685 Gilbert Falls\nIlenemouth, NY 46628-7237', '847.972.0814', '1994-06-15', 1, 0, NULL, '2024-06-11 13:31:40', '2024-06-11 13:31:40'),
(6, '20240611761', 'Elaina Shields', 'daphney.cronin@example.com', NULL, '$2y$10$0BEfOjCNhPi9FHk1Lj0fxuMGZ91CH55KkaVkP46U935RHYlNoe5bS', 1, 0, 'default.png', '3009 Berry Mountains\nPort Corrine, WI 62108-8747', '518-608-2071', '1985-09-24', 1, 1, NULL, '2024-06-11 13:31:40', '2024-06-11 13:31:40'),
(7, '2024061184', 'Ms. Margarita Purdy DDS', 'hoeger.breanna@example.org', NULL, '$2y$10$Ee7XOYRORMIICuN3QpZdDOL4EFL5EWDB4jJc09zqSMPvFCH20UCBS', 1, 0, 'default.png', '350 Raymundo Trail Suite 307\nKesslerside, AK 86442', '351-783-9333', '2015-10-27', 1, 0, NULL, '2024-06-11 13:31:40', '2024-06-11 13:31:40'),
(8, '20240611199', 'Gerald Kemmer', 'hpollich@example.org', NULL, '$2y$10$D34lPYXVm3Vg7iJRHvNY/eiilWMjdtX05SWepJcpUi8/A8nqmqkcO', 1, 0, 'default.png', '4472 Streich Key Apt. 835\nPort Marietta, ND 92522', '1-785-917-0155', '2000-04-14', 1, 0, NULL, '2024-06-11 13:31:40', '2024-06-11 13:31:40'),
(9, '20240611212', 'Reynold Ankunding', 'kschuster@example.org', NULL, '$2y$10$9Mbz1EsYQNSztek6CL9gMeYhr5zIUT5RVQvjrIncQlQqVhgxt5dLi', 1, 0, 'default.png', '52649 Streich Spring Apt. 541\nLaurenchester, FL 75063', '651.620.6979', '2006-01-30', 1, 1, NULL, '2024-06-11 13:31:40', '2024-06-11 13:31:40'),
(10, '2024061129', 'Ms. Violet Brekke', 'eward@example.net', NULL, '$2y$10$cMHF4lSS7M3FTvmfHz/OROPx9tE07q8SdEok.BNXJgPjT2MMyD6hW', 1, 0, 'default.png', '438 Jacobson Crest Suite 115\nRoslynmouth, GA 40491-8766', '+1 (559) 232-4068', '1998-10-23', 1, 0, NULL, '2024-06-11 13:31:40', '2024-06-11 13:31:40'),
(11, '20240611633', 'Michaela Bosco', 'dicki.allie@example.net', NULL, '$2y$10$xEO6jD4Mpa.PJrPwaH4pLedZCMdPMGGs3RVTM4XJvW5AzRsWIFsO2', 1, 0, 'default.png', '774 Virginie Estates\nDamonburgh, HI 09959-9243', '+1 (678) 529-2349', '1974-08-25', 1, 0, NULL, '2024-06-11 13:31:40', '2024-06-11 13:31:40'),
(12, '20240611830', 'Test User', 'test@example.com', NULL, '$2y$10$X1AzW9YGGavWS57ua9ShbexLDhY7ddQXJ7MMqjcnnNjfTd.i34zx2', 1, 0, 'default.png', '11098 Alvina Key Suite 182\nKulaston, AL 42600', '(802) 912-5555', '1974-03-03', 1, 0, NULL, '2024-06-11 13:31:40', '2024-06-11 13:31:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksis`
--
ALTER TABLE `detail_transaksis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_transaksis_id_barang_foreign` (`id_barang`);

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
-- Indexes for table `m_resis`
--
ALTER TABLE `m_resis`
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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_carts`
--
ALTER TABLE `tbl_carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_carts_id_barang_foreign` (`id_barang`);

--
-- Indexes for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `detail_transaksis`
--
ALTER TABLE `detail_transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `m_resis`
--
ALTER TABLE `m_resis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1102;

--
-- AUTO_INCREMENT for table `tbl_carts`
--
ALTER TABLE `tbl_carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksis`
--
ALTER TABLE `detail_transaksis`
  ADD CONSTRAINT `detail_transaksis_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `products` (`id`);

--
-- Constraints for table `tbl_carts`
--
ALTER TABLE `tbl_carts`
  ADD CONSTRAINT `tbl_carts_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
