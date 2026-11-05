CREATE DATABASE  IF NOT EXISTS `db_test_7b` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_test_7b`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: db_test_7b
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `tb_logs`
--

DROP TABLE IF EXISTS `tb_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_logs` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(80) NOT NULL,
  `table_operation` enum('Create','Read','Update','Delete') DEFAULT NULL,
  `db_user` varchar(80) NOT NULL,
  `operation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operation_description` text NOT NULL,
  `operation_status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_logs`
--

LOCK TABLES `tb_logs` WRITE;
/*!40000 ALTER TABLE `tb_logs` DISABLE KEYS */;
INSERT INTO `tb_logs` VALUES (1,'tb_user','Create','root@localhost','2026-09-10 10:49:10','Usuario creado. ID=1, email=240174@utxicotepec.edu.mx, nick=MAY, creation_date=2026-09-10 10:49:10, status=',_binary ''),(2,'tb_user','Create','root@localhost','2026-09-10 10:50:22','Usuario creado. ID=2, email=240603@utxicotepec.edu.mx, nick=JONA, creation_date=2026-09-10 10:50:22, status=',_binary ''),(3,'tb_user','Create','root@localhost','2026-09-10 11:15:47','Usuario creado. ID=3, email=240234@utxicotepec.edu.mx, nick=JEY, creation_date=2026-09-10 11:15:47, status=',_binary ''),(4,'tb_user','Create','root@localhost','2026-09-10 11:21:45','Usuario creado. ID=5, email=230174@utxicotepec.edu.mx, nick=MAYY, creation_date=2026-09-10 11:21:45, status=',_binary ''),(5,'tb_user','Create','Jeysi.Damari@PC-16','2026-09-10 11:52:41','Usuario creado. ID=6, email=240785@utxicotepec.edu.mx, nick=Juan, creation_date=2026-09-10 11:52:41, status=',_binary ''),(6,'tb_user','Create','Jeysi.Damari@PC-16','2026-09-10 11:53:11','Usuario creado. ID=7, email=240789@utxicotepec.edu.mx, nick=Ana, creation_date=2026-09-10 11:53:11, status=',_binary ''),(7,'tb_user','Create','Jeysi.Damari@PC-16','2026-09-10 11:54:38','Usuario creado. ID=8, email=240798@utxicotepec.edu.mx, nick=Isa, creation_date=2026-09-10 11:54:38, status=',_binary ''),(8,'tb_user','Delete','root@localhost','2026-09-10 12:03:07','Usuario eliminado. ID=5, email=230174@utxicotepec.edu.mx, nick=MAYY, password=3069e0434a72c4ca9efd86b81a43957c, creation_date=2026-09-10 11:21:45, status=',_binary ''),(9,'tb_user','Delete','Jeysi.Damari@PC-16','2026-09-10 12:05:11','Usuario eliminado. ID=6, email=240785@utxicotepec.edu.mx, nick=Juan, password=827ccb0eea8a706c4c34a16891f84e7b, creation_date=2026-09-10 11:52:41, status=',_binary ''),(10,'tb_user','Update','Jeysi.Damari@PC-16','2026-09-10 12:26:13','Usuario actualizado. ID=8, email anterior=240798@utxicotepec.edu.mx, email nuevo=240798@utxicotepec.edu.mx, nick anterior=Isa, nick nuevo=Isabel, status anterior=, status nuevo=',_binary ''),(11,'tb_user','Update','root@localhost','2026-09-10 12:30:14','Usuario actualizado. ID=7, email anterior=240789@utxicotepec.edu.mx, email nuevo=240789@utxicotepec.edu.mx, nick anterior=Ana, nick nuevo=281106, status anterior=, status nuevo=',_binary ''),(12,'tb_products','Create','root@localhost','2026-09-19 20:38:44','Producto creado: \"Laptop Lenovo ThinkPad E14\". SKU: LAP-001, Precio: $14999.00, Stock inicial: 15',_binary ''),(13,'tb_products','Create','root@localhost','2026-09-19 20:38:44','Producto creado: \"Monitor LG 24MP400\". SKU: MON-002, Precio: $3299.00, Stock inicial: 25',_binary ''),(14,'tb_products','Create','root@localhost','2026-09-19 20:38:44','Producto creado: \"Teclado Mecánico Redragon\". SKU: TEC-003, Precio: $899.00, Stock inicial: 40',_binary ''),(15,'tb_products','Create','root@localhost','2026-09-19 20:38:44','Producto creado: \"Mouse Logitech G203\". SKU: MOU-004, Precio: $599.00, Stock inicial: 35',_binary ''),(16,'tb_products','Create','root@localhost','2026-09-19 20:38:44','Producto creado: \"Audífonos HyperX Cloud Stinger\". SKU: AUD-005, Precio: $1199.00, Stock inicial: 20',_binary ''),(17,'tb_products','Create','root@localhost','2026-09-19 20:38:44','Producto creado: \"SSD Kingston NV2 1TB\". SKU: SSD-006, Precio: $1399.00, Stock inicial: 18',_binary ''),(18,'tb_products','Create','root@localhost','2026-09-19 20:38:44','Producto creado: \"Memoria RAM Kingston 16GB\". SKU: RAM-007, Precio: $749.00, Stock inicial: 30',_binary ''),(19,'tb_products','Create','root@localhost','2026-09-19 20:38:44','Producto creado: \"Webcam Logitech C920\". SKU: WEB-008, Precio: $1699.00, Stock inicial: 12',_binary ''),(20,'tb_products','Create','root@localhost','2026-09-19 20:38:44','Producto creado: \"Memoria USB Kingston 128GB\". SKU: USB-009, Precio: $249.00, Stock inicial: 50',_binary ''),(21,'tb_products','Create','root@localhost','2026-09-19 20:38:44','Producto creado: \"Cable HDMI 2.1\". SKU: CAB-010, Precio: $299.00, Stock inicial: 45',_binary ''),(22,'tb_products','Update','root@localhost','2026-09-19 20:56:36','Estado: 1 -> 0;',_binary ''),(23,'tb_products','Update','root@localhost','2026-09-19 20:57:00','Estado: 1 -> 0;',_binary ''),(24,'tb_products','Update','root@localhost','2026-09-19 20:57:07','Estado: 1 -> 0;',_binary ''),(25,'tb_products','Update','root@localhost','2026-09-19 20:57:16','Estado: 1 -> 0;',_binary ''),(26,'tb_products','Update','root@localhost','2026-09-19 20:57:32','Estado: 1 -> 0;',_binary ''),(27,'tb_products','Update','root@localhost','2026-09-19 21:01:37','Estado: 0 -> 1;',_binary ''),(28,'tb_products','Update','root@localhost','2026-09-19 21:01:44','Estado: 0 -> 1;',_binary ''),(29,'tb_products','Update','root@localhost','2026-09-19 21:01:49','Estado: 0 -> 1;',_binary ''),(30,'tb_products','Update','root@localhost','2026-09-19 21:01:53','Estado: 0 -> 1;',_binary ''),(31,'tb_products','Update','root@localhost','2026-09-19 21:01:58','Estado: 0 -> 1;',_binary '');
/*!40000 ALTER TABLE `tb_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_products`
--

DROP TABLE IF EXISTS `tb_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_products` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SKU` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `current_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `current_stock` int unsigned NOT NULL DEFAULT '0',
  `status` bit(1) DEFAULT b'1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SKU` (`SKU`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_products`
--

LOCK TABLES `tb_products` WRITE;
/*!40000 ALTER TABLE `tb_products` DISABLE KEYS */;
INSERT INTO `tb_products` VALUES (11,'LAP-001','Laptop Lenovo ThinkPad E14','Laptop empresarial con procesador Intel Core i5, 16 GB de RAM y SSD de 512 GB.',14999.00,15,_binary '','2026-09-19 20:38:44','2026-09-19 20:38:44'),(12,'MON-002','Monitor LG 24MP400','Monitor Full HD de 24 pulgadas con panel IPS.',3299.00,25,_binary '','2026-09-19 20:38:44','2026-09-19 21:01:37'),(13,'TEC-003','Teclado Mecánico Redragon','Teclado mecánico RGB con conexión USB y switches mecánicos.',899.00,40,_binary '','2026-09-19 20:38:44','2026-09-19 20:38:44'),(14,'MOU-004','Mouse Logitech G203','Mouse óptico para computadora con iluminación RGB.',599.00,35,_binary '','2026-09-19 20:38:44','2026-09-19 21:01:44'),(15,'AUD-005','Audífonos HyperX Cloud Stinger','Audífonos gaming con micrófono integrado y conexión de 3.5 mm.',1199.00,20,_binary '','2026-09-19 20:38:44','2026-09-19 20:38:44'),(16,'SSD-006','SSD Kingston NV2 1TB','Unidad de almacenamiento SSD NVMe de 1 TB.',1399.00,18,_binary '','2026-09-19 20:38:44','2026-09-19 21:01:49'),(17,'RAM-007','Memoria RAM Kingston 16GB','Módulo de memoria DDR4 de 16 GB para computadora.',749.00,30,_binary '','2026-09-19 20:38:44','2026-09-19 20:38:44'),(18,'WEB-008','Webcam Logitech C920','Cámara web Full HD 1080p para videoconferencias y streaming.',1699.00,12,_binary '','2026-09-19 20:38:44','2026-09-19 21:01:53'),(19,'USB-009','Memoria USB Kingston 128GB','Unidad USB 3.2 de 128 GB para almacenamiento portátil.',249.00,50,_binary '','2026-09-19 20:38:44','2026-09-19 20:38:44'),(20,'CAB-010','Cable HDMI 2.1','Cable HDMI de alta velocidad compatible con resolución 4K.',299.00,45,_binary '','2026-09-19 20:38:44','2026-09-19 21:01:58');
/*!40000 ALTER TABLE `tb_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_products_after_insert` AFTER INSERT ON `tb_products` FOR EACH ROW BEGIN
    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description
    )
    VALUES (
        'tb_products',
        'Create',
        USER(),
        CONCAT(
            'Producto creado: "', NEW.name,
            '". SKU: ', NEW.SKU,
            ', Precio: $', NEW.current_price,
            ', Stock inicial: ', NEW.current_stock
        )
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_products_after_update` AFTER UPDATE ON `tb_products` FOR EACH ROW BEGIN
    DECLARE changes_detail TEXT DEFAULT '';

    IF NOT (OLD.name <=> NEW.name) THEN
        SET changes_detail = CONCAT(
            changes_detail,
            'Nombre: "', OLD.name, '" -> "', NEW.name, '"; '
        );
    END IF;

    IF NOT (OLD.current_price <=> NEW.current_price) THEN
        SET changes_detail = CONCAT(
            changes_detail,
            'Precio: $', OLD.current_price,
            ' -> $', NEW.current_price, '; '
        );
    END IF;

    IF NOT (OLD.current_stock <=> NEW.current_stock) THEN
        SET changes_detail = CONCAT(
            changes_detail,
            'Stock: ', OLD.current_stock,
            ' -> ', NEW.current_stock, '; '
        );
    END IF;

    IF NOT (OLD.status <=> NEW.status) THEN
        SET changes_detail = CONCAT(
            changes_detail,
            'Estado: ',
            CAST(OLD.status AS UNSIGNED),
            ' -> ',
            CAST(NEW.status AS UNSIGNED),
            '; '
        );
    END IF;

    IF CHAR_LENGTH(changes_detail) > 0 THEN
        INSERT INTO tb_logs (
            table_name,
            table_operation,
            db_user,
            operation_description
        )
        VALUES (
            'tb_products',
            'Update',
            USER(),
            TRIM(changes_detail)
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `nick` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nick` (`nick`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'240174@utxicotepec.edu.mx','MAY','3069e0434a72c4ca9efd86b81a43957c','2026-09-10 10:49:10',NULL,NULL,_binary ''),(2,'240603@utxicotepec.edu.mx','JONA','455fbaef4354949363cb1f72cee817d9','2026-09-10 10:50:22',NULL,NULL,_binary ''),(3,'240234@utxicotepec.edu.mx','JEY','51676091c6366bd05da30f9e0fe59aa0','2026-09-10 11:15:47',NULL,NULL,_binary ''),(7,'240789@utxicotepec.edu.mx','281106','827ccb0eea8a706c4c34a16891f84e7b','2026-09-10 11:53:11','2026-09-10 12:30:14',NULL,_binary ''),(8,'240798@utxicotepec.edu.mx','Isabel','827ccb0eea8a706c4c34a16891f84e7b','2026-09-10 11:54:38','2026-09-10 12:26:13',NULL,_binary '');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trq_user_after_insert` AFTER INSERT ON `tb_user` FOR EACH ROW BEGIN

    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_date,
        operation_status
    )
    VALUES (
        'tb_user',
        'Create',
        USER(),
        CONCAT(
            'Usuario creado. ID=', NEW.ID,
            ', email=', NEW.email,
            ', nick=', NEW.nick,
            ', creation_date=', NEW.creation_date,
            ', status=', NEW.status
        ),
        CURRENT_TIMESTAMP,
        b'1'
    );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trq_user_after_update` AFTER UPDATE ON `tb_user` FOR EACH ROW BEGIN

    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_date,
        operation_status
    )
    VALUES (
        'tb_user',
        'Update',
        USER(),
        CONCAT(
            'Usuario actualizado. ID=', NEW.ID,
            ', email anterior=', OLD.email,
            ', email nuevo=', NEW.email,
            ', nick anterior=', OLD.nick,
            ', nick nuevo=', NEW.nick,
            ', status anterior=', OLD.status,
            ', status nuevo=', NEW.status
        ),
        CURRENT_TIMESTAMP,
        b'1'
    );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trq_user_after_delete` AFTER DELETE ON `tb_user` FOR EACH ROW BEGIN

    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_date,
        operation_status
    )
    VALUES (
        'tb_user',
        'Delete',
        USER(),
        CONCAT(
            'Usuario eliminado. ID=', OLD.ID,
            ', email=', OLD.email,
            ', nick=', OLD.nick,
            ', password=', OLD.password,
            ', creation_date=', OLD.creation_date,
            ', status=', OLD.status
        ),
        CURRENT_TIMESTAMP,
        b'1'
    );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'db_test_7b'
--

--
-- Dumping routines for database 'db_test_7b'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_restore_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_restore_product`(
    IN p_product_id INT UNSIGNED
)
BEGIN

    IF NOT EXISTS (
        SELECT 1
        FROM tb_products
        WHERE ID = p_product_id
    ) THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El producto especificado no existe';

    END IF;

    IF EXISTS (
        SELECT 1
        FROM tb_products
        WHERE ID = p_product_id
          AND status = b'1'
    ) THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El producto ya se encuentra activo';

    END IF;

    UPDATE tb_products
    SET status = b'1'
    WHERE ID = p_product_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_soft_delete_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_soft_delete_product`(
    IN p_product_id INT UNSIGNED
)
BEGIN

    IF NOT EXISTS (
        SELECT 1
        FROM tb_products
        WHERE ID = p_product_id
    ) THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El producto especificado no existe';

    END IF;

    IF EXISTS (
        SELECT 1
        FROM tb_products
        WHERE ID = p_product_id
          AND status = b'0'
    ) THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El producto ya se encuentra eliminado';

    END IF;

    UPDATE tb_products
    SET status = b'0'
    WHERE ID = p_product_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-19 21:09:40
