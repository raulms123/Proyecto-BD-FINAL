-- -----------------------------------------------------
-- MySQL Script corregido para compatibilidad
-- -----------------------------------------------------
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Titulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Titulo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Titulo` (
  `NombreTitutlo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NombreTitutlo`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Division`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Division` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Division` (
  `idDivision` INT NOT NULL,
  `NombreDivision` VARCHAR(45) NULL,
  `LImiteInferiorPeso` INT NULL,
  `LimiteSuperiorPeso` INT NULL,
  PRIMARY KEY (`idDivision`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Entrenador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Entrenador` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Entrenador` (
  `NombreEntrenador` VARCHAR(45) NOT NULL,
  `Academia` VARCHAR(45) NULL,
  `Especialidad` VARCHAR(45) NULL,
  PRIMARY KEY (`NombreEntrenador`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Luchador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Luchador` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Luchador` (
  `idLuchador` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Pais` VARCHAR(45) NULL,
  `Peso` INT NULL,
  `Altura` INT NULL,
  `Record` INT NULL,
  `Equipo` VARCHAR(45) NULL,
  `Titulo_NombreTitutlo` VARCHAR(45) NOT NULL,
  `Division_idDivision` INT NOT NULL,
  `Entrenador_NombreEntrenador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLuchador`),
  INDEX `fk_Luchador_Titulo1_idx` (`Titulo_NombreTitutlo` ASC),
  INDEX `fk_Luchador_Division1_idx` (`Division_idDivision` ASC),
  INDEX `fk_Luchador_Entrenador1_idx` (`Entrenador_NombreEntrenador` ASC),
  CONSTRAINT `fk_Luchador_Titulo1`
    FOREIGN KEY (`Titulo_NombreTitutlo`)
    REFERENCES `mydb`.`Titulo` (`NombreTitutlo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Luchador_Division1`
    FOREIGN KEY (`Division_idDivision`)
    REFERENCES `mydb`.`Division` (`idDivision`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Luchador_Entrenador1`
    FOREIGN KEY (`Entrenador_NombreEntrenador`)
    REFERENCES `mydb`.`Entrenador` (`NombreEntrenador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Arbitro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Arbitro` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Arbitro` (
  `idArbitro` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Pais` VARCHAR(45) NULL,
  PRIMARY KEY (`idArbitro`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Ronda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Ronda` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Ronda` (
  `NumeroRonda` INT NOT NULL,
  `Duracion` INT NULL,
  `Ganador` VARCHAR(45) NULL,
  PRIMARY KEY (`NumeroRonda`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Evento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Evento` (
  `idEvento` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Ubicacion` VARCHAR(45) NULL,
  `Asistencias` INT NULL,
  PRIMARY KEY (`idEvento`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Combate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Combate` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Combate` (
  `idCombate` INT NOT NULL,
  `Resultado` INT NULL,
  `MetodoFinalizacion` VARCHAR(45) NULL,
  `Duracion` INT NULL,
  `Arbitro_idArbitro` INT NOT NULL,
  `Ronda_NumeroRonda` INT NOT NULL,
  `Evento_idEvento` INT NOT NULL,
  `Luchador_idLuchador_rojo` INT NOT NULL,
  `Luchador_idLuchador_azul` INT NOT NULL,
  PRIMARY KEY (`idCombate`),
  INDEX `fk_Combate_Arbitro1_idx` (`Arbitro_idArbitro` ASC),
  INDEX `fk_Combate_Ronda1_idx` (`Ronda_NumeroRonda` ASC),
  INDEX `fk_Combate_Evento1_idx` (`Evento_idEvento` ASC),
  INDEX `fk_Combate_Luchador1_idx` (`Luchador_idLuchador_rojo` ASC),
  INDEX `fk_Combate_Luchador2_idx` (`Luchador_idLuchador_azul` ASC),
  CONSTRAINT `fk_Combate_Arbitro1`
    FOREIGN KEY (`Arbitro_idArbitro`)
    REFERENCES `mydb`.`Arbitro` (`idArbitro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Combate_Ronda1`
    FOREIGN KEY (`Ronda_NumeroRonda`)
    REFERENCES `mydb`.`Ronda` (`NumeroRonda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Combate_Evento1`
    FOREIGN KEY (`Evento_idEvento`)
    REFERENCES `mydb`.`Evento` (`idEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Combate_Luchador1`
    FOREIGN KEY (`Luchador_idLuchador_rojo`)
    REFERENCES `mydb`.`Luchador` (`idLuchador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Combate_Luchador2`
    FOREIGN KEY (`Luchador_idLuchador_azul`)
    REFERENCES `mydb`.`Luchador` (`idLuchador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
