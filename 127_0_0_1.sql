-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2026 at 07:49 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sales_management`
--
CREATE DATABASE IF NOT EXISTS `sales_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sales_management`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`) VALUES
(1, 'Smartphones', 'Mobile phones and accessories'),
(2, 'Laptops', 'Portable computers and notebooks'),
(3, 'Tablets', 'Tablet devices and e-readers'),
(4, 'Headphones & Audio', 'Headsets, speakers, and audio equipment'),
(5, 'Cameras', 'Digital cameras and photography gear'),
(6, 'Gaming', 'Consoles, games, and gaming accessories'),
(7, 'Wearables', 'Smartwatches, fitness trackers, and smart devices'),
(8, 'Accessories', 'Cables, chargers, cases, and other electronics add-ons');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `phone` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `phone`) VALUES
(1, 'John Kimani', 'johnkimani@gmail.com', '+254712345678'),
(2, 'Jane Shumale', 'janeshumale@gmail.com', '+254723456789'),
(3, 'Alice Kanyari', 'alicekanyari96@gmail.com', '+254734567890'),
(4, 'Bob Makwambi', 'bobmakwambi@gmail.com', '+254745678901'),
(5, 'Charlie Wekesa', 'charliewekesa@gmail.com', '+254756789012'),
(6, 'Diana Davis', 'dianadavis@gmail.com', '+254767890123'),
(7, 'Eve Mueni', 'eve8mueni@gmail.com', '+254778901234'),
(8, 'Frank Onyango', 'frankonyango@gmail.com', '+254789012345'),
(9, 'Grace Muema', 'gracemuema@gmail.com', '+254790123456'),
(10, 'Henry Mwangi', 'henrymwangi@gmail.com', '+254701234567'),
(11, 'Ivy Chelegat', 'ivychelegat@gmail.com', '+254712345679'),
(12, 'Jack Kibet', 'jack.kibet@gmail.com', '+254723456780'),
(13, 'Kathy Jackson', 'kathyjackson@gmail.com', '+254734567891'),
(14, 'Liam White', 'liamwhite@gmail.com', '+254745678902'),
(15, 'Mia Wanjiru', 'miawanjiru@gmail.com', '+254756789013');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `total_amount` double NOT NULL CHECK (`total_amount` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `total_amount`) VALUES
(1, 1, '2023-01-15', 61996),
(2, 2, '2023-02-20', 104999),
(3, 3, '2023-03-10', 60000),
(4, 4, '2023-04-05', 79799),
(5, 5, '2023-05-12', 4500),
(6, 6, '2023-06-18', 39400),
(7, 7, '2023-07-22', 145600),
(8, 8, '2023-08-30', 30000),
(9, 9, '2023-09-14', 14500),
(10, 10, '2023-10-25', 33400),
(11, 11, '2023-11-08', 34500),
(12, 12, '2023-12-01', 12880),
(13, 13, '2024-01-10', 75630),
(14, 14, '2024-02-15', 172930),
(15, 15, '2024-03-20', 180283);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL CHECK (`quantity` > 0),
  `price` decimal(10,2) NOT NULL CHECK (`price` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 1, 1, 6000.00),
(2, 1, 15, 1, 2000.00),
(3, 2, 3, 1, 4500.00),
(4, 2, 4, 1, 54000.00),
(5, 3, 7, 1, 34560.00),
(6, 3, 8, 1, 8900.00),
(7, 4, 9, 1, 180489.00),
(8, 4, 10, 1, 45000.00),
(9, 5, 11, 1, 68023.00),
(10, 5, 12, 1, 38576.00),
(11, 6, 13, 1, 47829.00),
(12, 6, 14, 1, 38764.00),
(13, 7, 16, 1, 1000.00),
(14, 7, 17, 1, 43857.00),
(15, 8, 18, 1, 65642.00),
(16, 8, 19, 1, 34746.00),
(17, 9, 20, 1, 72346.00),
(18, 9, 21, 1, 24668.00),
(19, 10, 22, 1, 4758.00),
(20, 10, 23, 1, 56775.00),
(21, 11, 24, 1, 27375.00),
(22, 11, 2, 1, 74598.00),
(23, 12, 5, 1, 37469.00),
(24, 12, 6, 1, 45634.00),
(25, 13, 1, 1, 75683.00),
(26, 13, 3, 1, 27455.00),
(27, 14, 7, 1, 82375.00),
(28, 14, 8, 1, 76545.00),
(29, 15, 9, 1, 34876.00),
(30, 15, 10, 1, 67384.00);

--
-- Triggers `order_items`
--
DELIMITER $$
CREATE TRIGGER `after_order_item_insert` AFTER INSERT ON `order_items` FOR EACH ROW BEGIN
    UPDATE Products 
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auto_generate_warranty` AFTER INSERT ON `order_items` FOR EACH ROW BEGIN
    INSERT INTO warranties (order_item_id, warranty_period_months, start_date, end_date)
    VALUES (
        NEW.order_item_id, 
        12, 
        CURDATE(), 
        DATE_ADD(CURDATE(), INTERVAL 1 YEAR)
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_method` varchar(20) NOT NULL CHECK (`payment_method` in ('Cash','Card','Mobile Money','Bank Transfer')),
  `amount` decimal(10,2) NOT NULL CHECK (`amount` > 0),
  `payment_date` datetime DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'Completed' CHECK (`status` in ('Pending','Completed','Failed','Refunded')),
  `transaction_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_method`, `amount`, `payment_date`, `status`, `transaction_id`) VALUES
(1, 1, 'Card', 62055.00, '2023-01-15 10:00:00', 'Completed', 'UAL7C4EEZO'),
(2, 2, 'Mobile Money', 41050.00, '2023-02-20 11:00:00', 'Completed', 'UAM7C4F108'),
(3, 3, 'Cash', 37000.00, '2023-03-10 12:00:00', 'Completed', 'UIM7C4F970'),
(4, 4, 'Bank Transfer', 85000.00, '2023-04-05 13:00:00', 'Completed', 'UAL7C4EC98'),
(5, 5, 'Card', 54500.00, '2023-05-12 14:00:00', 'Completed', 'ULF7C4LC99'),
(6, 6, 'Mobile Money', 54670.00, '2023-06-18 15:00:00', 'Completed', 'UXN9C4IC18'),
(7, 7, 'Cash', 71200.00, '2023-07-22 16:00:00', 'Completed', 'UTXC74ECI8'),
(8, 8, 'Bank Transfer', 43500.00, '2023-08-30 17:00:00', 'Completed', 'BTXC74EJI8'),
(9, 9, 'Card', 26800.00, '2023-09-14 18:00:00', 'Completed', 'GTXA74EOI5'),
(10, 10, 'Mobile Money', 29000.00, '2023-10-25 19:00:00', 'Completed', 'ABXC74KC88'),
(11, 11, 'Cash', 55600.00, '2023-11-08 20:00:00', 'Completed', 'WTNC94SCK8'),
(12, 12, 'Bank Transfer', 41350.00, '2023-12-01 21:00:00', 'Completed', 'WPNV74ER79'),
(13, 13, 'Card', 18800.00, '2024-01-10 22:00:00', 'Completed', 'VPNC96ECTR8'),
(14, 14, 'Mobile Money', 60000.00, '2024-02-15 23:00:00', 'Completed', 'JKUT74EYU9'),
(15, 15, 'Cash', 19800.00, '2024-03-20 00:00:00', 'Completed', 'STFGC74EC43');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `price` double NOT NULL CHECK (`price` > 0),
  `stock` int(11) NOT NULL CHECK (`stock` >= 0),
  `brand` text DEFAULT NULL,
  `model` text DEFAULT NULL,
  `specifications` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `category_id`, `price`, `stock`, `brand`, `model`, `specifications`) VALUES
(1, 'Smartphone', 1, 55000, 50, 'BrandA', 'ModelX', '6GB RAM, 128GB Storage'),
(2, 'Android Phone', 1, 44000, 40, 'BrandB', 'ModelY', '8GB RAM, 256GB Storage'),
(3, 'Gaming Laptop', 2, 130000, 30, 'BrandC', 'ModelZ', '16GB RAM, 1TB SSD, RTX 3060'),
(4, 'Ultrabook', 2, 70000, 25, 'BrandD', 'ModelW', '8GB RAM, 512GB SSD'),
(5, 'Tablet', 3, 33000, 60, 'BrandE', 'ModelV', '10-inch, 64GB Storage'),
(6, 'E-Reader', 3, 39600, 80, 'BrandF', 'ModelU', '6-inch, Waterproof'),
(7, 'Wireless Headphones', 4, 6400, 70, 'BrandG', 'ModelT', 'Noise Cancelling, 30hr Battery'),
(8, 'Bluetooth Speaker', 4, 67000, 100, 'BrandH', 'ModelS', 'Portable, Waterproof'),
(9, 'DSLR Camera', 5, 120000, 20, 'BrandI', 'ModelR', '24MP, 4K Video'),
(10, 'Action Camera', 5, 140000, 50, 'BrandJ', 'ModelQ', '4K, Waterproof'),
(11, 'Gaming Console', 6, 98700, 35, 'BrandK', 'ModelP', 'Next-gen, 1TB Storage'),
(12, 'VR Headset', 6, 75900, 45, 'BrandL', 'ModelO', 'Wireless, 6DOF'),
(13, 'Smartwatch', 7, 29000, 90, 'BrandM', 'ModelN', 'GPS, Heart Rate Monitor'),
(14, 'Fitness Tracker', 7, 8340, 120, 'BrandN', 'ModelM', 'Waterproof, Sleep Tracking'),
(15, 'Phone Charger', 8, 500, 200, 'BrandO', 'ModelL', 'Fast Charging, USB-C'),
(16, 'Cable Organizer', 8, 350, 300, 'BrandP', 'ModelK', 'Velcro, 10-pack'),
(17, 'External Hard Drive', 8, 14000, 150, 'BrandQ', 'ModelJ', '2TB, USB 3.0'),
(18, 'Wireless Mouse', 8, 3000, 180, 'BrandR', 'ModelI', 'Ergonomic, Rechargeable'),
(19, 'Smart Home Hub', 8, 13679, 60, 'BrandS', 'ModelH', 'Voice Control, Wi-Fi'),
(20, 'Drone', 5, 96899, 30, 'BrandT', 'ModelG', '4K Camera, GPS'),
(21, 'Earbuds', 4, 4500, 110, 'BrandU', 'ModelF', 'True Wireless, ANC'),
(22, 'Laptop Stand', 8, 3500, 140, 'BrandV', 'ModelE', 'Adjustable, Aluminum'),
(23, 'Power Bank', 8, 5500, 160, 'BrandW', 'ModelD', '10000mAh, Fast Charge'),
(24, 'Streaming Webcam', 5, 68700, 70, 'BrandX', 'ModelC', '1080p, Auto Focus');

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `warranty_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `warranty_period_months` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warranties`
--

INSERT INTO `warranties` (`warranty_id`, `order_item_id`, `warranty_period_months`, `start_date`, `end_date`) VALUES
(1, 1, 24, '2023-01-15', '2025-01-15'),
(2, 2, 12, '2023-01-15', '2024-01-15'),
(3, 3, 36, '2023-02-20', '2026-02-20'),
(4, 4, 18, '2023-02-20', '2024-08-20'),
(5, 5, 12, '2023-03-10', '2024-03-10'),
(6, 6, 6, '2023-03-10', '2023-09-10'),
(7, 7, 24, '2023-04-05', '2025-04-05'),
(8, 8, 12, '2023-04-05', '2024-04-05'),
(9, 9, 18, '2023-05-12', '2024-11-12'),
(10, 10, 24, '2023-05-12', '2025-05-12'),
(11, 11, 12, '2023-06-18', '2024-06-18'),
(12, 12, 6, '2023-06-18', '2023-12-18'),
(13, 13, 24, '2023-07-22', '2025-07-22'),
(14, 14, 12, '2023-07-22', '2024-07-22'),
(15, 15, 36, '2023-08-30', '2026-08-30'),
(16, 16, 18, '2023-08-30', '2025-02-28'),
(17, 17, 12, '2023-09-14', '2024-09-14'),
(18, 18, 6, '2023-09-14', '2024-03-14'),
(19, 19, 24, '2023-10-25', '2025-10-25'),
(20, 20, 12, '2023-10-25', '2024-10-25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`name`) USING HASH;

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `fk_order_items_order` (`order_id`),
  ADD KEY `fk_order_items_product` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`warranty_id`),
  ADD KEY `order_item_id` (`order_item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `warranty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `warranties`
--
ALTER TABLE `warranties`
  ADD CONSTRAINT `warranties_ibfk_1` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`order_item_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Create CustomerPoints table to store loyalty points for each customer
CREATE TABLE CustomerPoints (
  customer_id INT NOT NULL,
  points INT NOT NULL DEFAULT 0,
  PRIMARY KEY (customer_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

DELIMITER $$

-- Create a trigger to calculate and update loyalty points
CREATE TRIGGER after_order_status_update
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
  -- Check if the status changed to 'Completed'
  IF NEW.status = 'Completed' AND OLD.status != 'Completed' THEN
    DECLARE remaining_days INT;
    DECLARE earned_points INT;

    -- Calculate the remaining days in the current month
    SET remaining_days = DAY(LAST_DAY(CURDATE())) - DAY(CURDATE());

    -- Calculate points earned
    SET earned_points = FLOOR(remaining_days / 8);

    -- Update the CustomerPoints table
    INSERT INTO CustomerPoints (customer_id, points)
    VALUES (NEW.customer_id, earned_points)
    ON DUPLICATE KEY UPDATE points = points + earned_points;
  END IF;
END$$

DELIMITER ;
