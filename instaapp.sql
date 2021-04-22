-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2021 at 04:51 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `instaapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `idkomen` int(11) NOT NULL,
  `idpost` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `deskripsi` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`idkomen`, `idpost`, `id_user`, `deskripsi`) VALUES
(5, 11, 8, 'bedejhhh');

-- --------------------------------------------------------

--
-- Table structure for table `postingan`
--

CREATE TABLE `postingan` (
  `idpost` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `text` varchar(200) DEFAULT NULL,
  `suka` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `postingan`
--

INSERT INTO `postingan` (`idpost`, `id_user`, `gambar`, `text`, `suka`) VALUES
(8, 6, 'images (4).jpg', 'pemandangan yang indah', 1),
(9, 6, 'images (4).jpg', 'pemandangan yang indah', NULL),
(10, 8, 'images (4).jpg', 'bagus bet dah', 1),
(11, 6, 'amik.jpg', 'aduhh gabud', 2);

-- --------------------------------------------------------

--
-- Table structure for table `teman`
--

CREATE TABLE `teman` (
  `id` int(11) DEFAULT NULL,
  `id_teman` int(11) DEFAULT NULL,
  `status` enum('mengikuti','belum') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teman`
--

INSERT INTO `teman` (`id`, `id_teman`, `status`) VALUES
(4, 7, 'mengikuti'),
(7, 4, 'mengikuti'),
(7, 7, 'mengikuti'),
(7, 7, 'mengikuti'),
(8, 4, 'mengikuti'),
(8, 6, 'mengikuti');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(64) DEFAULT NULL,
  `tgl` varchar(15) DEFAULT NULL,
  `foto` varchar(64) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `pwd` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `tgl`, `foto`, `username`, `pwd`) VALUES
(4, 'halimi firdaus', '2021-04-04', 'default.jpg', 'halimi', 'dde70fc51aa3b23750412dcd3abff36a2a483f63d20fa4b92ab44a45ac555b4b'),
(6, 'amik', '2000-09-12', 'amik.jpg', 'halimi_net12', '496ea25eccbe28cb7642b75edfcb94711d2248e56a1d4770cc694e084a185812'),
(7, 'akusiapa', '2021-04-21', 'default.jpg', 'aku_mau', '14e3a65c1c4fba75888f9d6337689561d2c0a6a1d674fa36eb676b6c387ea9fc'),
(8, 'ana', '2021-04-09', 'default.jpg', 'anamghf', 'e82827b00b2ca8620beb37f879778c082b292a52270390cff35b6fe3157f4e8b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`idkomen`),
  ADD KEY `idpost` (`idpost`);

--
-- Indexes for table `postingan`
--
ALTER TABLE `postingan`
  ADD PRIMARY KEY (`idpost`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `teman`
--
ALTER TABLE `teman`
  ADD KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `idkomen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `postingan`
--
ALTER TABLE `postingan`
  MODIFY `idpost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`idpost`) REFERENCES `postingan` (`idpost`);

--
-- Constraints for table `postingan`
--
ALTER TABLE `postingan`
  ADD CONSTRAINT `postingan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `teman`
--
ALTER TABLE `teman`
  ADD CONSTRAINT `teman_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
