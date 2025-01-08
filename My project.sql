-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 09, 2025 at 05:38 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
CREATE TABLE IF NOT EXISTS `facilities` (
  `FacilityID` int NOT NULL,
  `FacilityName` varchar(100) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `FacilityType` enum('Clinic','Hospital','Lab') NOT NULL,
  PRIMARY KEY (`FacilityID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labtests`
--

DROP TABLE IF EXISTS `labtests`;
CREATE TABLE IF NOT EXISTS `labtests` (
  `TestID` int NOT NULL,
  `PatientID` int NOT NULL,
  `TestDate` date NOT NULL,
  `TestType` varchar(100) NOT NULL,
  `Results` text,
  PRIMARY KEY (`TestID`),
  KEY `PatientID` (`PatientID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `PatientID` int NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `DOB` date NOT NULL,
  `Gender` enum('M','F') NOT NULL,
  `DateRegistered` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PatientID`),
  UNIQUE KEY `ContactNumber` (`ContactNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
CREATE TABLE IF NOT EXISTS `resources` (
  `ResourceID` int NOT NULL,
  `FacilityID` int NOT NULL,
  `ResourceType` varchar(100) NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`ResourceID`),
  KEY `FacilityID` (`FacilityID`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `treatments`
--

DROP TABLE IF EXISTS `treatments`;
CREATE TABLE IF NOT EXISTS `treatments` (
  `TreatmentID` int NOT NULL,
  `PatientID` int NOT NULL,
  `TreatmentDate` date NOT NULL,
  `Diagnosis` varchar(255) NOT NULL,
  `MedicationPrescribed` text,
  `TreatmentNotes` text,
  PRIMARY KEY (`TreatmentID`),
  KEY `PatientID` (`PatientID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
