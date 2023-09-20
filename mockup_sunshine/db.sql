-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: sunshine_mockup
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add testimony',7,'add_testimony'),(26,'Can change testimony',7,'change_testimony'),(27,'Can delete testimony',7,'delete_testimony'),(28,'Can view testimony',7,'view_testimony'),(29,'Can add participant',8,'add_participant'),(30,'Can change participant',8,'change_participant'),(31,'Can delete participant',8,'delete_participant'),(32,'Can view participant',8,'view_participant'),(33,'Can add question category',9,'add_questioncategory'),(34,'Can change question category',9,'change_questioncategory'),(35,'Can delete question category',9,'delete_questioncategory'),(36,'Can view question category',9,'view_questioncategory'),(37,'Can add question',10,'add_question'),(38,'Can change question',10,'change_question'),(39,'Can delete question',10,'delete_question'),(40,'Can view question',10,'view_question'),(41,'Can add explanation',11,'add_explanation'),(42,'Can change explanation',11,'change_explanation'),(43,'Can delete explanation',11,'delete_explanation'),(44,'Can view explanation',11,'view_explanation'),(45,'Can add question set',12,'add_questionset'),(46,'Can change question set',12,'change_questionset'),(47,'Can delete question set',12,'delete_questionset'),(48,'Can view question set',12,'view_questionset'),(49,'Can add choice',13,'add_choice'),(50,'Can change choice',13,'change_choice'),(51,'Can delete choice',13,'delete_choice'),(52,'Can view choice',13,'view_choice');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$iqQ6pll0KTiHBwl0nYtGVP$cUjD8eUsajvp99WvX8teQqswU0XR4ZLWBPS3hI0xgM4=','2023-09-15 04:54:07.306493',1,'sajal','','','sajalpoudel73@gmail.com',1,1,'2023-09-11 10:50:05.254719'),(3,'pbkdf2_sha256$600000$GgYdthUunDB4sywDhLWQCM$U4+YXH7izc7vAfDddlIETf18kVSfH0K/Yz3JndcAeic=','2023-09-12 04:43:59.111561',0,'bibek','','','bibekb@gmail.com',0,1,'2023-09-12 04:43:46.955992'),(4,'pbkdf2_sha256$600000$EjXb98eilwhc0bmPcDXfNO$OaQCwfNRgVs6ra7zTUHIdoPYBY3xeF4BXI8+4U2dKxo=','2023-09-13 05:45:08.305357',0,'user1','','','user1@email.com',0,1,'2023-09-13 05:44:53.529831');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-09-12 07:35:43.354665','1','Management Of Care',1,'[{\"added\": {}}]',9,1),(2,'2023-09-12 08:38:20.868864','1','A patient with Parkinson’s disease has a nursing diagnosis of Impaired Physical Mobility related to neuromuscular impairment. You observe a nursing assistant performing all of these actions. For which',1,'[{\"added\": {}}]',10,1),(3,'2023-09-12 08:43:22.444875','2','Health Promotion and Maintenan',1,'[{\"added\": {}}]',9,1),(4,'2023-09-12 08:44:07.212033','2','Health Promotion and Maintenance',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(5,'2023-09-12 09:07:48.538699','1','1',1,'[{\"added\": {}}]',13,1),(6,'2023-09-12 09:07:57.564346','2','2',1,'[{\"added\": {}}]',13,1),(7,'2023-09-12 09:08:04.325894','3','3',1,'[{\"added\": {}}]',13,1),(8,'2023-09-12 09:08:11.612129','4','4',1,'[{\"added\": {}}]',13,1),(9,'2023-09-12 09:08:41.545792','1','Explanation for Question 1, Choice 1',1,'[{\"added\": {}}]',11,1),(10,'2023-09-12 09:09:01.104732','2','Explanation for Question 1, Choice 2',1,'[{\"added\": {}}]',11,1),(11,'2023-09-12 09:09:14.257771','3','Explanation for Question 1, Choice 3',1,'[{\"added\": {}}]',11,1),(12,'2023-09-12 09:09:29.281795','4','Explanation for Question 1, Choice 4',1,'[{\"added\": {}}]',11,1),(13,'2023-09-12 10:45:55.516503','3','Physiological Adaptation',1,'[{\"added\": {}}]',9,1),(14,'2023-09-12 10:49:38.288764','5','1',1,'[{\"added\": {}}]',13,1),(15,'2023-09-12 10:49:50.066597','6','2',1,'[{\"added\": {}}]',13,1),(16,'2023-09-12 10:49:56.808599','7','3',1,'[{\"added\": {}}]',13,1),(17,'2023-09-12 10:50:03.602601','8','4',1,'[{\"added\": {}}]',13,1),(18,'2023-09-12 10:51:07.177690','5','Explanation for Question 2, Choice 5',1,'[{\"added\": {}}]',11,1),(19,'2023-09-12 10:51:24.674613','6','Explanation for Question 2, Choice 6',1,'[{\"added\": {}}]',11,1),(20,'2023-09-12 10:51:56.277058','7','Explanation for Question 2, Choice 7',1,'[{\"added\": {}}]',11,1),(21,'2023-09-12 10:52:12.448376','8','Explanation for Question 2, Choice 8',1,'[{\"added\": {}}]',11,1),(22,'2023-09-13 06:39:09.569863','4','Basic Care And Comfort',1,'[{\"added\": {}}]',9,1),(23,'2023-09-13 08:25:13.975460','5','what\'s my name?',3,'',10,1),(24,'2023-09-13 08:27:21.835018','1','Sajal Poudel',1,'[{\"added\": {}}]',7,1),(25,'2023-09-13 08:30:31.341178','2','Suraj Giri',1,'[{\"added\": {}}]',7,1),(26,'2023-09-13 08:30:55.902639','3','Saroj Neupane',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'exams','choice'),(11,'exams','explanation'),(8,'exams','participant'),(10,'exams','question'),(9,'exams','questioncategory'),(12,'exams','questionset'),(7,'exams','testimony'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-09-11 10:48:43.694711'),(2,'auth','0001_initial','2023-09-11 10:48:44.347140'),(3,'admin','0001_initial','2023-09-11 10:48:44.496385'),(4,'admin','0002_logentry_remove_auto_add','2023-09-11 10:48:44.516084'),(5,'admin','0003_logentry_add_action_flag_choices','2023-09-11 10:48:44.532646'),(6,'contenttypes','0002_remove_content_type_name','2023-09-11 10:48:44.633012'),(7,'auth','0002_alter_permission_name_max_length','2023-09-11 10:48:44.703462'),(8,'auth','0003_alter_user_email_max_length','2023-09-11 10:48:44.733559'),(9,'auth','0004_alter_user_username_opts','2023-09-11 10:48:44.741998'),(10,'auth','0005_alter_user_last_login_null','2023-09-11 10:48:44.801402'),(11,'auth','0006_require_contenttypes_0002','2023-09-11 10:48:44.815668'),(12,'auth','0007_alter_validators_add_error_messages','2023-09-11 10:48:44.818131'),(13,'auth','0008_alter_user_username_max_length','2023-09-11 10:48:44.904020'),(14,'auth','0009_alter_user_last_name_max_length','2023-09-11 10:48:44.967898'),(15,'auth','0010_alter_group_name_max_length','2023-09-11 10:48:45.002612'),(16,'auth','0011_update_proxy_permissions','2023-09-11 10:48:45.021710'),(17,'auth','0012_alter_user_first_name_max_length','2023-09-11 10:48:45.101025'),(18,'exams','0001_initial','2023-09-11 10:48:45.126066'),(19,'exams','0002_participant','2023-09-11 10:48:45.294908'),(20,'exams','0003_participant_dob_participant_education_and_more','2023-09-11 10:48:45.419262'),(21,'sessions','0001_initial','2023-09-11 10:48:45.468645'),(22,'exams','0004_choice_questioncategory_questionset_question_and_more','2023-09-12 06:12:54.123232'),(23,'exams','0005_alter_questioncategory_name_alter_questionset_name','2023-09-12 08:43:59.192266');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1gx1ctlt86mc9jttqws6xy669ug4jsy0','.eJxVjMsOwiAQRf-FtSEMWB4u3fsNZJgBqRqalHZl_HdD0oVu7znnvkXEfatx73mNM4uLAHH63RLSM7cB-IHtvkha2rbOSQ5FHrTL28L5dT3cv4OKvY4aiR2D0mCD0q4YR96di0nKgM-BUgCrTMLgUdGUGTLbQmiCncDrwOLzBd9mN9I:1qh0qF:ERKh8VzDA34UhNUXhrFEmYXs0Csi9ngZZ1BCI0ybdmM','2023-09-29 04:54:07.359255'),('evdmrxxq629bzpcov7z4f3k1k0svp2ew','.eJxVjMsOwiAQRf-FtSEMWB4u3fsNZJgBqRqalHZl_HdD0oVu7znnvkXEfatx73mNM4uLAHH63RLSM7cB-IHtvkha2rbOSQ5FHrTL28L5dT3cv4OKvY4aiR2D0mCD0q4YR96di0nKgM-BUgCrTMLgUdGUGTLbQmiCncDrwOLzBd9mN9I:1qgHcW:l_CuCJ0VTe_Rqq3ZEJFPaWJfHOCkSCEIEjzH2QwfjSQ','2023-09-27 04:36:56.121926'),('o0saqaf6ggc4mdy5y6kepf6jpxvu0fad','.eJxVjMsOwiAQRf-FtSEMWB4u3fsNZJgBqRqalHZl_HdD0oVu7znnvkXEfatx73mNM4uLAHH63RLSM7cB-IHtvkha2rbOSQ5FHrTL28L5dT3cv4OKvY4aiR2D0mCD0q4YR96di0nKgM-BUgCrTMLgUdGUGTLbQmiCncDrwOLzBd9mN9I:1qgIjv:Zl4aFNDQ5RQOuUw_Q0PJZd0YAFUIUkKReimylcUE_yM','2023-09-27 05:48:39.404553'),('rw74pa60yc4rgfa9hieynf5xl3cd6wd9','.eJxVjMsOwiAQRf-FtSEMWB4u3fsNZJgBqRqalHZl_HdD0oVu7znnvkXEfatx73mNM4uLAHH63RLSM7cB-IHtvkha2rbOSQ5FHrTL28L5dT3cv4OKvY4aiR2D0mCD0q4YR96di0nKgM-BUgCrTMLgUdGUGTLbQmiCncDrwOLzBd9mN9I:1qgKk1:VF58dhPYjpL7oMn9qmJA3IrMLukbyh3cDZgiLzcoE3w','2023-09-27 07:56:53.490039'),('tzuw3n265iauu19o5mha3xsit6q6pqs4','.eJxVjMsOwiAQRf-FtSEMWB4u3fsNZJgBqRqalHZl_HdD0oVu7znnvkXEfatx73mNM4uLAHH63RLSM7cB-IHtvkha2rbOSQ5FHrTL28L5dT3cv4OKvY4aiR2D0mCD0q4YR96di0nKgM-BUgCrTMLgUdGUGTLbQmiCncDrwOLzBd9mN9I:1qfvGg:zM9Yz51MT1URMjhuH_H50Fuo9yo29xpw3_p4IBCeXNI','2023-09-26 04:44:54.801177');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams_choice`
--

DROP TABLE IF EXISTS `exams_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams_choice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `choice` int NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `question_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exams_choice_question_id_ce7c2385_fk_exams_question_id` (`question_id`),
  CONSTRAINT `exams_choice_question_id_ce7c2385_fk_exams_question_id` FOREIGN KEY (`question_id`) REFERENCES `exams_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams_choice`
--

LOCK TABLES `exams_choice` WRITE;
/*!40000 ALTER TABLE `exams_choice` DISABLE KEYS */;
INSERT INTO `exams_choice` VALUES (1,1,1,1),(2,2,0,1),(3,3,0,1),(4,4,0,1),(5,1,1,2),(6,2,0,2),(7,3,0,2),(8,4,0,2),(9,1,0,3),(10,2,1,3),(11,3,0,3),(12,4,0,3),(13,1,0,4),(14,2,1,4),(15,3,0,4),(16,4,0,4),(21,1,0,6),(22,2,0,6),(23,3,0,6),(24,4,1,6),(25,1,0,7),(26,2,1,7),(27,3,0,7),(28,4,0,7),(29,1,1,8),(30,2,1,8),(31,3,0,8),(32,4,1,8),(33,5,1,8);
/*!40000 ALTER TABLE `exams_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams_explanation`
--

DROP TABLE IF EXISTS `exams_explanation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams_explanation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `choice_id` bigint NOT NULL,
  `question_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exams_explanation_choice_id_b3b3073f_fk_exams_choice_id` (`choice_id`),
  KEY `exams_explanation_question_id_e46b1c19_fk_exams_question_id` (`question_id`),
  CONSTRAINT `exams_explanation_choice_id_b3b3073f_fk_exams_choice_id` FOREIGN KEY (`choice_id`) REFERENCES `exams_choice` (`id`),
  CONSTRAINT `exams_explanation_question_id_e46b1c19_fk_exams_question_id` FOREIGN KEY (`question_id`) REFERENCES `exams_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams_explanation`
--

LOCK TABLES `exams_explanation` WRITE;
/*!40000 ALTER TABLE `exams_explanation` DISABLE KEYS */;
INSERT INTO `exams_explanation` VALUES (1,'“I will avoid exercise because the pain gets worse.”',1,1),(2,'“I will use heat or ice to help control the pain.”',2,1),(3,'“I will not wear high-heeled shoes at home or work.”',3,1),(4,'“I will purchase a firm mattress to replace my old one.”',4,1),(5,'“I will avoid exercise because the pain gets worse.”',5,2),(6,'“I will use heat or ice to help control the pain.”',6,2),(7,'“I will not wear high-heeled shoes at home or work.”',7,2),(8,'“I will purchase a firm mattress to replace my old one.”',8,2),(9,'Administer the ordered acetaminophen (Tylenol).',9,3),(10,'Check the Foley tubing for kinks or obstruction.',10,3),(11,'Adjust the temperature in the patient’s room.',11,3),(12,'Notify the physician about the change in status.',12,3),(13,'A 28-year-old newly admitted patient with spinal cord injury.',13,4),(14,'A 67-year-old patient with stroke 3 days ago and left-sided\r\nweakness.',14,4),(15,'An 85-year-old dementia patient to be transferred to long-term care today.',15,4),(16,'A 54-year-old patient with Parkinson’s who needs assistance with bathing.',16,4),(20,'Determine the level at which the patient has intact sensation.',21,6),(21,'Assess the level at which the patient has retained mobility.',22,6),(22,'Check blood pressure and pulse for signs of spinal shock.',23,6),(23,'Monitor respiratory effort and oxygen saturation level.',24,6),(24,'Assess the patient&#39;s respiratory status every 4 hours.',25,7),(25,'Take the patient’s vital signs and record them every 4 hours.',26,7),(26,'Monitor nutritional status including calorie counts.',27,7),(27,'Have the patient turn, cough, and deep breathe every 3 hours.',28,7),(28,'Stroke the patient’s inner thigh.',29,8),(29,'Pull on the patient’s pubic hair.',30,8),(30,'Initiate intermittent straight catheterization.',31,8),(31,'Pour warm water over the perineum.',32,8),(32,'Tap the bladder to stimulate detrusor muscle.',33,8);
/*!40000 ALTER TABLE `exams_explanation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams_participant`
--

DROP TABLE IF EXISTS `exams_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams_participant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `user_id` int NOT NULL,
  `dob` date NOT NULL,
  `education` varchar(30) NOT NULL,
  `university` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exams_participant_user_id_91abe756_fk_auth_user_id` (`user_id`),
  CONSTRAINT `exams_participant_user_id_91abe756_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams_participant`
--

LOCK TABLES `exams_participant` WRITE;
/*!40000 ALTER TABLE `exams_participant` DISABLE KEYS */;
INSERT INTO `exams_participant` VALUES (2,'Bibek Baral','bibekb@gmail.com','sdlkafj','4342343242',3,'1999-08-10','Bachelors','Tribhuvan University'),(3,'User One','user1@email.com','jamal','234234234234',4,'1989-02-18','Masters','Honululu');
/*!40000 ALTER TABLE `exams_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams_question`
--

DROP TABLE IF EXISTS `exams_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams_question` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` longtext NOT NULL,
  `category_id` bigint NOT NULL,
  `question_set_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exams_question_category_id_4533fbd8_fk_exams_questioncategory_id` (`category_id`),
  KEY `exams_question_question_set_id_8d652b3e_fk_exams_questionset_id` (`question_set_id`),
  CONSTRAINT `exams_question_category_id_4533fbd8_fk_exams_questioncategory_id` FOREIGN KEY (`category_id`) REFERENCES `exams_questioncategory` (`id`),
  CONSTRAINT `exams_question_question_set_id_8d652b3e_fk_exams_questionset_id` FOREIGN KEY (`question_set_id`) REFERENCES `exams_questionset` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams_question`
--

LOCK TABLES `exams_question` WRITE;
/*!40000 ALTER TABLE `exams_question` DISABLE KEYS */;
INSERT INTO `exams_question` VALUES (1,'A patient with Parkinson’s disease has a nursing diagnosis of Impaired Physical Mobility related to neuromuscular impairment. You observe a nursing assistant performing all of these actions. For which action must you intervene?',1,1),(2,'The nurse is preparing to discharge a patient with chronic low back pain. Which statement by the patient indicates that additional teaching is necessary?',2,1),(3,'A patient with a spinal cord injury (SCI) complains about a severe throbbing headache that suddenly started a short time ago. Assessment of the patient reveals increased blood pressure (168/94) and decreased heart rate (48/minute), diaphoresis, and flushing of the face and neck. What action should you take first?',3,1),(4,'Which patient should you, as charge nurse, assign to a new graduate RN who is orienting to the neurologic unit?',1,1),(6,'A patient with a spinal cord injury at level C3-4 is being cared for in the ED. What is the priority assessment?',3,1),(7,'You are pulled from the ED to the neurologic floor. Which action should youndelegate to the nursing assistant when providing nursing care for a patient with SCI?',1,1),(8,'You are helping the patient with an SCI to establish a bladder-retraining program. What strategies may stimulate the patient to void? Select all that apply.',4,1);
/*!40000 ALTER TABLE `exams_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams_questioncategory`
--

DROP TABLE IF EXISTS `exams_questioncategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams_questioncategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams_questioncategory`
--

LOCK TABLES `exams_questioncategory` WRITE;
/*!40000 ALTER TABLE `exams_questioncategory` DISABLE KEYS */;
INSERT INTO `exams_questioncategory` VALUES (1,'Management Of Care'),(2,'Health Promotion and Maintenance'),(3,'Physiological Adaptation'),(4,'Basic Care And Comfort'),(5,'Reduction of Risk Potential'),(6,'Pharmacological and Parenteral Therapies'),(7,'Psychosocial Integrity');
/*!40000 ALTER TABLE `exams_questioncategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams_questionset`
--

DROP TABLE IF EXISTS `exams_questionset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams_questionset` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams_questionset`
--

LOCK TABLES `exams_questionset` WRITE;
/*!40000 ALTER TABLE `exams_questionset` DISABLE KEYS */;
INSERT INTO `exams_questionset` VALUES (1,'Set 1'),(3,'Set 2'),(4,'Set 3'),(5,'Set 4');
/*!40000 ALTER TABLE `exams_questionset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams_testimony`
--

DROP TABLE IF EXISTS `exams_testimony`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams_testimony` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_name` varchar(100) NOT NULL,
  `test_date` date NOT NULL,
  `testimony_text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams_testimony`
--

LOCK TABLES `exams_testimony` WRITE;
/*!40000 ALTER TABLE `exams_testimony` DISABLE KEYS */;
INSERT INTO `exams_testimony` VALUES (1,'Sajal Poudel','2023-08-02','\"I had the pleasure of using the MockUpTestConduction website for my recent exam preparation, and I must say it was a game-changer! The platform is incredibly user-friendly, and the interface is intuitive. The variety of practice tests available helped me immensely in assessing my knowledge and preparing effectively. I also appreciated the detailed performance analytics that allowed me to track my progress. Thanks to MockUpTestConduction, I aced my exam confidently.\"','2023-09-13 08:27:21.833063'),(2,'Suraj Giri','2023-09-01','\"MockUpTestConduction is a gem for anyone preparing for exams. The wide range of practice tests and the ability to simulate real exam conditions were a big plus. The platform\'s interface is clean and intuitive, making it easy to navigate. I appreciate the convenience it offered, allowing me to practice whenever I had spare time. I wholeheartedly recommend MockUpTestConduction to all my peers.\"','2023-09-13 08:30:31.339193'),(3,'Saroj Neupane','2023-08-17','\"I can\'t express how thankful I am for MockUpTestConduction. The platform\'s user-friendly interface, coupled with its extensive question bank, made my exam preparation enjoyable and effective. I particularly liked the ability to review my performance and see where I needed improvement. MockUpTestConduction is a must-try for anyone serious about excelling in their exams.\"','2023-09-13 08:30:55.901639');
/*!40000 ALTER TABLE `exams_testimony` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-15 10:50:55
