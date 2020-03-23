-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: my_app
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

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
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants` (
  `id_restaurant` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `address` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `lat` decimal(12,9) NOT NULL,
  `lng` decimal(12,9) NOT NULL,
  `kind_food` set('Mexicana','Asiatica','Mediterránea','Italiana','Vegetariana') DEFAULT NULL,
  PRIMARY KEY (`id_restaurant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'Ay Caramba!','Carrer de Santaló, 85, 08021 Barcelona',41.397622000,2.143153000,'Mexicana'),(2,'Veggie garden','Gran Via de les Corts Catalanes, 602, 08007 B',41.386786000,2.165274000,'Vegetariana'),(3,'La Poma Restaurant','La Rambla, 117, 08002 Barcelona',41.384460000,2.170515000,'Mediterránea'),(4,'Red Ant Noodle Bar','Carrer dels Tiradors, 5, 08003 Barcelona',41.387990000,2.180993000,'Asiatica'),(5,'Manduca Healthy Corner','Carrer de Freixures, 7, 08003 Barcelona',41.385785000,2.178295000,'Vegetariana'),(6,'Restaurante VABOWL','Carrer de la Diputació, 139, 08011 Barcelona',41.383526000,2.157667000,'Asiatica'),(7,'DOWNTOWN','Carrer de n\'Amargós, 13, 08002 Barcelona',41.386336000,2.174059000,'Mediterránea'),(8,'La Italiana','Carrer del Bonsuccés, 12, 08001 Barcelona',41.384249000,2.169968000,'Italiana'),(9,'Gravin','Carrer de Rera Palau, 3, 08003 Barcelona',41.383861000,2.183593000,'Italiana'),(10,'Ikibana Borne','Passeig de Picasso, 32, 08003 Barcelona',41.386387000,2.184424000,'Asiatica');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-23 14:11:41
