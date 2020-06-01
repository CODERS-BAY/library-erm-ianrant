-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 01, 2020 at 11:15 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `medium_id` int(11) DEFAULT NULL,
  `journal_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `article_ref`
--

CREATE TABLE `article_ref` (
  `article_ref_id` int(15) NOT NULL,
  `article1_id` int(15) DEFAULT NULL,
  `article2_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(15) NOT NULL,
  `author_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(15) NOT NULL,
  `employee_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(15) NOT NULL,
  `storage_id` int(11) DEFAULT NULL,
  `inventory_processing_id` int(11) DEFAULT NULL,
  `journal_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inventoryprocessing`
--

CREATE TABLE `inventoryprocessing` (
  `processing_id` int(15) NOT NULL,
  `inventory_id` int(15) DEFAULT NULL,
  `is_inhouse` bit(1) DEFAULT NULL,
  `is_reserved` bit(1) DEFAULT NULL,
  `issued_by` int(15) DEFAULT NULL,
  `collected_by` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `medium_id` int(15) NOT NULL,
  `journal_id` int(11) DEFAULT NULL,
  `medium_type` varchar(50) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `keyword`
--

CREATE TABLE `keyword` (
  `keyword_id` int(15) NOT NULL,
  `keyword_entry` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medium`
--

CREATE TABLE `medium` (
  `medium_id` int(15) NOT NULL,
  `medium_type` varchar(50) DEFAULT NULL,
  `medium_title` varchar(100) DEFAULT NULL,
  `medium_orig_title` varchar(100) DEFAULT NULL,
  `medium_language` varchar(30) DEFAULT NULL,
  `medium_orig_language` varchar(30) DEFAULT NULL,
  `is_borrowable` bit(1) DEFAULT NULL,
  `subject_area_name` varchar(30) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `subjectarea_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medium_author`
--

CREATE TABLE `medium_author` (
  `medium_author_id` int(15) NOT NULL,
  `medium_id` int(15) DEFAULT NULL,
  `author_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medium_inventory`
--

CREATE TABLE `medium_inventory` (
  `medium_inventory_id` int(15) NOT NULL,
  `medium_id` int(15) DEFAULT NULL,
  `inventory_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medium_keyword`
--

CREATE TABLE `medium_keyword` (
  `medium_keyword_id` int(15) NOT NULL,
  `medium_id` int(15) DEFAULT NULL,
  `keyword_entry` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `proc_emp`
--

CREATE TABLE `proc_emp` (
  `proc_emp_id` int(15) NOT NULL,
  `processing_id` int(15) DEFAULT NULL,
  `employee_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(15) NOT NULL,
  `publisher_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

CREATE TABLE `storage` (
  `shelf_id` int(15) NOT NULL,
  `shelf_designation` varchar(50) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subjectarea`
--

CREATE TABLE `subjectarea` (
  `subject_area_id` int(15) NOT NULL,
  `subject_area_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD UNIQUE KEY `journal_id` (`journal_id`);

--
-- Indexes for table `article_ref`
--
ALTER TABLE `article_ref`
  ADD PRIMARY KEY (`article_ref_id`),
  ADD UNIQUE KEY `article1_id` (`article1_id`,`article2_id`),
  ADD KEY `article2_id` (`article2_id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD UNIQUE KEY `storage_id` (`storage_id`,`inventory_processing_id`,`journal_id`);

--
-- Indexes for table `inventoryprocessing`
--
ALTER TABLE `inventoryprocessing`
  ADD PRIMARY KEY (`processing_id`),
  ADD UNIQUE KEY `inventory_id` (`inventory_id`,`issued_by`,`collected_by`),
  ADD KEY `issued_by` (`issued_by`),
  ADD KEY `collected_by` (`collected_by`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`medium_id`),
  ADD UNIQUE KEY `inventory_id` (`inventory_id`),
  ADD UNIQUE KEY `journal_id` (`journal_id`);

--
-- Indexes for table `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`keyword_id`),
  ADD UNIQUE KEY `keyword_entry` (`keyword_entry`);

--
-- Indexes for table `medium`
--
ALTER TABLE `medium`
  ADD PRIMARY KEY (`medium_id`),
  ADD UNIQUE KEY `subject_area_name` (`subject_area_name`,`publisher_id`,`subjectarea_id`),
  ADD KEY `subjectarea_id` (`subjectarea_id`),
  ADD KEY `publisher_id` (`publisher_id`);

--
-- Indexes for table `medium_author`
--
ALTER TABLE `medium_author`
  ADD PRIMARY KEY (`medium_author_id`),
  ADD UNIQUE KEY `medium_id` (`medium_id`,`author_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `medium_inventory`
--
ALTER TABLE `medium_inventory`
  ADD PRIMARY KEY (`medium_inventory_id`),
  ADD UNIQUE KEY `medium_id` (`medium_id`,`inventory_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Indexes for table `medium_keyword`
--
ALTER TABLE `medium_keyword`
  ADD PRIMARY KEY (`medium_keyword_id`),
  ADD UNIQUE KEY `medium_id` (`medium_id`,`keyword_entry`),
  ADD UNIQUE KEY `keyword_entry` (`keyword_entry`);

--
-- Indexes for table `proc_emp`
--
ALTER TABLE `proc_emp`
  ADD PRIMARY KEY (`proc_emp_id`),
  ADD UNIQUE KEY `processing_id` (`processing_id`,`employee_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`shelf_id`),
  ADD UNIQUE KEY `inventory_id` (`inventory_id`);

--
-- Indexes for table `subjectarea`
--
ALTER TABLE `subjectarea`
  ADD PRIMARY KEY (`subject_area_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article_ref`
--
ALTER TABLE `article_ref`
  MODIFY `article_ref_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventoryprocessing`
--
ALTER TABLE `inventoryprocessing`
  MODIFY `processing_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keyword`
--
ALTER TABLE `keyword`
  MODIFY `keyword_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medium`
--
ALTER TABLE `medium`
  MODIFY `medium_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medium_author`
--
ALTER TABLE `medium_author`
  MODIFY `medium_author_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medium_inventory`
--
ALTER TABLE `medium_inventory`
  MODIFY `medium_inventory_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medium_keyword`
--
ALTER TABLE `medium_keyword`
  MODIFY `medium_keyword_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proc_emp`
--
ALTER TABLE `proc_emp`
  MODIFY `proc_emp_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `storage`
--
ALTER TABLE `storage`
  MODIFY `shelf_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjectarea`
--
ALTER TABLE `subjectarea`
  MODIFY `subject_area_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`journal_id`) REFERENCES `journal` (`journal_id`);

--
-- Constraints for table `article_ref`
--
ALTER TABLE `article_ref`
  ADD CONSTRAINT `article_ref_ibfk_1` FOREIGN KEY (`article1_id`) REFERENCES `article` (`article_id`),
  ADD CONSTRAINT `article_ref_ibfk_2` FOREIGN KEY (`article2_id`) REFERENCES `article` (`article_id`);

--
-- Constraints for table `inventoryprocessing`
--
ALTER TABLE `inventoryprocessing`
  ADD CONSTRAINT `inventoryprocessing_ibfk_1` FOREIGN KEY (`issued_by`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `inventoryprocessing_ibfk_2` FOREIGN KEY (`collected_by`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `inventoryprocessing_ibfk_3` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`);

--
-- Constraints for table `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`medium_id`) REFERENCES `medium` (`medium_id`),
  ADD CONSTRAINT `journal_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`);

--
-- Constraints for table `medium`
--
ALTER TABLE `medium`
  ADD CONSTRAINT `medium_ibfk_1` FOREIGN KEY (`subjectarea_id`) REFERENCES `subjectarea` (`subject_area_id`),
  ADD CONSTRAINT `medium_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`);

--
-- Constraints for table `medium_author`
--
ALTER TABLE `medium_author`
  ADD CONSTRAINT `medium_author_ibfk_1` FOREIGN KEY (`medium_id`) REFERENCES `medium` (`medium_id`),
  ADD CONSTRAINT `medium_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`);

--
-- Constraints for table `medium_inventory`
--
ALTER TABLE `medium_inventory`
  ADD CONSTRAINT `medium_inventory_ibfk_1` FOREIGN KEY (`medium_id`) REFERENCES `medium` (`medium_id`),
  ADD CONSTRAINT `medium_inventory_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`);

--
-- Constraints for table `medium_keyword`
--
ALTER TABLE `medium_keyword`
  ADD CONSTRAINT `medium_keyword_ibfk_1` FOREIGN KEY (`medium_id`) REFERENCES `medium` (`medium_id`),
  ADD CONSTRAINT `medium_keyword_ibfk_2` FOREIGN KEY (`keyword_entry`) REFERENCES `keyword` (`keyword_entry`);

--
-- Constraints for table `proc_emp`
--
ALTER TABLE `proc_emp`
  ADD CONSTRAINT `proc_emp_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `proc_emp_ibfk_2` FOREIGN KEY (`processing_id`) REFERENCES `inventoryprocessing` (`processing_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
