-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: food_delivery_database
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveries` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `delivery_personnel_id` int DEFAULT NULL,
  `delivery_status` enum('in_transit','delivered','failed') DEFAULT 'in_transit',
  `delivery_address` varchar(255) NOT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`delivery_id`),
  KEY `order_id` (`order_id`),
  KEY `delivery_personnel_id` (`delivery_personnel_id`),
  CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `deliveries_ibfk_2` FOREIGN KEY (`delivery_personnel_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES (1,1,1,'in_transit','123 Maple St, Springfield',NULL,'2024-10-06 16:29:06'),(2,2,2,'delivered','234 Oak St, Springfield','2024-10-01 11:30:00','2024-10-06 16:29:06'),(3,3,3,'in_transit','345 Pine St, Springfield',NULL,'2024-10-06 16:29:06'),(4,4,4,'delivered','456 Elm St, Springfield','2024-10-02 09:00:00','2024-10-06 16:29:06'),(5,5,5,'in_transit','567 Cedar St, Springfield',NULL,'2024-10-06 16:29:06'),(6,6,6,'delivered','678 Birch St, Springfield','2024-10-03 13:45:00','2024-10-06 16:29:06'),(7,7,7,'in_transit','789 Willow St, Springfield',NULL,'2024-10-06 16:29:06'),(8,8,8,'delivered','890 Spruce St, Springfield','2024-10-04 10:15:00','2024-10-06 16:29:06'),(9,9,9,'in_transit','901 Fir St, Springfield',NULL,'2024-10-06 16:29:06'),(10,10,10,'delivered','101 Sycamore St, Springfield','2024-10-05 08:00:00','2024-10-06 16:29:06');
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_id` int DEFAULT NULL,
  `item_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text,
  `is_available` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`menu_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,1,'Cappuccino',15000.00,'Rich and creamy cappuccino with a sprinkle of cocoa.',1,'2024-10-06 16:23:16'),(2,1,'Chicken Sandwich',10000.00,'Grilled chicken sandwich with fresh vegetables.',1,'2024-10-06 16:23:16'),(3,2,'Grilled Fish',20000.00,'Freshly grilled fish served with vegetables.',1,'2024-10-06 16:23:16'),(4,2,'Pasta Primavera',18000.00,'Pasta tossed with seasonal vegetables.',1,'2024-10-06 16:23:16'),(5,3,'T-Bone Steak',35000.00,'Juicy T-Bone steak cooked to perfection.',1,'2024-10-06 16:23:16'),(6,3,'Caesar Salad',12000.00,'Classic Caesar salad with romaine lettuce and dressing.',1,'2024-10-06 16:23:16'),(7,4,'Margherita Pizza',14000.00,'Traditional pizza topped with fresh basil and mozzarella.',1,'2024-10-06 16:23:16'),(8,4,'Spaghetti Bolognese',16000.00,'Spaghetti served with a rich meat sauce.',1,'2024-10-06 16:23:16'),(9,5,'Peri-Peri Chicken',18000.00,'Grilled chicken marinated in spicy peri-peri sauce.',1,'2024-10-06 16:23:16'),(10,5,'Fries',5000.00,'Crispy fries served with dipping sauce.',1,'2024-10-06 16:23:16'),(11,6,'Butter Chicken',20000.00,'Creamy butter chicken served with rice.',1,'2024-10-06 16:23:16'),(12,6,'Vegetable Samosas',8000.00,'Crispy pastry filled with spiced vegetables.',1,'2024-10-06 16:23:16'),(13,7,'Tilapia',15000.00,'Fried tilapia served with matoke.',1,'2024-10-06 16:23:16'),(14,7,'Pork Ribs',25000.00,'Grilled pork ribs with barbecue sauce.',1,'2024-10-06 16:23:16'),(15,8,'Luwombo',12000.00,'Traditional Ugandan stew made with meat and vegetables.',1,'2024-10-06 16:23:16'),(16,8,'Posho',6000.00,'Ugandan staple made from maize flour.',1,'2024-10-06 16:23:16'),(17,9,'Pepperoni Pizza',14000.00,'Classic pizza topped with pepperoni slices.',1,'2024-10-06 16:23:16'),(18,9,'Garlic Bread',6000.00,'Toasted bread with garlic and herbs.',1,'2024-10-06 16:23:16'),(19,10,'Espresso',10000.00,'Strong and rich espresso shot.',1,'2024-10-06 16:23:16'),(20,10,'Chocolate Cake',8000.00,'Decadent chocolate cake topped with frosting.',1,'2024-10-06 16:23:16');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,2,15000.00,'2024-10-06 16:27:38'),(2,1,2,1,10000.00,'2024-10-06 16:27:38'),(3,2,3,1,20000.00,'2024-10-06 16:27:38'),(4,2,4,1,18000.00,'2024-10-06 16:27:38'),(5,3,5,1,35000.00,'2024-10-06 16:27:38'),(6,3,6,1,12000.00,'2024-10-06 16:27:38'),(7,4,7,1,20000.00,'2024-10-06 16:27:38'),(8,4,8,1,6000.00,'2024-10-06 16:27:38'),(9,5,9,1,18000.00,'2024-10-06 16:27:38'),(10,5,10,1,5000.00,'2024-10-06 16:27:38'),(11,6,11,2,20000.00,'2024-10-06 16:27:38'),(12,6,12,1,8000.00,'2024-10-06 16:27:38'),(13,7,13,1,15000.00,'2024-10-06 16:27:38'),(14,7,14,1,25000.00,'2024-10-06 16:27:38'),(15,8,15,1,12000.00,'2024-10-06 16:27:38'),(16,8,16,1,6000.00,'2024-10-06 16:27:38'),(17,9,17,1,14000.00,'2024-10-06 16:27:38'),(18,9,18,1,6000.00,'2024-10-06 16:27:38'),(19,10,19,1,10000.00,'2024-10-06 16:27:38'),(20,10,20,1,8000.00,'2024-10-06 16:27:38');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `order_status` enum('pending','confirmed','delivered','cancelled') DEFAULT 'pending',
  `total_amount` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,25000.00,'confirmed',NULL,'2024-10-06 16:25:53'),(2,2,2,30000.00,'confirmed',NULL,'2024-10-06 16:25:53'),(3,3,3,40000.00,'confirmed',NULL,'2024-10-06 16:25:53'),(4,4,4,28000.00,'delivered',NULL,'2024-10-06 16:25:53'),(5,5,5,20000.00,'delivered',NULL,'2024-10-06 16:25:53'),(6,6,6,18000.00,'pending',NULL,'2024-10-06 16:25:53'),(7,7,7,32000.00,'delivered',NULL,'2024-10-06 16:25:53'),(8,8,8,15000.00,'pending',NULL,'2024-10-06 16:25:53'),(9,9,9,25000.00,'confirmed',NULL,'2024-10-06 16:25:53'),(10,10,10,15000.00,'pending',NULL,'2024-10-06 16:25:53');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `payment_method` enum('credit_card','mobile_money','cash') NOT NULL,
  `payment_status` enum('pending','completed','failed') DEFAULT 'pending',
  `amount` decimal(10,2) NOT NULL,
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'mobile_money','completed',25000.00,'2024-10-06 16:30:14'),(2,2,'credit_card','completed',30000.00,'2024-10-06 16:30:14'),(3,3,'cash','pending',40000.00,'2024-10-06 16:30:14'),(4,4,'credit_card','completed',28000.00,'2024-10-06 16:30:14'),(5,5,'mobile_money','completed',20000.00,'2024-10-06 16:30:14'),(6,6,'cash','pending',18000.00,'2024-10-06 16:30:14'),(7,7,'credit_card','completed',32000.00,'2024-10-06 16:30:14'),(8,8,'mobile_money','completed',15000.00,'2024-10-06 16:30:14'),(9,9,'cash','pending',25000.00,'2024-10-06 16:30:14'),(10,10,'credit_card','completed',12000.00,'2024-10-06 16:30:14');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `promotion_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_id` int DEFAULT NULL,
  `promo_code` varchar(50) NOT NULL,
  `discount_percentage` decimal(5,2) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`promotion_id`),
  UNIQUE KEY `promo_code` (`promo_code`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
INSERT INTO `promotions` VALUES (1,1,'JAVA20',20.00,'2024-10-01','2024-10-31','2024-10-06 16:32:24'),(2,2,'LAWN15',15.00,'2024-10-05','2024-10-15','2024-10-06 16:32:24'),(3,3,'STEAK10',10.00,'2024-10-01','2024-11-01','2024-10-06 16:32:24'),(4,4,'AMICI25',25.00,'2024-10-10','2024-10-20','2024-10-06 16:32:24'),(5,5,'NANDO15',15.00,'2024-10-01','2024-10-31','2024-10-06 16:32:24'),(6,6,'CURRY30',30.00,'2024-10-05','2024-10-12','2024-10-06 16:32:24'),(7,7,'GGABA5',5.00,'2024-10-01','2024-10-15','2024-10-06 16:32:24'),(8,8,'PEARL50',50.00,'2024-10-15','2024-10-31','2024-10-06 16:32:24'),(9,9,'PIZZA10',10.00,'2024-10-01','2024-10-31','2024-10-06 16:32:24'),(10,10,'CAFE15',15.00,'2024-10-01','2024-10-30','2024-10-06 16:32:24');
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'Café Javas','Plot 1, Parliament Avenue, Kampala','256-701234567','Popular coffee shop known for its delicious meals and pastries.','2024-10-06 16:17:19'),(2,'The Lawns','Plot 47, Jinja Road, Kampala','256-702345678','A serene garden restaurant serving a variety of international dishes.','2024-10-06 16:17:19'),(3,'Kampala Grill','Plot 36, Nakasero Hill, Kampala','256-703456789','Steakhouse offering premium meats and a great view of the city.','2024-10-06 16:17:19'),(4,'Amici Restaurant','Plot 5, Luwum Street, Kampala','256-704567890','Italian restaurant famous for its pizzas and pasta.','2024-10-06 16:17:19'),(5,'Nando\'s','Kampala Road, Kampala','256-705678901','Known for its flame-grilled peri-peri chicken.','2024-10-06 16:17:19'),(6,'Curry in a Hurry','Plot 4, Wandegeya, Kampala','256-706789012','Indian restaurant specializing in curry and biryani dishes good.','2024-10-06 16:17:19'),(7,'Ggaba Beach','Ggaba Road, Kampala','256-707890123','Casual dining by the lake with local dishes and fresh fish.','2024-10-06 16:17:19'),(8,'The Pearl of Africa','Plot 34, Bombo Road, Kampala','256-708901234','Offers traditional Ugandan cuisine and a vibrant atmosphere.','2024-10-06 16:17:19'),(9,'Pizza Hut','Acacia Mall, Kisementi, Kampala','256-709012345','Famous for its pizzas and family-friendly dining.','2024-10-06 16:17:19'),(10,'Cafe Kawa','Plot 20, Entebbe Road, Kampala','256-710123456','Cozy café known for its coffee and light meals.','2024-10-06 16:17:19');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `review_text` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `user_id` (`user_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_chk_1` CHECK (((`rating` >= 1) and (`rating` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,1,5,'Great coffee and friendly service!','2024-10-06 16:31:22'),(2,2,2,4,'Beautiful ambiance and good food.','2024-10-06 16:31:22'),(3,3,3,5,'Best steak I have ever had!','2024-10-06 16:31:22'),(4,4,4,4,'Delicious pasta and nice atmosphere.','2024-10-06 16:31:22'),(5,5,5,3,'Good food but a bit pricey.','2024-10-06 16:31:22'),(6,6,6,5,'The butter chicken was amazing!','2024-10-06 16:31:22'),(7,7,7,4,'Great fish and nice lake view.','2024-10-06 16:31:22'),(8,8,8,5,'Authentic Ugandan dishes and great taste!','2024-10-06 16:31:22'),(9,9,9,4,'Love the pizza and delivery service!','2024-10-06 16:31:22'),(10,10,10,3,'Nice café but could improve on service.','2024-10-06 16:31:22');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` enum('customer','admin','delivery_personnel') DEFAULT 'customer',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alice','alice@gmail.com','256-706648672','123 Maple St, Springfield','customer','2024-10-06 16:14:37',''),(2,'Bob','bob@gmail.com','256-707123456','234 Oak St, Springfield','customer','2024-10-06 16:14:37',''),(3,'Charlie','charlie@gmail.com','256-708234567','345 Pine St, Springfield','customer','2024-10-06 16:14:37',''),(4,'David','david@gmail.com','256-709345678','456 Elm St, Springfield','customer','2024-10-06 16:14:37',''),(5,'Emma','emma@gmail.com','256-710456789','567 Cedar St, Springfield','customer','2024-10-06 16:14:37',''),(6,'Fiona','fiona@gmail.com','256-711567890','678 Birch St, Springfield','customer','2024-10-06 16:14:37',''),(7,'George','george@gmail.com','256-712678901','789 Willow St, Springfield, Springfield','customer','2024-10-06 16:14:37',''),(8,'Hannah','hannah@gmail.com','256-713789012','890 Spruce St, Springfield','customer','2024-10-06 16:14:37',''),(9,'Ian','ian@gmail.com','256-714890123','901 Fir St, Springfield','customer','2024-10-06 16:14:37',''),(10,'Jack','jack@gmail.com','256-715901234','101 Sycamore St, Springfield','customer','2024-10-06 16:14:37',''),(11,'John Paul','jpaul@gmail.com','256-706647669','222, Wandegeya Kampala','customer','2024-10-06 20:44:36','$2y$10$gJ016imDERGSHzz04.XrFeGMQjUoY0b5EUlV9WNW7QntL423ET/K6'),(13,'John Paulo','jpaulo@gmail.com','256-746647669','120, kibuli kampala','admin','2024-10-06 20:59:19','$2y$10$tE6Y.ughW4Gwn0SDkrrBo./aQnTi/mCuXB1Vn3DFs5QR8mimOt3Xy');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-16 20:16:41
