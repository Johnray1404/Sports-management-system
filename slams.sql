-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 13, 2025 at 12:56 PM
-- Server version: 8.3.0
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `slams`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `profilePic` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `name`, `password`, `profilePic`) VALUES
(1, 'admin', 'City Youth', '$2b$10$uuxD01AszWgYC5rMFEDbJuWfibLHyk8rO7dEig5m5L.qjho8I3DI6', '/uploads/adminProfile/admin_1751422896743.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
CREATE TABLE IF NOT EXISTS `coach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `coach_certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('pending','confirmed','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `notification_viewed` tinyint(1) DEFAULT '0',
  `coachProfile` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coach`
--

INSERT INTO `coach` (`id`, `fullname`, `email`, `phone`, `password`, `position`, `coach_certificate`, `created_at`, `updated_at`, `status`, `notification_viewed`, `coachProfile`) VALUES
(21, 'Coach ng buhay mo', 'coachngbuhaymo@gmail.com', '09123456789', '$2b$10$5HmO3kfA6VlcQ7XuPKRqbumiMgPtzRVNeYAQ39iRzj3syjwUgKBLm', 'Sports Coordinator', 'uploads/coach_certificates/1754972829667.pdf', '2025-08-12 04:27:09', '2025-08-12 04:33:15', 'confirmed', 1, '/uploads/coach_profile/coach-21-1754972856214-53741609.png');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `sports` text COLLATE utf8mb4_general_ci NOT NULL,
  `esports` varchar(199) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `other_activities` varchar(199) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `appointmentForm` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_schedule` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `location` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('ongoing','expired') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'ongoing',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `sports`, `esports`, `other_activities`, `image`, `appointmentForm`, `date_schedule`, `created_at`, `updated_at`, `location`, `status`) VALUES
(13, 'CCAA 2025', '🏆 **CCAA 2025** is back!\r\nGet ready for the ultimate showdown as college schools across Calapan City compete in this year’s most anticipated sports event. Witness the spirit of unity, sportsmanship, and excellence in action! 🏐🏀⚽ #CCAA2025 #CalapanCollegeGames\r\n', 'basketball,volleyball', 'ml', '', 'image-1754982017998-798641485.jpg', 'appointmentForm-1754982017998-976601871.pdf', '2025-08-30 09:00:00', '2025-08-12 07:00:18', '2025-08-12 07:00:18', 'Luna Goco Colleges', 'ongoing');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `videos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `caption` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notification_viewed` tinyint(1) DEFAULT '0',
  `coach_notifViewed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `images`, `videos`, `caption`, `created_at`, `updated_at`, `notification_viewed`, `coach_notifViewed`) VALUES
(15, '[\"1751386173343-356738252.jpg\"]', '[]', 'Test', '2025-07-01 16:09:33', '2025-07-01 16:15:50', 1, 1),
(16, '[\"1751386235759-138244153.jpg\"]', '[]', 'Mayors Cup 2025', '2025-07-01 16:10:35', '2025-07-01 16:15:46', 1, 1),
(17, '[\"1751386298173-614623177.jpg\",\"1751386298177-554350519.jpg\"]', '[]', 'TEST!', '2025-07-01 16:11:38', '2025-07-01 16:15:43', 1, 1),
(19, '[\"1754989869204-110621724.jpg\",\"1754989869205-451961995.jpg\",\"1754989869207-408200268.jpg\"]', '[]', 'SLAMS PRESENTATION', '2025-08-12 09:11:09', '2025-08-12 09:11:27', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_reactions`
--

DROP TABLE IF EXISTS `post_reactions`;
CREATE TABLE IF NOT EXISTS `post_reactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `coach_id` int DEFAULT NULL,
  `reaction_type` enum('like','dislike') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `admin_id` (`admin_id`),
  KEY `coach_id` (`coach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_reactions`
--

INSERT INTO `post_reactions` (`id`, `post_id`, `user_id`, `admin_id`, `coach_id`, `reaction_type`, `created_at`) VALUES
(68, 15, NULL, 1, NULL, 'like', '2025-07-01 16:09:36'),
(69, 16, NULL, 1, NULL, 'like', '2025-07-01 16:10:37'),
(74, 17, NULL, 1, NULL, 'like', '2025-07-01 16:11:45'),
(75, 17, NULL, NULL, NULL, 'like', '2025-07-01 16:12:31'),
(76, 16, NULL, NULL, NULL, 'like', '2025-07-01 16:12:56'),
(77, 15, NULL, NULL, NULL, 'like', '2025-07-01 16:12:57'),
(80, 15, NULL, NULL, NULL, 'like', '2025-07-02 02:32:48'),
(82, 17, NULL, NULL, NULL, 'like', '2025-07-20 15:51:32'),
(83, 16, NULL, NULL, NULL, 'like', '2025-07-20 15:51:36'),
(84, 17, NULL, NULL, NULL, 'like', '2025-07-20 16:00:45'),
(85, 17, NULL, NULL, 21, 'like', '2025-08-12 04:28:08'),
(86, 17, NULL, NULL, NULL, 'like', '2025-08-12 04:29:24'),
(87, 19, NULL, 1, NULL, 'like', '2025-08-12 09:11:11'),
(88, 19, NULL, NULL, 21, 'like', '2025-08-12 09:11:18'),
(89, 19, 21, NULL, NULL, 'like', '2025-08-12 09:11:29');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('OJri35Se9Wdi2d2elmt2lIsmbcPQw-Mc', 1755076901, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-08-13T09:21:40.894Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":21,\"google_id\":\"108125931373785515376\"}},\"user\":{\"id\":21,\"email\":\"johnrayml14@gmail.com\",\"password\":null,\"google_id\":\"108125931373785515376\",\"created_at\":\"2025-08-12T07:38:10.000Z\",\"updated_at\":\"2025-08-12T07:38:10.000Z\",\"profile\":null,\"terms_accepted\":true,\"terms_accepted_at\":\"2025-08-12T07:38:13.400Z\"},\"flash\":{}}'),
('h2dMKWVjsM22mqs4gQQGC6rsvcnGT-wV', 1755076864, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2025-08-13T09:11:17.295Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"admin\":{\"id\":1,\"username\":\"admin\"},\"coachOnly\":{\"id\":21,\"email\":\"coachngbuhaymo@gmail.com\",\"fullname\":\"Coach ng buhay mo\",\"status\":\"confirmed\"},\"success\":null,\"error\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE IF NOT EXISTS `team` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teamName` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `teamProfile` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `appointment_form` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `organization` enum('school','barangay') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `coach_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `status` enum('pending','confirmed','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `notification_viewed` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `coach_id` (`coach_id`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `teamName`, `teamProfile`, `appointment_form`, `organization`, `created_at`, `updated_at`, `coach_id`, `event_id`, `status`, `notification_viewed`) VALUES
(25, 'MINSU', '1754982290104.jpg', '1754982290104.pdf', 'school', '2025-08-12 07:04:50', '2025-08-12 07:05:05', 21, 13, 'confirmed', 1);

-- --------------------------------------------------------

--
-- Table structure for table `team_players`
--

DROP TABLE IF EXISTS `team_players`;
CREATE TABLE IF NOT EXISTS `team_players` (
  `id` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `PSA` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `waiver` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `med_cert` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('pending','confirmed','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `sports` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `age` int DEFAULT NULL,
  `sex` enum('male','female','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `player_name` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `school` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `year_level` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `barangay` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_number` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `notification_viewed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_players`
--

INSERT INTO `team_players` (`id`, `team_id`, `PSA`, `waiver`, `med_cert`, `created_at`, `updated_at`, `status`, `sports`, `birthdate`, `age`, `sex`, `user_id`, `player_name`, `school`, `year_level`, `barangay`, `contact_number`, `notification_viewed`) VALUES
(32, 25, 'uploads/player_PSA/1754983288421.pdf', 'uploads/player_waiver/1754983288421.pdf', 'uploads/player_medCert/1754983288421.pdf', '2025-08-12 07:21:28', '2025-08-12 07:22:29', 'confirmed', 'ml', '2004-08-14', 20, 'male', 20, 'JR CARPIO', 'MINSU', '4th Year', NULL, '09124577314', 0),
(33, 25, 'uploads/player_PSA/1754984354732.pdf', 'uploads/player_waiver/1754984354732.pdf', 'uploads/player_medCert/1754984354732.pdf', '2025-08-12 07:39:14', '2025-08-12 08:46:28', 'confirmed', 'basketball', '2004-08-14', 20, 'male', 21, 'John ML', 'MINSU', '4th Year', NULL, '09124577314', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `google_id` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `profile` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `terms_accepted` tinyint(1) DEFAULT '0',
  `terms_accepted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `google_id`, `created_at`, `updated_at`, `profile`, `terms_accepted`, `terms_accepted_at`) VALUES
(20, 'johnraycarpio1404@gmail.com', NULL, '116186537520761750975', '2025-08-12 15:05:35', '2025-08-12 15:05:38', NULL, 1, '2025-08-12 07:05:38'),
(21, 'johnrayml14@gmail.com', NULL, '108125931373785515376', '2025-08-12 15:38:10', '2025-08-12 15:38:13', NULL, 1, '2025-08-12 07:38:13');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post_reactions`
--
ALTER TABLE `post_reactions`
  ADD CONSTRAINT `post_reactions_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_reactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_reactions_ibfk_3` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_reactions_ibfk_4` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `team_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `team_players`
--
ALTER TABLE `team_players`
  ADD CONSTRAINT `team_players_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `team_players_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

DELIMITER $$
--
-- Events
--
DROP EVENT IF EXISTS `update_event_status`$$
CREATE DEFINER=`root`@`localhost` EVENT `update_event_status` ON SCHEDULE EVERY 1 DAY STARTS '2025-02-27 22:27:25' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE events
    SET status = 'expired'
    WHERE date_schedule < NOW() AND status = 'ongoing'$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
