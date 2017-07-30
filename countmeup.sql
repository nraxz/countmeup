-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2017 at 06:39 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `countmeup`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `countmeup`
--
CREATE TABLE IF NOT EXISTS `countmeup` (
`candidate` int(11)
,`votes` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `maxcount`
--
CREATE TABLE IF NOT EXISTS `maxcount` (
`voter` int(11)
,`maxcount` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ballot`
--

CREATE TABLE IF NOT EXISTS `tbl_ballot` (
  `id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_ballot`
--

INSERT INTO `tbl_ballot` (`id`, `voter_id`, `candidate_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2),
(5, 1, 3),
(7, 2, 3),
(8, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_candidate`
--

CREATE TABLE IF NOT EXISTS `tbl_candidate` (
  `id` int(11) NOT NULL,
  `candidate_name` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_candidate`
--

INSERT INTO `tbl_candidate` (`id`, `candidate_name`) VALUES
(1, 'Max'),
(2, 'Donald'),
(3, 'Dave'),
(4, 'Harry');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_voter`
--

CREATE TABLE IF NOT EXISTS `tbl_voter` (
  `id` int(11) NOT NULL,
  `voter` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_voter`
--

INSERT INTO `tbl_voter` (`id`, `voter`) VALUES
(1, 'xyz'),
(2, 'Abc'),
(3, 'Mno'),
(4, 'Vish');

-- --------------------------------------------------------

--
-- Structure for view `countmeup`
--
DROP TABLE IF EXISTS `countmeup`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `countmeup` AS select `tbl_candidate`.`id` AS `candidate`,count(`tbl_ballot`.`candidate_id`) AS `votes` from (`tbl_candidate` join `tbl_ballot` on((`tbl_candidate`.`id` = `tbl_ballot`.`candidate_id`))) group by `tbl_candidate`.`id`;

-- --------------------------------------------------------

--
-- Structure for view `maxcount`
--
DROP TABLE IF EXISTS `maxcount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `maxcount` AS select `tbl_voter`.`id` AS `voter`,count(`tbl_ballot`.`voter_id`) AS `maxcount` from (`tbl_voter` join `tbl_ballot` on((`tbl_voter`.`id` = `tbl_ballot`.`voter_id`))) group by `tbl_voter`.`id`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_ballot`
--
ALTER TABLE `tbl_ballot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_candidate`
--
ALTER TABLE `tbl_candidate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_voter`
--
ALTER TABLE `tbl_voter`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_ballot`
--
ALTER TABLE `tbl_ballot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_candidate`
--
ALTER TABLE `tbl_candidate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_voter`
--
ALTER TABLE `tbl_voter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
