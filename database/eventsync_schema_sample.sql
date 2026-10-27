-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 25, 2026 at 01:15 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventsync`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#7C3AED',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Technology', 'technology', 'Conferences, summits and workshops about technology', '#5B7C99', '2026-10-15 11:27:08', '2026-10-15 11:27:08'),
(2, 'Education', 'education', 'Seminars, bootcamps and learning events', '#3F8F8A', '2026-10-15 11:27:08', '2026-10-15 11:27:08'),
(3, 'Campus', 'campus', 'Student and campus activities', '#B7893A', '2026-10-15 11:27:08', '2026-10-15 11:27:08'),
(4, 'Business', 'business', 'Startup, marketing and entrepreneurship events', '#7C7C5A', '2026-10-15 11:27:08', '2026-10-15 11:27:08'),
(5, 'Community', 'community', 'Social and community-based events', '#9A5F7E', '2026-10-15 11:27:08', '2026-10-15 11:27:08'),
(6, 'Competition', 'competition', 'Hackathons and contests', '#2F7D57', '2026-10-15 11:27:08', '2026-10-15 11:27:08'),
(7, 'Arts & Culture', 'arts-culture', 'Exhibitions, performances and cultural events', '#B91C1C', '2026-10-15 11:27:08', '2026-10-15 11:27:08');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint UNSIGNED NOT NULL,
  `organizer_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `capacity` int UNSIGNED DEFAULT NULL,
  `poster_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('draft','pending_review','approved','rejected','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `submitted_at` datetime DEFAULT NULL,
  `reviewed_by` bigint UNSIGNED DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `review_note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `organizer_id`, `category_id`, `title`, `slug`, `description`, `location`, `start_at`, `end_at`, `capacity`, `poster_path`, `is_featured`, `status`, `submitted_at`, `reviewed_by`, `reviewed_at`, `review_note`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Tech Innovation Summit 2026', 'tech-innovation-summit-2026', 'A one-day summit that brings together developers, researchers and students to discuss applied AI, cloud and modern web development. Includes a keynote, a panel, a hands-on Laravel workshop and a startup showcase.', 'Grand Hall, Jakarta (sample data)', '2026-11-29 08:30:00', '2026-11-29 17:00:00', 500, 'assets/images/poster-tech-innovation-summit-2026.svg', 1, 'approved', '2026-09-25 10:00:00', 1, '2026-09-26 09:00:00', NULL, NULL, '2026-09-20 03:00:00', '2026-10-15 11:27:11'),
(2, 2, 4, 'UMKM Digital Marketing Workshop', 'umkm-digital-marketing-workshop', 'A practical workshop for small business owners: learn the basics of digital marketing, plan social media content and take better product photos with just a smartphone.', 'Co-working Space, Banda Aceh (sample data)', '2026-11-04 09:00:00', '2026-11-04 15:00:00', 60, 'assets/images/poster-umkm-digital-marketing-workshop.svg', 1, 'approved', '2026-09-30 10:00:00', 1, '2026-10-01 09:00:00', NULL, NULL, '2026-09-27 03:00:00', '2026-10-15 11:27:11'),
(3, 2, 6, 'Indonesia Hackathon 2026', 'indonesia-hackathon-2026', 'A two-day programming competition. Teams build a working prototype, get feedback from mentors and pitch to a panel of judges on the final day.', 'Innovation Lab, Bandung (sample data)', '2026-11-22 09:00:00', '2026-11-23 17:00:00', 200, 'assets/images/poster-indonesia-hackathon-2026.svg', 1, 'approved', '2026-09-23 10:00:00', 1, '2026-09-24 09:00:00', NULL, NULL, '2026-09-19 03:00:00', '2026-10-15 11:27:11'),
(4, 2, 1, 'Tech Innovation Day 2026', 'tech-innovation-day-2026', 'A community technology day with a keynote on technology for campuses, a web basics workshop and a product demo showcase.', 'Convention Hall, Banda Aceh (sample data)', '2026-08-30 09:00:00', '2026-08-30 17:00:00', 300, 'assets/images/poster-tech-innovation-day-2026.svg', 0, 'approved', '2026-07-27 10:00:00', 1, '2026-07-28 09:00:00', NULL, NULL, '2026-07-22 03:00:00', '2026-10-15 11:27:11'),
(5, 3, 3, 'Campus Creative Festival', 'campus-creative-festival', 'A multi-day festival of student creativity: art exhibition, poster design contest, creative bazaar and acoustic music in the evening.', 'Plaza Kampus (sample data)', '2026-10-13 10:00:00', '2026-10-17 21:00:00', 1000, 'assets/images/poster-campus-creative-festival.svg', 1, 'approved', '2026-09-15 10:00:00', 1, '2026-09-16 09:00:00', NULL, NULL, '2026-09-10 03:00:00', '2026-10-15 11:27:11'),
(6, 2, 2, 'Aceh Youth Digital Summit', 'aceh-youth-digital-summit', 'A summit for young people about digital literacy and careers in technology, with a talk and a career panel.', 'Aula Utama, Banda Aceh (sample data)', '2026-12-13 09:00:00', '2026-12-13 16:00:00', 400, 'assets/images/poster-aceh-youth-digital-summit.svg', 0, 'approved', '2026-10-03 10:00:00', 1, '2026-10-04 09:00:00', NULL, NULL, '2026-10-01 03:00:00', '2026-10-15 11:27:11'),
(7, 3, 5, 'Charity & Community Day', 'charity-community-day', 'A morning of community service: fun walk, book donation drive and a shared lunch for volunteers and neighbours.', 'Lapangan Komunitas, Banda Aceh (sample data)', '2026-11-30 08:00:00', '2026-11-30 13:00:00', 500, 'assets/images/poster-charity-community-day.svg', 0, 'approved', '2026-10-05 10:00:00', 1, '2026-10-06 09:00:00', NULL, NULL, '2026-10-03 03:00:00', '2026-10-15 11:27:11'),
(8, 3, 4, 'Startup Networking Night', 'startup-networking-night', 'An evening for founders, students and investors to meet, hear a short founders panel and network openly.', 'Co-working Space, Medan (sample data)', '2027-01-24 19:00:00', '2027-01-24 22:00:00', 120, 'assets/images/poster-startup-networking-night.svg', 0, 'approved', '2026-10-12 10:00:00', 1, '2026-10-25 09:54:22', NULL, NULL, '2026-10-09 03:00:00', '2026-10-25 02:54:22'),
(9, 2, 2, 'UI/UX Design Workshop', 'ui-ux-design-workshop', 'Hands-on workshop from wireframe to clickable prototype. Still being prepared by the organizer.', 'Design Studio, Yogyakarta (sample data)', '2026-12-06 13:00:00', '2026-12-06 17:00:00', 40, 'storage/posters/f86e68d0-b3d0-411d-ac13-7ddb0a0c35f8.jpg', 0, 'draft', NULL, NULL, NULL, NULL, NULL, '2026-10-13 03:00:00', '2026-10-25 02:52:19'),
(10, 3, 3, 'Campus Innovation Expo', 'campus-innovation-expo', 'An expo where student teams present research and product ideas to visitors and industry mentors.', 'Gedung Serbaguna Kampus (sample data)', '2026-12-20 09:00:00', '2026-12-20 16:00:00', 800, 'assets/images/poster-campus-innovation-expo.svg', 0, 'approved', '2026-10-14 14:00:00', 1, '2026-10-25 09:55:00', NULL, NULL, '2026-10-11 03:00:00', '2026-10-25 02:55:00'),
(11, 2, 4, 'Digital Marketing Seminar', 'digital-marketing-seminar', 'A seminar on current digital marketing trends for students and young professionals.', 'Auditorium, Surabaya (sample data)', '2026-12-27 09:30:00', '2026-12-27 12:30:00', 150, 'storage/posters/53dccbe2-f223-4bec-b536-168be468d7ab.jpg', 0, 'draft', '2026-10-07 10:00:00', 1, '2026-10-08 11:00:00', 'Please add a complete schedule and at least one speaker, then submit again.', NULL, '2026-10-06 03:00:00', '2026-10-25 02:51:52'),
(12, 2, 1, 'Workshop Web Development untuk Mahasiswa', 'workshop-web-development-untuk-mahasiswa', 'Kegiatan belajar bersama untuk mengenal dasar pengembangan website, HTML, CSS, dan pengenalan Laravel bagi mahasiswa.', 'Aula Kampus, Sigli', '2026-10-23 19:00:00', '2026-10-24 20:00:00', 50, 'storage/posters/f8cb2138-3175-4827-8d9a-f2e25d1ce961.jpg', 0, 'approved', '2026-10-15 20:00:58', 1, '2026-10-15 20:07:39', NULL, NULL, '2026-10-15 13:00:58', '2026-10-15 13:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `event_committees`
--

CREATE TABLE `event_committees` (
  `id` bigint UNSIGNED NOT NULL,
  `event_id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_committees`
--

INSERT INTO `event_committees` (`id`, `event_id`, `name`, `role`, `organization`, `contact`, `created_at`, `updated_at`) VALUES
(1, 1, 'EventSync Core Team', 'Coordinator', 'EventSync Community', 'community@example.test', '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(2, 1, 'Documentation Team', 'Documentation', 'EventSync Community', 'community@example.test', '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(3, 1, 'Registration Desk', 'Registration', 'EventSync Community', 'community@example.test', '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(4, 2, 'Workshop Team', 'Coordinator', 'EventSync Community', 'community@example.test', '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(5, 3, 'Hackathon Core Team', 'Coordinator', 'EventSync Community', 'community@example.test', '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(6, 4, 'Tech Day Committee', 'Coordinator', 'EventSync Community', 'community@example.test', '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(7, 5, 'Panitia BEM', 'Coordinator', 'BEM Kampus', 'bem@example.test', '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(8, 6, 'Summit Committee', 'Coordinator', 'EventSync Community', 'community@example.test', '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(9, 7, 'Social Action Committee', 'Coordinator', 'BEM Kampus', 'bem@example.test', '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(10, 8, 'Startup Night Committee', 'Coordinator', 'BEM Kampus', 'bem@example.test', '2026-10-15 11:27:11', '2026-10-15 11:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `event_registrations`
--

CREATE TABLE `event_registrations` (
  `id` bigint UNSIGNED NOT NULL,
  `event_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` enum('registered','cancelled','attended') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'registered',
  `registered_at` datetime NOT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_registrations`
--

INSERT INTO `event_registrations` (`id`, `event_id`, `user_id`, `status`, `registered_at`, `cancelled_at`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'registered', '2026-10-05 10:00:00', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(2, 3, 4, 'registered', '2026-10-07 10:00:00', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(3, 4, 4, 'attended', '2026-08-16 10:00:00', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(4, 5, 4, 'registered', '2026-10-10 10:00:00', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(5, 1, 5, 'registered', '2026-10-06 10:00:00', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(6, 2, 5, 'registered', '2026-10-08 10:00:00', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(7, 7, 5, 'registered', '2026-10-11 10:00:00', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(8, 1, 6, 'cancelled', '2026-10-06 10:00:00', '2026-10-07 10:00:00', '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(9, 3, 6, 'registered', '2026-10-09 10:00:00', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(10, 5, 6, 'registered', '2026-10-11 10:00:00', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(11, 4, 6, 'attended', '2026-08-15 10:00:00', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(12, 1, 7, 'registered', '2026-10-07 10:00:00', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(13, 6, 7, 'registered', '2026-10-12 10:00:00', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(14, 7, 7, 'registered', '2026-10-12 10:00:00', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(15, 2, 8, 'registered', '2026-10-09 10:00:00', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(16, 5, 8, 'registered', '2026-10-12 10:00:00', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(17, 7, 4, 'registered', '2026-10-15 19:38:23', NULL, '2026-10-15 12:38:23', '2026-10-15 12:38:23'),
(18, 2, 4, 'registered', '2026-10-15 19:43:53', NULL, '2026-10-15 12:43:53', '2026-10-15 12:43:53');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2026_01_01_000001_create_users_table', 1),
(2, '2026_01_01_000002_create_categories_table', 1),
(3, '2026_01_01_000003_create_events_table', 1),
(4, '2026_01_01_000004_create_speakers_table', 1),
(5, '2026_01_01_000005_create_schedules_table', 1),
(6, '2026_01_01_000006_create_event_committees_table', 1),
(7, '2026_01_01_000007_create_event_registrations_table', 1),
(8, '2026_01_01_000008_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

-- Data token akses dihapus dari dump publik demi keamanan.

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `event_id` bigint UNSIGNED NOT NULL,
  `speaker_id` bigint UNSIGNED DEFAULT NULL,
  `session_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `location` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person_in_charge` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `sort_order` smallint UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `event_id`, `speaker_id`, `session_name`, `title`, `description`, `location`, `person_in_charge`, `start_at`, `end_at`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Morning', 'Registration & Welcome Coffee', NULL, 'Lobby, Grand Hall', 'Committee', '2026-11-29 08:30:00', '2026-11-29 09:30:00', 0, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(2, 1, 1, 'Morning', 'Keynote: Applied AI for Everyday Products', NULL, 'Main Hall', NULL, '2026-11-29 09:30:00', '2026-11-29 10:30:00', 1, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(3, 1, NULL, 'Morning', 'Panel: Building Tech Products in Indonesia', NULL, 'Main Hall', 'Panel moderators', '2026-11-29 10:45:00', '2026-11-29 12:00:00', 2, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(4, 1, 2, 'Afternoon', 'Workshop: Building a REST API with Laravel', NULL, 'Workshop Room 1', NULL, '2026-11-29 13:00:00', '2026-11-29 15:00:00', 3, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(5, 1, NULL, 'Afternoon', 'Startup Demo & Showcase', NULL, 'Exhibition Area', 'Participants', '2026-11-29 15:15:00', '2026-11-29 16:30:00', 4, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(6, 1, NULL, 'Afternoon', 'Closing', NULL, 'Main Hall', 'Committee', '2026-11-29 16:30:00', '2026-11-29 17:00:00', 5, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(7, 2, NULL, 'Morning', 'Registration', NULL, 'Workshop Room', 'Committee', '2026-11-04 09:00:00', '2026-11-04 09:30:00', 6, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(8, 2, 3, 'Morning', 'Fundamentals of Digital Marketing for Small Business', NULL, 'Workshop Room', NULL, '2026-11-04 09:30:00', '2026-11-04 11:00:00', 7, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(9, 2, 3, 'Morning', 'Social Media Content Planning (hands-on)', NULL, 'Workshop Room', NULL, '2026-11-04 11:00:00', '2026-11-04 12:00:00', 8, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(10, 2, 4, 'Afternoon', 'Product Photography with a Smartphone', NULL, 'Workshop Room', NULL, '2026-11-04 13:00:00', '2026-11-04 14:30:00', 9, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(11, 2, NULL, 'Afternoon', 'Q&A and Closing', NULL, 'Workshop Room', 'Committee', '2026-11-04 14:30:00', '2026-11-04 15:00:00', 10, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(12, 3, NULL, 'Day 1', 'Opening & Rules', NULL, 'Innovation Lab', 'Committee', '2026-11-22 09:00:00', '2026-11-22 10:00:00', 11, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(13, 3, NULL, 'Day 1', 'Hacking Time', NULL, 'Innovation Lab', 'Teams', '2026-11-22 10:00:00', '2026-11-22 17:00:00', 12, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(14, 3, 5, 'Day 2', 'Final Hacking & Mentoring', NULL, 'Innovation Lab', NULL, '2026-11-23 09:00:00', '2026-11-23 12:00:00', 13, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(15, 3, 6, 'Day 2', 'Final Pitch to Judges', NULL, 'Main Stage', NULL, '2026-11-23 13:00:00', '2026-11-23 15:30:00', 14, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(16, 3, NULL, 'Day 2', 'Announcement & Closing', NULL, 'Main Stage', 'Committee', '2026-11-23 15:30:00', '2026-11-23 17:00:00', 15, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(17, 4, NULL, 'Rundown', 'Registration', NULL, 'Convention Hall', 'Committee', '2026-08-30 09:00:00', '2026-08-30 09:30:00', 16, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(18, 4, 8, 'Rundown', 'Keynote: Technology for Campuses', NULL, 'Convention Hall', NULL, '2026-08-30 09:30:00', '2026-08-30 10:30:00', 17, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(19, 4, 9, 'Rundown', 'Web Basics Workshop', NULL, 'Convention Hall', NULL, '2026-08-30 10:45:00', '2026-08-30 12:00:00', 18, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(20, 4, NULL, 'Rundown', 'Product Demo & Showcase', NULL, 'Convention Hall', 'Participants', '2026-08-30 13:00:00', '2026-08-30 16:00:00', 19, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(21, 4, NULL, 'Rundown', 'Closing', NULL, 'Convention Hall', 'Committee', '2026-08-30 16:00:00', '2026-08-30 17:00:00', 20, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(22, 5, 10, 'Daily program', 'Art Exhibition', NULL, 'Plaza Kampus', NULL, '2026-10-13 10:00:00', '2026-10-13 12:00:00', 21, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(23, 5, NULL, 'Daily program', 'Poster Design Contest', NULL, 'Plaza Kampus', 'Judges', '2026-10-13 13:00:00', '2026-10-13 15:00:00', 22, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(24, 5, NULL, 'Daily program', 'Creative Bazaar', NULL, 'Plaza Kampus', 'Community', '2026-10-13 16:00:00', '2026-10-13 18:00:00', 23, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(25, 5, NULL, 'Daily program', 'Acoustic Music Night', NULL, 'Plaza Kampus', 'Campus bands', '2026-10-13 19:00:00', '2026-10-13 21:00:00', 24, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(26, 6, NULL, 'Rundown', 'Opening', NULL, 'Aula Utama', 'Committee', '2026-12-13 09:00:00', '2026-12-13 09:30:00', 25, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(27, 6, 11, 'Rundown', 'Talk: Digital Literacy', NULL, 'Aula Utama', NULL, '2026-12-13 09:30:00', '2026-12-13 11:00:00', 26, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(28, 6, NULL, 'Rundown', 'Career Panel in Tech', NULL, 'Aula Utama', 'Panelists', '2026-12-13 13:00:00', '2026-12-13 15:00:00', 27, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(29, 6, NULL, 'Rundown', 'Closing', NULL, 'Aula Utama', 'Committee', '2026-12-13 15:00:00', '2026-12-13 16:00:00', 28, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(30, 7, NULL, 'Rundown', 'Fun Walk', NULL, 'Lapangan Komunitas', 'Participants', '2026-11-30 08:00:00', '2026-11-30 09:00:00', 29, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(31, 7, 12, 'Rundown', 'Community Service & Book Donation', NULL, 'Lapangan Komunitas', NULL, '2026-11-30 09:00:00', '2026-11-30 11:00:00', 30, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(32, 7, NULL, 'Rundown', 'Shared Lunch', NULL, 'Lapangan Komunitas', 'Committee', '2026-11-30 11:00:00', '2026-11-30 13:00:00', 31, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(33, 8, NULL, 'Rundown', 'Registration & Networking', NULL, 'Co-working Space', 'Committee', '2027-01-24 19:00:00', '2027-01-24 19:30:00', 32, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(34, 8, 13, 'Rundown', 'Founders Panel', NULL, 'Co-working Space', NULL, '2027-01-24 19:30:00', '2027-01-24 20:30:00', 33, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(35, 8, NULL, 'Rundown', 'Open Networking', NULL, 'Co-working Space', 'Participants', '2027-01-24 20:30:00', '2027-01-24 22:00:00', 34, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(36, 10, NULL, 'Rundown', 'Opening & Booth Walk', NULL, 'Gedung Serbaguna', 'Committee', '2026-12-20 09:00:00', '2026-12-20 11:00:00', 35, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(37, 10, 15, 'Rundown', 'Panel: Turning Research into Products', NULL, 'Gedung Serbaguna', NULL, '2026-12-20 11:00:00', '2026-12-20 12:30:00', 36, '2026-10-15 11:27:11', '2026-10-15 11:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `speakers`
--

CREATE TABLE `speakers` (
  `id` bigint UNSIGNED NOT NULL,
  `event_id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Speaker',
  `topic` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `speakers`
--

INSERT INTO `speakers` (`id`, `event_id`, `name`, `title`, `role`, `topic`, `bio`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dr. Rina Kusuma', 'AI Researcher', 'Speaker', 'Applied AI for Everyday Products', 'Researcher working on practical machine learning for consumer products.', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(2, 1, 'Dimas Pratama', 'Backend Engineer', 'Speaker', 'Building a REST API with Laravel', 'Backend engineer who teaches web development to student communities.', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(3, 2, 'Sinta Maharani', 'Digital Marketing Consultant', 'Speaker', 'Digital Marketing Basics for Small Business', 'Helps small businesses grow with simple, low-budget online marketing.', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(4, 2, 'Fajar Ramadhan', 'Content Creator', 'Mentor', 'Product Photography with a Smartphone', 'Content creator focusing on product and food photography.', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(5, 3, 'Arif Hidayat', 'Cloud Engineer', 'Mentor', 'Shipping a Prototype in 24 Hours', 'Cloud engineer and long-time hackathon mentor.', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(6, 3, 'Prof. Ahmad Fauzi', 'Lecturer', 'Judge', 'Evaluating Technical Projects', 'Lecturer in software engineering.', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(7, 3, 'Laila Nurhayati', 'Product Manager', 'Judge', 'What Makes a Product Stand Out', 'Product manager at a technology startup.', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(8, 4, 'Dr. Nadia Rahman', 'Keynote Speaker', 'Speaker', 'Technology for Campuses', 'Academic and speaker on digital transformation in education.', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(9, 4, 'Raka Pratama', 'Workshop Mentor', 'Mentor', 'Web Basics', 'Front-end developer and workshop mentor.', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(10, 5, 'Maya Anggraini', 'Exhibition Curator', 'Curator', 'Curating Student Art', 'Independent curator working with student art collectives.', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(11, 6, 'Hendra Saputra', 'Digital Literacy Speaker', 'Speaker', 'Digital Literacy for Young People', 'Trainer in digital literacy programs for schools.', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(12, 7, 'Rizki Maulana', 'Volunteer Coordinator', 'Coordinator', 'Organising Community Service', 'Coordinates volunteer programs for local communities.', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(13, 8, 'Vina Oktaviani', 'Angel Investor', 'Panelist', 'What Investors Look For', 'Early-stage investor and startup advisor.', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(14, 9, 'Kevin Halim', 'Senior UI/UX Designer', 'Speaker', 'From Wireframe to Prototype', 'Product designer with a focus on mobile apps.', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11'),
(15, 10, 'Melati Sari', 'Startup Mentor', 'Panelist', 'Turning Research into Products', 'Mentor for student startups and innovation programs.', NULL, '2026-10-15 11:27:11', '2026-10-15 11:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('user','organizer','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

-- Data akun dihapus dari dump publik demi keamanan.

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `events_slug_unique` (`slug`),
  ADD KEY `events_status_start_at_index` (`status`,`start_at`),
  ADD KEY `events_start_at_index` (`start_at`),
  ADD KEY `events_organizer_id_status_index` (`organizer_id`,`status`),
  ADD KEY `events_category_id_foreign` (`category_id`),
  ADD KEY `events_reviewed_by_foreign` (`reviewed_by`);

--
-- Indexes for table `event_committees`
--
ALTER TABLE `event_committees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_committees_event_id_index` (`event_id`);

--
-- Indexes for table `event_registrations`
--
ALTER TABLE `event_registrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event_registrations_event_id_user_id_unique` (`event_id`,`user_id`),
  ADD KEY `event_registrations_user_id_status_index` (`user_id`,`status`),
  ADD KEY `event_registrations_event_id_status_index` (`event_id`,`status`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedules_event_id_start_at_index` (`event_id`,`start_at`),
  ADD KEY `schedules_speaker_id_foreign` (`speaker_id`);

--
-- Indexes for table `speakers`
--
ALTER TABLE `speakers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `speakers_event_id_index` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_index` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `event_committees`
--
ALTER TABLE `event_committees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `event_registrations`
--
ALTER TABLE `event_registrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `speakers`
--
ALTER TABLE `speakers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `events_organizer_id_foreign` FOREIGN KEY (`organizer_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `events_reviewed_by_foreign` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `event_committees`
--
ALTER TABLE `event_committees`
  ADD CONSTRAINT `event_committees_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_registrations`
--
ALTER TABLE `event_registrations`
  ADD CONSTRAINT `event_registrations_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_registrations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_speaker_id_foreign` FOREIGN KEY (`speaker_id`) REFERENCES `speakers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `speakers`
--
ALTER TABLE `speakers`
  ADD CONSTRAINT `speakers_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
