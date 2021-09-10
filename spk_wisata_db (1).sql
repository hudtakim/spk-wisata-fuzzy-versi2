-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2021 at 01:28 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spk_wisata_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', '1234admin');

-- --------------------------------------------------------

--
-- Table structure for table `daftar_kriteria`
--

CREATE TABLE `daftar_kriteria` (
  `id` int(10) NOT NULL,
  `kriteria` varchar(20) NOT NULL,
  `sub1` varchar(20) NOT NULL,
  `sub2` varchar(20) NOT NULL,
  `sub3` varchar(20) NOT NULL,
  `sub4` varchar(30) NOT NULL,
  `sub5` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daftar_kriteria`
--

INSERT INTO `daftar_kriteria` (`id`, `kriteria`, `sub1`, `sub2`, `sub3`, `sub4`, `sub5`) VALUES
(132, 'Jenis', 'Alam', 'Sosial_Budaya', 'Religi_Sejarah', '', ''),
(133, 'Fasilitas', 'Sedikit', 'Cukup', 'Banyak', '', ''),
(134, 'Harga', 'Murah', 'Sedang', 'Mahal', '', ''),
(135, 'Jarak', 'Dekat', 'Sedang', 'Jauh', '', ''),
(136, 'Pengunjung', 'Sepi', 'Biasa', 'Ramai', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `daftar_kriteria_static`
--

CREATE TABLE `daftar_kriteria_static` (
  `id` int(20) NOT NULL,
  `kriteria` varchar(30) NOT NULL,
  `sub1` varchar(30) NOT NULL,
  `sub2` varchar(30) NOT NULL,
  `sub3` varchar(30) NOT NULL,
  `batas1` varchar(20) NOT NULL,
  `batas2` varchar(20) NOT NULL,
  `batas3` varchar(20) NOT NULL,
  `kategori` varchar(10) NOT NULL,
  `sub4` varchar(30) NOT NULL,
  `sub5` varchar(30) NOT NULL,
  `batas4` varchar(20) NOT NULL,
  `batas5` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daftar_kriteria_static`
--

INSERT INTO `daftar_kriteria_static` (`id`, `kriteria`, `sub1`, `sub2`, `sub3`, `batas1`, `batas2`, `batas3`, `kategori`, `sub4`, `sub5`, `batas4`, `batas5`) VALUES
(82, 'Jenis', 'Alam', 'Sosial_Budaya', 'Religi_Sejarah', '0', '0', '0', 'non_fuzzy', '', '', '0', '0'),
(83, 'Harga', 'Murah', 'Sedang', 'Mahal', '10000', '25000', '50000', 'fuzzy', '', '', '0', '0'),
(84, 'Jarak', 'Dekat', 'Sedang', 'Jauh', '5', '10', '20', 'fuzzy', '', '', '0', '0'),
(85, 'Fasilitas', 'Sedikit', 'Cukup', 'Banyak', '5', '10', '20', 'fuzzy', '', '', '0', '0'),
(86, 'Pengunjung', 'Sepi', 'Biasa', 'Ramai', '1000', '4500', '10000', 'fuzzy', '', '', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `fuzzy_fasilitas`
--

CREATE TABLE `fuzzy_fasilitas` (
  `id` int(11) NOT NULL,
  `obyek_wisata` varchar(30) NOT NULL,
  `fasilitas` float NOT NULL,
  `sedikit` float NOT NULL,
  `cukup` float NOT NULL,
  `banyak` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuzzy_fasilitas`
--

INSERT INTO `fuzzy_fasilitas` (`id`, `obyek_wisata`, `fasilitas`, `sedikit`, `cukup`, `banyak`) VALUES
(133, 'Desa Wisata Guci', 16, 0, 0.4, 0.6),
(134, 'Pantai Alam Indah', 7, 0.6, 0.4, 0),
(135, 'Pantai Purwahamba Indah', 15, 0, 0.5, 0.5),
(136, 'Waduk Cacaban', 6, 0.8, 0.2, 0),
(137, 'Jamu Kalibakung', 6, 0.8, 0.2, 0),
(138, 'Yogya Waterboom', 10, 0, 1, 0),
(139, 'Konsorsium Rumah Wayang', 5, 1, 0, 0),
(140, 'Gerbang Mas Bahari Waterpark', 11, 0, 0.9, 0.1),
(141, 'Rita Park', 24, 0, 0, 1),
(142, 'Hutan Mangrove Tegal', 2, 1, 0, 0),
(143, 'Makam Ki Gedhe Sebayu', 3, 1, 0, 0),
(144, 'Makam Sunan Amangkurat I', 3, 1, 0, 0),
(145, 'Klenteng Tek Hay Kiong', 4, 1, 0, 0),
(146, 'Situs Purbakala Semedo', 2, 1, 0, 0),
(147, 'Pool Terace Samudra', 7, 0.6, 0.4, 0),
(148, 'Alun-alun Kota Slawi', 3, 1, 0, 0),
(149, 'Alun-alun Kota Tegal', 3, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fuzzy_harga`
--

CREATE TABLE `fuzzy_harga` (
  `id` int(11) NOT NULL,
  `obyek_wisata` varchar(30) NOT NULL,
  `harga` float NOT NULL,
  `murah` float NOT NULL,
  `sedang` float NOT NULL,
  `mahal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuzzy_harga`
--

INSERT INTO `fuzzy_harga` (`id`, `obyek_wisata`, `harga`, `murah`, `sedang`, `mahal`) VALUES
(133, 'Desa Wisata Guci', 7000, 1, 0, 0),
(134, 'Pantai Alam Indah', 5000, 1, 0, 0),
(135, 'Pantai Purwahamba Indah', 3500, 1, 0, 0),
(136, 'Waduk Cacaban', 4000, 1, 0, 0),
(137, 'Jamu Kalibakung', 5000, 1, 0, 0),
(138, 'Yogya Waterboom', 15000, 0.666667, 0.333333, 0),
(139, 'Konsorsium Rumah Wayang', 0, 1, 0, 0),
(140, 'Gerbang Mas Bahari Waterpark', 25000, 0, 1, 0),
(141, 'Rita Park', 60000, 0, 0, 1),
(142, 'Hutan Mangrove Tegal', 0, 1, 0, 0),
(143, 'Makam Ki Gedhe Sebayu', 0, 1, 0, 0),
(144, 'Makam Sunan Amangkurat I', 0, 1, 0, 0),
(145, 'Klenteng Tek Hay Kiong', 0, 1, 0, 0),
(146, 'Situs Purbakala Semedo', 0, 1, 0, 0),
(147, 'Pool Terace Samudra', 7500, 1, 0, 0),
(148, 'Alun-alun Kota Slawi', 0, 1, 0, 0),
(149, 'Alun-alun Kota Tegal', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fuzzy_jarak`
--

CREATE TABLE `fuzzy_jarak` (
  `id` int(11) NOT NULL,
  `obyek_wisata` varchar(30) NOT NULL,
  `jarak` float NOT NULL,
  `dekat` float NOT NULL,
  `sedang` float NOT NULL,
  `jauh` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuzzy_jarak`
--

INSERT INTO `fuzzy_jarak` (`id`, `obyek_wisata`, `jarak`, `dekat`, `sedang`, `jauh`) VALUES
(133, 'Desa Wisata Guci', 28, 0, 0, 1),
(134, 'Pantai Alam Indah', 18, 0, 0.2, 0.8),
(135, 'Pantai Purwahamba Indah', 25, 0, 0, 1),
(136, 'Waduk Cacaban', 22, 0, 0, 1),
(137, 'Jamu Kalibakung', 14, 0, 0.6, 0.4),
(138, 'Yogya Waterboom', 4, 1, 0, 0),
(139, 'Konsorsium Rumah Wayang', 11, 0, 0.9, 0.1),
(140, 'Gerbang Mas Bahari Waterpark', 16, 0, 0.4, 0.6),
(141, 'Rita Park', 15, 0, 0.5, 0.5),
(142, 'Hutan Mangrove Tegal', 18, 0, 0.2, 0.8),
(143, 'Makam Ki Gedhe Sebayu', 10, 0, 1, 0),
(144, 'Makam Sunan Amangkurat I', 9, 0.2, 0.8, 0),
(145, 'Klenteng Tek Hay Kiong', 16, 0, 0.4, 0.6),
(146, 'Situs Purbakala Semedo', 24, 0, 0, 1),
(147, 'Pool Terace Samudra', 15, 0, 0.5, 0.5),
(148, 'Alun-alun Kota Slawi', 0, 1, 0, 0),
(149, 'Alun-alun Kota Tegal', 16, 0, 0.4, 0.6);

-- --------------------------------------------------------

--
-- Table structure for table `fuzzy_jenis`
--

CREATE TABLE `fuzzy_jenis` (
  `id` int(11) NOT NULL,
  `obyek_wisata` varchar(30) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `alam` float NOT NULL,
  `sosial_budaya` float NOT NULL,
  `religi_sejarah` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuzzy_jenis`
--

INSERT INTO `fuzzy_jenis` (`id`, `obyek_wisata`, `jenis`, `alam`, `sosial_budaya`, `religi_sejarah`) VALUES
(133, 'Desa Wisata Guci', 'Alam', 1, 0, 0),
(134, 'Pantai Alam Indah', 'Alam', 1, 0, 0),
(135, 'Pantai Purwahamba Indah', 'Alam', 1, 0, 0),
(136, 'Waduk Cacaban', 'Alam', 1, 0, 0),
(137, 'Jamu Kalibakung', 'Alam', 1, 0, 0),
(138, 'Yogya Waterboom', 'Sosial_Budaya', 0, 1, 0),
(139, 'Konsorsium Rumah Wayang', 'Sosial_Budaya', 0, 1, 0),
(140, 'Gerbang Mas Bahari Waterpark', 'Sosial_Budaya', 0, 1, 0),
(141, 'Rita Park', 'Sosial_Budaya', 0, 1, 0),
(142, 'Hutan Mangrove Tegal', 'Alam', 1, 0, 0),
(143, 'Makam Ki Gedhe Sebayu', 'Religi_Sejarah', 0, 0, 1),
(144, 'Makam Sunan Amangkurat I', 'Religi_Sejarah', 0, 0, 1),
(145, 'Klenteng Tek Hay Kiong', 'Religi_Sejarah', 0, 0, 1),
(146, 'Situs Purbakala Semedo', 'Religi_Sejarah', 0, 0, 1),
(147, 'Pool Terace Samudra', 'Sosial_Budaya', 0, 1, 0),
(148, 'Alun-alun Kota Slawi', 'Sosial_Budaya', 0, 1, 0),
(149, 'Alun-alun Kota Tegal', 'Sosial_Budaya', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fuzzy_pengunjung`
--

CREATE TABLE `fuzzy_pengunjung` (
  `id` int(11) NOT NULL,
  `obyek_wisata` varchar(30) NOT NULL,
  `pengunjung` float NOT NULL,
  `sepi` float NOT NULL,
  `biasa` float NOT NULL,
  `ramai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuzzy_pengunjung`
--

INSERT INTO `fuzzy_pengunjung` (`id`, `obyek_wisata`, `pengunjung`, `sepi`, `biasa`, `ramai`) VALUES
(133, 'Desa Wisata Guci', 66558, 0, 0, 1),
(134, 'Pantai Alam Indah', 31336, 0, 0, 1),
(135, 'Pantai Purwahamba Indah', 29257, 0, 0, 1),
(136, 'Waduk Cacaban', 3833, 0.190571, 0.809429, 0),
(137, 'Jamu Kalibakung', 710, 1, 0, 0),
(138, 'Yogya Waterboom', 4644, 0, 0.973818, 0.0261818),
(139, 'Konsorsium Rumah Wayang', 1487, 0.860857, 0.139143, 0),
(140, 'Gerbang Mas Bahari Waterpark', 31187, 0, 0, 1),
(141, 'Rita Park', 25043, 0, 0, 1),
(142, 'Hutan Mangrove Tegal', 900, 1, 0, 0),
(143, 'Makam Ki Gedhe Sebayu', 3888, 0.174857, 0.825143, 0),
(144, 'Makam Sunan Amangkurat I', 4255, 0.07, 0.93, 0),
(145, 'Klenteng Tek Hay Kiong', 5627, 0, 0.795091, 0.204909),
(146, 'Situs Purbakala Semedo', 649, 1, 0, 0),
(147, 'Pool Terace Samudra', 4411, 0.0254286, 0.974571, 0),
(148, 'Alun-alun Kota Slawi', 60000, 0, 0, 1),
(149, 'Alun-alun Kota Tegal', 85000, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `input_user_tb`
--

CREATE TABLE `input_user_tb` (
  `id` int(20) NOT NULL,
  `kriteria` varchar(20) NOT NULL,
  `sub1` varchar(20) NOT NULL,
  `sub2` varchar(20) NOT NULL,
  `sub3` varchar(20) NOT NULL,
  `sub4` varchar(20) NOT NULL,
  `sub5` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `setting_tampilan`
--

CREATE TABLE `setting_tampilan` (
  `link_gambar` varchar(500) NOT NULL,
  `warna_bg` varchar(30) NOT NULL,
  `nama_wilayah` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setting_tampilan`
--

INSERT INTO `setting_tampilan` (`link_gambar`, `warna_bg`, `nama_wilayah`) VALUES
('https://kamini.id/wp-content/uploads/2020/12/macam-macam-warna-biru_thumbnail-Copy.jpg', 'white', 'by HDM-Vision');

-- --------------------------------------------------------

--
-- Table structure for table `tempat_wisata_tb`
--

CREATE TABLE `tempat_wisata_tb` (
  `obyek_wisata` varchar(30) NOT NULL,
  `id` int(10) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `harga` float DEFAULT NULL,
  `jarak` float DEFAULT NULL,
  `fasilitas` float DEFAULT NULL,
  `pengunjung` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tempat_wisata_tb`
--

INSERT INTO `tempat_wisata_tb` (`obyek_wisata`, `id`, `jenis`, `harga`, `jarak`, `fasilitas`, `pengunjung`) VALUES
('Desa Wisata Guci', 133, 'Alam', 7000, 28, 16, 66558),
('Pantai Alam Indah', 134, 'Alam', 5000, 18, 7, 31336),
('Pantai Purwahamba Indah', 135, 'Alam', 3500, 25, 15, 29257),
('Waduk Cacaban', 136, 'Alam', 4000, 22, 6, 3833),
('Jamu Kalibakung', 137, 'Alam', 5000, 14, 6, 710),
('Yogya Waterboom', 138, 'Sosial_Budaya', 15000, 4, 10, 4644),
('Konsorsium Rumah Wayang', 139, 'Sosial_Budaya', 0, 11, 5, 1487),
('Gerbang Mas Bahari Waterpark', 140, 'Sosial_Budaya', 25000, 16, 11, 31187),
('Rita Park', 141, 'Sosial_Budaya', 60000, 15, 24, 25043),
('Hutan Mangrove Tegal', 142, 'Alam', 0, 18, 2, 900),
('Makam Ki Gedhe Sebayu', 143, 'Religi_Sejarah', 0, 10, 3, 3888),
('Makam Sunan Amangkurat I', 144, 'Religi_Sejarah', 0, 9, 3, 4255),
('Klenteng Tek Hay Kiong', 145, 'Religi_Sejarah', 0, 16, 4, 5627),
('Situs Purbakala Semedo', 146, 'Religi_Sejarah', 0, 24, 2, 649),
('Pool Terace Samudra', 147, 'Sosial_Budaya', 7500, 15, 7, 4411),
('Alun-alun Kota Slawi', 148, 'Sosial_Budaya', 0, 0, 3, 60000),
('Alun-alun Kota Tegal', 149, 'Sosial_Budaya', 0, 16, 3, 85000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_kriteria`
--
ALTER TABLE `daftar_kriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daftar_kriteria_static`
--
ALTER TABLE `daftar_kriteria_static`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuzzy_fasilitas`
--
ALTER TABLE `fuzzy_fasilitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuzzy_harga`
--
ALTER TABLE `fuzzy_harga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuzzy_jarak`
--
ALTER TABLE `fuzzy_jarak`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuzzy_jenis`
--
ALTER TABLE `fuzzy_jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuzzy_pengunjung`
--
ALTER TABLE `fuzzy_pengunjung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `input_user_tb`
--
ALTER TABLE `input_user_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tempat_wisata_tb`
--
ALTER TABLE `tempat_wisata_tb`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_kriteria`
--
ALTER TABLE `daftar_kriteria`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `daftar_kriteria_static`
--
ALTER TABLE `daftar_kriteria_static`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `fuzzy_fasilitas`
--
ALTER TABLE `fuzzy_fasilitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `fuzzy_harga`
--
ALTER TABLE `fuzzy_harga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `fuzzy_jarak`
--
ALTER TABLE `fuzzy_jarak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `fuzzy_jenis`
--
ALTER TABLE `fuzzy_jenis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `fuzzy_pengunjung`
--
ALTER TABLE `fuzzy_pengunjung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `input_user_tb`
--
ALTER TABLE `input_user_tb`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `tempat_wisata_tb`
--
ALTER TABLE `tempat_wisata_tb`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
