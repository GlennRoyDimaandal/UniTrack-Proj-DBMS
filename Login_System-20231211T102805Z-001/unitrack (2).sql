-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2023 at 04:28 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unitrack`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `email`, `password`, `user_type`) VALUES
(1, 'earljohn', '22-34641@g.batstate-u.edu.ph', 'password123', 'admin'),
(2, 'glennd', '22-34111@g.batstate-u.edu.ph', 'password456', 'admin'),
(3, 'christiandiez', '22-34829@g.batstate-u.edu.ph', 'password789', 'admin'),
(4, 'kriztelmacaraig', '22-33427@g.batstate-u.edu.ph', 'password101', 'admin'),
(5, 'ajenderez', '21-37568@g.batstate-u.edu.ph', 'password202', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `boughtitems`
--

CREATE TABLE `boughtitems` (
  `item_ID` int(11) NOT NULL,
  `item` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ItemID` int(11) NOT NULL,
  `ItemName` varchar(255) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `QuantityAvailable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ItemID`, `ItemName`, `Price`, `Category`, `QuantityAvailable`) VALUES
(1, 'Polo men', 100.00, 'Uniform', 100),
(2, 'Pants', 100.00, 'Uniform', 100),
(3, 'Polo women', 100.00, 'Uniform', 100),
(4, 'Skirt', 100.00, 'Uniform', 100),
(5, 'ID Lace', 10.00, 'Merchandise', 100),
(6, 'Mug/Tumbler', 10.00, 'Merchandise', 100);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_details_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity_ordered` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preview_orders`
--

CREATE TABLE `preview_orders` (
  `preview_order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity_reserved` int(11) NOT NULL,
  `reservation_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `ItemID` int(11) NOT NULL,
  `ItemName` varchar(255) NOT NULL,
  `QuantityAvailable` int(11) NOT NULL,
  `LastUpdated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `user_type`) VALUES
(1, 'danlagelizajameah', 'elizajameahd@gmail.com', 'password1', 'user'),
(2, 'añonuevoalexandra', 'alexandra.pederoso110303@gmail.com', 'password2', 'user'),
(3, 'tolentinobrian', 'briantolentino311@gmail.com', 'password3', 'user'),
(4, 'aranetarusette', 'shekinah.araneta29@gmail.com', 'password4', 'user'),
(5, 'acielokanepaul', 'acielokanepaul24@gmail.com', 'password5', 'user'),
(6, 'laylojohnvincent', 'vincentlaylo07@gmail.com', 'password6', 'user'),
(7, 'suarezjadlaurence', 'Jadsuarez35@gmail.com', 'password7', 'user'),
(8, 'leynesrenan', 'renanleynes@gmail.com', 'password8', 'user'),
(9, 'laylojake', 'laylojake01@gmail.com', 'password9', 'user'),
(10, 'awitandanilyn', 'danilynawitan05@gmail.com', 'password10', 'user'),
(11, 'estolanovien', 'vienestolano770@gmail.com', 'password11', 'user'),
(12, 'rabinorommel', 'rommelrabino04@gmail.com', 'password12', 'user'),
(13, 'gutierreznathaniel', 'nathanielgutierrez70@gmail.com', 'password13', 'user'),
(14, 'andayadarleneaprille', 'adarleneaprille@gmail.com', 'password14', 'user'),
(15, 'sandigdaniellejean', 'sdaniellejean@gmail.com', 'password15', 'user'),
(16, 'padrejeromemaru', 'jeromemaruperez15@gmail.com', 'password16', 'user'),
(17, 'atienzabonandrei', 'bonlasatienza@gmail.com', 'password17', 'user'),
(18, 'adameveejay', 'veejayadame@gmail.com', 'password18', 'user'),
(19, 'magbanuamiguel', 'supermivz@gmail.com', 'password19', 'user'),
(20, 'landichojohnraven', 'landichoraven09@gmail.com', 'password20', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `boughtitems`
--
ALTER TABLE `boughtitems`
  ADD PRIMARY KEY (`item_ID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Indexes for table `preview_orders`
--
ALTER TABLE `preview_orders`
  ADD PRIMARY KEY (`preview_order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boughtitems`
--
ALTER TABLE `boughtitems`
  MODIFY `item_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `preview_orders`
--
ALTER TABLE `preview_orders`
  ADD CONSTRAINT `preview_orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
