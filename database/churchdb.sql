-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2022 at 09:39 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `churchdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `by_who` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `stop_date` date NOT NULL,
  `start_time` time NOT NULL,
  `stop_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `male` bigint(20) NOT NULL,
  `female` bigint(20) NOT NULL,
  `children` bigint(20) NOT NULL,
  `service_types_id` bigint(20) UNSIGNED NOT NULL,
  `attendance_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `collections_types_id` bigint(20) UNSIGNED NOT NULL,
  `service_types_id` bigint(20) UNSIGNED NOT NULL,
  `amount` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collections_commissions`
--

CREATE TABLE `collections_commissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `settled` tinyint(1) NOT NULL DEFAULT 0,
  `collection_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collections_types`
--

CREATE TABLE `collections_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections_types`
--

INSERT INTO `collections_types` (`id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Special_Offering', '2022-05-03 23:32:17', '2022-05-03 23:32:17'),
(2, 1, 'Special_offering', '2022-05-03 23:32:41', '2022-05-03 23:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `by_who` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assign_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `title` enum('Mr','Mrs','Miss','Dr (Mrs)','Dr','Prof','Chief','Chief (Mrs)','Engr','Surveyor','HRH','Elder','Oba','Olori') COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` enum('worker','senior pastor','pastor','elder','usher','member','chorister','technician','instrumentalist','deacon','deaconess','evangelist','minister','protocol') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `marital_status` enum('married','single') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_since` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wedding_anniversary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `relative` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_status` enum('old','new') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'old',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `branch_id`, `title`, `firstname`, `lastname`, `email`, `dob`, `phone`, `occupation`, `position`, `address`, `address2`, `postal`, `city`, `state`, `country`, `sex`, `marital_status`, `member_since`, `wedding_anniversary`, `photo`, `relative`, `member_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mr', 'Jude', 'Suares', 'jude@gmail.com', '2022-05-03', '09120118872', 'Professor', 'member', 'brgy.suay,himamaylan city', 'brgy.suay,himamaylan city', NULL, 'Himamaylan City', 'Negros Occidental', 'Philippines', 'male', 'single', '2009-06-09', '1970-01-01', 'profile.png', NULL, 'old', '2022-05-03 23:29:28', '2022-05-03 23:29:28');

-- --------------------------------------------------------

--
-- Table structure for table `member_attendances`
--

CREATE TABLE `member_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `service_types_id` bigint(20) UNSIGNED NOT NULL,
  `attendance` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_collections`
--

CREATE TABLE `member_collections` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `collections_types_id` bigint(20) UNSIGNED NOT NULL,
  `service_types_id` bigint(20) UNSIGNED NOT NULL,
  `amount` bigint(20) NOT NULL,
  `date_collected` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messaging`
--

CREATE TABLE `messaging` (
  `id` int(10) UNSIGNED NOT NULL,
  `msg_to` bigint(20) UNSIGNED NOT NULL,
  `msg_from` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `msg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_06_21_102424_create_members_table', 1),
(4, '2018_06_21_102545_create_service_types_table', 1),
(5, '2018_06_21_102546_create_attendances_table', 1),
(6, '2018_06_22_082217_create_events_table', 1),
(7, '2018_07_12_122248_create_groups_table', 1),
(8, '2018_07_12_123555_create_group_members_table', 1),
(9, '2018_08_24_111333_create_member_attendances_table', 1),
(10, '2018_09_11_113254_create_messaging_table', 1),
(11, '2018_09_13_162055_create_announcements_table', 1),
(12, '2018_12_14_114432_create_options_table', 1),
(13, '2019_02_06_224640_create_collections_types_table', 1),
(14, '2019_02_07_100536_create_collections_table', 1),
(15, '2019_02_07_101424_create_collections_commissions_table', 1),
(16, '2019_02_21_162246_create_payments_table', 1),
(17, '2019_04_16_223522_create_member_collections_table', 1),
(18, '2019_04_18_124833_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `order_ids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `order_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorization_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bible Study', '2022-05-03 23:32:00', '2022-05-03 23:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'name', 'Abugon Baptist Church', '2022-05-03 00:43:43', '2022-05-03 00:43:43'),
(2, 'logo', 'logo.png', '2022-05-03 00:43:44', '2022-05-03 00:43:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branchname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchcode` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isadmin` enum('true','false') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `branchname`, `country`, `state`, `city`, `branchcode`, `email`, `address`, `currency`, `isadmin`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ABUGON BAPTIST CHURCH', 'Philippines', 'Negros Occidental', 'Kabankalan City', 'ABC051820', 'abp@gmail.com', 'Brgy.Tan-awan,Kabankalan City', '₱', 'true', '$2y$10$6rgsNhlwt2MUP1eBs485YeSht6X9h5p51xkjCF.n/zh7TBHkQJPYC', NULL, '2022-05-03 00:41:59', '2022-05-03 00:41:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcements_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_service_types_id_foreign` (`service_types_id`),
  ADD KEY `attendances_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collections_date_index` (`date`),
  ADD KEY `collections_branch_id_foreign` (`branch_id`),
  ADD KEY `collections_collections_types_id_foreign` (`collections_types_id`),
  ADD KEY `collections_service_types_id_foreign` (`service_types_id`);

--
-- Indexes for table `collections_commissions`
--
ALTER TABLE `collections_commissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collections_commissions_branch_id_foreign` (`branch_id`),
  ADD KEY `collections_commissions_collection_date_foreign` (`collection_date`);

--
-- Indexes for table `collections_types`
--
ALTER TABLE `collections_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collections_types_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_members_member_id_foreign` (`member_id`),
  ADD KEY `group_members_group_id_foreign` (`group_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_email_unique` (`email`),
  ADD KEY `members_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `member_attendances`
--
ALTER TABLE `member_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_attendances_service_types_id_foreign` (`service_types_id`),
  ADD KEY `member_attendances_member_id_foreign` (`member_id`);

--
-- Indexes for table `member_collections`
--
ALTER TABLE `member_collections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_collections_branch_id_foreign` (`branch_id`),
  ADD KEY `member_collections_member_id_foreign` (`member_id`),
  ADD KEY `member_collections_collections_types_id_foreign` (`collections_types_id`),
  ADD KEY `member_collections_service_types_id_foreign` (`service_types_id`);

--
-- Indexes for table `messaging`
--
ALTER TABLE `messaging`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messaging_msg_to_foreign` (`msg_to`),
  ADD KEY `messaging_msg_from_foreign` (`msg_from`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_types_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_branchcode_unique` (`branchcode`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collections_commissions`
--
ALTER TABLE `collections_commissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collections_types`
--
ALTER TABLE `collections_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `member_attendances`
--
ALTER TABLE `member_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member_collections`
--
ALTER TABLE `member_collections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messaging`
--
ALTER TABLE `messaging`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=345226;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendances_service_types_id_foreign` FOREIGN KEY (`service_types_id`) REFERENCES `service_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `collections`
--
ALTER TABLE `collections`
  ADD CONSTRAINT `collections_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `collections_collections_types_id_foreign` FOREIGN KEY (`collections_types_id`) REFERENCES `collections_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `collections_service_types_id_foreign` FOREIGN KEY (`service_types_id`) REFERENCES `service_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `collections_commissions`
--
ALTER TABLE `collections_commissions`
  ADD CONSTRAINT `collections_commissions_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `collections_commissions_collection_date_foreign` FOREIGN KEY (`collection_date`) REFERENCES `collections` (`date`) ON DELETE CASCADE;

--
-- Constraints for table `collections_types`
--
ALTER TABLE `collections_types`
  ADD CONSTRAINT `collections_types_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `group_members_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_members_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `member_attendances`
--
ALTER TABLE `member_attendances`
  ADD CONSTRAINT `member_attendances_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_attendances_service_types_id_foreign` FOREIGN KEY (`service_types_id`) REFERENCES `service_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `member_collections`
--
ALTER TABLE `member_collections`
  ADD CONSTRAINT `member_collections_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_collections_collections_types_id_foreign` FOREIGN KEY (`collections_types_id`) REFERENCES `collections_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_collections_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_collections_service_types_id_foreign` FOREIGN KEY (`service_types_id`) REFERENCES `service_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messaging`
--
ALTER TABLE `messaging`
  ADD CONSTRAINT `messaging_msg_from_foreign` FOREIGN KEY (`msg_from`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messaging_msg_to_foreign` FOREIGN KEY (`msg_to`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_types`
--
ALTER TABLE `service_types`
  ADD CONSTRAINT `service_types_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
