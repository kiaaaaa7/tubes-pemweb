-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db-tubes
CREATE DATABASE IF NOT EXISTS `db-tubes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db-tubes`;

-- Dumping structure for table db-tubes.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db-tubes.categories: ~5 rows (approximately)
INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Lomba', 'lomba', '2025-01-16 06:21:08', '2025-01-16 06:21:08'),
	(2, 'Beasiswa', 'beasiswa', '2025-01-16 06:21:16', '2025-01-16 06:21:16'),
	(3, 'Karir', 'karir', '2025-01-16 06:22:32', '2025-01-16 06:22:32'),
	(4, 'Bootcamp', 'bootcamp', '2025-01-16 06:22:51', '2025-01-16 06:22:51'),
	(11, 'Aplikasi Baru', 'aplikasi-baru', '2025-03-14 09:51:58', '2026-01-17 11:54:07');

-- Dumping structure for table db-tubes.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db-tubes.comments: ~48 rows (approximately)
INSERT INTO `comments` (`id`, `user_id`, `message`, `post_id`, `created_at`, `updated_at`) VALUES
	(1, 4, 'wow keren banget, jadi pengen ikut dehhh!!', 16, '2025-01-16 07:05:02', '2025-01-16 07:05:02'),
	(2, 4, 'wahhh canggih banget!!', 15, '2025-01-16 07:05:26', '2025-01-16 07:05:26'),
	(3, 4, 'wahhh canggih banget!!', 15, '2025-01-16 07:05:26', '2025-01-16 07:05:26'),
	(4, 4, 'IHH pasti pusing gasi banyak dataa!!', 14, '2025-01-16 07:05:40', '2025-01-16 07:05:40'),
	(5, 4, 'Wahh ada lomba robot nihhh ^_^', 13, '2025-01-16 07:06:11', '2025-01-16 07:06:11'),
	(6, 4, 'wahhh lomba buat orang kreatif nihhh', 12, '2025-01-16 07:06:30', '2025-01-16 07:06:30'),
	(7, 4, 'wawww lomba web nihhh', 11, '2025-01-16 07:06:57', '2025-01-16 07:06:57'),
	(8, 4, 'menarik nihh lomba hackatonn', 10, '2025-01-16 07:07:11', '2025-01-16 07:07:11'),
	(9, 4, 'lomba kreatif juga nihh', 9, '2025-01-16 07:07:26', '2025-01-16 07:07:26'),
	(10, 4, 'ada lomba web lagi nihh', 8, '2025-01-16 07:07:44', '2025-01-16 07:07:44'),
	(11, 4, 'lomba network nihh', 7, '2025-01-16 07:08:04', '2025-01-16 07:08:04'),
	(12, 4, 'banyak banget dehh lomba nyaa', 6, '2025-01-16 07:08:18', '2025-01-16 07:08:18'),
	(13, 4, 'wahh bootcamp belajar data analyst nihh', 5, '2025-01-16 07:08:36', '2025-01-16 07:08:36'),
	(14, 4, 'WAHH GAME DEVELOPMENTT ^_^ pengen deh jadi game developer T_T', 4, '2025-01-16 07:09:12', '2025-01-16 07:09:12'),
	(15, 4, 'wahh ada beasiswa', 3, '2025-01-16 07:09:28', '2025-01-16 07:09:28'),
	(16, 4, 'menarik juga inii devhandal', 2, '2025-01-16 07:09:40', '2025-01-16 07:09:40'),
	(17, 4, 'wahh ada program beasiswa nihh', 1, '2025-01-16 07:09:52', '2025-01-16 07:09:52'),
	(18, 4, 'keren banget dehh game development, jadi pengen tau lebih lengkapnyaa', 4, '2025-01-16 07:10:11', '2025-01-16 07:10:11'),
	(19, 4, 'keren sii bisa buat game gituu', 4, '2025-01-16 07:10:24', '2025-01-16 07:10:24'),
	(20, 4, 'lomba-lomba hackaton gini tuh menarik banget sii', 10, '2025-01-16 07:10:51', '2025-01-16 07:10:51'),
	(21, 3, 'boleehh nihh lomba web bisa jadi juara nihhh!!!!', 11, '2025-01-16 07:12:24', '2025-01-16 07:12:24'),
	(22, 3, 'hadiah nya lumayan yahh', 10, '2025-01-16 07:12:59', '2025-01-16 07:12:59'),
	(23, 3, 'bootcamp nya menarik nihh, boleh deh soalnya data analyst tuh gajinya besar', 5, '2025-01-16 07:13:27', '2025-01-16 07:13:27'),
	(24, 3, 'hmm program beasiswa yang menarik ikut ga yaaa', 1, '2025-01-16 07:13:57', '2025-01-16 07:13:57'),
	(25, 3, 'wahh bagus inii ada bootcamp tentang front-end sama back-end', 2, '2025-01-16 07:14:23', '2025-01-16 07:14:23'),
	(26, 3, 'wahh jadi hackerrr', 15, '2025-01-16 07:14:34', '2025-01-16 07:14:34'),
	(27, 3, 'menarik nihh soalnya ini gajinya besar', 14, '2025-01-16 07:14:48', '2025-01-16 07:14:48'),
	(28, 3, 'uang beasiswanya lumayan yaa', 16, '2025-01-16 07:15:09', '2025-01-16 07:15:09'),
	(29, 3, 'yahh bukan tingkat perguruan tinggi', 13, '2025-01-16 07:16:25', '2025-01-16 07:16:25'),
	(30, 3, 'lomba design cocok nih', 12, '2025-01-16 07:16:39', '2025-01-16 07:16:39'),
	(31, 3, 'menarik, uang pendaftaran ga mahal, join ah', 12, '2025-01-16 07:17:08', '2025-01-16 07:17:08'),
	(32, 3, 'aku nihh jagonya desain, ikutan pasti juaraa', 12, '2025-01-16 07:17:24', '2025-01-16 07:17:24'),
	(33, 2, 'tahun depan aku join ah', 16, '2025-01-16 07:18:02', '2025-01-16 07:18:02'),
	(34, 2, 'ini nihh cita-cita aku', 15, '2025-01-16 07:18:15', '2025-01-16 07:18:15'),
	(35, 2, 'mau dong cyber security', 15, '2025-01-16 07:18:30', '2025-01-16 07:18:30'),
	(36, 2, 'inpokan bootcamp data analyst', 14, '2025-01-16 07:19:07', '2025-01-16 07:19:07'),
	(37, 2, 'robot-robot gini keren deh, bisa buat gundam', 13, '2025-01-16 07:19:33', '2025-01-16 07:19:33'),
	(38, 2, 'lomba besar nih ya, media partner nya banyak', 10, '2025-01-16 07:20:29', '2025-01-16 07:20:29'),
	(39, 2, 'back-end mah gua jagonya', 2, '2025-01-16 07:21:24', '2025-01-16 07:21:24'),
	(40, 2, 'back-end mah gua jagonya', 2, '2025-01-16 07:21:24', '2025-01-16 07:21:24'),
	(41, 2, 'bisa nih belajar lebih detail lagi soal back-end disini', 2, '2025-01-16 07:21:35', '2025-01-16 07:21:35'),
	(42, 2, 'program bagus nihh dibiayai sampai lulus', 3, '2025-01-16 07:21:59', '2025-01-16 07:21:59'),
	(43, 2, 'bootcamp internasional bagus nih buat sertifikat', 5, '2025-01-16 07:22:21', '2025-01-16 07:22:21'),
	(45, 2, 'Anjay', 16, '2025-03-12 06:29:43', '2025-03-12 06:29:43'),
	(46, 2, 'Keren', 13, '2025-03-14 07:36:03', '2025-03-14 07:36:03'),
	(47, 2, 'Gokil', 3, '2025-03-14 07:36:25', '2025-03-14 07:36:25'),
	(48, 2, 'Kerenn', 15, '2025-03-14 09:22:46', '2025-03-14 09:22:46'),
	(49, 2, 'Kerenn', 15, '2025-03-14 09:22:59', '2025-03-14 09:22:59');

-- Dumping structure for table db-tubes.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db-tubes.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table db-tubes.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db-tubes.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2024_12_19_140552_create_permission_tables', 1),
	(6, '2024_12_21_160907_create_posts_table', 1),
	(7, '2024_12_21_161710_create_categories_table', 1),
	(8, '2025_01_15_115621_create_comments_table', 1),
	(9, '2025_01_15_121952_add_user_id_to_comments_table', 1),
	(10, '2025_01_15_124212_create_views_table', 1);

-- Dumping structure for table db-tubes.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db-tubes.model_has_permissions: ~0 rows (approximately)

-- Dumping structure for table db-tubes.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db-tubes.model_has_roles: ~6 rows (approximately)
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(2, 'App\\Models\\User', 2),
	(2, 'App\\Models\\User', 3),
	(2, 'App\\Models\\User', 4),
	(2, 'App\\Models\\User', 5),
	(2, 'App\\Models\\User', 6);

-- Dumping structure for table db-tubes.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db-tubes.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table db-tubes.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db-tubes.permissions: ~8 rows (approximately)
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'tambah-user', 'web', '2025-01-16 03:51:50', '2025-01-16 03:51:50'),
	(2, 'edit-user', 'web', '2025-01-16 03:51:50', '2025-01-16 03:51:50'),
	(3, 'hapus-user', 'web', '2025-01-16 03:51:50', '2025-01-16 03:51:50'),
	(4, 'lihat-user', 'web', '2025-01-16 03:51:50', '2025-01-16 03:51:50'),
	(5, 'tambah-berita', 'web', '2025-01-16 03:51:50', '2025-01-16 03:51:50'),
	(6, 'edit-berita', 'web', '2025-01-16 03:51:50', '2025-01-16 03:51:50'),
	(7, 'hapus-berita', 'web', '2025-01-16 03:51:50', '2025-01-16 03:51:50'),
	(8, 'lihat-berita', 'web', '2025-01-16 03:51:50', '2025-01-16 03:51:50');

-- Dumping structure for table db-tubes.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db-tubes.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table db-tubes.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db-tubes.posts: ~17 rows (approximately)
INSERT INTO `posts` (`id`, `image`, `title`, `slug`, `category_id`, `content`, `created_at`, `updated_at`) VALUES
	(1, 'QTvkKa0yTw18ftPp9ygzJnDFqW15CWhuv3S1UeC0.jpg', 'Program Beasiswa', 'program-beasiswa', 2, '<p>Semester ganjil Tahun Akademik 2020/2021 segera dimulai lhoo, Y.A.I Campus mulai aktif kuliah tanggal 21 September 2020 nihh. Dan buat Program Pengenalan Kampus Bagi Mahasiswa Baru (PKKMB) akan dilaksanakan tanggal 18 September 2020. Soo tunggu apalagi, buat kalian yang belum daftar kuliah di kampus idaman, saatnya tentukan pilihan studi yang sesuai dengan passion kalian yaah.</p>\r\n<p>&nbsp;</p>\r\n<p>Yuuk segera klik&nbsp;<a href="https://upi-yai.ac.id/superadmin/article/151/pmb.yai.ac.id">pmb.yai.ac.id</a>&nbsp;atau download aplikasi PMB Online YAI, jangan lupa masukin kode voucher "yai1972" yaahh buat dapetin potongan formulir pendaftarannya.</p>\r\n<p>&nbsp;</p>\r\n<p>Jika kalian ada pertanyaan atau mau konsultasi tentang jurusan dan program2 Beasiswa bisa hubungi Staf Front Office di nomor berikut ini:</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Program Diploma &amp; Sarjana</strong></p>\r\n<p>Telp. 021-3916000/3916595</p>\r\n<p>Call Center 0878-5333-1972</p>\r\n<p>Admin 1 : 0888-0873-0162</p>\r\n<p>Admin 2 : 0888-0939-2895</p>', '2025-01-16 06:35:19', '2025-01-16 06:35:19'),
	(2, 'UvdH2IZdINnoBYGAohzzOYB92tr5wuCg8OYPk2QO.jpg', 'DevHandal Bootcamp', 'devhandal-bootcamp', 4, '<p>DevHandal 2024 Batch 2<br />DevHandal adalah program kerjasama CODEPOLITAN dan Alibaba Cloud di bulan Desember 2024 untuk memberikan beasiswa belajar di CODEPOLITAN bebas pilih kelas secara gratis selama 1 tahun dan sertifikasi AI Developer international. Program ini GRATIS dan cara mendapatkannya juga cukup mudah. Kamu hanya perlu mengikuti arahan dan menyelesaikan tugas-tugas yang ada. Jadi tunggu apa lagi? Jangan sia-siakan kesempatan ini dan daftar sekarang juga!</p>', '2025-01-16 06:36:51', '2025-01-16 06:36:51'),
	(3, '0VgQheJQm6GQbfEEvZEeCf30r97W5mdUQbEJqURo.jpg', 'Beasiswa Inspiratif 2022 kembali dibuka', 'beasiswa-inspiratif-2022-kembali-dibuka', 2, '<p dir="ltr">Beasiswa Inspiratif merupakan program beasiswa yang berasal dari kolaborasi yayasan Duta Inspirasi Indonesia dan yayasan Beasiswa 10.000 dengan tujuan membantu mensukseskan Sustainable Development Goals ( SDG\'s) melalui peningkatan Quality Education.</p>\r\n<p>&nbsp;</p>\r\n<p dir="ltr">Beasiswa ini dibuka pendaftaran dari 11 Maret -10 Juli 2022 dengan benefit program yang menarik di antaranya; bantuan tunjangan dana pendidikan hingga lulus persemester, memperluas relasi bersama pemuda-pemudi di Indonesia, E-certificate penerima beasiswa Inspiratif lengkap tanda tangan Kemenpora RI dan e- books Self Empowerment.</p>\r\n<p>&nbsp;</p>\r\n<p dir="ltr">Jika kamu mau apply Beasiswa Inspiratif, berikut informasi lengkap yang dikutip di akun media sosial @dutainspirasi.indonesia dan @Beasiswa 10.000.</p>', '2025-01-16 06:38:34', '2025-01-16 06:38:34'),
	(4, 'IftJzqHl5jtMboG58lx3xCwooK7LZE61vs8K7rBA.jpg', 'Game Development', 'game-development', 3, '<p>Karier di bidang game development berfokus pada menciptakan, mengembangkan, dan mengelola video game untuk berbagai platform seperti PC, konsol, mobile, atau bahkan perangkat VR/AR. Industri ini mencakup berbagai peran mulai dari desain, pemrograman, seni visual, hingga manajemen proyek.</p>\r\n<p>Game development adalah bidang kreatif yang menggabungkan teknologi, seni, dan narasi untuk menciptakan pengalaman interaktif yang menarik. Dengan semakin berkembangnya industri game, peluang karier di bidang ini terus meningkat.</p>', '2025-01-16 06:40:39', '2025-01-16 06:40:39'),
	(5, 'jmiIkzkYZ5o3gryeilsAAm40Jd9E8UVyPHA48Tjp.jpg', 'International Bootcamp: Data Analyst *Free', 'international-bootcamp-data-analyst-free', 4, '<p><strong>✨International Bootcamp: Data Analyst✨</strong></p>\r\n<p><br />Dapatkan benefit berupa:</p>\r\n<p>✅ Jaminan dapat kerja/magang</p>\r\n<p>✅ 15x Pertemuan &amp; full project</p>\r\n<p>✅ 7 Sertifikat Internasional</p>\r\n<p>✅ Grup info loker/magang &amp; grup diskusi</p>\r\n<p>✅ Dibimbing sampai dapat Kerja</p>\r\n<p>✅ Template CV yang pernah lolos</p>\r\n<p>✅ 10+ E-book karir dan self development </p>\r\n<p>&nbsp;</p>\r\n<p>Ingin belajar tentang data analyst tapi ga sesuai jurusan atau ingin coba switch career jadi data analyst?&nbsp;</p>\r\n<p>Tenang ajaa.. di bootcamp ini kamu akan belajar tentang data analyst dari 0 sampai bisa dapat gaji dua digit, loh!!? </p>\r\n<p>&nbsp;</p>\r\n<p>Mentornya kami juga berpengalaman di top company! Seperti:</p>\r\n<p>- Senior Product Analytics - LinkAja</p>\r\n<p>- Business Assurance, Data Analytics - Bukalapak -</p>\r\n<p>Machine Learning Instructor - Bangkit Academy</p>\r\n<p><br />11,3k+ peserta bootcamp telah masuk top company seperti shopee, BUMN, Unilever, dll.</p>\r\n<p>&nbsp;</p>\r\n<p>Kelas dilaksanakan tiap hari Sabtu pukul 10.00 WIB!<br /><br /></p>\r\n<p>Pendaftaran DIPERPANJANG hingga <strong>1 November 2024</strong></p>\r\n<p>Kuota terbatas❗</p>\r\n<p>*Kuota hanya 300 orang (Form ditutup lebih awal jika kuota penuh)<br /><br />For More Information :<br />WA 0895-3589-70020 (admin)<br />IG&nbsp;@smartpath.id</p>', '2025-01-16 06:45:02', '2025-01-16 06:45:02'),
	(6, 'IyIuige6Ccb21RjaRfpGxwNF8BOxlPx9mJ7zJzVU.jpg', 'HOLOGY', 'hology', 1, '<p>House of Technology (HOLOGY) merupakan kegiatan di bidang Teknologi Informasi dan Komunikasi yang menggabungkan konsep festival dan kompetisi bertaraf nasional. HOLOGY bertujuan untuk memberikan edukasi dan mengasah kemampuan di bidang IT untuk seluruh masyarakat khususnya mahasiswa Perguruan Tinggi Negeri (PTN), Perguruan Tinggi Swasta (PTS) dan Politeknik di Indonesia.</p>', '2025-01-16 06:46:04', '2025-01-16 06:46:04'),
	(7, 'Wkwq7VneGiuLS2pCKCTN2ivwoIKiNqqk76hpIxsa.jpg', 'National Networking Competition 3.0', 'national-networking-competition-30', 1, '<p>📢❗𝗢𝗣𝗘𝗡 𝗥𝗘𝗚𝗜𝗦𝗧𝗥𝗔𝗧𝗜𝗢𝗡 𝗡𝗔𝗧𝗜𝗢𝗡𝗔𝗟 𝗡𝗘𝗧𝗪𝗢𝗥𝗞𝗜𝗡𝗚 𝗖𝗢𝗠𝗣𝗘𝗧𝗜𝗧𝗜𝗢𝗡 𝟯.𝟬 ❗📢</p>\r\n<p><br />Hola, Nettizen!👋🏻</p>\r\n<p>&nbsp;</p>\r\n<p>NETCOMP (National Networking Competition) 3.0 merupakan ajang kompetisi bidang Cybersecurity dan Networking berskala nasional yang diselenggarakan oleh Mahasiswa Program Studi Teknologi Rekayasa Internet Universitas Gadjah Mada.</p>\r\n<p>&nbsp;</p>\r\n<p>Mengusung tema besar</p>\r\n<p>𝗧𝗲𝗰𝗵𝗡𝗲𝘁𝘄𝗼𝗿𝗸𝗲𝗿𝘀 𝗨𝗻𝗶𝘁𝗲 : 𝗙𝗼𝗿𝘁𝗶𝗳𝘆𝗶𝗻𝗴 𝗡𝗲𝘁𝘄𝗼𝗿𝗸 𝗮𝗻𝗱 𝗜𝗻𝘁𝗲𝗴𝗿𝗶𝘁𝘆</p>\r\n<p>ajang kompetisi bergengsi ini mengajak para Mahasiswa/i dan Siswa/i SMA/SMK seluruh Indonesia untuk turut mengikuti perlombaan yang super menarik, yakni:</p>\r\n<p>🕵🏻&zwj;♂ Cyber Security</p>\r\n<p>👩🏻&zwj;💻 Networking&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>🗓 𝗧𝗜𝗠𝗘𝗟𝗜𝗡𝗘 :</p>\r\n<p>📍 Pendaftaran : 29 Oktober - 25 Desember 2024</p>\r\n<p>📍 Technical Meeting : 2 Januari 2025</p>\r\n<p>📍 Warm Up : 4 Januari 2025</p>\r\n<p>📍 Penyisihan : 5 Januari 2025 ( online )</p>\r\n<p>📍 Final : 2 Februari 2025 ( offline )</p>\r\n<p>📍 Seminar Nasional : 3 Februari 2025 ( offline )</p>\r\n<p>&nbsp;</p>\r\n<p>𝗚𝘂𝗶𝗱𝗲𝗯𝗼𝗼𝗸 𝗡𝗘𝗧𝗖𝗢𝗠𝗣 𝟯.𝟬</p>\r\n<p>📑 https://s.id/GuidebookNetcomp</p>\r\n<p>&nbsp;</p>\r\n<p>𝗟𝗶𝗻𝗸 𝗣𝗲𝗻𝗱𝗮𝗳𝘁𝗮𝗿𝗮𝗻</p>\r\n<p>🔗 https://tri.sv.ugm.ac.id/netcompugm</p>\r\n<p>&nbsp;</p>\r\n<p>𝗔𝘁𝗿𝗶𝗯𝘂𝘁 𝗣𝗲𝗻𝗱𝗮𝗳𝘁𝗮𝗿𝗮𝗻</p>\r\n<p>🔗https://s.id/AtributPendaftaranNetcomp</p>\r\n<p>&nbsp;</p>\r\n<p>Jadi, tunggu apalagi? Ini kesempatan kamu buat unjuk diri dan bawa pulang hadiah yang ngga kalah menarik! Daftar sekarang, buktikan skill-mu, dan jadi juaranya! 🔥💪</p>\r\n<p>&nbsp;</p>\r\n<p>𝗙𝗼𝗿 𝗠𝗼𝗿𝗲 𝗜𝗻𝗳𝗼𝗿𝗺𝗮𝘁𝗶𝗼𝗻</p>\r\n<p>Admin : 0851-7967-8532 &nbsp;</p>\r\n<p>----------------------------------------------------</p>\r\n<p>𝗙𝗼𝗹𝗹𝗼𝘄 𝘂𝘀 𝗼𝗻 𝘀𝗼𝗰𝗶𝗮𝗹 𝗺𝗲𝗱𝗶𝗮:&nbsp;</p>\r\n<p>Instagram: netcomp.ugm</p>\r\n<p>Tiktok: netcomp.ugm</p>\r\n<p>X: netcomp_ugm</p>\r\n<p>Linke</p>\r\n<p>dIn: netcompugm</p>\r\n<p>YouTube: netcomp_ugm</p>', '2025-01-16 06:47:06', '2025-01-16 06:47:06'),
	(8, 'EFcVTS4ASrBG3PKX2jv6NOSVbAkCIT5yxUrhjEl5.jpg', 'UNIPRO STAGE IX', 'unipro-stage-ix', 1, '<p>📢 UNIPRO STAGE IX kini diperpanjang hingga 2 Januari 2025 untuk Lomba Web Development dan Lomba Tiktok</p>\r\n<p><br />Tunggu apa lagi? Yuk, segera daftarkan dirimu dan raih kesempatan untuk menorehkan prestasi!</p>\r\n<p>&nbsp;</p>\r\n<p>📍 Pendaftaran Online + Juknis</p>\r\n<p>👉 https://linktr.ee/UniproStageIX</p>\r\n<p>&nbsp;</p>\r\n<p>🎁 Benefit:</p>\r\n<p>💵 Uang Tunai &amp; Trophy</p>\r\n<p>📄 E-Sertifikat</p>\r\n<p>👥 Relasi Baru</p>\r\n<p>📚 Ilmu yang Bermanfaat</p>\r\n<p>🥇 Pengalaman Seru</p>\r\n<p>&nbsp;</p>\r\n<p>💻 Lomba Web Development terbuka untuk SMA/SMK sederajat Nasional</p>\r\n<p>📑 Lomba TikTok terbuka untuk Umum</p>\r\n<p>&nbsp;</p>\r\n<p>💳 Pembayaran melalui:</p>\r\n<p>🏧 BANK BRI 315201055767532 a.n. EVINA HANELLA PUTRI</p>\r\n<p>&nbsp;</p>\r\n<p>📞 Contact Person:</p>\r\n<p>&nbsp;</p>\r\n<p>Kak Angga: 0895-1620-9093 (WA)</p>\r\n<p>Kak Lauren: 0895-3044-9699 (WA)</p>\r\n<p>Jangan sampai kelewatan! Ayo daftar sekarang juga!🔥</p>\r\n<p>&nbsp;</p>\r\n<p>#uniprostage9 #unipro #infolomba #webdevelopment #tiktokvideo #hmps_si #smfst_unikama #unikamaofficial #unikamaunggul2025 #unikama #event #programmer #teknologi</p>', '2025-01-16 06:48:56', '2025-01-16 06:48:56'),
	(9, 'frgDwGpYnLgXkds7X1rKEIfWJJ1IGiEsoGLYXMoM.jpg', 'Kreasi Sistem Informasi 2024 (KreaSInfo Event)', 'kreasi-sistem-informasi-2024-kreasinfo-event', 1, '<p>Halo, para pelajar dan mahasiswa kreatif di seluruh Indonesia! 🇮🇩 Ayo ikuti acara bergengsi Kreasi Sistem Informasi 2024 (KreaSInfo Event),yang siap menghadirkan berbagai lomba menarik untuk mengasah kreativitas dan inovasimu! 💡 Acara ini memberikan kesempatan untuk bersaing, berkarya, dan meraih total hadiah JUTAAN RUPIAH! 💰🎉</p>\r\n<p>&nbsp;</p>\r\n<p>Jenis Lomba:</p>\r\n<p>1. Lomba Nasional🌍 &nbsp;</p>\r\n<p>&nbsp; &nbsp;- Desain Web 💻 &nbsp;</p>\r\n<p>&nbsp; &nbsp;- Desain Poster 🎨 &nbsp;</p>\r\n<p>&nbsp; &nbsp;- Karya Tulis Ilmiah 📚</p>\r\n<p>&nbsp;</p>\r\n<p>2. Lomba Umum🎮 &nbsp;</p>\r\n<p>&nbsp; &nbsp;- Mobile Legends Bang Bang 🏆: Biaya pendaftaran 120K per tim. Siapkan tim kalian untuk bertarung dalam game populer ini! 💥 (Slot terbatas!)</p>\r\n<p>&nbsp;</p>\r\n<p>3. Lomba SINFO🔥 &nbsp;</p>\r\n<p>&nbsp; &nbsp;- Duta Sinfo 👑: Khusus mahasiswa/i Sistem Informasi Uin Dk Palu</p>\r\n<p>&nbsp;</p>\r\n<p>Link pendaftaran : https://linktr.ee/kreasinfo2024</p>\r\n<p>&nbsp;</p>\r\n<p>Ikuti kami di Instagram: &nbsp;</p>\r\n<p>@official.kreasinfo_2024 📱 &nbsp;</p>\r\n<p>@hmps.sisteminformasi_uindkpalu 📲</p>\r\n<p>&nbsp;</p>\r\n<p>☎ Contact Person: &nbsp;</p>\r\n<p>Rini Oktaviani : +62 822-9342-0580 📞 &nbsp;</p>\r\n<p>Komala : +62 822-9342-0580📞</p>', '2025-01-16 06:50:54', '2025-01-16 06:50:54'),
	(10, 'zaWRa3skniIfIBrjTjQkncUvR2vrJuuiRFxrRbrX.jpg', 'CodeCollab', 'codecollab', 1, '<p>✨ CodeCollab 2024 ✨</p>\r\n<p><br />‼ Registration is Now Open ‼</p>\r\n<p>&nbsp;</p>\r\n<p>Hai siswa SMA/SMK/MA se-Jawa Tengah! Saatnya tunjukkan kemampuan codingmu di CodeCollab 2024.</p>\r\n<p>&nbsp;</p>\r\n<p>🔍 Tema: &ldquo;CodeCollab: Solving Today&rsquo;s Challenges Together&rdquo;</p>\r\n<p>&nbsp;</p>\r\n<p>🏆 Total Hadiah Jutaan Rupiah!</p>\r\n<p>Juara 1, 2, 3: Sertifikat + Uang Pembinaan + Trophy</p>\r\n<p>&nbsp;</p>\r\n<p>🗓 Timeline:</p>\r\n<p>- Pendaftaran &amp; Pengumpulan Project: 12 November - 11 Desember</p>\r\n<p>- Penilaian Project: 12 - 13 Desember&nbsp;</p>\r\n<p>- Pengumuman 5 Besar &amp; Technical Meeting: 14 Desember&nbsp;</p>\r\n<p>- Perbaikan Project: 14 - 17 Desember</p>\r\n<p>- Presentasi &amp; Pengumuman Juara: 18 Desember</p>\r\n<p>&nbsp;</p>\r\n<p>📌 Syarat:</p>\r\n<p>1. SMA/SMK/MA sederajat se-Jawa Tengah.</p>\r\n<p>2. Tim maks. 3 orang dari sekolah yang sama.</p>\r\n<p>&nbsp;</p>\r\n<p>💻 Link Pendaftaran &amp; Guidebook:</p>\r\n<p>Daftar: s.id/DaftarHackthon</p>\r\n<p>Guidebook: s.id/Guidedbook</p>\r\n<p>&nbsp;</p>\r\n<p>☎ CP:</p>\r\n<p>Cikal (0812-1508-6980)&nbsp;</p>\r\n<p>Putra (0815-6560-071)</p>\r\n<p>&nbsp;</p>\r\n<p>🔥Jangan lewatkan kesempatan ini!🔥</p>\r\n<p>#SEVENT8th &nbsp;</p>\r\n<p>#SoftwareEngineering &nbsp;</p>\r\n<p>#DiesNataliske8 &nbsp;</p>\r\n<p>#telupurwokerto</p>\r\n<p>#CodeCollab</p>\r\n<p>#Hackathon</p>', '2025-01-16 06:51:49', '2025-01-16 06:51:49'),
	(11, '9NtIr3H08tKoK7I0nrTvbfOks6hbvzhqt6aE1g6K.jpg', 'ICF 2024 Next Generation WebDev Competition', 'icf-2024-next-generation-webdev-competition', 1, '<p>✨💻 [ICF 2024: NEXT GENERATION - WEB DEVELOPMENT COMPETITION] 💻✨</p>\r\n<p>&nbsp;</p>\r\n<p>ICF kembali hadir dengan kompetisi fotografi terbuka untuk umum 🔥‼</p>\r\n<p>&nbsp;</p>\r\n<p>📌 TEMA 📌</p>\r\n<p>Educational Equity: Bridging The Gap With E-Learning Platfroms</p>\r\n<p>&nbsp;</p>\r\n<p>✨ BENEFIT ✨</p>\r\n<p>- Uang Pembinaan</p>\r\n<p>- E-Sertifikat</p>\r\n<p>&nbsp;</p>\r\n<p>📆 TIMELINE 📆</p>\r\n<p>✍ Pendaftaran: 6 - 27 November 2024</p>\r\n<p>💻 Technical Meeting: 29 November 2024</p>\r\n<p>🗞 Pengumpulan Karya : &nbsp;15 Desember 2024</p>\r\n<p>🖥 Presentasi dan Demo : 20 Desember 2024</p>\r\n<p>📢 Pengumuman : 22 Desember 2024</p>\r\n<p>&nbsp;</p>\r\n<p>💰 FEE REGISTRATION 💰</p>\r\n<p>Rp. 60.000,-/tim&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>🔗 REGISTRATION LINK 🔗</p>\r\n<p>bit.ly/RegICFWebDev</p>\r\n<p>&nbsp;</p>\r\n<p>📑 GUIDE BOOK 📑</p>\r\n<p>bit.ly/GuideBookAllLombaICF</p>\r\n<p>&nbsp;</p>\r\n<p>Have a question? We\'re here to help! ☎👇</p>\r\n<p>&times; 081233003434 (Ariel)</p>\r\n<p>&times; 08819305047 (Arya)</p>', '2025-01-16 06:52:48', '2025-01-16 06:52:48'),
	(12, 'fZOpiDipr9h1HxSBpr7HRnfwr0JwB5Mp9zPeiMhB.jpg', 'HIMIKA CUP PART-V', 'himika-cup-part-v', 1, '<p>Persiapkan dirimu untuk HIMIKA CUP PART-V 2024! 🌟 Tunjukkan kreativitas dan kemampuan terbaikmu dalam Kompetisi Desain Grafis yang paling dinantikan tahun ini! Terbuka untuk seluruh mahasiswa/i se-Indonesia, kesempatan emas ini menantimu untuk membuat karya luar biasa dengan tema Smart City dan Indonesia Emas 2045.</p>\r\n<p>&nbsp;</p>\r\n<p>✨ Ciptakan karya yang menginspirasi dan raih gelar juara! Jangan lewatkan kesempatan untuk menjadi bagian dari masa depan kreatif Indonesia. Siapkan ide terbaikmu, kreasikan konsep yang menarik, dan bawa pulang kemenangan!</p>\r\n<p>&nbsp;</p>\r\n<p><br />Tunjukkan potensimu, ikuti HIMIKA CUP PART-V sekarang!</p>\r\n<p>&nbsp;</p>\r\n<p>📆 Timeline Event:</p>\r\n<p>&nbsp;</p>\r\n<p>Pendaftaran + pengumpulan projek saat mendaftar: 8-18 November 2024</p>\r\n<p>Pengumuman Finalis: 20 November 2024</p>\r\n<p>Presentasi Finalis: 22 November 2024</p>\r\n<p>Pengumuman Pemenang: 23 November 2024</p>\r\n<p>&nbsp;</p>\r\n<p>Biaya Pendaftaran: Rp. 75.000</p>', '2025-01-16 06:53:52', '2025-01-16 06:53:52'),
	(13, 'ScJZSBRhO5tPrm0xLEvP12TmRe9elf1TyUGAyT35.jpg', 'Creative Robot', 'creative-robot', 1, '<p>Hi Sobat IT<br />🌟 Saatnya Unjuk Kreativitas! 🌟</p>\r\n<p>Halo, siswa-siswi SMP/MTs se-Indonesia! Apakah kalian siap untuk tantangan seru yang menguji kreativitas dan inovasi kalian? Bergabunglah dalam Creative Robot Competition di Maskumambang Fest 2!</p>\r\n<p>&nbsp;</p>\r\n<p>🤖 Apa itu Lomba Creative Robot?</p>\r\n<p>Lomba ini adalah ajang bagi kalian untuk merancang dan menciptakan robot kreatif dan inovatif! Tunjukkan ide-ide cemerlang kalian dan bersaing dengan peserta dari seluruh Indonesia!</p>\r\n<p>&nbsp;</p>\r\n<p>✍Tema : Bebas</p>\r\n<p>&nbsp;</p>\r\n<p>🏆 Hadiah Menarik!</p>\r\n<p>- Trophy</p>\r\n<p>- Uang Pembinaan</p>\r\n<p>- Sertifikat Pemenang</p>\r\n<p>- Beasiswa</p>\r\n<p>&nbsp;</p>\r\n<p>📅 Tanggal Penting</p>\r\n<p>- Pendaftaran &amp; Pengumpulan Video: 10 Oktober 2024 - 30 Januari 2025</p>\r\n<p>- Pengumuman Finalis: 2 Februari 2025</p>\r\n<p>- Final: 9 Februari 2025 di Pondok Pesantren Maskumambang</p>\r\n<p>&nbsp;</p>\r\n<p>💰HTM : Rp. 150.000</p>\r\n<p>(Daftar sekarang, submit nanti!)</p>\r\n<p>&nbsp;</p>\r\n<p>💳 &nbsp;Pembayaran</p>\r\n<p>630 2222 035 Bank Jatim Syariah</p>\r\n<p>a.n Maskumambang Fest</p>\r\n<p>&nbsp;</p>\r\n<p>Link pendaftaran &amp; Petunjuk Teknis:</p>\r\n<p>s.id/crmaskumambangfest2</p>\r\n<p>&nbsp;</p>\r\n<p>Narahubung:</p>\r\n<p>085697711195 - Amin Rois</p>\r\n<p>&nbsp;</p>\r\n<p>Instagram:</p>\r\n<p>@maskumambangfest</p>\r\n<p>@pesantrenmaskumambang</p>\r\n<p>&nbsp;</p>\r\n<p>#maskumambangfest #creativerobot #lombarobot #lombarobotsmp #arduino #mrt #lego #eventjawatimur</p>', '2025-01-16 06:54:39', '2025-01-16 06:54:39'),
	(14, 'Rhbxs3RRS3AkbdH6v7nNniiHFF6fBqcJdhaV0Qf6.jpg', 'Data Analyst', 'data-analyst', 3, '<p>Karir sebagai data analyst berfokus pada pengumpulan, pengolahan, dan analisis data untuk mendukung pengambilan keputusan berbasis informasi dalam organisasi. Seorang data analyst bertugas menginterpretasikan data dengan menggunakan alat dan teknik statistik, membuat visualisasi data seperti grafik atau dashboard, serta memberikan rekomendasi strategis berdasarkan temuan mereka. Profesi ini menuntut kemampuan teknis dalam pengelolaan database, penggunaan perangkat analitik seperti Python, R, atau SQL, serta pemahaman mendalam tentang bisnis yang dianalisis. Data analyst memainkan peran penting dalam berbagai industri, termasuk keuangan, pemasaran, teknologi, dan kesehatan, karena membantu organisasi memahami tren, memprediksi peluang, dan meningkatkan efisiensi operasional.</p>', '2025-01-16 07:00:56', '2025-01-16 07:00:56'),
	(15, 'ZRoIyVsO2tZwTQYVujUnayZoqfsmz1k23GIRejGO.jpg', 'Cyber Security', 'cyber-security', 3, '<p>Karir di bidang cybersecurity berfokus pada melindungi sistem, jaringan, dan data dari ancaman siber seperti serangan malware, peretasan, dan pencurian data. Seorang profesional keamanan siber bertugas mengidentifikasi kerentanan, merancang strategi pertahanan, memantau aktivitas jaringan untuk mendeteksi ancaman, serta merespons insiden keamanan dengan cepat. Mereka juga bertanggung jawab dalam mengembangkan kebijakan keamanan, memberikan pelatihan kepada karyawan, dan memastikan kepatuhan terhadap regulasi keamanan data. Peran ini membutuhkan keahlian dalam teknologi keamanan, seperti firewall, enkripsi, dan pemindaian kerentanan, serta pemahaman mendalam tentang pola serangan siber. Dengan meningkatnya ketergantungan pada teknologi digital, permintaan untuk ahli cybersecurity terus meningkat di berbagai sektor, seperti pemerintahan, perbankan, kesehatan, dan teknologi informasi.</p>', '2025-01-16 07:01:36', '2025-01-16 07:01:36'),
	(16, 'yv06jM4BeQQeqCXidlPvyt1CYoRvyAkEmPpB45B9.jpg', 'Djarum Plus', 'djarum-plus', 2, '<p>Sejak 1984, Djarum Foundation terus konsisten dalam memberikan kontribusi terhadap dunia pendidikan di Indonesia. Langkah ini diawali kesadaran bahwa pendidikan merupakan salah satu upaya untuk meningkatkan kesejahteraan masyarakat dan bangsa dalam mewujudkan masa depan yang lebih baik.</p>\r\n<p>Djarum Foundation turut berperan aktif dalam memajukan pendidikan di Indonesia melalui program beasiswa prestasi (<em>merit based scholarship</em>) yang dikenal sebagai Djarum Beasiswa Plus bagi mahasiswa berprestasi tinggi di Indonesia.</p>', '2025-01-16 07:04:20', '2025-01-16 07:04:20'),
	(18, 'yWAQcdOHJ0NhtrwFHVD28i7eQMLNBRlqcVf4WZSy.png', 'Aplikasi Baru Pascal 1', 'aplikasi-baru-pascal-1', 11, '<p>Kerenn</p>', '2025-03-14 09:54:07', '2025-03-18 09:24:48');

-- Dumping structure for table db-tubes.post_tag
CREATE TABLE IF NOT EXISTS `post_tag` (
  `post_id` int NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db-tubes.post_tag: ~0 rows (approximately)

-- Dumping structure for table db-tubes.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db-tubes.roles: ~2 rows (approximately)
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'web', '2025-01-16 03:51:50', '2025-01-16 03:51:50'),
	(2, 'user', 'web', '2025-01-16 03:51:50', '2025-01-16 03:51:50');

-- Dumping structure for table db-tubes.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db-tubes.role_has_permissions: ~8 rows (approximately)
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 2),
	(6, 2),
	(7, 2),
	(8, 2);

-- Dumping structure for table db-tubes.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db-tubes.users: ~6 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$pK/JjCoGXokjcP48DaeIg.fFXFtnGVWUX5oCRpQT5ms96iXBCpu4.', NULL, '2025-01-16 03:51:57', '2025-01-16 03:51:57'),
	(2, 'Rizky', 'rizky@gmail.com', NULL, '$2y$12$DEl35txepPrCtJ3g3r0cE.wRJcNdsfxgfkYV.g3B9viuHHy3qiGDe', NULL, '2025-01-16 06:56:23', '2025-01-16 06:56:23'),
	(3, 'Rifqi', 'rifqi@gmail.com', NULL, '$2y$12$V/AxkXmlRe5aQc6YsZA83erEcy3BBly2f.CXCDTNJoXVxW2u6WLuS', NULL, '2025-01-16 06:56:53', '2025-01-16 06:56:53'),
	(4, 'Upi', 'upi@gmail.com', NULL, '$2y$12$ekL6WCw1V2gi7TkQDN5T6OplV5DGCnEwTm0lUvtMjzPUgF8FjpgEq', NULL, '2025-01-16 06:57:19', '2025-01-16 06:57:19'),
	(5, 'User1', 'user1@gmail.com', NULL, '$2y$12$KTQzjKEtatKeGWrMtriUHOPzpc8rtilOgaD0jYl1cLBybF4r4H0Cu', NULL, '2025-01-16 07:23:13', '2025-01-16 07:23:13'),
	(6, 'User2', 'user2@gmail.com', NULL, '$2y$12$OtyWPKznpfB4PtwsnRoo2.aHd1tNVceOdcRv2C.3/vF95rgR1t9l2', NULL, '2025-01-16 07:23:45', '2025-01-16 07:23:45');

-- Dumping structure for table db-tubes.views
CREATE TABLE IF NOT EXISTS `views` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `views_post_id_foreign` (`post_id`),
  KEY `views_user_id_foreign` (`user_id`),
  CONSTRAINT `views_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db-tubes.views: ~46 rows (approximately)
INSERT INTO `views` (`id`, `post_id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
	(1, 16, 4, '127.0.0.1', '2025-01-16 07:04:52', '2025-01-16 07:04:52'),
	(2, 15, 4, '127.0.0.1', '2025-01-16 07:05:14', '2025-01-16 07:05:14'),
	(3, 14, 4, '127.0.0.1', '2025-01-16 07:05:30', '2025-01-16 07:05:30'),
	(4, 13, 4, '127.0.0.1', '2025-01-16 07:05:46', '2025-01-16 07:05:46'),
	(5, 12, 4, '127.0.0.1', '2025-01-16 07:06:18', '2025-01-16 07:06:18'),
	(6, 11, 4, '127.0.0.1', '2025-01-16 07:06:41', '2025-01-16 07:06:41'),
	(7, 10, 4, '127.0.0.1', '2025-01-16 07:07:02', '2025-01-16 07:07:02'),
	(8, 9, 4, '127.0.0.1', '2025-01-16 07:07:16', '2025-01-16 07:07:16'),
	(9, 8, 4, '127.0.0.1', '2025-01-16 07:07:33', '2025-01-16 07:07:33'),
	(10, 7, 4, '127.0.0.1', '2025-01-16 07:07:52', '2025-01-16 07:07:52'),
	(11, 6, 4, '127.0.0.1', '2025-01-16 07:08:10', '2025-01-16 07:08:10'),
	(12, 5, 4, '127.0.0.1', '2025-01-16 07:08:23', '2025-01-16 07:08:23'),
	(13, 4, 4, '127.0.0.1', '2025-01-16 07:08:43', '2025-01-16 07:08:43'),
	(14, 3, 4, '127.0.0.1', '2025-01-16 07:09:19', '2025-01-16 07:09:19'),
	(15, 2, 4, '127.0.0.1', '2025-01-16 07:09:33', '2025-01-16 07:09:33'),
	(16, 1, 4, '127.0.0.1', '2025-01-16 07:09:45', '2025-01-16 07:09:45'),
	(17, 11, 3, '127.0.0.1', '2025-01-16 07:11:42', '2025-01-16 07:11:42'),
	(18, 10, 3, '127.0.0.1', '2025-01-16 07:12:33', '2025-01-16 07:12:33'),
	(19, 5, 3, '127.0.0.1', '2025-01-16 07:13:08', '2025-01-16 07:13:08'),
	(20, 1, 3, '127.0.0.1', '2025-01-16 07:13:32', '2025-01-16 07:13:32'),
	(21, 2, 3, '127.0.0.1', '2025-01-16 07:14:05', '2025-01-16 07:14:05'),
	(22, 15, 3, '127.0.0.1', '2025-01-16 07:14:29', '2025-01-16 07:14:29'),
	(23, 14, 3, '127.0.0.1', '2025-01-16 07:14:38', '2025-01-16 07:14:38'),
	(24, 16, 3, '127.0.0.1', '2025-01-16 07:14:53', '2025-01-16 07:14:53'),
	(25, 13, 3, '127.0.0.1', '2025-01-16 07:15:54', '2025-01-16 07:15:54'),
	(26, 12, 3, '127.0.0.1', '2025-01-16 07:16:32', '2025-01-16 07:16:32'),
	(27, 16, 2, '127.0.0.1', '2025-01-16 07:17:50', '2025-01-16 07:17:50'),
	(28, 15, 2, '127.0.0.1', '2025-01-16 07:18:07', '2025-01-16 07:18:07'),
	(29, 14, 2, '127.0.0.1', '2025-01-16 07:18:35', '2025-01-16 07:18:35'),
	(30, 13, 2, '127.0.0.1', '2025-01-16 07:19:13', '2025-01-16 07:19:13'),
	(31, 10, 2, '127.0.0.1', '2025-01-16 07:19:47', '2025-01-16 07:19:47'),
	(32, 7, 2, '127.0.0.1', '2025-01-16 07:20:40', '2025-01-16 07:20:40'),
	(33, 2, 2, '127.0.0.1', '2025-01-16 07:21:01', '2025-01-16 07:21:01'),
	(34, 3, 2, '127.0.0.1', '2025-01-16 07:21:47', '2025-01-16 07:21:47'),
	(35, 5, 2, '127.0.0.1', '2025-01-16 07:22:08', '2025-01-16 07:22:08'),
	(36, 16, 5, '127.0.0.1', '2025-01-16 07:23:16', '2025-01-16 07:23:16'),
	(37, 2, 5, '127.0.0.1', '2025-01-16 07:23:27', '2025-01-16 07:23:27'),
	(38, 16, 6, '127.0.0.1', '2025-01-16 07:23:49', '2025-01-16 07:23:49'),
	(39, 4, 6, '127.0.0.1', '2025-01-16 07:23:55', '2025-01-16 07:23:55'),
	(47, 1, 2, '127.0.0.1', '2025-01-17 02:39:53', '2025-01-17 02:39:53'),
	(48, 4, 2, '127.0.0.1', '2025-01-17 02:44:43', '2025-01-17 02:44:43'),
	(49, 6, 2, '127.0.0.1', '2025-01-17 02:46:53', '2025-01-17 02:46:53'),
	(50, 8, 2, '127.0.0.1', '2025-01-17 02:49:32', '2025-01-17 02:49:32'),
	(51, 9, 2, '127.0.0.1', '2025-01-17 02:50:05', '2025-01-17 02:50:05'),
	(52, 11, 2, '127.0.0.1', '2025-01-17 02:51:06', '2025-01-17 02:51:06'),
	(53, 12, 2, '127.0.0.1', '2025-01-17 02:51:37', '2025-01-17 02:51:37');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
