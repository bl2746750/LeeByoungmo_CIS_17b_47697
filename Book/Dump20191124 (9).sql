-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: shopping_mall
-- ------------------------------------------------------
-- Server version	10.4.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `entity_products`
--

DROP TABLE IF EXISTS `entity_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_products` (
  `product_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(250) DEFAULT NULL,
  `price` decimal(16,0) DEFAULT NULL,
  `num_of_stock` int(10) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_img` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_products`
--

LOCK TABLES `entity_products` WRITE;
/*!40000 ALTER TABLE `entity_products` DISABLE KEYS */;
INSERT INTO `entity_products` VALUES (1,'1366107','New Apple MacBook Pro 13.3\" with Touch Bar - Intel Core i5 - 8GB Memory - 256GB SSD - Space Gray',1200,62,'2019-11-11 19:09:40','images/1.jfif'),(2,'1373148','HP 14\" Laptop 10th Gen Intel Core i5 - 1080p',400,62,'2019-11-11 19:09:40','images/2.jfif'),(3,'1366105','New Apple MacBook Pro 13.3\" with Touch Bar - Intel Core i5 - 8GB Memory - 128GB SSD - Space Gray',1000,98,'2019-11-11 19:09:40','images/3.jfif'),(4,'1373095','Dell Inspiron 17 Laptop - 10th Gen Intel Core i7-1065G7 - GeForce MX230 - 1080p',800,29,'2019-11-11 19:09:40','images/4.jfif'),(5,'1273996','HP 14\" Laptop - Intel Core i5',580,80,'2019-11-11 19:09:40','images/5.jfif'),(6,'1366113','New Apple MacBook Pro 13.3\" with Touch Bar - Intel Core i5 - 8GB Memory - 256GB SSD - Silver',1200,10,'2019-11-11 19:09:40','images/6.jfif'),(7,'1374520','Lenovo Flex 14 2-in-1 Touchscreen Laptop - Ryzen 7 - 1080p',550,60,'2019-11-11 19:09:40','images/7.jfif'),(8,'1267254','HP Pavilion x360 14\" Touchscreen 2-in-1 Laptop - Intel Core i5 - 1080p',500,99,'2019-11-11 19:09:40','images/8.jfif'),(9,'1327140','Dell Inspiron 14 5000 Series 2-in-1 Touchscreen Laptop - AMD Ryzen 5 - 1080p',400,37,'2019-11-11 19:09:40','images/9.jfif'),(10,'1275691','Microsoft Surface Pro 6 Bundle - Intel Core i5 - 2736 x 1824 Display - Black Surface Pro Type Cover',850,77,'2019-11-11 19:09:40','images/10.jfif'),(11,'1373418','LG Gram 17\" Laptop - Intel Core i7 - WQXGA (2560 x 1600) - Ultra Thin and Light at 2.95lbs',1500,37,'2019-11-11 19:09:40','images/11.jfif');
/*!40000 ALTER TABLE `entity_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_suppliers`
--

DROP TABLE IF EXISTS `entity_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_suppliers` (
  `supplier_id` int(10) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(50) DEFAULT NULL,
  `contact_name` varchar(200) DEFAULT NULL,
  `phone_num` int(10) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_suppliers`
--

LOCK TABLES `entity_suppliers` WRITE;
/*!40000 ALTER TABLE `entity_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_users`
--

DROP TABLE IF EXISTS `entity_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_users` (
  `user_num` int(10) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_phone_number` int(10) DEFAULT NULL,
  `user_address` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`user_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_users`
--

LOCK TABLES `entity_users` WRITE;
/*!40000 ALTER TABLE `entity_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_sales_status`
--

DROP TABLE IF EXISTS `enum_sales_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enum_sales_status` (
  `enum_sold_status` int(10) NOT NULL,
  `sold_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enum_sold_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_sales_status`
--

LOCK TABLES `enum_sales_status` WRITE;
/*!40000 ALTER TABLE `enum_sales_status` DISABLE KEYS */;
INSERT INTO `enum_sales_status` VALUES (0,'Ordered'),(1,'Sold');
/*!40000 ALTER TABLE `enum_sales_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_receiving`
--

DROP TABLE IF EXISTS `xref_receiving`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_receiving` (
  `receiving_id` int(10) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `receiving_qnty` int(10) DEFAULT NULL,
  `cost_per_prod` decimal(16,0) DEFAULT NULL,
  `receiving_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`receiving_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `xref_receiving_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `entity_suppliers` (`supplier_id`),
  CONSTRAINT `xref_receiving_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `entity_products` (`product_id`),
  CONSTRAINT `xref_receiving_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `entity_suppliers` (`supplier_id`),
  CONSTRAINT `xref_receiving_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `entity_products` (`product_id`),
  CONSTRAINT `xref_receiving_ibfk_5` FOREIGN KEY (`supplier_id`) REFERENCES `entity_suppliers` (`supplier_id`),
  CONSTRAINT `xref_receiving_ibfk_6` FOREIGN KEY (`product_id`) REFERENCES `entity_products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_receiving`
--

LOCK TABLES `xref_receiving` WRITE;
/*!40000 ALTER TABLE `xref_receiving` DISABLE KEYS */;
/*!40000 ALTER TABLE `xref_receiving` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_sold`
--

DROP TABLE IF EXISTS `xref_sold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_sold` (
  `sold_num` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `price_per_item` decimal(16,0) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `total_paid` decimal(16,0) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `sold_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`sold_num`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  CONSTRAINT `xref_sold_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `entity_products` (`product_id`),
  CONSTRAINT `xref_sold_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`user_num`),
  CONSTRAINT `xref_sold_ibfk_3` FOREIGN KEY (`status`) REFERENCES `enum_sales_status` (`enum_sold_status`),
  CONSTRAINT `xref_sold_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `entity_products` (`product_id`),
  CONSTRAINT `xref_sold_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`user_num`),
  CONSTRAINT `xref_sold_ibfk_6` FOREIGN KEY (`status`) REFERENCES `enum_sales_status` (`enum_sold_status`),
  CONSTRAINT `xref_sold_ibfk_7` FOREIGN KEY (`product_id`) REFERENCES `entity_products` (`product_id`),
  CONSTRAINT `xref_sold_ibfk_8` FOREIGN KEY (`user_id`) REFERENCES `entity_users` (`user_num`),
  CONSTRAINT `xref_sold_ibfk_9` FOREIGN KEY (`status`) REFERENCES `enum_sales_status` (`enum_sold_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_sold`
--

LOCK TABLES `xref_sold` WRITE;
/*!40000 ALTER TABLE `xref_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `xref_sold` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-24 22:09:18
