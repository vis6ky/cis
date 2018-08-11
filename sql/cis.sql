-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2018 at 10:38 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cis`
--

-- --------------------------------------------------------

--
-- Table structure for table `cis_manufaturer`
--

CREATE TABLE `cis_manufaturer` (
  `manufacturer_id` int(11) NOT NULL,
  `manufacturer_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cis_manufaturer`
--

INSERT INTO `cis_manufaturer` (`manufacturer_id`, `manufacturer_name`) VALUES
(1, 'Maruti'),
(2, 'Tata');

-- --------------------------------------------------------

--
-- Table structure for table `cis_model`
--

CREATE TABLE `cis_model` (
  `id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `model_name` varchar(255) NOT NULL,
  `model_color` varchar(15) NOT NULL,
  `manufacturing_year` int(11) NOT NULL,
  `registration_number` varchar(30) NOT NULL,
  `model_description` text NOT NULL,
  `model_pic` text NOT NULL,
  `created_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cis_model`
--

INSERT INTO `cis_model` (`id`, `manufacturer_id`, `model_name`, `model_color`, `manufacturing_year`, `registration_number`, `model_description`, `model_pic`, `created_dt`) VALUES
(2, 1, 'WagonR', 'Black', 1990, 'MH-09-KH-7654', 'Balck Color Model Of WagonR', 'download.png,small-red-apple-hi.png', '2018-08-11 06:28:30'),
(7, 2, 'Nano', 'Red', 2010, 'CG-10-03-4255', 'Red Color Nano', 'small-red-apple-hi.png,download.png', '2018-08-11 04:13:44'),
(10, 2, 'Nano', 'Red', 2010, 'CG-10-03-2048', 'Red Color Nano', 'small-red-apple-hi.png,download.png', '2018-08-11 04:16:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cis_manufaturer`
--
ALTER TABLE `cis_manufaturer`
  ADD PRIMARY KEY (`manufacturer_id`),
  ADD UNIQUE KEY `manufacturer_name` (`manufacturer_name`);

--
-- Indexes for table `cis_model`
--
ALTER TABLE `cis_model`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `registration_number` (`registration_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cis_manufaturer`
--
ALTER TABLE `cis_manufaturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `cis_model`
--
ALTER TABLE `cis_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
