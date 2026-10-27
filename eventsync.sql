-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: localhost    Database: eventsync
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#7C3AED',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Technology','technology','Conferences, summits and workshops about technology','#5B7C99','2026-10-15 11:27:08','2026-10-15 11:27:08'),(2,'Education','education','Seminars, bootcamps and learning events','#3F8F8A','2026-10-15 11:27:08','2026-10-15 11:27:08'),(3,'Campus','campus','Student and campus activities','#B7893A','2026-10-15 11:27:08','2026-10-15 11:27:08'),(4,'Business','business','Startup, marketing and entrepreneurship events','#7C7C5A','2026-10-15 11:27:08','2026-10-15 11:27:08'),(5,'Community','community','Social and community-based events','#9A5F7E','2026-10-15 11:27:08','2026-10-15 11:27:08'),(6,'Competition','competition','Hackathons and contests','#2F7D57','2026-10-15 11:27:08','2026-10-15 11:27:08'),(7,'Arts & Culture','arts-culture','Exhibitions, performances and cultural events','#B91C1C','2026-10-15 11:27:08','2026-10-15 11:27:08');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_committees`
--

DROP TABLE IF EXISTS `event_committees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_committees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_committees_event_id_index` (`event_id`),
  CONSTRAINT `event_committees_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_committees`
--

LOCK TABLES `event_committees` WRITE;
/*!40000 ALTER TABLE `event_committees` DISABLE KEYS */;
INSERT INTO `event_committees` VALUES (1,1,'EventSync Core Team','Coordinator','EventSync Community','community@example.test','2026-10-15 11:27:11','2026-10-15 11:27:11'),(2,1,'Documentation Team','Documentation','EventSync Community','community@example.test','2026-10-15 11:27:11','2026-10-15 11:27:11'),(3,1,'Registration Desk','Registration','EventSync Community','community@example.test','2026-10-15 11:27:11','2026-10-15 11:27:11'),(4,2,'Workshop Team','Coordinator','EventSync Community','community@example.test','2026-10-15 11:27:11','2026-10-15 11:27:11'),(5,3,'Hackathon Core Team','Coordinator','EventSync Community','community@example.test','2026-10-15 11:27:11','2026-10-15 11:27:11'),(6,4,'Tech Day Committee','Coordinator','EventSync Community','community@example.test','2026-10-15 11:27:11','2026-10-15 11:27:11'),(7,5,'Panitia BEM','Coordinator','BEM Kampus','bem@example.test','2026-10-15 11:27:11','2026-10-15 11:27:11'),(8,6,'Summit Committee','Coordinator','EventSync Community','community@example.test','2026-10-15 11:27:11','2026-10-15 11:27:11'),(9,7,'Social Action Committee','Coordinator','BEM Kampus','bem@example.test','2026-10-15 11:27:11','2026-10-15 11:27:11'),(10,8,'Startup Night Committee','Coordinator','BEM Kampus','bem@example.test','2026-10-15 11:27:11','2026-10-15 11:27:11');
/*!40000 ALTER TABLE `event_committees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_registrations`
--

DROP TABLE IF EXISTS `event_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_registrations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `status` enum('registered','cancelled','attended') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'registered',
  `registered_at` datetime NOT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_registrations_event_id_user_id_unique` (`event_id`,`user_id`),
  KEY `event_registrations_user_id_status_index` (`user_id`,`status`),
  KEY `event_registrations_event_id_status_index` (`event_id`,`status`),
  CONSTRAINT `event_registrations_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_registrations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_registrations`
--

LOCK TABLES `event_registrations` WRITE;
/*!40000 ALTER TABLE `event_registrations` DISABLE KEYS */;
INSERT INTO `event_registrations` VALUES (1,1,4,'registered','2026-10-05 10:00:00',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(2,3,4,'registered','2026-10-07 10:00:00',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(3,4,4,'attended','2026-08-16 10:00:00',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(4,5,4,'registered','2026-10-10 10:00:00',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(5,1,5,'registered','2026-10-06 10:00:00',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(6,2,5,'registered','2026-10-08 10:00:00',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(7,7,5,'registered','2026-10-11 10:00:00',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(8,1,6,'cancelled','2026-10-06 10:00:00','2026-10-07 10:00:00','2026-10-15 11:27:11','2026-10-15 11:27:11'),(9,3,6,'registered','2026-10-09 10:00:00',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(10,5,6,'registered','2026-10-11 10:00:00',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(11,4,6,'attended','2026-08-15 10:00:00',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(12,1,7,'registered','2026-10-07 10:00:00',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(13,6,7,'registered','2026-10-12 10:00:00',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(14,7,7,'registered','2026-10-12 10:00:00',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(15,2,8,'registered','2026-10-09 10:00:00',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(16,5,8,'registered','2026-10-12 10:00:00',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(17,7,4,'registered','2026-10-15 19:38:23',NULL,'2026-10-15 12:38:23','2026-10-15 12:38:23'),(18,2,4,'registered','2026-10-15 19:43:53',NULL,'2026-10-15 12:43:53','2026-10-15 12:43:53');
/*!40000 ALTER TABLE `event_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `organizer_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `capacity` int unsigned DEFAULT NULL,
  `poster_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('draft','pending_review','approved','rejected','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `submitted_at` datetime DEFAULT NULL,
  `reviewed_by` bigint unsigned DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `review_note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `events_slug_unique` (`slug`),
  KEY `events_status_start_at_index` (`status`,`start_at`),
  KEY `events_start_at_index` (`start_at`),
  KEY `events_organizer_id_status_index` (`organizer_id`,`status`),
  KEY `events_category_id_foreign` (`category_id`),
  KEY `events_reviewed_by_foreign` (`reviewed_by`),
  CONSTRAINT `events_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `events_organizer_id_foreign` FOREIGN KEY (`organizer_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `events_reviewed_by_foreign` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,2,1,'Tech Innovation Summit 2026','tech-innovation-summit-2026','A one-day summit that brings together developers, researchers and students to discuss applied AI, cloud and modern web development. Includes a keynote, a panel, a hands-on Laravel workshop and a startup showcase.','Grand Hall, Jakarta (sample data)','2026-11-29 08:30:00','2026-11-29 17:00:00',500,'assets/images/poster-tech-innovation-summit-2026.svg',1,'approved','2026-09-25 10:00:00',1,'2026-09-26 09:00:00',NULL,NULL,'2026-09-20 03:00:00','2026-10-15 11:27:11'),(2,2,4,'UMKM Digital Marketing Workshop','umkm-digital-marketing-workshop','A practical workshop for small business owners: learn the basics of digital marketing, plan social media content and take better product photos with just a smartphone.','Co-working Space, Banda Aceh (sample data)','2026-11-04 09:00:00','2026-11-04 15:00:00',60,'assets/images/poster-umkm-digital-marketing-workshop.svg',1,'approved','2026-09-30 10:00:00',1,'2026-10-01 09:00:00',NULL,NULL,'2026-09-27 03:00:00','2026-10-15 11:27:11'),(3,2,6,'Indonesia Hackathon 2026','indonesia-hackathon-2026','A two-day programming competition. Teams build a working prototype, get feedback from mentors and pitch to a panel of judges on the final day.','Innovation Lab, Bandung (sample data)','2026-11-22 09:00:00','2026-11-23 17:00:00',200,'assets/images/poster-indonesia-hackathon-2026.svg',1,'approved','2026-09-23 10:00:00',1,'2026-09-24 09:00:00',NULL,NULL,'2026-09-19 03:00:00','2026-10-15 11:27:11'),(4,2,1,'Tech Innovation Day 2026','tech-innovation-day-2026','A community technology day with a keynote on technology for campuses, a web basics workshop and a product demo showcase.','Convention Hall, Banda Aceh (sample data)','2026-08-30 09:00:00','2026-08-30 17:00:00',300,'assets/images/poster-tech-innovation-day-2026.svg',0,'approved','2026-07-27 10:00:00',1,'2026-07-28 09:00:00',NULL,NULL,'2026-07-22 03:00:00','2026-10-15 11:27:11'),(5,3,3,'Campus Creative Festival','campus-creative-festival','A multi-day festival of student creativity: art exhibition, poster design contest, creative bazaar and acoustic music in the evening.','Plaza Kampus (sample data)','2026-10-13 10:00:00','2026-10-17 21:00:00',1000,'assets/images/poster-campus-creative-festival.svg',1,'approved','2026-09-15 10:00:00',1,'2026-09-16 09:00:00',NULL,NULL,'2026-09-10 03:00:00','2026-10-15 11:27:11'),(6,2,2,'Aceh Youth Digital Summit','aceh-youth-digital-summit','A summit for young people about digital literacy and careers in technology, with a talk and a career panel.','Aula Utama, Banda Aceh (sample data)','2026-12-13 09:00:00','2026-12-13 16:00:00',400,'assets/images/poster-aceh-youth-digital-summit.svg',0,'approved','2026-10-03 10:00:00',1,'2026-10-04 09:00:00',NULL,NULL,'2026-10-01 03:00:00','2026-10-15 11:27:11'),(7,3,5,'Charity & Community Day','charity-community-day','A morning of community service: fun walk, book donation drive and a shared lunch for volunteers and neighbours.','Lapangan Komunitas, Banda Aceh (sample data)','2026-11-30 08:00:00','2026-11-30 13:00:00',500,'assets/images/poster-charity-community-day.svg',0,'approved','2026-10-05 10:00:00',1,'2026-10-06 09:00:00',NULL,NULL,'2026-10-03 03:00:00','2026-10-15 11:27:11'),(8,3,4,'Startup Networking Night','startup-networking-night','An evening for founders, students and investors to meet, hear a short founders panel and network openly.','Co-working Space, Medan (sample data)','2027-01-24 19:00:00','2027-01-24 22:00:00',120,'assets/images/poster-startup-networking-night.svg',0,'approved','2026-10-12 10:00:00',1,'2026-10-25 09:54:22',NULL,NULL,'2026-10-09 03:00:00','2026-10-25 02:54:22'),(9,2,2,'UI/UX Design Workshop','ui-ux-design-workshop','Hands-on workshop from wireframe to clickable prototype. Still being prepared by the organizer.','Design Studio, Yogyakarta (sample data)','2026-12-06 13:00:00','2026-12-06 17:00:00',40,'storage/posters/f86e68d0-b3d0-411d-ac13-7ddb0a0c35f8.jpg',0,'draft',NULL,NULL,NULL,NULL,NULL,'2026-10-13 03:00:00','2026-10-25 02:52:19'),(10,3,3,'Campus Innovation Expo','campus-innovation-expo','An expo where student teams present research and product ideas to visitors and industry mentors.','Gedung Serbaguna Kampus (sample data)','2026-12-20 09:00:00','2026-12-20 16:00:00',800,'assets/images/poster-campus-innovation-expo.svg',0,'approved','2026-10-14 14:00:00',1,'2026-10-25 09:55:00',NULL,NULL,'2026-10-11 03:00:00','2026-10-25 02:55:00'),(11,2,4,'Digital Marketing Seminar','digital-marketing-seminar','A seminar on current digital marketing trends for students and young professionals.','Auditorium, Surabaya (sample data)','2026-12-27 09:30:00','2026-12-27 12:30:00',150,'storage/posters/53dccbe2-f223-4bec-b536-168be468d7ab.jpg',0,'draft','2026-10-07 10:00:00',1,'2026-10-08 11:00:00','Please add a complete schedule and at least one speaker, then submit again.',NULL,'2026-10-06 03:00:00','2026-10-25 02:51:52'),(12,2,1,'Workshop Web Development untuk Mahasiswa','workshop-web-development-untuk-mahasiswa','Kegiatan belajar bersama untuk mengenal dasar pengembangan website, HTML, CSS, dan pengenalan Laravel bagi mahasiswa.','Aula Kampus, Sigli','2026-10-23 19:00:00','2026-10-24 20:00:00',50,'storage/posters/f8cb2138-3175-4827-8d9a-f2e25d1ce961.jpg',0,'approved','2026-10-15 20:00:58',1,'2026-10-15 20:07:39',NULL,NULL,'2026-10-15 13:00:58','2026-10-15 13:07:39');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2026_01_01_000001_create_users_table',1),(2,'2026_01_01_000002_create_categories_table',1),(3,'2026_01_01_000003_create_events_table',1),(4,'2026_01_01_000004_create_speakers_table',1),(5,'2026_01_01_000005_create_schedules_table',1),(6,'2026_01_01_000006_create_event_committees_table',1),(7,'2026_01_01_000007_create_event_registrations_table',1),(8,'2026_01_01_000008_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (3,'App\\Models\\User',1,'eventsync-web','a23a8b4fe8693f42731d410e2a62c192e72198079c45c6e1a8e2aa7d31f84ded','[\"*\"]','2026-10-15 13:14:51',NULL,'2026-10-15 13:07:06','2026-10-15 13:14:51'),(5,'App\\Models\\User',2,'eventsync-web','e63222aa13601af9b7546bac8b5c620faba9582c412e22fb753676e3f6b9b5f9','[\"*\"]','2026-10-19 05:13:52',NULL,'2026-10-19 05:13:39','2026-10-19 05:13:52'),(12,'App\\Models\\User',2,'eventsync-web','0e0962778c9157333810e9e1e039904af79245f2e06ee16db3759c1cde17ba81','[\"*\"]','2026-10-26 05:32:34',NULL,'2026-10-26 05:32:17','2026-10-26 05:32:34');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint unsigned NOT NULL,
  `speaker_id` bigint unsigned DEFAULT NULL,
  `session_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `location` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person_in_charge` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `sort_order` smallint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedules_event_id_start_at_index` (`event_id`,`start_at`),
  KEY `schedules_speaker_id_foreign` (`speaker_id`),
  CONSTRAINT `schedules_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `schedules_speaker_id_foreign` FOREIGN KEY (`speaker_id`) REFERENCES `speakers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,1,NULL,'Morning','Registration & Welcome Coffee',NULL,'Lobby, Grand Hall','Committee','2026-11-29 08:30:00','2026-11-29 09:30:00',0,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(2,1,1,'Morning','Keynote: Applied AI for Everyday Products',NULL,'Main Hall',NULL,'2026-11-29 09:30:00','2026-11-29 10:30:00',1,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(3,1,NULL,'Morning','Panel: Building Tech Products in Indonesia',NULL,'Main Hall','Panel moderators','2026-11-29 10:45:00','2026-11-29 12:00:00',2,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(4,1,2,'Afternoon','Workshop: Building a REST API with Laravel',NULL,'Workshop Room 1',NULL,'2026-11-29 13:00:00','2026-11-29 15:00:00',3,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(5,1,NULL,'Afternoon','Startup Demo & Showcase',NULL,'Exhibition Area','Participants','2026-11-29 15:15:00','2026-11-29 16:30:00',4,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(6,1,NULL,'Afternoon','Closing',NULL,'Main Hall','Committee','2026-11-29 16:30:00','2026-11-29 17:00:00',5,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(7,2,NULL,'Morning','Registration',NULL,'Workshop Room','Committee','2026-11-04 09:00:00','2026-11-04 09:30:00',6,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(8,2,3,'Morning','Fundamentals of Digital Marketing for Small Business',NULL,'Workshop Room',NULL,'2026-11-04 09:30:00','2026-11-04 11:00:00',7,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(9,2,3,'Morning','Social Media Content Planning (hands-on)',NULL,'Workshop Room',NULL,'2026-11-04 11:00:00','2026-11-04 12:00:00',8,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(10,2,4,'Afternoon','Product Photography with a Smartphone',NULL,'Workshop Room',NULL,'2026-11-04 13:00:00','2026-11-04 14:30:00',9,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(11,2,NULL,'Afternoon','Q&A and Closing',NULL,'Workshop Room','Committee','2026-11-04 14:30:00','2026-11-04 15:00:00',10,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(12,3,NULL,'Day 1','Opening & Rules',NULL,'Innovation Lab','Committee','2026-11-22 09:00:00','2026-11-22 10:00:00',11,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(13,3,NULL,'Day 1','Hacking Time',NULL,'Innovation Lab','Teams','2026-11-22 10:00:00','2026-11-22 17:00:00',12,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(14,3,5,'Day 2','Final Hacking & Mentoring',NULL,'Innovation Lab',NULL,'2026-11-23 09:00:00','2026-11-23 12:00:00',13,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(15,3,6,'Day 2','Final Pitch to Judges',NULL,'Main Stage',NULL,'2026-11-23 13:00:00','2026-11-23 15:30:00',14,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(16,3,NULL,'Day 2','Announcement & Closing',NULL,'Main Stage','Committee','2026-11-23 15:30:00','2026-11-23 17:00:00',15,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(17,4,NULL,'Rundown','Registration',NULL,'Convention Hall','Committee','2026-08-30 09:00:00','2026-08-30 09:30:00',16,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(18,4,8,'Rundown','Keynote: Technology for Campuses',NULL,'Convention Hall',NULL,'2026-08-30 09:30:00','2026-08-30 10:30:00',17,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(19,4,9,'Rundown','Web Basics Workshop',NULL,'Convention Hall',NULL,'2026-08-30 10:45:00','2026-08-30 12:00:00',18,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(20,4,NULL,'Rundown','Product Demo & Showcase',NULL,'Convention Hall','Participants','2026-08-30 13:00:00','2026-08-30 16:00:00',19,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(21,4,NULL,'Rundown','Closing',NULL,'Convention Hall','Committee','2026-08-30 16:00:00','2026-08-30 17:00:00',20,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(22,5,10,'Daily program','Art Exhibition',NULL,'Plaza Kampus',NULL,'2026-10-13 10:00:00','2026-10-13 12:00:00',21,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(23,5,NULL,'Daily program','Poster Design Contest',NULL,'Plaza Kampus','Judges','2026-10-13 13:00:00','2026-10-13 15:00:00',22,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(24,5,NULL,'Daily program','Creative Bazaar',NULL,'Plaza Kampus','Community','2026-10-13 16:00:00','2026-10-13 18:00:00',23,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(25,5,NULL,'Daily program','Acoustic Music Night',NULL,'Plaza Kampus','Campus bands','2026-10-13 19:00:00','2026-10-13 21:00:00',24,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(26,6,NULL,'Rundown','Opening',NULL,'Aula Utama','Committee','2026-12-13 09:00:00','2026-12-13 09:30:00',25,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(27,6,11,'Rundown','Talk: Digital Literacy',NULL,'Aula Utama',NULL,'2026-12-13 09:30:00','2026-12-13 11:00:00',26,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(28,6,NULL,'Rundown','Career Panel in Tech',NULL,'Aula Utama','Panelists','2026-12-13 13:00:00','2026-12-13 15:00:00',27,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(29,6,NULL,'Rundown','Closing',NULL,'Aula Utama','Committee','2026-12-13 15:00:00','2026-12-13 16:00:00',28,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(30,7,NULL,'Rundown','Fun Walk',NULL,'Lapangan Komunitas','Participants','2026-11-30 08:00:00','2026-11-30 09:00:00',29,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(31,7,12,'Rundown','Community Service & Book Donation',NULL,'Lapangan Komunitas',NULL,'2026-11-30 09:00:00','2026-11-30 11:00:00',30,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(32,7,NULL,'Rundown','Shared Lunch',NULL,'Lapangan Komunitas','Committee','2026-11-30 11:00:00','2026-11-30 13:00:00',31,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(33,8,NULL,'Rundown','Registration & Networking',NULL,'Co-working Space','Committee','2027-01-24 19:00:00','2027-01-24 19:30:00',32,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(34,8,13,'Rundown','Founders Panel',NULL,'Co-working Space',NULL,'2027-01-24 19:30:00','2027-01-24 20:30:00',33,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(35,8,NULL,'Rundown','Open Networking',NULL,'Co-working Space','Participants','2027-01-24 20:30:00','2027-01-24 22:00:00',34,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(36,10,NULL,'Rundown','Opening & Booth Walk',NULL,'Gedung Serbaguna','Committee','2026-12-20 09:00:00','2026-12-20 11:00:00',35,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(37,10,15,'Rundown','Panel: Turning Research into Products',NULL,'Gedung Serbaguna',NULL,'2026-12-20 11:00:00','2026-12-20 12:30:00',36,'2026-10-15 11:27:11','2026-10-15 11:27:11');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speakers`
--

DROP TABLE IF EXISTS `speakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `speakers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Speaker',
  `topic` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `speakers_event_id_index` (`event_id`),
  CONSTRAINT `speakers_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speakers`
--

LOCK TABLES `speakers` WRITE;
/*!40000 ALTER TABLE `speakers` DISABLE KEYS */;
INSERT INTO `speakers` VALUES (1,1,'Dr. Rina Kusuma','AI Researcher','Speaker','Applied AI for Everyday Products','Researcher working on practical machine learning for consumer products.',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(2,1,'Dimas Pratama','Backend Engineer','Speaker','Building a REST API with Laravel','Backend engineer who teaches web development to student communities.',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(3,2,'Sinta Maharani','Digital Marketing Consultant','Speaker','Digital Marketing Basics for Small Business','Helps small businesses grow with simple, low-budget online marketing.',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(4,2,'Fajar Ramadhan','Content Creator','Mentor','Product Photography with a Smartphone','Content creator focusing on product and food photography.',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(5,3,'Arif Hidayat','Cloud Engineer','Mentor','Shipping a Prototype in 24 Hours','Cloud engineer and long-time hackathon mentor.',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(6,3,'Prof. Ahmad Fauzi','Lecturer','Judge','Evaluating Technical Projects','Lecturer in software engineering.',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(7,3,'Laila Nurhayati','Product Manager','Judge','What Makes a Product Stand Out','Product manager at a technology startup.',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(8,4,'Dr. Nadia Rahman','Keynote Speaker','Speaker','Technology for Campuses','Academic and speaker on digital transformation in education.',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(9,4,'Raka Pratama','Workshop Mentor','Mentor','Web Basics','Front-end developer and workshop mentor.',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(10,5,'Maya Anggraini','Exhibition Curator','Curator','Curating Student Art','Independent curator working with student art collectives.',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(11,6,'Hendra Saputra','Digital Literacy Speaker','Speaker','Digital Literacy for Young People','Trainer in digital literacy programs for schools.',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(12,7,'Rizki Maulana','Volunteer Coordinator','Coordinator','Organising Community Service','Coordinates volunteer programs for local communities.',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(13,8,'Vina Oktaviani','Angel Investor','Panelist','What Investors Look For','Early-stage investor and startup advisor.',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(14,9,'Kevin Halim','Senior UI/UX Designer','Speaker','From Wireframe to Prototype','Product designer with a focus on mobile apps.',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11'),(15,10,'Melati Sari','Startup Mentor','Panelist','Turning Research into Products','Mentor for student startups and innovation programs.',NULL,'2026-10-15 11:27:11','2026-10-15 11:27:11');
/*!40000 ALTER TABLE `speakers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('user','organizer','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_index` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin EventSync','admin@example.test','$2y$12$UWFNnz.Rn2muD8fk8pZJDuQ3d9/YQzaeEXTa0H7y/LKWJX/tfrP6.','admin',NULL,NULL,1,'2026-06-17 02:00:00','2026-10-15 11:27:09'),(2,'EventSync Community','community@example.test','$2y$12$Ei7IaO4V4wmXWndzoZDo/uk42N/RtS8MAmITAQSYnscKZoeoXCeey','organizer','0812-0000-0001','EventSync Community',1,'2026-06-27 02:00:00','2026-10-15 11:27:09'),(3,'BEM Kampus','bem@example.test','$2y$12$O5MusSnC62ojCuRD7mz0ZumMSqgRONjyikyIEajAHD/1.kiolfuE6','organizer','0812-0000-0002','BEM Kampus',1,'2026-07-07 02:00:00','2026-10-15 11:27:09'),(4,'Budi Santoso','budi@example.test','$2y$12$9w4fSRlHpf.Q9MHdR.ovcOU.BuC3f5j0Cpf5Kx6Gn9dVMROeN6fbO','user','0812-1111-0001',NULL,1,'2026-08-16 03:00:00','2026-10-15 11:27:10'),(5,'Sari Dewi','sari@example.test','$2y$12$CWvOnP7Z8jaahZ/5eM/i.edi5bl8WtDU8pWen45L0cLSy5miYZXsy','user','0812-1111-0002',NULL,1,'2026-08-18 03:00:00','2026-10-15 11:27:10'),(6,'Andi Wijaya','andi@example.test','$2y$12$dzCw.wmrPd8IBB2yJ4fdpOlieU/l3sD2XTDq725LmPZgR6G/fqTei','user',NULL,NULL,1,'2026-08-21 03:00:00','2026-10-15 11:27:10'),(7,'Citra Lestari','citra@example.test','$2y$12$X7U3npdx0rp/hS.UPNdsV.s2gxtoZxL0oIcFttkm1v5YU9g5YNIz2','user',NULL,NULL,1,'2026-09-05 03:00:00','2026-10-15 11:27:11'),(8,'Dewi Anggraini','dewi@example.test','$2y$12$0XbtAzuYCHorS2H17RbzcuVgZLZOa956J8C4mlMWKYX6T6iEyybbq','user',NULL,NULL,1,'2026-09-15 03:00:00','2026-10-15 11:27:11'),(9,'Rudi Hartono','rudi@example.test','$2y$12$QHydkp3aq9R5.NwXp202/ef2N8PjzmQi0nLYopvRhVizIgWNd0Hoe','user',NULL,NULL,0,'2026-07-17 03:00:00','2026-10-15 11:27:11');
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

-- Dump completed on 2026-10-27 13:16:35
