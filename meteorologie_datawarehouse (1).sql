-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 30, 2017 at 11:08 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `meteorologie_datawarehouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `dimension_region`
--

DROP TABLE IF EXISTS `dimension_region`;
CREATE TABLE IF NOT EXISTS `dimension_region` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) DEFAULT NULL,
  `east` float DEFAULT NULL,
  `nord` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `amsl` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dimension_temps`
--

DROP TABLE IF EXISTS `dimension_temps`;
CREATE TABLE IF NOT EXISTS `dimension_temps` (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `annee` int(4) DEFAULT NULL,
  `mois` int(2) DEFAULT NULL,
  `trimestre` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2630 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fait_meteo`
--

DROP TABLE IF EXISTS `fait_meteo`;
CREATE TABLE IF NOT EXISTS `fait_meteo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_dimension_region` int(2) DEFAULT NULL,
  `id_dimension_temps` int(6) DEFAULT NULL,
  `temp_max` float DEFAULT NULL,
  `temp_min` float DEFAULT NULL,
  `af_days` int(2) DEFAULT NULL,
  `rain` float DEFAULT NULL,
  `sun` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_meteo_temps` (`id_dimension_temps`),
  KEY `fk_meteo_region` (`id_dimension_region`)
) ENGINE=MyISAM AUTO_INCREMENT=34999 DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
