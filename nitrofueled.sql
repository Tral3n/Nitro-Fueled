-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2019 at 02:19 AM
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
(1, 1036687148, 'edgardes', 'traled', 1, 'udf 213');

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
(1, 2, 5);

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
  `ID_TIPOAUTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `precio`
--

INSERT INTO `precio` (`ID`, `PRECIO`, `ID_SERVICIO`, `ID_TIPOAUTO`) VALUES
(1, 100, 1, 1),
(2, 23418, 1, 2),
(3, 864, 1, 3),
(4, 3424, 1, 4),
(5, 53, 2, 1),
(6, 342, 2, 2),
(7, 5324, 2, 3),
(8, 800, 2, 4);

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
(2, 'Lavado');

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
-- Constraints for dumped tables
--

--
-- Constraints for table `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ID_TIPOAUTO`) REFERENCES `tipoauto` (`ID`);

--
-- Constraints for table `detalle_fact`
--
ALTER TABLE `detalle_fact`
  ADD CONSTRAINT `detalle_fact_ibfk_1` FOREIGN KEY (`ID_FACTURA`) REFERENCES `factura` (`ID_FACTURA`);

--
-- Constraints for table `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID`);

--
-- Constraints for table `precio`
--
ALTER TABLE `precio`
  ADD CONSTRAINT `precio_ibfk_1` FOREIGN KEY (`ID_TIPOAUTO`) REFERENCES `tipoauto` (`ID`),
  ADD CONSTRAINT `precio_ibfk_2` FOREIGN KEY (`ID_SERVICIO`) REFERENCES `servicio` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
