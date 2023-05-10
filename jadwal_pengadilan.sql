-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2021 at 12:11 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jadwal_pengadilan`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenissidang`
--

CREATE TABLE `jenissidang` (
  `IdJenisSidang` int(11) NOT NULL,
  `NamaJenisSidang` varchar(50) NOT NULL,
  `StatJenisSidang` varchar(5) DEFAULT NULL,
  `IdPembuat` int(11) DEFAULT NULL,
  `Tiestamp` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenissidang`
--

INSERT INTO `jenissidang` (`IdJenisSidang`, `NamaJenisSidang`, `StatJenisSidang`, `IdPembuat`, `Tiestamp`) VALUES
(6, 'Pencurian', 'ON', 9, '2021-06-06 08:18:23'),
(7, 'Narkotika', 'ON', 9, '2021-06-06 08:24:38'),
(8, 'Pembunuhan', 'ON', 9, '2021-06-06 08:24:44'),
(9, 'Korupsi', 'ON', 9, '2021-06-06 11:13:31'),
(11, 'Sengketa', 'ON', 9, '2021-06-06 11:15:15');

-- --------------------------------------------------------

--
-- Table structure for table `perkara`
--

CREATE TABLE `perkara` (
  `IdPerkara` int(11) NOT NULL,
  `NamaPerkara` varchar(255) DEFAULT NULL,
  `KUHP` varchar(20) DEFAULT NULL,
  `IdJaksa` int(11) DEFAULT NULL,
  `IdTahanan` int(11) DEFAULT NULL,
  `TglSidang` date DEFAULT NULL,
  `JamSidang` varchar(255) DEFAULT NULL,
  `IdJaksaPenuntut` int(11) DEFAULT NULL,
  `StatPerkara` varchar(5) DEFAULT NULL,
  `IdPembuat` int(11) DEFAULT NULL,
  `Tiestamp` timestamp NULL DEFAULT NULL,
  `Disetujui` varchar(255) DEFAULT NULL,
  `IdJenisSidang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perkara`
--

INSERT INTO `perkara` (`IdPerkara`, `NamaPerkara`, `KUHP`, `IdJaksa`, `IdTahanan`, `TglSidang`, `JamSidang`, `IdJaksaPenuntut`, `StatPerkara`, `IdPembuat`, `Tiestamp`, `Disetujui`, `IdJenisSidang`) VALUES
(10, 'pencurian', '123', 6, 1, '2021-06-09', '11:00', 8, 'ON', 9, '2021-06-06 07:39:25', 'NO', 1),
(11, 'pencurian', '112', 5, 1, '2021-06-08', '10:00', 8, 'ON', 9, '2021-06-06 08:24:10', 'OK', 6),
(12, 'korupsi', '1111', 6, 3, '2021-06-29', '10:00', 8, 'ON', 9, '2021-06-06 12:09:36', 'BELUM', 9),
(13, 'Pencurian', 'UU-122', 6, 6, '2021-06-10', '10:00', 8, 'ON', 9, '2021-06-06 16:48:16', 'OK', 6),
(14, 'korupsi', 'UU-345', 5, 7, '2021-06-08', '14:00', 8, 'ON', 9, '2021-06-06 16:48:49', 'OK', 9),
(15, 'pencurian', '123', 5, 6, '2021-06-29', '11:00', 8, 'ON', 9, '2021-06-07 07:42:38', 'OK', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tahanan`
--

CREATE TABLE `tahanan` (
  `IdTahanan` int(11) NOT NULL,
  `NamaTahanan` varchar(255) DEFAULT NULL,
  `ktp` varchar(255) DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `TempatLahir` varchar(255) DEFAULT NULL,
  `TglLahir` date DEFAULT NULL,
  `StatTahanan` varchar(5) DEFAULT NULL,
  `IdPembuat` int(11) DEFAULT NULL,
  `Tiestamp` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tahanan`
--

INSERT INTO `tahanan` (`IdTahanan`, `NamaTahanan`, `ktp`, `Gender`, `TempatLahir`, `TglLahir`, `StatTahanan`, `IdPembuat`, `Tiestamp`) VALUES
(6, 'Dara', '1174567823443', 'P', 'Langsa', '2001-06-02', 'ON', 9, '2021-06-06 11:12:44'),
(7, 'rani asamaul', '117434223454', 'P', 'Medan', '1999-06-01', 'ON', 9, '2021-06-06 16:46:04'),
(8, 'Rendi sijabat', '115422341234', 'L', 'Jakarta', '1996-12-08', 'ON', 9, '2021-06-06 16:46:46');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `IdUser` int(11) NOT NULL,
  `NamaLengkap` varchar(255) DEFAULT NULL,
  `Level` varchar(255) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `StatusUser` varchar(255) DEFAULT NULL,
  `Alamat` text DEFAULT NULL,
  `IdPembuat` int(11) DEFAULT NULL,
  `Tiestamp` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`IdUser`, `NamaLengkap`, `Level`, `Username`, `Password`, `StatusUser`, `Alamat`, `IdPembuat`, `Tiestamp`) VALUES
(1, 'Anjas Pengadilan 1', 'panitera', 'Pengadilan1', '1', 'ON', NULL, NULL, NULL),
(2, 'Barto Pengadilan 2', 'panitera', 'Pengadilan2', '1', 'ON', NULL, NULL, NULL),
(3, 'Gani Sekre 1', 'sekretaris', 'Sekre1', '1', 'ON', NULL, NULL, NULL),
(4, 'Teddy Sekre 2', 'sekretaris', 'Sekre2', '1', 'ON', NULL, NULL, NULL),
(5, 'Julian Kejaksaan 1', 'kejaksaan', 'Kej1', '1', 'ON', NULL, NULL, NULL),
(6, 'Renata Kejaksaan 2', 'kejaksaan', 'Kej2', '1', 'ON', NULL, NULL, NULL),
(7, 'Petugas Tahanan', 'rutan', 'PetugasTahanan', '1', 'ON', NULL, NULL, NULL),
(8, 'Lena JakPenuntut 1', 'penuntut', 'penuntut1', '1', 'ON', NULL, NULL, NULL),
(9, 'admin', 'admin', 'admin', '1', 'ON', NULL, NULL, NULL),
(10, 'Kepala Kejaksaan', 'kepala', 'KK', '1', 'ON', NULL, NULL, NULL),
(16, 'deri sekre', 'sekretaris', 'derisekdds', '111111111', 'ON', 'sasdasd', 9, '2021-05-27 05:17:10'),
(17, 'Nensih Wildasari', 'sekretaris', 'nensih123', '12345678', 'ON', 'Komplek kejaksaan,lingkungan bukit', 9, '2021-06-02 15:09:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenissidang`
--
ALTER TABLE `jenissidang`
  ADD PRIMARY KEY (`IdJenisSidang`);

--
-- Indexes for table `perkara`
--
ALTER TABLE `perkara`
  ADD PRIMARY KEY (`IdPerkara`);

--
-- Indexes for table `tahanan`
--
ALTER TABLE `tahanan`
  ADD PRIMARY KEY (`IdTahanan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`IdUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenissidang`
--
ALTER TABLE `jenissidang`
  MODIFY `IdJenisSidang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `perkara`
--
ALTER TABLE `perkara`
  MODIFY `IdPerkara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tahanan`
--
ALTER TABLE `tahanan`
  MODIFY `IdTahanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `IdUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
