-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-11-2022 a las 16:39:23
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

DROP TABLE IF EXISTS `autores`;
CREATE TABLE IF NOT EXISTS `autores` (
  `codigo_autor` int(23) NOT NULL AUTO_INCREMENT,
  `apellido_autor` char(50) DEFAULT NULL,
  `nombre_autor` char(50) DEFAULT NULL,
  `pais_origen` int(15) DEFAULT NULL,
  PRIMARY KEY (`codigo_autor`),
  KEY `pk_fk_pais_origen` (`pais_origen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editoriales`
--

DROP TABLE IF EXISTS `editoriales`;
CREATE TABLE IF NOT EXISTS `editoriales` (
  `codigo_editorial` int(23) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` int(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_editorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `cod_empleado` int(23) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) DEFAULT NULL,
  `apellido` char(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `cod_estado` int(23) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) DEFAULT NULL,
  PRIMARY KEY (`cod_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
CREATE TABLE IF NOT EXISTS `estudiantes` (
  `carne` int(23) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) DEFAULT NULL,
  `apellido` char(50) DEFAULT NULL,
  `direccion` char(50) DEFAULT NULL,
  `telefono` int(15) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `codigo_grado` int(15) DEFAULT NULL,
  PRIMARY KEY (`carne`),
  KEY `pk_fk_codigo_grado` (`codigo_grado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

DROP TABLE IF EXISTS `grado`;
CREATE TABLE IF NOT EXISTS `grado` (
  `codigo_grado` int(23) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_grado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

DROP TABLE IF EXISTS `libros`;
CREATE TABLE IF NOT EXISTS `libros` (
  `codigo_libro` int(23) NOT NULL AUTO_INCREMENT,
  `codigo_autor` int(25) DEFAULT NULL,
  `codigo_editorial` int(25) DEFAULT NULL,
  `titulo` char(50) DEFAULT NULL,
  `numero_pag` int(200) DEFAULT NULL,
  `tamaño` varchar(50) DEFAULT NULL,
  `precio` int(250) DEFAULT NULL,
  `estado` int(50) DEFAULT NULL,
  `edicion` int(15) DEFAULT NULL,
  PRIMARY KEY (`codigo_libro`),
  KEY `pk_fk_codigo_editorial` (`codigo_editorial`),
  KEY `pk_fk_estado` (`estado`),
  KEY `pk_fk_codigo_autor` (`codigo_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

DROP TABLE IF EXISTS `paises`;
CREATE TABLE IF NOT EXISTS `paises` (
  `cod_pais` int(23) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) DEFAULT NULL,
  PRIMARY KEY (`cod_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
CREATE TABLE IF NOT EXISTS `prestamos` (
  `Cod_prestamo` int(23) NOT NULL AUTO_INCREMENT,
  `codigo_libro` int(15) DEFAULT NULL,
  `carne` int(20) DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `cod_empleado` int(20) DEFAULT NULL,
  PRIMARY KEY (`Cod_prestamo`),
  KEY `pk_fk_carne` (`carne`),
  KEY `pk_fk_cod_empleado` (`cod_empleado`),
  KEY `pk_fk_codigo_libro` (`codigo_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autores`
--
ALTER TABLE `autores`
  ADD CONSTRAINT `pk_fk_pais_origen` FOREIGN KEY (`pais_origen`) REFERENCES `paises` (`cod_pais`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `pk_fk_codigo_grado` FOREIGN KEY (`codigo_grado`) REFERENCES `grado` (`codigo_grado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `pk_fk_codigo_autor` FOREIGN KEY (`codigo_autor`) REFERENCES `autores` (`codigo_autor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pk_fk_codigo_editorial` FOREIGN KEY (`codigo_editorial`) REFERENCES `editoriales` (`codigo_editorial`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pk_fk_estado` FOREIGN KEY (`estado`) REFERENCES `estados` (`cod_estado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `pk_fk_carne` FOREIGN KEY (`carne`) REFERENCES `estudiantes` (`carne`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pk_fk_cod_empleado` FOREIGN KEY (`cod_empleado`) REFERENCES `empleado` (`cod_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pk_fk_codigo_libro` FOREIGN KEY (`codigo_libro`) REFERENCES `libros` (`codigo_libro`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
