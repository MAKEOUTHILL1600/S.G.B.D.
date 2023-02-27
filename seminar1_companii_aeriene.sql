-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2023 at 07:47 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seminar1_companii_aeriene`
--

-- --------------------------------------------------------

--
-- Table structure for table `bilete`
--

CREATE TABLE `bilete` (
  `cod_bilet` int(11) NOT NULL,
  `cod_cursa` int(11) DEFAULT NULL,
  `cod_client` int(11) DEFAULT NULL,
  `data_achizitie` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clienti`
--

CREATE TABLE `clienti` (
  `cod_client` int(11) NOT NULL,
  `nume` varchar(20) DEFAULT NULL,
  `prenume` varchar(20) DEFAULT NULL,
  `adresa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companii_aeriene`
--

CREATE TABLE `companii_aeriene` (
  `cod_companie` int(11) NOT NULL,
  `denumire` varchar(30) DEFAULT NULL,
  `tara` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companii_localitati`
--

CREATE TABLE `companii_localitati` (
  `cod_companie` int(11) DEFAULT NULL,
  `cod_localitate` int(11) DEFAULT NULL,
  `data_achizitie` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `curse_aeriene`
--

CREATE TABLE `curse_aeriene` (
  `cod_cursa` int(11) NOT NULL,
  `cod_zbor` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `pret` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `localitati`
--

CREATE TABLE `localitati` (
  `cod_localitate` int(11) NOT NULL,
  `nume_localitate` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zboruri`
--

CREATE TABLE `zboruri` (
  `cod_zbor` int(11) NOT NULL,
  `cod_companie` int(11) DEFAULT NULL,
  `cod_localitate_plecare` int(11) DEFAULT NULL,
  `cod_localitate_sosire` int(11) DEFAULT NULL,
  `minute_intarziere` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bilete`
--
ALTER TABLE `bilete`
  ADD PRIMARY KEY (`cod_bilet`),
  ADD KEY `cod_cursa` (`cod_cursa`),
  ADD KEY `cod_client` (`cod_client`);

--
-- Indexes for table `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`cod_client`);

--
-- Indexes for table `companii_aeriene`
--
ALTER TABLE `companii_aeriene`
  ADD PRIMARY KEY (`cod_companie`);

--
-- Indexes for table `companii_localitati`
--
ALTER TABLE `companii_localitati`
  ADD KEY `cod_companie` (`cod_companie`),
  ADD KEY `cod_localitate` (`cod_localitate`);

--
-- Indexes for table `curse_aeriene`
--
ALTER TABLE `curse_aeriene`
  ADD PRIMARY KEY (`cod_cursa`),
  ADD KEY `cod_zbor` (`cod_zbor`);

--
-- Indexes for table `localitati`
--
ALTER TABLE `localitati`
  ADD PRIMARY KEY (`cod_localitate`);

--
-- Indexes for table `zboruri`
--
ALTER TABLE `zboruri`
  ADD PRIMARY KEY (`cod_zbor`),
  ADD KEY `cod_companie` (`cod_companie`),
  ADD KEY `cod_localitate_plecare` (`cod_localitate_plecare`),
  ADD KEY `cod_localitate_sosire` (`cod_localitate_sosire`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bilete`
--
ALTER TABLE `bilete`
  ADD CONSTRAINT `bilete_ibfk_1` FOREIGN KEY (`cod_cursa`) REFERENCES `curse_aeriene` (`cod_cursa`),
  ADD CONSTRAINT `bilete_ibfk_2` FOREIGN KEY (`cod_client`) REFERENCES `clienti` (`cod_client`);

--
-- Constraints for table `companii_localitati`
--
ALTER TABLE `companii_localitati`
  ADD CONSTRAINT `companii_localitati_ibfk_1` FOREIGN KEY (`cod_companie`) REFERENCES `companii_aeriene` (`cod_companie`),
  ADD CONSTRAINT `companii_localitati_ibfk_2` FOREIGN KEY (`cod_localitate`) REFERENCES `localitati` (`cod_localitate`);

--
-- Constraints for table `curse_aeriene`
--
ALTER TABLE `curse_aeriene`
  ADD CONSTRAINT `curse_aeriene_ibfk_1` FOREIGN KEY (`cod_zbor`) REFERENCES `zboruri` (`cod_zbor`);

--
-- Constraints for table `zboruri`
--
ALTER TABLE `zboruri`
  ADD CONSTRAINT `zboruri_ibfk_1` FOREIGN KEY (`cod_companie`) REFERENCES `companii_aeriene` (`cod_companie`),
  ADD CONSTRAINT `zboruri_ibfk_2` FOREIGN KEY (`cod_localitate_plecare`) REFERENCES `localitati` (`cod_localitate`),
  ADD CONSTRAINT `zboruri_ibfk_3` FOREIGN KEY (`cod_localitate_sosire`) REFERENCES `localitati` (`cod_localitate`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
