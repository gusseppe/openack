-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 04-12-2014 a las 12:13:40
-- Versión del servidor: 5.5.40-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `openack`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Aporte`
--

CREATE TABLE IF NOT EXISTS `Aporte` (
  `idAporte` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `tipoDeAporte` varchar(45) DEFAULT NULL,
  `Puntuacion` int(11) DEFAULT NULL,
  `Comentarios` varchar(45) DEFAULT NULL,
  `Tema_idTema` int(11) NOT NULL,
  `Tema_Curso_idCurso` int(11) NOT NULL,
  PRIMARY KEY (`idAporte`,`Tema_idTema`,`Tema_Curso_idCurso`),
  KEY `fk_Aporte_Tema1_idx` (`Tema_idTema`,`Tema_Curso_idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BolsaDeTrabajo`
--

CREATE TABLE IF NOT EXISTS `BolsaDeTrabajo` (
  `idBolsaDeTrabajo` int(11) NOT NULL AUTO_INCREMENT,
  `ListaDeEmpresas` varchar(45) DEFAULT NULL,
  `Rubro` varchar(45) DEFAULT NULL,
  `Requerimientos` varchar(45) DEFAULT NULL,
  `Puntuacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idBolsaDeTrabajo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Carrera`
--

CREATE TABLE IF NOT EXISTS `Carrera` (
  `idCarrera` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Comentarios` varchar(45) DEFAULT NULL,
  `MallaCurricular` varchar(45) DEFAULT NULL,
  `Facultad_idFacultad` int(11) NOT NULL,
  PRIMARY KEY (`idCarrera`,`Facultad_idFacultad`),
  KEY `fk_Carrera_Facultad1_idx` (`Facultad_idFacultad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Carrera_has_Ciclo`
--

CREATE TABLE IF NOT EXISTS `Carrera_has_Ciclo` (
  `Carrera_idCarrera` int(11) NOT NULL,
  `Carrera_Facultad_idFacultad` int(11) NOT NULL,
  `Ciclo_idCiclo` int(11) NOT NULL,
  PRIMARY KEY (`Carrera_idCarrera`,`Carrera_Facultad_idFacultad`,`Ciclo_idCiclo`),
  UNIQUE KEY `Carrera_Facultad_idFacultad` (`Carrera_Facultad_idFacultad`),
  UNIQUE KEY `Ciclo_idCiclo` (`Ciclo_idCiclo`),
  UNIQUE KEY `Carrera_Facultad_idFacultad_2` (`Carrera_Facultad_idFacultad`),
  KEY `fk_Carrera_has_Ciclo_Ciclo1_idx` (`Ciclo_idCiclo`),
  KEY `fk_Carrera_has_Ciclo_Carrera1_idx` (`Carrera_idCarrera`,`Carrera_Facultad_idFacultad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ciclo`
--

CREATE TABLE IF NOT EXISTS `Ciclo` (
  `idCiclo` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroDeCiclo` int(11) NOT NULL,
  PRIMARY KEY (`idCiclo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Comentario`
--

CREATE TABLE IF NOT EXISTS `Comentario` (
  `idComentario` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(45) NOT NULL,
  `Texto` varchar(45) DEFAULT NULL,
  `Puntuacion` varchar(45) DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Usuario_Universidad_idUniversidad` int(11) NOT NULL,
  `Usuario_Empresa_idEmpresa` int(11) NOT NULL,
  `Usuario_Empresa_BolsaDeTrabajo_idBolsaDeTrabajo` int(11) NOT NULL,
  PRIMARY KEY (`idComentario`,`Usuario_idUsuario`,`Usuario_Universidad_idUniversidad`,`Usuario_Empresa_idEmpresa`,`Usuario_Empresa_BolsaDeTrabajo_idBolsaDeTrabajo`),
  KEY `fk_Comentario_Usuario1_idx` (`Usuario_idUsuario`,`Usuario_Universidad_idUniversidad`,`Usuario_Empresa_idEmpresa`,`Usuario_Empresa_BolsaDeTrabajo_idBolsaDeTrabajo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Curso`
--

CREATE TABLE IF NOT EXISTS `Curso` (
  `idCurso` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Puntuacion` varchar(45) DEFAULT NULL,
  `Sylabus` varchar(45) DEFAULT NULL,
  `Aportes` varchar(45) DEFAULT NULL,
  `Carrera_idCarrera` int(11) NOT NULL,
  `Carrera_Facultad_idFacultad` int(11) NOT NULL,
  PRIMARY KEY (`idCurso`,`Carrera_idCarrera`,`Carrera_Facultad_idFacultad`),
  KEY `fk_Curso_Carrera1_idx` (`Carrera_idCarrera`,`Carrera_Facultad_idFacultad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empresa`
--

CREATE TABLE IF NOT EXISTS `Empresa` (
  `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Rubro` varchar(45) DEFAULT NULL,
  `Puntuacion` int(11) DEFAULT NULL,
  `Comentarios` varchar(45) DEFAULT NULL,
  `BolsaDeTrabajo_idBolsaDeTrabajo` int(11) NOT NULL,
  PRIMARY KEY (`idEmpresa`,`BolsaDeTrabajo_idBolsaDeTrabajo`),
  KEY `fk_Empresa_BolsaDeTrabajo1_idx` (`BolsaDeTrabajo_idBolsaDeTrabajo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Facultad`
--

CREATE TABLE IF NOT EXISTS `Facultad` (
  `idFacultad` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `NumeroDeAportes` int(11) DEFAULT NULL,
  `Universidad_idUniversidad` int(11) NOT NULL,
  PRIMARY KEY (`idFacultad`,`Universidad_idUniversidad`),
  KEY `fk_Facultad_Universidad1_idx` (`Universidad_idUniversidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Historial`
--

CREATE TABLE IF NOT EXISTS `Historial` (
  `idHistorial` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroDeAportes` int(11) DEFAULT NULL,
  `Aportes` varchar(45) DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Usuario_Universidad_idUniversidad` int(11) NOT NULL,
  `Usuario_Empresa_idEmpresa` int(11) NOT NULL,
  `Usuario_Empresa_BolsaDeTrabajo_idBolsaDeTrabajo` int(11) NOT NULL,
  PRIMARY KEY (`idHistorial`,`Usuario_idUsuario`,`Usuario_Universidad_idUniversidad`,`Usuario_Empresa_idEmpresa`,`Usuario_Empresa_BolsaDeTrabajo_idBolsaDeTrabajo`),
  KEY `fk_Historial_Usuario1_idx` (`Usuario_idUsuario`,`Usuario_Universidad_idUniversidad`,`Usuario_Empresa_idEmpresa`,`Usuario_Empresa_BolsaDeTrabajo_idBolsaDeTrabajo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tema`
--

CREATE TABLE IF NOT EXISTS `Tema` (
  `idTema` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `NumeroDeAportes` int(11) DEFAULT NULL,
  `Curso_idCurso` int(11) NOT NULL,
  PRIMARY KEY (`idTema`,`Curso_idCurso`),
  KEY `fk_Tema_Curso1_idx` (`Curso_idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Universidad`
--

CREATE TABLE IF NOT EXISTS `Universidad` (
  `idUniversidad` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `NumeroDeAportes` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUniversidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE IF NOT EXISTS `Usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Puntuacion` int(11) DEFAULT NULL,
  `NivelEducativo` varchar(45) NOT NULL,
  `Carrera` varchar(45) DEFAULT NULL,
  `Universidad_idUniversidad` int(11) NOT NULL DEFAULT '0',
  `Empresa_idEmpresa` int(11) NOT NULL DEFAULT '0',
  `Empresa_BolsaDeTrabajo_idBolsaDeTrabajo` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idUsuario`,`Universidad_idUniversidad`,`Empresa_idEmpresa`,`Empresa_BolsaDeTrabajo_idBolsaDeTrabajo`),
  KEY `fk_Usuario_Universidad1_idx` (`Universidad_idUniversidad`),
  KEY `fk_Usuario_Empresa1_idx` (`Empresa_idEmpresa`,`Empresa_BolsaDeTrabajo_idBolsaDeTrabajo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Aporte`
--
ALTER TABLE `Aporte`
  ADD CONSTRAINT `fk_Aporte_Tema1` FOREIGN KEY (`Tema_idTema`, `Tema_Curso_idCurso`) REFERENCES `Tema` (`idTema`, `Curso_idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Carrera`
--
ALTER TABLE `Carrera`
  ADD CONSTRAINT `fk_Carrera_Facultad1` FOREIGN KEY (`Facultad_idFacultad`) REFERENCES `Facultad` (`idFacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Carrera_has_Ciclo`
--
ALTER TABLE `Carrera_has_Ciclo`
  ADD CONSTRAINT `fk_Carrera_has_Ciclo_Carrera1` FOREIGN KEY (`Carrera_idCarrera`, `Carrera_Facultad_idFacultad`) REFERENCES `Carrera` (`idCarrera`, `Facultad_idFacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Carrera_has_Ciclo_Ciclo1` FOREIGN KEY (`Ciclo_idCiclo`) REFERENCES `Ciclo` (`idCiclo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Comentario`
--
ALTER TABLE `Comentario`
  ADD CONSTRAINT `fk_Comentario_Usuario1` FOREIGN KEY (`Usuario_idUsuario`, `Usuario_Universidad_idUniversidad`, `Usuario_Empresa_idEmpresa`, `Usuario_Empresa_BolsaDeTrabajo_idBolsaDeTrabajo`) REFERENCES `Usuario` (`idUsuario`, `Universidad_idUniversidad`, `Empresa_idEmpresa`, `Empresa_BolsaDeTrabajo_idBolsaDeTrabajo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Curso`
--
ALTER TABLE `Curso`
  ADD CONSTRAINT `fk_Curso_Carrera1` FOREIGN KEY (`Carrera_idCarrera`, `Carrera_Facultad_idFacultad`) REFERENCES `Carrera` (`idCarrera`, `Facultad_idFacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Empresa`
--
ALTER TABLE `Empresa`
  ADD CONSTRAINT `fk_Empresa_BolsaDeTrabajo1` FOREIGN KEY (`BolsaDeTrabajo_idBolsaDeTrabajo`) REFERENCES `BolsaDeTrabajo` (`idBolsaDeTrabajo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Facultad`
--
ALTER TABLE `Facultad`
  ADD CONSTRAINT `fk_Facultad_Universidad1` FOREIGN KEY (`Universidad_idUniversidad`) REFERENCES `Universidad` (`idUniversidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Historial`
--
ALTER TABLE `Historial`
  ADD CONSTRAINT `fk_Historial_Usuario1` FOREIGN KEY (`Usuario_idUsuario`, `Usuario_Universidad_idUniversidad`, `Usuario_Empresa_idEmpresa`, `Usuario_Empresa_BolsaDeTrabajo_idBolsaDeTrabajo`) REFERENCES `Usuario` (`idUsuario`, `Universidad_idUniversidad`, `Empresa_idEmpresa`, `Empresa_BolsaDeTrabajo_idBolsaDeTrabajo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Tema`
--
ALTER TABLE `Tema`
  ADD CONSTRAINT `fk_Tema_Curso1` FOREIGN KEY (`Curso_idCurso`) REFERENCES `Curso` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `fk_Usuario_Universidad1` FOREIGN KEY (`Universidad_idUniversidad`) REFERENCES `Universidad` (`idUniversidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_Empresa1` FOREIGN KEY (`Empresa_idEmpresa`, `Empresa_BolsaDeTrabajo_idBolsaDeTrabajo`) REFERENCES `Empresa` (`idEmpresa`, `BolsaDeTrabajo_idBolsaDeTrabajo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
