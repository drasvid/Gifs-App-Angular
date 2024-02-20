-- MySQL Script generated by MySQL Workbench
-- Mon Feb 19 17:11:24 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema colegio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema colegio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `colegio` DEFAULT CHARACTER SET utf8 ;
USE `colegio` ;

-- -----------------------------------------------------
-- Table `colegio`.`Barcos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colegio`.`Barcos` (
  `idBarcos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `modelo` VARCHAR(45) NULL,
  `eslora` VARCHAR(45) NULL,
  `manga` VARCHAR(45) NULL,
  `club_nautico` VARCHAR(45) NULL,
  `armador` VARCHAR(45) NULL,
  PRIMARY KEY (`idBarcos`))



-- -----------------------------------------------------
-- Table `colegio`.`Clubes Nauticos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colegio`.`Clubes Nauticos` (
  `idClubes Nauticos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `Siglas` VARCHAR(15) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` INT NULL,
  `descripcion` VARCHAR(10) NULL,
  `Barcos_idBarcos` INT NOT NULL,
  PRIMARY KEY (`idClubes Nauticos`),
  CONSTRAINT `fk_Clubes Nauticos_Barcos`
    FOREIGN KEY (`Barcos_idBarcos`)
    REFERENCES `colegio`.`Barcos` (`idBarcos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table `colegio`.`armador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colegio`.`armador` (
  `idarmador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `dni` INT NULL,
  `direccion` VARCHAR(45) NULL,
  `Barcos_idBarcos` INT NOT NULL,
  PRIMARY KEY (`idarmador`),

  CONSTRAINT `fk_armador_Barcos1`
    FOREIGN KEY (`Barcos_idBarcos`)
    REFERENCES `colegio`.`Barcos` (`idBarcos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table `colegio`.`miembros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colegio`.`miembros` (
  `idmiembros` INT NOT NULL AUTO_INCREMENT,
  `targeta federativa` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` INT NULL,
  `estado` VARCHAR(10) BINARY NULL,
  `escuela` VARCHAR(45) NULL,
  `titulacion nautica` VARCHAR(45) NULL,
  PRIMARY KEY (`idmiembros`))



-- -----------------------------------------------------
-- Table `colegio`.`Regatas a Celebrar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colegio`.`Regatas a Celebrar` (
  `idRegatas a Celebrar` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `club` VARCHAR(45) NULL,
  `categoria` VARCHAR(45) NULL,
  `fechas` DATE NULL,
  `miembros_idmiembros` INT NOT NULL,
  PRIMARY KEY (`idRegatas a Celebrar`),
  CONSTRAINT `fk_Regatas a Celebrar_miembros1`
    FOREIGN KEY (`miembros_idmiembros`)
    REFERENCES `colegio`.`miembros` (`idmiembros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table `colegio`.`Plazas Para Regatas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colegio`.`Plazas Para Regatas` (
  `idPlazas Para Regatas` INT NOT NULL AUTO_INCREMENT,
  `Plazas Para Regatascol` INT NULL,
  `Barcos_idBarcos` INT NOT NULL,
  `Regatas a Celebrar_idRegatas a Celebrar` INT NOT NULL,
  PRIMARY KEY (`idPlazas Para Regatas`),
  CONSTRAINT `fk_Plazas Para Regatas_Barcos1`
    FOREIGN KEY (`Barcos_idBarcos`)
    REFERENCES `colegio`.`Barcos` (`idBarcos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plazas Para Regatas_Regatas a Celebrar1`
    FOREIGN KEY (`Regatas a Celebrar_idRegatas a Celebrar`)
    REFERENCES `colegio`.`Regatas a Celebrar` (`idRegatas a Celebrar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table `colegio`.`Residentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colegio`.`Residentes` (
  `idResidentes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `dni` INT NOT NULL,
  `direccion` VARCHAR(45) NULL,
  `centro` VARCHAR(45) NULL,
  `categoria` VARCHAR(1) NOT NULL COMMENT '0=pregraduado\n1=posgraduado\n2=doctorando',
  `cuenta bancaria` INT NOT NULL,
  PRIMARY KEY (`idResidentes`))



-- -----------------------------------------------------
-- Table `colegio`.`habitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colegio`.`habitaciones` (
  `idhabitaciones` INT NOT NULL AUTO_INCREMENT,
  `numero de habitacion` INT NOT NULL,
  `compartida` INT NULL,
  `cantidad de camas` INT NULL,
  `responsable` VARCHAR(45) NULL,
  PRIMARY KEY (`idhabitaciones`))



-- -----------------------------------------------------
-- Table `colegio`.`residentes-habitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colegio`.`residentes-habitaciones` (
  `idresidentes-habitaciones` INT NOT NULL AUTO_INCREMENT,
  `Residentes_idResidentes` INT NOT NULL,
  `habitaciones_idhabitaciones` INT NOT NULL,
  PRIMARY KEY (`idresidentes-habitaciones`),
  CONSTRAINT `fk_residentes-habitaciones_Residentes1`
    FOREIGN KEY (`Residentes_idResidentes`)
    REFERENCES `colegio`.`Residentes` (`idResidentes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_residentes-habitaciones_habitaciones1`
    FOREIGN KEY (`habitaciones_idhabitaciones`)
    REFERENCES `colegio`.`habitaciones` (`idhabitaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table `colegio`.`equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colegio`.`equipos` (
  `idequipos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `cantidad de miembros` INT NULL,
  `` VARCHAR(45) GENERATED ALWAYS AS () VIRTUAL,
  `Residentes_idResidentes` INT NOT NULL,
  PRIMARY KEY (`idequipos`),
  CONSTRAINT `fk_equipos_Residentes1`
    FOREIGN KEY (`Residentes_idResidentes`)
    REFERENCES `colegio`.`Residentes` (`idResidentes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table `colegio`.`actividades grupales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colegio`.`actividades grupales` (
  `idactividades grupales` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(100) NULL,
  PRIMARY KEY (`idactividades grupales`))



-- -----------------------------------------------------
-- Table `colegio`.`actividades equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colegio`.`actividades equipos` (
  `idactividades equipos` INT NOT NULL AUTO_INCREMENT,
  `actividades grupales_idactividades grupales` INT NOT NULL,
  `equipos_idequipos` INT NOT NULL,
  PRIMARY KEY (`idactividades equipos`),
  CONSTRAINT `fk_actividades equipos_actividades grupales1`
    FOREIGN KEY (`actividades grupales_idactividades grupales`)
    REFERENCES `colegio`.`actividades grupales` (`idactividades grupales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actividades equipos_equipos1`
    FOREIGN KEY (`equipos_idequipos`)
    REFERENCES `colegio`.`equipos` (`idequipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table `colegio`.`actividades individuales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colegio`.`actividades individuales` (
  `idactividades individuales` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(100) NULL,
  PRIMARY KEY (`idactividades individuales`))



-- -----------------------------------------------------
-- Table `colegio`.`actividades residentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colegio`.`actividades residentes` (
  `idactividades residentes` INT NOT NULL,
  `actividades individuales_idactividades individuales` INT NOT NULL,
  `Residentes_idResidentes` INT NOT NULL,
  PRIMARY KEY (`idactividades residentes`),
  CONSTRAINT `fk_actividades residentes_actividades individuales1`
    FOREIGN KEY (`actividades individuales_idactividades individuales`)
    REFERENCES `colegio`.`actividades individuales` (`idactividades individuales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actividades residentes_Residentes1`
    FOREIGN KEY (`Residentes_idResidentes`)
    REFERENCES `colegio`.`Residentes` (`idResidentes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;