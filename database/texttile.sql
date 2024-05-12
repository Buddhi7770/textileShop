-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for texttile_db
CREATE DATABASE IF NOT EXISTS `texttile_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `texttile_db`;

-- Dumping structure for table texttile_db.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `b_id` int NOT NULL AUTO_INCREMENT,
  `b_name` varchar(45) NOT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table texttile_db.brand: ~3 rows (approximately)
REPLACE INTO `brand` (`b_id`, `b_name`) VALUES
	(1, 'Adidas'),
	(2, 'Boss'),
	(3, 'Moose');

-- Dumping structure for table texttile_db.category
CREATE TABLE IF NOT EXISTS `category` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `mc_id` int NOT NULL,
  `sc_id` int NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `fk_category_main_category1_idx` (`mc_id`),
  KEY `fk_category_sub_category1_idx` (`sc_id`),
  CONSTRAINT `fk_category_main_category1` FOREIGN KEY (`mc_id`) REFERENCES `main_category` (`mc_id`),
  CONSTRAINT `fk_category_sub_category1` FOREIGN KEY (`sc_id`) REFERENCES `sub_category` (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table texttile_db.category: ~5 rows (approximately)
REPLACE INTO `category` (`c_id`, `mc_id`, `sc_id`) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 1, 2),
	(4, 2, 3),
	(5, 3, 1);

-- Dumping structure for table texttile_db.color
CREATE TABLE IF NOT EXISTS `color` (
  `co_id` int NOT NULL AUTO_INCREMENT,
  `co_name` varchar(45) NOT NULL,
  PRIMARY KEY (`co_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table texttile_db.color: ~4 rows (approximately)
REPLACE INTO `color` (`co_id`, `co_name`) VALUES
	(1, 'White'),
	(2, 'Black'),
	(3, 'Red'),
	(4, 'Blue');

-- Dumping structure for table texttile_db.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `mobile` varchar(10) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `points` int NOT NULL,
  PRIMARY KEY (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table texttile_db.customer: ~4 rows (approximately)
REPLACE INTO `customer` (`mobile`, `fname`, `lname`, `points`) VALUES
	('0', 'None', 'None', 0),
	('0775555555', 'Isuru', 'Madushanka', 0),
	('0778888888', 'Nimesh', 'Bandara', 0),
	('0779999999', 'Prabath', 'Weerasinghe', 0);

-- Dumping structure for table texttile_db.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `in_id` int NOT NULL AUTO_INCREMENT,
  `in_date_time` datetime NOT NULL,
  `user_id` int NOT NULL,
  `customer_mobile` varchar(10) NOT NULL,
  `pm_id` int NOT NULL,
  `payment` double NOT NULL,
  PRIMARY KEY (`in_id`),
  KEY `fk_invoice_user1_idx` (`user_id`),
  KEY `fk_invoice_payment_method2_idx` (`pm_id`),
  KEY `fk_invoice_customer2_idx` (`customer_mobile`),
  CONSTRAINT `fk_invoice_customer2` FOREIGN KEY (`customer_mobile`) REFERENCES `customer` (`mobile`),
  CONSTRAINT `fk_invoice_payment_method2` FOREIGN KEY (`pm_id`) REFERENCES `payment_method` (`pm_id`),
  CONSTRAINT `fk_invoice_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table texttile_db.invoice: ~0 rows (approximately)

-- Dumping structure for table texttile_db.invoice_item
CREATE TABLE IF NOT EXISTS `invoice_item` (
  `init_id` int NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `in_id` int NOT NULL,
  `st_barcode` int NOT NULL,
  PRIMARY KEY (`init_id`),
  KEY `fk_invoice_item_invoice2_idx` (`in_id`),
  KEY `fk_invoice_item_stock2_idx` (`st_barcode`),
  CONSTRAINT `fk_invoice_item_invoice2` FOREIGN KEY (`in_id`) REFERENCES `invoice` (`in_id`),
  CONSTRAINT `fk_invoice_item_stock2` FOREIGN KEY (`st_barcode`) REFERENCES `stock` (`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table texttile_db.invoice_item: ~0 rows (approximately)

-- Dumping structure for table texttile_db.main_category
CREATE TABLE IF NOT EXISTS `main_category` (
  `mc_id` int NOT NULL AUTO_INCREMENT,
  `mc_name` varchar(45) NOT NULL,
  PRIMARY KEY (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table texttile_db.main_category: ~3 rows (approximately)
REPLACE INTO `main_category` (`mc_id`, `mc_name`) VALUES
	(1, 'Gents'),
	(2, 'Ladies'),
	(3, 'Kids');

-- Dumping structure for table texttile_db.payment_method
CREATE TABLE IF NOT EXISTS `payment_method` (
  `pm_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`pm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table texttile_db.payment_method: ~2 rows (approximately)
REPLACE INTO `payment_method` (`pm_id`, `name`) VALUES
	(1, 'Cash'),
	(2, 'Card');

-- Dumping structure for table texttile_db.product
CREATE TABLE IF NOT EXISTS `product` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `c_id` int NOT NULL,
  `b_id` int NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `fk_producct_category1_idx` (`c_id`),
  KEY `fk_product_brand1_idx` (`b_id`),
  CONSTRAINT `fk_producct_category1` FOREIGN KEY (`c_id`) REFERENCES `category` (`c_id`),
  CONSTRAINT `fk_product_brand1` FOREIGN KEY (`b_id`) REFERENCES `brand` (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table texttile_db.product: ~3 rows (approximately)
REPLACE INTO `product` (`p_id`, `title`, `c_id`, `b_id`) VALUES
	(1, 'Gents Short Sleeve Printed White T-Shirt', 1, 1),
	(2, 'Ladies Long Sleeve Plain Black T-Shirt', 2, 2),
	(3, 'Gents Linen Casual Short', 3, 3);

-- Dumping structure for table texttile_db.size
CREATE TABLE IF NOT EXISTS `size` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `s_name` varchar(45) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table texttile_db.size: ~4 rows (approximately)
REPLACE INTO `size` (`s_id`, `s_name`) VALUES
	(1, 'S'),
	(2, 'M'),
	(3, 'L'),
	(4, 'XL');

-- Dumping structure for table texttile_db.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `barcode` int NOT NULL,
  `p_id` int NOT NULL,
  `s_id` int NOT NULL,
  `co_id` int NOT NULL,
  `price` double NOT NULL,
  `available_qty` int NOT NULL,
  PRIMARY KEY (`barcode`),
  KEY `fk_stock_producct1_idx` (`p_id`),
  KEY `fk_stock_size1_idx` (`s_id`),
  KEY `fk_stock_color1_idx` (`co_id`),
  CONSTRAINT `fk_stock_color1` FOREIGN KEY (`co_id`) REFERENCES `color` (`co_id`),
  CONSTRAINT `fk_stock_producct1` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`),
  CONSTRAINT `fk_stock_size1` FOREIGN KEY (`s_id`) REFERENCES `size` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table texttile_db.stock: ~8 rows (approximately)
REPLACE INTO `stock` (`barcode`, `p_id`, `s_id`, `co_id`, `price`, `available_qty`) VALUES
	(12345, 1, 1, 1, 2000, 3),
	(12346, 1, 1, 2, 2000, 5),
	(12347, 1, 1, 3, 2000, 1),
	(32100, 3, 3, 4, 1800, 6),
	(32101, 3, 3, 2, 1800, 2),
	(56780, 2, 1, 1, 1200, 10),
	(56781, 2, 2, 1, 1500, 5),
	(56782, 2, 2, 2, 1500, 2);

-- Dumping structure for table texttile_db.sub_category
CREATE TABLE IF NOT EXISTS `sub_category` (
  `sc_id` int NOT NULL AUTO_INCREMENT,
  `sc_name` varchar(45) NOT NULL,
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table texttile_db.sub_category: ~3 rows (approximately)
REPLACE INTO `sub_category` (`sc_id`, `sc_name`) VALUES
	(1, 'T-Shirt'),
	(2, 'Short'),
	(3, 'Saree');

-- Dumping structure for table texttile_db.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_type_id` int NOT NULL,
  `user_status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_user_type_idx` (`user_type_id`),
  KEY `fk_user_user_status1_idx` (`user_status_id`),
  CONSTRAINT `fk_user_user_status1` FOREIGN KEY (`user_status_id`) REFERENCES `user_status` (`id`),
  CONSTRAINT `fk_user_user_type` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table texttile_db.user: ~2 rows (approximately)
REPLACE INTO `user` (`id`, `fname`, `lname`, `mobile`, `username`, `password`, `user_type_id`, `user_status_id`) VALUES
	(1, 'Sahan', 'Perera', '0771112223', 'sahan', '123', 1, 1),
	(2, 'Kasun', 'Bandara', '0774445556', 'kasun', '456', 2, 1);

-- Dumping structure for table texttile_db.user_status
CREATE TABLE IF NOT EXISTS `user_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table texttile_db.user_status: ~0 rows (approximately)
REPLACE INTO `user_status` (`id`, `status`) VALUES
	(1, 'Active'),
	(2, 'Inactive');

-- Dumping structure for table texttile_db.user_type
CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table texttile_db.user_type: ~0 rows (approximately)
REPLACE INTO `user_type` (`id`, `type`) VALUES
	(1, 'Admin'),
	(2, 'Cashier');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
