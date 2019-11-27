-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2019 at 09:12 PM
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
  `CC` int(11) NOT NULL,
  `NOMBRES` varchar(40) NOT NULL,
  `APELLIDOS` varchar(40) NOT NULL,
  `ID_TIPOAUTO` int(11) NOT NULL,
  `PLACA` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`ID`, `CC`, `NOMBRES`, `APELLIDOS`, `ID_TIPOAUTO`, `PLACA`) VALUES
(32, 3423424, 'Edgar', 'Jojo', 2, '342www'),
(35, 1000000, 'Julian', '', 1, 'tfr345'),
(36, 339048249, 'Kevin', '', 2, 'pls123'),
(37, 2142423, 'jesus', '', 3, 'wew234'),
(38, 4243424, 'Hola', '', 1, 'ded123'),
(39, 342432, 'prueba', '', 1, 'mdf321'),
(41, 1423, 'rdsfsd', 'fsadf', 2, 'eee333');

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
(1, 2, 2);

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
(17, 'Lavado', 4564);

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
(14, 339048249, 'Kevin', 'Moto', 'pls123', 10342, 517.1, 9824.9, '2019-11-26 17:39:59'),
(15, 1000000, 'Julian', 'Automovil', 'tfr345', 4564, 0, 4564, '2019-11-26 17:40:22'),
(16, 2142423, 'jesus', 'Campero', 'wew234', 10269, 308.07, 9960.93, '2019-11-26 17:48:03'),
(17, 342432, 'prueba', 'Automovil', 'mdf321', 5564, 0, 5564, '2019-11-27 13:58:42');

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
(1, 9789, 1, 1, 1),
(2, 10000, 1, 2, 1),
(3, 4545, 1, 3, 1),
(4, 4636, 1, 4, 1),
(5, 4564, 2, 1, 1),
(6, 342, 2, 2, 1),
(7, 5324, 2, 3, 1),
(8, 800, 2, 4, 1),
(38, 1000, 12, 1, 1),
(39, 200, 12, 2, 1),
(40, 400, 12, 3, 1),
(41, 1000, 12, 4, 0);

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
(12, 'Pinchada');

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
(27, '1000000', 'Julian', 'tfr345', 1, '2019-11-26 17:37:22', 1),
(28, '339048249', 'Kevin', 'pls123', 2, '2019-11-26 17:38:44', 1),
(29, '2142423', 'jesus', 'wew234', 3, '2019-11-26 17:47:38', 1),
(30, '4243424', 'Hola', 'ded123', 1, '2019-11-26 17:50:08', 1),
(31, '342432', 'prueba', 'mdf321', 1, '2019-11-27 13:58:25', 1),
(32, '5653453', 'dfgdfgd', 'ded123', 1, '2019-11-27 14:22:24', 0),
(33, '4535', 'prueba', 'MNU466', 1, '2019-11-27 14:53:44', 0),
(34, '131231', 'ertet', 'MNU466', 1, '2019-11-27 14:59:46', 1);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `factura`
--
ALTER TABLE `factura`
  MODIFY `ID_FACTURA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `precio`
--
ALTER TABLE `precio`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `servicio`
--
ALTER TABLE `servicio`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `turno`
--
ALTER TABLE `turno`
  MODIFY `NROTURN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
