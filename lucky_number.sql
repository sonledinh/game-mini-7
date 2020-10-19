-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 18, 2020 lúc 11:12 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `lucky_number`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `log_staff_turn`
--

CREATE TABLE `log_staff_turn` (
  `log_staff_turn_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `lucky_type` int(11) DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `luckys`
--

CREATE TABLE `luckys` (
  `lucky_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `lucky_type` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lucky_type`
--

CREATE TABLE `lucky_type` (
  `id` int(11) NOT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lucky_type`
--

INSERT INTO `lucky_type` (`id`, `total`) VALUES
(1, '1'),
(2, '1'),
(3, '5'),
(4, '5'),
(5, '10');

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
-- Cấu trúc bảng cho bảng `staffs`
--

CREATE TABLE `staffs` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `ho_ten` varchar(24) DEFAULT NULL,
  `gioi_tinh` varchar(9) DEFAULT NULL,
  `ngay_sinh` varchar(17) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `chuc_danh` varchar(55) DEFAULT NULL,
  `bo_phan` varchar(29) DEFAULT NULL,
  `ngay_vao` varchar(10) DEFAULT NULL,
  `nam_vao` varchar(4) DEFAULT NULL,
  `so_dt` varchar(13) DEFAULT NULL,
  `khu_vuc` varchar(7) DEFAULT NULL,
  `thang_sn` varchar(8) DEFAULT NULL,
  `ngay_nghi_viec` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `staffs`
--

INSERT INTO `staffs` (`id`, `staff_id`, `ho_ten`, `gioi_tinh`, `ngay_sinh`, `email`, `chuc_danh`, `bo_phan`, `ngay_vao`, `nam_vao`, `so_dt`, `khu_vuc`, `thang_sn`, `ngay_nghi_viec`) VALUES
(1, 102774, 'Nguyễn Thanh Hương', 'Nữ', '26/11/1985', 'huongnguyenthanh@admicro.vn', 'Trưởng phòng', 'Content Marketing', '11/12/2013', '2013', '0912329321', 'Hà Nội', '11', ''),
(2, 103343, 'Phùng Hải Long', 'Nam', '30/08/1988', 'longphunghai@admicro.vn', 'Phó phòng kinh doanh', 'Content Marketing', '8/11/2014', '2014', '0916656634', 'Hà Nội', '8', ''),
(3, 101367, 'Nguyễn Thị Thơm', 'Nữ', '28/12/1983', 'thomnguyenthi@admicro.vn', 'NV Marketing', 'Content Marketing', '5/21/2012', '2012', '0906143002', 'Hà Nội', '12', ''),
(4, 106343, 'Hà Thanh Xuân', 'Nữ', '12/02/1991', 'xuanhathanh@admicro.vn', 'Trợ lý bộ phận', 'Content Marketing', '11/28/2017', '2017', '0919729880', 'Hà Nội', '2', '24/08/2020'),
(5, 103487, 'Lê Xuân Linh - KN', 'Nữ', '03/02/1987', 'linhlexuan@admicro.vn', 'Trưởng bộ phận', 'Social Media', '9/26/2014', '2014', '0904835779', 'Hà Nội', '2', ''),
(6, 105693, 'Trần Vinh Phong', 'Nam', '24/06/1994', 'Phongtranvinh@admicro.vn', 'NV phát triển nội dung MXH', 'Social Media', '4/19/2017', '2017', '0902685602', 'TP HCM', '6', ''),
(7, 105844, 'Nguyễn Huỳnh Khôi Nguyên', 'Nam', '10/09/1992', 'Nguyennguyenhuynhkhoi@admicro.vn', 'Trưởng nhóm Social Creative', 'Creative', '6/6/2017', '2017', '0935792109', 'TP HCM', '9', ''),
(8, 107877, 'Lê Ngọc Thùy Dương', 'Nữ', '20/04/1997', 'duonglengocthuy@admicro.vn', 'NV sáng tạo', 'Social Media', '9/9/2019', '2019', '0905333807', 'TP HCM', '4', ''),
(9, 105891, 'Phạm Thị Thùy Trang', 'Nữ', '09/01/1995', 'Trangphamthithuy@admicro.vn', 'Account Social Planning', 'Social Media', '6/5/2017', '2017', '0945002091', 'Hà Nội', '1', ''),
(10, 106028, 'Phạm Quang Hưng', 'Nam', '30/04/1994', 'Hungphamquang@admicro.vn', 'Trưởng nhóm account social HCM', 'Social Media', '8/14/2017', '2017', '0765160452', 'TP HCM', '4', ''),
(11, 106102, 'Phạm Thị Hồng Ngọc', 'Nữ', '09/09/1995', 'ngocphamthihong@admicro.vn', 'Vận hành Social', 'Social Media', '9/11/2017', '2017', '0354900760', 'Hà Nội', '9', '25/5/2020'),
(12, 106148, 'Phạm Ngọc Huệ', 'Nữ', '06/04/1995', 'huephamngoc@admicro.vn', 'NV sản xuất video', 'Social Media', '9/26/2017', '2017', '0349386695', 'Hà Nội', '4', '13/5/2020'),
(13, 106226, 'Lê Ngọc Ánh', 'Nữ', '16/12/1995', 'Anhlengoc@admicro.vn', 'NV thiết kế', 'Social Media', '10/18/2017', '2017', '0987465415', 'Hà Nội', '12', ''),
(14, 106408, 'Đinh Thị Thùy Linh', 'Nữ', '04/11/1995', 'Dinhthithuylinh03@admicro.vn', 'NV phát triển nội dung trên MXH', 'Social Media', '12/13/2017', '2017', '0987105383', 'Hà Nội', '11', '31/09/2020'),
(15, 106419, 'Bùi Vân Anh', 'Nữ', '24/01/1995', 'Anhbuivan@admicro.vn', 'NV quản lý mạng xã hội', 'Social Media', '12/26/2017', '2017', '0934371880', 'Hà Nội', '1', '6/8/2020'),
(16, 106520, 'Chu Thị Phương Thảo', 'Nữ', '26/10/1996', 'Thaochuthiphuong@admicro.vn', 'NV thiết kế', 'Social Media', '2/26/2018', '2018', '0375974448', 'Hà Nội', '10', ''),
(17, 106623, 'Tạ Phương Anh', 'Nam', '26/01/1996', 'anhtaphuong@admicro.vn', 'NV thiết kế', 'Social Media', '3/5/2018', '2018', '0396254674', 'TP HCM', '1', ''),
(18, 106617, 'Lê Đức Bình', 'Nam', '17/10/1994', 'Binhleduc@admicro.vn', 'NV quản lý cộng đồng MXH', 'Social Media', '3/15/2018', '2018', '0386588668', 'Hà Nội', '10', ''),
(19, 106532, 'Nguyễn Ngọc Trang', 'Nữ', '23/09/1995', 'Trangnguyenngoc@admicro.vn', 'NV phát triển nội dung MXH', 'Social Media', '3/1/2018', '2018', '0911425310', 'Hà Nội', '9', ''),
(20, 107155, 'Phạm Minh Sơn', 'Nam', '12/12/1992', 'sonphamminh@admicro.vn', 'NV phát triển nội dung MXH', 'Social Media', '10/15/2018', '2018', '0708046225', 'TP HCM', '12', ''),
(21, 106986, 'Đặng Thị Thu Hà', 'Nữ', '04/10/1992', 'Dangthithuha02@admicro.vn', 'Trưởng nhóm thiết kế', 'Social Media', '7/9/2018', '2018', '0911044139', 'Hà Nội', '10', ''),
(22, 107199, 'Lê Khánh Linh', 'Nữ', '25/02/1995', 'Linhlekhanh@admicro.vn', 'CV quản lý MXH', 'Creative', '11/15/2018', '2018', '0344277069', 'Hà Nội', '2', '4/7'),
(23, 107285, 'Lê Tuyết Nga', 'Nữ', '09/09/1996', 'Ngaletuyet@admicro.vn', 'NV phát triển nội dung MXH', 'Social Media', '12/26/2018', '2018', '0386395469', 'Hà Nội', '9', ''),
(24, 107422, 'Ngô Đức Việt', 'Nam', '14/10/1997', 'Vietngoduc@admicro.vn', 'NV tư vấn và lập kế hoạch truyền thông', 'Social Media', '4/9/2019', '2019', '0943678806', 'Hà Nội', '10', ''),
(25, 107450, 'Nguyễn Linh Phương', 'Nữ', '10/10/1995', 'Phuongnguyenlinh@admicro.vn', 'NV tư vấn và lập kế hoạch truyền thông', 'Social Media', '4/16/2019', '2019', '0961215272', 'Hà Nội', '10', '4/7'),
(26, 107493, 'Thân Thị Thùy Dương', 'Nữ', '15/03/1991', 'Duongthanthithuy@admicro.vn', 'Biên tập viên', 'Social Media', '5/6/2019', '2019', '0939623738', 'TP HCM', '3', ''),
(27, 107498, 'Hoàng Minh Thắng', 'Nam', '02/09/1994', 'Thanghoangminh@admicro.vn', 'NV thiết kế', 'Social Media', '5/6/2019', '2019', '0376638406', 'Hà Nội', '9', '6/8/2020'),
(28, 107537, 'Trương Định Quốc', 'Nam', '27/09/1998', 'Quoctruongdinh@admicro.vn', 'NV sáng tạo', 'Social Media', '5/27/2019', '2019', '0904461484', 'TP HCM', '9', ''),
(29, 107600, 'Nguyễn Tú My', 'Nữ', '08/02/1995', 'mynguyentu@admicro.vn', 'CV tư vấn và lập KH truyền thông', 'Social Media', '6/11/2019', '2019', '0833081994', 'TP HCM', '2', ''),
(30, 107635, 'Dương Nhật Nam', 'Nam', '17/07/1990', 'Namduongnhat@admicro.vn', 'NV Phát triển sản phẩm', 'Social Media', '6/12/2019', '2019', '0869639636', 'Hà Nội', '7', ''),
(31, 107640, 'Nguyễn Ngọc Thúy', 'Nữ', '28/07/1997', 'Thuynguyenngoc@admicro.vn', 'NV sáng tạo', 'Social Media', '6/10/2019', '2019', '09429392364', 'Hà Nội', '7', ''),
(32, 107751, 'Nguyễn Hoài Nam', 'Nam', '25/10/1991', 'Nguyenhoainam02@admicro.vn', 'NV tư vấn và lập kế hoạch truyền thông MXH', 'Social Media', '7/29/2019', '2019', '0934407649', 'Hà Nội', '10', ''),
(33, 107739, 'Nguyễn Thị Hồng Hạnh', 'Nữ', '17/03/1997', 'nguyenthihonghanh02@admicro.vn', 'Vận hành Social', 'Social Media', '8/1/2019', '2019', '0355140318', 'Hà Nội', '3', '21/09/2020'),
(34, 107932, 'Lê Ngọc Linh', 'Nữ', '28/10/1996', 'linhlengoc@admicro.vn', 'NV phát triển nội dung', 'Social Media', '9/23/2019', '2019', '038 354 6798 ', 'TP HCM', '10', '25/10/2020'),
(35, 107784, 'Mai Thị Nhật', 'Nữ', '08/12/1995', 'Nhatmaithi@admicro.vn', 'CV sáng tạo', 'Social Media', '8/5/2019', '2019', '0984983409', 'Hà Nội', '12', '3/3/2020'),
(36, 107740, 'Phạm Ngọc Quỳnh Trâm', 'Nữ', '12/06/1996', 'Tramphamngocquynh@admicro.vn', 'NV quản lý MXH', 'Social Media', '8/5/2019', '2019', '0948021996', 'Hà Nội', '6', ''),
(37, 107797, 'Nguyễn Thị Thúy Nga', 'Nữ', '25/09/1995', 'nguyenthithuynga02@admicro.vn', 'NV phát triển kinh doanh', 'Social Media', '8/15/2019', '2019', '0968656328', 'Hà Nội', '9', ''),
(38, 107110, 'Nguyễn Lê Anh Phương', 'Nữ', '19/12/1996', 'Phuongnguyenleanh@admicro.vn', 'NV tư vấn và lập kế hoạch truyền thông', 'Social Media', '8/13/2019', '2019', '0969191296', 'Hà Nội', '12', ''),
(39, 107875, 'Nghiêm Phan Hạnh', 'Nữ', '14/09/1995', 'Hanhnghiemphan@admicro.vn', 'NV thiết kế', 'Social Media', '8/28/2019', '2019', '0357682154', 'Hà Nội', '9', ''),
(40, 107882, 'Chung Tùng Chí', 'Nam', '12/06/1996', 'chichungtung@admicro.vn', 'NV tư vấn và lập KH truyền thông', 'Social Media', '9/3/2019', '2019', '0926966391', 'TP HCM', '6', ''),
(41, 106952, 'Đinh Thị Lan Phương', 'Nữ', '25/10/1995', 'phuongdinhthilan@admicro.vn', 'NV tư vấn và lập kế hoạch truyền thông', 'Social Media', '6/18/2018', '2018', '0986713648', 'Hà Nội', '10', ''),
(42, 100202, 'Phạm Đỗ Quyên', 'Nữ', '31/07/1984', 'quyenphamdo@admicro.vn', 'CV tư vấn và lập kế hoạch truyền thông', 'Booking', '8/24/2011', '2011', '0912416277', 'Hà Nội', '7', ''),
(43, 104700, 'Đỗ Quốc Minh', 'Nam', '03/03/1991', 'minhdoquoc@admicro.vn', 'Trưởng nhóm account KH chiến lược', 'KHCL', '3/10/2016', '2016', '0942186986', 'Hà Nội', '3', ''),
(44, 106281, 'Chu Thị Minh Phương', 'Nữ', '19/08/1994', 'Phuongchuthiminh@admicro.vn', 'CV tư vấn và lập kế hoạch truyền thông', 'Account Tổng thể', '11/6/2017', '2017', '0942186986', 'Hà Nội', '8', ''),
(45, 106710, 'Lê Thùy Trang', 'Nữ', '18/06/1995', 'Lethuytrang02@admicro.vn', 'NV tư vấn và lập kế hoạch truyền thông', 'KHCL', '4/9/2018', '2018', '0917672504', 'Hà Nội', '6', ''),
(46, 107590, 'Nguyễn Thị Ngọc Hà', 'Nữ', '08/09/1995', 'Hanguyenthingoc@admicro.vn', 'NV tư vấn và lập kế hoạch truyền thông', 'KHCL', '6/11/2019', '2019', '0983668995', 'Hà Nội', '9', ''),
(47, 107684, 'Lê Ngọc Thủy Trang', 'Nữ', '13/08/1995', 'Tranglengocthuy@admicro.vn', 'NV tư vấn và lập kế hoạch truyền thông', 'Account Tổng thể', '7/8/2018', '2018', '0766669966', 'Hà Nội', '8', '25/5/2020'),
(48, 107768, 'Nguyễn Thanh Tùng', 'Nam', '09/12/1993', 'Tungnguyenthanh@admicro.vn', 'NV tư vấn và lập kế hoạch truyền thông', 'KHCL', '7/29/2019', '2019', '0912348778', 'Hà Nội', '12', ''),
(49, 107854, 'Bùi Bích Phượng', 'Nữ', '05/06/1994', 'buibichphuong02@admicro.vn', 'Senior Account Planner', 'KHCL', '9/9/2019', '2019', '0982858707', 'Hà Nội', '6', ''),
(50, 107896, 'Nguyễn Phi Hùng', 'Nam', '13/08/1994', 'Hungnguyenphi@admicro.vn', 'CV tư vấn và lập kế hoạch truyền thông', 'Account Tổng thể', '9/5/2019', '2019', '0985705894', 'Hà Nội', '8', '30/4/2020'),
(51, 106712, 'Nguyễn Thị Quỳnh Trang', 'Nữ', '05/12/1993', 'Trangnguyenthiquynh@admicro.vn', 'CV tư vấn và lập kế hoạch truyền thông', 'KHCL', '4/9/2018', '2018', '0977786002', 'Hà Nội', '12', '31/5/2020'),
(52, 101357, 'Nguyễn Thị Như Anh', 'Nữ', '26/11/1989', 'anhnguyenthinhu@admicro.vn', 'Trưởng bộ phận', 'Campaign Hà Nội', '5/21/2012', '2012', '0912494707', 'Hà Nội', '11', ''),
(53, 105300, 'Đặng Minh Châu', 'Nữ', '28/04/1995', 'Chaudangminh@Admicro.vn', 'NV tư vấn và lập kế hoạch truyền thông', 'Campaign Hà Nội', '9/26/2016', '2016', '0356373453', 'Hà Nội', '4', ''),
(54, 105696, 'Nguyễn Trung Hiệp', 'Nam', '18/12/1995', 'hiepnguyentrung@admicro.vn', 'NV Phát triển sản phẩm', 'Campaign Hà Nội', '4/16/2017', '2017', '0345817619', 'Hà Nội', '12', ''),
(55, 106631, 'Nguyễn Cẩm Giang', 'Nữ', '30/03/1994', 'Giangnguyencam@admicro.vn', 'NV tổ chức sự kiện', 'Campaign Hà Nội', '4/2/2018', '2018', '0983284994', 'Hà Nội', '3', '16/09/2020'),
(56, 107016, 'Hồ Thị Thanh Lan', 'Nữ', '06/07/1990', 'Lanhothithanh@admicro.vn', 'NV phát triển nội dung', 'Campaign Hà Nội', '7/26/2018', '2018', '0373940041', 'Hà Nội', '7', ''),
(57, 107231, 'Đỗ Minh Hồng', 'Nữ', '12/09/1988', 'Hongdominh@admicro.vn', 'NV phát triển nội dung ngành Dược', 'Campaign Hà Nội', '11/26/2018', '2018', '0915786203', 'Hà Nội', '9', ''),
(58, 107293, 'Đặng Phương Anh', 'Nữ', '26/06/1996', 'Anhdangphuong@admicro.vn', 'NV tối ưu vận hành sản phẩm', 'Campaign Hà Nội', '1/8/2019', '2019', '0382436840', 'Hà Nội', '6', '10/3/2020'),
(59, 107322, 'Lê Trung Anh', 'Nam', '15/06/1997', 'Anhletrung@admicro.vn', 'CV phát triển sản phẩm', 'Campaign Hà Nội', '3/4/2019', '2019', '0356636861', 'Hà Nội', '6', ''),
(60, 107352, 'Phạm Thiên Trang', 'Nữ', '27/07/1993', 'Trangphamthien@admicro.vn', 'NV tư vấn và lập kế hoạch truyền thông', 'Campaign Hà Nội', '3/12/2019', '2019', '0942222496', 'Hà Nội', '7', ''),
(61, 107369, 'Phạm Ngọc Minh', 'Nam', '06/07/1994', 'Minhphamngoc@admicro.vn', 'NV vận hành SEO', 'Campaign Hà Nội', '3/19/2019', '2019', '0988776805', 'Hà Nội', '7', ''),
(62, 107402, 'Hà Sỹ Tuấn', 'Nam', '04/01/1993', 'Tuanhasy@admicro.vn', 'NV Phát triển sản phẩm', 'Campaign Hà Nội', '4/1/2019', '2019', '0962539678', 'Hà Nội', '1', ''),
(63, 107423, 'Nguyễn Bích Phương', 'Nữ', '07/06/1996', 'Phuongnguyenbich@admicro.vn', 'NV tư vấn và lập kế hoạch truyền thông', 'Campaign Hà Nội', '4/16/2019', '2019', '0988164809', 'Hà Nội', '6', '16/09/2020'),
(64, 107449, 'Lê Khánh Hương', 'Nữ', '02/04/1992', 'huonglekhanh@admicro.vn', 'NV vận hàng quảng cáo', 'Campaign Hà Nội', '4/12/2019', '2019', '0984631711', 'Hà Nội', '4', ''),
(65, 107533, 'Phùng Như Tuyết', 'Nữ', '20/04/1997', 'tuyetphungnhu@admicro.vn', 'NV phát triển sản phẩm', 'Campaign Hà Nội', '5/21/2019', '2019', '0932695455', 'TP HCM', '4', '31/5/2020'),
(66, 107522, 'Trần Anh Dũng', 'Nam', '10/09/1995', 'Dungtrananh@admicro.vn', 'NV Phát triển sản phẩm', 'Campaign Hà Nội', '5/22/2019', '2019', '0378071056', 'Hà Nội', '9', ''),
(67, 107574, 'Nguyễn Anh Tuấn', 'Nam', '22/03/1996', 'Nguyenanhtuan04@admicro.vn', 'NV phát triển Website', 'Campaign Hà Nội', '6/4/2019', '2019', '0365999525', 'Hà Nội', '3', ''),
(68, 107650, 'Hoàng Phương Anh', 'Nữ', '10/01/1996', 'Anhhoangphuong@admicro.vn', 'NV Phát triển sản phẩm', 'Campaign Hà Nội', '6/26/2019', '2019', '0983982029', 'Hà Nội', '1', ''),
(69, 107767, 'Hoàng Hồng Hạnh', 'Nữ', '10/08/1996', 'Hanhhoanghong@admicro.vn', 'NV vận hành quảng cáo', 'Campaign Hà Nội', '7/26/2019', '2019', '0903246953', 'Hà Nội', '8', ''),
(70, 108000, 'Nguyễn Danh Phương Thảo', 'Nữ', '27/10/1997', 'Thaonguyendanhphuong@admicro.vn', 'NV phát triển sản phẩm', 'Campaign Hà Nội', '10/1/2019', '2019', '0907271097', 'Hà Nội', '10', '01/07/2020'),
(71, 107332, 'Phạm Thanh Tùng', 'Nam', '05/08/1995', 'Tungphamthanh@admicro.vn', 'NV sáng tạo', 'Campaign Hà Nội', '3/26/2019', '2019', '0988781395', 'Hà Nội', '8', '30/4/2020'),
(72, 107953, 'Vũ Văn Lai', 'Nam', '26/05/1996', 'Laivuvan@admicro.vn', 'NV vận hành SEO', 'Campaign Hà Nội', '9/26/2019', '2019', '0988459011', 'Hà Nội', '5', '18/4/2020'),
(73, 108014, 'Nguyễn Ngọc Tài', 'Nam', '01/05/1996', 'tainguyenngoc@admicro.vn', 'Creative Executive', 'Campaign Hà Nội', '7/10/2019', '2019', '0948161078', 'Hà Nội', '5', ''),
(74, 108258, 'Nguyễn Đức Thiện', 'Nam', '30/10/1993', 'thiennguyenduc@admicro.vn', 'NV Phát triển sản phẩm', 'Campaign Hà Nội', '2/3/2020', '2020', '774129764', 'TP HCM', '10', ''),
(75, 103891, 'Lê Kim Thư', 'Nam', '05/09/1988', 'thulekim@admicro.vn', 'Trưởng bộ phận', 'Campaign HCM', '4/14/2015', '2015', '0835235113', 'TP HCM', '9', ''),
(76, 105343, 'Nguyễn Thị Mỹ Anh', 'Nữ', '15/02/1991', 'anhnguyenthimy@admicro.vn', 'NV tư vấn và lập KH truyền thông', 'Campaign HCM', '10/26/2016', '2016', '0938007958', 'TP HCM', '2', ''),
(77, 105530, 'Trần Hiệp Nhất Huỳnh', 'Nữ', '22/04/1992', 'Huynhtranhiepnhat@admicro.vn', 'NV tư vấn và lập KH truyền thông', 'Campaign HCM', '3/6/2017', '2017', '0768607068', 'TP HCM', '4', ''),
(78, 106044, 'Trần Tiến Đạt', 'Nam', '05/06/1994', 'Dattrantien@admicro.vn', 'NV tư vấn và lập KH truyền thông', 'Campaign HCM', '8/21/2017', '2017', '0969596894', 'TP HCM', '6', ''),
(79, 106562, 'Nguyễn Thị Thúy', 'Nữ', '23/07/1990', 'Nguyenthithuy02@admicro.vn', 'NV tư vấn và lập KH truyền thông', 'Campaign HCM', '4/2/2018', '2018', '0918228402', 'TP HCM', '7', ''),
(80, 106595, 'Hoàng Tuấn Kiệt', 'Nam', '15/06/1994', 'Kiethoangtuan@admicro.vn', 'NV tư vấn và lập KH truyền thông', 'Campaign HCM', '3/19/2018', '2018', '0342889632', 'TP HCM', '6', ''),
(81, 106987, 'Thái Ngọc Mai', 'Nữ', '17/03/1993', 'maithaingoc@admicro.vn', 'NV tư vấn và lập KH truyền thông', 'Campaign HCM', '7/9/2018', '2018', '988213168', 'TP HCM', '3', ''),
(82, 107488, 'Tài Huỳnh Bửu Quyên', 'Nữ', '03/05/1991', 'quyentaihuynhbuu@admicro.vn', 'NV tư vấn và lập KH truyền thông', 'Campaign HCM', '5/2/2019', '2019', '0907033578', 'TP HCM', '5', ''),
(83, 107487, 'Tăng Tiến Thịnh', 'Nam', '25/08/1995', 'thinhtangtien@admicro.vn', 'NV tư vấn và lập KH truyền thông', 'Campaign HCM', '5/2/2019', '2019', '0935134025', 'TP HCM', '8', ''),
(84, 107509, 'Nguyễn Phan Ngọc Duy', 'Nam', '03/08/1997', 'duynguyenphanngoc@admicro.vn', 'NV tư vấn và lập KH truyền thông', 'Campaign HCM', '5/13/2019', '2019', '0906989644', 'TP HCM', '8', ''),
(85, 107753, 'Vũ Nguyễn Hoàng Long', 'Nam', '31/03/1994', 'longvunguyenhoang@admicro.vn', 'NV tư vấn và lập KH truyền thông', 'Campaign HCM', '7/29/2019', '2019', '0922249524', 'TP HCM', '3', ''),
(86, 108248, 'Lê Phương Khanh', 'Nữ', '31/03/1994\n\n\n', 'khanhlephuong@admicro.vn', 'NV tư vấn và lập KH truyền thông', 'Campaign HCM', '31/01/2020', '2019', '785483114', 'TP HCM', '3', ''),
(87, 108243, 'Đặng Thị Cẩm Vân', 'Nữ', '17/08/1997', 'vandangthicam@admicro.vn', 'NV tư vấn và lập KH truyền thông', 'Campaign HCM', '3/2/2020', '2020', '0939 139 476', 'TP HCM', '8', ''),
(88, 101403, 'Nguyễn Thảo Uyên', 'Nữ', '08/08/1990', 'uyennguyenthao@admicro.vn', 'Trưởng bộ phận Visual Content', 'Visual Content', '5/14/2012', '2012', '0383550190', 'Hà Nội', '8', ''),
(89, 103180, 'Nguyễn Thùy Linh', 'Nữ', '28/11/1990', 'linhnguyenthuy@admicro.vn', 'CV thiết kế', 'Visual Content', '6/2/2014', '2014', '0948854499', 'Hà Nội', '11', ''),
(90, 104366, 'Đỗ Diễm My', 'Nữ', '14/08/1987', 'mydodiem@admicro.vn', 'CV thiết kế', 'Visual Content', '9/21/2015', '2015', '0912852323', 'Hà Nội', '8', ''),
(91, 106025, 'Trịnh Ngọc Cương', 'Nam', '18/11/1994', 'cuongtrinhngoc@admicro.vn', 'NV thiết kế', 'Visual Content', '8/14/2017', '2017', '0814528018', 'Hà Nội', '11', ''),
(92, 106191, 'Giang Hoàng Anh', 'Nam', '18/08/1989', 'anhgianghoang@admicro.vn', 'NV thiết kế', 'Visual Content', '10/4/2017', '2017', '0904689891', 'Hà Nội', '8', ''),
(93, 106615, 'Trần David Khánh Nam', 'Nam', '29/01/1993', 'DavidKhanhnam@admicro.vn', 'CV thiết kế', 'Visual Content', '3/6/2018', '2018', '0972948893', 'Hà Nội', '1', ''),
(94, 106668, 'Dương Thị Bình Minh', 'Nữ', '15/01/1992', 'Minhduongthibinh@admicro.vn', 'Họa sĩ minh họa', 'Visual Content', '4/2/2018', '2018', '0965370988', 'Hà Nội', '1', ''),
(95, 107053, 'Nguyễn Diệu Linh', 'Nữ', '04/08/1995', 'Linhnguyendieu@admicro.vn', 'CV thiết kế đồ hoạ động', 'Visual Content', '8/21/2018', '2018', '0962916477', 'Hà Nội', '8', ''),
(96, 107531, 'Trần Xuân Đức', 'Nam', '23/06/1991', 'Ductranxuan@admicro.vn', 'NV thiết kế minh họa', 'Visual Content', '6/3/2019', '2019', '0941895855', 'Hà Nội', '6', ''),
(97, 107856, 'Trần Phi Tân', 'Nam', '10/10/1998', 'tantranphi@admicro.vn', 'CV thiết kế', 'Visual Content', '8/22/2019', '2019', '0354073738', 'TP HCM', '10', '30/6/2020'),
(98, 104365, 'Đặng Thị Minh Phương', 'Nữ', '20/09/1989', 'phuongdangthiminh@admicro.vn', 'Trưởng nhóm sản phẩm', 'Sản phẩm', '9/8/2015', '2015', '0983376074', 'Hà Nội', '9', ''),
(99, 106960, 'Vũ Thị Hải Yến', 'Nữ', '29/10/1996', 'Yenvuthihai@admicro.vn', 'NV Phát triển sản phẩm', 'Sản phẩm', '6/19/2018', '2018', '0336656551', 'Hà Nội', '10', ''),
(100, 107425, 'Chu Thế Vinh', 'Nam', '29/03/1996', 'Vinhchuthe@admicro.vn', 'Lập trình viên', 'Sản phẩm', '4/26/2019', '2019', '0372954174', 'Hà Nội', '3', ''),
(101, 107553, 'Nguyễn Thị Thu Thủy', 'Nữ', '03/12/1997', 'Nguyenthithuthuy@admicro.vn', 'CV phát triển sản phẩm', 'Sản phẩm', '6/3/2019', '2019', '0947094711', 'Hà Nội', '12', ''),
(102, 108219, 'Nguyễn Thị Ngọc Trâm', 'Nữ', '12/08/1994', 'Tramnguyenthingoc@admicro.vn', 'Nhân viên phát triển sản phẩm', 'Content marketing', '10/4/2019', '2019', '0965879342', 'Hà Nội', '8', '18/09/2020'),
(103, 106644, 'Trịnh Quốc Sơn', 'Nam', '30/08/1992', '0', 'Lập trình viên', 'Sản phẩm', '4/2/2018', '2018', '0', 'Hà Nội', '8', '22/5/2020'),
(104, 105787, 'Nguyễn Thị Thu Hà', 'Nữ', '27/04/1989', 'Nguyenthithuha02@admicro.vn', 'NV Phát triển sản phẩm', 'Sản phẩm', '5/15/2017', '2017', '0985613288', 'Hà Nội', '4', '14/3/2020'),
(105, 104154, 'Phạm Thị Mỹ Dung', 'Nữ', '01/10/1982', 'dungphamthimy@admicro.vn', 'Trưởng bộ phận', 'Sản xuất nội dung chuyên biệt', '7/20/2015', '2015', '0942007097', 'TP HCM', '10', ''),
(106, 105779, 'Lưu Thị Vân', 'Nữ', '14/07/1987', 'Vanluuthi@admicro.vn', 'Trưởng nhóm', 'Sản xuất nội dung chuyên biệt', '5/22/2017', '2017', '0978007147', 'Hà Nội', '7', ''),
(107, 107843, 'Nguyễn Thị Yến Nhi', 'Nữ', '14/06/1994', 'nhinguyenthiyen@admicro.vn', 'Biên tập viên', 'Sản xuất nội dung chuyên biệt', '8/26/2019', '2019', '084 421 3239', 'TP HCM', '6', ''),
(108, 107937, 'Phù Mẫn Đạt', 'Nữ', '27/12/1996', 'datphuman@admicro.vn', 'NV phát triển sản phẩm', 'Sản xuất nội dung chuyên biệt', '9/23/2019', '2019', '905090123', 'TP HCM', '12', ''),
(109, 104886, 'Nguyễn Thị Thu Trang', 'Nữ', '11/11/1991', 'nguyenthithutrang@admicro.vn', 'Biên tập viên', 'Sản xuất nội dung chuyên biệt', '5/17/2016', '2016', '0938054023', 'TP HCM', '11', ''),
(110, 105039, 'Lê Thị Mai Hồng', 'Nữ', '10/03/1982', 'honglemai@admicro.vn', 'Biên tập viên', 'Sản xuất nội dung chuyên biệt', '7/13/2016', '2016', '0983340646', 'TP HCM', '3', ''),
(111, 105163, 'Nguyễn Hiền Trang', 'Nữ', '15/12/1987', 'trangnguyenhien@admicro.vn', 'Biên tập viên', 'Sản xuất nội dung chuyên biệt', '9/5/2016', '2016', '0976324268', 'Hà Nội', '12', ''),
(112, 103611, 'Lưu Thị Thanh Hòa', 'Nữ', '08/03/1986', 'hoaluuthithanh@admicro.vn', 'Account Manager', 'Content Marketing', '12/1/2014', '2014', '0987958786', 'Hà Nội', '3', ''),
(113, 106020, 'Trịnh Thị Tuyết Nga', 'Nữ', '10/05/1987', 'ngatrinhthituyet@admicro.vn', 'Biên tập viên', 'Sản xuất nội dung chuyên biệt', '8/14/2017', '2017', '0919814715', 'TP HCM', '5', ''),
(114, 106077, 'Nguyễn Tuấn Việt', 'Nam', '23/08/1989', 'vietnguyentuan@admicro.vn', 'Biên tập viên', 'Sản xuất nội dung chuyên biệt', '9/5/2017', '2017', '0936823889', 'Hà Nội', '8', ''),
(115, 106161, 'Nguyễn Hương Giang', 'Nữ', '28/01/1987', 'Giangnguyenhuong@admicro.vn', 'Biên tập viên', 'Sản xuất nội dung chuyên biệt', '10/2/2017', '2017', '0987280187', 'Hà Nội', '1', ''),
(116, 106207, 'Ngô Thị Quỳnh Anh', 'Nữ', '25/10/1993', 'anhngothiquynh@admicro.vn', 'Biên tập viên', 'Sản xuất nội dung chuyên biệt', '10/16/2017', '2017', '0766651072', 'TP HCM', '10', ''),
(117, 106838, 'Trần Thị Mai Hương', 'Nữ', '04/04/1995', 'Tranthimaihuong02@admicro.vn', 'Biên tập viên', 'Sản xuất nội dung chuyên biệt', '5/9/2018', '2018', '0965910903', 'TP HCM', '4', ''),
(118, 106858, 'Trần Thanh Xuân', 'Nữ', '18/10/1988', 'xuantranthanh@admicro.vn', 'Biên tập viên', 'Sản xuất nội dung chuyên biệt', '5/26/2018', '2018', '0908543627', 'TP HCM', '10', ''),
(119, 107526, 'Dương Bích Huyền', 'Nữ', '16/02/1995', 'Huyenduongbich@admicro.vn', 'Biên tập viên', 'Sản xuất nội dung chuyên biệt', '5/21/2019', '2019', '389002662', 'TP HCM', '2', ''),
(120, 107683, 'Nguyễn Anh Dũng', 'Nam', '10/08/1995', 'Dungnguyenanh@admicro.vn', 'Biên tập viên', 'Sản xuất nội dung chuyên biệt', '7/3/2019', '2019', '0974352361', 'Hà Nội', '8', ''),
(121, 107692, 'Lê Thị Thu Huyền', 'Nữ', '24/06/1994', 'Huyenlethithu@admicro.vn', 'Biên tập viên', 'Sản xuất nội dung chuyên biệt', '6/27/2019', '2019', '0332555336', 'Hà Nội', '6', ''),
(122, 107589, 'Cao Thị Quỳnh Nga', 'Nữ', '26/12/1996', 'Ngacaothiquynh@admicro.vn', 'Quản lý nhãn', 'QLN + BD', '6/11/2019', '2019', '0397663585', 'Hà Nội', '12', ''),
(123, 106023, 'Nguyễn Thị Ngọc Huyền', 'Nữ', '20/07/1989', 'huyennguyenthingoc@admicro.vn', 'Phát triển kinh doanh', 'QLN + BD', '8/18/2017', '2017', '0912389010', 'Hà Nội', '7', '7/10'),
(124, 107087, 'Đào Trọng Kiên', 'Nam', '06/08/1994', 'Kiendaotrong@admicro.vn', 'Nhân viên phát triển sản phẩm', 'Content SMB', '9/11/2018', '2018', '0904098959', 'Hà Nội', '8', '25/2/2020'),
(125, 101107, 'Hoàng Vũ Quỳnh Trang', 'Nữ', '27/08/1988', 'tranghoangvuquynh@admicro.vn', 'Trưởng nhóm', 'Booking', '3/21/2012', '2012', '0985891519', 'Hà Nội', '8', ''),
(126, 106788, 'Nguyễn Thị Tuyết', 'Nữ', '30/07/1995', 'Nguyenthituyet02@admicro.vn', 'NV tư vấn và lập kế hoạch truyền thông', 'Booking', '5/2/2018', '2018', '0349212253', 'Hà Nội', '7', ''),
(127, 106506, 'Phạm Nguyễn Ngọc Trang', 'Nữ', '19/10/1994', 'trangphamnguyenngoc@admicro.vn', 'NV tư vấn và lập kế hoạch truyền thông', 'Booking', '2/1/2018', '2018', '0941897181', 'Hà Nội', '10', ''),
(128, 107931, 'Lưu Thu Hà', 'Nữ', '11/03/1997', 'Haluuthu@admicro.vn', 'NV vận hành quảng cáo', 'Booking', '9/16/2019', '2019', '0947610047', 'Hà Nội', '3', ''),
(129, 106913, 'Nguyễn Hà Phương', 'Nữ', '15/06/1995', 'nguyenhaphuong02@admicro.vn', 'Account executive', 'Campaign HN', '14/10/2019', '2019', '', 'Hà Nội', '6', ''),
(130, 108220, 'Trần Thị Thu Thủy', 'Nữ', '10/08/1996', 'Tranthithuthuy02@admicro.vn', 'Account Planner', 'Campaign HN', '15/10/2019', '2019', '0367488546', 'Hà Nội', '8', '31/08/2020'),
(131, 108047, 'Ngô Hoàng Dương', 'Nam', '17/12/1992', 'duongngohoang@admicro.vn', 'Media Ads Manager', 'Social Media', '14/10/2019', '2019', '', 'Hà Nội', '12', '1/6/2020'),
(132, 108051, 'Nguyễn Thị Minh Phương', 'Nữ', '18/01/1986', 'phuongnguyenthiminh@admicro.vn', 'Copywriter', 'Sản xuất nội dung chuyên biệt', '18/10/2019', '2019', '0983618186', 'TP HCM', '1', ''),
(133, 108048, 'Đỗ Nguyễn Ngọc Anh', 'Nữ', '12/07/1996', 'Anhdonguyenngoc@admicro.vn', 'NV tư vấn và lập KH truyền thông', 'Social Media', '28/10/2019', '2019', '0936315197', 'Hà Nội', '7', ''),
(134, 108100, 'Nguyễn Thị Thanh Hiền', 'Nữ', '19/02/1995', 'Hiennguyenthithanh@admicro.vn', 'CV tư vấn và lập KH truyền thông', 'Social Media', '4/11/2019', '2019', '0383806970', 'Hà Nội', '2', ''),
(135, 108135, 'Nguyễn Thị Thùy Linh', 'Nữ', '20/4/1995', 'nguyenthithuylinh@admicro.vn', 'Account SMB', 'Social Media', '11/11/2019', '2019', '', 'Hà Nội', '4', ''),
(136, 108147, 'Nguyễn Thị Phương Thảo', 'Nữ', '11/06/1998', 'nguyenthiphuongthao04@admicro.vn', 'Social account', 'Creative', '11/11/2019', '2019', '0357392892', 'Hà Nội', '6', ''),
(137, 108176, 'Nguyễn Hoàng Kiên', 'Nam', '14/09/1997', 'Kiennguyenhoang@admicro.vn', 'NV sáng tạo', 'Campaign HN', '12/2/2019', '2019', '0922049690', 'Hà Nội', '9', ''),
(138, 0, 'Trần Thái Hà', 'Nữ', '10/09/1998', '', '', '', '', '1899', '', 'Hà Nội', '9', '10/2/2020'),
(139, 108197, 'Đặng Doanh Quảng', 'Nam', '16/03/1995', 'quangdangdoanh@admicro.vn', 'NV phát triển Creative Website', 'Campaign HN', '2/12/2019', '2019', '0987667106', 'Hà Nội', '3', ''),
(140, 0, 'Đường Như Ngọc', 'Nữ', '24/02/1994', '', '', '', '', '1899', '0898489904', 'Hà Nội', '2', '13/4/2020'),
(141, 108202, 'Hoàng Thu Hà', 'Nữ', '02/05/1995', 'Hahoangthu@admicro.vn', 'Senior Account Planner', 'Social Media', '23/12/2019', '2019', '374 796 695', 'Hà Nội', '5', ''),
(142, 108193, 'Đào Thùy Linh', 'Nữ', '23/08/1996', 'linhdaothuy@admicro.vn', 'Account executive', 'Sản phẩm', '16/3/2020', '2020', '0364787672', 'Hà Nội', '10', ''),
(143, 108273, 'Nguyễn Bùi Lan Vy', 'Nữ', '06/06/1995', 'Vynguyenbuilan@admicro.vn', 'CV tư vấn và lập KH truyền thông', 'KHCL', '2/10/2020', '2020', '969716766', 'Hà Nội ', '6', ''),
(144, 106854, 'Nguyễn Thị Huyền Trang', 'Nữ', '11/08/1995', 'nguyenthihuyentrang02@admicro.vn', 'Account Executive', 'KHCL', '1/2/2020', '2020', '', 'Hà Nội', '8', '7/7'),
(145, 106809, 'Nguyễn Xuân Thắng', 'Nam', '09/08/1997', 'thangnguyenxuan@admicro.vn', 'NV phát triển sản phẩm', 'Campaign Hn', '2/5/2018', '2018', '936331997', 'Hà Nội', '8', ''),
(146, 108229, 'Lê Thị Thanh Vi', 'Nữ', '09/05/1995', 'vilethithanh@admicro.vn', 'Social account', 'Social Media', '1/6/2020', '2020', '902930995', 'TP HCM', '5', '14/08'),
(147, 108373, 'Hoàng Bảo Châu', 'Nữ', '19/06/1997', 'Chauhoangbao@admicro.vn', 'CV tư vấn và lập KH truyền thông', 'Campaign HN', '2/3/2020', '2020', '969190697', 'Hà Nội', '6', '4/6/2020'),
(148, 108242, 'Phan Đăng Vân Anh ', 'Nữ', '26/09/1996', ' anhphandangvan@admicro.vn', 'Thiết kế', 'Social Media', '13/01/2020', '2020', '965276062', 'TP HCM', '9', ''),
(149, 108433, 'Nguyễn Thị Hương Thảo', 'Nữ', '29/08/1986', 'thaonguyenthihuong@admicro.vn', 'admin', 'Content Marketing', '16/3/2020', '2020', '982884886', 'Hà Nội', '8', '16/4/2020'),
(150, 108096, 'Hoàng Trần Minh Anh', 'Nữ', '6//8/1997', 'anhhoangtranminh@admicro.vn', 'Account executive', 'KHCL', '16/3/2020', '2020', '933528668', 'Hà Nội', '8', '12/10/2020'),
(151, 108456, 'Trần Nam Trung', 'Nam', '27/5/1988', 'Trungtrannam@admicro.vn', '	Trưởng nhóm tối ưu quảng cáo trên Facebook', 'Social media', '26/03/2020', '2020', '388636789', 'Hà Nội', '5', '11/4/2020'),
(152, 108485, 'Nguyễn Huy Dũng', 'Nam', '24/8/1995', 'Dungnguyenhuy@admicro.vn', 'NV phát triển sản phẩm', 'Social media', '30/03/2020', '2020', '972206707', 'Hà Nội', '8', '07/2020'),
(153, 108500, 'Phạm Đức Quân', 'Nam', '10/07/1990', 'Quanphamduc@admicro.vn', 'CV tối ưu quảng cáo', 'Social media', '16/04/2020', '2020', '918259900', 'Hà Nội', '7', '23/4/2020'),
(154, 108508, 'Nguyễn Phương Linh', 'Nữ', '24/8/1995', 'Nguyenphuonglinh02@admicro.vn', 'CV tư vấn và lập KH truyền thông', 'Content Marketing', '16/4/2020', '2020', '368708491', 'Hà Nội', '8', ''),
(155, 108535, 'Lê Ngọc Huyền', 'Nữ', '22/9/1995', 'huyenlengoc@admicro.vn', 'CV tư vấn và lập KH truyền thông', 'Social media', '4/5/2020', '2020', '375899698', 'Hà Nội', '9', ''),
(156, 108539, 'Nguyễn Hồng Diệp', 'Nữ', '10/11/1991', 'diepnguyenhong@admicro.vn', 'CW', 'Social media', '16/5/2020', '2020', '982943687', 'Hà Nội', '11', ''),
(157, 108573, 'Vương Duy Khánh', 'Nam', '3/5/1989', 'Khanhvuongduy@admicro.vn', 'NV sản xuất video', 'Social media', '1/6/2020', '2020', '357195119', 'Hà Nội', '5', ''),
(158, 108574, 'Trần Mỹ Linh', 'Nữ', '1/12/1998', 'Linhtranmy@admicro.vn', 'NV phát triển sản phẩm', 'Social media', '1/6/2020', '2020', '353591534', 'Hà Nội', '12', ''),
(159, 108572, 'Nguyễn Thành Trung', 'Nam', '15/4/1998', 'nguyenthanhtrung02@admicro.vn', 'NV phát triển sản phẩm', 'Social media', '1/6/2020', '2020', '919170226', 'Hà Nội', '4', ''),
(160, 108575, 'Lê Anh Quân', 'Nam', '18/10/1996', 'Quanleanh@admicro.vn', 'CV tư vấn và lập KH truyền thông', 'KHCL', '4/6/2020', '2020', '838885596', 'Hà Nội', '10', ''),
(161, 108597, 'Lê Đình Sơn', 'Nam', '20/9/1995', 'Sonledinh@admicro.vn', 'Lập trình viên', 'Sản phẩm', '8/6/2020', '2020', '964150069', 'Hà Nội', '9', ''),
(162, 108586, 'Nguyễn Minh Hiếu', 'Nam', '5/13/1995', 'Hieunguyenminh@admicro.vn', 'CV tư vấn và lập KH truyền thông', 'Campaign HN', '3/6/2020', '2020', '', 'Hà Nội', '5', ''),
(163, 108604, 'Phạm Bích Thảo', 'Nữ', '2/10/1995', 'thaophambich@admicro.vn', 'CV tư vấn và lập KH truyền thông', 'Social media', '12/6/2020', '2020', '983293892', 'Hà Nội', '2', ''),
(164, 108617, 'Nguyễn Huyền Trang', 'Nữ', '08/08/1990', 'Nguyenhuyentrang03@admicro.vn', 'Trợ lý bộ phận', 'Content Marketing', '22/6/2020', '2020', '395881990', 'Hà Nội', '8', ''),
(165, 108601, 'Đỗ Hồng Ngọc', 'Nữ', '25/03/1986', 'dohongngoc02@admicro.vn', 'Social media', 'Social Media', '15/06/2020', '2020', '949548683', 'TP HCM', '3', ''),
(166, 108665, 'Trần Thị Thùy Linh', 'Nữ', '13/11/1997', 'Tranthithuylinh@admicro.vn', 'Nhân viên Marketing', 'Campaign Hà Nội', '7/7/2020', '2020', '357842221', 'Hà Nội', '11', ''),
(167, 108660, 'Lê Thiên Thiên', 'Nữ', '26/07/1991', 'thienlethien@admicro.vn', 'CV tư vấn và lập KH truyền thông', 'Campaign Hà Nội', '13/07/2020', '2020', '909926791', 'TP HCM', '7', ''),
(168, 108683, 'Đặng Thị Tú Anh', 'Nữ', '01/11/1996', 'dangthituanh@admicro.vn', 'Account executive', 'Social Media', '15/07/2020', '2020', '0855257175', 'Hà Nội', '11', ''),
(169, 108684, 'Chu Anh Quân', 'Nam', '21/03/1993', 'Quanchuanh@admicro.vn', 'Account Executive', 'KHCL', '20/07/2020', '2020', '916521393', 'Hà Nội', '3', ''),
(170, 108687, 'Nguyễn Ngọc Anh', 'Nữ', '24/03/1997', 'Nguyenngocanh03@admicro.vn', 'Account Executive', 'KHCL', '20/07/2020', '2020', '834339797', 'Hà Nội', '3', ''),
(171, 108702, 'Vũ Tuấn Tú', 'Nam', '14/10/1993', 'tuvutuan@admicro.vn', 'Quản lý nhãn', 'Acc Tổng', '21/07/2020', '2020', '373693466', 'Hà Nội', '10', ''),
(172, 107690, 'Nguyễn Anh Dũng', 'Nam', '18/08/1995', 'nguyenanhdung02@admicro.vn', 'Account Executive', 'KHCL', '1/7/2020', '2020', '0964919998', 'Hà Nội', '8', ''),
(173, 102842, 'Nguyễn Thị Thảo', 'Nữ', '08/12/1993', 'thaonguyenthi@admicro.vn', 'CV tư vấn và lập KH truyền thông', 'Campaign Hà Nội', '27/07/2020', '2020', '961687812', 'Hà Nội', '12', ''),
(174, 108713, 'Lê Hải Linh', 'Nữ', '11/07/1998', 'linhlehai@admicro.vn', 'Account Executive', 'Social Media', '27/07/2020', '2020', '357247700', 'Hà Nội', '7', ''),
(178, 108731, 'Quách Quỳnh Trang', 'Nữ', '05/02/1995', 'trangquachquynh@admicro.vn', 'Senior Account ', 'Sản phẩm', '31/07/2020', '2020', '0916451995', 'Hà Nội', '2', ''),
(179, 108760, 'Lê Diệu Thủy', 'Nữ', '25/05/1995', 'Thuyledieu@admicro.vn', 'Senior Account Executive', 'Social Media', '10/8/2020', '2020', '947865752', 'Hà Nội', '5', ''),
(180, 108732, 'Vũ Ngọc Việt Phương', 'Nữ', '17/11/1992', 'Phuongvuvietngoc@admicro.vn', 'Account Executive', 'Social Media', '10/8/2020', '2020', '906299219', 'Hà Nội', '11', ''),
(181, 108733, 'Vũ Thị Thu Hà', 'Nữ', '27/06/1997', 'Havuthithu@admicro.vn', 'Creative ', 'Social Media', '10/8/2020', '2020', '376845768', 'Hà Nội', '6', ''),
(182, 107738, 'Hoàng Hà Linh', 'Nữ', '19/05/1997', 'linhhoangha@admicro.vn', 'Account Executive', 'KHCL', '10/8/2020', '2020', '916190597', 'Hà Nội', '5', ''),
(183, 108766, 'Trần Đình Lan Anh', 'Nữ', '09/05/1999', 'anhtrandinhlan@admicro.vn', 'Quản Trị Website (part time)', 'Campaign Hà Nội', '12/8/2020', '2020', '968748707', 'Hà Nội', '5', '17/09/2020'),
(184, 105742, 'Nguyễn Thị Hà', 'Nữ', '04/02/1989', 'nguyenthiha01@admicro.vn', 'Trưởng nhóm Mua ngoài', 'Social Media', '2/5/2017', '2017', '0979 962 812 ', 'Hà Nội', '4', ''),
(185, 107874, 'Nguyễn Thị Mơ', 'Nữ', '18/08/1993', 'monguyenthi@admicro.vn', 'Nhân viên mua ngoài', 'Social Media', '28/08/2019', '2019', '981887893', 'Hà Nội', '8', ''),
(186, 108647, 'Đặng Thị Hoài', 'Nữ', '08/08/1993', 'hoaidangthi@admicro.vn', 'Nhân viên mua ngoài', 'Social Media', '6/7/2020', '2020', '377520416', 'Hà Nội', '8', ''),
(187, 108336, 'Lê Hương Thảo', 'Nữ', ' 23/05/1997', 'thaolehuong@admicro.vn        ', 'Nhân viên mua ngoài', 'Social Media', '26/02/2020', '2020', '968242599', 'Hà Nội', '5', ''),
(188, 108790, 'Vũ Hoàng Yến', 'Nữ', '08/03/1997', 'yenvuhoang@admicro.vn', 'Account Executive', 'Social Media', '19/8/2020', '2020', '948813536', 'TP HCM', '3', ''),
(189, 108457, 'Lê Minh Trang', 'Nữ', '16/08/1997', 'trangleminh@admicro.vn', 'Account Executive', 'Social Media', '30/3/2020', '2020', '915702225', 'Hà Nội', '8', ''),
(190, 108819, 'Trần Thị Thảo Lan', 'Nữ', '13/02/1996', 'lantranthithao@admicro.vn', 'Thiết kế', 'Social Media', '26/08/2020', '2020', '966740220', 'TP HCM', '2', ''),
(191, 108833, 'Đinh Thùy Linh', 'Nữ', '21/12/1986', 'Dinhthuylinh02@admicro.vn', 'Trợ lý bộ phận', 'Content Marketing', '03/09/2020', '2020', '986195561', 'Hà Nội', '12', ''),
(192, 107700, 'Hoàng Thị Ngọc Quyên', 'Nữ', '10/11/1989', 'quyenhoangthingoc@admicro.vn', 'Quản lý KOLs', 'Social Media', '1/9/2020', '2020', '814119333', 'TP HCM', '11', ''),
(193, 108839, 'Nguyễn Thị Ngọc Trâm', 'Nữ', '21/08/1992', 'nguyenthingoctram04@admicro.vn', 'Account Executive', 'Campaign Hà Nội', '7/9/2020', '2020', '797576153', 'TP HCM', '8', ''),
(194, 108875, 'Lê Thảo Nhi', 'Nữ', '28/08/1998', 'Nhilethao@admicro.vn', 'NV Phát triển nội dung trên MXH', 'Social Media', '9/21/2020', '2020', '369612190', 'Hà Nội', '8', ''),
(195, 108865, 'Trần Hồ Thanh Trúc', 'Nữ', '22/10/1994', 'tructranhothanh@admicro.vn', 'Account Executive', 'Social Media', '9/21/2020', '2020', '968262601', 'TP HCM', '10', ''),
(196, 108886, 'Hoàng Lê Ngân ', 'Nữ', '12/12/1986', 'nganhoangle@admicro.vn', 'NV tư vấn và lập KH truyền thông', 'Booking', '9/29/2020', '2020', '979351386', 'Hà Nội', '12', ''),
(197, 108905, 'Đặng Hữu Hoài', 'Nam', '08/02/1992', 'hoaidanghuu@admicro.vn', 'Creative Manager', 'Content Marketing', '1/10/2020', '2020', '772769925', 'TP HCM', '8', ''),
(198, 108918, 'Phạm Bích Hân', 'Nữ', '01/06/1997', 'hanphambich@admicro.vn', 'NV Phát triển nội dung trên MXH', 'Social Media', '5/10/2020', '2020', '707088066', 'TP HCM', '6', ''),
(199, 108921, 'Ngô Huyền My', 'Nữ', '30/11/1996', 'myngohuyen@admicro.vn', 'Account Executive', 'Campaign Hà Nội', '6/10/2020', '2020', '965730024', 'Hà Nội', '11', ''),
(200, 108947, 'Nguyễn Hoàng Minh Nhiên', 'Nữ', '24/02/1999', 'nhiennguyenhoangminh@admicro.vn', 'Account Executive', 'Social Media', '12/10/2020', '', '374151821', 'TP HCM', '2', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff_number_turn`
--

CREATE TABLE `staff_number_turn` (
  `staff_number_turn_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `number_turn` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `level`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'GG', 'content_marketing@admicro.vn', NULL, '$2y$10$psmoI8cRcc1d58fIJ58oeuO9SdLxQ0ebf2oNODgHY3gsNFpu7UG6S', 1, 1, NULL, '2020-10-17 19:31:54', '2020-10-17 19:31:54');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `log_staff_turn`
--
ALTER TABLE `log_staff_turn`
  ADD PRIMARY KEY (`log_staff_turn_id`);

--
-- Chỉ mục cho bảng `luckys`
--
ALTER TABLE `luckys`
  ADD PRIMARY KEY (`lucky_id`);

--
-- Chỉ mục cho bảng `lucky_type`
--
ALTER TABLE `lucky_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `staff_number_turn`
--
ALTER TABLE `staff_number_turn`
  ADD PRIMARY KEY (`staff_number_turn_id`) USING BTREE;

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
-- AUTO_INCREMENT cho bảng `log_staff_turn`
--
ALTER TABLE `log_staff_turn`
  MODIFY `log_staff_turn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=443;

--
-- AUTO_INCREMENT cho bảng `luckys`
--
ALTER TABLE `luckys`
  MODIFY `lucky_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT cho bảng `lucky_type`
--
ALTER TABLE `lucky_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `staff_number_turn`
--
ALTER TABLE `staff_number_turn`
  MODIFY `staff_number_turn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
