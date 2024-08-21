-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-08-2024 a las 21:55:45
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `n3m0n`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `idClient` int(11) NOT NULL,
  `Nom` varchar(100) DEFAULT NULL,
  `CIF` varchar(20) DEFAULT NULL,
  `Adreça` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`idClient`, `Nom`, `CIF`, `Adreça`) VALUES
(1, 'ENDESA ENERGÍA S.A.U.', 'A52356636', 'C. RIBERA DEL LOIRA, N 60'),
(2, 'IBERDROLA, S.A.', 'A424523533', 'C. CARDENAL GARDOQUI 8'),
(3, 'TOTALENERGIES MERCADO ESPAÑA, S.A.U', 'A55562233', 'PLAZA FERROVIARIOS ASTURIANO, 1'),
(4, 'BASSOLS ENERGIA COMERCIAL, S.L', 'C42894853', 'AVDA. GIRONA, 2'),
(5, 'ELECTRA CALDENSE ENERGIA, S.A.', 'C42822853', 'PLAZA DE CATALUÑA, 3, 1'),
(6, 'ELECTRA DEL CARDENER ENERGIA, S.A.', 'A7789118', 'PASEO DE LAS MORERAS'),
(7, 'ELECTRA ENERGIA, S.A.', 'C23235463', 'XIMENEZ, 15'),
(8, 'ELECTRA NORTE ENERGÍA, S.A.', 'A23254533', 'BELARMINO GARCIA ROZA, N 2'),
(9, 'ELÉCTRICA VAQUER ENERGIA, S.A', 'C3254533', 'AVDA. VIRGEN GADALUPE, 33-3ª'),
(10, 'ESTABANELL IMPULSA, S.A.U.', 'A232674533', 'PLAZA EUSKADI Nº5'),
(11, 'ELECTRICA SEROSENSE, S.L.', 'A23253533', 'NUÑEZ DE BALBOA, 12'),
(12, 'HIDROELÉCTRICA DEL VALIRA, S.L.', 'A232884533', 'PLAZA DE ESPAÑA, 1'),
(13, 'COMERCIALIZADORA ELECTRICA DE CADIZ, S.A.U', 'A23254511', 'ALGORTA, Nº 10, BAJO'),
(14, 'COMERCIALIZADORA LERSA, S.L.', 'A23254522', 'BEATRIZ DE SILVA, 2'),
(15, 'EOSA ENERGÍA, S.L.', 'A23254577', 'CARLOS V, Nº4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factures`
--

CREATE TABLE `factures` (
  `idFactura` int(11) NOT NULL,
  `idClient` int(11) DEFAULT NULL,
  `baseImponible` decimal(10,2) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `estatPagament` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factures`
--

INSERT INTO `factures` (`idFactura`, `idClient`, `baseImponible`, `iva`, `estatPagament`) VALUES
(1, 1, 150.00, 21.00, 0),
(2, 2, 300.00, 21.00, 0),
(3, 3, 450.00, 21.00, 0),
(4, 4, 600.00, 21.00, 0),
(11, 6, 3000.00, 21.00, 1),
(12, 6, 3000.00, 21.00, 0),
(13, 6, 3000.00, 21.00, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linies_factura`
--

CREATE TABLE `linies_factura` (
  `idLiniaFactura` int(11) NOT NULL,
  `idFactura` int(11) DEFAULT NULL,
  `idProducte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `linies_factura`
--

INSERT INTO `linies_factura` (`idLiniaFactura`, `idFactura`, `idProducte`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(7, 13, 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productes`
--

CREATE TABLE `productes` (
  `idProducte` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `preuCost` decimal(10,2) DEFAULT NULL,
  `preuVenda` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productes`
--

INSERT INTO `productes` (`idProducte`, `nom`, `preuCost`, `preuVenda`) VALUES
(1, 'Gestión de Datos de Energía', 100.00, 150.00),
(2, 'Análisis Predictivo de Consumo de Energía', 200.00, 300.00),
(3, 'Servicios de Ciberseguridad Energética', 300.00, 450.00),
(4, 'Servicios de Soporte Técnico de TI', 400.00, 600.00),
(5, 'Auditoría de Infraestructura de TI', 500.00, 750.00),
(6, 'Soporte técnico', 100.00, 150.00),
(7, 'Gestión de infraestructura de TI', 200.00, 250.00),
(8, 'Servicios de nube', 300.00, 350.00),
(9, 'Servicios de seguridad cibernética', 400.00, 450.00),
(10, 'Servicios de recuperación de desastres', 500.00, 550.00),
(11, 'Servicios de backup y almacenamiento', 600.00, 650.00),
(12, 'Servicios de red y conectividad', 700.00, 750.00),
(13, 'Servicios de bases de datos', 800.00, 850.00),
(14, 'Servicios de desarrollo de software', 900.00, 950.00),
(15, 'Servicios de análisis de datos', 1000.00, 1050.00),
(16, 'Servicios de inteligencia empresarial', 1100.00, 1150.00),
(17, 'Servicios de gestión de proyectos de TI', 1200.00, 1250.00),
(18, 'Servicios de consultoría de TI', 1300.00, 1350.00),
(19, 'Servicios de formación en TI', 1400.00, 1450.00),
(20, 'Servicios de gestión de sistemas', 1500.00, 1550.00),
(21, 'Servicios de mantenimiento de hardware', 1600.00, 1650.00),
(22, 'Servicios de virtualización', 1700.00, 1750.00),
(23, 'Servicios de gestión de identidad y acceso', 1800.00, 1850.00),
(24, 'Servicios de auditoría de TI', 1900.00, 1950.00),
(25, 'Servicios de gestión de calidad de software', 2000.00, 2050.00),
(26, 'Servicios de gestión de activos de TI', 2100.00, 2150.00),
(27, 'Servicios de gestión de proveedores de TI', 2200.00, 2250.00),
(28, 'Servicios de gestión de cambios de TI', 2300.00, 2350.00),
(29, 'Servicios de gestión de riesgos de TI', 2400.00, 2450.00),
(30, 'Servicios de gestión de licencias de software', 2500.00, 2550.00),
(31, 'Servicios de optimización de procesos de TI', 2600.00, 2650.00),
(32, 'Servicios de gestión de portafolio de proyectos de TI', 2700.00, 2750.00),
(33, 'Servicios de gestión de capacidad de TI', 2800.00, 2850.00),
(34, 'Servicios de gestión de rendimiento de TI', 2900.00, 2950.00),
(35, 'Servicios de gestión de la continuidad del negocio', 3000.00, 3050.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`idClient`),
  ADD UNIQUE KEY `CIF` (`CIF`);

--
-- Indices de la tabla `factures`
--
ALTER TABLE `factures`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `idClient` (`idClient`);

--
-- Indices de la tabla `linies_factura`
--
ALTER TABLE `linies_factura`
  ADD PRIMARY KEY (`idLiniaFactura`),
  ADD KEY `idFactura` (`idFactura`),
  ADD KEY `idProducte` (`idProducte`);

--
-- Indices de la tabla `productes`
--
ALTER TABLE `productes`
  ADD PRIMARY KEY (`idProducte`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `factures`
--
ALTER TABLE `factures`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `linies_factura`
--
ALTER TABLE `linies_factura`
  MODIFY `idLiniaFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productes`
--
ALTER TABLE `productes`
  MODIFY `idProducte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factures`
--
ALTER TABLE `factures`
  ADD CONSTRAINT `factures_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`);

--
-- Filtros para la tabla `linies_factura`
--
ALTER TABLE `linies_factura`
  ADD CONSTRAINT `linies_factura_ibfk_1` FOREIGN KEY (`idFactura`) REFERENCES `factures` (`idFactura`),
  ADD CONSTRAINT `linies_factura_ibfk_2` FOREIGN KEY (`idProducte`) REFERENCES `productes` (`idProducte`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
