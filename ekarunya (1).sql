-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2020 at 10:15 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ekarunya`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Username`, `Password`) VALUES
('ADMIN', 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `senderName` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `Message` varchar(255) NOT NULL,
  `DateTime` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `senderName`, `title`, `Message`, `DateTime`) VALUES
(1, 'a', 'a', 'a', 'a'),
(2, 'Sreedarsh', 'Site dosnt yield results', '', 'Jan,14,2019 07:19:26 PM'),
(3, 'Sreedarsh', 'Site dosnt yield results', '', 'Jan,14,2019 07:20:30 PM'),
(4, 'Sreedarsh', 'Site dosnt yield results', '', 'Jan,14,2019 07:21:17 PM'),
(5, 'Sreedarsh', 'Site dosnt yield results', 'Thw site doesnot gove results', 'Jan,14,2019 07:21:48 PM'),
(6, 'Sreedarsh S', 'I cannot upload docs to the folder', 'Cannot upload verification docs.', 'Feb,05,2019 10:21:23 AM');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `Id` int(11) NOT NULL,
  `Message` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`Id`, `Message`) VALUES
(2, 'A blood donation drive is happening soon.'),
(1, 'A blood donation drive is happening soon.');

-- --------------------------------------------------------

--
-- Table structure for table `oldage`
--

CREATE TABLE `oldage` (
  `id` int(50) NOT NULL,
  `OrganisationName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mainphone` varchar(50) NOT NULL,
  `altphone` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `regNo` varchar(50) NOT NULL,
  `careTakerName` varchar(50) NOT NULL,
  `careTakerPhone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `oldage`
--

INSERT INTO `oldage` (`id`, `OrganisationName`, `email`, `mainphone`, `altphone`, `Address`, `regNo`, `careTakerName`, `careTakerPhone`, `password`, `status`) VALUES
(1, 'amma', 'amma@gmail.com', '1234', '12345', 'amma kollam', '12333', 'gokul', '1234', '111', 'Approve');

-- --------------------------------------------------------

--
-- Table structure for table `orphanage`
--

CREATE TABLE `orphanage` (
  `id` int(50) NOT NULL,
  `OrganisationName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mainphone` varchar(50) NOT NULL,
  `altphone` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `regNo` varchar(50) NOT NULL,
  `careTakerName` varchar(50) NOT NULL,
  `careTakerPhone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orphanage`
--

INSERT INTO `orphanage` (`id`, `OrganisationName`, `email`, `mainphone`, `altphone`, `Address`, `regNo`, `careTakerName`, `careTakerPhone`, `password`, `status`) VALUES
(1, 'nsk', 'nsk@gmail.com', '123456', '123456', 'Ns kollam', '123', 'siva', '123456', '123', 'Approve');

-- --------------------------------------------------------

--
-- Table structure for table `orphanmembers`
--

CREATE TABLE `orphanmembers` (
  `id` int(50) NOT NULL,
  `mem_name` varchar(50) NOT NULL,
  `mem_age` varchar(50) NOT NULL,
  `mem_gender` varchar(50) NOT NULL,
  `mem_orphan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orphanmembers`
--

INSERT INTO `orphanmembers` (`id`, `mem_name`, `mem_age`, `mem_gender`, `mem_orphan`) VALUES
(1, 'meenu', '22', 'female', 'nsk');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `Post_id` int(11) NOT NULL,
  `DateTime` varchar(50) NOT NULL,
  `OwnerId` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Status` int(11) NOT NULL,
  `files` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`Post_id`, `DateTime`, `OwnerId`, `Title`, `Description`, `Status`, `files`) VALUES
(9, '05,Feb,2019 07:12:21 PM', 1, 'Needs donors for a 3year olds livertransplant', 'Needs this asap.', 1, ',05-02-2019-19-12-41-Screenshot from 2019-02-04 13-43-08.png'),
(4, 'Jan,14,2019 06:20:04 PM', 1, 'Help needed to fund a heart operation', 'Need 7.5 lakhs to fund a heart operation', 1, ''),
(5, 'Jan,14,2019 06:28:20 PM', 1, 'Need Help For blood Transfusion', 'Needs blood group AB+ve for blood transfusion', 0, ',14-01-2019-18-30-49-smile.png'),
(6, '04,Feb,2019 03:27:53 PM', 4, 'Needs help for transportation', 'needs rs 1000', 1, ''),
(7, '05,Feb,2019 10:20:08 AM', 11, 'Needs donors for a 3year olds livertransplant', 'needs ab+ ve donor for a 3 year old child.', 0, ''),
(8, '05,Feb,2019 06:44:45 PM', 1, 'Needs help for transportation', 'Needs rs 100000 for transporting a critical patient', 0, ',05-02-2019-18-45-20-Screenshot from 2019-01-28 20-57-03.png'),
(10, '05,Feb,2019 07:58:51 PM', 6, 'Needs help', 'hai', 0, ',05-02-2019-19-59-29-Screenshot from 2019-02-03 23-23-39.png'),
(11, '28,Feb,2019 12:16:38 PM', 1, 'Need AB+ve blood', '3 donors', 1, ',28-02-2019-12-17-02-Dfd Diagram.docx'),
(13, '16,Jan,2020 10:36:45 PM', 1, 'gh', 'xbxcb', 0, ',16-01-2020-22-37-05-1.jpg'),
(14, '16,Jan,2020 10:37:09 PM', 1, 'gh', 'swafsd', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `sponsormember`
--

CREATE TABLE `sponsormember` (
  `id` int(50) NOT NULL,
  `sp_name` varchar(50) NOT NULL,
  `sp_age` varchar(50) NOT NULL,
  `sp_gender` varchar(50) NOT NULL,
  `sp_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sponsormember`
--

INSERT INTO `sponsormember` (`id`, `sp_name`, `sp_age`, `sp_gender`, `sp_type`) VALUES
(1, 'gokul', '23', 'male', 'regular');

-- --------------------------------------------------------

--
-- Table structure for table `sponsorrequest`
--

CREATE TABLE `sponsorrequest` (
  `sp_req_id` int(50) NOT NULL,
  `sp_req_name` text NOT NULL,
  `sp_req_address` varchar(50) NOT NULL,
  `sp_req_phone` varchar(50) NOT NULL,
  `sp_req_date` datetime NOT NULL,
  `sp_req_user` varchar(50) NOT NULL,
  `sp_request_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sponsorrequest`
--

INSERT INTO `sponsorrequest` (`sp_req_id`, `sp_req_name`, `sp_req_address`, `sp_req_phone`, `sp_req_date`, `sp_req_user`, `sp_request_status`) VALUES
(1, 'fathima', 'fathima nivas', '343546', '0000-00-00 00:00:00', '14', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Alternate` varchar(50) DEFAULT NULL,
  `Address` varchar(250) NOT NULL,
  `Dob` varchar(25) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `Name`, `Email`, `Phone`, `Alternate`, `Address`, `Dob`, `Password`, `status`) VALUES
(1, 'Sreedarsh S', 'Mail@gmail.com', '9235827275', 'aphone', 'Kollam', '1990-06-13', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 1),
(2, 'Sreelekshmi C S', 'A@a.com', '9235827275', 'aphone', 'Address', '2019-02-21', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 1),
(3, 'a', 'A@a.com', '9876543210', 'aphone', 'Kollam', '2019-02-18', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 1),
(4, 'asd', 'A@a.com', '9895040770', 'aphone', '9895040770', '2019-02-14', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 1),
(5, 'asd', 'A@a.com', '9895040770', 'aphone', '9895040770', '2019-02-14', '3da541559918a808c2402bba5012f6c60b27661c', 1),
(6, 'b', 'b@b.com', '9895040770', 'aphone', '9895040770', '2019-02-13', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 1),
(7, 'b', 'b@b.com', '9895040770', 'aphone', '9895040770', '2019-02-13', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 1),
(8, 'b', 'b@b.com', '9895040770', 'aphone', '9895040770', '2019-02-13', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 1),
(9, 'b', 'b@b.com', '9895040770', 'aphone', '9895040770', '2019-02-13', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 1),
(10, 'b', 'b@b.com', '9895040770', 'aphone', '9895040770', '2019-02-13', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 1),
(11, 'Sreedarsh S', 'SreedarshShaji@outlook.com', '9895040770', 'aphone', 'Kollam', '1992-05-11', '8cb2237d0679ca88db6464eac60da96345513964', 1),
(12, 'Anju M Vargheese', 'anju@gmail.com', '9061414191', 'aphone', 'NSKOLLAM', '1996-05-11', '13b72643a5b7108d0c331d2788c50c2e56d0f7be', 1),
(13, 'Gokul', 'gokul@gmail.com', '7736483306', 'aphone', 'G.K Bhavanam', '2020-01-28', '1234', 1),
(14, 'FATHIMA', 'f@gmail.com', '9999999999', 'aphone', 'fathima mansil', '2020-02-14', '111', 1);

-- --------------------------------------------------------

--
-- Table structure for table `womenwelfare`
--

CREATE TABLE `womenwelfare` (
  `id` int(50) NOT NULL,
  `OrganisationName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mainphone` varchar(50) NOT NULL,
  `altphone` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `regNo` varchar(50) NOT NULL,
  `careTakerName` varchar(50) NOT NULL,
  `careTakerPhone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `womenwelfare`
--

INSERT INTO `womenwelfare` (`id`, `OrganisationName`, `email`, `mainphone`, `altphone`, `Address`, `regNo`, `careTakerName`, `careTakerPhone`, `password`, `status`) VALUES
(1, 'sree', 'sree@gmail.com', '6788', '5678', 'sree kollam', '0099', 'anju', '6788', '0000', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `oldage`
--
ALTER TABLE `oldage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orphanage`
--
ALTER TABLE `orphanage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orphanmembers`
--
ALTER TABLE `orphanmembers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`Post_id`);

--
-- Indexes for table `sponsormember`
--
ALTER TABLE `sponsormember`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sponsorrequest`
--
ALTER TABLE `sponsorrequest`
  ADD PRIMARY KEY (`sp_req_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `womenwelfare`
--
ALTER TABLE `womenwelfare`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oldage`
--
ALTER TABLE `oldage`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orphanage`
--
ALTER TABLE `orphanage`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orphanmembers`
--
ALTER TABLE `orphanmembers`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `Post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sponsormember`
--
ALTER TABLE `sponsormember`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sponsorrequest`
--
ALTER TABLE `sponsorrequest`
  MODIFY `sp_req_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `womenwelfare`
--
ALTER TABLE `womenwelfare`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
