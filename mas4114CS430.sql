-- phpMyAdmin SQL Dump
-- version 3.3.2deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 25, 2012 at 09:21 PM
-- Server version: 5.3.5
-- PHP Version: 5.3.2-1ubuntu4.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mas4114CS430`
--

-- --------------------------------------------------------

--
-- Table structure for table `ALUMNI_INITIATE`
--

CREATE TABLE IF NOT EXISTS `ALUMNI_INITIATE` (
  `ALUMNI_FNAME` varchar(20) NOT NULL,
  `ALUMNI_LNAME` varchar(20) NOT NULL,
  `ALUMNI_DDNUMBER` int(4) NOT NULL,
  `ALUMNI_IS_DECEASED` tinyint(1) NOT NULL,
  PRIMARY KEY (`ALUMNI_FNAME`,`ALUMNI_LNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ALUMNI_INITIATE`
--

INSERT INTO `ALUMNI_INITIATE` (`ALUMNI_FNAME`, `ALUMNI_LNAME`, `ALUMNI_DDNUMBER`, `ALUMNI_IS_DECEASED`) VALUES
('Dale', 'Tilford', 145, 0),
('Gerold', 'Rennells', 30, 0),
('Harry', 'Witzel', 12, 0),
('Jason', 'Haxton', 144, 0),
('Jerry', 'Casebolt', 19, 0),
('John', 'Erhart', 7, 0),
('John', 'Rodman', 16, 0),
('Thomas', 'Rodman', 37, 0),
('Thomas', 'Thompson', 106, 0),
('Zelwin', 'Eaton', 74, 0);

-- --------------------------------------------------------

--
-- Table structure for table `CHAPTER_ETERNAL`
--

CREATE TABLE IF NOT EXISTS `CHAPTER_ETERNAL` (
  `CE_FNAME` varchar(20) NOT NULL,
  `CE_LNAME` varchar(20) NOT NULL,
  `CE_DATE_OF_DEATH` date DEFAULT NULL,
  PRIMARY KEY (`CE_FNAME`,`CE_LNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CHAPTER_ETERNAL`
--

INSERT INTO `CHAPTER_ETERNAL` (`CE_FNAME`, `CE_LNAME`, `CE_DATE_OF_DEATH`) VALUES
('David', 'Schafer', NULL),
('Eric', 'White', NULL),
('Kurt', 'Moll', NULL),
('Ronald', 'Lamaster', NULL),
('Timothy', 'Ernst', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `FRATERNITY_MEMBER`
--

CREATE TABLE IF NOT EXISTS `FRATERNITY_MEMBER` (
  `FMEMBER_LNAME` varchar(20) NOT NULL,
  `FMEMBER_FNAME` varchar(20) NOT NULL,
  `FMEMBER_NICKNAME` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`FMEMBER_LNAME`,`FMEMBER_FNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FRATERNITY_MEMBER`
--

INSERT INTO `FRATERNITY_MEMBER` (`FMEMBER_LNAME`, `FMEMBER_FNAME`, `FMEMBER_NICKNAME`) VALUES
('Brune', 'Zac', 'FRIENDZONE'),
('Carter', 'Brandon', '6-FOOT HUGER THAN YOU'),
('Chris', 'Zempel', 'TRIPLE LAYER FRIDGE SITTER'),
('Foss', 'Kevin', 'DATELINE NBC''S STARGAZER'),
('Gunn', 'Dan', 'MR.GORBACHEV, PUKE IN THESE SHOES'),
('Helwig', 'Andy', 'DPS HATES DIABETES'),
('Wang', 'Jess', 'UPSIDEDOWN VOMIT CHUGGING WATERWORKS'),
('White', 'Kyle', 'WHOOMP! THERES MY 11 HERBS AND SPICES');

-- --------------------------------------------------------

--
-- Table structure for table `INITIATED_BROTHER`
--

CREATE TABLE IF NOT EXISTS `INITIATED_BROTHER` (
  `IBROTHER_FNAME` varchar(20) NOT NULL,
  `IBROTHER_LNAME` varchar(20) NOT NULL,
  `IBROTHER_DDNUMBER` int(4) NOT NULL,
  `IBROTHER_IS_BIG_OF` int(11) DEFAULT NULL,
  `IBROTHER_TYPE` enum('CURRENT_BROTHER','REGULAR_INITIATED_ALUMNI') NOT NULL COMMENT ' CURRENT VS ALUMNI',
  `IBROTHER_IS_DECEASED` tinyint(1) NOT NULL,
  PRIMARY KEY (`IBROTHER_FNAME`,`IBROTHER_LNAME`),
  UNIQUE KEY `IBROTHER_DDNUMBER` (`IBROTHER_DDNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `INITIATED_BROTHER`
--

INSERT INTO `INITIATED_BROTHER` (`IBROTHER_FNAME`, `IBROTHER_LNAME`, `IBROTHER_DDNUMBER`, `IBROTHER_IS_BIG_OF`, `IBROTHER_TYPE`, `IBROTHER_IS_DECEASED`) VALUES
('Andy', 'Hellwig', 729, 702, 'CURRENT_BROTHER', 0),
('Brandon', 'Carter', 736, NULL, 'CURRENT_BROTHER', 0),
('Brian', 'Krzyzanowski', 702, 735, 'REGULAR_INITIATED_ALUMNI', 0),
('Chris', 'Zempel', 728, NULL, 'CURRENT_BROTHER', 0),
('Dan', 'Gunn', 730, NULL, 'CURRENT_BROTHER', 0),
('Greg', 'Cejas', 732, NULL, 'CURRENT_BROTHER', 0),
('Jeff', 'Wang', 733, NULL, 'CURRENT_BROTHER', 0),
('Kevin', 'Foss', 734, 732, 'CURRENT_BROTHER', 0),
('Kyle', 'White', 731, NULL, 'REGULAR_INITIATED_ALUMNI', 0),
('Mark', 'Sansgaard', 751, 727, 'CURRENT_BROTHER', 0),
('Todd', 'Lesinski', 735, 751, 'CURRENT_BROTHER', 0),
('Zac', 'Brune', 727, NULL, 'REGULAR_INITIATED_ALUMNI', 0);

-- --------------------------------------------------------

--
-- Table structure for table `REGULAR_MEMBER`
--

CREATE TABLE IF NOT EXISTS `REGULAR_MEMBER` (
  `RMEMBER_FNAME` varchar(20) NOT NULL,
  `RMEMBER_LNAME` varchar(20) NOT NULL,
  `RMEMBER_PLEDGE_YEAR` int(4) NOT NULL,
  `RMEMBER_PLEDGE_SEMESTER` enum('SPRING','FALL') NOT NULL,
  `RMEMBER_IS_LITTLE_OF_BROTHER_NUMBER` int(4) DEFAULT NULL,
  PRIMARY KEY (`RMEMBER_FNAME`,`RMEMBER_LNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `REGULAR_MEMBER`
--

INSERT INTO `REGULAR_MEMBER` (`RMEMBER_FNAME`, `RMEMBER_LNAME`, `RMEMBER_PLEDGE_YEAR`, `RMEMBER_PLEDGE_SEMESTER`, `RMEMBER_IS_LITTLE_OF_BROTHER_NUMBER`) VALUES
('Aaron', 'Bretz', 2008, 'FALL', NULL),
('Aaron', 'Hawes', 2003, 'SPRING', 729),
('Andrew', 'Jackoway', 2005, 'FALL', 731),
('Andy', 'Hellwig', 2009, 'SPRING', 728),
('Brandon', 'Carter', 2009, 'FALL', 736),
('Brian', 'Krzyzanowski', 2007, 'FALL', 727),
('Casey', 'Jovick', 2007, 'FALL', NULL),
('Chris', 'Arwood', 2006, 'SPRING', NULL),
('Chris', 'Peckham', 1999, 'FALL', NULL),
('Chris', 'Zempel', 2009, 'FALL', 727),
('Dan', 'Bradley', 1998, 'SPRING', NULL),
('Dan', 'Gunn', 2009, 'FALL', NULL),
('Dylan', 'Smith', 2010, 'FALL', NULL),
('Greg', 'Cejas', 2009, 'FALL', NULL),
('Jaidee', 'Moore', 2002, 'FALL', NULL),
('Jared', 'McKinney', 1997, 'FALL', NULL),
('Jeff', 'Wang', 2009, 'FALL', NULL),
('Jesse', 'Groethe', 2005, 'FALL', NULL),
('John', 'Van Huis', 2002, 'FALL', NULL),
('Justin', 'Irish', 2005, 'SPRING', NULL),
('Justin', 'Thompson', 2001, 'FALL', NULL),
('Justin', 'Zhang', 2005, 'FALL', NULL),
('Kevin', 'Foss', 2009, 'FALL', NULL),
('Kevin', 'Rose', 2005, 'FALL', NULL),
('Kyle', 'White', 2009, 'FALL', NULL),
('Mark', 'Sansgaard', 2010, 'FALL', 735),
('Nils', 'Carlsted', 2003, 'FALL', NULL),
('Owen', 'McQuintonfall', 2003, 'FALL', NULL),
('Paul', 'Witte', 2006, 'SPRING', NULL),
('Phil', 'Norton', 2006, 'SPRING', NULL),
('Sean', 'Larson', 1999, 'SPRING', NULL),
('Steve', 'Fries', 1999, 'FALL', NULL),
('Tim', 'Brandt', 2004, 'FALL', NULL),
('Todd', 'Lesinski', 2009, 'FALL', 702),
('Zac', 'Brune', 2009, 'FALL', 0);

-- --------------------------------------------------------

--
-- Table structure for table `UNINITIATED_MEMBER`
--

CREATE TABLE IF NOT EXISTS `UNINITIATED_MEMBER` (
  `UNINITIATED_FNAME` varchar(20) NOT NULL,
  `UNINITIATED_TYPE` enum('NEVER_INITIATED','WOODCHUCK','ASSOCIATE_MEMBER') NOT NULL,
  `UNINITIATED_LNAME` varchar(20) NOT NULL,
  PRIMARY KEY (`UNINITIATED_FNAME`,`UNINITIATED_LNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UNINITIATED_MEMBER`
--

INSERT INTO `UNINITIATED_MEMBER` (`UNINITIATED_FNAME`, `UNINITIATED_TYPE`, `UNINITIATED_LNAME`) VALUES
('Aaron', 'WOODCHUCK', 'Bretz'),
('Aaron', 'NEVER_INITIATED', 'Hawes'),
('Andrew', 'NEVER_INITIATED', 'Jackoway'),
('Andrew', 'ASSOCIATE_MEMBER', 'Robbins'),
('Ben', 'ASSOCIATE_MEMBER', 'French'),
('Casey', 'WOODCHUCK', 'Jovick'),
('Casey', 'ASSOCIATE_MEMBER', 'Schdeal'),
('Chris', 'NEVER_INITIATED', 'Arwood'),
('Chris', 'NEVER_INITIATED', 'Peckham'),
('Dan', 'NEVER_INITIATED', 'Bradley'),
('Duncan', 'ASSOCIATE_MEMBER', 'Reynolds'),
('Dylan', 'WOODCHUCK', 'Smith'),
('Ian', 'ASSOCIATE_MEMBER', 'Cantrell'),
('Jaidee', 'NEVER_INITIATED', 'Moore'),
('Jared', 'NEVER_INITIATED', 'McKinney'),
('Jesse', 'NEVER_INITIATED', 'Groethe'),
('Joe', 'ASSOCIATE_MEMBER', 'Grothe'),
('John', 'NEVER_INITIATED', 'Van Huis'),
('Justin', 'WOODCHUCK', 'Irish'),
('Justin', 'NEVER_INITIATED', 'Thompson'),
('Justin', 'NEVER_INITIATED', 'Zhang'),
('Kevin', 'NEVER_INITIATED', 'Rose'),
('Nils', 'NEVER_INITIATED', 'Carlsted'),
('Owen', 'NEVER_INITIATED', 'NcQuistonfall'),
('Paul', 'NEVER_INITIATED', 'Witte'),
('Phil', 'NEVER_INITIATED', 'Norton'),
('Sean', 'NEVER_INITIATED', 'Larson'),
('Steve', 'NEVER_INITIATED', 'Fries'),
('Tim', 'NEVER_INITIATED', 'Brandt'),
('Yohan', 'ASSOCIATE_MEMBER', 'French');
