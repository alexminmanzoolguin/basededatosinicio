-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-02-2022 a las 03:48:03
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comunidades`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asiste`
--

CREATE TABLE `asiste` (
  `id_asiste` int(20) NOT NULL,
  `motivo` varchar(50) DEFAULT NULL,
  `id_difusion` int(20) DEFAULT NULL,
  `id_persona` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunidad`
--

CREATE TABLE `comunidad` (
  `id_comunidad` int(20) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `id_tipocomu` int(20) DEFAULT NULL,
  `id_dire` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `difusion`
--

CREATE TABLE `difusion` (
  `id_difusion` int(20) NOT NULL,
  `difusion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion_base`
--

CREATE TABLE `direccion_base` (
  `id_dire` int(20) NOT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `municipio` varchar(30) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(20) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `objetivo` varchar(50) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_comunidad` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medeve`
--

CREATE TABLE `medeve` (
  `id_medeve` int(20) NOT NULL,
  `detalle` varchar(50) DEFAULT NULL,
  `id_evento` int(20) DEFAULT NULL,
  `id_medio` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medios`
--

CREATE TABLE `medios` (
  `id_medio` int(20) NOT NULL,
  `medio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(20) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `ape_pat` varchar(20) DEFAULT NULL,
  `ape_mat` varchar(20) DEFAULT NULL,
  `ocupacion` varchar(20) DEFAULT NULL,
  `id_ubicacion` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redcom`
--

CREATE TABLE `redcom` (
  `id_redcom` int(20) NOT NULL,
  `id_redes` int(20) DEFAULT NULL,
  `id_comunidad` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes`
--

CREATE TABLE `redes` (
  `id_redes` int(20) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `enlace` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requerimiento`
--

CREATE TABLE `requerimiento` (
  `id_requerimiento` int(20) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `id_evento` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocomunidad`
--

CREATE TABLE `tipocomunidad` (
  `id_tipocomu` int(20) NOT NULL,
  `tipo_comunidad` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id_ubicacion` int(20) NOT NULL,
  `numero` int(30) DEFAULT NULL,
  `codigopostal` int(30) DEFAULT NULL,
  `id_dire` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asiste`
--
ALTER TABLE `asiste`
  ADD PRIMARY KEY (`id_asiste`),
  ADD KEY `id_difusion` (`id_difusion`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `comunidad`
--
ALTER TABLE `comunidad`
  ADD PRIMARY KEY (`id_comunidad`),
  ADD KEY `id_tipocomu` (`id_tipocomu`),
  ADD KEY `id_dire` (`id_dire`);

--
-- Indices de la tabla `difusion`
--
ALTER TABLE `difusion`
  ADD PRIMARY KEY (`id_difusion`);

--
-- Indices de la tabla `direccion_base`
--
ALTER TABLE `direccion_base`
  ADD PRIMARY KEY (`id_dire`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `id_comunidad` (`id_comunidad`);

--
-- Indices de la tabla `medeve`
--
ALTER TABLE `medeve`
  ADD PRIMARY KEY (`id_medeve`),
  ADD KEY `id_evento` (`id_evento`),
  ADD KEY `id_medio` (`id_medio`);

--
-- Indices de la tabla `medios`
--
ALTER TABLE `medios`
  ADD PRIMARY KEY (`id_medio`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `id_ubicacion` (`id_ubicacion`);

--
-- Indices de la tabla `redcom`
--
ALTER TABLE `redcom`
  ADD PRIMARY KEY (`id_redcom`),
  ADD KEY `id_redes` (`id_redes`),
  ADD KEY `id_comunidad` (`id_comunidad`);

--
-- Indices de la tabla `redes`
--
ALTER TABLE `redes`
  ADD PRIMARY KEY (`id_redes`);

--
-- Indices de la tabla `requerimiento`
--
ALTER TABLE `requerimiento`
  ADD PRIMARY KEY (`id_requerimiento`),
  ADD KEY `id_evento` (`id_evento`);

--
-- Indices de la tabla `tipocomunidad`
--
ALTER TABLE `tipocomunidad`
  ADD PRIMARY KEY (`id_tipocomu`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id_ubicacion`),
  ADD KEY `id_dire` (`id_dire`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asiste`
--
ALTER TABLE `asiste`
  ADD CONSTRAINT `asiste_ibfk_1` FOREIGN KEY (`id_difusion`) REFERENCES `difusion` (`id_difusion`),
  ADD CONSTRAINT `asiste_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `comunidad`
--
ALTER TABLE `comunidad`
  ADD CONSTRAINT `comunidad_ibfk_1` FOREIGN KEY (`id_tipocomu`) REFERENCES `tipocomunidad` (`id_tipocomu`),
  ADD CONSTRAINT `comunidad_ibfk_2` FOREIGN KEY (`id_dire`) REFERENCES `direccion_base` (`id_dire`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_comunidad`) REFERENCES `comunidad` (`id_comunidad`);

--
-- Filtros para la tabla `medeve`
--
ALTER TABLE `medeve`
  ADD CONSTRAINT `medeve_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`),
  ADD CONSTRAINT `medeve_ibfk_2` FOREIGN KEY (`id_medio`) REFERENCES `medios` (`id_medio`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`);

--
-- Filtros para la tabla `redcom`
--
ALTER TABLE `redcom`
  ADD CONSTRAINT `redcom_ibfk_1` FOREIGN KEY (`id_redes`) REFERENCES `redes` (`id_redes`),
  ADD CONSTRAINT `redcom_ibfk_2` FOREIGN KEY (`id_comunidad`) REFERENCES `comunidad` (`id_comunidad`);

--
-- Filtros para la tabla `requerimiento`
--
ALTER TABLE `requerimiento`
  ADD CONSTRAINT `requerimiento_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`);

--
-- Filtros para la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD CONSTRAINT `ubicacion_ibfk_1` FOREIGN KEY (`id_dire`) REFERENCES `direccion_base` (`id_dire`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
