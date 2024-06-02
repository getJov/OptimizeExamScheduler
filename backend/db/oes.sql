-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2024 at 02:35 PM
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
(1, 'yapnat', 'yaplouis12@gmail.com', '$2b$12$fCoM2V9phbpOyHpqlMaXmOZ/0N60/3znuCTSoLYk5C1gOcVqmsMea', 'Ralph', 'Yap', 1, '2024-06-01 13:57:37', '2024-06-01 13:57:37'),
(3, 'getJov', 'getalla.jovanie@gmail.com', '$2b$12$FvZcToTSN.liI9Tr/ZB51ey/X4v3yP3rJRoZHcsHx/zbfCJiEcCeK', 'jovanie', 'getalla', 2, '2024-06-01 13:59:06', '2024-06-01 13:59:06');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

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
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
