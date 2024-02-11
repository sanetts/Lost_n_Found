-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 29, 2024 at 09:22 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chores_mgt`
--

-- --------------------------------------------------------



--
-- Table structure for table `Lost Items`
--

CREATE TABLE `Lost_Items` (
  `itemid` int(11) NOT NULL,
  `rid` int(11) NOT NULL, --- role id
  `sid` int(11) NOT NULL, --- status id
  `image_id` int(11) NOT NULL, --- image id 
  `item_name` varchar(100) NOT NULL,
  `time` time,
  `location` varchar(255) NOT NULL,
  `description` TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Image`
--
CREATE TABLE `image` (
    `image_id` int(11) NOT NULL,
    `file_name` varchar(255) NOT NULL,
    `file_size` int NOT NULL,
    `file_type` varchar(50) NOT NULL,
    `upload_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `Found Items`
--

CREATE TABLE `Found_Items` (
  `itemid` int(11) NOT NULL,
  `rid` int(11) NOT NULL, --- role id
  `sid` int(11) NOT NULL, --- status id
  `image_id` int(11) NOT NULL, --- image id 
  `item_name` varchar(100) NOT NULL,
  `time` time,
  `location` varchar(255) NOT NULL,
  `description` TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `People`
--

CREATE TABLE `User` (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `gender` int(11) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `passwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Role`
--

CREATE TABLE `Role` (
  `rid` int(11) NOT NULL,
  `rname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Role`
--

INSERT INTO `Role` (`rid`, `rname`) VALUES
(1, 'admin'),
(2, 'student'),
(3, 'teaching_staff');
(4, 'non_teaching_staff');
(5, 'visitor');
-- --------------------------------------------------------

--
-- Table structure for table ` Lost Item Status`
--

CREATE TABLE `Lost_status` (
  `sid` int(11) NOT NULL,
  `sname` varchar(50) NOT NULL DEFAULT 'Lost'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `Found Item Status`
--

CREATE TABLE `Found_status` (
  `sid` int(11) NOT NULL,
  `sname` varchar(50) NOT NULL DEFAULT 'Found'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--
-- Dumping data for table `Status`
--

INSERT INTO `Lost_status` (`sid`, `sname`) VALUES
(1, 'Lost'),
(2, 'Searching'),
(3, 'Found')



INSERT INTO `Found_status` (`sid`, `sname`) VALUES
(1, 'UnClaimed'),
(2, 'InProgress'),
(3, 'Claimed')

--
-- Indexes for dumped tables
--

;

--
-- Indexes for table `Lost_Items`
--
ALTER TABLE `Lost_Items`
  ADD PRIMARY KEY (`itemid`),
  ADD KEY `rid` (`rid`),
  ADD KEY `sid` (`sid`),
 

--
-- Indexes for table `Found_Items`
--
ALTER TABLE `Found_Items`
  ADD PRIMARY KEY (`itemid`),
  ADD KEY `rid` (`rid`),
  ADD KEY `sid` (`sid`),
 


--
-- Indexes for table `People`
--
ALTER TABLE `People`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `rid` (`rid`),


--
-- Indexes for table `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`rid`);


--
-- Indexes for table `Role`
--
ALTER TABLE `Image`
  ADD PRIMARY KEY (`image_id`);


--
-- Indexes for table `Status`
--
ALTER TABLE `Lost_status`
  ADD PRIMARY KEY (`sid`);


ALTER TABLE `Found_status`
  ADD PRIMARY KEY (`sid`);

  

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Lost_Items`
--
ALTER TABLE `Lost_Items`
  MODIFY `itemid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Found_Items`
--
ALTER TABLE `Found_Items`
  MODIFY `itemid` int(11) NOT NULL AUTO_INCREMENT;


--
-- AUTO_INCREMENT for table `People`
--
ALTER TABLE `User`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Role`
--
ALTER TABLE `Role`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Status`
--
ALTER TABLE `Lost_status`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `Found_status`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--


--
-- Constraints for table `Lost Items`
--
ALTER TABLE `Lost_Items`
  ADD CONSTRAINT `lost_items_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `Role` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lost_items_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `Lost_status` (`sid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `lost_items_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `Image` (`image_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE `Found_Items`
  ADD CONSTRAINT `found_items_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `Role` (`rid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `found_items_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `Found_status` (`sid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `found_items_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `Image` (`image_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `People`
--
ALTER TABLE `User`
  ADD CONSTRAINT `people_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `Role` (`rid`) ON DELETE CASCADE ON UPDATE CASCADE,
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
