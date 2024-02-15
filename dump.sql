-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hakaton_db
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add content type',4,'add_contenttype'),
(14,'Can change content type',4,'change_contenttype'),
(15,'Can delete content type',4,'delete_contenttype'),
(16,'Can view content type',4,'view_contenttype'),
(17,'Can add session',5,'add_session'),
(18,'Can change session',5,'change_session'),
(19,'Can delete session',5,'delete_session'),
(20,'Can view session',5,'view_session'),
(21,'Can add role',6,'add_role'),
(22,'Can change role',6,'change_role'),
(23,'Can delete role',6,'delete_role'),
(24,'Can view role',6,'view_role'),
(25,'Can add Пользователь',7,'add_customuser'),
(26,'Can change Пользователь',7,'change_customuser'),
(27,'Can delete Пользователь',7,'delete_customuser'),
(28,'Can view Пользователь',7,'view_customuser'),
(29,'Can add Курс',8,'add_course'),
(30,'Can change Курс',8,'change_course'),
(31,'Can delete Курс',8,'delete_course'),
(32,'Can view Курс',8,'view_course'),
(33,'Can add Категория курса',9,'add_coursecategory'),
(34,'Can change Категория курса',9,'change_coursecategory'),
(35,'Can delete Категория курса',9,'delete_coursecategory'),
(36,'Can view Категория курса',9,'view_coursecategory');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `surname` varchar(150) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `auth_user_role_id_53c4ca6d_fk_courses_role_id` (`role_id`),
  CONSTRAINT `auth_user_role_id_53c4ca6d_fk_courses_role_id` FOREIGN KEY (`role_id`) REFERENCES `courses_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$720000$3j4NxfhF4LBaLPiiUhUoxS$d6RyhAA+E1MlbiRtV285ety85JP+YntpoHlhhlnuGdA=','2024-02-09 09:05:47.607202','root',NULL,1,1,1,'Дмитрий','Шутрин','user_photos/face.jpg',NULL);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `theme` varchar(100) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_category_id_d64b93bf_fk_courses_coursecategory_id` (`category_id`),
  CONSTRAINT `courses_course_category_id_d64b93bf_fk_courses_coursecategory_id` FOREIGN KEY (`category_id`) REFERENCES `courses_coursecategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES
(1,'Python Django для начинающих','В этом курсе вы узнаете, как установить и базово настроить django.','Django',1,'courses_previews/django-logo.jpg'),
(2,'MySQL для начинающих','Создадим БД и таблицы','MySQL',2,'courses_previews/Introduction-To-Databases.jpg'),
(3,'JavaScript с нуля','ывщаыдваввао','JavaScript',3,'courses_previews/django-logo_Er18XbD.jpg'),
(4,'RUST с нуля','sjgsdfjgsdfjg;dfjgsod[p','Rust',4,'courses_previews/django-logo_h9ioT4F.jpg');
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course_authors`
--

DROP TABLE IF EXISTS `courses_course_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course_authors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_course_authors_course_id_customuser_id_8b35de19_uniq` (`course_id`,`customuser_id`),
  KEY `courses_course_authors_customuser_id_33866337_fk_auth_user_id` (`customuser_id`),
  CONSTRAINT `courses_course_authors_course_id_8cd89ea8_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `courses_course_authors_customuser_id_33866337_fk_auth_user_id` FOREIGN KEY (`customuser_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course_authors`
--

LOCK TABLES `courses_course_authors` WRITE;
/*!40000 ALTER TABLE `courses_course_authors` DISABLE KEYS */;
INSERT INTO `courses_course_authors` VALUES
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1);
/*!40000 ALTER TABLE `courses_course_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_coursecategory`
--

DROP TABLE IF EXISTS `courses_coursecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_coursecategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_coursecategory`
--

LOCK TABLES `courses_coursecategory` WRITE;
/*!40000 ALTER TABLE `courses_coursecategory` DISABLE KEYS */;
INSERT INTO `courses_coursecategory` VALUES
(1,'Python'),
(2,'Базы Данных'),
(3,'JavaScript'),
(4,'Rust'),
(5,'Pentest'),
(6,'Pascal'),
(7,'MariaDB'),
(8,'Kali linux'),
(9,'C++'),
(10,'C#'),
(11,'CSS'),
(12,'HTML');
/*!40000 ALTER TABLE `courses_coursecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_role`
--

DROP TABLE IF EXISTS `courses_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_role`
--

LOCK TABLES `courses_role` WRITE;
/*!40000 ALTER TABLE `courses_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2024-02-06 06:14:16.316105','1','Дмитрий Шутрин',2,'[{\"changed\": {\"fields\": [\"\\u0418\\u043c\\u044f\", \"\\u0424\\u0430\\u043c\\u0438\\u043b\\u0438\\u044f\"]}}]',7,1),
(2,'2024-02-06 06:14:36.502995','1','Дмитрий Шутрин',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u043e\\u0442\\u043e\"]}}]',7,1),
(3,'2024-02-06 08:58:26.638031','1','CourseCategory object (1)',1,'[{\"added\": {}}]',9,1),
(4,'2024-02-06 08:58:34.656826','2','CourseCategory object (2)',1,'[{\"added\": {}}]',9,1),
(5,'2024-02-06 09:00:34.957955','1','Course object (1)',1,'[{\"added\": {}}]',8,1),
(6,'2024-02-06 09:08:27.259639','1','Python Django для начинающих',2,'[{\"changed\": {\"fields\": [\"\\u041f\\u0440\\u0435\\u0432\\u044c\\u044e\"]}}]',8,1),
(7,'2024-02-06 09:09:15.210185','1','Python Django для начинающих',2,'[{\"changed\": {\"fields\": [\"\\u041f\\u0440\\u0435\\u0432\\u044c\\u044e\"]}}]',8,1),
(8,'2024-02-06 09:09:33.796705','1','Python Django для начинающих',2,'[{\"changed\": {\"fields\": [\"\\u041f\\u0440\\u0435\\u0432\\u044c\\u044e\"]}}]',8,1),
(9,'2024-02-06 09:10:08.962540','1','Python Django для начинающих',2,'[{\"changed\": {\"fields\": [\"\\u041f\\u0440\\u0435\\u0432\\u044c\\u044e\"]}}]',8,1),
(10,'2024-02-06 09:14:13.105097','1','Python Django для начинающих',2,'[{\"changed\": {\"fields\": [\"\\u041f\\u0440\\u0435\\u0432\\u044c\\u044e\"]}}]',8,1),
(11,'2024-02-06 09:40:24.483748','2','MySQL для начинающих',1,'[{\"added\": {}}]',8,1),
(12,'2024-02-08 07:18:58.448946','3','JavaScript',1,'[{\"added\": {}}]',9,1),
(13,'2024-02-08 07:19:05.885151','3','JavaScript с нуля',1,'[{\"added\": {}}]',8,1),
(14,'2024-02-08 07:19:39.392790','4','Rust',1,'[{\"added\": {}}]',9,1),
(15,'2024-02-08 07:19:44.894910','4','RUST с нуля',1,'[{\"added\": {}}]',8,1),
(16,'2024-02-08 08:20:32.711189','5','Pentest',1,'[{\"added\": {}}]',9,1),
(17,'2024-02-08 08:56:25.092258','6','Pascal',1,'[{\"added\": {}}]',9,1),
(18,'2024-02-08 08:56:42.603555','7','MariaDB',1,'[{\"added\": {}}]',9,1),
(19,'2024-02-08 08:56:46.996602','8','Kali linux',1,'[{\"added\": {}}]',9,1),
(20,'2024-02-08 08:56:53.444050','9','C++',1,'[{\"added\": {}}]',9,1),
(21,'2024-02-08 08:56:56.841291','10','C#',1,'[{\"added\": {}}]',9,1),
(22,'2024-02-08 08:57:00.748037','11','CSS',1,'[{\"added\": {}}]',9,1),
(23,'2024-02-08 08:57:03.617609','12','HTML',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'contenttypes','contenttype'),
(8,'courses','course'),
(9,'courses','coursecategory'),
(7,'courses','customuser'),
(6,'courses','role'),
(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'courses','0001_initial','2024-02-06 06:01:39.157856'),
(2,'contenttypes','0001_initial','2024-02-06 06:01:39.177863'),
(3,'admin','0001_initial','2024-02-06 06:01:39.221592'),
(4,'admin','0002_logentry_remove_auto_add','2024-02-06 06:01:39.224855'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-02-06 06:01:39.227877'),
(6,'contenttypes','0002_remove_content_type_name','2024-02-06 06:01:39.260282'),
(7,'auth','0001_initial','2024-02-06 06:01:39.366942'),
(8,'auth','0002_alter_permission_name_max_length','2024-02-06 06:01:39.406098'),
(9,'auth','0003_alter_user_email_max_length','2024-02-06 06:01:39.409831'),
(10,'auth','0004_alter_user_username_opts','2024-02-06 06:01:39.413309'),
(11,'auth','0005_alter_user_last_login_null','2024-02-06 06:01:39.417999'),
(12,'auth','0006_require_contenttypes_0002','2024-02-06 06:01:39.419487'),
(13,'auth','0007_alter_validators_add_error_messages','2024-02-06 06:01:39.423035'),
(14,'auth','0008_alter_user_username_max_length','2024-02-06 06:01:39.426841'),
(15,'auth','0009_alter_user_last_name_max_length','2024-02-06 06:01:39.430476'),
(16,'auth','0010_alter_group_name_max_length','2024-02-06 06:01:39.444096'),
(17,'auth','0011_update_proxy_permissions','2024-02-06 06:01:39.449504'),
(18,'auth','0012_alter_user_first_name_max_length','2024-02-06 06:01:39.453739'),
(19,'sessions','0001_initial','2024-02-06 06:01:39.472703'),
(20,'courses','0002_alter_customuser_role','2024-02-06 06:14:09.199203'),
(21,'courses','0003_coursecategory_course','2024-02-06 08:57:19.433370'),
(22,'courses','0004_alter_course_description','2024-02-06 08:59:08.687309'),
(23,'courses','0005_course_photo_alter_course_category','2024-02-06 09:08:15.407476');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('44nfzllbo0tar7aigoa5qpvmuhytyjhr','.eJxVTEsOwiAQvQtrQ8rwEVy69wxkYCZSNZCUdmW8uzTpQt_m5X3fIuK2lrh1XuJM4iKUOP16CfOT6x7QA-u9ydzqusxJ7hV5pF3eGvHrenT_Dgr2MtbMakIDQEw-4cCkMeREjtCxpkzBKWAK4K3OFoLxg_zQhs7G2SQ-XxhJOI0:1rY9so:Uiy0qCV8EYcjEJ3rw9Il9luchsPPdS4LSkHGd9FVNDk','2024-02-22 19:16:26.592898'),
('ozsrszaz1tplmw6zywho73x8pat3mxz8','.eJxVTEsOwiAQvQtrQ8rwEVy69wxkYCZSNZCUdmW8uzTpQt_m5X3fIuK2lrh1XuJM4iKUOP16CfOT6x7QA-u9ydzqusxJ7hV5pF3eGvHrenT_Dgr2MtbMakIDQEw-4cCkMeREjtCxpkzBKWAK4K3OFoLxg_zQhs7G2SQ-XxhJOI0:1rXyTd:IjVrzidq0Ry-gOrmXuWpKnjkhrIn9J4L9n6fXbuoWH8','2024-02-22 07:05:41.758579'),
('ufdbt5uo9y7ocnbc10ybes5ew7fu1z3w','.eJxVTEsOwiAQvQtrQ8rwEVy69wxkYCZSNZCUdmW8uzTpQt_m5X3fIuK2lrh1XuJM4iKUOP16CfOT6x7QA-u9ydzqusxJ7hV5pF3eGvHrenT_Dgr2MtbMakIDQEw-4cCkMeREjtCxpkzBKWAK4K3OFoLxg_zQhs7G2SQ-XxhJOI0:1rXGLL:Ft5Roj6CjSkxMT2BzZa3D96gosiDfZ9zVztaUreK9Gs','2024-02-20 07:58:11.234972');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-09 19:45:51
