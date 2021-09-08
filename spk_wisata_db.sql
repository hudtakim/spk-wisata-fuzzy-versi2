-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2021 at 06:11 AM
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
(95, 'Jenis', 'Alam', 'Religi', 'Sejarah', 'Edukasi', 'Romance'),
(101, 'Harga', 'Murah', 'Sedang', 'Mahal', '', ''),
(102, 'Warna', 'Merah', 'Kuning', 'Hijau', '', ''),
(103, 'Luas', 'Sempit', 'Sedang', 'Longgar', 'Sangat_Luas', ''),
(104, 'Stamina', 'Satu', 'Dua', 'Tiga', 'Empat', ''),
(105, 'Popularitas', 'Tinggi', 'Sedang', 'Rendah', 'Sangat_Rendah', '');

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
(51, 'Harga', 'Murah', 'Sedang', 'Mahal', '5000', '10000', '20000', 'fuzzy', '', '', '50000', '100000'),
(52, 'Jenis', 'Alam', 'Religi', 'Sejarah', '0', '0', '0', 'non_fuzzy', 'Edukasi', 'Romance', '0', '0'),
(53, 'Stamina', 'Satu', 'Dua', 'Tiga', '1', '2', '3', 'fuzzy', 'Empat', '', '4', '5'),
(54, 'Warna', 'Merah', 'Kuning', 'Hijau', '0', '0', '0', 'non_fuzzy', '', '', '0', '0'),
(56, 'Parkir', 'Murah', 'Biasa', 'Mahal', '1000', '2000', '3000', 'fuzzy', 'Sangat_Mahal', '', '4000', '0'),
(57, 'Luas', 'Sempit', 'Sedang', 'Longgar', '50', '100', '150', 'fuzzy', 'Sangat_Luas', '', '200', '0'),
(58, 'Ketertiban', 'Tawuran', 'Rendah', 'Tertib', '0', '0', '0', 'non_fuzzy', 'Sangat_Tertib', '', '0', '0'),
(59, 'Fasilitas', 'Sedikit', 'Cukup', 'Banyak', '3', '5', '7', 'fuzzy', '', '', '0', '0'),
(60, 'Popularitas', 'Tinggi', 'Sedang', 'Rendah', '0', '0', '0', 'non_fuzzy', 'Sangat_Rendah', '', '0', '0');

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
(1, 'Desa Wisata Guci', 1, 1, 0, 0),
(2, 'Pantai Alam Indah', 2, 1, 0, 0),
(3, 'Pantai Purwahamba Indah', 3, 1, 0, 0),
(4, 'Waduk Cacaban', 4, 0.5, 0.5, 0),
(5, 'Wisata Kesehatan Jamu Kalibaku', 5, 0, 1, 0),
(6, 'Yogya Waterboom', 6, 0, 0.5, 0.5),
(7, 'Konsorsium Rumah Wayang', 6, 0, 0.5, 0.5),
(8, 'Gerbang Mas Bahari Waterpark', 7, 0, 0, 1),
(9, 'Rita Park', 8, 0, 0, 0.857143),
(10, 'Hutan Mangrove Tegal', 9, 0, 0, 0.714286),
(11, 'Makam Ki Gede Sebayu', 10, 0, 0, 0.571429),
(12, 'Makam Sunan Amangkurat I', 11, 0, 0, 0.428571),
(13, 'Klenteng Tek Hay Kiong', 21, 0, 0, 0),
(14, 'Situs Purbakala Semedo', 12, 0, 0, 0.285714),
(15, 'Pool Terrace Samudra', 1, 1, 0, 0),
(77, 'Pantai Super', 3, 1, 0, 0),
(78, 'Alun-Alun', 43, 0, 0, 0),
(79, 'Kantor Tua', 2, 1, 0, 0),
(80, 'Lapangan Bola', 4, 0.5, 0.5, 0);

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
(1, 'Desa Wisata Guci', 12000, 0, 0.8, 0.2),
(2, 'Pantai Alam Indah', 23444, 0, 0, 0.8852),
(3, 'Pantai Purwahamba Indah', 213, 1, 0, 0),
(4, 'Waduk Cacaban', 12323, 0, 0.7677, 0.2323),
(5, 'Wisata Kesehatan Jamu Kalibaku', 13, 1, 0, 0),
(6, 'Yogya Waterboom', 2134, 1, 0, 0),
(7, 'Konsorsium Rumah Wayang', 3434, 1, 0, 0),
(8, 'Gerbang Mas Bahari Waterpark', 23, 1, 0, 0),
(9, 'Rita Park', 2323, 1, 0, 0),
(10, 'Hutan Mangrove Tegal', 33, 1, 0, 0),
(11, 'Makam Ki Gede Sebayu', 23233, 0, 0, 0.892233),
(12, 'Makam Sunan Amangkurat I', 23233, 0, 0, 0.892233),
(13, 'Klenteng Tek Hay Kiong', 232, 1, 0, 0),
(14, 'Situs Purbakala Semedo', 2323, 1, 0, 0),
(15, 'Pool Terrace Samudra', 23, 1, 0, 0),
(77, 'Pantai Super', 4000, 1, 0, 0),
(78, 'Alun-Alun', 232, 1, 0, 0),
(79, 'Kantor Tua', 16777, 0, 0.3223, 0.6777),
(80, 'Lapangan Bola', 4444, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fuzzy_jenis`
--

CREATE TABLE `fuzzy_jenis` (
  `id` int(11) NOT NULL,
  `obyek_wisata` varchar(30) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `alam` float NOT NULL,
  `religi` float NOT NULL,
  `sejarah` float NOT NULL,
  `edukasi` float NOT NULL,
  `romance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuzzy_jenis`
--

INSERT INTO `fuzzy_jenis` (`id`, `obyek_wisata`, `jenis`, `alam`, `religi`, `sejarah`, `edukasi`, `romance`) VALUES
(1, 'Desa Wisata Guci', 'Religi', 0, 1, 0, 0, 0),
(2, 'Pantai Alam Indah', 'Sejarah', 0, 0, 1, 0, 0),
(3, 'Pantai Purwahamba Indah', 'Alam', 1, 0, 0, 0, 0),
(4, 'Waduk Cacaban', 'Romance', 0, 0, 0, 0, 1),
(5, 'Wisata Kesehatan Jamu Kalibaku', 'Sejarah', 0, 0, 1, 0, 0),
(6, 'Yogya Waterboom', 'Alam', 1, 0, 0, 0, 0),
(7, 'Konsorsium Rumah Wayang', 'Sejarah', 0, 0, 1, 0, 0),
(8, 'Gerbang Mas Bahari Waterpark', 'Edukasi', 0, 0, 0, 1, 0),
(9, 'Rita Park', 'Alam', 1, 0, 0, 0, 0),
(10, 'Hutan Mangrove Tegal', 'Romance', 0, 0, 0, 0, 1),
(11, 'Makam Ki Gede Sebayu', 'Edukasi', 0, 0, 0, 1, 0),
(12, 'Makam Sunan Amangkurat I', 'Sejarah', 0, 0, 1, 0, 0),
(13, 'Klenteng Tek Hay Kiong', 'Religi', 0, 1, 0, 0, 0),
(14, 'Situs Purbakala Semedo', 'Romance', 0, 0, 0, 0, 1),
(15, 'Pool Terrace Samudra', 'Sejarah', 0, 0, 1, 0, 0),
(77, 'Pantai Super', 'Alam', 1, 0, 0, 0, 0),
(78, 'Alun-Alun', 'Sejarah', 0, 0, 1, 0, 0),
(79, 'Kantor Tua', 'Romance', 0, 0, 0, 0, 1),
(80, 'Lapangan Bola', 'Edukasi', 0, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fuzzy_ketertiban`
--

CREATE TABLE `fuzzy_ketertiban` (
  `id` int(11) NOT NULL,
  `obyek_wisata` varchar(30) NOT NULL,
  `ketertiban` varchar(20) NOT NULL,
  `tawuran` float NOT NULL,
  `rendah` float NOT NULL,
  `tertib` float NOT NULL,
  `sangat_tertib` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuzzy_ketertiban`
--

INSERT INTO `fuzzy_ketertiban` (`id`, `obyek_wisata`, `ketertiban`, `tawuran`, `rendah`, `tertib`, `sangat_tertib`) VALUES
(1, 'Desa Wisata Guci', 'Rendah', 0, 1, 0, 0),
(2, 'Pantai Alam Indah', 'Sangat_Tertib', 0, 0, 0, 1),
(3, 'Pantai Purwahamba Indah', 'Tawuran', 1, 0, 0, 0),
(4, 'Waduk Cacaban', 'Rendah', 0, 1, 0, 0),
(5, 'Wisata Kesehatan Jamu Kalibaku', 'Sangat_Tertib', 0, 0, 0, 1),
(6, 'Yogya Waterboom', 'Rendah', 0, 1, 0, 0),
(7, 'Konsorsium Rumah Wayang', 'Rendah', 0, 1, 0, 0),
(8, 'Gerbang Mas Bahari Waterpark', 'Tawuran', 1, 0, 0, 0),
(9, 'Rita Park', 'Tertib', 0, 0, 1, 0),
(10, 'Hutan Mangrove Tegal', 'Rendah', 0, 1, 0, 0),
(11, 'Makam Ki Gede Sebayu', 'Sangat_Tertib', 0, 0, 0, 1),
(12, 'Makam Sunan Amangkurat I', 'Tawuran', 1, 0, 0, 0),
(13, 'Klenteng Tek Hay Kiong', 'Tertib', 0, 0, 1, 0),
(14, 'Situs Purbakala Semedo', 'Tawuran', 1, 0, 0, 0),
(15, 'Pool Terrace Samudra', 'Tawuran', 1, 0, 0, 0),
(77, 'Pantai Super', 'Sangat_Tertib', 0, 0, 0, 1),
(78, 'Alun-Alun', 'Tertib', 0, 0, 1, 0),
(79, 'Kantor Tua', 'Rendah', 0, 1, 0, 0),
(80, 'Lapangan Bola', 'Tertib', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fuzzy_luas`
--

CREATE TABLE `fuzzy_luas` (
  `id` int(11) NOT NULL,
  `obyek_wisata` varchar(30) NOT NULL,
  `luas` float NOT NULL,
  `sempit` float NOT NULL,
  `sedang` float NOT NULL,
  `longgar` float NOT NULL,
  `sangat_luas` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuzzy_luas`
--

INSERT INTO `fuzzy_luas` (`id`, `obyek_wisata`, `luas`, `sempit`, `sedang`, `longgar`, `sangat_luas`) VALUES
(1, 'Desa Wisata Guci', 123, 0, 0.54, 0.46, 0),
(2, 'Pantai Alam Indah', 1232, 0, 0, 0, 0),
(3, 'Pantai Purwahamba Indah', 21, 1, 0, 0, 0),
(4, 'Waduk Cacaban', 213, 0, 0, 0, 0.935),
(5, 'Wisata Kesehatan Jamu Kalibaku', 23, 1, 0, 0, 0),
(6, 'Yogya Waterboom', 2312, 0, 0, 0, 0),
(7, 'Konsorsium Rumah Wayang', 3, 1, 0, 0, 0),
(8, 'Gerbang Mas Bahari Waterpark', 43547, 0, 0, 0, 0),
(9, 'Rita Park', 65, 0.7, 0.3, 0, 0),
(10, 'Hutan Mangrove Tegal', 5, 1, 0, 0, 0),
(11, 'Makam Ki Gede Sebayu', 4543, 0, 0, 0, 0),
(12, 'Makam Sunan Amangkurat I', 2, 1, 0, 0, 0),
(13, 'Klenteng Tek Hay Kiong', 12, 1, 0, 0, 0),
(14, 'Situs Purbakala Semedo', 123, 0, 0.54, 0.46, 0),
(15, 'Pool Terrace Samudra', 32, 1, 0, 0, 0),
(77, 'Pantai Super', 54, 0.92, 0.08, 0, 0),
(78, 'Alun-Alun', 457, 0, 0, 0, 0),
(79, 'Kantor Tua', 56, 0.88, 0.12, 0, 0),
(80, 'Lapangan Bola', 3, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fuzzy_parkir`
--

CREATE TABLE `fuzzy_parkir` (
  `id` int(11) NOT NULL,
  `obyek_wisata` varchar(30) NOT NULL,
  `parkir` float NOT NULL,
  `murah` float NOT NULL,
  `biasa` float NOT NULL,
  `mahal` float NOT NULL,
  `sangat_mahal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuzzy_parkir`
--

INSERT INTO `fuzzy_parkir` (`id`, `obyek_wisata`, `parkir`, `murah`, `biasa`, `mahal`, `sangat_mahal`) VALUES
(1, 'Desa Wisata Guci', 123, 1, 0, 0, 0),
(2, 'Pantai Alam Indah', 2323, 0, 0.677, 0.323, 0),
(3, 'Pantai Purwahamba Indah', 1231, 0.769, 0.231, 0, 0),
(4, 'Waduk Cacaban', 2323, 0, 0.677, 0.323, 0),
(5, 'Wisata Kesehatan Jamu Kalibaku', 23, 1, 0, 0, 0),
(6, 'Yogya Waterboom', 2132, 0, 0.868, 0.132, 0),
(7, 'Konsorsium Rumah Wayang', 23, 1, 0, 0, 0),
(8, 'Gerbang Mas Bahari Waterpark', 213, 1, 0, 0, 0),
(9, 'Rita Park', 213, 1, 0, 0, 0),
(10, 'Hutan Mangrove Tegal', 23, 1, 0, 0, 0),
(11, 'Makam Ki Gede Sebayu', 32, 1, 0, 0, 0),
(12, 'Makam Sunan Amangkurat I', 32, 1, 0, 0, 0),
(13, 'Klenteng Tek Hay Kiong', 2133, 0, 0.867, 0.133, 0),
(14, 'Situs Purbakala Semedo', 32, 1, 0, 0, 0),
(15, 'Pool Terrace Samudra', 323, 1, 0, 0, 0),
(77, 'Pantai Super', 2323, 0, 0.677, 0.323, 0),
(78, 'Alun-Alun', 213, 1, 0, 0, 0),
(79, 'Kantor Tua', 23, 1, 0, 0, 0),
(80, 'Lapangan Bola', 233, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fuzzy_popularitas`
--

CREATE TABLE `fuzzy_popularitas` (
  `id` int(11) NOT NULL,
  `obyek_wisata` varchar(30) NOT NULL,
  `popularitas` varchar(20) NOT NULL,
  `tinggi` float NOT NULL,
  `sedang` float NOT NULL,
  `rendah` float NOT NULL,
  `sangat_rendah` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuzzy_popularitas`
--

INSERT INTO `fuzzy_popularitas` (`id`, `obyek_wisata`, `popularitas`, `tinggi`, `sedang`, `rendah`, `sangat_rendah`) VALUES
(1, 'Desa Wisata Guci', 'Tinggi', 1, 0, 0, 0),
(2, 'Pantai Alam Indah', 'Sedang', 0, 1, 0, 0),
(3, 'Pantai Purwahamba Indah', 'Rendah', 0, 0, 1, 0),
(4, 'Waduk Cacaban', 'Sangat_Rendah', 0, 0, 0, 1),
(5, 'Wisata Kesehatan Jamu Kalibaku', 'Sangat_Rendah', 0, 0, 0, 1),
(6, 'Yogya Waterboom', 'Tinggi', 1, 0, 0, 0),
(7, 'Konsorsium Rumah Wayang', 'Sedang', 0, 1, 0, 0),
(8, 'Gerbang Mas Bahari Waterpark', 'Rendah', 0, 0, 1, 0),
(9, 'Rita Park', 'Rendah', 0, 0, 1, 0),
(10, 'Hutan Mangrove Tegal', 'Sangat_Rendah', 0, 0, 0, 1),
(11, 'Makam Ki Gede Sebayu', 'Tinggi', 1, 0, 0, 0),
(12, 'Makam Sunan Amangkurat I', 'Rendah', 0, 0, 1, 0),
(13, 'Klenteng Tek Hay Kiong', 'Rendah', 0, 0, 1, 0),
(14, 'Situs Purbakala Semedo', 'Sangat_Rendah', 0, 0, 0, 1),
(15, 'Pool Terrace Samudra', 'Sedang', 0, 1, 0, 0),
(77, 'Pantai Super', 'Sedang', 0, 1, 0, 0),
(78, 'Alun-Alun', 'Rendah', 0, 0, 1, 0),
(79, 'Kantor Tua', 'Sangat_Rendah', 0, 0, 0, 1),
(80, 'Lapangan Bola', 'Tinggi', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fuzzy_stamina`
--

CREATE TABLE `fuzzy_stamina` (
  `id` int(11) NOT NULL,
  `obyek_wisata` varchar(30) NOT NULL,
  `stamina` float NOT NULL,
  `satu` float NOT NULL,
  `dua` float NOT NULL,
  `tiga` float NOT NULL,
  `empat` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuzzy_stamina`
--

INSERT INTO `fuzzy_stamina` (`id`, `obyek_wisata`, `stamina`, `satu`, `dua`, `tiga`, `empat`) VALUES
(1, 'Desa Wisata Guci', 1, 1, 0, 0, 0),
(2, 'Pantai Alam Indah', 2, 0, 1, 0, 0),
(3, 'Pantai Purwahamba Indah', 3, 0, 0, 1, 0),
(4, 'Waduk Cacaban', 4, 0, 0, 0, 2),
(5, 'Wisata Kesehatan Jamu Kalibaku', 1, 1, 0, 0, 0),
(6, 'Yogya Waterboom', 2, 0, 1, 0, 0),
(7, 'Konsorsium Rumah Wayang', 3, 0, 0, 1, 0),
(8, 'Gerbang Mas Bahari Waterpark', 4, 0, 0, 0, 2),
(9, 'Rita Park', 1, 1, 0, 0, 0),
(10, 'Hutan Mangrove Tegal', 2, 0, 1, 0, 0),
(11, 'Makam Ki Gede Sebayu', 3, 0, 0, 1, 0),
(12, 'Makam Sunan Amangkurat I', 4, 0, 0, 0, 2),
(13, 'Klenteng Tek Hay Kiong', 1, 1, 0, 0, 0),
(14, 'Situs Purbakala Semedo', 2, 0, 1, 0, 0),
(15, 'Pool Terrace Samudra', 3, 0, 0, 1, 0),
(77, 'Pantai Super', 3, 0, 0, 1, 0),
(78, 'Alun-Alun', 4, 0, 0, 0, 2),
(79, 'Kantor Tua', 6, 0, 0, 0, 0),
(80, 'Lapangan Bola', 23, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fuzzy_warna`
--

CREATE TABLE `fuzzy_warna` (
  `id` int(11) NOT NULL,
  `obyek_wisata` varchar(30) NOT NULL,
  `warna` varchar(20) NOT NULL,
  `merah` float NOT NULL,
  `kuning` float NOT NULL,
  `hijau` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuzzy_warna`
--

INSERT INTO `fuzzy_warna` (`id`, `obyek_wisata`, `warna`, `merah`, `kuning`, `hijau`) VALUES
(1, 'Desa Wisata Guci', 'Merah', 1, 0, 0),
(2, 'Pantai Alam Indah', 'Kuning', 0, 1, 0),
(3, 'Pantai Purwahamba Indah', 'Hijau', 0, 0, 1),
(4, 'Waduk Cacaban', 'Merah', 1, 0, 0),
(5, 'Wisata Kesehatan Jamu Kalibaku', 'Kuning', 0, 1, 0),
(6, 'Yogya Waterboom', 'Hijau', 0, 0, 1),
(7, 'Konsorsium Rumah Wayang', 'Merah', 1, 0, 0),
(8, 'Gerbang Mas Bahari Waterpark', 'Kuning', 0, 1, 0),
(9, 'Rita Park', 'Hijau', 0, 0, 1),
(10, 'Hutan Mangrove Tegal', 'Kuning', 0, 1, 0),
(11, 'Makam Ki Gede Sebayu', 'Merah', 1, 0, 0),
(12, 'Makam Sunan Amangkurat I', 'Hijau', 0, 0, 1),
(13, 'Klenteng Tek Hay Kiong', 'Merah', 1, 0, 0),
(14, 'Situs Purbakala Semedo', 'Kuning', 0, 1, 0),
(15, 'Pool Terrace Samudra', 'Hijau', 0, 0, 1),
(77, 'Pantai Super', 'Hijau', 0, 0, 1),
(78, 'Alun-Alun', 'Kuning', 0, 1, 0),
(79, 'Kantor Tua', 'Hijau', 0, 0, 1),
(80, 'Lapangan Bola', 'Hijau', 0, 0, 1);

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
('https://kamini.id/wp-content/uploads/2020/12/macam-macam-warna-biru_thumbnail-Copy.jpg', 'white', 'Purworejo');

-- --------------------------------------------------------

--
-- Table structure for table `tempat_wisata_tb`
--

CREATE TABLE `tempat_wisata_tb` (
  `obyek_wisata` varchar(30) NOT NULL,
  `id` int(10) NOT NULL,
  `harga` float DEFAULT NULL,
  `jenis` varchar(20) NOT NULL,
  `stamina` float DEFAULT NULL,
  `warna` varchar(20) NOT NULL,
  `parkir` float DEFAULT NULL,
  `luas` float DEFAULT NULL,
  `ketertiban` varchar(20) NOT NULL,
  `fasilitas` float DEFAULT NULL,
  `popularitas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tempat_wisata_tb`
--

INSERT INTO `tempat_wisata_tb` (`obyek_wisata`, `id`, `harga`, `jenis`, `stamina`, `warna`, `parkir`, `luas`, `ketertiban`, `fasilitas`, `popularitas`) VALUES
('Desa Wisata Guci', 1, 12000, 'Religi', 1, 'Merah', 123, 123, 'Rendah', 1, 'Tinggi'),
('Pantai Alam Indah', 2, 23444, 'Sejarah', 2, 'Kuning', 2323, 1232, 'Sangat_Tertib', 2, 'Sedang'),
('Pantai Purwahamba Indah', 3, 213, 'Alam', 3, 'Hijau', 1231, 21, 'Tawuran', 3, 'Rendah'),
('Waduk Cacaban', 4, 12323, 'Romance', 4, 'Merah', 2323, 213, 'Rendah', 4, 'Sangat_Rendah'),
('Wisata Kesehatan Jamu Kalibaku', 5, 13, 'Sejarah', 1, 'Kuning', 23, 23, 'Sangat_Tertib', 5, 'Sangat_Rendah'),
('Yogya Waterboom', 6, 2134, 'Alam', 2, 'Hijau', 2132, 2312, 'Rendah', 6, 'Tinggi'),
('Konsorsium Rumah Wayang', 7, 3434, 'Sejarah', 3, 'Merah', 23, 3, 'Rendah', 6, 'Sedang'),
('Gerbang Mas Bahari Waterpark', 8, 23, 'Edukasi', 4, 'Kuning', 213, 43547, 'Tawuran', 7, 'Rendah'),
('Rita Park', 9, 2323, 'Alam', 1, 'Hijau', 213, 65, 'Tertib', 8, 'Rendah'),
('Hutan Mangrove Tegal', 10, 33, 'Romance', 2, 'Kuning', 23, 5, 'Rendah', 9, 'Sangat_Rendah'),
('Makam Ki Gede Sebayu', 11, 23233, 'Edukasi', 3, 'Merah', 32, 4543, 'Sangat_Tertib', 10, 'Tinggi'),
('Makam Sunan Amangkurat I', 12, 23233, 'Sejarah', 4, 'Hijau', 32, 2, 'Tawuran', 11, 'Rendah'),
('Klenteng Tek Hay Kiong', 13, 232, 'Religi', 1, 'Merah', 2133, 12, 'Tertib', 21, 'Rendah'),
('Situs Purbakala Semedo', 14, 2323, 'Romance', 2, 'Kuning', 32, 123, 'Tawuran', 12, 'Sangat_Rendah'),
('Pool Terrace Samudra', 15, 23, 'Sejarah', 3, 'Hijau', 323, 32, 'Tawuran', 1, 'Sedang'),
('Pantai Super', 77, 4000, 'Alam', 3, 'Hijau', 2323, 54, 'Sangat_Tertib', 3, 'Sedang'),
('Alun-Alun', 78, 232, 'Sejarah', 4, 'Kuning', 213, 457, 'Tertib', 43, 'Rendah'),
('Kantor Tua', 79, 16777, 'Romance', 6, 'Hijau', 23, 56, 'Rendah', 2, 'Sangat_Rendah'),
('Lapangan Bola', 80, 4444, 'Edukasi', 23, 'Hijau', 233, 3, 'Tertib', 4, 'Tinggi');

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
-- Indexes for table `fuzzy_jenis`
--
ALTER TABLE `fuzzy_jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuzzy_ketertiban`
--
ALTER TABLE `fuzzy_ketertiban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuzzy_luas`
--
ALTER TABLE `fuzzy_luas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuzzy_parkir`
--
ALTER TABLE `fuzzy_parkir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuzzy_popularitas`
--
ALTER TABLE `fuzzy_popularitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuzzy_stamina`
--
ALTER TABLE `fuzzy_stamina`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuzzy_warna`
--
ALTER TABLE `fuzzy_warna`
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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `daftar_kriteria_static`
--
ALTER TABLE `daftar_kriteria_static`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `fuzzy_fasilitas`
--
ALTER TABLE `fuzzy_fasilitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `fuzzy_harga`
--
ALTER TABLE `fuzzy_harga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `fuzzy_jenis`
--
ALTER TABLE `fuzzy_jenis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `fuzzy_ketertiban`
--
ALTER TABLE `fuzzy_ketertiban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `fuzzy_luas`
--
ALTER TABLE `fuzzy_luas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `fuzzy_parkir`
--
ALTER TABLE `fuzzy_parkir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `fuzzy_popularitas`
--
ALTER TABLE `fuzzy_popularitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `fuzzy_stamina`
--
ALTER TABLE `fuzzy_stamina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `fuzzy_warna`
--
ALTER TABLE `fuzzy_warna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `tempat_wisata_tb`
--
ALTER TABLE `tempat_wisata_tb`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
