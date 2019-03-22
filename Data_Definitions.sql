-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: Mar 19, 2019 at 12:18 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_swidera`
--

-- --------------------------------------------------------

--
-- Table structure for table `Coach`
--

CREATE TABLE `Coach` (
  `ID_Coach` int(11) NOT NULL,
  `First_Name` char(50) DEFAULT NULL,
  `Last_Name` char(50) DEFAULT NULL,
  `Team` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Coach`
--

INSERT INTO `Coach` (`ID_Coach`, `First_Name`, `Last_Name`, `Team`) VALUES
(1, 'Bill', 'Belichick', 'NE'),
(2, 'Sean', 'McVay', 'LAR');

-- --------------------------------------------------------

--
-- Table structure for table `Coach_Position`
--

CREATE TABLE `Coach_Position` (
  `ID_Coach` int(11) NOT NULL,
  `ID_Position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `diagnostic`
--

CREATE TABLE `diagnostic` (
  `id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `diagnostic`
--

INSERT INTO `diagnostic` (`id`, `text`) VALUES
(1, 'MySQL is Working!');

-- --------------------------------------------------------

--
-- Table structure for table `Front_Office`
--

CREATE TABLE `Front_Office` (
  `ID_Front_Office` int(11) NOT NULL,
  `First_Name` char(50) DEFAULT NULL,
  `Last_Name` char(50) DEFAULT NULL,
  `Role` char(50) DEFAULT NULL,
  `Team` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Front_Office`
--

INSERT INTO `Front_Office` (`ID_Front_Office`, `First_Name`, `Last_Name`, `Role`, `Team`) VALUES
(1, 'Robert', 'Craft', 'Owner', 'NE'),
(2, 'Bill', 'Belichick', 'General Manager', 'NE'),
(3, 'Stan', 'Kroenke', 'Owner', 'LAR');

-- --------------------------------------------------------

--
-- Table structure for table `Player`
--

CREATE TABLE `Player` (
  `ID_Player` int(11) NOT NULL,
  `First_Name` char(50) DEFAULT NULL,
  `Last_Name` char(50) DEFAULT NULL,
  `College` char(50) DEFAULT NULL,
  `Number` char(2) DEFAULT NULL,
  `Team` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Player`
--

INSERT INTO `Player` (`ID_Player`, `First_Name`, `Last_Name`, `College`, `Number`, `Team`) VALUES
(1, 'Tom', 'Brady', 'Michigan', '12', 'NE'),
(2, 'Aaron', 'Donald', 'Pittsburgh', '99', 'LAR'),
(3, 'Aaron', 'Rodgers', 'California', '12', 'GB'),
(4, 'Davante', 'Adams', 'Fresno State', '17', 'GB'),
(5, 'Philip', 'Rivers', 'North Carolina State', '17', 'LAC'),
(6, 'Russell', 'Okung', 'Oklahoma State', '76', 'LAC'),
(7, 'Casey', 'Hayward', 'Vanderbilt', '26', 'LAC'),
(8, 'Rashaad', 'Penny', 'San Diego State', '20', 'SEA'),
(9, 'Shaquill', 'Griffin', 'University of Central Florida', '26', 'SEA');

-- --------------------------------------------------------

--
-- Table structure for table `Player_Position`
--

CREATE TABLE `Player_Position` (
  `ID_Player` int(11) NOT NULL,
  `ID_Position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Player_Position`
--

INSERT INTO `Player_Position` (`ID_Player`, `ID_Position`) VALUES
(1, 1),
(2, 2),
(4, 5),
(5, 1),
(8, 3),
(8, 18);

-- --------------------------------------------------------

--
-- Table structure for table `Position`
--

CREATE TABLE `Position` (
  `ID_Position` int(11) NOT NULL,
  `Position_Type` char(15) DEFAULT NULL,
  `Position_Group` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Position`
--

INSERT INTO `Position` (`ID_Position`, `Position_Type`, `Position_Group`) VALUES
(1, 'Offense', 'Quarterback'),
(2, 'Defense', 'Defensive Tackle'),
(3, 'Offense', 'Running Back'),
(4, 'Offense', 'Full Back'),
(5, 'Offense', 'Wide Receiver'),
(6, 'Offense', 'Tight End'),
(7, 'Offense', 'Tackle'),
(8, 'Offense', 'Guard'),
(9, 'Offense', 'Center'),
(10, 'Defense', 'Defensive End'),
(11, 'Defense', 'Outside Linebacker'),
(12, 'Defense', 'Inside Linebacker'),
(13, 'Defense', 'Cornerback'),
(14, 'Defense', 'Safety'),
(15, 'Special Teams', 'Kicker'),
(16, 'Special Teams', 'Punter'),
(17, 'Special Teams', 'Long Snapper'),
(18, 'Special Teams', 'Returner');

-- --------------------------------------------------------

--
-- Table structure for table `Team`
--

CREATE TABLE `Team` (
  `Abbreviation` char(4) NOT NULL,
  `Name` char(25) DEFAULT NULL,
  `City` char(50) DEFAULT NULL,
  `State` char(50) DEFAULT NULL,
  `Country` char(50) DEFAULT NULL,
  `Stadium` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Team`
--

INSERT INTO `Team` (`Abbreviation`, `Name`, `City`, `State`, `Country`, `Stadium`) VALUES
('GB', 'Packers', 'Green Bay', 'Wisconsin', 'United States', 'Lambeau Field'),
('LAC', 'Chargers', 'Carson', 'California', 'United States', 'Dignity Health Sports Park'),
('LAR', 'Rams', 'Los Angeles', 'California', 'United States', 'Los Angeles Memorial Coliseum'),
('NE', 'Patriots', 'New England', 'Massachusetts', 'United States', 'Gillette Stadium'),
('SEA', 'Seahawks', 'Seattle', 'Washington', 'United States', 'CenturyLink Field');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Coach`
--
ALTER TABLE `Coach`
  ADD PRIMARY KEY (`ID_Coach`),
  ADD KEY `Team_Coach` (`Team`);

--
-- Indexes for table `Coach_Position`
--
ALTER TABLE `Coach_Position`
  ADD PRIMARY KEY (`ID_Coach`,`ID_Position`),
  ADD KEY `cPosition_ID` (`ID_Position`);

--
-- Indexes for table `diagnostic`
--
ALTER TABLE `diagnostic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Front_Office`
--
ALTER TABLE `Front_Office`
  ADD PRIMARY KEY (`ID_Front_Office`),
  ADD KEY `Team_Front_Office` (`Team`);

--
-- Indexes for table `Player`
--
ALTER TABLE `Player`
  ADD PRIMARY KEY (`ID_Player`),
  ADD KEY `Team_Player` (`Team`);

--
-- Indexes for table `Player_Position`
--
ALTER TABLE `Player_Position`
  ADD PRIMARY KEY (`ID_Player`,`ID_Position`) USING BTREE;

--
-- Indexes for table `Position`
--
ALTER TABLE `Position`
  ADD PRIMARY KEY (`ID_Position`);

--
-- Indexes for table `Team`
--
ALTER TABLE `Team`
  ADD PRIMARY KEY (`Abbreviation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Coach`
--
ALTER TABLE `Coach`
  MODIFY `ID_Coach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `diagnostic`
--
ALTER TABLE `diagnostic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Front_Office`
--
ALTER TABLE `Front_Office`
  MODIFY `ID_Front_Office` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Player`
--
ALTER TABLE `Player`
  MODIFY `ID_Player` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Position`
--
ALTER TABLE `Position`
  MODIFY `ID_Position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Coach`
--
ALTER TABLE `Coach`
  ADD CONSTRAINT `Team_Coach` FOREIGN KEY (`Team`) REFERENCES `Team` (`Abbreviation`);

--
-- Constraints for table `Coach_Position`
--
ALTER TABLE `Coach_Position`
  ADD CONSTRAINT `Coach_ID` FOREIGN KEY (`ID_Coach`) REFERENCES `Coach` (`ID_Coach`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cPosition_ID` FOREIGN KEY (`ID_Position`) REFERENCES `Position` (`ID_Position`);

--
-- Constraints for table `Front_Office`
--
ALTER TABLE `Front_Office`
  ADD CONSTRAINT `Team_Front_Office` FOREIGN KEY (`Team`) REFERENCES `Team` (`Abbreviation`);

--
-- Constraints for table `Player`
--
ALTER TABLE `Player`
  ADD CONSTRAINT `Team_Player` FOREIGN KEY (`Team`) REFERENCES `Team` (`Abbreviation`);

--
-- Constraints for table `Player_Position`
--
ALTER TABLE `Player_Position`
  ADD CONSTRAINT `Player_ID` FOREIGN KEY (`ID_Player`) REFERENCES `Player` (`ID_Player`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

