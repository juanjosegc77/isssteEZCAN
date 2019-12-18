-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 17, 2019 at 10:04 PM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `isssteEZCAN`
--

-- --------------------------------------------------------

--
-- Table structure for table `Antecedentes`
--

CREATE TABLE `Antecedentes` (
  `reg_antecedentes` mediumint(6) UNSIGNED NOT NULL,
  `reg_paciente` mediumint(6) UNSIGNED NOT NULL,
  `cigarro` tinyint(2) NOT NULL,
  `alcohol` tinyint(2) NOT NULL,
  `infarto` tinyint(2) NOT NULL,
  `angina_estable` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `angina_inestable` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `infarto_previo` tinyint(2) NOT NULL,
  `evc` tinyint(2) NOT NULL,
  `angina_previa` tinyint(2) NOT NULL,
  `hipoglicemiantes` tinyint(2) NOT NULL,
  `hipolipemiantes` tinyint(2) NOT NULL,
  `diabetes` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `Antecedentes`
--

INSERT INTO `Antecedentes` (`reg_antecedentes`, `reg_paciente`, `cigarro`, `alcohol`, `infarto`, `angina_estable`, `angina_inestable`, `infarto_previo`, `evc`, `angina_previa`, `hipoglicemiantes`, `hipolipemiantes`, `diabetes`) VALUES
(1, 123456, 0, 0, 0, 'hjkvhj', 'bhjkbjhk', 1, 1, 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Bioquimica`
--

CREATE TABLE `Bioquimica` (
  `reg_quimica` mediumint(6) UNSIGNED NOT NULL,
  `reg_paciente` mediumint(6) UNSIGNED NOT NULL,
  `plaquetas` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `glucosa` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `glucosa_cod` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `urea` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `urea_cod` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `creatinina` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `creatinina_cod` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `colesterol` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `colesterol_cod` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `trigliceridos` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `trigliceridos_cod` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `hdl` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `hdl_cod` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `ldl_formula` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `ldl` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `ldl_cod` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `hab1c` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `habqc_cod` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `Bioquimica`
--

INSERT INTO `Bioquimica` (`reg_quimica`, `reg_paciente`, `plaquetas`, `glucosa`, `glucosa_cod`, `urea`, `urea_cod`, `creatinina`, `creatinina_cod`, `colesterol`, `colesterol_cod`, `trigliceridos`, `trigliceridos_cod`, `hdl`, `hdl_cod`, `ldl_formula`, `ldl`, `ldl_cod`, `hab1c`, `habqc_cod`) VALUES
(1, 123456, '12.5', '358', '1.2', '1.8', '5.6', '5.6', '4.8', '123', '111', '40', '45', '12', '14', '85', '65', '95', '48', '5.2');

-- --------------------------------------------------------

--
-- Table structure for table `Marcadores`
--

CREATE TABLE `Marcadores` (
  `reg_marcadores` int(6) NOT NULL,
  `reg_paciente` int(6) NOT NULL,
  `mthfd1l_aa1ag2gg3_ra` varchar(20) DEFAULT NULL,
  `mthfd1l_d` varchar(20) DEFAULT NULL,
  `mthfd1l_r` varchar(20) DEFAULT NULL,
  `mthfd1l_a` varchar(20) DEFAULT NULL,
  `kiaa1462_cc1cg2gg3_rc` varchar(20) DEFAULT NULL,
  `kiaa1462_d` varchar(20) DEFAULT NULL,
  `kiaa1462_r` varchar(20) DEFAULT NULL,
  `kiaa1462_a` varchar(20) DEFAULT NULL,
  `ica1l_cc1ct2tt3_rc` varchar(20) DEFAULT NULL,
  `ica1l_d` varchar(20) DEFAULT NULL,
  `ica1l__r` varchar(20) DEFAULT NULL,
  `ica1l_a` varchar(20) DEFAULT NULL,
  `znf132_cc1ct2tt3_rc` varchar(20) DEFAULT NULL,
  `znf132_d` varchar(20) DEFAULT NULL,
  `znf132_r` varchar(20) DEFAULT NULL,
  `znf132_a` varchar(20) DEFAULT NULL,
  `smarca4_gg1gt2tt3_rt` varchar(20) DEFAULT NULL,
  `smarca4_d` varchar(20) DEFAULT NULL,
  `smarca4_r` varchar(20) DEFAULT NULL,
  `smarca4_a` varchar(20) DEFAULT NULL,
  `mras_cc1ct2tt3_rt` varchar(20) DEFAULT NULL,
  `mras_d` varchar(20) DEFAULT NULL,
  `mras_r` varchar(20) DEFAULT NULL,
  `mras_a` varchar(20) DEFAULT NULL,
  `btn3a3_cc1ct2tt3_rt` varchar(20) DEFAULT NULL,
  `btn3a3_d` varchar(20) DEFAULT NULL,
  `btn3a3_r` varchar(20) DEFAULT NULL,
  `btn3a3_a` varchar(20) DEFAULT NULL,
  `adtrp_aa1ag2gg3_ra` varchar(20) DEFAULT NULL,
  `adtrp_d` varchar(20) DEFAULT NULL,
  `adtrp_r` varchar(20) DEFAULT NULL,
  `adtrp_a` varchar(20) DEFAULT NULL,
  `lpa_cc1ct2tt3_rt` varchar(20) DEFAULT NULL,
  `lpa_d` varchar(20) DEFAULT NULL,
  `lpa_r` varchar(20) DEFAULT NULL,
  `lpa_a` varchar(20) DEFAULT NULL,
  `cdkn2b_cc1cg2gg3_rc` varchar(20) DEFAULT NULL,
  `cdkn2b_d` varchar(20) DEFAULT NULL,
  `cdkn2b_r` varchar(20) DEFAULT NULL,
  `cdkn2b_a` varchar(20) DEFAULT NULL,
  `rs501120_cc1ct2tt3_rt` varchar(20) DEFAULT NULL,
  `rs501120_d` varchar(20) DEFAULT NULL,
  `rs501120_r` varchar(20) DEFAULT NULL,
  `rs501120_a` varchar(20) DEFAULT NULL,
  `hnf1a_gg1gt2tt3_rt` varchar(20) DEFAULT NULL,
  `hnf1a_d` varchar(20) DEFAULT NULL,
  `hnf1a_r` varchar(20) DEFAULT NULL,
  `hnf1a_a` varchar(20) DEFAULT NULL,
  `psrc1_aa1ag2gg3_ra` varchar(20) DEFAULT NULL,
  `psrc1_d` varchar(20) DEFAULT NULL,
  `psrc1_r` varchar(20) DEFAULT NULL,
  `psrc1_a` varchar(20) DEFAULT NULL,
  `rs2817611_cc1ct2tt3` varchar(20) DEFAULT NULL,
  `rs3860446_cc1ct2tt3` varchar(20) DEFAULT NULL,
  `rs1498991_cc1cg2gg3` varchar(20) DEFAULT NULL,
  `rs10508349_aa1ag2gg3` varchar(20) DEFAULT NULL,
  `rs888861_cc1ct2tt3` varchar(20) DEFAULT NULL,
  `rs2829454_aa1ag2gg3` varchar(20) DEFAULT NULL,
  `bnc2_rs2840290_aa1ag2gg3` varchar(20) DEFAULT NULL,
  `serac1_aa1at2tt3` varchar(20) DEFAULT NULL,
  `mctp1_cc1ct2tt3` varchar(20) DEFAULT NULL,
  `cd1d_cc1ct2tt3` varchar(20) DEFAULT NULL,
  `rs3760396_cc1cg2gg3` varchar(20) DEFAULT NULL,
  `rs2857654_aa1ag2gg3` varchar(20) DEFAULT NULL,
  `rs3760399` varchar(20) DEFAULT NULL,
  `rs1024611` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Marcadores`
--

INSERT INTO `Marcadores` (`reg_marcadores`, `reg_paciente`, `mthfd1l_aa1ag2gg3_ra`, `mthfd1l_d`, `mthfd1l_r`, `mthfd1l_a`, `kiaa1462_cc1cg2gg3_rc`, `kiaa1462_d`, `kiaa1462_r`, `kiaa1462_a`, `ica1l_cc1ct2tt3_rc`, `ica1l_d`, `ica1l__r`, `ica1l_a`, `znf132_cc1ct2tt3_rc`, `znf132_d`, `znf132_r`, `znf132_a`, `smarca4_gg1gt2tt3_rt`, `smarca4_d`, `smarca4_r`, `smarca4_a`, `mras_cc1ct2tt3_rt`, `mras_d`, `mras_r`, `mras_a`, `btn3a3_cc1ct2tt3_rt`, `btn3a3_d`, `btn3a3_r`, `btn3a3_a`, `adtrp_aa1ag2gg3_ra`, `adtrp_d`, `adtrp_r`, `adtrp_a`, `lpa_cc1ct2tt3_rt`, `lpa_d`, `lpa_r`, `lpa_a`, `cdkn2b_cc1cg2gg3_rc`, `cdkn2b_d`, `cdkn2b_r`, `cdkn2b_a`, `rs501120_cc1ct2tt3_rt`, `rs501120_d`, `rs501120_r`, `rs501120_a`, `hnf1a_gg1gt2tt3_rt`, `hnf1a_d`, `hnf1a_r`, `hnf1a_a`, `psrc1_aa1ag2gg3_ra`, `psrc1_d`, `psrc1_r`, `psrc1_a`, `rs2817611_cc1ct2tt3`, `rs3860446_cc1ct2tt3`, `rs1498991_cc1cg2gg3`, `rs10508349_aa1ag2gg3`, `rs888861_cc1ct2tt3`, `rs2829454_aa1ag2gg3`, `bnc2_rs2840290_aa1ag2gg3`, `serac1_aa1at2tt3`, `mctp1_cc1ct2tt3`, `cd1d_cc1ct2tt3`, `rs3760396_cc1cg2gg3`, `rs2857654_aa1ag2gg3`, `rs3760399`, `rs1024611`) VALUES
(1, 132456, 'bjk', '456', '456', '456', 'hjkhjk', '123', '123', '123', 'gyucrdy', '789', '789', '789', 'phiol', '963', '963', '963', 'setnj', '654', '654', '654', 'mioryc', '856', '856', '856', 'jopixery', '486', '486', '486', 'uiog', '153', '153', '153', 'mopcry', '624', '624', '624', 'mpo vgy', '741', '741', '741', 'nio', '123', '456', '789', 'miopvu', '984', '654', '312', ' ghj hgj', '000', '000', '000', 'mop drt', '++++', '++++', '++++', ',op xdrt', '----', '----', '----', ',mopvtu ', '////////', '///////', '///////', 'nipcryxer', 'cxryxery');

-- --------------------------------------------------------

--
-- Table structure for table `Personales`
--

CREATE TABLE `Personales` (
  `reg_paciente` mediumint(6) UNSIGNED NOT NULL,
  `paciente` mediumint(6) UNSIGNED NOT NULL,
  `fechac` date NOT NULL,
  `horac` time NOT NULL,
  `edad` tinyint(3) UNSIGNED NOT NULL,
  `sexo` tinyint(2) UNSIGNED NOT NULL,
  `tipo` tinyint(2) UNSIGNED NOT NULL,
  `peso` decimal(5,2) UNSIGNED NOT NULL,
  `talla` decimal(3,2) UNSIGNED NOT NULL,
  `imc` decimal(4,2) UNSIGNED NOT NULL,
  `cintura` decimal(3,1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `Personales`
--

INSERT INTO `Personales` (`reg_paciente`, `paciente`, `fechac`, `horac`, `edad`, `sexo`, `tipo`, `peso`, `talla`, `imc`, `cintura`) VALUES
(2, 123456, '2016-05-16', '00:45:00', 20, 0, 0, '50.00', '1.58', '18.50', '60.0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Antecedentes`
--
ALTER TABLE `Antecedentes`
  ADD PRIMARY KEY (`reg_antecedentes`);

--
-- Indexes for table `Bioquimica`
--
ALTER TABLE `Bioquimica`
  ADD PRIMARY KEY (`reg_quimica`);

--
-- Indexes for table `Marcadores`
--
ALTER TABLE `Marcadores`
  ADD PRIMARY KEY (`reg_marcadores`);

--
-- Indexes for table `Personales`
--
ALTER TABLE `Personales`
  ADD PRIMARY KEY (`reg_paciente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Antecedentes`
--
ALTER TABLE `Antecedentes`
  MODIFY `reg_antecedentes` mediumint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Bioquimica`
--
ALTER TABLE `Bioquimica`
  MODIFY `reg_quimica` mediumint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Marcadores`
--
ALTER TABLE `Marcadores`
  MODIFY `reg_marcadores` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Personales`
--
ALTER TABLE `Personales`
  MODIFY `reg_paciente` mediumint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
