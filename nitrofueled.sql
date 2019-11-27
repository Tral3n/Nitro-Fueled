-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2019 at 12:08 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nitrofueled`
--

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `ID` int(11) NOT NULL,
  `CC` int(20) NOT NULL,
  `NOMBRES` varchar(40) NOT NULL,
  `APELLIDOS` varchar(40) NOT NULL,
  `ID_TIPOAUTO` int(11) NOT NULL,
  `PLACA` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`ID`, `CC`, `NOMBRES`, `APELLIDOS`, `ID_TIPOAUTO`, `PLACA`) VALUES
(56, 231231123, 'Edgar', 'Sarmiento', 1, 'mnu466');

-- --------------------------------------------------------

--
-- Table structure for table `configuracion`
--

CREATE TABLE `configuracion` (
  `ID` tinyint(4) NOT NULL,
  `CANTIDAD` int(4) NOT NULL,
  `PORCENTAJE` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configuracion`
--

INSERT INTO `configuracion` (`ID`, `CANTIDAD`, `PORCENTAJE`) VALUES
(1, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_fact`
--

CREATE TABLE `detalle_fact` (
  `ID_FACTURA` int(11) NOT NULL,
  `SERVICIO` varchar(11) NOT NULL,
  `PRECIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detalle_fact`
--

INSERT INTO `detalle_fact` (`ID_FACTURA`, `SERVICIO`, `PRECIO`) VALUES
(3, 'Polichado', 23418),
(3, 'Lavado', 342),
(4, 'Prueba', 1000),
(4, 'Lavado', 342),
(5, 'Lavado', 342),
(6, 'Prueba', 1000),
(6, 'Lavado', 4564),
(7, 'Polichado', 23418),
(7, 'Lavado', 342),
(8, 'Polichado', 9789),
(9, 'Polichado', 23418),
(9, 'Lavado', 342),
(10, 'Polichado', 9789),
(10, 'Lavado', 4564),
(11, 'Lavado', 4564),
(11, 'Prueba', 1000),
(12, 'Polichado', 9789),
(12, 'Lavado', 4564),
(13, 'Polichado', 4545),
(13, 'Lavado', 5324),
(14, 'Polichado', 10000),
(14, 'Lavado', 342),
(15, 'Lavado', 4564),
(16, 'Polichado', 4545),
(16, 'Lavado', 5324),
(16, 'Pinchada', 400),
(17, 'Pinchada', 1000),
(17, 'Lavado', 4564),
(24, 'Polichado', 122),
(24, 'Lavado', 4564),
(25, 'Polichado', 122),
(25, 'Lavado', 4564),
(26, 'Polichado', 122);

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

CREATE TABLE `factura` (
  `ID_FACTURA` int(11) NOT NULL,
  `CC` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `TIPOAUTO` varchar(11) NOT NULL,
  `PLACA` varchar(6) NOT NULL,
  `SUBTOTAL` float NOT NULL,
  `DESCUENTO` float NOT NULL,
  `TOTALFACTURA` float NOT NULL,
  `FECHA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factura`
--

INSERT INTO `factura` (`ID_FACTURA`, `CC`, `NOMBRE`, `TIPOAUTO`, `PLACA`, `SUBTOTAL`, `DESCUENTO`, `TOTALFACTURA`, `FECHA`) VALUES
(24, 131231231, 'sdfsdf', 'Automovil', '33dds', 4686, 468.6, 4217.4, '2019-11-27 17:47:36'),
(25, 231231123, 'Edgar', 'Automovil', 'mnu466', 4686, 234.3, 4451.7, '2019-11-27 17:56:38'),
(26, 131414124, 'prueba', 'Automovil', 'weq', 122, 0, 122, '2019-11-27 17:57:57');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `USUARIO` varchar(50) NOT NULL,
  `CONTRASENA` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`USUARIO`, `CONTRASENA`) VALUES
('admin', '123'),
('oper', '321');

-- --------------------------------------------------------

--
-- Table structure for table `precio`
--

CREATE TABLE `precio` (
  `ID` int(11) NOT NULL,
  `PRECIO` float NOT NULL,
  `ID_SERVICIO` int(11) NOT NULL,
  `ID_TIPOAUTO` int(11) NOT NULL,
  `ACTIVO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `precio`
--

INSERT INTO `precio` (`ID`, `PRECIO`, `ID_SERVICIO`, `ID_TIPOAUTO`, `ACTIVO`) VALUES
(1, 122, 1, 1, 1),
(2, 10000, 1, 2, 1),
(3, 4545, 1, 3, 1),
(4, 4636, 1, 4, 1),
(5, 4564, 2, 1, 1),
(6, 342, 2, 2, 1),
(7, 5324, 2, 3, 1),
(8, 800, 2, 4, 1),
(54, 4300, 16, 1, 0),
(55, 200, 16, 2, 1),
(56, 1000, 16, 3, 1),
(57, 200, 16, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `servicio`
--

CREATE TABLE `servicio` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servicio`
--

INSERT INTO `servicio` (`ID`, `NOMBRE`) VALUES
(1, 'Polichado'),
(2, 'Lavado'),
(16, 'Tecnomecanica');

--
-- Triggers `servicio`
--
DELIMITER $$
CREATE TRIGGER `Crear precio` AFTER INSERT ON `servicio` FOR EACH ROW INSERT INTO precio(PRECIO, ID_SERVICIO, ID_TIPOAUTO, ACTIVO) VALUES (0,NEW.ID,1,0), (0,NEW.ID,2,0) , (0,NEW.ID,3,0) ,(0,NEW.ID,4,0)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tipoauto`
--

CREATE TABLE `tipoauto` (
  `ID` int(11) NOT NULL,
  `TIPOAUTO` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipoauto`
--

INSERT INTO `tipoauto` (`ID`, `TIPOAUTO`) VALUES
(1, 'Automovil'),
(2, 'Moto'),
(3, 'Campero'),
(4, 'Bus');

-- --------------------------------------------------------

--
-- Table structure for table `turno`
--

CREATE TABLE `turno` (
  `NROTURN` int(11) NOT NULL,
  `CEDULA` varchar(30) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `PLACA` varchar(6) NOT NULL,
  `ID_TIPOAUTO` int(11) NOT NULL,
  `HORA_EN` datetime NOT NULL,
  `CANCEL` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `turno`
--

INSERT INTO `turno` (`NROTURN`, `CEDULA`, `NOMBRE`, `PLACA`, `ID_TIPOAUTO`, `HORA_EN`, `CANCEL`) VALUES
(52, '444', 'eer', 'sfs', 1, '2019-11-19 00:00:00', 0),
(53, '131231231', 'sdfsdf', '33dds', 1, '2019-11-27 17:46:10', 1),
(54, '131414124', 'prueba', 'weq', 1, '2019-11-27 17:46:22', 1),
(55, '231231123', 'Edgar', 'mnu466', 1, '2019-11-27 17:53:54', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TIPOAUTO` (`ID_TIPOAUTO`);

--
-- Indexes for table `detalle_fact`
--
ALTER TABLE `detalle_fact`
  ADD KEY `ID_SERVICIO` (`SERVICIO`),
  ADD KEY `ID_FACTURA` (`ID_FACTURA`) USING BTREE;

--
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID_FACTURA`),
  ADD KEY `ID_CLIENTE` (`NOMBRE`);

--
-- Indexes for table `precio`
--
ALTER TABLE `precio`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_SERVICIO` (`ID_SERVICIO`),
  ADD KEY `ID_TIPOAUTO` (`ID_TIPOAUTO`);

--
-- Indexes for table `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tipoauto`
--
ALTER TABLE `tipoauto`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`NROTURN`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `factura`
--
ALTER TABLE `factura`
  MODIFY `ID_FACTURA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `precio`
--
ALTER TABLE `precio`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `servicio`
--
ALTER TABLE `servicio`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `turno`
--
ALTER TABLE `turno`
  MODIFY `NROTURN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
