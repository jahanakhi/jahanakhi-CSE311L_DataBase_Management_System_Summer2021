-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2021 at 02:36 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym_management_version1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_contact` varchar(10) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_picture` varchar(100) NOT NULL,
  `admin_cdate` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_contact`, `admin_password`, `admin_picture`, `admin_cdate`) VALUES
(1, 'admin', 'c@gmail.com', '1234567890', 'admin@123', 'dog-f2.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `instructor_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`instructor_id`, `name`, `contact`, `picture`, `address`, `email`, `user_id`) VALUES
(1, 'Khair AHmed', '012834566', '', 'dummy', 'kahir1234@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `weight` float NOT NULL,
  `joining_date` datetime NOT NULL DEFAULT current_timestamp(),
  `end_of_membership` datetime NOT NULL,
  `membership_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `picture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `name`, `weight`, `joining_date`, `end_of_membership`, `membership_id`, `user_id`, `picture`) VALUES
(3, 'FGFGF', 60, '2021-05-19 00:00:00', '2021-09-19 00:00:00', 6, 1, '');

--
-- Triggers `members`
--
DELIMITER $$
CREATE TRIGGER `before_members_delete` BEFORE DELETE ON `members` FOR EACH ROW BEGIN
      
INSERT INTO members_log (`member_id`, `name`, `weight`, `joining_date`, `end_of_membership`, `membership_id`, `user_id`, `picture`) VALUES
(old.`member_id`, old.`name`, old.`weight`, old.`joining_date`, old.`end_of_membership`, old.`membership_id`, old.`user_id`, old.`picture`);
           
       END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `membershiptype`
--

CREATE TABLE `membershiptype` (
  `membership_id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `membership_period` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sign_up_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membershiptype`
--

INSERT INTO `membershiptype` (`membership_id`, `type_name`, `membership_period`, `amount`, `user_id`, `sign_up_date`) VALUES
(6, 'Premium Package', 4, '12000', 1, '2021-05-19 19:11:24');

-- --------------------------------------------------------

--
-- Table structure for table `members_log`
--

CREATE TABLE `members_log` (
  `member_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `weight` float NOT NULL,
  `joining_date` datetime NOT NULL DEFAULT current_timestamp(),
  `end_of_membership` datetime NOT NULL,
  `membership_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `picture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `pk_id` int(11) NOT NULL,
  `pk_name` varchar(100) NOT NULL,
  `pk_period` int(11) NOT NULL,
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`pk_id`, `pk_name`, `pk_period`, `cost`) VALUES
(1, 'Basic Package', 1, 5000),
(2, 'Standard Package', 2, 8000),
(3, 'Premium Package', 4, 12000),
(4, 'Golden Package+Extra Feature', 6, 16000),
(5, 'Diamond Package', 12, 30000);

-- --------------------------------------------------------

--
-- Table structure for table `packages_log`
--

CREATE TABLE `packages_log` (
  `pk_id` int(11) NOT NULL,
  `pk_name` varchar(100) NOT NULL,
  `pk_period` int(11) NOT NULL,
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packages_request`
--

CREATE TABLE `packages_request` (
  `req_id` int(11) NOT NULL,
  `pk_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `txid` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packages_request`
--

INSERT INTO `packages_request` (`req_id`, `pk_id`, `user_id`, `txid`) VALUES
(3, 1, 3, 'tfdf123455bb'),
(4, 4, 3, 'tfdf123455bb');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `payment_type` varchar(10) NOT NULL,
  `payment_date` datetime NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_des` varchar(500) NOT NULL,
  `product_pic` varchar(100) NOT NULL,
  `exported_from` varchar(100) NOT NULL,
  `num_avl_product` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_des`, `product_pic`, `exported_from`, `num_avl_product`, `price`) VALUES
(4, 'Wall Mounted Pull Up Chin Up Bar - Black ,6 GRIP', 'Wall Mounted Pull Up Chin Up Bar - Black ,6 GRIP', '94057.jpg', 'Germany', 10, 349),
(5, 'AB Carver pro wheel - Body Accessories', 'AB Carver pro wheel - Body Accessories', '63875.jpg', 'Germany', 20, 1140),
(6, 'Self-Suction Sit-up Bar Assistor - Gym Workout Fitness Equipment - Red', 'Self-Suction Sit-up Bar Assistor - Gym Workout Fitness Equipment - Red', '86390.jpg', 'Australia', 10, 519),
(7, 'Ab Roller Wheel', 'Ab Roller Wheel', '46953.jpg', 'Germany', 20, 650),
(8, 'Tummy Trimmer - Double Spring - Black', 'Tummy Trimmer - Double Spring - Black', '64207.jpg', 'Australia', 20, 749),
(9, 'Combo Pack of 2 Pieces Push Up Bar - Silver and Black', 'Combo Pack of 2 Pieces Push Up Bar - Silver and Black', '84923.jpg', 'Germany', 30, 400),
(10, 'Foot Expender - Yellow and Black', 'Foot Expender - Yellow and Black', '57018.jpg', 'Germany', 20, 400),
(11, '1 Pair Occlusion Bands Red Blood Flow Restriction Bands BFR', '1 Pair Occlusion Bands Red Blood Flow Restriction Bands BFR', '40231.jpg', 'Germany', 10, 1200);

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `before_product_update` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
INSERT INTO products_log (`product_id`, `product_name`, `product_des`, `product_pic`, `exported_from`, `num_avl_product`, `price`) VALUES
(old.product_id, old.product_name, old.product_des, old.product_pic, old.exported_from, old.num_avl_product, old.price);

       END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `products_log`
--

CREATE TABLE `products_log` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_des` varchar(500) NOT NULL,
  `product_pic` varchar(100) NOT NULL,
  `exported_from` varchar(100) NOT NULL,
  `num_avl_product` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lame` varchar(100) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `age` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone_num` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fname`, `lame`, `gender`, `age`, `username`, `password`, `address`, `phone_num`) VALUES
(1, 'FGFGF', 'dff', '2', 123, 'rahatuddin786@gmail.com', '1234', 'dsgfg', '01878517664');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `before_user_delete` BEFORE DELETE ON `users` FOR EACH ROW BEGIN
  INSERT INTO users_log (`user_id`, `fname`, `lame`, `gender`, `age`, `username`, `password`, `address`, `phone_num`) VALUES
(old.user_id, old.fname, old.lame, old.gender, old.age,old.username, old.password, old.address, old.phone_num);
  
   END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users_log`
--

CREATE TABLE `users_log` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lame` varchar(100) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `age` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone_num` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `workoutplans`
--

CREATE TABLE `workoutplans` (
  `plan_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `plan_name` varchar(100) NOT NULL,
  `workout_time` int(11) NOT NULL,
  `workout_end_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workoutplans`
--

INSERT INTO `workoutplans` (`plan_id`, `member_id`, `instructor_id`, `plan_name`, `workout_time`, `workout_end_time`) VALUES
(12, 6, 1, 'Premium Package', 2, 8),
(13, 6, 1, 'Premium Package', 2, 8),
(14, 6, 1, 'Premium Package', 2, 8),
(15, 6, 1, 'Premium Package', 2, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`instructor_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `membershiptype`
--
ALTER TABLE `membershiptype`
  ADD PRIMARY KEY (`membership_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`pk_id`);

--
-- Indexes for table `packages_request`
--
ALTER TABLE `packages_request`
  ADD PRIMARY KEY (`req_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `workoutplans`
--
ALTER TABLE `workoutplans`
  ADD PRIMARY KEY (`plan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `instructor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `membershiptype`
--
ALTER TABLE `membershiptype`
  MODIFY `membership_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `packages_request`
--
ALTER TABLE `packages_request`
  MODIFY `req_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `workoutplans`
--
ALTER TABLE `workoutplans`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
