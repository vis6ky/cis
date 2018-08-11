-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2018 at 10:49 AM
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
-- Database: `nursing`
--

-- --------------------------------------------------------

--
-- Table structure for table `ng_payment`
--

CREATE TABLE `ng_payment` (
  `txn_id` int(11) NOT NULL,
  `reg_id` int(11) NOT NULL,
  `txn_amount` decimal(10,2) NOT NULL,
  `txn_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ng_payment`
--

INSERT INTO `ng_payment` (`txn_id`, `reg_id`, `txn_amount`, `txn_created_at`) VALUES
(1, 1, '10000.00', '2018-07-29 03:13:36'),
(2, 3, '10000.00', '2018-07-29 03:17:05'),
(3, 4, '10000.00', '2018-08-02 03:32:32');

-- --------------------------------------------------------

--
-- Table structure for table `ng_register`
--

CREATE TABLE `ng_register` (
  `reg_id` int(11) NOT NULL,
  `reg_name` varchar(30) NOT NULL,
  `reg_email` varchar(255) NOT NULL,
  `reg_phone` bigint(20) NOT NULL,
  `reg_batch` varchar(10) NOT NULL,
  `reg_status` enum('confirm','waiting','cancel','pending') NOT NULL DEFAULT 'pending',
  `reg_created_by` varchar(30) NOT NULL,
  `reg_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reg_modified_by` varchar(30) DEFAULT NULL,
  `reg_modified_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ng_register`
--

INSERT INTO `ng_register` (`reg_id`, `reg_name`, `reg_email`, `reg_phone`, `reg_batch`, `reg_status`, `reg_created_by`, `reg_created_at`, `reg_modified_by`, `reg_modified_at`) VALUES
(1, 'vishal', 'ksjdks@kllsa.dkks', 12325465765, '2019-20', 'waiting', 'vishal', '2018-07-29 06:43:47', NULL, NULL),
(2, 'vishlk', 'ksndk@sdk.dss', 8743782, '2019-20', 'pending', 'vishal', '2018-07-29 03:17:03', NULL, NULL),
(3, 'vishlk', 'ksndk@sdk.dss', 8743782, '2019-20', 'confirm', 'vishal', '2018-07-29 06:47:08', NULL, NULL),
(4, 'shekhar', 'sheckhar@gmail.com', 7654836508, '2019-20', 'pending', 'vishal', '2018-08-02 03:32:04', NULL, NULL),
(5, 'kdkdjsk', 'dsfnsdkj@kd.fwe', 3242342343, '2-2019', 'pending', 'vishal', '2018-08-07 14:08:56', NULL, NULL),
(6, 'kdkdjsk', 'dsfnsdkj@kd.fwe', 3242342343, '2-2019', 'pending', 'vishal', '2018-08-07 14:11:10', NULL, NULL),
(7, 'skdjfks', 'skfnkjs@knakf.sjcnka', 324723987489, '1-2019', 'pending', 'vishal', '2018-08-07 14:11:58', NULL, NULL),
(8, 'skdjfks', 'skfnkjs@knakf.sjcnka', 324723987489, '1-2019', 'pending', 'vishal', '2018-08-07 14:12:26', NULL, NULL),
(9, 'skdjfks', 'skfnkjs@knakf.sjcnka', 324723987489, '1-2019', 'pending', 'vishal', '2018-08-07 14:12:32', NULL, NULL),
(10, 'skdjfks', 'skfnkjs@knakf.sjcnka', 324723987489, '1-2019', 'pending', 'vishal', '2018-08-07 14:13:23', NULL, NULL),
(11, 'skdjfks', 'skfnkjs@knakf.sjcnka', 324723987489, '1-2019', 'pending', 'vishal', '2018-08-07 14:28:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ng_register_meta`
--

CREATE TABLE `ng_register_meta` (
  `meta_id` int(11) NOT NULL,
  `reg_id` int(11) NOT NULL,
  `meta_key` varchar(30) NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ng_register_meta`
--

INSERT INTO `ng_register_meta` (`meta_id`, `reg_id`, `meta_key`, `meta_value`) VALUES
(1, 5, 'reg_personal', '{\"father\":null,\"mother\":null,\"dob\":null}'),
(2, 5, 'reg_admission', '{\"src_admission\":null,\"category\":null,\"othr_category\":null,\"dt_admission\":null,\"sess_yr\":null,\"course\":null,\"batch\":null,\"fees\":null,\"discount\":null,\"discount_by\":null,\"discount_remark\":null}'),
(3, 6, 'reg_personal', '{\"father\":null,\"mother\":null,\"dob\":null}'),
(4, 6, 'reg_admission', '{\"src_admission\":null,\"category\":null,\"othr_category\":null,\"dt_admission\":null,\"sess_yr\":null,\"course\":null,\"batch\":null,\"fees\":null,\"discount\":null,\"discount_by\":null,\"discount_remark\":null}'),
(5, 7, 'reg_personal', '{\"father\":null,\"mother\":null,\"dob\":null}'),
(6, 7, 'reg_admission', '{\"src_admission\":null,\"category\":null,\"othr_category\":null,\"dt_admission\":null,\"sess_yr\":null,\"course\":null,\"batch\":null,\"fees\":null,\"discount\":null,\"discount_by\":null,\"discount_remark\":null}'),
(7, 8, 'reg_personal', '{\"father\":null,\"mother\":null,\"dob\":null}'),
(8, 8, 'reg_admission', '{\"src_admission\":null,\"category\":null,\"othr_category\":null,\"dt_admission\":null,\"sess_yr\":null,\"course\":null,\"batch\":null,\"fees\":null,\"discount\":null,\"discount_by\":null,\"discount_remark\":null}'),
(9, 9, 'reg_personal', '{\"father\":null,\"mother\":null,\"dob\":null}'),
(10, 9, 'reg_admission', '{\"src_admission\":null,\"category\":null,\"othr_category\":null,\"dt_admission\":null,\"sess_yr\":null,\"course\":null,\"batch\":null,\"fees\":null,\"discount\":null,\"discount_by\":null,\"discount_remark\":null}'),
(11, 10, 'reg_personal', '{\"father\":null,\"mother\":null,\"dob\":null}'),
(12, 10, 'reg_admission', '{\"src_admission\":null,\"category\":null,\"othr_category\":null,\"dt_admission\":null,\"sess_yr\":null,\"course\":null,\"batch\":null,\"fees\":null,\"discount\":null,\"discount_by\":null,\"discount_remark\":null}'),
(13, 11, 'reg_personal', '{\"father\":\"klfl\",\"mother\":\"kmsfdklc\",\"dob\":\"2018-08-05\"}'),
(14, 11, 'reg_admission', '{\"src_admission\":\"sdjcjkas\",\"category\":\"jkndskjv\",\"othr_category\":\"kjsdnkjs\",\"dt_admission\":\"2018-08-11\",\"sess_yr\":\"2019\",\"course\":\"sdjncjdskn\",\"batch\":\"1-2019\",\"fees\":\"1000000\",\"discount\":\"sdfnkj\",\"discount_by\":\"skjnf\",\"discount_remark\":\"skjnc\"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ng_payment`
--
ALTER TABLE `ng_payment`
  ADD PRIMARY KEY (`txn_id`);

--
-- Indexes for table `ng_register`
--
ALTER TABLE `ng_register`
  ADD PRIMARY KEY (`reg_id`);

--
-- Indexes for table `ng_register_meta`
--
ALTER TABLE `ng_register_meta`
  ADD PRIMARY KEY (`meta_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ng_payment`
--
ALTER TABLE `ng_payment`
  MODIFY `txn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ng_register`
--
ALTER TABLE `ng_register`
  MODIFY `reg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ng_register_meta`
--
ALTER TABLE `ng_register_meta`
  MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
