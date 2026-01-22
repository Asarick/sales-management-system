-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2026 at 11:47 AM
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
-- Database: `sales`
--
CREATE DATABASE IF NOT EXISTS `sales` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sales`;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`) VALUES
(6, 'Electronics', 'Devices and gadgets like phones, laptops, and accessories');

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `phone`) VALUES
(9, 'Derrick Omondi', 'derrickomondi@gmail.com', '+1-555-123-4567'),
(10, 'Shatra Wambui', 'shatrawambui@egmail.com', '+1-555-234-5678'),
(11, 'Roy Mutuma', 'roymutuma@gmail.com', '+1-555-345-6789'),
(12, 'Krystel Celine', 'krystel28@gmail.com', '+1-555-456-7890'),
(13, 'Charlie Yegon', 'charlieyegon@gmail.com', '+1-555-567-8901'),
(14, 'David Macharia', 'macharia101@gmail.com', '+1-555-365-6777'),
(15, 'Carlos Rotich', 'rotichcarlos@gmail.com', '+1-555-698-7800'),
(16, 'Charity ngilu', 'charity77n@gmail.com', '+1-555-527-8888');

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `category_id`, `price`, `stock`, `brand`, `model`, `specifications`) VALUES
(31, 'Wireless Headphones', NULL, 9999, 50, 'Sony', 'WH-1000XM4', 'Noise-cancelling, 30-hour battery'),
(32, 'Smartphone', NULL, 69999, 25, 'Apple', 'iPhone 14', '6.1-inch display, 128GB storage'),
(33, 'Laptop', NULL, 89999, 20, 'Dell', 'XPS 13', '14-inch, Intel i7, 64GB RAM, 1TB ROM'),
(34, 'Bluetooth Speaker', NULL, 12999, 40, 'JBL', 'GO 3', 'Portable, waterproof, 5-hour battery'),
(35, 'Tablet', NULL, 39999, 15, 'Samsung', 'Galaxy Tab S8', '11-inch, 128GB, S Pen included'),
(36, 'Wireless Headphones', NULL, 5999, 62, 'Oraimo', 'WH-1000XM4', 'Noise-cancelling, 30-hour battery, Bass Boost'),
(37, 'Smartphone', NULL, 69999, 25, 'Apple', 'iPhone 13', '6.1-inch display, 256GB storage'),
(38, 'Laptop', NULL, 44999, 20, 'Lenovo', 'LZ 813', '14-inch, AMD, 32GB RAM, 512GB ROM'),
(39, 'Bluetooth Speaker', NULL, 41999, 40, 'Beats by Dre', 'BD 7', 'Portable, waterproof, 10-hour battery'),
(40, 'Tablet', NULL, 79999, 15, 'Samsung', 'Galaxy Tab S21', '11-inch, 512GB, S Pen included');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
