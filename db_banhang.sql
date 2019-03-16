-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 13, 2019 lúc 06:30 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_banhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(14, 14, '2017-03-23', 160000, 'COD', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 13, '2017-03-21', 400000, 'ATM', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 12, '2017-03-21', 520000, 'COD', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 11, '2017-03-21', 420000, 'COD', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(15, 15, '2017-03-24', 220000, 'COD', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(16, 16, '2019-03-06', 400000, 'COD', 'ko co', '2019-03-06 14:55:58', '2019-03-06 14:55:58'),
(17, 17, '2019-03-06', 120000, 'COD', 'ko cos ghi chus gif', '2019-03-06 15:46:46', '2019-03-06 15:46:46'),
(18, 18, '2019-03-06', 160000, 'COD', 'asdsadsadsad', '2019-03-06 15:49:23', '2019-03-06 15:49:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(18, 15, 62, 5, 220000, '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(17, 14, 2, 1, 160000, '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(16, 13, 60, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(15, 13, 59, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(14, 12, 60, 2, 200000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(13, 12, 61, 1, 120000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(12, 11, 61, 1, 120000, '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(11, 11, 57, 2, 150000, '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(19, 16, 1, 2, 120000, '2019-03-06 14:55:58', '2019-03-06 14:55:58'),
(20, 16, 2, 1, 160000, '2019-03-06 14:55:58', '2019-03-06 14:55:58'),
(21, 17, 1, 1, 120000, '2019-03-06 15:46:46', '2019-03-06 15:46:46'),
(22, 18, 2, 1, 160000, '2019-03-06 15:49:23', '2019-03-06 15:49:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(15, 'ê', 'Nữ', 'huongnguyen@gmail.com', 'e', 'e', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(14, 'hhh', 'nam', 'huongnguyen@gmail.com', 'Lê thị riêng', '99999999999999999', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '23456789', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 'Sơn Sơn', 'Nam', 'son@gmail.com', 'Lê thị riêng', '1234567890', 'Vui lòng chuyển đúng hạn', '2019-03-12 15:29:30', '2017-03-21 07:20:07'),
(11, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '234567890-', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(16, 'abc ngocphu', 'nam', '01646827748@gmail.com', 'Hutech University, ho chi minh', '1646827748', 'ko co', '2019-03-06 14:55:58', '2019-03-06 14:55:58'),
(17, 'abc ngocphu', 'nam', '01646827748@gmail.com', 'Hutech University, ho chi minh', '1646827748', 'ko cos ghi chus gif', '2019-03-06 15:46:46', '2019-03-06 15:46:46'),
(18, 'abc ngocphu', 'nam', '01646827748@gmail.com', 'Hutech University, ho chi minh', '1646827748', 'asdsadsadsad', '2019-03-06 15:49:23', '2019-03-06 15:49:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `create_at`, `update_at`) VALUES
(1, 'Mùa trung thu năm nay, Hỷ Lâm Môn muốn gửi đến quý khách hàng sản phẩm mới xuất hiện lần đầu tiên tại Việt nam \"Bánh trung thu Bơ Sữa HongKong\".', 'Những ý tưởng dưới đây sẽ giúp bạn sắp xếp tủ quần áo trong phòng ngủ chật hẹp của mình một cách dễ dàng và hiệu quả nhất. ', 'sample1.jpg', '2017-03-11 06:20:23', '0000-00-00 00:00:00'),
(2, 'Tư vấn cải tạo phòng ngủ nhỏ sao cho thoải mái và thoáng mát', 'Chúng tôi sẽ tư vấn cải tạo và bố trí nội thất để giúp phòng ngủ của chàng trai độc thân thật thoải mái, thoáng mát và sáng sủa nhất. ', 'sample2.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(3, 'Đồ gỗ nội thất và nhu cầu, xu hướng sử dụng của người dùng', 'Đồ gỗ nội thất ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Xu thế của các gia đình hiện nay là muốn đem thiên nhiên vào nhà ', 'sample3.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(4, 'Hướng dẫn sử dụng bảo quản đồ gỗ, nội thất.', 'Ngày nay, xu hướng chọn vật dụng làm bằng gỗ để trang trí, sử dụng trong văn phòng, gia đình được nhiều người ưa chuộng và quan tâm. Trên thị trường có nhiều sản phẩm mẫu ', 'sample4.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(5, 'Phong cách mới trong sử dụng đồ gỗ nội thất gia đình', 'Đồ gỗ nội thất gia đình ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Phong cách sử dụng đồ gỗ hiện nay của các gia đình hầu h ', 'sample5.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(1, 'Nước Hoa 1', 1, 'Nước Hoa 1', 150000, 120000, 'a1-04012019032009.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(2, 'Nước Hoa 2', 1, 'Nước Hoa 2', 180000, 160000, 'a1-15102018012040.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(3, 'Nước Hoa 3', 1, 'Nước Hoa 3', 150000, 120000, 'a1-15102018031314.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(4, 'Nước Hoa 4', 1, 'Nước Hoa 4', 160000, 0, 'a1-23022019103450.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(5, 'Nước Hoa 5', 1, 'Nước Hoa 5', 160000, 0, 'a1-23022019110819.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(6, 'Nước Hoa 6', 1, 'Nước Hoa 6', 200000, 180000, 'a1-28022019111644.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(7, 'Nước Hoa 7', 1, 'Nước Hoa 7', 160000, 0, 'a2-15102018115301.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(8, 'Nước Hoa 8', 1, 'Nước Hoa 8', 160000, 150000, 'a2-22022019013013.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(9, 'Nước Hoa 9', 1, 'Nước Hoa 9', 160000, 150000, 'a3-15102018014019.jpg', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(12, 'Sơn Móng Tay 1', 2, 'Sơn Móng Tay 1', 200000, 180000, 'a0-11022019044605.jpg', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(13, 'Sơn Móng Tay 2', 2, 'Sơn Móng Tay 2', 300000, 280000, 'a0-12022019100052.jpg', 'cái', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(14, 'Sơn Móng Tay 3', 2, 'Sơn Móng Tay 3', 300000, 280000, 'a0-25122018101933.jpg', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(15, 'Sơn Móng Tay 4', 2, 'Sơn Móng Tay 4', 350000, 320000, 'a1-10112018094743.jpg', 'cái', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(16, 'Sơn Móng Tay 5', 2, 'Sơn Móng Tay 5', 150000, 120000, 'a1-18102018091341.jpg', 'hộp', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(17, 'Sơn Móng Tay 6', 2, 'Sơn Móng Tay 6', 250000, 240000, 'a1-21022019042420.jpg', 'cai', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(18, 'Sơn Móng Tay 7', 2, 'Sơn Móng Tay 7', 180000, 0, 'a1-21122018091731.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(19, 'Sơn Móng Tay 8', 2, 'Sơn Móng Tay 8', 150000, 0, 'a1-27112018013853.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(20, 'Sơn Móng Tay 9', 2, 'Sơn Móng Tay 9', 150000, 0, 'a2-17102018041308.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(22, 'Xịt Body 1', 3, 'Xịt Body 1', 160000, 150000, '01(60).jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(23, 'Xịt Body 2', 3, 'Xịt Body 2', 180000, 0, 'a1-03012019100936.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(24, 'Xịt Body 3', 3, 'Xịt Body 3', 180000, 0, 'a1-25102018114434.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(25, 'Xịt Body 4', 3, 'Xịt Body 4', 80000, 70000, 'a3-16112018094132.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(26, 'Xịt Body 5', 3, 'Xịt Body 5', 50000, 0, 'ava 1(1).png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(27, 'Xịt Body 6', 3, 'Xịt Body 6', 100000, 80000, 'nuoc-hoa-vicsec-body.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(28, 'Xịt Body 7', 3, 'Xịt Body 7', 120000, 0, 'nuoc-hoa-Vic-Secret-1.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(29, 'Xịt Body 8', 3, 'Xịt Body 8', 100000, 0, 'Victorias-Secret-Fragrance-Mist.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(30, 'Xịt Body 9', 3, 'Xịt Body 9', 380000, 350000, 'x1-04102018025507.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(32, 'Tẩy Trang 1', 4, 'Tẩy Trang 1', 380000, 350000, 'a0000-11022019104259.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(33, 'Tẩy Trang 2', 4, 'Tẩy Trang 2', 280000, 250000, 'a0-25122018023119.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(34, 'Tẩy Trang 3', 4, 'Tẩy Trang 3', 280000, 0, 'a1-11022019100158.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(35, 'Tẩy Trang 4', 4, 'Tẩy Trang 4', 320000, 300000, 'a1-11022019115324.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(36, 'Tẩy Trang 5', 4, 'Tẩy Trang 5', 320000, 300000, 'a1-12102018095646.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(37, 'Tẩy Trang 6', 4, 'Tẩy Trang 6', 320000, 300000, 'a2-01032019111204.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(38, 'Tẩy Trang 7', 4, 'Tẩy Trang 7', 350000, 330000, 'a2-08102018114349.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(39, 'Tẩy Trang 8', 4, 'Tẩy Trang 8', 350000, 330000, 'a2-18022019113952.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(40, 'Tẩy Trang 9', 4, 'Tẩy Trang 9', 350000, 330000, 'a4-03112018015256.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(42, 'Chống Nắng 1', 6, 'Chống Nắng 1', 150000, 130000, '01(26).jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(43, 'Chống Nắng 2', 6, 'Chống Nắng 2', 120000, 0, '01(121).jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(44, 'Chống Nắng 3', 6, 'Chống Nắng 3', 120000, 0, 'a1-01112018091804.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(45, 'Chống Nắng 4', 6, 'Chống Nắng 4', 120000, 0, 'a1-04012019111843.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(46, 'Chống Nắng 5', 6, 'Chống Nắng 5', 120000, 0, 'a1-13022019015636.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(47, 'Chống Nắng 6', 6, 'Chống Nắng 6', 140000, 0, 'a3-04012019115059.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(48, 'Chống Nắng 7', 6, 'Chống Nắng 7', 140000, 0, 'kem-chong-nang(8).jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(49, 'Chống Nắng 8', 6, 'Chống Nắng 8', 120000, 100000, 'kem-chong-nang-cerave.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(50, 'Chống Nắng 9', 6, 'Chống Nắng 9', 120000, 100000, 'kem-chong-nang-xam.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(52, 'Phụ Kiện 1', 7, 'Phụ Kiện 1', 150000, 0, 'a1-01122018093156.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(53, 'Phụ Kiện 2', 7, 'Phụ Kiện 2', 150000, 0, 'a1-06112018114157.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(54, 'Phụ Kiện 3', 7, 'Phụ Kiện 3', 150000, 0, 'a1-06112018115711.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(55, 'Phụ Kiện 4', 7, 'Phụ Kiện 4', 150000, 0, 'a1-16022019034952.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(56, 'Phụ Kiện 5', 7, 'Phụ Kiện 5', 150000, 0, 'a1-18022019041525.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(57, 'Phụ Kiện 6', 7, 'Phụ Kiện 6', 150000, 0, 'a1-20022019044119.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(58, 'Sửa Tắm 1', 5, 'Sửa Tắm 1', 200000, 180000, '1(23).jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(59, 'Sửa Tắm 2', 5, 'Sửa Tắm 2', 200000, 0, 'a1-01032019124032.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(60, 'Sửa Tắm 3', 5, 'Sửa Tắm 3', 200000, 0, 'a1-10112018090337.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(61, 'Phụ Kiện 7', 7, 'Phụ Kiện 7', 150000, 120000, 'a1-30012019021459.jpg', 'cái', 1, NULL, NULL),
(62, 'Phụ Kiện 8', 7, 'Phụ Kiện 8', 250000, 220000, 'a5-19112018024845.jpg', 'cái', 0, NULL, NULL),
(63, 'Phụ Kiện 9', 7, 'Phụ Kiện 9', 250000, 200000, 'a2-31012019020427.jpg', 'cái', 0, NULL, NULL),
(65, 'Sửa Tắm 4', 5, 'Sửa Tắm 4', 200000, 0, 'a3-10122018023700.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(66, 'Sửa Tắm 5', 5, 'Sửa Tắm 5', 201000, 0, 'a6-19112018021141.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(67, 'Sửa Tắm 6', 5, 'Sửa Tắm 6', 202000, 0, 'a7-06102018032638.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(68, 'Sửa Tắm 7', 5, 'Sửa Tắm 7', 203000, 0, 'a7-28022019094112.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(69, 'Sửa Tắm 8', 5, 'Sửa Tắm 8', 204000, 0, 'Hinh-5-sua-tam-On-The-Body-Body-Wash.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(70, 'Sửa Tắm 9', 5, 'Sửa Tắm 9', 205000, 0, 'sua-tam-dove-huong-luu.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'banner1.jpg'),
(2, '', 'banner2.jpg'),
(3, '', 'banner3.jpg'),
(4, '', 'banner4.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Nước Hoa', 'Nếu từng bị mê hoặc bởi các loại tarlet ngọt thì chắn chắn bạn không thể bỏ qua những loại tarlet mặn. Ngoài hình dáng bắt mắt, lớp vở bánh giòn giòn cùng với nhân mặn như thịt gà, nấm, thị heo ,… của bánh sẽ chinh phục bất cứ ai dùng thử.', 'banh-man-thu-vi-nhat-1.jpg', NULL, NULL),
(2, 'Sơn Móng', 'Bánh ngọt là một loại thức ăn thường dưới hình thức món bánh dạng bánh mì từ bột nhào, được nướng lên dùng để tráng miệng. Bánh ngọt có nhiều loại, có thể phân loại dựa theo nguyên liệu và kỹ thuật chế biến như bánh ngọt làm từ lúa mì, bơ, bánh ngọt dạng bọt biển. Bánh ngọt có thể phục vụ những mục đính đặc biệt như bánh cưới, bánh sinh nhật, bánh Giáng sinh, bánh Halloween..', '20131108144733.jpg', '2016-10-12 02:16:15', '2016-10-13 01:38:35'),
(3, 'Xịt Body', 'Bánh trái cây, hay còn gọi là bánh hoa quả, là một món ăn chơi, không riêng gì của Huế nhưng khi \"lạc\" vào mảnh đất Cố đô, món bánh này dường như cũng mang chút tinh tế, cầu kỳ và đặc biệt. Lấy cảm hứng từ những loại trái cây trong vườn, qua bàn tay khéo léo của người phụ nữ Huế, món bánh trái cây ra đời - ngọt thơm, dịu nhẹ làm đẹp lòng biết bao người thưởng thức.', 'banhtraicay.jpg', '2016-10-18 00:33:33', '2016-10-15 07:25:27'),
(4, 'Tẩy Trang', 'Với người Việt Nam thì bánh ngọt nói chung đều hay được quy về bánh bông lan – một loại tráng miệng bông xốp, ăn không hoặc được phủ kem lên thành bánh kem. Tuy nhiên, cốt bánh kem thực ra có rất nhiều loại với hương vị, kết cấu và phương thức làm khác nhau chứ không chỉ đơn giản là “bánh bông lan” chung chung đâu nhé!', 'banhkem.jpg', '2016-10-26 03:29:19', '2016-10-26 02:22:22'),
(5, 'Sửa Tắm', 'Crepe là một món bánh nổi tiếng của Pháp, nhưng từ khi du nhập vào Việt Nam món bánh đẹp mắt, ngon miệng này đã làm cho biết bao bạn trẻ phải “xiêu lòng”', 'crepe.jpg', '2016-10-28 04:00:00', '2016-10-27 04:00:23'),
(6, 'Chống Nắng', 'Pizza đã không chỉ còn là một món ăn được ưa chuộng khắp thế giới mà còn được những nhà cầm quyền EU chứng nhận là một phần di sản văn hóa ẩm thực châu Âu. Và để được chứng nhận là một nhà sản xuất pizza không hề đơn giản. Người ta phải qua đủ mọi các bước xét duyệt của chính phủ Ý và liên minh châu Âu nữa… tất cả là để đảm bảo danh tiếng cho món ăn này.', 'pizza.jpg', '2016-10-25 17:19:00', NULL),
(7, 'Phụ Kiện', 'Bánh su kem là món bánh ngọt ở dạng kem được làm từ các nguyên liệu như bột mì, trứng, sữa, bơ.... đánh đều tạo thành một hỗn hợp và sau đó bằng thao tác ép và phun qua một cái túi để định hình thành những bánh nhỏ và cuối cùng được nướng chín. Bánh su kem có thể thêm thành phần Sô cô la để tăng vị hấp dẫn. Bánh có xuất xứ từ nước Pháp.', 'sukemdau.jpg', '2016-10-25 17:19:00', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quyenhan` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `quyenhan`, `created_at`, `updated_at`) VALUES
(8, 'admin123', 'zxc@gmail.com', '$2y$10$ySO8joQBn1qFV4LeSw.3Q.DVxivLn.rnKYaO6/rNKDizg.oK/s5/K', '01646827748', 'Hutech University, ho chi minh', '1', '2019-03-13 14:12:31', '2019-03-13 14:12:31'),
(9, 'abc ngocphu', 'ght@gmail.com', '$2y$10$C7cijwaA87sHdr5BvcOgBup7AIht0ElTUjRbLjObJG0tIHoGmEi3W', '01646827748', 'Hutech University, ho chi minh', NULL, '2019-03-13 14:37:17', '2019-03-13 14:37:17'),
(10, 'abc ngocphu', 'admin123@gmail.com', '$2y$10$yHhbc7/TqV4AeFLomVUGJuu3U3/QOhmWKYTjhTukm6FcTvcCEn06q', '01646827748', 'Hutech University, ho chi minh', NULL, '2019-03-13 15:07:51', '2019-03-13 15:07:51');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
