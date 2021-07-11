-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2021 at 05:23 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pesanan`
--

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `FoodId` int(30) NOT NULL,
  `FoodName` varchar(50) NOT NULL,
  `Price` int(11) NOT NULL,
  `Categories` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`FoodId`, `FoodName`, `Price`, `Categories`) VALUES
(1, 'Ice Tea', 4000, 'Drink'),
(2, 'Bread Toast', 22000, 'Eat'),
(3, 'Spagetti', 16000, 'Eat'),
(4, 'Hot Tea', 4000, 'Drink'),
(5, 'Hot Choco', 10000, 'Drink'),
(6, 'Potato Stick', 8000, 'Eat'),
(7, 'Omelet', 4000, 'Eat'),
(8, 'Mie dok-dok', 12000, 'Eat'),
(9, 'Orange Juice', 5000, 'Drink'),
(10, 'Milk Shake Vanilla', 12000, 'Drink'),
(11, 'Milk Shake Chocolate', 12000, 'Drink'),
(12, 'Americano Coffee', 28000, 'Drink'),
(13, 'Mie Aceh', 17000, 'Eat'),
(14, 'Kopi Karo', 12000, 'Drink'),
(15, 'Kopi Tubruk', 7000, 'Drink');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderId` int(11) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `OrderAmount` int(11) NOT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderId`, `CustomerName`, `OrderAmount`, `Total`) VALUES
(1, 'Aswira', 2, 8000),
(8, 'Arep', 2, 18000),
(9, 'gisa', 10, 34000),
(10, 'azzam', 6, 40000),
(12, 'richBOY', 6, 76000),
(13, 'paijo', 5, 91000);

-- --------------------------------------------------------

--
-- Table structure for table `orderbasket`
--

CREATE TABLE `orderbasket` (
  `FName` int(11) NOT NULL,
  `jml` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `FoodId` int(30) NOT NULL,
  `AmountOrder` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`FoodId`, `AmountOrder`, `OrderId`) VALUES
(1, 2, 1),
(5, 1, 8),
(6, 1, 8),
(7, 4, 9),
(5, 1, 9),
(8, 1, 9),
(1, 3, 9),
(4, 1, 9),
(6, 1, 10),
(8, 1, 10),
(3, 2, 10),
(1, 2, 10),
(1, 1, 12),
(6, 1, 12),
(2, 2, 12),
(5, 2, 12),
(10, 1, 13),
(12, 1, 13),
(2, 1, 13),
(13, 1, 13),
(14, 1, 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`FoodId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderId`);

--
-- Indexes for table `orderbasket`
--
ALTER TABLE `orderbasket`
  ADD KEY `FName` (`FName`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD KEY `OrderId` (`OrderId`),
  ADD KEY `FoodId` (`FoodId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `FoodId` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderbasket`
--
ALTER TABLE `orderbasket`
  ADD CONSTRAINT `orderbasket_ibfk_1` FOREIGN KEY (`FName`) REFERENCES `food` (`FoodId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`OrderId`) REFERENCES `order` (`OrderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetail_ibfk_3` FOREIGN KEY (`FoodId`) REFERENCES `food` (`FoodId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
