-- MySQL Script generated by MySQL Workbench
-- mié 10 dic 2014 17:17:31 PET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema openack
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `openack` ;

-- -----------------------------------------------------
-- Schema openack
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `openack` DEFAULT CHARACTER SET latin1 ;
USE `openack` ;

-- -----------------------------------------------------
-- Table `openack`.`BolsaDeTrabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openack`.`BolsaDeTrabajo` (
  `idBolsaDeTrabajo` INT NOT NULL AUTO_INCREMENT,
  `ListaDeEmpresas` VARCHAR(45) NULL,
  `Rubro` VARCHAR(45) NULL,
  `Requerimientos` VARCHAR(45) NULL,
  `Puntuacion` VARCHAR(45) NULL,
  PRIMARY KEY (`idBolsaDeTrabajo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openack`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openack`.`Empresa` (
  `idEmpresa` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Rubro` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Puntuacion` INT NULL,
  `Comentarios` VARCHAR(45) NULL,
  `BolsaDeTrabajo_idBolsaDeTrabajo` INT NOT NULL,
  PRIMARY KEY (`idEmpresa`, `BolsaDeTrabajo_idBolsaDeTrabajo`),
  CONSTRAINT `fk_Empresa_BolsaDeTrabajo1`
    FOREIGN KEY (`BolsaDeTrabajo_idBolsaDeTrabajo`)
    REFERENCES `openack`.`BolsaDeTrabajo` (`idBolsaDeTrabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openack`.`Universidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openack`.`Universidad` (
  `idUniversidad` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `NumeroDeAportes` INT NULL,
  PRIMARY KEY (`idUniversidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openack`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openack`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Apellidos` VARCHAR(45) NULL,
  `Puntuacion` INT NULL,
  `NivelEducativo` VARCHAR(45) NULL,
  `Carrera` VARCHAR(45) NULL,
  `Universidad_idUniversidad` INT NOT NULL,
  `Empresa_idEmpresa` INT NOT NULL,
  `Empresa_BolsaDeTrabajo_idBolsaDeTrabajo` INT NOT NULL,
  PRIMARY KEY (`idUsuario`, `Empresa_BolsaDeTrabajo_idBolsaDeTrabajo`, `Empresa_idEmpresa`, `Universidad_idUniversidad`),
  CONSTRAINT `fk_Usuario_Empresa1`
    FOREIGN KEY (`Empresa_idEmpresa` , `Empresa_BolsaDeTrabajo_idBolsaDeTrabajo`)
    REFERENCES `openack`.`Empresa` (`idEmpresa` , `BolsaDeTrabajo_idBolsaDeTrabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Universidad1`
    FOREIGN KEY (`Universidad_idUniversidad`)
    REFERENCES `openack`.`Universidad` (`idUniversidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openack`.`Facultad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openack`.`Facultad` (
  `idFacultad` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `NumeroDeAportes` INT NULL,
  `Universidad_idUniversidad` INT NOT NULL,
  PRIMARY KEY (`idFacultad`),
  CONSTRAINT `fk_Facultad_Universidad1`
    FOREIGN KEY (`Universidad_idUniversidad`)
    REFERENCES `openack`.`Universidad` (`idUniversidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openack`.`Carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openack`.`Carrera` (
  `idCarrera` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Categoria` VARCHAR(45) NULL,
  `Comentarios` VARCHAR(45) NULL,
  `MallaCurricular` VARCHAR(45) NULL,
  `Facultad_idFacultad` INT NOT NULL,
  PRIMARY KEY (`idCarrera`, `Facultad_idFacultad`),
  CONSTRAINT `fk_Carrera_Facultad1`
    FOREIGN KEY (`Facultad_idFacultad`)
    REFERENCES `openack`.`Facultad` (`idFacultad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openack`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openack`.`Curso` (
  `idCurso` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Categoria` VARCHAR(45) NULL,
  `Puntuacion` VARCHAR(45) NULL,
  `Sylabus` VARCHAR(45) NULL,
  `Aportes` VARCHAR(45) NULL,
  `Carrera_idCarrera` INT NOT NULL,
  `Carrera_Facultad_idFacultad` INT NOT NULL,
  PRIMARY KEY (`idCurso`, `Carrera_Facultad_idFacultad`, `Carrera_idCarrera`),
  CONSTRAINT `fk_Curso_Carrera1`
    FOREIGN KEY (`Carrera_idCarrera` , `Carrera_Facultad_idFacultad`)
    REFERENCES `openack`.`Carrera` (`idCarrera` , `Facultad_idFacultad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openack`.`Tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openack`.`Tema` (
  `idTema` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `NumeroDeAportes` INT NULL,
  `Curso_idCurso` INT NOT NULL,
  PRIMARY KEY (`idTema`, `Curso_idCurso`),
  CONSTRAINT `fk_Tema_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `openack`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openack`.`Aporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openack`.`Aporte` (
  `idAporte` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Categoria` VARCHAR(45) NULL,
  `tipoDeAporte` VARCHAR(45) NULL,
  `Puntuacion` INT NULL,
  `Comentarios` VARCHAR(45) NULL,
  `Tema_idTema` INT NOT NULL,
  `Tema_Curso_idCurso` INT NOT NULL,
  PRIMARY KEY (`idAporte`, `Tema_Curso_idCurso`, `Tema_idTema`),
  CONSTRAINT `fk_Aporte_Tema1`
    FOREIGN KEY (`Tema_idTema` , `Tema_Curso_idCurso`)
    REFERENCES `openack`.`Tema` (`idTema` , `Curso_idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openack`.`Ciclo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openack`.`Ciclo` (
  `idCiclo` INT NOT NULL AUTO_INCREMENT,
  `NumeroDeCiclo` INT NOT NULL,
  PRIMARY KEY (`idCiclo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openack`.`Carrera_has_Ciclo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openack`.`Carrera_has_Ciclo` (
  `Carrera_idCarrera` INT NOT NULL,
  `Carrera_Facultad_idFacultad` INT NOT NULL,
  `Ciclo_idCiclo` INT NOT NULL,
  PRIMARY KEY (`Carrera_idCarrera`, `Carrera_Facultad_idFacultad`, `Ciclo_idCiclo`),
  CONSTRAINT `fk_Carrera_has_Ciclo_Carrera1`
    FOREIGN KEY (`Carrera_idCarrera` , `Carrera_Facultad_idFacultad`)
    REFERENCES `openack`.`Carrera` (`idCarrera` , `Facultad_idFacultad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Carrera_has_Ciclo_Ciclo1`
    FOREIGN KEY (`Ciclo_idCiclo`)
    REFERENCES `openack`.`Ciclo` (`idCiclo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
