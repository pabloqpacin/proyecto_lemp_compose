-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 07, 2023 at 10:04 AM
-- Server version: 8.0.29-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpdesk_core_php`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `ticket` int NOT NULL,
  `team_member` int NOT NULL,
  `private` int NOT NULL DEFAULT '0',
  `body` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `ticket`, `team_member`, `private`, `body`, `created_at`, `updated_at`) VALUES
(1, 3, 4, 0, 'comment', '2019-05-31 13:54:56', '2019-05-31 13:54:56'),
(2, 2, 1, 0, 'comment on ticket', '2019-05-31 13:57:19', '2019-05-31 13:57:19'),
(3, 3, 4, 0, 'test comment', '2019-06-03 16:59:16', '2019-06-03 16:59:16'),
(4, 3, 4, 0, 'test ticket comment', '2019-06-03 16:59:43', '2019-06-03 16:59:43'),
(5, 10, 4, 0, 'ddmo', '2023-03-20 07:01:34', '2023-03-20 07:01:34');

-- --------------------------------------------------------

--
-- Table structure for table `requester`
--

CREATE TABLE `requester` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requester`
--

INSERT INTO `requester` (`id`, `name`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(31, 'mofiqul', 'example@email.com', '9876543210', '2019-05-19 13:24:08', '2019-05-19 13:24:08'),
(32, 'mofiqul', 'example@email.com', '9876543210', '2019-05-19 13:45:22', '2019-05-19 13:45:22'),
(33, 'mofiqul', 'example@email.com', '9876543210', '2019-05-19 13:46:01', '2019-05-19 13:46:01'),
(34, 'mofiqul', 'example@email.com', '9876543210', '2019-05-19 13:46:27', '2019-05-19 13:46:27'),
(35, 'mofiqul', 'example@email.com', '9876543210', '2019-05-19 13:47:51', '2019-05-19 13:47:51'),
(36, 'mofiqul', 'example@email.com', '9876543210', '2019-05-19 13:48:31', '2019-05-19 13:48:31'),
(37, 'mofiqul', 'example@email.com', '9876543210', '2019-05-19 13:48:37', '2019-05-19 13:48:37'),
(38, 'mofiqul', 'example@email.com', '9876543210', '2019-05-19 13:51:05', '2019-05-19 13:51:05'),
(39, 'injamul ', 'injamul.haque6@gmail.com', '8822677188', '2019-05-23 17:18:25', '2019-05-23 17:18:25'),
(40, 'injamul ', 'injamul.haque6@gmail.com', '8822677188', '2019-05-30 13:55:17', '2019-05-30 13:55:17'),
(41, 'test', 'kangkan@email.com', '1234567898', '2019-06-07 02:07:43', '2019-06-07 02:07:43'),
(42, 'test ticket', 'johndoe@helpdesk.com', '1234567898', '2019-06-07 02:11:23', '2019-06-07 02:11:23'),
(43, 'test123', 'kangkan@email.com', '1234567898', '2019-06-07 06:51:33', '2019-06-07 06:51:33'),
(44, 'test ticket', 'johndoe@helpdesk.com', '1234567898', '2019-06-07 06:52:04', '2019-06-07 06:52:04'),
(45, 'demo ticket', 'demo@email.com', '1234567899', '2023-03-20 06:57:25', '2023-03-20 06:57:25'),
(46, 'demo', 'demo@email.com', '1234567899', '2023-03-20 11:11:23', '2023-03-20 11:11:23');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Server', '2019-05-19 09:49:15', '2019-05-19 09:49:15'),
(2, 'Devops', '2019-05-19 09:49:15', '2019-05-19 09:49:15'),
(3, 'injamul ', '2019-05-23 19:16:36', '2019-05-23 19:16:36');

-- --------------------------------------------------------

--
-- Table structure for table `team_member`
--

CREATE TABLE `team_member` (
  `id` int NOT NULL,
  `user` int NOT NULL,
  `team` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team_member`
--

INSERT INTO `team_member` (`id`, `user`, `team`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-05-19 15:08:37', '2019-05-19 15:08:37'),
(4, 4, 2, '2019-05-30 11:45:10', '2019-05-30 11:45:10'),
(5, 4, 3, '2019-05-30 11:46:15', '2019-05-30 11:46:15'),
(6, 4, 3, '2019-05-30 11:47:53', '2019-05-30 11:47:53'),
(7, 2, 3, '2019-05-30 11:51:38', '2019-05-30 11:51:38'),
(9, 4, 1, '2019-05-31 07:35:45', '2019-05-31 07:35:45');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `body` text NOT NULL,
  `requester` int NOT NULL,
  `team` int DEFAULT NULL,
  `team_member` varchar(11) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'open',
  `priority` varchar(20) NOT NULL DEFAULT 'low',
  `rating` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` varchar(50) DEFAULT NULL,
  `deleted_at` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `title`, `body`, `requester`, `team`, `team_member`, `status`, `priority`, `rating`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'subject', 'thi ', 36, 2, '3', 'closed', 'low', 0, '2019-05-19 13:48:31', NULL, NULL),
(2, 'subject', 'thi ', 37, 2, '1', 'solved', 'low', 0, '2019-05-19 13:48:37', NULL, NULL),
(4, 'test', 'this is a comment', 39, 2, '4', 'open', 'low', 0, '2019-05-23 17:18:25', NULL, NULL),
(5, 'test', 'hfg', 40, 1, '1', 'pending', 'high', 0, '2019-05-30 13:55:17', NULL, NULL),
(6, 'abcd', 'no comment', 41, 3, '4', 'open', 'low', 0, '2019-06-07 02:07:43', NULL, NULL),
(8, 'abcd', 'abcd', 43, 1, '4', 'open', 'low', 0, '2019-06-07 06:51:33', NULL, NULL),
(9, 'no subject', 'abcd', 44, 1, '4', 'open', 'high', 0, '2019-06-07 06:52:04', NULL, NULL),
(10, 'demo subject', 'se', 45, 2, '9', 'closed', 'low', 0, '2023-03-20 06:57:25', NULL, NULL),
(11, 'demo subject', 'demo comment', 46, 1, '4', 'solved', 'medium', 0, '2023-03-20 11:11:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_event`
--

CREATE TABLE `ticket_event` (
  `id` int NOT NULL,
  `ticket` int NOT NULL,
  `user` int NOT NULL,
  `body` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_event`
--

INSERT INTO `ticket_event` (`id`, `ticket`, `user`, `body`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'Ticket created', '2019-05-23 17:18:25', '2019-05-23 17:18:25'),
(2, 5, 1, 'Ticket created', '2019-05-30 13:55:17', '2019-05-30 13:55:17'),
(3, 6, 1, 'Ticket created', '2019-06-07 02:07:43', '2019-06-07 02:07:43'),
(4, 7, 1, 'Ticket created', '2019-06-07 02:11:23', '2019-06-07 02:11:23'),
(5, 8, 4, 'Ticket created', '2019-06-07 06:51:33', '2019-06-07 06:51:33'),
(6, 9, 4, 'Ticket created', '2019-06-07 06:52:04', '2019-06-07 06:52:04'),
(7, 10, 1, 'Ticket created', '2023-03-20 06:57:25', '2023-03-20 06:57:25'),
(8, 11, 1, 'Ticket created', '2023-03-20 11:11:23', '2023-03-20 11:11:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'member',
  `avatar` varchar(150) DEFAULT NULL,
  `last_password` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `role`, `avatar`, `last_password`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'johndoe@helpdesk.com', '8888888888', '$2y$10$PHXjdcPjksokkGryfqK.WePBgiQB30Gw.ytYBHdmGtqtoGtVHtAm.', 'admin', NULL, '$2y$10$PHXjdcPjksokkGryfqK.WePBgiQB30Gw.ytYBHdmGtqtoGtVHtAm.', '2023-03-20 07:16:20', '2019-05-19 09:01:34'),
(3, 'injamul ', 'johndoe@helpdesk.com', '1234567899', '$2y$10$6N4gbdypYQvRkU2ke9Q1f.Gm4fcGY/PEpv2rSB77wiSLZaOy8kq5i', 'member', NULL, '$2y$10$6N4gbdypYQvRkU2ke9Q1f.Gm4fcGY/PEpv2rSB77wiSLZaOy8kq5i', '2023-03-20 07:16:07', '2019-05-24 07:58:53'),
(4, 'Alex', 'kangkan@email.com', '9999999999', '$2y$10$Q0rxoFO4fSrcdp58CO0RNOSDP7znVc9eGY6Z4xjQ8MTLHYhx0TF.6', 'member', NULL, '$2y$10$Q0rxoFO4fSrcdp58CO0RNOSDP7znVc9eGY6Z4xjQ8MTLHYhx0TF.6', '2023-03-20 06:36:52', '2019-05-30 08:49:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requester`
--
ALTER TABLE `requester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_member`
--
ALTER TABLE `team_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_event`
--
ALTER TABLE `ticket_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `requester`
--
ALTER TABLE `requester`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `team_member`
--
ALTER TABLE `team_member`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ticket_event`
--
ALTER TABLE `ticket_event`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
