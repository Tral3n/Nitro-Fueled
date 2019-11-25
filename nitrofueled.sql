-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2019 at 02:38 PM
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
(1, 1036687148, 'Dio', 'dfsf', 3, 'udf 213'),
(2, 1234141232, 'Jotaro', 'gutierrez', 1, '25252'),
(3, 1, 'jojo', 'bizarre', 3, 'joj413'),
(4, 5675, 'A name', 'A Lastname', 1, 'odr231'),
(5, 4, '4324', 'dgdgd', 3, 'fdsff3'),
(6, 5675, '', '', 3, 'te45g'),
(7, 35345353, '', '', 3, 'pls123'),
(8, 34342, '', '', 3, 'sdfs'),
(9, 34234324, '', '', 4, '2423');

-- --------------------------------------------------------

--
-- Table structure for table `configuracion`
--

CREATE TABLE `configuracion` (
  `ID` tinyint(4) NOT NULL,
  `CANTIDAD` tinyint(4) NOT NULL,
  `PORCENTAJE` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configuracion`
--

INSERT INTO `configuracion` (`ID`, `CANTIDAD`, `PORCENTAJE`) VALUES
(1, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_fact`
--

CREATE TABLE `detalle_fact` (
  `ID_FACTURA` int(11) NOT NULL,
  `ID_SERVICIO` int(11) NOT NULL,
  `DESCUENTO` int(11) NOT NULL,
  `PRECIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

CREATE TABLE `factura` (
  `ID_FACTURA` int(11) NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL,
  `TOTALFACTURA` int(11) NOT NULL,
  `FECHA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `PRECIO` int(11) NOT NULL,
  `ID_SERVICIO` int(11) NOT NULL,
  `ID_TIPOAUTO` int(11) NOT NULL,
  `ACTIVO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `precio`
--

INSERT INTO `precio` (`ID`, `PRECIO`, `ID_SERVICIO`, `ID_TIPOAUTO`, `ACTIVO`) VALUES
(1, 9789, 1, 1, 1),
(2, 23418, 1, 2, 1),
(3, 4545, 1, 3, 1),
(4, 4636, 1, 4, 1),
(5, 4564, 2, 1, 1),
(6, 342, 2, 2, 1),
(7, 5324, 2, 3, 1),
(8, 800, 2, 4, 1),
(18, 0, 7, 1, 1),
(19, 0, 7, 2, 1),
(20, 0, 7, 3, 1),
(21, 0, 7, 4, 1);

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
(7, 'Prueba');

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
  `PLACA` varchar(6) NOT NULL,
  `ID_TIPOAUTO` int(11) NOT NULL,
  `HORA_EN` datetime NOT NULL,
  `CANCEL` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `turno`
--

INSERT INTO `turno` (`NROTURN`, `CEDULA`, `PLACA`, `ID_TIPOAUTO`, `HORA_EN`, `CANCEL`) VALUES
(1, '41412', 'edf424', 3, '2019-11-01 16:39:07', 1),
(2, '5675', 'odr231', 3, '2019-11-01 17:14:55', 0),
(3, '5675', 'odr231', 3, '2019-11-15 15:39:29', 0),
(4, '5675', 'te45g', 3, '2019-11-15 15:41:27', 0),
(5, '452452', 'te45g', 3, '2019-11-15 15:43:13', 0),
(6, '35345353', 'pls123', 3, '2019-11-15 16:02:42', 0),
(7, '34342', 'sdfs', 3, '2019-11-18 16:24:05', 0),
(8, '34234324', '2423', 4, '2019-11-18 16:28:37', 0);

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
  ADD PRIMARY KEY (`ID_FACTURA`),
  ADD KEY `ID_SERVICIO` (`ID_SERVICIO`);

--
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID_FACTURA`),
  ADD KEY `ID_CLIENTE` (`ID_CLIENTE`);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `factura`
--
ALTER TABLE `factura`
  MODIFY `ID_FACTURA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `precio`
--
ALTER TABLE `precio`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `servicio`
--
ALTER TABLE `servicio`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `turno`
--
ALTER TABLE `turno`
  MODIFY `NROTURN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
