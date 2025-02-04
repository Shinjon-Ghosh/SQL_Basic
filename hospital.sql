-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2019 at 03:58 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--
CREATE DATABASE IF NOT EXISTS `hospital` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hospital`;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_info`
--

CREATE TABLE `doctor_info` (
  `doc_name` varchar(20) NOT NULL,
  `Contact` int(15) NOT NULL,
  `Salary` int(10) NOT NULL,
  `Working_Hour` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_info`
--

INSERT INTO `doctor_info` (`doc_name`, `Contact`, `Salary`, `Working_Hour`) VALUES
('Dr. Farhan', 1645324356, 20000, 6),
('Dr. Shardul', 1546789104, 40000, 10),
('Dr. Suchona', 1754278908, 25000, 7),
('Dr. Suvro', 1845673245, 30000, 8);

-- --------------------------------------------------------

--
-- Table structure for table `nurse_info`
--

CREATE TABLE `nurse_info` (
  `name` varchar(20) NOT NULL,
  `Contact` int(15) NOT NULL,
  `Salary` int(10) NOT NULL,
  `Working_Hour` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nurse_info`
--

INSERT INTO `nurse_info` (`name`, `Contact`, `Salary`, `Working_Hour`) VALUES
('Ms.Dina', 1345678909, 15000, 6),
('Ms. Hinata', 1465789054, 20000, 8),
('Ms. Susmita', 1354678909, 18000, 6),
('Ms. Sejuti', 1356789087, 12000, 7);

-- --------------------------------------------------------

--
-- Table structure for table `patient_info`
--

CREATE TABLE `patient_info` (
  `Name` varchar(20) NOT NULL,
  `Contact` int(15) NOT NULL,
  `Disease` varchar(15) NOT NULL,
  `Realese date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_info`
--

INSERT INTO `patient_info` (`Name`, `Contact`, `Disease`, `Realese date`) VALUES
('Karim Mondol', 1577777788, 'Tubercalosis', '0000-00-00'),
('Saif hossain', 1655557575, 'Cholera', '2019-01-02'),
('Upama Chy', 172452899, 'Scizophrenia', '2017-08-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor_info`
--
ALTER TABLE `doctor_info`
  ADD PRIMARY KEY (`doc_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
