-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2025 at 08:46 AM
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
-- Database: `db_examnavarro`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(81, '0001_01_01_000000_create_users_table', 1),
(82, '0001_01_01_000001_create_cache_table', 1),
(83, '0001_01_01_000002_create_jobs_table', 1),
(84, '2025_03_03_043103_create_roles_table', 1),
(85, '2025_03_03_043131_create_permissions_table', 1),
(86, '2025_03_03_043147_create_role_permission_table', 1),
(87, '2025_03_03_043204_create_role_user_table', 1),
(88, '2025_03_03_044115_create_tasks_table', 1);

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'create task', '2025-03-02 23:36:10', '2025-03-02 23:36:10'),
(2, 'edit task', '2025-03-02 23:36:10', '2025-03-02 23:36:10'),
(3, 'delete task', '2025-03-02 23:36:10', '2025-03-02 23:36:10'),
(4, 'view task', '2025-03-02 23:36:10', '2025-03-02 23:36:10');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2025-03-02 23:36:10', '2025-03-02 23:36:10'),
(2, 'manager', '2025-03-02 23:36:10', '2025-03-02 23:36:10'),
(3, 'user', '2025-03-02 23:36:10', '2025-03-02 23:36:10');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 2, 1, NULL, NULL),
(6, 2, 2, NULL, NULL),
(7, 2, 4, NULL, NULL),
(8, 3, 1, NULL, NULL),
(9, 3, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 3, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('VrmsNaK7Uc0yvctjwmXJARV6WuYQN9AXjzuRz4nn', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQThlRXhxZ3JJSEQyYXl1NmJyakFkYU1zT01YcHZXNHg3bVJtREl3MSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90YXNrcyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1740987967);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('todo','in-progress','done') NOT NULL,
  `priority` enum('high','medium','low') NOT NULL,
  `due_date` date NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `status`, `priority`, `due_date`, `file_path`, `user_id`, `archived`, `created_at`, `updated_at`) VALUES
(1, 'Fugiat cumque quam rem quo ipsa.', 'Dolor eveniet nesciunt esse et nemo eos. Autem expedita voluptatibus tempora et porro hic illum eveniet. Totam neque aut non non.', 'done', 'medium', '1986-07-23', 'C:\\Users\\Kip\\AppData\\Local\\Temp\\fak753C.tmp', 1, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(2, 'Dolor aspernatur corrupti nobis praesentium.', 'Autem quasi ut et doloribus sed omnis voluptatibus nam. Eligendi cupiditate hic dignissimos eum quis dolore voluptatum. Odit fugiat id est culpa voluptates officiis.', 'done', 'low', '2025-03-04', NULL, 1, 0, '2025-03-02 23:36:11', '2025-03-02 23:40:01'),
(3, 'Dolor nobis sint id vitae voluptate ut quis.', 'Laboriosam tempore officiis illo alias. Voluptates ut labore consequatur. Consequatur quam sapiente repellendus dolores velit.', 'in-progress', 'medium', '1978-02-26', NULL, 1, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(4, 'Sit eum doloremque eos dolorem aut debitis.', 'Qui ducimus accusamus nesciunt commodi. Autem quia neque voluptatum eveniet quia atque et. Voluptates quod laudantium quidem autem ullam omnis. Sit quaerat est quia sed quia.', 'todo', 'high', '2020-03-01', 'C:\\Users\\Kip\\AppData\\Local\\Temp\\fak753D.tmp', 1, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(5, 'Eveniet distinctio est mollitia harum autem accusantium fugit reiciendis.', 'Repudiandae mollitia eum est. Et aut est aut dolorem. Quaerat quisquam corrupti impedit est. Dicta ut tempora modi quaerat facilis illo vel.', 'todo', 'low', '1983-07-16', 'C:\\Users\\Kip\\AppData\\Local\\Temp\\fak753E.tmp', 1, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(6, 'Necessitatibus ut est accusamus quidem explicabo consequatur.', 'Accusantium ab quaerat necessitatibus adipisci cum est. Quos quisquam tempore perspiciatis nam laboriosam aut. Eum consectetur magni illo delectus ipsam. Repellat omnis qui in id.', 'done', 'medium', '1988-12-30', 'C:\\Users\\Kip\\AppData\\Local\\Temp\\fak754F.tmp', 1, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(7, 'In laboriosam odio eum natus libero.', 'Earum aliquam nam voluptatem quidem a molestiae. Deserunt atque iure repellat est voluptatem provident error rerum. Ad iste ut voluptatem.', 'in-progress', 'high', '2019-12-31', NULL, 2, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(8, 'Quis enim et voluptatem possimus id quasi.', 'Totam inventore in eveniet autem. Voluptatem sequi odit ex harum fugit sapiente eum. Mollitia qui itaque illum consectetur libero doloremque et. Vitae iure non minima officiis omnis a.', 'in-progress', 'medium', '2019-04-29', 'C:\\Users\\Kip\\AppData\\Local\\Temp\\fak7550.tmp', 2, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(9, 'A quo nihil voluptatum totam.', 'Rerum qui repudiandae consequatur voluptas enim. Corrupti illum qui nam amet veniam beatae quia sit. Nostrum ipsam eos cupiditate voluptatem voluptatem dignissimos. Ea modi modi dolor nobis consequatur similique asperiores.', 'in-progress', 'high', '2009-03-21', 'C:\\Users\\Kip\\AppData\\Local\\Temp\\fak7560.tmp', 2, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(10, 'Sunt voluptate et quod asperiores.', 'Autem laborum itaque eius enim totam voluptas ut. Dolore impedit vitae et saepe animi hic possimus. Modi id temporibus laudantium sunt ut est tempore.', 'done', 'low', '1982-03-19', 'C:\\Users\\Kip\\AppData\\Local\\Temp\\fak7561.tmp', 2, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(11, 'Voluptas dicta vero molestias aut et aut magni.', 'Vero adipisci velit soluta eos voluptas praesentium sint. Placeat autem asperiores sed aut sed sed possimus et. Fugiat maxime et ratione quo alias. Ad impedit ab itaque.', 'in-progress', 'high', '1995-10-13', 'C:\\Users\\Kip\\AppData\\Local\\Temp\\fak7562.tmp', 3, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(12, 'Rerum doloribus molestiae consequatur vel pariatur voluptate est laboriosam.', 'In aperiam eius necessitatibus nostrum et ut fugiat. Quis dolorem magni dolor consequatur. Nihil omnis commodi voluptatum velit cupiditate. Sit vero commodi consequuntur. Sed consectetur consequuntur magni suscipit consequatur sunt quia architecto.', 'todo', 'medium', '2004-05-21', 'C:\\Users\\Kip\\AppData\\Local\\Temp\\fak7573.tmp', 3, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(13, 'Fugiat fugiat in molestiae mollitia repudiandae.', 'Odit odio consequuntur aut magnam qui ut. Cumque minima dicta harum quia quam nesciunt suscipit.', 'todo', 'high', '2021-05-18', 'C:\\Users\\Kip\\AppData\\Local\\Temp\\fak7574.tmp', 3, 1, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(14, 'Et ut commodi aut magnam porro quia.', 'Impedit itaque nulla nobis assumenda iste nam. Repellat voluptatem aut quis qui numquam. Tempora nihil sequi sit.', 'todo', 'medium', '1982-03-26', 'C:\\Users\\Kip\\AppData\\Local\\Temp\\fak7575.tmp', 3, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(15, 'Vero illum doloribus fugiat a rerum id voluptatem.', 'Perspiciatis aperiam in dignissimos. Et voluptatum quae labore sunt. Quisquam iste dolores sed dolor tenetur facere consequatur veritatis. Quas quisquam nesciunt voluptatem et quaerat.', 'todo', 'medium', '1975-05-16', NULL, 3, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(16, 'Ipsum culpa doloribus iusto et.', 'Cumque velit perferendis beatae quaerat accusantium consequatur et. Labore reprehenderit molestiae fugit qui. Non est perferendis soluta tenetur. Sunt iste reiciendis aut et et distinctio. Quae beatae nobis quisquam nobis et autem.', 'todo', 'high', '1991-07-13', 'C:\\Users\\Kip\\AppData\\Local\\Temp\\fak7586.tmp', 3, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(17, 'Voluptas harum rerum aut in.', 'Soluta aspernatur exercitationem provident amet repellat cumque quos. Illo rerum eaque doloremque omnis ad incidunt. Consectetur ducimus sapiente facilis facilis id ipsam aut. Voluptas quasi nam qui architecto et excepturi.', 'done', 'low', '2002-12-23', NULL, 3, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(18, 'Rerum quos numquam magni quos expedita sit quo.', 'Et et exercitationem modi rerum. Nihil modi nemo ducimus. Deleniti eum ut quibusdam culpa vel. Debitis repellat praesentium odio qui.', 'in-progress', 'high', '1972-10-30', 'C:\\Users\\Kip\\AppData\\Local\\Temp\\fak7587.tmp', 3, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(19, 'Quo vero hic et minima ut sint cupiditate ipsam.', 'Provident velit quo sit minima rerum praesentium. Nihil tenetur reiciendis aliquid autem.', 'todo', 'medium', '1988-03-05', NULL, 3, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(20, 'Officia ut possimus eligendi architecto.', 'Quia molestias libero voluptatem et minima quibusdam nihil. Blanditiis nemo ut voluptas quo repellat quae. Animi id laborum magnam ducimus autem ut tempore voluptatem.', 'done', 'medium', '2009-08-20', NULL, 3, 0, '2025-03-02 23:36:11', '2025-03-02 23:36:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@example.com', NULL, '$2y$12$9ZKtgBuGESb9cQ9v8RMNTebqcGiNcpk/r2wFbHxJXasbrC4DOiTRO', NULL, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(2, 'Manager User', 'manager@example.com', NULL, '$2y$12$qu437BPYpaMwSCTIRvqcjuPzhIVAfdbFPat59xl1DUx6vUJDnhQ22', NULL, '2025-03-02 23:36:11', '2025-03-02 23:36:11'),
(3, 'Regular User', 'user@example.com', NULL, '$2y$12$5LWKc3.gnsHKCd5s1r86B.P704juDzCwXIqv7B0rGqFzCT5iE.XmS', NULL, '2025-03-02 23:36:11', '2025-03-02 23:36:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_permission_role_id_foreign` (`role_id`),
  ADD KEY `role_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
