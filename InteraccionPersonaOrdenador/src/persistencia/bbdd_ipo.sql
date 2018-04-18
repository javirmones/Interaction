-- MySQL Script generated by MySQL Workbench
-- Tue Jan  9 18:16:59 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema default_schema
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bbdd_ipo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bbdd_ipo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bbdd_ipo` DEFAULT CHARACTER SET utf8 ;
USE `bbdd_ipo` ;

-- -----------------------------------------------------
-- Table `bbdd_ipo`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ipo`.`Usuarios` (
  `idUsuarios` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Apellidos` VARCHAR(45) NULL DEFAULT NULL,
  `Email` VARCHAR(60) NULL DEFAULT NULL,
  `Contraseña` VARCHAR(16) NULL DEFAULT NULL,
  `Telefono` INT NULL DEFAULT NULL,
  `RolPrincipal` VARCHAR(45) NULL DEFAULT NULL,
  `Conocientos` VARCHAR(140) NULL DEFAULT NULL,
  `imagen` VARCHAR(160) NULL DEFAULT NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ipo`.`Proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ipo`.`Proyectos` (
  `IdProyecto` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `FechaCreacion` DATE NULL DEFAULT NULL,
  `Responsable` INT NULL DEFAULT NULL,
  `Descripcion` VARCHAR(240) NULL DEFAULT NULL,
  PRIMARY KEY (`IdProyecto`),
  INDEX `fgResponsble_idx` (`Responsable` ASC),
  CONSTRAINT `fgResponsble`
    FOREIGN KEY (`Responsable`)
    REFERENCES `bbdd_ipo`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ipo`.`Tareas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ipo`.`Tareas` (
  `idTareas` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `FechaIni` DATE NULL DEFAULT NULL,
  `FechaFin` DATE NULL DEFAULT NULL,
  `Estado` VARCHAR(45) NULL DEFAULT NULL,
  `Prioridad` INT NULL DEFAULT NULL,
  `Encargado` INT NULL DEFAULT NULL,
  `Comentarios` VARCHAR(2040) NULL DEFAULT NULL,
  PRIMARY KEY (`idTareas`),
  INDEX `fgEncargado_idx` (`Encargado` ASC),
  CONSTRAINT `fgEncargado`
    FOREIGN KEY (`Encargado`)
    REFERENCES `bbdd_ipo`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ipo`.`ProyecTareaUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ipo`.`ProyecTareaUser` (
  `idProyecto` INT NOT NULL,
  `idTarea` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  UNIQUE INDEX `idProyecTareaUser_UNIQUE` (`idProyecto` ASC),
  UNIQUE INDEX `ProyecTareaUsercol_UNIQUE` (`idTarea` ASC),
  UNIQUE INDEX `ProyecTareaUsercol1_UNIQUE` (`idUsuario` ASC),
  CONSTRAINT `fgProyec`
    FOREIGN KEY (`idProyecto`)
    REFERENCES `bbdd_ipo`.`Proyectos` (`IdProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fgTarea`
    FOREIGN KEY (`idTarea`)
    REFERENCES `bbdd_ipo`.`Tareas` (`idTareas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fgUser`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `bbdd_ipo`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
