-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2024 at 08:44 AM
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
-- Database: `oes`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `AnnouncementID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`AnnouncementID`, `title`, `content`, `created_at`) VALUES
(1, 'Exam schedule ', 'buckle up guys!', '2024-06-06 03:29:55'),
(2, 'Exam schedule ', 'test', '2024-06-06 04:03:20'),
(3, 'Exam schedule ', 'test2', '2024-06-06 04:13:12'),
(4, 'Exam schedule ', 'test5', '2024-06-06 04:21:33'),
(5, 'Exam schedule ', 'test1233', '2024-06-06 04:22:02'),
(6, 'Exam schedule ', 'test123', '2024-06-06 04:38:37'),
(7, 'Exam schedule ', 'buckle up the exam schedule will be posted tomorrow\r\n', '2024-06-06 05:06:41');

-- --------------------------------------------------------

--
-- Table structure for table `dataset`
--

CREATE TABLE `dataset` (
  `ID` int(11) NOT NULL,
  `proctors` varchar(25) NOT NULL,
  `rooms` varchar(25) NOT NULL,
  `size` varchar(10) DEFAULT NULL,
  `courses` varchar(25) NOT NULL,
  `year` int(11) NOT NULL,
  `sets` varchar(25) NOT NULL,
  `no_of_students` int(11) NOT NULL,
  `subject` varchar(25) NOT NULL,
  `subject_code` varchar(25) NOT NULL,
  `time_frame` varchar(10) DEFAULT NULL,
  `Instructor` varchar(25) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dataset`
--

INSERT INTO `dataset` (`ID`, `proctors`, `rooms`, `size`, `courses`, `year`, `sets`, `no_of_students`, `subject`, `subject_code`, `time_frame`, `Instructor`, `start_date`, `end_date`) VALUES
(1, 'yap', 'AB-R1', '30', 'BSIT', 1, 'a', 30, 'English', 'A 1', '1', 'louis', '2024-03-04 16:00:00', '2024-03-04 17:00:00'),
(2, 'eve', 'AB-R2', '30', 'BSIT', 1, 'b', 30, 'math', 'A 2', '1', 'zaiyeh', '2024-03-04 16:00:00', '2024-03-04 17:00:00'),
(3, 'jov', 'AB-R3', '30', 'BSIT', 1, 'c', 30, 'filipino', 'A 3', '1', 'getalla', '2024-03-04 16:00:00', '2024-03-04 17:00:00'),
(4, 'jen', 'AB-R4', '30', 'BSIT', 1, 'a', 30, 'science', 'A 4', '1', 'maemae', '2024-03-04 16:00:00', '2024-03-04 17:00:00'),
(5, 'kian', 'AB-R5', '40', 'BSIT', 2, 'a', 30, 'programming', 'A 5', '2', 'kenoa', '2024-03-04 16:00:00', '2024-03-04 18:00:00'),
(6, 'renalyn', 'AB-R6', '30', 'BSIT', 2, 'b', 30, 'data security', 'A 6', '2', 'ayban', '2024-03-04 16:00:00', '2024-03-04 18:00:00'),
(7, 'velyn', 'AB-R7', '40', 'BSIT', 2, 'c', 30, 'arts', 'A 7', '2', 'carlo', '2024-03-04 16:00:00', '2024-03-04 18:00:00'),
(8, 'owen', 'AB-R8', '40', 'BSIT', 2, 'd', 30, 'IM', 'A 8', '2', 'Aldave', '2024-03-04 16:00:00', '2024-03-04 18:00:00'),
(9, 'leah', 'AB-R9', '40', 'BSIT', 3, 'a', 30, 'Descrete Math', 'A 9', '1', 'joshua', '2024-03-04 16:00:00', '2024-03-04 17:00:00'),
(10, 'tonie', 'IC-R1', '30', 'BSIT', 3, 'b', 40, 'Advance Database', 'A 10', '3', 'lance', '2024-03-04 16:00:00', '2024-03-04 19:00:00'),
(11, 'johnryl', 'IC-R2', '30', 'BSIT', 3, 'c', 40, 'English 1', 'B 1', '3', 'dominic', '2024-03-04 16:00:00', '2024-03-04 19:00:00'),
(12, 'john', 'IC-R3', '30', 'BSIT', 3, 'd', 40, 'math 1', 'B 2', '3', 'jumar', '2024-03-04 16:00:00', '2024-03-04 19:00:00'),
(13, 'melson', 'IC-R4', '30', 'BSIT', 4, 'a', 40, 'filipino 1', 'B 3', '1', 'billy', '2024-03-04 16:00:00', '2024-03-04 17:00:00'),
(14, 'andrae', 'IC-R5', '30', 'BSIT', 4, 'b', 40, 'science 1', 'B 4', '1', 'aristea', '2024-03-04 16:00:00', '2024-03-04 17:00:00'),
(15, 'cyrell', 'Gym 1', '90', 'BSIT', 4, 'c', 40, 'programming 1', 'B 5', '1', 'Anna', '2024-03-04 16:00:00', '2024-03-04 17:00:00'),
(16, 'joy', 'Gym 2', '60', 'BSIT', 4, 'd', 40, 'data security 1', 'B 6', '1', 'Mark', '2024-03-04 16:00:00', '2024-03-04 17:00:00'),
(17, 'joyce', 'Narnia-R1', '40', 'BSIS', 1, 'a', 40, 'arts 1', 'B 7', '2', 'jake', '2024-03-04 16:00:00', '2024-03-04 18:00:00'),
(18, 'jayvee', 'Narnia-R2', '40', 'BSIS', 1, 'b', 40, 'IM 1', 'B 8', '2', 'niko', '2024-03-04 16:00:00', '2024-03-04 18:00:00'),
(19, 'velie', 'Narnia-R3', '30', 'BSIS', 1, 'c', 40, 'Descrete Math 1', 'B 9', '2', 'ally', '2024-03-04 16:00:00', '2024-03-04 18:00:00'),
(20, 'rick', 'Narnia-R4', '35', 'BSIS', 1, 'd', 30, 'Advance Database 1', 'B 10', '2', 'ella', '2024-03-04 16:00:00', '2024-03-04 18:00:00'),
(21, 'albert', 'Narnia-R5', '30', 'BSIS', 2, 'a', 30, 'English 2', 'C 1', '3', 'lloyd', '2024-03-04 16:00:00', '2024-03-04 19:00:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `filtered_logs`
-- (See below for the actual view)
--
CREATE TABLE `filtered_logs` (
`LogID` int(11)
,`UserID` int(11)
,`Username` varchar(50)
,`email` varchar(100)
,`Action` varchar(50)
,`Timestamp` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`RoleID`, `RoleName`, `Description`) VALUES
(1, 'Superadmin', 'Full access to all system features.'),
(2, 'Admin', 'Manage users and configure settings.'),
(3, 'Faculty', 'Regular user with limited access.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `RoleID` int(11) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Email`, `PasswordHash`, `firstName`, `lastName`, `RoleID`, `CreatedAt`, `UpdatedAt`) VALUES
(5, 'superadmin', 'superadminOes@gmail.com', '$2b$12$D.tzDmwpgNqvv38IdKtvQuBHiWLCODGLryBsQKHelI3rA3rVk7SC.', 'super', 'admin', 1, '2024-06-03 08:43:09', '2024-06-06 04:36:35'),
(6, 'Admin', 'adminOes@gmail.com', '$2b$12$/MZ6kF9qyLkRAfLiPXcUEe.sElAp.38UdFI85F9GoygeC46pqKqqG', 'jovanie', 'getalla', 2, '2024-06-03 08:57:20', '2024-06-05 09:52:28'),
(68, 'Faculty', 'facultyOes@gmail.com', '$2b$12$94YNS8TNAeOrxG8CCq2XRei4a6tzhxUrHVEpHZtV4JGGCtAnH8tla', 'Eve', 'Famor', 3, '2024-06-06 05:42:34', '2024-06-06 05:42:34');

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `LogID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Action` varchar(50) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_logs`
--

INSERT INTO `user_logs` (`LogID`, `UserID`, `Action`, `Description`, `Timestamp`) VALUES
(1, 5, 'logged in', '0', '2024-06-05 08:22:30'),
(7, 5, 'login', '0', '2024-06-05 08:49:22'),
(8, 5, 'logged out', '0', '2024-06-05 08:50:44'),
(9, 6, 'logged in', '0', '2024-06-05 08:52:09'),
(10, 6, 'logged out', '0', '2024-06-05 08:52:17'),
(11, 5, 'logged in', '0', '2024-06-05 09:04:54'),
(12, 5, 'logged out', '0', '2024-06-05 09:21:21'),
(13, 5, 'logged in', '0', '2024-06-05 09:31:35'),
(14, 5, 'registered', '0', '2024-06-05 09:32:32'),
(15, 5, 'updated', '0', '2024-06-05 09:35:11'),
(16, 5, 'deleted', '0', '2024-06-05 09:38:11'),
(17, 5, 'deleted user with ID 65', '0', '2024-06-05 09:40:57'),
(18, 5, 'deleted user with ID 65', '0', '2024-06-05 09:41:02'),
(19, 5, 'deleted user with ID 65', '0', '2024-06-05 09:41:58'),
(20, 5, 'deleted user with ID 65', '0', '2024-06-05 09:42:45'),
(21, 5, 'updated', 'user with ID 62', '2024-06-05 09:50:53'),
(22, 5, 'Deleted', 'user with ID 62', '2024-06-05 09:51:13'),
(23, 5, 'Deleted', 'user with ID 56', '2024-06-05 09:51:46'),
(24, 5, 'updated', 'user with ID 6', '2024-06-05 09:51:58'),
(25, 5, 'updated', 'user with ID 6', '2024-06-05 09:52:28'),
(26, 5, 'registered', 'Welcome User', '2024-06-05 09:53:03'),
(27, 5, 'logged out', 'Thank you!', '2024-06-05 09:53:59'),
(28, 5, 'logged in', 'welcome back', '2024-06-05 09:54:19'),
(29, 5, 'logged out', 'Thank you!', '2024-06-05 10:18:43'),
(30, 5, 'logged in', 'welcome back', '2024-06-05 10:18:51'),
(31, 5, 'Deleted', 'user with ID 5', '2024-06-05 10:20:40'),
(32, 5, 'Deleted', 'user with ID 5', '2024-06-05 10:21:34'),
(33, 5, 'Deleted', 'user with ID 5', '2024-06-05 10:42:51'),
(34, 5, 'Deleted', 'user with ID 5', '2024-06-05 10:59:59'),
(35, 5, 'logged in', 'welcome back', '2024-06-05 11:43:46'),
(36, 5, 'logged out', 'Thank you!', '2024-06-05 12:06:31'),
(37, 5, 'logged in', 'welcome back', '2024-06-05 12:07:45'),
(38, 5, 'logged out', 'Thank you!', '2024-06-05 12:08:00'),
(39, 5, 'logged in', 'welcome back', '2024-06-05 12:26:02'),
(40, 5, 'updated', 'user with ID 5', '2024-06-05 12:26:26'),
(41, 5, 'updated', 'user with ID 5', '2024-06-05 12:26:29'),
(42, 5, 'Deleted', 'user with ID 66', '2024-06-05 12:26:37'),
(43, 5, 'Deleted', 'user with ID 5', '2024-06-05 12:27:12'),
(44, 5, 'Deleted', 'user with ID 5', '2024-06-05 12:32:38'),
(45, 5, 'Deleted', 'user with ID 5', '2024-06-05 12:33:02'),
(46, 5, 'Deleted', 'user with ID 5', '2024-06-05 12:33:31'),
(47, 5, 'Deleted', 'user with ID 5', '2024-06-05 12:33:36'),
(48, 5, 'Deleted', 'user with ID 5', '2024-06-05 12:33:41'),
(49, 5, 'logged out', 'Thank you!', '2024-06-05 13:29:31'),
(50, 5, 'logged in', 'welcome back', '2024-06-05 13:29:43'),
(51, 5, 'logged out', 'Thank you!', '2024-06-05 13:55:27'),
(52, 5, 'logged in', 'welcome back', '2024-06-05 13:55:55'),
(53, 5, 'logged in', 'welcome back', '2024-06-05 19:58:22'),
(54, 5, 'logged out', 'Thank you!', '2024-06-05 20:21:54'),
(55, 5, 'logged in', 'welcome back', '2024-06-05 20:22:02'),
(56, 5, 'logged out', 'Thank you!', '2024-06-05 20:24:11'),
(57, 5, 'logged in', 'welcome back', '2024-06-05 20:25:50'),
(58, 5, 'registered', 'Welcome User', '2024-06-05 21:03:45'),
(59, 5, 'Deleted', 'user with ID 67', '2024-06-05 21:03:57'),
(60, 5, 'updated', 'user with ID 5', '2024-06-05 21:14:48'),
(61, 5, 'updated', 'user with ID 5', '2024-06-05 21:14:54'),
(62, 5, 'updated', 'user with ID 5', '2024-06-05 21:14:58'),
(63, 5, 'updated', 'user with ID 5', '2024-06-05 21:15:02'),
(64, 5, 'updated', 'user with ID 5', '2024-06-05 21:15:06'),
(65, 5, 'updated', 'user with ID 5', '2024-06-05 21:15:16'),
(66, 5, 'exam generated', 'study hard!', '2024-06-05 21:52:16'),
(67, 5, 'exam generated', 'study hard!', '2024-06-05 21:53:00'),
(68, 5, 'exam generated', 'study hard!', '2024-06-05 21:57:57'),
(69, 5, 'exam generated', 'study hard!', '2024-06-05 21:59:05'),
(70, 5, 'exam generated', 'study hard!', '2024-06-05 21:59:17'),
(71, 5, 'exam generated', 'study hard!', '2024-06-05 22:02:09'),
(72, 5, 'logged in', 'welcome back', '2024-06-06 03:27:21'),
(73, 5, 'created announcement', 'title: Exam schedule ', '2024-06-06 03:29:55'),
(74, 5, 'created announcement', 'title: Exam schedule ', '2024-06-06 04:03:20'),
(75, 5, 'created announcement', 'title: Exam schedule ', '2024-06-06 04:13:12'),
(76, 5, 'logged in', 'welcome back', '2024-06-06 04:21:16'),
(77, 5, 'created announcement', 'title: Exam schedule ', '2024-06-06 04:21:33'),
(78, 5, 'created announcement', 'title: Exam schedule ', '2024-06-06 04:22:02'),
(79, 5, 'updated', 'user with ID 5', '2024-06-06 04:36:32'),
(80, 5, 'updated', 'user with ID 5', '2024-06-06 04:36:35'),
(81, 5, 'created announcement', 'title: Exam schedule ', '2024-06-06 04:38:37'),
(82, 5, 'created announcement', 'title: Exam schedule ', '2024-06-06 05:06:41'),
(83, 5, 'logged out', 'Thank you!', '2024-06-06 05:06:56'),
(84, 5, 'logged in', 'welcome back', '2024-06-06 05:07:08'),
(85, 5, 'logged out', 'Thank you!', '2024-06-06 05:41:45'),
(86, 5, 'logged in', 'welcome back', '2024-06-06 05:41:54'),
(87, 5, 'registered', 'Welcome User', '2024-06-06 05:42:34'),
(88, 5, 'logged out', 'Thank you!', '2024-06-06 05:43:52'),
(89, 68, 'logged in', 'welcome back', '2024-06-06 05:47:00'),
(90, 68, 'logged out', 'Thank you!', '2024-06-06 05:48:28'),
(91, 68, 'logged in', 'welcome back', '2024-06-06 05:48:38'),
(92, 68, 'logged out', 'Thank you!', '2024-06-06 06:13:22'),
(93, 5, 'logged in', 'welcome back', '2024-06-06 06:13:29'),
(94, 5, 'logged out', 'Thank you!', '2024-06-06 06:13:52'),
(95, 68, 'logged in', 'welcome back', '2024-06-06 06:14:10');

-- --------------------------------------------------------

--
-- Structure for view `filtered_logs`
--
DROP TABLE IF EXISTS `filtered_logs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `filtered_logs`  AS SELECT `l`.`LogID` AS `LogID`, `u`.`UserID` AS `UserID`, `u`.`Username` AS `Username`, `u`.`Email` AS `email`, `l`.`Action` AS `Action`, `l`.`Timestamp` AS `Timestamp` FROM (`user_logs` `l` join `user` `u` on(`l`.`UserID` = `u`.`UserID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`AnnouncementID`);

--
-- Indexes for table `dataset`
--
ALTER TABLE `dataset`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleID`),
  ADD UNIQUE KEY `RoleName` (`RoleName`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `RoleID` (`RoleID`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`LogID`),
  ADD KEY `UserID` (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `AnnouncementID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dataset`
--
ALTER TABLE `dataset`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`);

--
-- Constraints for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD CONSTRAINT `user_logs_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
