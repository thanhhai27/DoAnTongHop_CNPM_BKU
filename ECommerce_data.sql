-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 13, 2024 at 04:13 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ECommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Thanh Hải', 'hai.nguyenhai2003@hcmut.edu.vn', '123456789', NULL, NULL),
(2, 'Trần Hoàng Sơn', 'transon15042003@gmail.com', '12345678', '2024-10-30 21:31:50', '2024-10-30 21:31:50');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_users`
--

CREATE TABLE `client_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_users`
--

INSERT INTO `client_users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Quang Tuấn', 'tuan.nguyenquang1202@hcmut.edu.vn', '123456789', NULL, '2024-11-01 02:53:13'),
(2, 'Nguyễn Trần Tiến Anh ', 'anh.nguyen2004@hcmut.edu.vn', '1234567890', '2024-10-26 20:53:57', '2024-11-01 02:57:19'),
(3, 'Nguyễn Thanh Hải', 'hai.nguyenhai2003@hcmut.edu.vn', '02072003', '2024-11-22 00:20:33', '2024-11-22 00:20:33');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_10_02_084617_create_products_table', 1),
(5, '2024_10_21_101751_create_orders_table', 2),
(6, '2024_10_27_023259_create_client_users_table', 3),
(7, '2024_10_31_041927_create_admin_users_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `order_detail` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `token` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `phone`, `email`, `city`, `district`, `ward`, `address`, `note`, `method`, `order_detail`, `status`, `token`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Thanh Hải', '0383213703', 'thanhhai020703@gmail.com', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Hồ Hoàn Kiếm', 'Gửi nhanh trước 9h tối', 'Tiền mặt', '{\"5\":\"2\",\"11\":\"2\",\"318\":\"1\"}', 0, 'YcPNUZpAw9qBg', '2024-11-01 20:20:01', '2024-11-01 20:20:01'),
(2, 'Nguyễn Quang Tuấn', '0192837291', 'thanhhai123@gmail.com', 'Tỉnh Lai Châu', 'Thành phố Lai Châu', 'Phường Quyết Tiến', 'Hồ Gươm', 'Gửi nhanh trước 10 tối', 'Chuyển khoản', '{\"2\":\"2\",\"10\":\"1\",\"300\":\"3\",\"314\":\"2\"}', 0, 'idGe80hbrtwjJ', '2024-11-02 23:34:01', '2024-11-02 23:34:01'),
(3, 'Trần Hoàng Sơn', '03938439292', 'thanhhai012@gmail.com', 'Thành phố Hà Nội', 'Quận Hoàn Kiếm', 'Phường Phúc Tân', 'Nhà Riêng', 'Tối thứ 2 hãy giao', 'Tiền mặt', '{\"4\":\"15\",\"218\":\"18\"}', 0, '0aURQ29cx9nAl', '2024-11-01 23:37:04', '2024-11-01 23:37:04'),
(4, 'Nguyễn Trần Tiến Anh', '0298492838', 'hainguyem3478@gmail.com', 'Tỉnh Hà Giang', 'Huyện Đồng Văn', 'Xã Lũng Cú', 'Công ty', 'Không có', 'Tiền mặt', '{\"2\":\"1\",\"21\":\"1\",\"98\":\"2\",\"217\":\"1\",\"276\":\"1\",\"302\":\"1\",\"314\":\"1\"}', 0, 'LTvN8heypAWAf', '2024-11-03 23:38:36', '2024-11-03 23:38:36'),
(5, 'Nguyễn Thị Yến', '0383213703', 'haithanh027@gmail.com', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Hồ Hoàn Kiếm', 'Không có', 'Tiền mặt', '{\"2\":\"1\",\"9\":\"1\"}', 0, 'oxggMVWQ38r92', '2024-11-03 00:04:37', '2024-11-03 00:04:37'),
(6, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Hồ Hoàn Kiếm', 'Không có', 'Tiền mặt', '{\"1\":\"1\",\"2\":\"1\",\"3\":\"1\",\"4\":\"1\",\"5\":\"2\",\"6\":\"1\",\"7\":\"1\",\"8\":\"1\",\"9\":\"1\",\"10\":\"1\",\"100\":\"1\",\"103\":\"1\",\"120\":\"1\",\"130\":\"1\",\"154\":\"1\",\"162\":\"1\",\"295\":\"1\",\"301\":\"1\",\"323\":\"1\",\"327\":\"1\"}', 0, 'q1PHnN6am9RS3', '2024-11-04 00:14:32', '2024-11-04 00:14:32'),
(7, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0164@gmail.com', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Vĩnh Phúc', 'Hồ Hoàn Kiếm', 'Không có', 'Tiền mặt', '{\"4\":\"1\"}', 0, 'VdWpY2THttk7E', '2024-11-02 00:20:56', '2024-11-02 00:20:56'),
(8, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0164@gmail.com', 'Thành phố Hà Nội', 'Quận Hoàn Kiếm', 'Phường Đồng Xuân', 'Hồ Hoàn Kiếm', 'Không có ghi chú', 'Chuyển khoản', '{\"9\":\"5\",\"132\":\"3\",\"218\":\"4\"}', 0, 'dV2P1D8xvNdWT', '2024-11-04 00:21:36', '2024-11-04 00:21:36'),
(9, 'Nguyễn Văn Xô', '0239893889', 'haithanhnguyen123@gmail.com', 'Thành phố Hà Nội', 'Huyện Gia Lâm', 'Xã Phú Thị', 'Thủ đô', 'Giao trước thứ 7', 'Tiền mặt', '{\"20\":\"1\",\"125\":\"1\",\"302\":\"1\"}', 0, 'P0FMv7pE2Mjni', '2024-11-04 00:22:42', '2024-11-04 00:22:42'),
(10, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Tỉnh Hà Giang', 'Thành phố Hà Giang', 'Phường Minh Khai', 'Hồ Hoàn Kiếm', 'Giao trước thứ 7', 'Tiền mặt', '{\"1\":\"1\"}', 0, 'myFn5BrG6nUQN', '2024-11-04 01:52:10', '2024-11-04 01:52:10'),
(11, 'Nguyễn Thanh Hải', '0383213703', 'thanhhai020703@gmail.com', 'Thành phố Hà Nội', 'Quận Hoàn Kiếm', 'Phường Cửa Nam', 'Hồ Hoàn Kiếm', 'Giao trước thứ 7', 'Chuyển khoản', '{\"2\":\"1\",\"160\":\"1\",\"278\":\"1\"}', 0, 'ivZXdiOGqKYjB', '2024-11-03 01:52:40', '2024-11-03 01:52:40'),
(12, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Hồ Hoàn Kiếm', 'Giao trước thứ 7', 'Tiền mặt', '{\"155\":\"9\"}', 0, 'oL1drwP6vKQxI', '2024-11-04 13:17:05', '2024-11-04 13:17:05'),
(13, 'Hải Thanh Nguyễn', '0383213703', 'haoquang123@gmail.com', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Hồ Gươm', '123', 'Tiền mặt', '{\"4\":\"1\"}', 0, 'BgJRsOnimwFpL', '2024-11-05 03:52:02', '2024-11-05 03:52:02'),
(14, 'Hải Thanh Nguyễn', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Hoàn Kiếm', 'Phường Phúc Tân', 'Hồ Gươm', '123', 'Tiền mặt', '{\"1\":\"6\",\"219\":\"5\",\"303\":\"3\"}', 0, 'DKVUTMmbAtMo2', '2024-11-05 08:41:49', '2024-11-05 08:41:49'),
(15, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0273@gmail.com', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Hồ Gươm', '123', 'Tiền mặt', '{\"2\":\"1\",\"3\":\"1\",\"4\":\"1\",\"7\":\"1\",\"10\":\"1\",\"276\":\"1\",\"314\":\"1\"}', 0, 'ZtgV89uj0udcd', '2024-11-05 08:52:52', '2024-11-05 08:52:52'),
(16, 'Nguyễn Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Hồ Gươm', '123', 'Tiền mặt', '{\"1\":\"1\",\"2\":\"1\",\"3\":\"1\",\"4\":\"1\",\"5\":\"1\",\"6\":\"1\"}', 0, 'Hg4jirVRsKNoG', '2024-11-05 09:07:51', '2024-11-05 09:07:51'),
(17, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Hồ Hoàn Kiếm', 'Giao trước thứ 7', 'Chuyển khoản', '{\"4\":\"1\",\"7\":\"1\",\"8\":\"1\",\"127\":\"1\",\"154\":\"1\",\"223\":\"1\"}', 0, 'gBopSHZu2lDId', '2024-11-06 23:49:54', '2024-11-06 23:49:54'),
(18, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Hồ Hoàn Kiếm', 'Giao trước thứ 7', 'Chuyển khoản', '{\"2\":\"1\",\"8\":\"1\"}', 0, 'DXjBrq7Yp249A', '2024-11-06 23:52:12', '2024-11-06 23:52:12'),
(19, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Hoàn Kiếm', 'Phường Đồng Xuân', 'Hồ Hoàn Kiếm', 'Giao trước thứ 7', 'Chuyển khoản', '{\"1\":\"1\"}', 0, 'Da0eh7r4qFTU0', '2024-11-07 00:09:26', '2024-11-07 00:09:26'),
(21, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Hoàn Kiếm', 'Phường Phúc Tân', 'Hồ Hoàn Kiếm', 'Giao trước thứ 7', 'Chuyển khoản', '{\"2\":\"1\"}', 0, '9fwSdL1eqHSJM', '2024-11-07 00:13:20', '2024-11-07 00:13:20'),
(24, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Hồ Hoàn Kiếm', 'Giao trước thứ 7', 'Tiền mặt', '{\"2\":\"1\"}', 0, 'BjsyksQu6ezQT', '2024-11-07 00:16:38', '2024-11-07 00:16:38'),
(28, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Hồ Hoàn Kiếm', 'Giao trước thứ 7', 'Chuyển khoản', '{\"2\":\"1\"}', 0, 'A3MYQ5jU4o8HE', '2024-11-07 01:54:11', '2024-11-07 01:54:11'),
(29, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Đống Đa', 'Phường Ô Chợ Dừa', 'Hồ Hoàn Kiếm', 'Giao trước thứ 7', 'Chuyển khoản', '{\"100\":\"1\",\"128\":\"1\",\"224\":\"1\"}', 0, 'oKIuynwlYfa10', '2024-11-07 02:21:01', '2024-11-07 02:21:01'),
(30, 'Nguyễn Cao Cường', '01939481939', 'thanhhai020703@gmail.com', 'Thành phố Hà Nội', 'Huyện Đông Anh', 'Thị trấn Đông Anh', 'Hồ Hoàn Kiếm', 'Giao trước thứ 7', 'Chuyển khoản', '{\"4\":\"1\",\"127\":\"1\",\"297\":\"1\"}', 0, 'KRJQTCa5fPxxe', '2024-11-07 02:21:55', '2024-11-07 02:21:55'),
(31, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Ngọc Hà', 'Hồ Hoàn Kiếm', 'Giao trước thứ 7', 'Chuyển khoản', '{\"2\":\"1\",\"301\":\"1\",\"315\":\"1\"}', 0, 'ExGo1TjJjb3i9', '2024-11-07 02:24:25', '2024-11-07 02:24:25'),
(32, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Nam Từ Liêm', 'Phường Xuân Phương', 'Hồ Hoàn Kiếm', 'Giao trước thứ 7', 'Chuyển khoản', '{\"2\":\"1\",\"104\":\"1\",\"275\":\"1\",\"314\":\"1\"}', 0, 'KRdya3pFeTu7c', '2024-11-07 02:25:39', '2024-11-07 02:25:39'),
(33, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Thanh Xuân', 'Phường Khương Mai', 'Hồ Hoàn Kiếm', 'Giao trước thứ 7', 'Chuyển khoản', '{\"2\":\"1\",\"104\":\"1\",\"275\":\"1\",\"314\":\"1\"}', 0, 'mLkeel3bAeHda', '2024-11-07 02:29:03', '2024-11-07 02:29:03'),
(34, 'Hải Nguyễn', '0123456789', 'haithanh0273@gmail.com', 'Tỉnh Lạng Sơn', 'Thành phố Lạng Sơn', 'Phường Hoàng Văn Thụ', 'Nhà Riêng', 'Mai giao', 'Chuyển khoản', '{\"3\":\"1\",\"19\":\"1\",\"161\":\"1\",\"310\":\"1\"}', 0, 'B13Wr04DS9DE7', '2024-11-07 06:54:15', '2024-11-07 06:54:15'),
(35, 'Hải Nguyễn', '02938289191', 'thanhhai020703@gmail.com', 'Tỉnh Yên Bái', 'Thành phố Yên Bái', 'Phường Yên Thịnh', 'Bưu điện', 'Hâm nóng đồ ăn giúp tôi', 'Chuyển khoản', '{\"3\":\"1\",\"19\":\"1\",\"161\":\"1\",\"310\":\"1\"}', 0, 'BrFd1LB1oCUmP', '2024-11-07 06:55:09', '2024-11-07 06:55:09'),
(36, 'Hải Nguyễn', '02938289191', 'thanhhai020703@gmail.com', 'Tỉnh Yên Bái', 'Thành phố Yên Bái', 'Phường Yên Thịnh', 'Bưu điện', 'Hâm nóng đồ ăn giúp tôi', 'Chuyển khoản', '{\"3\":\"1\",\"19\":\"1\",\"161\":\"1\",\"310\":\"1\"}', 0, 'he8IwRhp8zsmD', '2024-11-07 07:32:25', '2024-11-07 07:32:25'),
(37, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Hồ Hoàn Kiếm', 'Hâm nóng đồ ăn giúp tôi', 'Chuyển khoản', '{\"3\":\"1\",\"6\":\"1\",\"155\":\"1\",\"278\":\"2\"}', 0, 'LbZ55FAvfmBye', '2024-11-07 07:34:59', '2024-11-07 07:34:59'),
(38, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Hoàn Kiếm', 'Phường Hàng Mã', 'Hồ Hoàn Kiếm', 'Hâm nóng đồ ăn giúp tôi', 'Chuyển khoản', '{\"3\":\"1\",\"6\":\"1\",\"155\":\"1\",\"278\":\"2\"}', 0, 'uzsB5lt3LMQp9', '2024-11-07 07:37:46', '2024-11-07 07:37:46'),
(39, 'Alex Ferguson', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Hoàn Kiếm', 'Phường Đồng Xuân', 'Hồ Hoàn Kiếm', 'Giao nhanh trước 10 tối', 'Chuyển khoản', '{\"3\":\"1\",\"4\":\"1\",\"6\":\"1\",\"155\":\"1\",\"278\":\"2\"}', 0, '11WQCljbdi8gb', '2024-11-07 08:53:28', '2024-11-07 08:53:28'),
(40, 'Nguyễn Thanh Hải', '0383213703', 'thanhhai020703@gmail.com', 'Tỉnh Hà Giang', 'Thành phố Hà Giang', 'Phường Ngọc Hà', 'Hồ Hoàn Kiếm', 'Giao nhanh trước 10 tối', 'Tiền mặt', '{\"1\":\"1\",\"2\":\"1\",\"10\":\"1\",\"218\":\"1\",\"301\":\"1\",\"315\":\"1\"}', 0, 'uDL6odNobThCZ', '2024-11-09 09:46:01', '2024-11-09 09:46:01'),
(41, 'Nguyễn Thanh Hải', '0383213703', 'thanhhai020703@gmail.com', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Ngọc Hà', 'Hồ Hoàn Kiếm', 'Giao nhanh trước 10 tối', 'Tiền mặt', '{\"3\":\"1\",\"9\":\"1\",\"158\":\"1\",\"277\":\"1\"}', 0, 'LY6WIIsaE5ujI', '2024-11-09 09:48:38', '2024-11-09 09:48:38'),
(42, 'Nguyễn Thanh Hải', '02839829389', 'thanhhai020703@gmail.com', 'Tỉnh Yên Bái', 'Thị xã Nghĩa Lộ', 'Phường Pú Trạng', 'Gần trạm xá', 'Giao nhanh trước 10 tối', 'Tiền mặt', '{\"10\":\"1\",\"131\":\"1\",\"271\":\"6\"}', 0, '0iLmrT0iA1IDM', '2024-11-09 09:50:48', '2024-11-09 09:50:48'),
(43, 'Nguyễn Thanh Hải', '0982970948', 'haithanh0273@gmail.com', 'Tỉnh Cao Bằng', 'Thành phố Cao Bằng', 'Phường Ngọc Xuân', 'Trường THPT Ngô Gia Tự', 'Trước ngày 11/11', 'Tiền mặt', '{\"3\":\"1\",\"8\":\"1\",\"158\":\"4\",\"277\":\"4\"}', 0, 'd6EQ7TEBWqgSr', '2024-11-09 10:05:58', '2024-11-09 10:05:58'),
(44, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0273@gmail.com', 'Tỉnh Hà Giang', 'Huyện Đồng Văn', 'Xã Phố Là', 'Vinhomes Grandpark Quận 9', 'Trước ngày 11/11', 'Tiền mặt', '{\"4\":\"2\",\"9\":\"1\"}', 0, '5ocy3frDTZf1X', '2024-11-09 10:07:31', '2024-11-09 10:07:31'),
(45, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0273@gmail.com', 'Thành phố Hà Nội', 'Quận Long Biên', 'Phường Thượng Thanh', 'Hồ Gươm', 'Không có', 'Chuyển khoản', '{\"8\":\"1\",\"159\":\"1\",\"277\":\"1\",\"278\":\"1\"}', 0, 'Czs7wOlgG9GAJ', '2024-11-09 10:33:07', '2024-11-09 10:33:07'),
(46, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0273@gmail.com', 'Thành phố Hà Nội', 'Quận Tây Hồ', 'Phường Nhật Tân', 'Hồ Gươm', 'Không có', 'Chuyển khoản', '{\"8\":\"1\",\"159\":\"1\",\"277\":\"1\",\"278\":\"1\"}', 0, 'WnVGpQxcwov0M', '2024-11-09 10:33:50', '2024-11-09 10:33:50'),
(47, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0273@gmail.com', 'Thành phố Hà Nội', 'Quận Tây Hồ', 'Phường Nhật Tân', 'Hồ Gươm', 'Không có', 'Chuyển khoản', '{\"8\":\"1\",\"159\":\"1\",\"277\":\"1\",\"278\":\"1\"}', 0, 'ZWQnwUOQpzOLc', '2024-11-09 10:33:51', '2024-11-09 10:33:51'),
(48, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0273@gmail.com', 'Thành phố Hà Nội', 'Quận Hoàn Kiếm', 'Phường Phúc Tân', 'Vinhomes Grandpark Quận 9', 'Trước ngày 11/11', 'Chuyển khoản', '{\"4\":\"1\",\"20\":\"1\",\"103\":\"1\",\"106\":\"6\",\"224\":\"1\",\"301\":\"1\",\"302\":\"6\",\"309\":\"1\"}', 0, 'noIWCmZgPJWvz', '2024-11-13 09:36:31', '2024-11-13 09:36:31'),
(49, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0273@gmail.com', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Vĩnh Phúc', 'Vinhomes Grandpark Quận 9', NULL, 'Chuyển khoản', '{\"4\":\"1\",\"20\":\"1\",\"103\":\"1\",\"106\":\"6\",\"224\":\"1\",\"301\":\"1\",\"302\":\"6\",\"309\":\"1\"}', 0, 'bBxoKssIXHDt0', '2024-11-13 09:37:34', '2024-11-13 09:37:34'),
(50, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0273@gmail.com', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Vĩnh Phúc', 'Vinhomes Grandpark Quận 9', NULL, 'Chuyển khoản', '{\"4\":\"1\",\"20\":\"1\",\"103\":\"1\",\"106\":\"6\",\"224\":\"1\",\"301\":\"1\",\"302\":\"6\",\"309\":\"1\"}', 0, 'JMQboEOHQYEGV', '2024-11-13 09:37:36', '2024-11-13 09:37:36'),
(51, 'Nguyễn Thanh Hải', '0982970948', 'thanhhai.2723@gmail.com', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Kí túc xá sinh viên', 'Giao sớm', 'Tiền mặt', '{\"3\":\"1\",\"4\":\"1\",\"98\":\"1\",\"132\":\"4\",\"133\":\"1\",\"160\":\"1\",\"299\":\"1\"}', 0, 'vH6LwzMAa2jFM', '2024-11-13 09:58:35', '2024-11-13 09:58:35'),
(52, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0273@gmail.com', 'Tỉnh Điện Biên', 'Thị xã Mường Lay', 'Xã Lay Nưa', 'Vinhomes Grandpark Quận 9', 'Giao sớm', 'Tiền mặt', '{\"1\":\"4\",\"2\":\"1\",\"4\":\"1\",\"9\":\"1\"}', 0, 'TZFO3oQ50hGr0', '2024-11-13 10:00:51', '2024-11-13 10:00:51'),
(53, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0273@gmail.com', 'Thành phố Hà Nội', 'Quận Hoàn Kiếm', 'Phường Hàng Mã', 'Vinhomes Grandpark Quận 9', NULL, 'Tiền mặt', '{\"4\":\"3\",\"159\":\"3\"}', 0, 'i2tCfTjxHnkOx', '2024-11-13 10:05:13', '2024-11-13 10:05:13'),
(54, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0273@gmail.com', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Vinhomes Grandpark Quận 9', NULL, 'Chuyển khoản', '{\"9\":\"10\",\"218\":\"1\"}', 0, 'tuzPaigAIS7hD', '2024-11-14 08:50:32', '2024-11-14 08:50:32'),
(55, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0273@gmail.com', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Vinhomes Grandpark Quận 9', NULL, 'Chuyển khoản', '{\"9\":\"10\",\"218\":\"1\"}', 0, 'XpciVL0OGEPUA', '2024-11-14 08:51:19', '2024-11-14 08:51:19'),
(56, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0273@gmail.com', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Vinhomes Grandpark Quận 9', NULL, 'Chuyển khoản', '{\"9\":\"10\",\"218\":\"1\"}', 0, 'leIxrRNuDeSYp', '2024-11-14 08:51:48', '2024-11-14 08:51:48'),
(57, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0273@gmail.com', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Vinhomes Grandpark Quận 9', NULL, 'Chuyển khoản', '{\"3\":\"1\",\"9\":\"1\"}', 0, 'DseU1OJAfx4IO', '2024-11-14 08:52:13', '2024-11-14 08:52:13'),
(58, 'Nguyễn Thanh Hải', '0383213703', 'haithanh0273@gmail.com', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Vinhomes Grandpark Quận 9', NULL, 'Chuyển khoản', '{\"3\":\"1\",\"9\":\"1\"}', 0, 'KHJeBFERyfIF5', '2024-11-14 08:52:14', '2024-11-14 08:52:14'),
(59, 'Phan Thanh Bình', '0193232352', 'bbbbhjjhhh996@gmail.com', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'ABCXYZ', 'Giao sớm nhất có thể', 'Tiền mặt', '{\"2\":\"1\",\"99\":\"1\",\"218\":\"1\",\"297\":\"1\",\"302\":\"1\"}', 0, 'DNXb7vTFqhCUL', '2024-11-21 23:29:43', '2024-11-21 23:29:43'),
(60, 'Nguyễn Trần Tiến Anh', '0383213703', 'anh.nguyen2004@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Vinhomes Grandpark Quận 9', 'Giao sớm', 'Chuyển khoản', '{\"1\":\"1\",\"4\":\"1\",\"9\":\"1\"}', 0, 'cdPgMRbKnxZEn', '2024-11-22 00:18:13', '2024-11-22 00:18:13'),
(61, 'Nguyễn Trần Tiến Anh', '0383213703', 'anh.nguyen2004@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Vinhomes Grandpark Quận 9', 'Giao sớm', 'Tiền mặt', '{\"1\":\"1\",\"4\":\"1\",\"9\":\"1\"}', 0, 'yiQEu1iYz3Erk', '2024-11-22 00:19:15', '2024-11-22 00:19:15'),
(62, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Trúc Bạch', 'Vinhomes Grandpark Quận 9', 'Giao sớm nhất có thể', 'Chuyển khoản', '{\"1\":\"1\",\"4\":\"1\",\"9\":\"1\",\"13\":\"1\",\"350\":\"1\"}', 0, 'vIPYLmxRS2hDK', '2024-11-22 00:28:50', '2024-11-22 00:28:50'),
(63, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Vinhomes Grandpark Quận 9', 'Giao sớm nhất có thể', 'Tiền mặt', '{\"1\":\"1\",\"4\":\"1\",\"9\":\"1\",\"13\":\"1\",\"350\":\"1\"}', 0, 'uHAWscirWEYh3', '2024-11-22 00:29:52', '2024-11-22 00:29:52'),
(64, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Ba Đình', 'Phường Phúc Xá', 'Vinhomes Grandpark Quận 9', 'Giao sớm', 'Chuyển khoản', '{\"4\":\"1\",\"19\":\"1\",\"126\":\"1\"}', 0, 'tDbm45RmVBGi5', '2024-11-22 07:46:35', '2024-11-22 07:46:35'),
(65, 'Nguyễn Thanh Hải', '0383213703', 'hai.nguyenhai2003@hcmut.edu.vn', 'Thành phố Hà Nội', 'Quận Hoàn Kiếm', 'Phường Đồng Xuân', 'Hồ Hoàn Kiếm', 'Giao nhanh trước 10 tối', 'Tiền mặt', '{\"5\":\"2\"}', 0, 'pSnwmirHbF3iO', '2024-12-12 01:50:22', '2024-12-12 01:50:22');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price_sale` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subcategory`, `image`, `name`, `price_sale`, `created_at`, `updated_at`) VALUES
(1, 'FOOD', 'FOOD1', '/storage/images/1730692574-banh-mi-que-pate.webp', '#F101 - Bánh Mì Que Pate', '15000', '2024-11-03 20:56:16', '2024-11-03 20:56:16'),
(2, 'FOOD', 'FOOD1', '/storage/images/1728018644-banh-mi-que-ga-pho-mai.webp', '#F102 - Bánh Mì Que Gà Phô Mai', '15000', '2024-10-03 22:11:02', '2024-10-03 23:22:31'),
(3, 'FOOD', 'FOOD1', '/storage/images/1728018672-banh-mi-que-bo-xot-pho-mai.webp', '#F103 - Bánh Mì Que Bò Xốt Phô Mai', '15000', '2024-10-03 22:11:28', '2024-10-03 23:22:41'),
(4, 'FOOD', 'FOOD1', '/storage/images/1728018725-banh-mi-kep-xa-xiu.webp', '#F104 - Bánh Mì Kẹp Xá Xíu', '25000', '2024-10-03 22:12:20', '2024-10-03 23:22:50'),
(5, 'FOOD', 'FOOD1', '/storage/images/1728018749-banh-mi-kep-ga-teriyaki.webp', '#F105 - Bánh Mì Kẹp Gà Teriyaki', '25000', '2024-10-03 22:12:46', '2024-10-03 23:23:00'),
(6, 'FOOD', 'FOOD1', '/storage/images/1728018771-banh-mi-kep-cha.webp', '#F106 - Bánh Mì Kẹp Chả', '25000', '2024-10-03 22:13:02', '2024-10-03 23:23:10'),
(7, 'FOOD', 'FOOD1', '/storage/images/1730695178-banh-mi-kep-thap-cam.webp', '#F107 - Bánh Mì Kẹp Thập Cẩm', '25000', '2024-11-03 21:39:40', '2024-11-03 21:39:40'),
(8, 'FOOD', 'FOOD1', '/storage/images/1728018908-banh-mi-kep-pate.webp', '#F108 - Bánh Mì Kẹp Pa Tê', '25000', '2024-10-03 22:15:09', '2024-10-03 23:23:32'),
(9, 'FOOD', 'FOOD1', '/storage/images/1731570106-burgerbophomaidacbiet.webp', '#F109 - Burger Bò Phô Mai Đặc Biệt', '56000', '2024-10-03 22:18:47', '2024-11-14 00:42:19'),
(10, 'FOOD', 'FOOD1', '/storage/images/1731570186-doublecheese_bb.png', '#F110 - Burger 2 Lớp Bò, Phô-Mai', '66000', '2024-10-03 22:19:29', '2024-11-14 00:43:33'),
(11, 'FOOD', 'FOOD1', '/storage/images/1731570267-burgerbomienglonphomai.webp', '#F111 - Burger Bò Miếng Lớn Phô-Mai', '79000', '2024-10-03 22:20:16', '2024-11-14 00:44:54'),
(12, 'FOOD', 'FOOD2', '/storage/images/1728019669-banh-bao-chay.jpg', '#F201 - Bánh Bao Chay', '20000', '2024-10-03 22:27:54', '2024-10-03 23:24:32'),
(13, 'FOOD', 'FOOD2', '/storage/images/1728019697-banh-bao-nhan-thti.jpg', '#F202 - Bánh Bao Nhân Thịt', '22000', '2024-10-03 22:28:18', '2024-10-03 23:24:48'),
(14, 'FOOD', 'FOOD2', '/storage/images/1728019722-banh-bao-trung-cut-muoi.jpg', '#F203 - Bánh Bao Trứng Cút Trứng Muôi', '24000', '2024-10-03 22:28:43', '2024-10-03 23:24:58'),
(15, 'FOOD', 'FOOD2', '/storage/images/1728019780-banh-bao-khoai-mon.jpg', '#F204 - Bánh Bao Khoai Môn', '24000', '2024-10-03 22:29:41', '2024-10-03 23:25:08'),
(16, 'FOOD', 'FOOD2', '/storage/images/1728019801-banh-bao-trai-dao.jpg', '#F205 - Bánh Bao Trái Đào', '24000', '2024-10-03 22:30:01', '2024-10-03 23:25:16'),
(17, 'FOOD', 'FOOD2', '/storage/images/1728024132-banh-bao-khong-nhan.jpg', '#F206 - Bánh Bao Không Nhân', '20000', '2024-10-03 23:42:13', '2024-10-04 20:16:16'),
(18, 'DRINK', 'DRINK1', '/storage/images/1728049233-nuoc-tinh-khiet-number-1-thung-500ml.jpg', '#D101 - Nước suối Number 1 chai 500ml', '15000', '2024-10-04 06:42:14', '2024-10-04 20:16:59'),
(19, 'DRINK', 'DRINK1', '/storage/images/1728049393-nuoc-i-on-Life-1.25l.jpg', '#D102 - Nước Ion Life 1.25L', '11000', '2024-10-04 06:43:20', '2024-10-04 20:17:08'),
(20, 'DRINK', 'DRINK1', '/storage/images/1728049412-nuoc-i-on-life-450ml.jpg', '#D103 - Nước Ion Life 450ml', '7000', '2024-10-04 06:44:14', '2024-10-04 20:17:18'),
(21, 'DRINK', 'DRINK1', '/storage/images/1728049467-nuoc-i-on-life-330ml.jpg', '#D104 - Nước Ion Life 330ml', '5000', '2024-10-04 06:44:46', '2024-10-04 20:18:24'),
(22, 'DRINK', 'DRINK1', '/storage/images/1728049500-nuoc-suoi-aquafina-500ml.jpg', '#D105 - Nước suối Aquafina 500ml', '10000', '2024-10-04 06:45:49', '2024-10-04 20:18:34'),
(23, 'DRINK', 'DRINK1', '/storage/images/1728049567-nuoc-suoi-aquafina-355ml.jpg', '#D106 - Nước suối Aquafina 350ml', '7000', '2024-10-04 06:46:26', '2024-10-04 20:18:43'),
(24, 'DRINK', 'DRINK1', '/storage/images/1728049598-vinh-hao-500ml-chai.png', '#D107 - Nước suối Vĩnh Hảo 500ml', '10000', '2024-10-04 06:47:21', '2024-10-04 20:18:55'),
(25, 'DRINK', 'DRINK1', '/storage/images/1728049652-vinh-hao-350ml.png', '#D108 - Nước suối Vĩnh Hảo 350ml', '7000', '2024-10-04 06:47:58', '2024-10-04 20:19:07'),
(26, 'DRINK', 'DRINK1', '/storage/images/1728049690-lavie-500ml-chai.jpg', '#D109 - Nước suối LaVie chai 500ml', '10000', '2024-10-04 06:48:46', '2024-10-04 20:19:19'),
(27, 'DRINK', 'DRINK1', '/storage/images/1728049736-350ml-2.jpg', '#D110 - Nước suối LaVie chai 350ml', '7000', '2024-10-04 06:49:22', '2024-10-04 20:19:31'),
(28, 'DRINK', 'DRINK1', '/storage/images/1728097936-nuoc-tang-luc-number1-330ml.jpg', '#D111 - Nước tăng lực Number 1 330ml', '11000', '2024-10-04 20:12:06', '2024-10-04 20:19:42'),
(29, 'DRINK', 'DRINK1', '/storage/images/1728098122-tra-mat-ong-boncha-vi-tac-chai-450ml.jpg', '#D112 - Trà Mật Ong Boncha Vị Tắc 450ml', '11000', '2024-10-04 20:15:24', '2024-10-04 20:19:51'),
(30, 'DRINK', 'DRINK1', '/storage/images/1728098538-tra-mat-ong-boncha-vi-chanh-450ml.jpg', '#D113 - Trà Mật Ong Boncha Vị Chanh 450ml', '11000', '2024-10-04 20:22:33', '2024-10-04 20:22:47'),
(31, 'DRINK', 'DRINK1', '/storage/images/1728098670-tra-mat-ong-boncha-vi-viet-quat-450ml.jpg', '#D114 - Trà Mật Ong Boncha Vị Việt Quất 450ml', '11000', '2024-10-04 20:24:45', '2024-10-04 20:25:02'),
(32, 'DRINK', 'DRINK1', '/storage/images/1728098769-tra-mat-ong-boncha-vi-o-long-dao-450ml.jpg', '#D115 - Trà Mật Ong Boncha Vị Ô Long Đào 450ml', '11000', '2024-10-04 20:26:42', '2024-10-04 20:26:59'),
(33, 'DRINK', 'DRINK1', '/storage/images/1728099564-nuoc-tang-luc-warrior-huong-dau-330ml.jpg', '#D116 - Nước tăng lực WARRIOR Hương dâu 330ml', '10000', '2024-10-04 20:39:44', '2024-10-04 20:39:44'),
(34, 'DRINK', 'DRINK1', '/storage/images/1728099613-nuoc-tang-luc-warrior-huong-nho-330ml.jpg', '#D117 - Nước tăng lực WARRIR Hương nho 330ml', '10000', '2024-10-04 20:40:16', '2024-10-04 20:40:16'),
(35, 'DRINK', 'DRINK1', '/storage/images/1728100212-hong-tra-vai-c2-455ml.jpg', '#D118 - Hồng trà vải C2 455ml', '12000', '2024-10-04 20:52:36', '2024-10-04 20:52:36'),
(36, 'DRINK', 'DRINK1', '/storage/images/1728100389-hong-tra-dao-c2-455ml.jpg', '#D119 - Hồng trà đào C2 455ml', '12000', '2024-10-04 20:53:17', '2024-10-04 20:53:17'),
(37, 'DRINK', 'DRINK1', '/storage/images/1728100432-tra-xanh-c2-huong-chanh-455ml.jpg', '#D120 - Trà xanh chanh C2 455ml', '12000', '2024-10-04 20:53:56', '2024-10-04 20:53:56'),
(38, 'DRINK', 'DRINK1', '/storage/images/1728100453-tra-xanh-c2-oi-hong-chanh-day-455ml.jpg', '#D121 - Trà xanh C2 ổi hồng chanh dây 455ml', '12000', '2024-10-04 20:54:42', '2024-10-04 20:54:42'),
(39, 'DRINK', 'DRINK1', '/storage/images/1728100522-tra-xanh-huong-chanh-tuyet-bac-ha-c2-freeze-chai-455ml.png', '#D122 - Trà xanh chanh tuyết bạc hà C2 Freeze 455ml', '12000', '2024-10-04 20:55:58', '2024-10-04 20:55:58'),
(40, 'DRINK', 'DRINK1', '/storage/images/1728100912-tra-den-huong-dau-anh-dao-c2-455ml.jpg', '#D123 - Trà đen dâu anh đào C2 455ml', '12000', '2024-10-04 20:57:06', '2024-10-04 21:01:53'),
(41, 'DRINK', 'DRINK1', '/storage/images/1728100642-tra-xanh-c2-huong-chanh-360ml.jpg', '#D124 - Trà xanh chanh C2 360ml', '11000', '2024-10-04 20:58:01', '2024-10-04 20:58:01'),
(42, 'DRINK', 'DRINK1', '/storage/images/1728100703-tra-xanh-c2-huong-tao-360ml.jpg', '#D125 - Trà xanh táo C2 360ml', '11000', '2024-10-04 20:58:55', '2024-10-04 20:58:55'),
(43, 'DRINK', 'DRINK1', '/storage/images/1728100752-tra-den-c2-huong-dao-chai-225ml.jpg', '#D126 - Trà đen vị đào C2 225ml', '8000', '2024-10-04 20:59:59', '2024-10-04 20:59:59'),
(44, 'DRINK', 'DRINK1', '/storage/images/1728100832-tra-xanh-c2-huong-chanh-225ml.jpg', '#D127 - Trà xanh chanh C2 225ml', '8000', '2024-10-04 21:00:33', '2024-10-04 21:02:23'),
(45, 'DRINK', 'DRINK2', '/storage/images/1728104648-bia-tuborg-330ml.jpg', '#D201 - Bia Tuborg 330ml - 4.6%', '15300', '2024-10-04 22:05:14', '2024-10-04 22:49:48'),
(46, 'DRINK', 'DRINK2', '/storage/images/1728104731-thung-24-lon-bia-tuborg-330ml.jpg', '#D202 - Thùng 24 lon bia Tuborg 330ml - 4.6%', '335000', '2024-10-04 22:06:14', '2024-10-04 22:50:13'),
(47, 'DRINK', 'DRINK2', '/storage/images/1728104791-bia-blanc-1664-330ml.jpg', '#D203 - Bia Blanc 1664 330ml - 5%', '20000', '2024-10-04 22:07:04', '2024-10-04 22:50:31'),
(48, 'DRINK', 'DRINK2', '/storage/images/1728104868-thung-24-lon-bia-blanc-1664-330ml.jpg', '#D204 - Thùng 24 lon bia Blanc 1664 330ml - 5%', '410000', '2024-10-04 22:07:54', '2024-10-04 22:50:41'),
(49, 'DRINK', 'DRINK2', '/storage/images/1728104899-bia-budweiser-500ml.jpg', '#D205 - Bia Budweiser 500ml - 5%', '26000', '2024-10-04 22:08:53', '2024-10-04 22:50:55'),
(50, 'DRINK', 'DRINK2', '/storage/images/1728104941-thung-12-lon-bia-budweiser-500ml.jpg', '#D206 - Thùng 12 lon bia Budweiser 500ml - 5%', '315000', '2024-10-04 22:09:44', '2024-10-04 22:51:29'),
(51, 'DRINK', 'DRINK2', '/storage/images/1728105026-bia-huda-330ml.jpg', '#D207 - Bia Huda 330ml - 4.7%', '12600', '2024-10-04 22:10:38', '2024-10-04 22:52:51'),
(52, 'DRINK', 'DRINK2', '/storage/images/1728105058-thung-24-lon-bia-huda-330ml.jpg', '#D208 - Thùng 24 lon bia Huda 330ml - 4.7%', '282000', '2024-10-04 22:11:16', '2024-10-04 22:53:06'),
(53, 'DRINK', 'DRINK2', '/storage/images/1728105087-bia-corona-extra-300ml.jpg', '#D209 - Bia Corona Extra 300ml - 4.5%', '30000', '2024-10-04 22:12:23', '2024-10-04 22:53:25'),
(54, 'DRINK', 'DRINK2', '/storage/images/1728105159-thung-24-chai-bia-corona-extra-300ml.jpg', '#D210 - Thùng 24 chai bia Corona Extra 300ml - 4.5%', '696000', '2024-10-04 22:13:06', '2024-10-04 22:53:58'),
(55, 'DRINK', 'DRINK2', '/storage/images/1728105194-bia-sai-gon-export-premium-330ml.jpg', '#D211 - Bia Sài Gòn Export Premium 330ml - 4.8%', '10700', '2024-10-04 22:21:15', '2024-10-04 22:54:22'),
(56, 'DRINK', 'DRINK2', '/storage/images/1728105688-thung-24-lon-bia-sai-gon-export-premium-330ml.jpg', '#D212 - Thùng 24 lon bia Sài Gòn Export Premium 330ml - 4.8%', '260000', '2024-10-04 22:22:18', '2024-10-04 22:54:37'),
(57, 'DRINK', 'DRINK2', '/storage/images/1728105760-bia-sai-gon-export-330ml.jpg', '#D213 - Bia Sài Gòn Export 330ml - 4.9%', '12600', '2024-10-04 22:23:16', '2024-10-04 22:54:58'),
(58, 'DRINK', 'DRINK2', '/storage/images/1728105801-thung-12-lon-bia-sai-gon-export-330ml.jpg', '#D214 - Thùng 12 lon bia Sài Gòn Export 330ml - 4.9%', '135000', '2024-10-04 22:23:55', '2024-10-04 22:55:21'),
(59, 'DRINK', 'DRINK2', '/storage/images/1728105868-bia-sai-gon-lager-330ml.jpg', '#D215 - Bia Sài Gòn Lager 330ml - 4.3%', '12000', '2024-10-04 22:24:54', '2024-10-04 22:55:59'),
(60, 'DRINK', 'DRINK2', '/storage/images/1728105908-thung-24-lon-bia-sai-gon-lager-330ml.jpg', '#D216 - Thùng 24 lon bia Sài Gòn Lager 330ml - 4.3%', '254000', '2024-10-04 22:25:26', '2024-10-04 22:56:13'),
(61, 'DRINK', 'DRINK2', '/storage/images/1728105936-bia-heineken-bac-330ml.jpg', '#D217 - Bia Heineken Bạc 330ml - 4%', '21000', '2024-10-04 22:26:03', '2024-10-04 22:56:34'),
(62, 'DRINK', 'DRINK2', '/storage/images/1728105991-thung-24-lon-bia-heineken-bac-330ml.jpg', '#D218 - Thùng 24 lon bia Heineken Bạc 330ml - 4%', '442000', '2024-10-04 22:26:34', '2024-10-04 22:56:50'),
(63, 'DRINK', 'DRINK2', '/storage/images/1728106043-bia-tiger-bac-330ml.jpg', '#D219 - Bia Tiger Bạc 330ml - 4.6%', '18800', '2024-10-04 22:27:27', '2024-10-04 22:57:09'),
(64, 'DRINK', 'DRINK2', '/storage/images/1728106054-thung-24-lon-bia-tiger-bac-330ml.jpg', '#D220 - Thùng 24 lon bia Tiger Bạc 330ml - 4.6%', '393000', '2024-10-04 22:27:57', '2024-10-04 22:57:22'),
(65, 'DRINK', 'DRINK2', '/storage/images/1728106085-bia-tiger-lon-cao-330ml.jpg', '#D221 - Bia Tiger lon cao 330ml - 5%', '17500', '2024-10-04 22:34:18', '2024-10-04 22:57:42'),
(66, 'DRINK', 'DRINK2', '/storage/images/1728106475-thung-24-lon-bia-tiger-lon-cao-330ml.jpg', '#D222 - Thùng 24 lon bia Tiger lon cao 330ml - 5%', '350000', '2024-10-04 22:36:15', '2024-10-04 22:57:51'),
(67, 'DRINK', 'DRINK2', '/storage/images/1728106582-bia-budweiser-330ml.jpg', '#D223 - Bia Budweiser 330ml - 5%', '18000', '2024-10-04 22:36:53', '2024-10-04 22:58:06'),
(68, 'DRINK', 'DRINK2', '/storage/images/1728106623-thung-20-lon-bia-budweiser-330ml.jpg', '#D224 - Thùng 20 lon bia Budweiser 330ml - 5%', '292000', '2024-10-04 22:37:27', '2024-10-04 22:58:18'),
(69, 'DRINK', 'DRINK2', '/storage/images/1728106667-bia-heineken-xanh-330ml.jpg', '#D225 - Bia Heineken Xanh 330ml - 5%', '20500', '2024-10-04 22:38:34', '2024-10-04 22:58:38'),
(70, 'DRINK', 'DRINK2', '/storage/images/1728106726-thung-24-lon-bia-heineken-xanh-330ml.jpg', '#D226 - Thùng 24 lon bia Heineken Xanh 330ml - 5%', '445000', '2024-10-04 22:39:23', '2024-10-04 22:59:04'),
(71, 'DRINK', 'DRINK2', '/storage/images/1728106781-bia-sai-gon-xanh-special-330ml.jpg', '#D227 - Bia Sài Gòn Xanh Special 330ml - 4.9%', '16000', '2024-10-04 22:40:25', '2024-10-04 22:59:23'),
(72, 'DRINK', 'DRINK2', '/storage/images/1728106834-thung-24-lon-bia-sai-gon-xanh-special-330ml.jpg', '#D228 - Thùng 24 lon bia Sài Gòn Xanh Special 330ml - 4.9%', '345000', '2024-10-04 22:41:00', '2024-10-04 22:59:36'),
(73, 'DRINK', 'DRINK2', '/storage/images/1728106904-bia-larue-special-330ml.jpg', '#D229 - Bia Larue Special 330ml - 4.7%', '12300', '2024-10-04 22:42:22', '2024-10-04 22:59:59'),
(74, 'DRINK', 'DRINK2', '/storage/images/1728106950-thung-24-lon-bia-larue-special-330ml.jpg', '#D230 - Thùng 24 lon bia Larue Special 330ml - 4.7%', '268000', '2024-10-04 22:43:03', '2024-10-04 23:00:17'),
(75, 'DRINK', 'DRINK2', '/storage/images/1728106990-bia-333-pilsner-extra-smooth-330ml.jpg', '#D231 - Bia 333 Pilsner Extra Smooth 330ml - 4.3%', '14500', '2024-10-04 22:43:56', '2024-10-04 23:00:34'),
(76, 'DRINK', 'DRINK2', '/storage/images/1728107043-thung-24-lon-bia-333-pilsner-extra-smooth-330ml.jpg', '#D232 - Thùng 24 lon bia 333 Pilsner Extra Smooth 330ml - 4.3%', '329000', '2024-10-04 22:44:24', '2024-10-04 23:00:48'),
(77, 'DRINK', 'DRINK2', '/storage/images/1728107082-bia-beck\'s-330ml.jpg', '#D233 - Bia Beck\'s 330ml - 5%', '12700', '2024-10-04 22:44:57', '2024-10-04 23:01:03'),
(78, 'DRINK', 'DRINK2', '/storage/images/1728107100-thung-24-lon-bia-beck\'s-330ml.jpg', '#D234 - Thùng 24 lon bia Beck\'s 330ml - 5%', '265000', '2024-10-04 22:45:23', '2024-10-04 23:01:14'),
(79, 'DRINK', 'DRINK2', '/storage/images/1728107137-bia-red-ruby-330ml.jpg', '#D235 - Bia Red Ruby 330ml - 4.7%', '11800', '2024-10-04 22:45:59', '2024-10-04 23:01:30'),
(80, 'DRINK', 'DRINK2', '/storage/images/1728107167-thung-24-lon-bia-red-ruby-330ml.jpg', '#D236 - Thùng 24 lon Bia Red Ruby 330ml - 4.7%', '219000', '2024-10-04 22:46:29', '2024-10-04 23:01:47'),
(81, 'DRINK', 'DRINK3', '/storage/images/1728108985-strongbow-tao-lon-330ml.jpg', '#D301 - Strongbow táo 330ml - 4.5%', '20500', '2024-10-04 23:16:36', '2024-10-04 23:16:36'),
(82, 'DRINK', 'DRINK3', '/storage/images/1728109016-thung-24-lon-strongbow-tao-330ml.jpg', '#D302 - Thùng 24 lon Strongbow táo 330ml - 4.5%', '450000', '2024-10-04 23:17:28', '2024-10-04 23:17:28'),
(83, 'DRINK', 'DRINK3', '/storage/images/1728109056-strongbow-dau-330ml.jpg', '#D303 - Strongbow dâu 330ml - 4.5%', '20000', '2024-10-04 23:18:17', '2024-10-04 23:18:17'),
(84, 'DRINK', 'DRINK3', '/storage/images/1728109108-thung-24-chai-strongbow-dau-330ml.jpg', '#D304 - Thùng 24 lon Strongbow dâu 330ml - 4.5%', '439000', '2024-10-04 23:19:06', '2024-10-04 23:19:06'),
(85, 'DRINK', 'DRINK3', '/storage/images/1728109171-strongbow-dau-den-330ml.jpg', '#D305 - Strongbow dâu đen 330ml - 4.5%', '20500', '2024-10-04 23:19:38', '2024-10-04 23:24:34'),
(86, 'DRINK', 'DRINK3', '/storage/images/1728109182-thung-24-lon-strongbow-dau-den-330ml.jpg', '#D306 - Thùng 24 lon Strongbow dâu đen 330ml - 4.5%', '450000', '2024-10-04 23:20:08', '2024-10-04 23:24:25'),
(87, 'DRINK', 'DRINK3', '/storage/images/1728109217-strongbow-vi-dao-330ml.jpg', '#D307 - Strongbow vị đào 330ml - 4.5%', '20000', '2024-10-04 23:20:45', '2024-10-04 23:24:16'),
(88, 'DRINK', 'DRINK3', '/storage/images/1728109249-thung-24-lon-strongbow-vi-dao-330ml.jpeg', '#D308 - Thùng 24 lon Strongbow vị đào 330ml - 4.5%', '438000', '2024-10-04 23:21:10', '2024-10-04 23:24:06'),
(89, 'DRINK', 'DRINK3', '/storage/images/1728109334-strongbow-thom-va-luu-320ml.jpg', '#D309 - Strongbow thơm và lựu 320ml - 3.5%', '20500', '2024-10-04 23:22:20', '2024-10-04 23:22:20'),
(90, 'DRINK', 'DRINK3', '/storage/images/1728109346-thung-24-lon-strongbow-thom-va-luu-320ml.jpg', '#D310 - Thùng 24 lon Strongbow thơm và lựu 320ml - 3.5%', '450000', '2024-10-04 23:22:50', '2024-10-04 23:22:50'),
(91, 'DRINK', 'DRINK3', '/storage/images/1728109376-strongbow-kiwi-va-thanh-long-320ml.jpg', '#D311 - Strongbow Kiwi và thanh long 320ml - 3.5%', '20500', '2024-10-04 23:23:23', '2024-10-04 23:23:23'),
(92, 'DRINK', 'DRINK3', '/storage/images/1728109406-thung-24-lon-kiwi-va-thanh-long-320ml.jpg', '#D312 - Thùng 24 lon Strongbow Kiwi và thanh long 320ml - 3.5%', '450000', '2024-10-04 23:23:54', '2024-10-04 23:23:54'),
(93, 'DRINK', 'DRINK3', '/storage/images/1728110243-nuoc-tao-len-men-somersby-330ml.png', '#D313 - Nước táo lên men Somersby 330ml - 4.5%', '21000', '2024-10-04 23:37:26', '2024-10-04 23:37:26'),
(94, 'DRINK', 'DRINK3', '/storage/images/1728110252-nuoc-tao-len-men-somersby-330ml.jpg', '#D314 - Thùng 24 lon nước táo lên men Somersby 330ml - 4.5%', '496000', '2024-10-04 23:37:55', '2024-10-04 23:37:55'),
(95, 'DRINK', 'DRINK3', '/storage/images/1728110279-nuoc-tao-len-men-somersby-blackberry-vi-mam-xoi-lon-330ml.png', '#D315 - Nước táo lên men Somersby Blackberry vị mâm xôi 330ml - 4.5%', '21000', '2024-10-04 23:38:30', '2024-10-04 23:38:30'),
(96, 'DRINK', 'DRINK3', '/storage/images/1728110319-nuoc-tao-len-men-somersby-blackberry-vi-mam-xoi-lon-330ml.jpg', '#D316 - Thùng 24 lon nước táo lên men Somersby Blackberry vị mâm xôi 330ml - 4.5%', '496000', '2024-10-04 23:39:07', '2024-10-04 23:39:07'),
(97, 'VEFR', 'VEFR1', '/storage/images/1728111781-rau-muong-hat-400g.jpg', '#VF101 - Rau muống hạt 400g', '5000', '2024-10-05 00:03:32', '2024-10-05 00:03:32'),
(98, 'VEFR', 'VEFR1', '/storage/images/1728112109-cai-be-dun-400g.jpg', '#VF102 - Cải bẹ dún 400g', '6000', '2024-10-05 00:08:51', '2024-10-05 00:10:17'),
(99, 'VEFR', 'VEFR1', '/storage/images/1728112144-rau-mong-toi-400g.jpg', '#VF103 - Rau mồng tơi 400g', '5000', '2024-10-05 00:09:21', '2024-10-05 00:10:26'),
(100, 'VEFR', 'VEFR1', '/storage/images/1728112244-cai-ngot-400g.jpg', '#VF104 - Cải ngọt 400g', '5000', '2024-10-05 00:11:02', '2024-10-05 00:11:02'),
(101, 'VEFR', 'VEFR1', '/storage/images/1728112279-rau-den-400g.jpg', '#VF105 - Rau dền 400g', '5000', '2024-10-05 00:11:33', '2024-10-05 00:11:33'),
(102, 'VEFR', 'VEFR1', '/storage/images/1728112530-rau-muong-nuoc-400g.jpg', '#VF106 - Rau muống nước 400g', '6600', '2024-10-05 00:16:00', '2024-10-05 00:16:00'),
(103, 'VEFR', 'VEFR1', '/storage/images/1728112563-cai-be-xanh-400G.jpg', '#VF107 - Cải bẹ xanh 400g', '5000', '2024-10-05 00:16:32', '2024-10-05 00:16:32'),
(104, 'VEFR', 'VEFR1', '/storage/images/1728112605-rau-ngot-250g.jpg', '#VF108 - Rau ngót 250g', '8760', '2024-10-05 00:17:11', '2024-10-05 00:17:11'),
(105, 'VEFR', 'VEFR1', '/storage/images/1728112640-rau-ma-200g.jpg', '#VF109 - Rau má 200g', '7980', '2024-10-05 00:17:48', '2024-10-05 00:17:48'),
(106, 'VEFR', 'VEFR1', '/storage/images/1728112691-rau-lang-400g.jpg', '#VF110 - Rau lang 400g', '6600', '2024-10-05 00:18:26', '2024-10-05 00:18:26'),
(107, 'VEFR', 'VEFR1', '/storage/images/1728112716-cai-ngong-400g.jpg', '#VF111 - Cải ngồng 400g', '6600', '2024-10-05 00:18:50', '2024-10-05 00:18:50'),
(108, 'VEFR', 'VEFR1', '/storage/images/1728112744-hanh-la-300g.jpg', '#VF112 - Hành lá 300g', '8400', '2024-10-05 00:19:23', '2024-10-05 00:19:23'),
(109, 'VEFR', 'VEFR1', '/storage/images/1728112772-bong-dien-dien-200g.jpg', '#VF113 - Bông điên điển 200g', '12000', '2024-10-05 00:19:57', '2024-10-05 00:19:57'),
(110, 'VEFR', 'VEFR1', '/storage/images/1728112807-hanh-la-ngo-ri-100g.jpg', '#VF114 - Hành lá và ngò rí 100g', '4800', '2024-10-05 00:20:42', '2024-10-05 00:20:42'),
(111, 'VEFR', 'VEFR1', '/storage/images/1728112849-rau-ram-50g.jpg', '#VF115 - Rau răm 50g', '3000', '2024-10-05 00:21:11', '2024-10-05 00:21:11'),
(112, 'VEFR', 'VEFR1', '/storage/images/1728112878-tieu-xanh-50g.jpg', '#VF116 - Tiêu xanh 50g', '9900', '2024-10-05 00:21:40', '2024-10-05 00:21:40'),
(113, 'VEFR', 'VEFR2', '/storage/images/1728113459-3-trai-dua-xiem-got-vo.jpg', '#VF201 - Ba trái dừa xiêm gọt vỏ (300-400/trái)', '31000', '2024-10-05 00:32:13', '2024-10-05 00:32:13'),
(114, 'VEFR', 'VEFR2', '/storage/images/1728113537-dua-hau-ruot-do.jpg', '#VF202 - Dưa hấu ruột đỏ (2-2.2kg/trái)', '25000', '2024-10-05 00:33:21', '2024-10-05 00:33:21'),
(115, 'VEFR', 'VEFR2', '/storage/images/1728113624-dua-hau-khong-hat.jpg', '#VF203 - Dưa hấu không hạt (Trái từ 2kg trở lên)', '38000', '2024-10-05 00:35:00', '2024-10-05 00:35:00'),
(116, 'VEFR', 'VEFR2', '/storage/images/1728113706-buoi-da-xanh.jpg', '#VF204 - Bưởi da xanh (1.2-1.3kg/trái)', '49000', '2024-10-05 00:35:54', '2024-10-05 00:35:54'),
(117, 'VEFR', 'VEFR2', '/storage/images/1728113775-xoai-tu-quy.jpg', '#VF205 - Xoài tứ quý (Trái từ 400g trở lên)', '35200', '2024-10-05 00:36:53', '2024-10-05 00:36:53'),
(118, 'VEFR', 'VEFR2', '/storage/images/1728113816-xoai-keo.jpg', '#VF206 - Xoài keo (Trái từ 350g trở lên)', '23310', '2024-10-05 00:37:42', '2024-10-05 00:37:42'),
(119, 'VEFR', 'VEFR2', '/storage/images/1728113874-chuoi-su-trai-tu-40g-90g.jpg', '#VF207 - Chuối sứ (40-90g/trái)', '19600', '2024-10-05 00:38:24', '2024-10-05 00:38:24'),
(120, 'VEFR', 'VEFR2', '/storage/images/1728113922-chuoi-cau-trai-tu-80g-180g.jpg', '#VF208 - Chuối cau (80-180g/trái)', '24600', '2024-10-05 00:39:00', '2024-10-05 00:39:00'),
(121, 'VEFR', 'VEFR2', '/storage/images/1728113947-tao-ninh-thuan.jpg', '#VF209 - Táo Ninh Thuận 1kg', '26000', '2024-10-05 00:39:38', '2024-10-05 00:39:38'),
(122, 'VEFR', 'VEFR2', '/storage/images/1728113999-oi-nu-hoang.jpg', '#VF210 - Ổi Nữ hoàng 1kg', '23300', '2024-10-05 00:40:19', '2024-10-05 00:40:19'),
(123, 'VEFR', 'VEFR2', '/storage/images/1728114041-dua-luoi-tron-ruot-cam.jpg', '#VF211 - Dưa lưới tròn ruột cam (1-2kg/trái)', '38000', '2024-10-05 00:41:16', '2024-10-05 00:41:16'),
(124, 'VEFR', 'VEFR2', '/storage/images/1728114087-hong-gion-moc-chau.jpg', '#VF212 - Hồng giòn Mộc Châu 1kg', '55000', '2024-10-05 00:42:03', '2024-10-05 00:42:03'),
(125, 'FROZEN', 'FROZEN1', '/storage/images/1728116568-thit-xay-bo-uc-200g.jpg', '#FR101 - Thịt xay bò Úc Mr.T khay 200g', '35000', '2024-10-05 01:24:46', '2024-10-05 01:24:46'),
(126, 'FROZEN', 'FROZEN1', '/storage/images/1728116696-ba-chi-bo-uc-dong-lanh-300g.jpg', '#FR102 - Ba chỉ bò Úc đông lạnh Mr.T khay 300g', '110000', '2024-10-05 01:25:32', '2024-10-05 01:25:32'),
(127, 'FROZEN', 'FROZEN1', '/storage/images/1728116746-thit-ba-chi-bo-my-thao-tien-foods-goi-300g.png', '#FR103 - Thịt ba chỉ bò Mỹ Thảo Tiến Foods gói 300g', '95000', '2024-10-05 01:26:09', '2024-10-05 01:26:09'),
(128, 'FROZEN', 'FROZEN1', '/storage/images/1728116788-thit-ba-chi-bo-my-cat-cuon-orifood-khay-300g.jpg', '#FR104 - Thịt ba chỉ bò Mỹ cắt cuộn Orifood khay 300g', '112000', '2024-10-05 01:26:58', '2024-10-05 01:26:58'),
(129, 'FROZEN', 'FROZEN1', '/storage/images/1728116836-ca-trung-nguyen-con-tan-hai-hoa-200g.jpg', '#FR105 - Cá trứng nguyên con Tân Hải Hòa khay 200g', '28000', '2024-10-05 01:27:38', '2024-10-05 01:27:38'),
(130, 'FROZEN', 'FROZEN1', '/storage/images/1728116888-vay-ca-hoi-sg-food-goi-500g.png', '#FR106 - Vây cá hồi SG Food gói 500g', '59500', '2024-10-05 01:28:27', '2024-10-05 01:28:27'),
(131, 'FROZEN', 'FROZEN1', '/storage/images/1728116918-thit-ba-roi-bo-thao-tien-foods-khay-300g.png', '#FR107 - Thịt ba rọi bò Thảo Tiến Foods khay 300g', '112000', '2024-10-05 01:29:06', '2024-10-05 01:29:06'),
(132, 'FROZEN', 'FROZEN1', '/storage/images/1731566500-que-surimi-huong-cua-3n-foods-arika-goi-250g-201911281620425577.jpg', '#FR108 - Que surimi hương vị cua Akira 3N Foods gói 250g', '59000', '2024-10-05 01:29:35', '2024-11-13 23:41:42'),
(133, 'FROZEN', 'FROZEN1', '/storage/images/1728116982-hai-san-ngu-sac-sg-food-goi-300g.jpg', '#FR109 - Hải sản ngũ sắc SG Food gói 300g', '48000', '2024-10-05 01:30:04', '2024-10-05 01:30:04'),
(134, 'FROZEN', 'FROZEN2', '/storage/images/1728117148-cha-lua-bi-ot-xiem-xanh-g-kitchen-cay-500g.jpg', '#FR201 - Chả lụa G Kitchen cây 500g', '88500', '2024-10-05 01:33:27', '2024-10-05 01:33:27'),
(135, 'FROZEN', 'FROZEN2', '/storage/images/1728117220-cha-lua-bi-ot-xiem-xanh-g-kitchen-cay-450g.jpg', '#FR202 - Chả lụa bì ớt xiêm xanh G Kitchen cây 450g', '67000', '2024-10-05 01:34:05', '2024-10-05 01:34:05'),
(136, 'FROZEN', 'FROZEN2', '/storage/images/1728117253-cha-lua-bi-ot-xiem-xanh-g-kitchen-cay-200g.png', '#FR203 - Chả lụa bì ớt xiêm xanh G Kitchen cây 200g', '50000', '2024-10-05 01:34:48', '2024-10-05 01:34:48'),
(137, 'FROZEN', 'FROZEN2', '/storage/images/1728117310-cha-lua-bi-ot-xiem-xanh-g-kitchen-cay-50g.jpg', '#FR204 - Chả lụa bì ớt xiêm xanh G Kitchen cây 50g', '14200', '2024-10-05 01:36:01', '2024-10-05 01:36:01'),
(138, 'FROZEN', 'FROZEN2', '/storage/images/1728117381-cha-lua-vi-mala-g-kitchen-cay-50g.jpg', '#FR205 - Chả lụa vị mala G Kitchen cây 50g', '10000', '2024-10-05 01:36:52', '2024-10-05 01:36:52'),
(139, 'FROZEN', 'FROZEN2', '/storage/images/1728117428-gio-thu-le-gourmet-cay-200g.png', '#FR206 - Giò thủ Le Gourmet cây 200g', '34000', '2024-10-05 01:38:52', '2024-10-05 01:38:52'),
(140, 'FROZEN', 'FROZEN2', '/storage/images/1731582629-gio-thu-g-kitchen-cay-475g-202210270922543647.jpg', '#FR207 - Giò thủ G Kitchen cây 475g', '77500', '2024-10-05 01:39:24', '2024-11-14 04:10:30'),
(141, 'FROZEN', 'FROZEN3', '/storage/images/1728117810-xuc-xich-vi-cay-male-top-one-wyn-g-kitchen-180g.jpg', '#FR301 - Xúc xích vị cay mala TOP ONE WYN G Kitchen gói 180g', '18000', '2024-10-05 01:43:58', '2024-10-05 01:51:28'),
(142, 'FROZEN', 'FROZEN3', '/storage/images/1728117846-xuc-xich-ot-xiem-xanh-g-kitchen-200g.jpg', '#FR302 - Xúc xích ớt xiêm xanh G Kitchen gói 200g', '27000', '2024-10-05 01:45:09', '2024-10-05 01:51:36'),
(143, 'FROZEN', 'FROZEN3', '/storage/images/1731583486-xuc-xich-top-one-wyn-g-kitchen-goi-180g-202311041009032576.jpg', '#FR303 - Xúc xích TOP ONE WYN G Kitchen gói 180g', '19000', '2024-10-05 01:45:57', '2024-11-14 04:24:52'),
(144, 'FROZEN', 'FROZEN3', '/storage/images/1731583511-xuc-xich-top-one-wyn-g-kitchen-goi-500g-202311041004532815.jpg', '#FR304 - Xúc xích TOP ONE WYN G Kitchen gói 500g', '39000', '2024-10-05 01:46:26', '2024-11-14 04:25:12'),
(145, 'FROZEN', 'FROZEN3', '/storage/images/1728118001-xuc-xich-xong-khoi-go-soi-meatdeli-goi-225g.jpg', '#FR305 - Xúc xích xông khói gỗ sồi MEATDeli gói 225g', '35000', '2024-10-05 01:49:54', '2024-10-05 01:52:03'),
(146, 'FROZEN', 'FROZEN3', '/storage/images/1728118367-xuc-xich-xong-khoi-truyen-thong-meatdeli-goi-450g.jpg', '#FR306 - Xúc xích xông khói truyền thống MEATDeli gói 450g', '55000', '2024-10-05 01:52:49', '2024-10-05 01:52:49'),
(147, 'FROZEN', 'FROZEN3', '/storage/images/1728118401-xuc-xich-xong-khoi-superwao-meatdeli-goi-450g.jpg', '#FR307 - Xúc xích xông khói Superwao MEATDeli gói 450g', '43000', '2024-10-05 01:53:57', '2024-10-05 01:53:57'),
(148, 'FROZEN', 'FROZEN3', '/storage/images/1728118480-xuc-xich-deli-le-gourmet-goi-200g.jpg', '#FR308 - Xúc xích Deli Le Gourmet gói 200g', '38500', '2024-10-05 01:56:27', '2024-10-05 01:56:27'),
(149, 'FROZEN', 'FROZEN3', '/storage/images/1728118595-xuc-xich-deli-sumo-le-gourmet-goi-500g.jpg', '#FR309 - Xúc xích Deli Sumo Le Gourmet gói 500g', '64500', '2024-10-05 01:57:16', '2024-10-05 01:57:16'),
(150, 'FROZEN', 'FROZEN3', '/storage/images/1728118645-xuc-xich-viet-my-le-gourmet-goi-200g.jpg', '#FR310 - Xúc xích Việt Mỹ Le Gourmet gói 200g', '24000', '2024-10-05 01:57:52', '2024-10-05 01:57:52'),
(151, 'FROZEN', 'FROZEN3', '/storage/images/1731583739-xuc-xich-deli-sumo-le-gourmet-goi-500g-202105071741510110.png', '#FR311 - Xúc xích Việt Mỹ Le Gourmet gói 500g', '58000', '2024-10-05 01:58:26', '2024-11-14 04:29:01'),
(152, 'FROZEN', 'FROZEN3', '/storage/images/1731583818-xuc-xich-cocktail-le-gourmet-goi-200g-201906070953045608.jpeg', '#FR312 - Xúc xích Cocktail Le Gourmet gói 200g', '38500', '2024-10-05 01:59:10', '2024-11-14 04:30:19'),
(153, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728147081-dau-gao-lut-nguyen-chat-simply.jpg', '#C101 - Dầu gạo lứt nguyên chất Simply chai 1 lít', '73000', '2024-10-05 09:52:03', '2024-10-05 09:53:08'),
(154, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1730695732-dau-hat-cai-nguyen-chat-1-lit.jpg', '#C102 - Dầu hạt cải nguyên chất Simply chai 1 lít', '79000', '2024-11-03 21:48:57', '2024-11-03 21:48:57'),
(155, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728147201-dau-dau-nanh-nguyen-chat-simply.jpg', '#C103 - Dầu đậu nành nguyên chất Simply chai 1 lít', '59000', '2024-10-05 09:53:45', '2024-10-05 09:53:45'),
(156, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728147234-dau-dau-nanh-nguyen-chat-simply-2l.jpg', '#C104 - Dầu đậu nành nguyên chất Simply can 2 lít', '116000', '2024-10-05 09:54:15', '2024-10-05 09:54:15'),
(157, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728147258-dau-dau-nanh-nguyen-chat-simply-can-5l.jpg', '#C105 - Dầu đậu nành nguyên chất Simply can 5 lít', '290000', '2024-10-05 09:54:41', '2024-10-05 09:54:41'),
(158, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728147712-dau-me-thom-tuong-an-chai-100ml.png', '#C106 - Dầu mè thơm Tường An chai 100ml', '35000', '2024-10-05 10:02:45', '2024-10-05 10:02:45'),
(159, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728147774-dau-thuc-vat-tuong-an-cooking-oil-chai-250ml.jpg', '#C107 - Dầu thực vật Tường An Cooking Oil chai 250ml', '17000', '2024-10-05 10:03:24', '2024-10-05 10:03:24'),
(160, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728147842-dau-thuc-vat-tuong-an-cooking-oil-400ml.jpg', '#C108 - Dầu thực vật Tường An Cooking Oil chai 400ml', '24500', '2024-10-05 10:04:20', '2024-10-05 10:04:20'),
(161, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728147877-dau-thuc-vat-tuong-an-cooking-oil-chai-1L.jpg', '#C109 - Dầu thực vật Tường An Cooking Oil chai 1 lít', '59000', '2024-10-05 10:04:56', '2024-10-05 10:04:56'),
(162, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728147904-dau-thuc-vat-tuong-an-cooking-oil-can-2-lit.png', '#C110 - Dầu thực vật Tường An Cooking Oil can 2 lít', '118000', '2024-10-05 10:05:32', '2024-10-05 10:05:32'),
(163, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728147938-dau-thuc-vat-tuong-an-cooking-oil-can-5-lit.png', '#C111 - Dầu thực vật Tường An Cooking Oil can 5 lít', '255000', '2024-10-05 10:06:09', '2024-10-05 10:06:09'),
(164, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728148047-dau-dau-nanh-100-nguyen-chat-tuong-an-chai-400ml.jpg', '#C112 - Dầu đậu nành 100% nguyên chất Tường An chai 400ml', '37000', '2024-10-05 10:07:48', '2024-10-05 10:07:48'),
(165, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728148072-dau-dau-nanh-100-nguyen-chat-tuong-an-chai-1-lit.jpg', '#C113 - Dầu đậu nành 100% nguyên chất Tường An chai 1 lít', '64500', '2024-10-05 10:08:16', '2024-10-05 10:08:16'),
(166, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728148100-dau-dau-nanh-100-nguyen-chat-tuong-an-can-2-lit.png', '#C114 - Dầu đậu nành 100% nguyên chất Tường An can 2 lít', '117000', '2024-10-05 10:08:44', '2024-10-05 10:08:44'),
(167, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728148160-dau-gac-cho-be-vio-extra-tuong-an-chai-250ml.jpg', '#C115 - Dầu gấc cho bé Vio Extra Tường An chai 250ml', '51500', '2024-10-05 10:09:41', '2024-10-05 10:09:41'),
(168, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728148194-dau-me-thom-hao-hang-meizan-250ml.jpg', '#C116 - Dầu mè thơm hảo hạng Meizan chai 250ml', '59000', '2024-10-05 10:10:17', '2024-10-05 10:10:17'),
(169, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728148224-dau-dau-nanh-meizan-1l.jpg', '#C117 - Dầu đậu nành Meizan chai 1 lít', '68000', '2024-10-05 10:11:02', '2024-10-05 10:11:02'),
(170, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728148275-dau-dau-nanh-meizan-2l.jpg', '#C118 - Dầu đậu nành Meizan can 2 lít', '136000', '2024-10-05 10:11:31', '2024-10-05 10:11:31'),
(171, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728148294-dau-dau-nanh-meizan-5l.jpg', '#C119 - Dầu đậu nành Meizan can 5 lít', '239000', '2024-10-05 10:11:58', '2024-10-05 10:11:58'),
(172, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728148336-dau-an-cao-cap-meizan-gold-1l.jpg', '#C120 - Dầu ăn cao cấp Meizan Gold chai 1 lít', '47000', '2024-10-05 10:12:40', '2024-10-05 10:12:40'),
(173, 'CONDIMENT', 'CONDIMENT1', '/storage/images/1728148363-dau-an-cao-cap-meizan-gold-2l.jpg', '#C121 - Dầu ăn cao cấp Meizan Gold can 2 lít', '104000', '2024-10-05 10:13:04', '2024-10-05 10:13:04'),
(174, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728200579-gia-vi-hoan-chinh-dang-xot-ga-chien-nuoc-mam-chinsu-goi-70g.jpg', '#C201 - Gia vị hoàn chỉnh dạng xốt gà chiên nước mắm Chinsu gói 70g', '8600', '2024-10-06 00:43:44', '2024-10-06 00:43:44'),
(175, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728200629-gia-vi-hoan-chinh-dang-xot-ga-chien-nuoc-mam-chinsu-hop-700g-10-goi-x-70g.jpg', '#C202 - Gia vị hoàn chỉnh dạng xốt gà chiên nước mắm Chinsu hộp 700g (10 gói)', '70500', '2024-10-06 00:44:31', '2024-10-06 00:44:31'),
(176, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728200681-gia-vi-hoan-chinh-dang-xot-thit-kho-chinsu-goi-70g.jpg', '#C203 - Gia vị hoàn chỉnh dạng xốt thịt kho Chinsu gói 70g', '8600', '2024-10-06 00:45:08', '2024-10-06 00:45:08'),
(177, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728200726-gia-vi-hoan-chinh-dang-xot-thit-kho-trung-chinsu-hop-700g-10-goi-x-70g.jpg', '#C204 - Gia vị hoàn chỉnh dạng xốt thịt kho Chinsu hộp 700g (10 gói)', '72000', '2024-10-06 00:45:46', '2024-10-06 00:45:46'),
(178, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728200761-xot-gia-vi-nem-san-thit-nuong-chinsu-goi-80g.jpg', '#C205 - Xốt gia vị nêm sẵn thịt nướng Chinsu gói 80g', '12000', '2024-10-06 00:46:32', '2024-10-06 00:46:32'),
(179, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728200820-xot-uop-nuong-vi-pho-mai-chinsu-80g.jpg', '#C206 - Xốt ướp nướng vị phô mai Chinsu gói 80g', '12000', '2024-10-06 00:47:18', '2024-10-06 00:47:18'),
(180, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728200865-xot-nha-hang-thit-nuong-muoi-ot-80g.jpg', '#C207 - Xốt nhà hàng thịt nướng muối ớt Chinsu gói 80g', '12000', '2024-10-06 00:48:00', '2024-10-06 00:48:00'),
(181, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728200890-xot-gia-vi-nem-san-lau-thai-chinsu-goi-180g.jpg', '#C208 - Xốt gia vị nêm sẵn lẩu Thái Chinsu gói 180g', '30000', '2024-10-06 00:48:33', '2024-10-06 00:48:33'),
(182, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728200983-kho-quet-nam-ngu-200g.jpg', '#C209 - Kho quẹt Nam Ngư hũ 200g', '36000', '2024-10-06 00:49:58', '2024-10-06 00:49:58'),
(183, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728201007-xot-uop-thit-nuong-cholimex-goi-70g.jpeg', '#C210 - Xốt ướp thịt nướng Cholimex gói 70g', '8200', '2024-10-06 00:50:49', '2024-10-06 00:50:49'),
(184, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728201057-xot-uop-thit-nuong-cholimex-hu-200g.jpg', '#C211 - Xốt ướp thịt nướng Cholimex hũ 200g', '22500', '2024-10-06 00:51:33', '2024-10-06 00:51:33'),
(185, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728201103-gia-vi-uop-xa-xiu-cholimex-goi-70g.jpeg', '#C212 - Gia vị ướp xá xíu Cholimex gói 70g', '8400', '2024-10-06 00:52:05', '2024-10-06 00:52:05'),
(186, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728201198-xot-ga-chien-nuoc-mam-cholimex-goi-90g.jpg', '#C213 - Xốt gà chiên nước mắm Cholimex gói 90g', '9200', '2024-10-06 00:53:19', '2024-10-06 00:53:19'),
(187, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728201208-sot-suon-xao-chua-ngot-cholimex-goi-90g.jpg', '#C214 - Xốt sườn xào chua ngọt Cholimex gói 90g', '12000', '2024-10-06 00:53:52', '2024-10-06 00:53:52'),
(188, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728201240-xot-bun-bo-cholimex-goi-90g.jpg', '#C215 - Xốt nấu bún bò Cholimex gói 90g', '10500', '2024-10-06 00:54:29', '2024-10-06 00:54:29'),
(189, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728201280-xot-bo-kho-cholimex-goi-90g.jpg', '#C216 - Xốt nấu bò kho Cholimex gói 90g', '10500', '2024-10-06 00:55:01', '2024-10-06 00:55:01'),
(190, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728201338-lau-thai-cholimex-chai-280g.jpeg', '#C217 - Sốt lẩu Thái Cholimex chai 280g', '19900', '2024-10-06 00:55:45', '2024-10-06 00:55:45'),
(191, 'CONDIMENT', 'CONDIMENT2', '/storage/images/1728201352-xot-lau-kim-chi-cholimex-chai-280g.jpg', '#C218 - Xốt lẩu kim chi Cholimex chai 280g', '32000', '2024-10-06 00:56:11', '2024-10-06 00:56:11'),
(192, 'CONDIMENT', 'CONDIMENT3', '/storage/images/1728221898-nuoc-mam-chinsu-ca-com-bien-dong-20-do-dam-chai-720ml.jpg', '#C301 - Nước mắm Chinsu cá cơm biển đông 25 độ đạm chai 720ml', '59000', '2024-10-06 06:38:47', '2024-10-06 06:38:47'),
(193, 'CONDIMENT', 'CONDIMENT3', '/storage/images/1728221940-nuoc-mam-huong-ca-hoi-hao-hang-chinsu-12-do-dam-chai-500ml.jpg', '#C302 - Nước mắm hương cá hồi hảo hạng Chinsu 20 độ đạm chai 500ml', '50500', '2024-10-06 06:39:14', '2024-10-06 06:39:14'),
(194, 'CONDIMENT', 'CONDIMENT3', '/storage/images/1728222152-nuoc-mam-nam-ngu-ca-com-tuoi-32-do.jpg', '#C303 - Nước mắm Nam Ngư cá cơm tươi 32 độ đạm chai 500ml', '65000', '2024-10-06 06:42:49', '2024-10-06 06:42:49'),
(195, 'CONDIMENT', 'CONDIMENT3', '/storage/images/1728222183-nuoc-mam-nam-ngu-nhan-vang-14-do-dam-chai-650ml.png', '#C304 - Nước mắm Nam Ngư nhãn vàng 14 độ đạm chai 650ml', '50500', '2024-10-06 06:43:22', '2024-10-06 06:43:22'),
(196, 'CONDIMENT', 'CONDIMENT3', '/storage/images/1728222218-nuoc-mam-nam-ngu-10-do-dam-chai-500ml.png', '#C305 - Nước mắm cá cơm Nam Ngư 12 độ đạm chai 500ml', '37500', '2024-10-06 06:44:24', '2024-10-06 06:44:24'),
(197, 'CONDIMENT', 'CONDIMENT3', '/storage/images/1728222283-nuoc-mam-nam-ngu-ca-com-tuoi-10-do-dam-chai-750ml.png', '#C306 - Nước mắm cá cơm Nam Ngư 12 độ đạm chai 750ml', '52500', '2024-10-06 06:45:02', '2024-10-06 06:45:02'),
(198, 'CONDIMENT', 'CONDIMENT3', '/storage/images/1728222334-nuoc-mam-nam-ngu-10-do-dam-chai-900ml.jpg', '#C307 - Nước mắm cá cơm Nam Ngư 12 độ đạm chai 900ml', '61000', '2024-10-06 06:45:54', '2024-10-06 06:45:54'),
(199, 'CONDIMENT', 'CONDIMENT3', '/storage/images/1728222359-nuoc-cham-chua-ngot-nam-ngu-ot-toi-ly-son-chai-300ml.jpg', '#C308 - Nước chấm chua ngọt Nam Ngư ớt tỏi Lý Sơn chai 300ml', '35000', '2024-10-06 06:46:29', '2024-10-06 06:46:29'),
(200, 'CONDIMENT', 'CONDIMENT3', '/storage/images/1728222395-nuoc-cham-nam-ngu-sieu-tiet-kiem-can-1-8-lit.jpg', '#C309 - Nước chấm Nam Ngư Siêu Tiết Kiệm can 1,8 lít', '23000', '2024-10-06 06:47:03', '2024-10-06 06:47:03'),
(201, 'CONDIMENT', 'CONDIMENT4', '/storage/images/1728222555-sot-me-chua-ngot-dh-foods-chai-200g.jpg', '#C401 - Sốt me chua ngọt Dh Foods chai 200g', '23000', '2024-10-06 06:49:39', '2024-10-06 06:49:39'),
(202, 'CONDIMENT', 'CONDIMENT4', '/storage/images/1728222622-sot-tieu-den-dh-foods-chai-200g.jpg', '#C402 - Sốt tiêu đen Dh Foods chai 200g', '23000', '2024-10-06 06:50:24', '2024-10-06 06:50:24'),
(203, 'CONDIMENT', 'CONDIMENT4', '/storage/images/1728222637-sot-trung-muoi-dh-foods-chai-100g.jpg', '#C403 - Sốt trứng muối Dh Foods chai 100g', '30000', '2024-10-06 06:50:53', '2024-10-06 06:50:53'),
(204, 'CONDIMENT', 'CONDIMENT4', '/storage/images/1728222847-sot-pho-mai-dh-foods-chai-100g.jpg', '#C404 - Sốt phô mai Dh Foods chai 100g', '30000', '2024-10-06 06:54:24', '2024-10-06 06:54:24'),
(205, 'CONDIMENT', 'CONDIMENT4', '/storage/images/1728222868-sot-kim-quat-dh-foods-chai-200g.jpg', '#C405 - Sốt kim quất Dh Foods chai 200g', '30000', '2024-10-06 06:54:59', '2024-10-06 06:54:59'),
(206, 'CONDIMENT', 'CONDIMENT4', '/storage/images/1728222904-muoi-ot-chanh-nha-trang-dh-foods-chai-200g.jpg', '#C406 - Muối ớt chanh Nha Trang Dh Foods chai 200g', '22000', '2024-10-06 06:55:28', '2024-10-06 06:55:28'),
(207, 'CONDIMENT', 'CONDIMENT4', '/storage/images/1728222977-muoi-ot-kim-quat-guyumi-chai-200g.jpg', '#C407 - Muối ớt Kim Quất Guyumi chai 200g', '17500', '2024-10-06 06:56:40', '2024-10-06 06:56:40'),
(208, 'CONDIMENT', 'CONDIMENT4', '/storage/images/1728223003-muoi-ot-chanh-guyumi-chai-200g.jpg', '#C408 - Muối ớt chanh Guyumi chai 200g', '17900', '2024-10-06 06:57:06', '2024-10-06 06:57:06'),
(209, 'CONDIMENT', 'CONDIMENT5', '/storage/images/1728223050-tuong-ot-cholimex-chai-270g.jpg', '#C501 - Tương ớt Cholimex chai nhựa 270g', '11800', '2024-10-06 06:58:05', '2024-10-06 06:58:05'),
(210, 'CONDIMENT', 'CONDIMENT5', '/storage/images/1728223088-tuong-ot-cholimex-cay-nong-chai-270g-2.jpg', '#C502 - Tương ớt cay nồng Cholimex chai 270g', '13000', '2024-10-06 06:58:37', '2024-10-06 06:58:37'),
(211, 'CONDIMENT', 'CONDIMENT5', '/storage/images/1728223123-tuong-ot-cholimex-830gam-2.jpg', '#C503 - Tương ớt Cholimex chai 830g', '30000', '2024-10-06 06:58:59', '2024-10-06 06:58:59'),
(212, 'CONDIMENT', 'CONDIMENT5', '/storage/images/1728223146-tuong-den-pho-230g-2.jpg', '#C504 - Tương đen phở Cholimex chai 230g', '9700', '2024-10-06 06:59:32', '2024-10-06 06:59:32'),
(213, 'CONDIMENT', 'CONDIMENT5', '/storage/images/1728223179-tuong-den-cholimex-230g.jpg', '#C505 - Tương đen Cholimex chai 230g', '10000', '2024-10-06 07:00:03', '2024-10-06 07:00:03'),
(214, 'CONDIMENT', 'CONDIMENT5', '/storage/images/1728223213-tuong-hot-cholimex-250g.jpg', '#C506 - Tương hột Cholimex hũ 250g', '11300', '2024-10-06 07:00:28', '2024-10-06 07:00:28'),
(215, 'CONDIMENT', 'CONDIMENT5', '/storage/images/1728223230-tuong-ot-xi-muoi-cholimex-chai-270g.jpg', '#C507 - Tương ớt chua ngọt Cholimex chai thủy tinh 270g', '14500', '2024-10-06 07:01:19', '2024-10-06 07:01:19'),
(216, 'CONDIMENT', 'CONDIMENT5', '/storage/images/1728223286-tuong-ot-chua-ngot-270g.jpg', '#C508 - Tương ớt chua ngọt Cholimex chai thủy tinh 270g', '14500', '2024-10-06 07:01:49', '2024-10-06 07:01:49'),
(217, 'PERCARE', 'PERCARE1', '/storage/images/1728306225-dau-goi-nuoc-hoa-clear-men-deep-ocean-sach-gau-sach-nhon-huong-phong-lu-va-go-dan-huong-588ml.jpg', '#PC101 - Dầu gội nước hoa Clear Men Warm Forest hương phong lữ và gỗ đàn hương 588ml', '198000', '2024-10-06 08:54:45', '2024-10-07 06:03:46'),
(218, 'PERCARE', 'PERCARE1', '/storage/images/1728230093-dau-goi-nuoc-hoa-clear-men-deep-ocean-sach-gau-huong-gio-bien-va-ho-phach-588ml.jpg', '#PC102 - Dầu gội nước hoa Clear Men Deep Ocean hương gió biển và hổ phách 588ml', '198000', '2024-10-06 08:56:06', '2024-10-06 08:56:06'),
(219, 'PERCARE', 'PERCARE1', '/storage/images/1728230208-dau-goi-clear-9-thao-duoc-co-truyen-330ml.jpg', '#PC103 - Dầu gội Clear 9 thảo dược cổ truyền 330ml', '85000', '2024-10-06 08:57:18', '2024-10-06 08:57:18'),
(220, 'PERCARE', 'PERCARE1', '/storage/images/1728230277-dau-goi-sach-gau-clear-9-thao-duoc-co-truyen-giam-gay-rung-618ml.jpg', '#PC104 - Dầu gội Clear 9 thảo dược cổ truyền 618ml', '172500', '2024-10-06 08:57:59', '2024-10-06 08:57:59'),
(221, 'PERCARE', 'PERCARE1', '/storage/images/1728230288-dau-goi-clear-48-gio-sach-gau-ngua-612ml.jpg', '#PC105 - Dầu gội Clear 48 giờ 612ml', '187000', '2024-10-06 08:59:01', '2024-10-06 08:59:01'),
(222, 'PERCARE', 'PERCARE1', '/storage/images/1728230348-dau-goi-clear-48-gio-sach-gau-ngua-854ml.jpg', '#PC106 - Dầu gội Clear 48 giờ 854ml', '192800', '2024-10-06 08:59:37', '2024-10-06 08:59:37'),
(223, 'PERCARE', 'PERCARE1', '/storage/images/1728230386-dau-goi-sach-gau-clear-mat-lanh-bac-ha-165ml.jpg', '#PC107 - Dầu gội sạch gàu Clear mát lạnh bạc hà 165ml', '68500', '2024-10-06 09:00:39', '2024-10-06 09:00:39'),
(224, 'PERCARE', 'PERCARE1', '/storage/images/1728230464-dau-goi-sach-gau-clear-mat-lanh-bac-ha-330ml.jpg', '#PC108 - Dầu gội sạch gàu Clear mát lạnh bạc hà 330ml', '120000', '2024-10-06 09:01:35', '2024-10-06 09:01:35'),
(225, 'PERCARE', 'PERCARE1', '/storage/images/1728230502-dau-goi-sach-gau-clear-mat-lanh-bac-ha-680ml.jpg', '#PC109 - Dầu gội sạch gàu Clear mát lạnh bạc hà 680ml', '167500', '2024-10-06 09:02:18', '2024-10-06 09:02:18'),
(226, 'PERCARE', 'PERCARE1', '/storage/images/1728230588-dau-goi-sach-gau-clear-mat-lanh-bac-ha-854ml.jpg', '#PC110 - Dầu gội sạch gàu Clear mát lạnh bạc hà 854ml', '191600', '2024-10-06 09:03:11', '2024-10-06 09:03:11'),
(227, 'PERCARE', 'PERCARE1', '/storage/images/1728230598-dau-goi-sach-gau-clear-mat-lanh-bac-ha-136-lit.jpg', '#PC111 - Dầu gội sạch gàu Clear mát lạnh bạc hà 1.36 lít', '370000', '2024-10-06 09:04:02', '2024-10-06 09:04:02'),
(228, 'PERCARE', 'PERCARE1', '/storage/images/1728230697-dau-goi-sach-gau-clear-thao-duoc-618ml.jpg', '#PC112 - Dầu gội Clear Botanique 9 loại thảo dược 618ml', '152200', '2024-10-06 09:05:38', '2024-10-06 09:05:38'),
(229, 'PERCARE', 'PERCARE1', '/storage/images/1728230743-dau-goi-sach-gau-clear-thao-duoc-quy-882ml.jpg', '#PC113 - Dầu gội Clear Botanique 9 loại thảo dược 882ml', '260000', '2024-10-06 09:06:08', '2024-10-06 09:06:08'),
(230, 'PERCARE', 'PERCARE1', '/storage/images/1728230779-dau-goi-sach-gau-clear-men-cool-sport-bac-ha-330ml.jpg', '#PC114 - Dầu gội sạch gàu Clear Men Cool Sport bạc hà 330ml', '129000', '2024-10-06 09:07:02', '2024-10-06 09:07:02'),
(231, 'PERCARE', 'PERCARE1', '/storage/images/1728230827-dau-goi-clear-men-cool-sport-bac-ha-mat-lanh-874ml.jpg', '#PC115 - Dầu gội Clear Men Cool Sport bạc hà mát lạnh 874ml', '249000', '2024-10-06 09:07:36', '2024-10-06 09:07:36'),
(232, 'PERCARE', 'PERCARE1', '/storage/images/1728230860-dau-goi-sunsilk-ong-muot-rang-ngoi-165ml.jpg', '#PC116 - Dầu gội Sunsilk óng mượt rạng ngời 165ml', '50000', '2024-10-06 09:08:48', '2024-10-06 09:08:48'),
(233, 'PERCARE', 'PERCARE1', '/storage/images/1728230937-dg-sunsilk-den-o-ng-muot-rang-ngo-i-330ml.jpg', '#PC117 - Dầu gội Sunsilk óng mượt rạng ngời 311ml', '88000', '2024-10-06 09:09:45', '2024-10-06 09:09:45'),
(234, 'PERCARE', 'PERCARE1', '/storage/images/1728230992-dau-goi-sunsilk-ong-muot-rang-ngoi-631ml.jpg', '#PC118 - Dầu gội Sunsilk óng mượt rạng ngời 631ml', '140800', '2024-10-06 09:10:24', '2024-10-06 09:10:24'),
(235, 'PERCARE', 'PERCARE1', '/storage/images/1728231029-dau-goi-sunsilk-ong-muot-rang-ngoi-874ml.jpg', '#PC119 - Dầu gội Sunsilk óng mượt rạng ngời 874ml', '153700', '2024-10-06 09:10:55', '2024-10-06 09:10:55'),
(236, 'PERCARE', 'PERCARE1', '/storage/images/1728231112-dau-goi-sunsilk-mem-muot-dieu-ky-165ml.jpg', '#PC120 - Dầu gội Sunsilk mềm mượt diệu kỳ 165ml', '50000', '2024-10-06 09:13:50', '2024-10-06 09:13:50'),
(237, 'PERCARE', 'PERCARE1', '/storage/images/1728231234-dau-goi-sunsilk-mem-muot-dieu-ky-311ml.jpg', '#PC121 - Dầu gội Sunsilk mềm mượt diệu kỳ 311ml', '88000', '2024-10-06 09:14:15', '2024-10-06 09:14:15'),
(238, 'PERCARE', 'PERCARE1', '/storage/images/1728231259-dau-goi-sunsilk-mem-muot-dieu-ky-631ml.jpg', '#PC122 - Dầu gội Sunsilk mềm mượt diệu kỳ 631ml', '140800', '2024-10-06 09:14:44', '2024-10-06 09:14:44'),
(239, 'PERCARE', 'PERCARE1', '/storage/images/1728231289-dau-goi-sunsilk-mem-muot-dieu-ky-874ml.jpg', '#PC123 - Dầu gội Sunsilk mềm mượt diệu kỳ 874ml', '153700', '2024-10-06 09:15:15', '2024-10-06 09:15:15'),
(240, 'PERCARE', 'PERCARE2', '/storage/images/1728231367-dx-sunsilk-den-ong-muot-rang-ngoi-327ml.jpg', '#PC201 - Dầu xả Sunsilk óng mượt rạng ngời 327ml', '88000', '2024-10-06 09:16:51', '2024-10-06 09:16:51'),
(241, 'PERCARE', 'PERCARE2', '/storage/images/1728231416-dau-xa-sunsilk-ong-muot-rang-ngoi-653ml.jpg', '#PC202 - Dầu xả Sunsilk óng mượt rạng ngời 653ml', '119700', '2024-10-06 09:17:24', '2024-10-06 09:17:24'),
(242, 'PERCARE', 'PERCARE2', '/storage/images/1728231484-dx-sunsilk-xanh-la-duong-dai-muot-320l.jpg', '#PC203 - Dầu xả Sunsilk mềm mượt diệu kỳ 327ml', '88000', '2024-10-06 09:18:24', '2024-10-06 09:18:24'),
(243, 'PERCARE', 'PERCARE2', '/storage/images/1728231525-dau-xa-sunsilk-mem-muot-dieu-ky-653ml.jpg', '#PC204 - Dầu xả Sunsilk mềm mượt diệu kỳ 653ml', '122700', '2024-10-06 09:18:58', '2024-10-06 09:18:58'),
(244, 'PERCARE', 'PERCARE2', '/storage/images/1728231557-dau-xa-pantene-3-phut-dieu-ki-ngan-rung-toc-150ml.jpg', '#PC205 - Dầu xả Pantene 3 phút diệu kì ngăn rụng tóc 150ml', '57000', '2024-10-06 09:19:51', '2024-10-06 09:19:51'),
(245, 'PERCARE', 'PERCARE2', '/storage/images/1728231620-dau-xa-pantene-3p-ki-dieu-330ml.jpg', '#PC206 - Dầu xả Pantene 3 phút diệu kì ngăn rụng tóc 300ml', '122000', '2024-10-06 09:20:26', '2024-10-06 09:20:26'),
(246, 'PERCARE', 'PERCARE2', '/storage/images/1728231655-dau-xa-pantene-pro-v-3-phut-dieu-ki-duong-chat-ngan-rung-toc-300ml.jpg', '#PC207 - Dầu xả Pantene Pro-V 3 phút diệu kì dưỡng chất ngăn rụng tóc 300ml', '97000', '2024-10-06 09:21:18', '2024-10-06 09:21:18'),
(247, 'PERCARE', 'PERCARE2', '/storage/images/1728231988-kem-xa-pantene-3-phut-dieu-ki-phuc-hoi-hu-ton-150ml.jpg', '#PC208 - Kem xả Pantene 3 phút diệu kì phục hồi hư tổn 150ml', '57000', '2024-10-06 09:26:51', '2024-10-06 09:26:51'),
(248, 'PERCARE', 'PERCARE2', '/storage/images/1728232049-dau-xa-pantene-3-p-dieu-ki-phuc-hoi-hu-ton-300ml.jpg', '#PC209 - Dầu xả Pantene 3 phút diệu kì phục hồi hư tổn 300ml', '92000', '2024-10-06 09:27:42', '2024-10-06 09:27:42'),
(249, 'PERCARE', 'PERCARE3', '/storage/images/1728232172-bo-2-ban-chai-danh-rang-p-s-4d-sach-sau.jpg', '#PC301 - Bộ 2 bàn chải đánh răng P/S 4D sạch sâu', '78000', '2024-10-06 09:29:59', '2024-10-06 09:29:59'),
(250, 'PERCARE', 'PERCARE3', '/storage/images/1728232214-bo-5-ban-chai-danh-rang-p-s-long-to-mem-mai.jpg', '#PC302 - Bộ 5 bàn chải đánh răng P/S Lông tơ mềm mại', '69000', '2024-10-06 09:30:34', '2024-10-06 09:30:34'),
(251, 'PERCARE', 'PERCARE3', '/storage/images/1728232238-bo-3-ban-chai-danh-rang-p-s-than-bac-khang-khuan-999-voi-long-to-sieu-manh.jpg', '#PC303 - Bộ 3 bàn chải đánh răng P/S than bạc kháng khuẩn 99.9% với lông tơ siêu mảnh', '78000', '2024-10-06 09:31:10', '2024-10-06 09:31:10'),
(252, 'PERCARE', 'PERCARE3', '/storage/images/1728232294-bo-2-ban-chai-danh-rang-p-s-muoi-tre-sieu-mem.jpg', '#PC304 - Bộ 2 bàn chải đánh răng P/S Muối tre trắng răng', '47000', '2024-10-06 09:31:47', '2024-10-06 09:31:47'),
(253, 'PERCARE', 'PERCARE3', '/storage/images/1728232314-bo-3-ban-chai-danh-rang-p-s-long-to-mem-mai.jpg', '#PC305 - Bộ 3 bàn chải đánh răng P/S lông tơ mềm mại', '40000', '2024-10-06 09:32:24', '2024-10-06 09:32:24');
INSERT INTO `products` (`id`, `category`, `subcategory`, `image`, `name`, `price_sale`, `created_at`, `updated_at`) VALUES
(254, 'PERCARE', 'PERCARE3', '/storage/images/1728232363-bcdr-p-s-long-to-sieu-mem-muoi-tre-2.jpg', '#PC306 - Bàn chải đánh răng P/S muối tre tự nhiên giúp làm trắng răng và chăm sóc nướu', '31500', '2024-10-06 09:33:31', '2024-10-06 09:33:31'),
(255, 'PERCARE', 'PERCARE3', '/storage/images/1728232433-ban-chai-danh-rang-p-s-khang-khuan-than-bac-2-cay-2.jpg', '#PC307 - Bộ 2 bàn chải đánh răng P/S kháng khuẩn charcoal', '57500', '2024-10-06 09:34:15', '2024-10-06 09:34:15'),
(256, 'PERCARE', 'PERCARE3', '/storage/images/1728232557-ban-chai-danh-rang-p-s-khang-khuan-than-bac-2.jpg', '#PC308 - Bàn chải đánh răng P/S kháng khuẩn charcoal', '32000', '2024-10-06 09:36:14', '2024-10-06 09:36:14'),
(257, 'PERCARE', 'PERCARE3', '/storage/images/1728232602-p-s-ban-chai-long-to-mem-mai-2.jpg', '#PC309 - Bàn chải đánh răng P/S lông tơ mềm mại', '19500', '2024-10-06 09:37:03', '2024-10-06 09:37:03'),
(258, 'PERCARE', 'PERCARE3', '/storage/images/1728232635-p-s-ban-chai-long-to-mem-mai-2-36-bo-2.jpg', '#PC310 - Bộ 2 bàn chải đánh răng P/S lông tơ mềm mại', '34000', '2024-10-06 09:37:35', '2024-10-06 09:37:35'),
(259, 'PERCARE', 'PERCARE4', '/storage/images/1728232711-kem-danh-rang-colgate-natural-muoi-180g.jpg', '#PC401 - Kem đánh răng Colgate Natural muối Himalaya sáng khoẻ 180g', '43500', '2024-10-06 09:39:11', '2024-10-06 09:39:11'),
(260, 'PERCARE', 'PERCARE4', '/storage/images/1728232754-kem-danh-rang-colgate-natural-tra-xanh-180g.jpg', '#PC402 - Kem đánh răng Colgate Natural trà xanh 180g', '49000', '2024-10-06 09:39:45', '2024-10-06 09:39:45'),
(261, 'PERCARE', 'PERCARE4', '/storage/images/1728232799-bo-kem-danh-rang-va-ban-chai-danh-rang-colgate-muoi-than-hoat-tinh-150g.jpg', '#PC403 - Bộ kem đánh răng và bàn chải đánh răng Colgate muối than hoạt tính 150g', '26000', '2024-10-06 09:40:29', '2024-10-06 09:40:29'),
(262, 'PERCARE', 'PERCARE4', '/storage/images/1728232839-kem-danh-rang-colgate-maxfresh-tinh-chat-than-tre-200g.jpg', '#PC404 - Kem đánh răng Colgate MaxFresh tinh chất than tre 200g', '42000', '2024-10-06 09:41:10', '2024-10-06 09:41:10'),
(263, 'PERCARE', 'PERCARE4', '/storage/images/1728232885-kem-danh-rang-colgate-maxfresh-tinh-chat-than-tre-90g.png', '#PC405 - Kem đánh răng Colgate MaxFresh tinh chất than tre 90g', '21000', '2024-10-06 09:41:41', '2024-10-06 09:41:41'),
(264, 'PERCARE', 'PERCARE4', '/storage/images/1728232916-bo-2-kem-danh-rang-colgate-maxfresh-huong-bac-ha-350g.jpg', '#PC406 - Bộ 2 kem đánh răng Colgate MaxFresh hương bạc hà 350g', '58500', '2024-10-06 09:42:38', '2024-10-06 09:42:38'),
(265, 'PERCARE', 'PERCARE4', '/storage/images/1728232990-kem-danh-rang-colgate-maxfresh-huong-bac-ha-180g.jpg', '#PC407 - Kem đánh răng Colgate MaxFresh hương bạc hà 180g', '42000', '2024-10-06 09:43:45', '2024-10-06 09:43:45'),
(266, 'PERCARE', 'PERCARE4', '/storage/images/1728233042-kem-danh-rang-colgate-thien-nhien-than-tre-va-bac-ha-180g.jpg', '#PC408 - Kem đánh răng Colgate Thiên Nhiên than tre và bạc hà 180g', '58000', '2024-10-06 09:44:26', '2024-10-06 09:44:26'),
(267, 'PERCARE', 'PERCARE4', '/storage/images/1728233078-kem-danh-rang-colgate-muoi-thao-duoc-canxi-flour-250g.jpg', '#PC409 - Kem đánh răng Colgate muối thảo dược Canxi + Flour 225g', '42000', '2024-10-06 09:45:14', '2024-10-06 09:45:14'),
(268, 'PERCARE', 'PERCARE4', '/storage/images/1728233138-kem-danh-rang-colgate-maxfresh-tinh-the-cuc-the-mat-230g.jpg', '#PC410 - Kem đánh răng Colgate MaxFresh tinh thể cực the mát 230g', '41500', '2024-10-06 09:45:58', '2024-10-06 09:45:58'),
(269, 'PERCARE', 'PERCARE4', '/storage/images/1728233169-kem-danh-rang-colgate-sensitive-pro-110g.jpg', '#PC411 - Kem đánh răng Colgate Sensitive Pro Relief Complete Protection 110g', '53000', '2024-10-06 09:46:27', '2024-10-06 09:46:27'),
(270, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728268316-nuoc-lau-san-sunlight-tinh-dau-thao-moc-huong-lavender-chai-997ml.jpg', '#HC101 - Nước lau sàn Sunlight tinh dầu thảo mộc hương lavender chai 1kg', '33000', '2024-10-06 19:33:03', '2024-10-06 19:33:03'),
(271, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728268398-nuoc-lau-san-sunlight-tinh-dau-thao-moc-huong-lavender-tui-36kg.jpg', '#HC102 - Nước lau sàn Sunlight tinh dầu thảo mộc hương lavender túi 3.6kg', '78000', '2024-10-06 19:33:34', '2024-10-06 19:33:34'),
(272, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728268433-nuoc-lau-san-sunlight-tinh-dau-thao-moc-huong-lavender-can-36kg.jpg', '#HC103 - Nước lau sàn Sunlight tinh dầu thảo mộc hương lavender can 3.6kg', '94000', '2024-10-06 19:34:12', '2024-10-06 19:34:12'),
(273, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728268476-nuoc-lau-san-sunlight-tinh-dau-thao-moc-huong-chanh-yuzu-va-sa-chai-1kg.jpg', '#HC104 - Nước lau sàn Sunlight bioshield hương chanh yuzu và sả chai 1kg', '38000', '2024-10-06 19:34:59', '2024-10-06 19:34:59'),
(274, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728268507-nuoc-lau-san-sunlight-tinh-dau-thao-moc-huong-chanh-yuzu-va-sa-tui-2kg.jpg', '#HC105 - Nước lau sàn Sunlight bioshield hương chanh yuzu và sả túi 2kg', '52500', '2024-10-06 19:35:27', '2024-10-06 19:35:27'),
(275, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728268537-nuoc-lau-san-sunlight-tinh-dau-thao-moc-huong-hoa-lily-va-huong-thao-chai-1kg.jpg', '#HC106 - Nước lau sàn Sunlight tinh dầu thảo mộc hương hoa lily và hương thảo chai 1kg', '33000', '2024-10-06 19:36:08', '2024-10-06 19:36:08'),
(276, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728268582-nuoc-lau-nha-sunlight-tinh-dau-thao-moc-huong-hoa-lily-va-huong-thao-tui-2kg.jpg', '#HC107 - Nước lau sàn Sunlight tinh dầu thảo mộc hương hoa lily và hương thảo túi 2kg', '46000', '2024-10-06 19:36:36', '2024-10-06 19:36:36'),
(277, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728268609-nuoc-lau-san-sunlight-tinh-dau-thao-moc-huong-hoa-ha-va-bac-ha-tui-36kg.jpg', '#HC108 - Nước lau sàn Sunlight tinh dầu thảo mộc hương hoa lily và hương thảo túi 3.6kg', '59000', '2024-10-06 19:37:15', '2024-10-06 19:37:15'),
(278, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728270387-nuoc-lau-san-sunlight-tinh-dau-thao-moc-huong-hoa-lily-va-huong-thao-can-36kg.jpg', '#HC109 - Nước lau sàn Sunlight tinh dầu thảo mộc hương hoa lily và hương thảo can 3.6kg', '93000', '2024-10-06 20:06:55', '2024-10-06 20:06:55'),
(279, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728270450-nuoc-lau-san-sunlight-tinh-dau-thao-moc-huong-hoa-ha-va-bac-ha-chai-1kg.jpg', '#HC110 - Nước lau sàn Sunlight tinh dầu thảo mộc hương hoa hạ và bạc hà chai 1kg', '33000', '2024-10-06 20:07:46', '2024-10-06 20:07:46'),
(280, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728270514-nuoc-lau-san-sunlight-tinh-dau-thao-moc-huong-hoa-ha-va-bac-ha-tui-36kg.jpg', '#HC111 - Nước lau sàn Sunlight tinh dầu thảo mộc hương hoa hạ và bạc hà túi 3.6kg', '59000', '2024-10-06 20:08:41', '2024-10-06 20:08:41'),
(281, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728270547-nuoc-lau-san-sunlight-tinh-dau-thao-moc-huong-hoa-ha-va-bac-ha-can-36kg.jpg', '#HC112 - Nước lau sàn Sunlight tinh dầu thảo mộc hương hoa hạ và bạc hà can 3.6kg', '93000', '2024-10-06 20:09:15', '2024-10-06 20:09:15'),
(282, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728270579-nuoc-lau-san-gift-huong-bac-ha-chai-1-lit.jpg', '#HC113 - Nước lau sàn Gift hương bạc hà chai 985g', '34000', '2024-10-06 20:10:05', '2024-10-06 20:10:05'),
(283, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728270627-nuoc-lau-san-gift-huong-hoa-lily-chai-1-lit.jpg', '#HC114 - Nước lau sàn Gift hương hoa lily chai 985g', '34000', '2024-10-06 20:10:46', '2024-10-06 20:10:46'),
(284, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728270676-nuoc-lau-san-lix-huong-nang-ha-can-4-lit.jpg', '#HC115 - Nước lau sàn Lix hương nắng hạ can 3.6 lít', '65000', '2024-10-06 20:11:40', '2024-10-06 20:11:40'),
(285, 'HOUCARE', 'HOUSECARE1', '/storage/images/1728270707-nuoc-lau-nha-lix-2x-dam-dac-can-4-lit.jpg', '#HC116 - Nước lau sàn Lix 2x đậm đặc can 3.6 lít', '65000', '2024-10-06 20:12:17', '2024-10-06 20:12:17'),
(286, 'HOUCARE', 'HOUSECARE2', '/storage/images/1728270802-tui-5-vi-treo-ve-sinh-vim-275g.jpg', '#HC201 - Túi 5 vỉ treo vệ sinh bồn cầu VIM Power 5 hương hoa oải hương 275g', '125000', '2024-10-06 20:13:54', '2024-10-06 20:13:54'),
(287, 'HOUCARE', 'HOUSECARE2', '/storage/images/1728270837-gel-tay-bon-cau-va-nha-tam-vim-trang-sang-mui-diu-nhe-huong-lavender-880ml.jpg', '#HC202 - Gel tẩy bồn cầu và nhà tắm VIM trắng sáng mùi dịu nhẹ hương lavender chai 870ml', '34000', '2024-10-06 20:14:22', '2024-10-06 20:14:22'),
(288, 'HOUCARE', 'HOUSECARE2', '/storage/images/1728270868-vien-treo-bon-cau-vim-power-huong-chanh-vi-55g.jpg', '#HC203 - Viên treo bồn cầu VIM Power 5 hương chanh vỉ 55g', '25000', '2024-10-06 20:15:27', '2024-10-06 20:15:27'),
(289, 'HOUCARE', 'HOUSECARE2', '/storage/images/1728270938-vien-treo-bon-cau-vim-power-huong-tra-xanh-va-chanh-vang-vi-55g.jpg', '#HC204 - Viên treo bồn cầu VIM Power 5 hương trà xanh và chanh vàng vỉ 55g', '25000', '2024-10-06 20:15:59', '2024-10-06 20:15:59'),
(290, 'HOUCARE', 'HOUSECARE2', '/storage/images/1728270966-gel-tay-bon-cau-va-nha-tam-vim-trang-sang-mui-diu-nhe-huong-chanh-sa-880ml.jpg', '#HC205 - Gel tẩy bồn cầu và nhà tắm VIM trắng sáng mùi dịu nhẹ hương chanh sả chai 870ml', '34000', '2024-10-06 20:16:32', '2024-10-06 20:16:32'),
(291, 'HOUCARE', 'HOUSECARE2', '/storage/images/1728270999-vien-ve-sinh-bon-cau-vim-huong-lavender-vi-55g.jpg', '#HC206 - Viên treo bồn cầu VIM Power 5 hương hoa oải hương 55g', '25000', '2024-10-06 20:17:08', '2024-10-06 20:17:08'),
(292, 'HOUCARE', 'HOUSECARE2', '/storage/images/1728271041-nuoc-tay-bon-cau-nha-tam-vim-diet-khuan-500ml.jpg', '#HC207 - Nước tẩy bồn cầu & nhà tắm VIM diệt khuẩn 500ml', '25000', '2024-10-06 20:17:57', '2024-10-06 20:17:57'),
(293, 'HOUCARE', 'HOUSECARE2', '/storage/images/1728271087-vim-ve-sinh-zero-xanh-750ml.jpg', '#HC208 - Nước tẩy bồn cầu VIM Zero hương chanh 750ml', '30000', '2024-10-06 20:18:24', '2024-10-06 20:18:24'),
(294, 'HOUCARE', 'HOUSECARE2', '/storage/images/1728271111-nuoc-tay-bon-cau-nha-tam-vim-diet-khuan-880ml.jpg', '#HC209 - Nước tẩy bồn cầu & nhà tắm VIM diệt khuẩn xanh biển chai 880ml', '34000', '2024-10-06 20:18:56', '2024-10-06 20:18:56'),
(295, 'ELECT', 'ELECT1', '/storage/images/1728271816-greencell-extra-heavy-duty-aa-2vien.webp', '#EL101 - Vỉ 2 Pin Tiểu GP Greencell Extra Heavy Duty AA 1.5V - GP 15G-2U2', '14080', '2024-10-06 20:30:43', '2024-10-06 20:30:43'),
(296, 'ELECT', 'ELECT1', '/storage/images/1728271845-vi-4-pin-tieu-greencell-extra-heavy-duty.webp', '#EL102 - Vỉ 4 Pin Tiểu GP Greencell Extra Heavy Duty AA 1.5V - GP 15G-2U4', '24640', '2024-10-06 20:31:12', '2024-10-06 20:31:12'),
(297, 'ELECT', 'ELECT1', '/storage/images/1728271997-2-gp-super-alkaline-battery.webp', '#EL103 - Vỉ 2 Pin Đũa GP Super Alkaline Battery AAA 1.5V - GP 24A-2U2', '29040', '2024-10-06 20:33:26', '2024-10-06 20:33:26'),
(298, 'ELECT', 'ELECT1', '/storage/images/1728272010-4-gp-alkaline-battery.webp', '#EL104 - Vỉ 4 Pin Đũa GP Super Alkaline Battery AAA 1.5V - GP 24A-2U4', '56320', '2024-10-06 20:33:51', '2024-10-06 20:33:51'),
(299, 'ELECT', 'ELECT1', '/storage/images/1728272191-2-gp-supercell-super-heavy-duty.webp', '#EL105 - Vỉ 2 Pin Tiểu GP Supercell Super Heavy Duty AA - GP 15PL-2S2', '8360', '2024-10-06 20:36:53', '2024-10-06 20:36:53'),
(300, 'ELECT', 'ELECT1', '/storage/images/1728272217-4-cp-supercell-super-heavy-duty.webp', '#EL106 - Vỉ 4 Pin Tiểu GP Supercell Super Heavy Duty AA - GP 15PL-2S4', '16720', '2024-10-06 20:37:19', '2024-10-06 20:37:19'),
(301, 'ELECT', 'ELECT1', '/storage/images/1728272312-2-maxell-aa-super-power-ace.webp', '#EL107 - Vỉ 2 Pin Maxell AA Super Power Ace', '10800', '2024-10-06 20:39:39', '2024-10-06 20:39:39'),
(302, 'ELECT', 'ELECT1', '/storage/images/1728272411-4-pin-Maxell-AA-Super-Power-Ace.webp', '#EL108 - Vỉ 4 Pin Maxell AA Super Power Ace', '16565', '2024-10-06 20:40:37', '2024-10-06 20:40:37'),
(303, 'ELECT', 'ELECT1', '/storage/images/1728272599-10-pin-maxell-ag10.webp', '#EL109 - Vỉ 10 Pin Nút Maxell AG10', '22785', '2024-10-06 20:43:20', '2024-10-06 20:43:20'),
(304, 'ELECT', 'ELECT1', '/storage/images/1728272639-10-maxell-ag13.webp', '#EL110 - Vỉ 10 Pin Nút Maxell AG13', '22785', '2024-10-06 20:44:16', '2024-10-06 20:44:16'),
(305, 'ELECT', 'ELECT2', '/storage/images/1728272851-o-cam0dien-quang.webp', '#EL201 - Ổ Cắm Điện Quang ĐQ 001A-01-2M (6 Lỗ 2 Chấu Dây 2 Mét)', '215000', '2024-10-06 20:47:53', '2024-10-06 20:47:53'),
(306, 'ELECT', 'ELECT2', '/storage/images/1730696279-phich_cam_wifi_thong_minh_ea4d9132119345f18f755a289edbd39b_master.webp', '#EL202 - Phích Cắm Thông Minh Điện Quang Apollo ĐQ SP1.1 01 WiFi (Kiểu 1 lỗ, sử dụng WiFi)', '201876', '2024-11-03 21:58:00', '2024-11-03 21:58:00'),
(307, 'ELECT', 'ELECT2', '/storage/images/1728273003-phich-cam-dien.webp', '#EL203 - Phích Cắm Chuyển Đa Chiều ĐQ EPC NK-803-K (Màu Xanh)', '59640', '2024-10-06 20:50:04', '2024-10-06 20:50:04'),
(308, 'SNACK', 'SNACK1', '/storage/images/1728303605-snack-khoai-tay-vi-kim-chi-han-quoc-ostar-goi-30g.jpg', '#SN101 - Snack khoai tây vị kim chi Hàn Quốc O\'Star gói 32g', '6000', '2024-10-07 05:20:34', '2024-10-07 05:20:34'),
(309, 'SNACK', 'SNACK1', '/storage/images/1728303640-snack-khoai-tay-vi-kim-chi-han-quoc-ostar-goi-63g.jpg', '#SN102 - Snack khoai tây vị kim chi Hàn Quốc O\'Star gói 55g', '12000', '2024-10-07 05:21:12', '2024-10-07 05:21:12'),
(310, 'SNACK', 'SNACK1', '/storage/images/1728303680-snack-khoai-tay-vị-kim-chi-o-star-105g.jpg', '#SN103 - Snack khoai tây vị kim chi Hàn Quốc O\'Star gói 105g', '22000', '2024-10-07 05:21:44', '2024-10-07 05:21:44'),
(311, 'SNACK', 'SNACK1', '/storage/images/1728303708-snack-khoai-tay-vi-tao-bien-ostar-goi-32g.jpg', '#SN104 - Snack khoai tây vị tảo biển O\'Star gói 32g', '6000', '2024-10-07 05:22:19', '2024-10-07 05:22:19'),
(312, 'SNACK', 'SNACK1', '/storage/images/1728303743-snack-khoai-tay-vi-tao-bien-ostar-goi-63g.jpg', '#SN105 - Snack khoai tây vị tảo biển O\'Star gói 55g', '12000', '2024-10-07 05:22:55', '2024-10-07 05:22:55'),
(313, 'SNACK', 'SNACK1', '/storage/images/1728303795-snack-khoai-tay-vi-tao-bien-o-star-105g.jpg', '#SN106 - Snack khoai tây vị tảo biển O\'Star gói 105g', '22000', '2024-10-07 05:23:26', '2024-10-07 05:23:26'),
(314, 'SNACK', 'SNACK1', '/storage/images/1728303813-snack-bap-vi-pho-mai-oishi-goi-32g.jpg', '#SN107 - Snack bắp vị phô mai Oishi gói 32g', '6000', '2024-10-07 05:24:07', '2024-10-07 05:24:07'),
(315, 'SNACK', 'SNACK1', '/storage/images/1728303854-snack-tom-cay-dac-biet-oishi-goi-32g.jpg', '#SN108 - Snack tôm cay đặc biệt Oishi gói 32g', '6000', '2024-10-07 05:24:41', '2024-10-07 05:24:41'),
(316, 'SNACK', 'SNACK1', '/storage/images/1728303888-snack-vi-tom-cay-oishi-goi-32g.jpg', '#SN109 - Snack vị tôm cay Oishi gói 32g', '6000', '2024-10-07 05:25:19', '2024-10-07 05:25:19'),
(317, 'SNACK', 'SNACK1', '/storage/images/1728303930-snack-phong-muc-oishi-indo-chips-goi-32g.jpg', '#SN110 - Snack phồng mực Oishi Indo Chips gói 32g', '6000', '2024-10-07 05:25:54', '2024-10-07 05:25:54'),
(319, 'SNACK', 'SNACK1', '/storage/images/1728304000-snack-hanh-oishi-orion-rings-goi-32g.jpg', '#SN112 - Snack hành Oishi Onion Rings gói 32g', '6000', '2024-10-07 05:27:08', '2024-10-07 05:27:08'),
(320, 'SNACK', 'SNACK1', '/storage/images/1728304069-snack-ca-chua-oishi-tomati-goi-32g.jpg', '#SN113 - Snack cà chua Oishi Tomati gói 32g', '6000', '2024-10-07 05:28:13', '2024-10-07 05:28:13'),
(321, 'SNACK', 'SNACK1', '/storage/images/1728304102-snack-chay-vi-da-heo-quay-oishi-martys-goi-32g.jpg', '#SN114 - Snack chay vị da heo quay Oishi Marty\'s gói 32g', '6000', '2024-10-07 05:28:43', '2024-10-07 05:28:43'),
(322, 'SNACK', 'SNACK1', '/storage/images/1728304135-snack-bap-ngot-oishi-goi-32g.jpg', '#SN115 - Snack bắp ngọt Oishi gói 32g', '6000', '2024-10-07 05:29:13', '2024-10-07 05:29:13'),
(323, 'SNACK', 'SNACK1', '/storage/images/1728304159-snack-bi-do-vi-bo-nuong-oishi-goi-32g.jpg', '#SN116 - Snack bí đỏ vị bò nướng Oishi gói 32g', '6000', '2024-10-07 05:30:02', '2024-10-07 05:30:02'),
(324, 'SNACK', 'SNACK2', '/storage/images/1728304290-keo-deo-keo-marshmallow-chupa-chups-24g.jpg', '#SN201 - Kẹo dẻo hương trái cây Chupa Chups Sour Belts gói 24g', '6000', '2024-10-07 05:31:31', '2024-10-07 05:31:31'),
(325, 'SNACK', 'SNACK2', '/storage/images/1728304299-keo-deo-huong-trai-cay-chupa-chups-sour-belts-goi-56g.jpg', '#SN202 - Kẹo dẻo hương trái cây Chupa Chups Sour Belts gói 56g', '15400', '2024-10-07 05:32:01', '2024-10-07 05:32:01'),
(326, 'SNACK', 'SNACK2', '/storage/images/1728304333-keo-deo-huong-hon-hop-chupa-chups-5-mix-goi-90g.jpg', '#SN203 - Kẹo dẻo hương hỗn hợp Chupa Chups 5 Mix gói 90g', '20000', '2024-10-07 05:32:36', '2024-10-07 05:32:36'),
(327, 'SNACK', 'SNACK2', '/storage/images/1728304363-keo-deo-chupa-chups-sanded-crawler-goi-90g-.jpg', '#SN204 - Kẹo dẻo Chupa Chups Sanded crawler gói 90g', '23000', '2024-10-07 05:33:18', '2024-10-07 05:33:18'),
(328, 'SNACK', 'SNACK2', '/storage/images/1728304403-keo-deo-huong-trai-cay-tong-hop-chupa-chups-panda-bears-goi-90g.jpg', '#SN205 - Kẹo dẻo hương trái cây tổng hợp Chupa Chups Panda Bears gói 90g', '20000', '2024-10-07 05:33:53', '2024-10-07 05:33:53'),
(329, 'SNACK', 'SNACK2', '/storage/images/1728304452-keo-deo-chupa-chups-cool-goi-90g.jpg', '#SN206 - Kẹo dẻo Chupa Chups Cool gói 90g', '20000', '2024-10-07 05:34:34', '2024-10-07 05:34:34'),
(330, 'SNACK', 'SNACK2', '/storage/images/1728304514-keo-deo-chupa-chups-mini-crawler-goi-56g.jpg', '#SN207 - Kẹo dẻo Chupa Chups Mini Crawler gói 56g', '14400', '2024-10-07 05:35:27', '2024-10-07 05:35:27'),
(331, 'SNACK', 'SNACK3', '/storage/images/1728304551-keo-the-sieu-mat-lanh-play-more-hu-22g.jpg', '#SN301 - Kẹo the siêu mát lạnh Play More hũ 22g', '32000', '2024-10-07 05:36:17', '2024-10-07 05:36:17'),
(332, 'SNACK', 'SNACK3', '/storage/images/1728304580-keo-the-vi-nho-play-more-hu-22g.jpg', '#SN302 - Kẹo the vị nho Play More hũ 22g', '32000', '2024-10-07 05:36:50', '2024-10-07 05:36:50'),
(333, 'SNACK', 'SNACK3', '/storage/images/1728304615-keo-the-vi-tao-xanh-play-more-hu-22g.jpeg', '#SN303 - Kẹo the vị táo xanh Play More hũ 22g', '32000', '2024-10-07 05:37:16', '2024-10-07 05:37:16'),
(334, 'SNACK', 'SNACK3', '/storage/images/1728304640--keo-the-dua-hau-play-more-22g.jpg', '#SN304 - Kẹo the vị dưa hấu Play More hũ 22g', '32000', '2024-10-07 05:37:39', '2024-10-07 05:37:39'),
(335, 'SNACK', 'SNACK3', '/storage/images/1728304663-vien-ngam-khong-duong-doublemint-huong-cam-hop-238g.jpg', '#SN305 - Viên ngậm không đường DoubleMint hương cam hộp 23.8g', '30000', '2024-10-07 05:38:11', '2024-10-07 05:38:11'),
(336, 'SNACK', 'SNACK3', '/storage/images/1728304698-keo-ngam-dm-peppermint-tuyp-35-vien-2.jpg', '#SN306 - Viên ngậm không đường DoubleMint hương bạc hà hộp 23.8g', '30000', '2024-10-07 05:38:42', '2024-10-07 05:38:42'),
(337, 'SNACK', 'SNACK3', '/storage/images/1728304726-keo-nhai-huong-bac-ha-doublemint-hop-80g.jpg', '#SN307 - Kẹo nhai hương bạc hà DoubleMint hộp 80g', '44500', '2024-10-07 05:39:11', '2024-10-07 05:39:11'),
(338, 'SNACK', 'SNACK3', '/storage/images/1728304769-keo-himalaya-salt-mint-lemon-goi-15g-2.jpg', '#SN308 - Kẹo bạc hà chanh muối Himalaya Salt gói 15g', '6500', '2024-10-07 05:39:57', '2024-10-07 05:39:57'),
(339, 'SNACK', 'SNACK4', '/storage/images/1728305355-banh-bong-lan-kieu-au-orion-opera-vi-socola-hop-168g-6-cai.jpg', '#SN401 - Bánh mềm kiểu âu Orion Opéra vị socola hộp 168g (6 cái)', '34000', '2024-10-07 05:49:34', '2024-10-07 05:49:34'),
(340, 'SNACK', 'SNACK4', '/storage/images/1728305377-banh-bouchee-lotte-chocolat-socola-162g.jpg', '#SN402 - Bánh bouchee Lotte Chocolat socola hộp 162g (6 cái)', '30500', '2024-10-07 05:50:07', '2024-10-07 05:50:07'),
(341, 'SNACK', 'SNACK4', '/storage/images/1728305432-banh-socola-pie-lotte-chocolat-hop-1698g-6-cai.jpg', '#SN403 - Bánh socola pie Lotte Chocolat hộp 169.8g (6 cái)', '30500', '2024-10-07 05:50:34', '2024-10-07 05:50:34'),
(342, 'SNACK', 'SNACK4', '/storage/images/1728305449-banh-oreo-pie-socola-dau-hop-180g-6-cai.jpg', '#SN404 - Bánh Oreo Pie socola dâu hộp 180g (6 cái)', '39000', '2024-10-07 05:51:03', '2024-10-07 05:51:03'),
(343, 'SNACK', 'SNACK4', '/storage/images/1728305487-banh-socola-pie-oreo-cadbury-hop-180g.jpg', '#SN405 - Bánh Oreo Cadbury socola hộp 180g', '36500', '2024-10-07 05:51:40', '2024-10-07 05:51:40'),
(344, 'SNACK', 'SNACK4', '/storage/images/1728305506-banh-chocopie-orion-dark-vi-ca-cao-hop-180g-6-cai.jpg', '#SN406 - Bánh chocopie Orion Dark vị ca cao hộp 180g (6 cái)', '33000', '2024-10-07 05:52:15', '2024-10-07 05:52:15'),
(345, 'SNACK', 'SNACK4', '/storage/images/1728305552-banh-choco-pie-hop-198g-6-cai.jpg', '#SN407 - Bánh chocopie Orion hộp 198g (6 cái)', '33000', '2024-10-07 05:52:47', '2024-10-07 05:52:47'),
(346, 'SNACK', 'SNACK4', '/storage/images/1728305585-banh-choco-pie-hop-396g-12-cai.jpg', '#SN408 - Bánh chocopie Orion hộp 396g (12 cái)', '55500', '2024-10-07 05:53:18', '2024-10-07 05:53:18'),
(347, 'SNACK', 'SNACK4', '/storage/images/1728305620-banh-longpie-hai-ha-tui-216g.jpg', '#SN409 - Bánh longpie Hải Hà kem marshmallow phủ socola gói 216g (12 cái)', '27500', '2024-10-07 05:53:47', '2024-10-07 05:53:47'),
(348, 'SNACK', 'SNACK4', '/storage/images/1728305634-banh-longpie-com-hai-ha-goi-216g.jpg', '#SN410 - Bánh longpie Hải Hà kem marshmallow phủ socola hương cốm gói 216g (12 cái)', '27000', '2024-10-07 05:54:15', '2024-10-07 05:54:15'),
(349, 'FOOD', 'FOOD2', '/storage/images/1731567985-banhbaokimsa.png', '#F207 - Bánh bao Kim Sa', '35000', '2024-11-05 08:36:21', '2024-11-14 00:06:27'),
(350, 'FOOD', 'FOOD3', '/storage/images/1731567216-mitronxucxichtrungchien.webp', '#F301 - Mì Trộn Xúc Xích Trứng Chiên', '25000', '2024-11-13 23:54:41', '2024-11-13 23:54:41'),
(351, 'FOOD', 'FOOD3', '/storage/images/1731567309-mitronindome.webp', '#F302 - Mì Trộn Indomie', '25000', '2024-11-13 23:55:10', '2024-11-13 23:55:10'),
(352, 'FOOD', 'FOOD3', '/storage/images/1731567322-mitron.webp', '#F303 - Mì Trộn', '25000', '2024-11-13 23:55:22', '2024-11-13 23:55:22'),
(353, 'FOOD', 'FOOD2', '/storage/images/1731568236-banhbaotruncut.webp', '#F208 - Bánh Bao Trứng Cút', '22000', '2024-11-14 00:10:37', '2024-11-14 00:10:37'),
(354, 'FOOD', 'FOOD2', '/storage/images/1731568283-banhbaotrungmuoitrungcut.webp', '#F209 - Bánh Bao Trứng Muối & Trứng Cút', '27000', '2024-11-14 00:11:28', '2024-11-14 00:11:28'),
(355, 'FOOD', 'FOOD2', '/storage/images/1731568479-banhbaocade.webp', '#F210 - Bánh Bao Ca Dé', '25000', '2024-11-14 00:14:39', '2024-11-14 00:14:39'),
(356, 'FOOD', 'FOOD1', '/storage/images/1731570399-burgergaphomaidacbiet.webp', '#F112 - Burger Gà Phô-Mai Đặc Biệt', '69000', '2024-11-14 00:28:49', '2024-11-14 00:46:49'),
(357, 'FOOD', 'FOOD1', '/storage/images/1731570462-burgerganhomayo.webp', '#F113 - Burger Gà Nhỏ Mayo', '36000', '2024-11-14 00:29:46', '2024-11-14 00:47:47'),
(358, 'FOOD', 'FOOD1', '/storage/images/1731570522-burgerxucxich337kcal.webp', '#F114 - Burger Xúc Xích - 337 Kcal', '36000', '2024-11-14 00:48:45', '2024-11-14 00:48:45'),
(359, 'FOOD', 'FOOD1', '/storage/images/1731570599-burgerbotruyenthong.webp', '#F115 - Burger Bò Truyền Thống', '36000', '2024-11-14 00:50:24', '2024-11-14 00:50:24'),
(360, 'FOOD', 'FOOD1', '/storage/images/1731570651-burgerbophomai323kcal.webp', '#F116 - Burger Bò Phô-Mai - 323 Kcal', '46000', '2024-11-14 00:51:09', '2024-11-14 00:51:09'),
(361, 'FOOD', 'FOOD1', '/storage/images/1731570721-burgerphilecaphomai.webp', '#F117 - Burger Phi lê Cá Phô Mai', '56000', '2024-11-14 00:52:02', '2024-11-14 00:52:02'),
(362, 'FOOD', 'FOOD1', '/storage/images/1731570769-burgerbôhangiadacbiet.webp', '#F118 - Burger Bò Hoàng Gia Đặc Biệt', '89000', '2024-11-14 00:53:04', '2024-11-14 00:53:04'),
(363, 'VEFR', 'VEFR3', '/storage/images/1731580611-nam-kim-cham-thai-lan-150g-202308291048255023.jpg', '#VF301 - Nấm Kim Châm Thái Lan 150g', '5000', '2024-11-14 03:37:53', '2024-11-14 03:37:53'),
(364, 'VEFR', 'VEFR3', '/storage/images/1731580757-nam-kim-cham-han-quoc-goi-150g-202205181701291485.jpg', '#VF302 - Nấm Kim Châm Hàn Quốc 150g', '14900', '2024-11-14 03:40:00', '2024-11-14 03:40:00'),
(365, 'VEFR', 'VEFR3', '/storage/images/1731580813-nam-dui-ga-200g-202308291057432198.jpg', '#VF303 - Nấm Đùi Gà 200g', '24000', '2024-11-14 03:43:11', '2024-11-14 03:43:11'),
(366, 'VEFR', 'VEFR3', '/storage/images/1731581040-nam-bao-ngu-xam-goi-300g-202211231335446825.jpg', '#VF304 - Nấm Bào Ngư Xám 300g', '19200', '2024-11-14 03:44:45', '2024-11-14 03:44:45'),
(367, 'VEFR', 'VEFR3', '/storage/images/1731581110-nam-linh-chi-nau-trung-quoc-150g-202405130926162383.jpg', '#VF305 - Nấm Linh Chi Nâu Trung Quốc 150g', '12000', '2024-11-14 03:45:50', '2024-11-14 03:45:50'),
(368, 'VEFR', 'VEFR3', '/storage/images/1731581156-nam-linh-chi-trang-trung-quoc-150g-202405130930434532.jpg', '#VF306 - Nấm Linh Chi Trắng Trung Quốc 150g', '12000', '2024-11-14 03:46:41', '2024-11-14 03:46:41'),
(369, 'VEFR', 'VEFR3', '/storage/images/1731581205-lau-nam-thien-nhien-khay-300g-202205181652540610.jpg', '#VF307 - Lẩu Nấm Thiên Nhiên 300g', '25600', '2024-11-14 03:47:43', '2024-11-14 03:47:43'),
(370, 'VEFR', 'VEFR3', '/storage/images/1731581268-nam-tuyet-vietfresh-goi-50g-202204131200526097.jpg', '#VF308 - Nấm Tuyết Vietfresh Gói 50g', '30000', '2024-11-14 03:48:33', '2024-11-14 03:48:33'),
(371, 'VEFR', 'VEFR3', '/storage/images/1731581319-nam-huong-kho-nguyen-bao-goi-50g-202110290737083898.jpg', '#VF309 - Nấm Hương Khô Nguyên Bảo Gói 50g', '32000', '2024-11-14 03:49:28', '2024-11-14 03:49:28'),
(372, 'VEFR', 'VEFR3', '/storage/images/1731581376-nam-dong-co-kho-bach-hoa-xanh-goi-50g-202101260006017237.jpg', '#VF310 - Nấm Đông Cô Khô Gói 50g', '29000', '2024-11-14 03:50:07', '2024-11-14 03:50:07'),
(373, 'VEFR', 'VEFR3', '/storage/images/1731581441-nam-meo-den-kho-navita-goi-50g-201911271958181705.jpg', '#VF311 - Nấm Mèo Đen Khô Gói 50g', '14600', '2024-11-14 03:51:36', '2024-11-14 03:51:36'),
(374, 'VEFR', 'VEFR3', '/storage/images/1731581501-nam-meo-den-thai-soi-navita-goi-50g-201911271959018442.jpg', '#VF312 - Nấm Mèo Đen Thái Sợi Gói 50g', '16000', '2024-11-14 03:52:13', '2024-11-14 03:52:13'),
(375, 'FROZEN', 'FROZEN1', '/storage/images/1731582062-thanh_cua_nhat_ban_royal_dong_lanh_kome88_-_500g_goi_706854f6775140eb9e93c9a1eea419ec_grande.webp', '#FR110 - Thanh cua Nhật Bản Royal Kome88', '199000', '2024-11-14 04:01:36', '2024-11-14 04:01:36'),
(376, 'FROZEN', 'FROZEN1', '/storage/images/1731582107-cua_nau_nauy_da_lam_chin_hg_4f8f7106e2d74ec1bcc0c2dd223d988b_1024x1024.webp', '#FR111 - Cua nâu Nauy đã làm chín HG (400-600G/Con)', '329400', '2024-11-14 04:03:37', '2024-11-14 04:03:37'),
(377, 'FROZEN', 'FROZEN1', '/storage/images/1731582229-gach_cua_tai_thinh_phat_200_g_fe35521b255b45c6888839ba5a63efc0_grande.webp', '#FR112 - Gạch cua Tài Thịnh Phát 200 g', '149000', '2024-11-14 04:04:10', '2024-11-14 04:04:10'),
(378, 'FROZEN', 'FROZEN1', '/storage/images/1731582266-hau_nguyen_vo_xuat_khau_hg_1_kg___size_9_-_13_con_kg__8e91d999b76b4d95a809ba8dbe7471d8_1024x1024.webp', '#FR113 - Hàu nguyên vỏ xuất khẩu HG 1kg (Size 9 - 13 con/kg)', '175000', '2024-11-14 04:04:55', '2024-11-14 04:04:55'),
(379, 'FROZEN', 'FROZEN1', '/storage/images/1731582299-oc_bulot_ireland__hg_1_kg___size_30_-_50_con_kg__55a3b4ce4d6645d2922e0da1291e380c_1024x1024.webp', '#FR114 - Ốc bulot Ireland HG 1kg (Size 30 - 50 con/kg)', '329000', '2024-11-14 04:05:20', '2024-11-14 04:05:20'),
(380, 'FROZEN', 'FROZEN1', '/storage/images/1731582322-oc_huong_que_an_do_hg_1_kg___size_50_-_80_con_kg__34c7ce5a0ef9401aa57c61cfe4b12493_1024x1024.webp', '#FR115 - Ốc hương quế Ấn Độ HG 1kg (Size 50 - 80 con/kg)', '169000', '2024-11-14 04:05:43', '2024-11-14 04:05:43'),
(381, 'FROZEN', 'FROZEN1', '/storage/images/1731582370-so_diep_nhat_nguyen_vo_hg_1_kg___size_8_-_12_con_kg__d52be70c25fc41b0930fa0af6a85be12_1024x1024.webp', '#FR116 - Sò điệp Nhật nguyên vỏ HG 1kg (Size 8 - 12 con/kg)', '209000', '2024-11-14 04:06:28', '2024-11-14 04:06:28'),
(382, 'FROZEN', 'FROZEN1', '/storage/images/1731582449-kho_ca_sac_song_phuong_250_g_b846209c238043ccb6e8dc1a24b0739e_grande.webp', '#FR117 - Khô cá sặc Song Phương 250 g', '105000', '2024-11-14 04:07:53', '2024-11-14 04:07:53'),
(383, 'FROZEN', 'FROZEN1', '/storage/images/1731582476-kho_ca_loc_song_phuong_250_g_11bc3891336e4520945b3a6a41a45549_grande.webp', '#FR118 - Khô cá lóc Song Phương 250g', '115000', '2024-11-14 04:08:27', '2024-11-14 04:08:27'),
(384, 'FROZEN', 'FROZEN1', '/storage/images/1731582531-kho_ca_tra_song_phuong_250_g_947a9e0a3b1645829255f8f8cfa94c04_grande.webp', '#FR119 - Khô cá tra Song Phương 250g', '89000', '2024-11-14 04:09:32', '2024-11-14 04:09:32'),
(385, 'FROZEN', 'FROZEN2', '/storage/images/1731582742-chaluabivimala.jpg', '#FR208 - Chả lụa bì vị mala MEATDeli cây 50g', '13000', '2024-11-14 04:12:44', '2024-11-14 04:12:44'),
(386, 'FROZEN', 'FROZEN2', '/storage/images/1731582807-chaluabi.jpg', '#FR209 - Chả lụa bì MEATDeli cây 50g', '10000', '2024-11-14 04:13:28', '2024-11-14 04:13:28'),
(387, 'FROZEN', 'FROZEN2', '/storage/images/1731582832-cha-lua-bi-ot-xiem-xanh-ngu-bao-meatdeli-cay-50g-202403081000487713.jpg', '#FR210 - Chả lụa bì ớt xiêm xanh Ngự Bảo MEATDeli cây 50g', '13000', '2024-11-14 04:14:18', '2024-11-14 04:14:18'),
(388, 'FROZEN', 'FROZEN2', '/storage/images/1731582935-gio-lua-ngu-bao-meatdeli-cay-300g-202401310913010271.jpg', '#FR211 - Giò lụa Ngự Bảo MEATDeli cây 300g', '61000', '2024-11-14 04:15:06', '2024-11-14 04:15:36'),
(389, 'FROZEN', 'FROZEN2', '/storage/images/1731582976-gio-lua-bi-ot-xiem-xanh-ngu-bao-meatdeli-cay-300g-202403081006341524.jpg', '#FR212 - Giò lụa bì ớt xiêm xanh Ngự Bảo MEATDeli cây 300g', '69000', '2024-11-14 04:16:26', '2024-11-14 04:16:26'),
(390, 'FROZEN', 'FROZEN2', '/storage/images/1731583069-cha-lua-hue-hoa-doanh-goi-200g-202402271422043271.jpg', '#FR213 - Chả lụa huế Hoa Doanh gói 200g', '30000', '2024-11-14 04:18:03', '2024-11-14 04:18:03'),
(391, 'FROZEN', 'FROZEN2', '/storage/images/1731583125-gio-lua-dac-biet-vissan-cay-500g-202212081421497718.jpg', '#FR214 - Giò lụa đặc biệt Vissan cây 500g', '117000', '2024-11-14 04:18:58', '2024-11-14 04:18:58'),
(392, 'FROZEN', 'FROZEN2', '/storage/images/1731583162-nem-chua-hue-tran-phat-hoai-goi-200g-202008270952388699.jpg', '#FR215 - Nem chua huế Trần Phát Hoài gói 200g', '39000', '2024-11-14 04:19:55', '2024-11-14 04:19:55'),
(393, 'FROZEN', 'FROZEN2', '/storage/images/1731583234-cha-lua-nam-tuoi-cuoi-goi-250g-202309110828366190.jpg', '#FR216 - Chả lụa Nấm Tươi Cười gói 250g', '60000', '2024-11-14 04:20:43', '2024-11-14 04:20:43'),
(394, 'FROZEN', 'FROZEN2', '/storage/images/1731583293-cha-lua-cp-goi-500g-202310202133053012.jpg', '#FR217 - Chả lụa C.P gói 500g', '78000', '2024-11-14 04:21:40', '2024-11-14 04:21:40'),
(395, 'FROZEN', 'FROZEN3', '/storage/images/1731584039-xuc-xich-cp-250g-vealz-2-700x467.jpg', '#FR313 - Xúc xích Vealz C.P gói 250g', '44000', '2024-11-14 04:34:00', '2024-11-14 04:34:00'),
(396, 'FROZEN', 'FROZEN3', '/storage/images/1731584069-xuc-xich-vealz-cp-goi-500g-202304250818446269.jpg', '#FR314 - Xúc xích Vealz C.P gói 500g', '60500', '2024-11-14 04:34:30', '2024-11-14 04:34:30'),
(397, 'SNACK', 'SNACK1', '/storage/images/1731584269-snack-hinh-cua-vi-suon-nuong-bbq-poca-goi-60g-clone-202407091426474019.jpg', '#SN117 - Snack hình cua vị tảo biển Poca gói 60g', '12000', '2024-11-14 04:38:27', '2024-11-14 04:38:27'),
(398, 'SNACK', 'SNACK1', '/storage/images/1731584345-snack-rong-bien-poca-202407091417102960.jpg', '#SN118 - Snack hình cua vị sườn nướng BBQ Poca gói 60g', '12000', '2024-11-14 04:39:06', '2024-11-14 04:39:06'),
(399, 'SNACK', 'SNACK2', '/storage/images/1731584515-keo-deo-vi-me-lac-thai-lan-orion-boom-jelly-lak-goi-49g-clone-202403131536503277.jpg', '#SN208 - Kẹo dẻo vị me lắc Thái Lan Orion Boom Jelly Lắk gói 25g', '6000', '2024-11-14 04:41:56', '2024-11-14 04:41:56'),
(400, 'SNACK', 'SNACK2', '/storage/images/1731584654-keo-deo-vi-me-lac-thai-lan-orion-boom-jelly-goi-49g-202311031011512497.jpg', '#SN209 - Kẹo dẻo vị me lắc Thái Lan Orion Boom Jelly Lắk gói 49g', '12900', '2024-11-14 04:44:16', '2024-11-14 04:44:16'),
(401, 'SNACK', 'SNACK2', '/storage/images/1731584709-keo-deo-vi-xoai-lac-muoi-ot-orion-boom-jelly-lak-goi-235g-202403311816227702.jpg', '#SN210 - Kẹo dẻo vị xoài lắc muối ớt Orion Boom Jelly Lắk gói 23.5g', '6000', '2024-11-14 04:45:09', '2024-11-14 04:45:09'),
(402, 'SNACK', 'SNACK2', '/storage/images/1731584740-keo-deo-vi-xoai-lac-muoi-ot-orion-boom-jelly-lak-goi-50g-202304081536112168.jpg', '#SN211 - Kẹo dẻo vị xoài lắc muối ớt Orion Boom Jelly Lắk gói 50g', '12900', '2024-11-14 04:45:41', '2024-11-14 04:45:41'),
(403, 'CONDIMENT', 'CONDIMENT3', '/storage/images/1731584912-324685-slide-moi_202409261508271925.jpg', '#C310 - Nước mắm cá cơm than Knorr 15 độ đạm chai 242ml', '13000', '2024-11-14 04:48:33', '2024-11-14 04:48:33'),
(404, 'CONDIMENT', 'CONDIMENT3', '/storage/images/1731584943-nuoc-mam-knorr-ngon-tron-vi-chai-750ml-202209160853092173.jpg', '#C311 - Nước mắm cá cơm than Knorr 15 độ đạm chai 750ml', '53000', '2024-11-14 04:49:16', '2024-11-14 04:49:16'),
(405, 'CONDIMENT', 'CONDIMENT4', '/storage/images/1731585133-nuoc-xot-salad-me-rang-kewpie-chai-210ml-202406261003532539.jpg', '#C409 - Nước xốt salad mè rang Kewpie chai 210ml', '63000', '2024-11-14 04:52:14', '2024-11-14 04:52:14'),
(406, 'CONDIMENT', 'CONDIMENT4', '/storage/images/1731585214-mam-ruoc-hue-hu-200g-2-700x467.jpg', '#C410 - Mắm ruốc huế Sông Hương hũ 200g', '32000', '2024-11-14 04:53:35', '2024-11-14 04:53:35'),
(407, 'CONDIMENT', 'CONDIMENT5', '/storage/images/1731585312-xot-mayonnaise-ajinomoto-aji-mayo-chua-beo-chai-130g-202407121516092767.jpg', '#C509 - Xốt mayonnaise Ajinomoto Aji-mayo chua béo chai 130g', '19500', '2024-11-14 04:55:15', '2024-11-14 04:55:15'),
(408, 'CONDIMENT', 'CONDIMENT5', '/storage/images/1731585397-xot-mayonnaise-ajinomoto-vi-chua-beo-chai-260g-202304241647567247.jpg', '#C510 - Xốt mayonnaise Ajinomoto Aji-mayo chua béo chai 260g', '37000', '2024-11-14 04:56:42', '2024-11-14 04:56:42'),
(409, 'CONDIMENT', 'CONDIMENT5', '/storage/images/1731585419-330057-slide_202409191354134317.jpg', '#C511 - Xốt mayonnaise Ajinomoto Aji-mayo chua béo chai 430g', '52000', '2024-11-14 04:57:12', '2024-11-14 04:57:12'),
(410, 'CONDIMENT', 'CONDIMENT5', '/storage/images/1731585481-xot-mayonnaise-golden-farm-chai-250g-202407151453089309.jpg', '#C512 - Xốt mayonnaise Golden Farm chai 250g', '39500', '2024-11-14 04:58:02', '2024-11-14 04:58:02'),
(411, 'VEFR', 'VEFR2', '/storage/images/1731585701-quyt-uc-202312251512246744.jpg', '#VF213 - Quýt Úc nhập khẩu Úc 1kg', '134300', '2024-11-14 05:01:42', '2024-11-14 05:06:13'),
(412, 'VEFR', 'VEFR2', '/storage/images/1731585790-mit-thai-1-kg-202308151310238228.jpg', '#VF214 - Mít Thái 1kg', '26370', '2024-11-14 05:03:11', '2024-11-14 05:03:11'),
(413, 'VEFR', 'VEFR2', '/storage/images/1731585832-thanh-long-ruot-do-202312251505387850.jpg', '#VF215 - Thanh long ruột đỏ 1kg trái từ 300g trở lên', '24000', '2024-11-14 05:03:53', '2024-11-14 05:06:28'),
(414, 'VEFR', 'VEFR2', '/storage/images/1731585920-luudonhapkhau.jpg', '#VF216 - Lựu đỏ nhập khẩu Trung Quốc 1kg', '56000', '2024-11-14 05:05:21', '2024-11-14 05:05:21'),
(415, 'VEFR', 'VEFR2', '/storage/images/1731586074-le-tai-nung-09-11kg-2-3-trai-202309051337100382.jpg', '#VF216 - Lê Tai Nung 1kg', '39000', '2024-11-14 05:07:55', '2024-11-14 05:07:55'),
(416, 'VEFR', 'VEFR2', '/storage/images/1731586137-kiwivang.jpg', '#VF217 - Kiwi vàng nhập khẩu Trung Quốc hộp 4 trái', '69000', '2024-11-14 05:08:58', '2024-11-14 05:08:58'),
(417, 'VEFR', 'VEFR2', '/storage/images/1731586188-nho-mau-don-500g-202408201611053075.jpg', '#VF218 - Nho mẫu đơn 500g', '59000', '2024-11-14 05:09:54', '2024-11-14 05:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('cFMRaQljpp8eyUCzUiYKq7ThdB7mFRkc9YFrBbHh', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidmNRQkhrNTQ1WXBKa21HWDNyVFloSXkzNjRMdXh4Zk5POUc4UGVTRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9kdWN0L2NyZWF0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToidXNlcl9kYXRhIjthOjM6e3M6NDoibmFtZSI7czoyMDoiTmd1eeG7hW4gVGhhbmggSOG6o2kiO3M6NToiZW1haWwiO3M6MzA6ImhhaS5uZ3V5ZW5oYWkyMDAzQGhjbXV0LmVkdS52biI7czo4OiJwYXNzd29yZCI7czo5OiIxMjM0NTY3ODkiO319', 1732636016),
('GueuFqo4ZmNEvUosAJIihIjpGRaTTxLxCyCQfrzk', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiUzRNUURHWE9WZXlxNXpyTExiZWhnVW1NVmRVRUxYZFRrM2RUN2gySCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jbGllbnQvbGlzdC9mb29kIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJ1c2VyX2RhdGEiO2E6Mzp7czo0OiJuYW1lIjtzOjIwOiJOZ3V54buFbiBUaGFuaCBI4bqjaSI7czo1OiJlbWFpbCI7czozMDoiaGFpLm5ndXllbmhhaTIwMDNAaGNtdXQuZWR1LnZuIjtzOjg6InBhc3N3b3JkIjtzOjg6IjAyMDcyMDAzIjt9czoxMDoib3JkZXJfbmFtZSI7czoyMDoiTmd1eeG7hW4gVGhhbmggSOG6o2kiO3M6MTE6Im9yZGVyX3RvdGFsIjtpOjUwMDAwO3M6MTA6Im9yZGVyX2RhdGEiO2E6MTA6e3M6NDoibmFtZSI7czoyMDoiTmd1eeG7hW4gVGhhbmggSOG6o2kiO3M6NToicGhvbmUiO3M6MTA6IjAzODMyMTM3MDMiO3M6NToiZW1haWwiO3M6MzA6ImhhaS5uZ3V5ZW5oYWkyMDAzQGhjbXV0LmVkdS52biI7czo0OiJjaXR5IjtzOjIyOiJUaMOgbmggcGjhu5EgSMOgIE7hu5lpIjtzOjg6ImRpc3RyaWN0IjtzOjE5OiJRdeG6rW4gSG/DoG4gS2nhur9tIjtzOjQ6IndhcmQiO3M6MjM6IlBoxrDhu51uZyDEkOG7k25nIFh1w6JuIjtzOjc6ImFkZHJlc3MiO3M6MTc6Ikjhu5MgSG/DoG4gS2nhur9tIjtzOjQ6Im5vdGUiO3M6Mjg6IkdpYW8gbmhhbmggdHLGsOG7m2MgMTAgdOG7kWkiO3M6NjoibWV0aG9kIjtzOjEyOiJUaeG7gW4gbeG6t3QiO3M6MTI6Im9yZGVyX2RldGFpbCI7czo5OiJ7IjUiOiIyIn0iO319', 1733993433),
('m2X8ktSVDbKQK4HGhztGuxQMYDlekQzfTAMNoz7w', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidElReTVqcGFuRE1VVUZWeGFkUEtLSk53SkREaXA1dnpNM3dsQjcyNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9hZG1pbnBhZ2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6InVzZXJfZGF0YSI7YTozOntzOjQ6Im5hbWUiO3M6MjA6Ik5ndXnhu4VuIFRoYW5oIEjhuqNpIjtzOjU6ImVtYWlsIjtzOjMwOiJoYWkubmd1eWVuaGFpMjAwM0BoY211dC5lZHUudm4iO3M6ODoicGFzc3dvcmQiO3M6OToiMTIzNDU2Nzg5Ijt9fQ==', 1733536533),
('QZ5WTWIBdvFx9sbLSHPxEAACUCDPezmbr44tkQYg', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRFQ2ZEZ3YjlmYmZzb005TDlJbmRPOWlpYzI2S1pTUzdQT0JhTURMeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jbGllbnQvbGlzdC9mcnVpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToidXNlcl9kYXRhIjthOjM6e3M6NDoibmFtZSI7czoyMDoiTmd1eeG7hW4gVGhhbmggSOG6o2kiO3M6NToiZW1haWwiO3M6MzA6ImhhaS5uZ3V5ZW5oYWkyMDAzQGhjbXV0LmVkdS52biI7czo4OiJwYXNzd29yZCI7czo4OiIwMjA3MjAwMyI7fX0=', 1734059601),
('StRuQ68XKE4sSvSP7j0VvwP6WlAISEBtK4NOYj5h', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibHBxVnB6TVNCcFdDNzYyOHJ3NHpHdklrTlozOUhwNUlGY1ZBRDMxUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jbGllbnQvbGlzdC9mb29kIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJ1c2VyX2RhdGEiO2E6Mzp7czo0OiJuYW1lIjtzOjIwOiJOZ3V54buFbiBUaGFuaCBI4bqjaSI7czo1OiJlbWFpbCI7czozMDoiaGFpLm5ndXllbmhhaTIwMDNAaGNtdXQuZWR1LnZuIjtzOjg6InBhc3N3b3JkIjtzOjg6IjAyMDcyMDAzIjt9czo0OiJjYXJ0IjthOjE6e2k6NDtpOjM7fX0=', 1732686837),
('tvr0qqoeBQXv6se2EDBTw5XEmXKDBWsZ2cTDJe8X', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVVrM09NR2ZiTG8xRmlEVVpLSkRNT3BRaWNGVFlQbzNackhoa1lKRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdXRoZW50aWMvY2xpX2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732890030);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 'Nguyễn Thanh Hải', 'hai.nguyenhai2003@hcmut.edu.vn', NULL, '$2y$12$739ek.C8ymxn1JHIRvi4lOZoszhWJGBpvlndP0oIE2Pm/yFOP5/6C', NULL, '2024-10-26 06:37:57', '2024-10-26 06:37:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_email_unique` (`email`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `client_users`
--
ALTER TABLE `client_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_users_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `client_users`
--
ALTER TABLE `client_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=418;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
