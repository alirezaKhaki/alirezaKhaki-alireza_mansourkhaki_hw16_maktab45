-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blog2
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `brief` varchar(45) NOT NULL,
  `content` varchar(45) NOT NULL,
  `create_date` varchar(45) NOT NULL,
  `writer_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`,`writer_id`),
  KEY `fk_article_writer_idx` (`writer_id`),
  KEY `fk_article_category1_idx` (`category_id`),
  CONSTRAINT `fk_article_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_article_writer` FOREIGN KEY (`writer_id`) REFERENCES `writer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'The Outsider','abc','abc','2018-01-01',7,7),(2,'11/22/63','abc','abc','2011-02-03',7,5),(3,'It','abc','abc','1986-01-02',7,3),(4,'The Great Gatsby','abc','abc','1953-07-02',6,4),(5,'The Catcher in the Rye','abc','abc','1996-04-02',5,2),(6,'Jane Eyre','abc','abc','1930-02-11',4,8),(7,'Nine Stories','abc','abc','1932-10-10',4,9),(8,'Harry Potter','abc','abc','1998-07-07',3,2),(9,'The Lord of the Rings','abc','abc','1948-06-04',2,1),(10,'The Hobbits','abc','abc','1937-04-12',2,1),(11,'1984','abc','abc','1960-12-12',1,7),(12,'Animal Farm','abc','abc','1956-02-02',1,2);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_has_tag`
--

DROP TABLE IF EXISTS `article_has_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_has_tag` (
  `article_id` int NOT NULL,
  `article_writer_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`article_id`,`article_writer_id`,`tag_id`),
  KEY `fk_article_has_tag_tag1_idx` (`tag_id`),
  KEY `fk_article_has_tag_article1_idx` (`article_id`,`article_writer_id`),
  CONSTRAINT `fk_article_has_tag_article1` FOREIGN KEY (`article_id`, `article_writer_id`) REFERENCES `article` (`id`, `writer_id`),
  CONSTRAINT `fk_article_has_tag_tag1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_has_tag`
--

LOCK TABLES `article_has_tag` WRITE;
/*!40000 ALTER TABLE `article_has_tag` DISABLE KEYS */;
INSERT INTO `article_has_tag` VALUES (3,7,1),(9,2,1),(1,7,2),(2,7,2),(8,3,2),(10,2,2),(2,7,3),(7,4,3),(5,5,4),(4,6,5),(11,1,5),(6,4,6),(12,1,6);
/*!40000 ALTER TABLE `article_has_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Adventure'),(2,'Fantasy'),(3,'Horror'),(4,'Classic'),(5,'Historical'),(6,'Crime'),(7,'Sci-Fi'),(8,'Romance'),(9,'Short');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'#blue'),(2,'#purple'),(3,'#black'),(4,'#red'),(5,'#yellow'),(6,'#blank'),(7,'#white');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writer`
--

DROP TABLE IF EXISTS `writer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `writer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writer`
--

LOCK TABLES `writer` WRITE;
/*!40000 ALTER TABLE `writer` DISABLE KEYS */;
INSERT INTO `writer` VALUES (1,'George','Orwell',70),(2,'J.R.R','Tolkien',75),(3,'J.K.','Rowling',60),(4,'Emily','Bronte',54),(5,'J.D.','Salinger',62),(6,'Scott','Fitzgerald',80),(7,'Stephen','King',67);
/*!40000 ALTER TABLE `writer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-03 16:54:01