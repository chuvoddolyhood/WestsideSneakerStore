-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2022 at 03:51 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `westsidesneaker`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietdathang`
--

CREATE TABLE `chitietdathang` (
  `SoDonDH` int(11) NOT NULL,
  `MSHH` int(11) NOT NULL,
  `Size` varchar(5) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `GiaDatHang` int(11) NOT NULL,
  `GiamGia` float NOT NULL,
  `TongTien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chitietdathang`
--

INSERT INTO `chitietdathang` (`SoDonDH`, `MSHH`, `Size`, `SoLuong`, `GiaDatHang`, `GiamGia`, `TongTien`) VALUES
(44, 1, '2XL', 2, 2000000, 0.1, 3600000),
(44, 34, '45', 1, 2290000, 0, 2290000),
(45, 1, 'XL', 15, 2000000, 0.1, 27000000),
(45, 51, '34', 1, 3239000, 0, 3239000),
(45, 57, '34', 1, 2340000, 0, 2340000),
(46, 34, '45', 1, 2290000, 0, 2290000),
(46, 39, '45', 1, 5000000, 0, 5000000),
(47, 55, '40', 1, 1932000, 0, 1932000),
(48, 40, '43', 1, 2400000, 0, 2400000),
(48, 49, 'L', 2, 2000000, 0, 4000000);

--
-- Triggers `chitietdathang`
--
DELIMITER $$
CREATE TRIGGER `trigger_order` AFTER INSERT ON `chitietdathang` FOR EACH ROW UPDATE size
SET size.SoLuongHang= size.SoLuongHang - new.SoLuong
WHERE size.MSHH=new.MSHH AND size.MaSize= new.Size
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dathang`
--

CREATE TABLE `dathang` (
  `SoDonDH` int(11) NOT NULL,
  `MSKH` int(11) NOT NULL,
  `MSNV` int(11) DEFAULT NULL,
  `NgayDH` date NOT NULL,
  `NgayGH` date DEFAULT NULL,
  `TrangThaiDH` varchar(10) NOT NULL,
  `MaDC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dathang`
--

INSERT INTO `dathang` (`SoDonDH`, `MSKH`, `MSNV`, `NgayDH`, `NgayGH`, `TrangThaiDH`, `MaDC`) VALUES
(44, 1, 19, '2016-11-04', '2016-11-07', '???? giao', 1),
(45, 8, 1, '2021-11-04', '2017-11-07', '???? giao', 12),
(46, 13, 3, '2021-11-04', '2018-11-07', '???? giao', 10),
(47, 9, 3, '2017-11-04', '2017-11-07', '???? duy???t', 13),
(48, 6, 3, '2016-11-04', '2016-11-07', '???? duy???t', 14);

-- --------------------------------------------------------

--
-- Table structure for table `diachikh`
--

CREATE TABLE `diachikh` (
  `MaDC` int(11) NOT NULL,
  `DiaChi` varchar(500) NOT NULL,
  `MSKH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `diachikh`
--

INSERT INTO `diachikh` (`MaDC`, `DiaChi`, `MSKH`) VALUES
(1, 'Long H??a, B??nh Th???y, C???n Th??', 1),
(2, 'V?? V??n Ki???t, B??nh Th???y, C???n Th??', 2),
(3, 'L?? H???ng Phong, Khu D??n C?? Ng??n Thu???n, B??nh Th???y, C???n Th??', 3),
(4, 'Nguy???n V??n C??? N???i D??i', 1),
(8, '107 Nguy???n ?????, ph?????ng An H??a, qu???n Ninh Ki???u, TP C???n Th??', 16),
(9, '107 Nguy???n ?????, ph?????ng An H??a, qu???n Ninh Ki???u, TP C???n Th??', 10),
(10, '200/A3 Nguy???n V??n H?????ng, ph?????ng Th???o ??i???n, qu???n 2, TP HCM', 13),
(11, '?????i h???c C???n Th??', 24),
(12, '40 ???????ng s??? 3, ph?????ng An Kh??nh, qu???n Ninh Ki???u, C???n Th??', 8),
(13, '200/A3 Nguy???n V??n H?????ng, ph?????ng Th???o ??i???n, qu???n 2, TP HCM', 9),
(14, '200/A3 Nguy???n V??n H?????ng, ph?????ng Th???o ??i???n, qu???n 2, TP HCM', 6),
(15, 'S??? 40 ???????ng s??? 3, KDC Th???i Nh???t', 6),
(16, 'B??nh D????ng', 6);

-- --------------------------------------------------------

--
-- Table structure for table `giohang`
--

CREATE TABLE `giohang` (
  `MaGioHang` int(11) NOT NULL,
  `MSKH` int(11) NOT NULL,
  `MSHH` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `Size` varchar(5) NOT NULL,
  `GiaDatHang` int(11) NOT NULL,
  `GiamGia` float NOT NULL,
  `TongTien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `giohang`
--

INSERT INTO `giohang` (`MaGioHang`, `MSKH`, `MSHH`, `SoLuong`, `Size`, `GiaDatHang`, `GiamGia`, `TongTien`) VALUES
(23, 10, 54, 1, '41', 1750000, 0, 1750000),
(23, 10, 56, 1, '40', 1350000, 0, 1350000),
(63, 8, 48, 1, 'L', 420000, 0.001, 378000),
(63, 8, 49, 1, 'XL', 2000000, 0, 2000000),
(63, 8, 58, 1, '45', 2500000, 0, 2500000),
(65, 6, 1, 1, '2XL', 2000000, 0.001, 1800000),
(65, 6, 1, 1, 'M', 2000000, 0.001, 1800000),
(65, 6, 1, 2, 'S', 2000000, 0.001, 1800000),
(65, 6, 45, 1, '5', 550000, 0.001, 495000);

-- --------------------------------------------------------

--
-- Table structure for table `hanghoa`
--

CREATE TABLE `hanghoa` (
  `MSHH` int(11) NOT NULL,
  `TenHH` varchar(500) NOT NULL,
  `MoTa` varchar(1000) DEFAULT NULL,
  `QuyCach` varchar(20) NOT NULL,
  `Gia` int(11) NOT NULL,
  `GiamGia` float NOT NULL,
  `MaLoaiHang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hanghoa`
--

INSERT INTO `hanghoa` (`MSHH`, `TenHH`, `MoTa`, `QuyCach`, `Gia`, `GiamGia`, `MaLoaiHang`) VALUES
(1, '??O ?????U S??N KH??CH MANCHESTER UNITED 21/20', 'CHI???C ??O ?????U D??NH CHO C??? ?????NG VI??N V???I CH??? ', 'Chi???c', 2000000, 0.1, 2),
(34, 'Nike Air Force 1 FULL WHITE', 'Th????ng hi???u ???????c kh?? nhi???u b???n tr??? ????n nh???n', '????i', 2290000, 0, 1),
(39, 'GI??Y CH???Y B??? ULTRABOOST 21 TOKYO', 'N??NG L?????NG CH??? THU???N L?? N??NG L?????NG CHO ?????N KHI V??O TAY ULTRABOOST 21.', '????i', 5000000, 0, 1),
(40, 'GI??Y B??NG ???? PREDATOR FREAK.3 FIRM GROUND', '????I GI??Y B??NG ???? N??NG ????? GI??P B???N L??M CH??? TH??? TR???N TR??N S??N C??? T??? NHI??N.', '????i', 2400000, 0, 1),
(41, 'GI??Y B??NG ???? S??N C??? T??? NHI??N PREDATOR FREAK.3', '????I GI??Y B??NG ???? C??? TH???P GI??P B???N L??M CH??? TR???N ?????U TR??N S??N C??? T??? NHI??N.', '????i', 1900000, 0, 1),
(42, 'GI??Y ???? B??NG X GHOSTED.1 FIRM GROUND', '????I GI??Y ???? B??NG SI??U NH??? CHO NH???NG ???????NG B??NG T???C ????? ??NH S??NG.', '????i', 3150000, 0, 1),
(43, 'GI??Y ???? B??NG S??N C??? NH??N T???O X SPEEDFLOW.3', '????I GI??Y ???? B??NG SI??U NH??? D??NH CHO PHI??N B???N T???C ????? C???A B???N.', '????i', 1900000, 0, 1),
(44, 'T???T S??N NH?? ARSENAL 21/22', '????I T???T D??I NGANG G???I MANG M??U S???C S??N NH?? CLB.', 'Chi???c', 420000, 0, 3),
(45, 'B??NG S??N NH?? MANCHESTER UNITED', 'TR??I B??NG B???N B??? MANG S???C M??U C??U L???C B???.', 'Qu???', 550000, 0.1, 4),
(46, 'QU???N SHORT S??N NH?? ARSENAL 21/22', 'CHI???C QU???N SHORT THO??T ???M D??NH CHO C??C FAN CU???NG NHI???T C???A ARSENAL.', 'Chi???c', 1100000, 0, 5),
(47, 'GI??Y B??NG ???? PREDATOR FREAK.1 FIRM GROUND', '????I GI??Y B??NG ???? N??NG ????? V???I THI???T K??? TRAO QUY???N KI???M SO??T', '????i', 2500000, 0, 1),
(48, 'T???T S??N NH?? 21/22 MANCHESTER UNITED', '????I T???T C??? ?????NG VI??N MANG M??U S???C S??N NH?? ?????C TR??NG.', 'Chi???c', 420000, 0.1, 3),
(49, '??O ?????U S??N NH?? FC BAYERN 21/22', 'CHI???C ??O ?????U MANG S???C ????? CLASSIC D??NH CHO T???T C??? C??C SI??U ANH H??NG C???A FC BAYERN.', 'Chi???c', 2000000, 0, 2),
(50, 'GI??Y NIKE AIR FORCE 1', 'Mang ?????n m???t s??? thay ?????i m???i m??? v??? nh???ng g?? b???n bi???t r?? nh???t: ch???t li???u da s???c n??t, m??u s???c s???ch s??? v?? l?????ng ????n flash ho??n h???o ????? b???n t???a s??ng. L???p ho??n thi???n m??u tr???ng tinh khi???t, s???ch s??? n??y t???o th??m ????? t????ng ph???n cho ????? k???o cao su ????? c?? m???t c??i nh??n m???i m???, linh ho???t ch??? v???i m???t l?????ng ph?? h???p.', '????i', 2290000, 0, 1),
(51, 'GI??Y NIKE AIR FORCE 1 SHADOW', 'Nike Air Force 1 Shadow mang m???t n??t ph?? c??ch vui nh???n tr??n thi???t k??? b-ball c??? ??i???n.', '????i', 3239000, 0, 1),
(52, 'Gi??y Vans old skool 1979', 'M???t trong nh???ng d??ng gi??y mang t??nh kinh ??i???n v?? l??m n??n th????ng hi???u c???a VANS -OFF THE WALL', '????i', 2180000, 0, 1),
(53, 'Gi??y Vans yacht club old skool', 'M???t s??? l???a ch???n kh??c t??? nh?? Vans mang ?????n s??? m???i l???, ph??ng kho??ng cho c??c b???n tr??? y??u th??ch tr?????t v??n', '????i', 1380000, 0, 1),
(54, 'Gi??y Vans Old Skool Black WHITE', '???????c ra ?????i n??m 1977 tr??? th??nh bi???u t?????ng gi??y tr?????t v??n - skate shoe c???a gi???i m??? ?????o gi??y th??? thao tr??n to??n th??? gi???i', '????i', 1750000, 0, 1),
(55, 'Gi??y Vans stacy peralta', 'L?? m???t trong nh???ng d??ng gi??y mang t??nh kinh ??i???n, v?? l??m n??n th????ng hi???u c???a VANS -OFF THE WALL.', '????i', 1932000, 0, 1),
(56, 'Gi??y Vans Classic Slip-On Checkerboard', 'H???a ti???t Checkerboard kinh ??i???n ???????c s???p x???p tinh t??? ??? m???t ph???n th??n gi??y v?? g??t gi??y. Kh??? n??ng k???t h???p nhi???u phong c??ch b???i thi???t k??? v?? c???c ch???t, c???c c?? t??nh v?? kh??ng bao gi??? l???i m???t', '????i', 1350000, 0, 1),
(57, 'GI??Y CONVERSE CHUCK TAYLOR RED HIGH TOPS', 'Gi??y Sneaker Unisex Converse Chuck Taylor All Star 1970s Enamel Red - High ???????c thi???t k??? t??? ch???t li???u v???i canvas nh???, t???o c???m gi??c tho???i m??i cho ng?????i s??? d???ng.', '????i', 2340000, 0, 1),
(58, 'GI??Y ADIDAS BOUNCE ALPHABOUNCE', 'M???u gi??y ch???y ???????c thi???t k??? cho c??c v???n ?????ng vi??n ch???y b??? mu???n tr??? th??nh ng?????i xu???t s???c nh???t trong b??? m??n c???a m??nh.', '????i', 2500000, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hinhhanghoa`
--

CREATE TABLE `hinhhanghoa` (
  `MaHinh` int(11) NOT NULL,
  `TenHinh` varchar(1000) NOT NULL,
  `MSHH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hinhhanghoa`
--

INSERT INTO `hinhhanghoa` (`MaHinh`, `TenHinh`, `MSHH`) VALUES
(18, 'ao_1.png', 1),
(41, 'giay_10.png', 34),
(46, 'giay_13.png', 39),
(47, 'giay_15.png', 40),
(48, 'giay_16.png', 41),
(49, 'giay_14.png', 42),
(50, 'giay_1.png', 43),
(51, 'tat_1.png', 44),
(52, 'bong_1.png', 45),
(53, 'quan_1.png', 46),
(54, 'giay_2.png', 47),
(55, 'tat_2.png', 48),
(56, 'ao_2.png', 49),
(57, 'giay_3.png', 50),
(58, 'giay_4.png', 51),
(59, 'giay_5.png', 52),
(60, 'giay_6.png', 53),
(61, 'giay_7.png', 54),
(62, 'giay_8.png', 55),
(63, 'giay_9.png', 56),
(64, 'giay_11.png', 57),
(65, 'giay_12.png', 58);

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `MSKH` int(11) NOT NULL,
  `HoTenKH` varchar(100) NOT NULL,
  `TenCongTy` varchar(200) NOT NULL,
  `SoDienThoai` varchar(15) NOT NULL,
  `SoFax` varchar(30) NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`MSKH`, `HoTenKH`, `TenCongTy`, `SoDienThoai`, `SoFax`, `UserName`, `password`) VALUES
(1, 'Nguy???n V??n H??', 'Axon Active', '0838720508', '1234', 'nguyenvanha', 'cce31e34a6c26dabd03d91b271266ad0'),
(2, 'Nguy???n ????nh Qu??', 'NashTech', '0832483050', '', 'nguyendinhquy', '10bf6845523df936e6c12881bbd86b7a'),
(3, 'L?? Do??n Kh??nh', 'B???nh vi???n ??a Khoa Trung ????ng C???n Th??', '0379026256', '', 'ledoankhanh', 'bbee2e7c540fde597ad1a708bc30b51c'),
(6, 'Ng?? Qu?? Nh??n', '', '0989123456', '', 'ngoquynhan', '9a0bc9f806b868e24ac698a99eee73bc'),
(8, 'V?? Th??? Th??i', 'D?????c H???u Giang', '0939335450', '', 'vothithai', '684999df7232bab7e0a6c4cdba150a94'),
(9, 'Tr???n Ng???c Mai', 'SCID', '0906627513', '', 'tranngocmai', 'b5d6ac2889c1a0243ac30803f9ae0d6f'),
(10, 'Tr???n Th??? ??nh Nh??', '', '0939017060', '', 'tranthianhnhu', '928f2ebe65cc62f2bbb037b4c05bb370'),
(13, 'Ng?? Qu?? ?????c', '', '123', '', 'ngoquyduc', 'd0b229c599d2ebfe3eb785331366cac7'),
(16, 'Ho??ng L?? Minh', 'Trung t??m y t??? qu???n B??nh Th???y', '0704487658', '', 'hoangleminh', 'f82e62d7c3ea69cc12b5cdb8d621dab6'),
(24, 'Nguy???n Minh Trung', '?????i h???c C???n Th??', '113', '', 'thaytrungvuitinh', 'bdae18d0bede86e3d7fe0fc5bb73d424');

-- --------------------------------------------------------

--
-- Table structure for table `loaihanghoa`
--

CREATE TABLE `loaihanghoa` (
  `MaLoaiHang` int(11) NOT NULL,
  `TenLoaiHang` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loaihanghoa`
--

INSERT INTO `loaihanghoa` (`MaLoaiHang`, `TenLoaiHang`) VALUES
(1, 'Gi??y'),
(2, '??o'),
(3, 'T???t'),
(4, 'B??ng'),
(5, 'Qu???n');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MSNV` int(11) NOT NULL,
  `HoTenNV` varchar(100) DEFAULT NULL,
  `ChucVu` varchar(50) NOT NULL,
  `DiaChi` varchar(500) NOT NULL,
  `SoDienThoai` varchar(10) NOT NULL,
  `UserName` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`MSNV`, `HoTenNV`, `ChucVu`, `DiaChi`, `SoDienThoai`, `UserName`, `password`) VALUES
(1, 'Tr???n Nh??n Ngh??a', 'Qu???n L??', 'An Kh??nh, Ninh Ki???u, C???n Th??', '0939635755', 'nghia@001', '397f6bfad8c5b2400386653bf804211f'),
(2, 'T?? Hu???nh Minh Kh??i', 'Qu???n L??', 'Xu??n Kh??nh, Ninh Ki???u, C???n Th??', '0945595503', 'khoi@002', 'cde29de8c587e4cd53e16212b99115be'),
(3, 'Nguy???n L?? Thanh Cao', 'Qu???n L??', 'An L???c, Ninh Ki???u, C???n Th??', '0523294259', 'cao@003', 'b30b5a463026f8c4bc659fcb2a0dda00'),
(4, 'L??? Th??? Thanh Mi', 'Nh??n vi??n b??n h??ng', 'H???m 91, CMT8, B??nh Th???y, C???n Th??', '0914635308', NULL, NULL),
(18, 'Cao Ng???c B???o Long', 'Nh??n vi??n giao h??ng', '?? M??n, C???n Th??', '0939894721', NULL, NULL),
(19, 'Th???y Trung vui t??nh', 'Qu???n L??', 'C???n Th??', '113', 'thaytrungvuitinh', 'bdae18d0bede86e3d7fe0fc5bb73d424');

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `MaSize` varchar(5) NOT NULL,
  `MSHH` int(11) NOT NULL,
  `SoLuongHang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`MaSize`, `MSHH`, `SoLuongHang`) VALUES
('2XL', 1, 15),
('2XL', 44, 0),
('2XL', 46, 6),
('2XL', 48, 3),
('2XL', 49, 2),
('3', 45, 1),
('34', 34, 0),
('34', 39, 0),
('34', 40, 0),
('34', 41, 0),
('34', 42, 0),
('34', 43, 0),
('34', 47, 0),
('34', 50, 1),
('34', 51, 13),
('34', 52, 0),
('34', 53, 0),
('34', 54, 0),
('34', 55, 0),
('34', 56, 0),
('34', 57, 4),
('34', 58, 0),
('35', 34, 0),
('35', 39, 0),
('35', 40, 0),
('35', 41, 0),
('35', 42, 0),
('35', 43, 0),
('35', 47, 0),
('35', 50, 2),
('35', 51, 23),
('35', 52, 0),
('35', 53, 0),
('35', 54, 0),
('35', 55, 0),
('35', 56, 0),
('35', 57, 0),
('35', 58, 0),
('36', 34, 0),
('36', 39, 0),
('36', 40, 0),
('36', 41, 0),
('36', 42, 0),
('36', 43, 0),
('36', 47, 0),
('36', 50, 3),
('36', 51, 4),
('36', 52, 0),
('36', 53, 0),
('36', 54, 0),
('36', 55, 0),
('36', 56, 0),
('36', 57, 0),
('36', 58, 0),
('37', 34, 0),
('37', 39, 0),
('37', 40, 0),
('37', 41, 0),
('37', 42, 0),
('37', 43, 0),
('37', 47, 0),
('37', 50, 0),
('37', 51, 6),
('37', 52, 0),
('37', 53, 0),
('37', 54, 0),
('37', 55, 0),
('37', 56, 0),
('37', 57, 0),
('37', 58, 0),
('38', 34, 0),
('38', 39, 7),
('38', 40, 0),
('38', 41, 0),
('38', 42, 0),
('38', 43, 0),
('38', 47, 0),
('38', 50, 4),
('38', 51, 7),
('38', 52, 0),
('38', 53, 0),
('38', 54, 0),
('38', 55, 0),
('38', 56, 0),
('38', 57, 4),
('38', 58, 0),
('39', 34, 0),
('39', 39, 0),
('39', 40, 0),
('39', 41, 0),
('39', 42, 0),
('39', 43, 6),
('39', 47, 3),
('39', 50, 0),
('39', 51, 8),
('39', 52, 6),
('39', 53, 0),
('39', 54, 0),
('39', 55, 0),
('39', 56, 0),
('39', 57, 0),
('39', 58, 0),
('4', 45, 2),
('40', 34, 0),
('40', 39, 0),
('40', 40, 9),
('40', 41, 0),
('40', 42, 0),
('40', 43, 5),
('40', 47, 0),
('40', 50, 8),
('40', 51, 0),
('40', 52, 0),
('40', 53, 3),
('40', 54, 0),
('40', 55, 3),
('40', 56, 5),
('40', 57, 0),
('40', 58, 5),
('41', 34, 0),
('41', 39, 0),
('41', 40, 8),
('41', 41, 0),
('41', 42, 5),
('41', 43, 4),
('41', 47, 0),
('41', 50, 14),
('41', 51, 0),
('41', 52, 0),
('41', 53, 0),
('41', 54, 6),
('41', 55, 3),
('41', 56, 0),
('41', 57, 3),
('41', 58, 0),
('42', 34, 0),
('42', 39, 0),
('42', 40, 6),
('42', 41, 3),
('42', 42, 7),
('42', 43, 8),
('42', 47, 2),
('42', 50, 23),
('42', 51, 0),
('42', 52, 5),
('42', 53, 4),
('42', 54, 9),
('42', 55, 0),
('42', 56, 0),
('42', 57, 0),
('42', 58, 0),
('43', 34, 0),
('43', 39, 0),
('43', 40, 2),
('43', 41, 0),
('43', 42, 3),
('43', 43, 7),
('43', 47, 9),
('43', 50, 2),
('43', 51, 0),
('43', 52, 0),
('43', 53, 0),
('43', 54, 7),
('43', 55, 3),
('43', 56, 4),
('43', 57, 0),
('43', 58, 3),
('44', 34, 0),
('44', 39, 0),
('44', 40, 10),
('44', 41, 2),
('44', 42, 6),
('44', 43, 6),
('44', 47, 8),
('44', 50, 5),
('44', 51, 0),
('44', 52, 0),
('44', 53, 0),
('44', 54, 3),
('44', 55, 0),
('44', 56, 0),
('44', 57, 0),
('44', 58, 0),
('45', 34, 8),
('45', 39, 0),
('45', 40, 5),
('45', 41, 2),
('45', 42, 15),
('45', 43, 5),
('45', 47, 4),
('45', 50, 12),
('45', 51, 0),
('45', 52, 6),
('45', 53, 0),
('45', 54, 14),
('45', 55, 0),
('45', 56, 0),
('45', 57, 0),
('45', 58, 7),
('5', 45, 6),
('L', 1, 10),
('L', 44, 6),
('L', 46, 4),
('L', 48, 2),
('L', 49, 2),
('M', 1, 10),
('M', 44, 12),
('M', 46, 5),
('M', 48, 0),
('M', 49, 0),
('S', 1, 10),
('S', 44, 5),
('S', 46, 3),
('S', 48, 0),
('S', 49, 0),
('XL', 1, 0),
('XL', 44, 7),
('XL', 46, 7),
('XL', 48, 0),
('XL', 49, 3),
('XS', 44, 2),
('XS', 46, 0),
('XS', 48, 0),
('XS', 49, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitietdathang`
--
ALTER TABLE `chitietdathang`
  ADD PRIMARY KEY (`SoDonDH`,`MSHH`),
  ADD KEY `MSHH` (`MSHH`),
  ADD KEY `Size` (`Size`);

--
-- Indexes for table `dathang`
--
ALTER TABLE `dathang`
  ADD PRIMARY KEY (`SoDonDH`),
  ADD KEY `dathang_ibfk_1` (`MSKH`),
  ADD KEY `dathang_ibfk_2` (`MSNV`),
  ADD KEY `dathang_ibfk_3` (`MaDC`);

--
-- Indexes for table `diachikh`
--
ALTER TABLE `diachikh`
  ADD PRIMARY KEY (`MaDC`),
  ADD KEY `diachikh_ibfk_1` (`MSKH`);

--
-- Indexes for table `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`MaGioHang`,`MSKH`,`MSHH`,`Size`),
  ADD KEY `giohang_ibfk_1` (`MSHH`),
  ADD KEY `giohang_ibfk_2` (`MSKH`);

--
-- Indexes for table `hanghoa`
--
ALTER TABLE `hanghoa`
  ADD PRIMARY KEY (`MSHH`),
  ADD KEY `hanghoa_ibfk_1` (`MaLoaiHang`);

--
-- Indexes for table `hinhhanghoa`
--
ALTER TABLE `hinhhanghoa`
  ADD PRIMARY KEY (`MaHinh`),
  ADD KEY `hinhhanghoa_ibfk_1` (`MSHH`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MSKH`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- Indexes for table `loaihanghoa`
--
ALTER TABLE `loaihanghoa`
  ADD PRIMARY KEY (`MaLoaiHang`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MSNV`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`MaSize`,`MSHH`),
  ADD KEY `size_ibfk_1` (`MSHH`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dathang`
--
ALTER TABLE `dathang`
  MODIFY `SoDonDH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `diachikh`
--
ALTER TABLE `diachikh`
  MODIFY `MaDC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `giohang`
--
ALTER TABLE `giohang`
  MODIFY `MaGioHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `hanghoa`
--
ALTER TABLE `hanghoa`
  MODIFY `MSHH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `hinhhanghoa`
--
ALTER TABLE `hinhhanghoa`
  MODIFY `MaHinh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `MSKH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `loaihanghoa`
--
ALTER TABLE `loaihanghoa`
  MODIFY `MaLoaiHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MSNV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitietdathang`
--
ALTER TABLE `chitietdathang`
  ADD CONSTRAINT `chitietdathang_ibfk_1` FOREIGN KEY (`SoDonDH`) REFERENCES `dathang` (`SoDonDH`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitietdathang_ibfk_4` FOREIGN KEY (`MSHH`) REFERENCES `hanghoa` (`MSHH`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitietdathang_ibfk_5` FOREIGN KEY (`Size`) REFERENCES `size` (`MaSize`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dathang`
--
ALTER TABLE `dathang`
  ADD CONSTRAINT `dathang_ibfk_1` FOREIGN KEY (`MSKH`) REFERENCES `khachhang` (`MSKH`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dathang_ibfk_2` FOREIGN KEY (`MSNV`) REFERENCES `nhanvien` (`MSNV`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dathang_ibfk_3` FOREIGN KEY (`MaDC`) REFERENCES `diachikh` (`MaDC`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `diachikh`
--
ALTER TABLE `diachikh`
  ADD CONSTRAINT `diachikh_ibfk_1` FOREIGN KEY (`MSKH`) REFERENCES `khachhang` (`MSKH`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`MSHH`) REFERENCES `hanghoa` (`MSHH`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `giohang_ibfk_2` FOREIGN KEY (`MSKH`) REFERENCES `khachhang` (`MSKH`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hanghoa`
--
ALTER TABLE `hanghoa`
  ADD CONSTRAINT `hanghoa_ibfk_1` FOREIGN KEY (`MaLoaiHang`) REFERENCES `loaihanghoa` (`MaLoaiHang`) ON UPDATE CASCADE;

--
-- Constraints for table `hinhhanghoa`
--
ALTER TABLE `hinhhanghoa`
  ADD CONSTRAINT `hinhhanghoa_ibfk_1` FOREIGN KEY (`MSHH`) REFERENCES `hanghoa` (`MSHH`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `size`
--
ALTER TABLE `size`
  ADD CONSTRAINT `size_ibfk_1` FOREIGN KEY (`MSHH`) REFERENCES `hanghoa` (`MSHH`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
