-- MySQL dump 10.13  Distrib 5.6.34, for osx10.9 (x86_64)
--
-- Host: localhost    Database: binjrdb
-- ------------------------------------------------------
-- Server version	5.6.34

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
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `img_url` varchar(90) DEFAULT NULL,
  `episode_number` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_episodes_seasons1_idx` (`season_id`),
  CONSTRAINT `fk_episodes_seasons1` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (1,'Ep 1 GOS','Episode 1',NULL,1,3),(2,'Ep 2 GOS','Episode 2',NULL,2,3),(3,'Ep 1 GOS','Episode 1',NULL,1,4),(4,'Ep 2 GOS','Episode 2',NULL,2,4),(5,'Ep 1 ST','Episode 1',NULL,1,1),(6,'Ep 2 ST','Episode 2',NULL,2,1),(7,'Ep 1 ST','Episode 1',NULL,1,2),(8,'Ep 2ST','Episode 2',NULL,2,2);
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `img_url` varchar(90) DEFAULT NULL,
  `season_number` int(11) DEFAULT NULL,
  `tv_show_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`tv_show_id`),
  KEY `fk_seasons_show1_idx` (`tv_show_id`),
  CONSTRAINT `fk_seasons_show1` FOREIGN KEY (`tv_show_id`) REFERENCES `tv_show` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,'Season 1 of Stranger Thrones','Season 1',NULL,1,2),(2,'Season 2 of Stranger Thrones','Season 2',NULL,2,2),(3,'Season 1 of Game of Swords','Season 1',NULL,1,1),(4,'Season 2 of Game of Swords','Season2',NULL,2,1);
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_show`
--

DROP TABLE IF EXISTS `tv_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tv_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `img_url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_show`
--

LOCK TABLES `tv_show` WRITE;
/*!40000 ALTER TABLE `tv_show` DISABLE KEYS */;
INSERT INTO `tv_show` VALUES (1,'Game of Swords','People killing eachother',NULL),(2,'Stranger Thrones','Throne Improvement Show',NULL);
/*!40000 ALTER TABLE `tv_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(45) NOT NULL,
  `img_url` varchar(90) NOT NULL DEFAULT 'img/default.jpg',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Chaz','chaz',1,'Chaaaz','img/default.jpg'),('Nik','nik',2,'Nikolaus','img/default.jpg'),('Robert','robert',3,'Rupert','img/default.jpg'),('JoshZ','joshz',4,'JayDizzle','img/default.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_episode`
--

DROP TABLE IF EXISTS `user_episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_episode` (
  `watched` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `episode_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_user_episode_user1_idx` (`user_id`),
  KEY `fk_user_episode_episode1_idx` (`episode_id`),
  CONSTRAINT `fk_user_episode_episode1` FOREIGN KEY (`episode_id`) REFERENCES `episode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_episode_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_episode`
--

LOCK TABLES `user_episode` WRITE;
/*!40000 ALTER TABLE `user_episode` DISABLE KEYS */;
INSERT INTO `user_episode` VALUES (1,1,1,1),(1,1,6,2);
/*!40000 ALTER TABLE `user_episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tv_show`
--

DROP TABLE IF EXISTS `user_tv_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tv_show` (
  `user_id` int(11) NOT NULL,
  `tv_show_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`tv_show_id`),
  KEY `fk_user_has_Show_Show1_idx` (`tv_show_id`),
  KEY `fk_user_has_Show_user_idx` (`user_id`),
  CONSTRAINT `fk_user_has_Show_Show1` FOREIGN KEY (`tv_show_id`) REFERENCES `tv_show` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_Show_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tv_show`
--

LOCK TABLES `user_tv_show` WRITE;
/*!40000 ALTER TABLE `user_tv_show` DISABLE KEYS */;
INSERT INTO `user_tv_show` VALUES (1,1),(2,1),(1,2);
/*!40000 ALTER TABLE `user_tv_show` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-10 16:26:09
