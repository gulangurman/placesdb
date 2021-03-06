-- MySQL Script generated by MySQL Workbench
-- Wed Jan 13 13:36:33 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema placesdb
-- -----------------------------------------------------
-- Places DB stores popular places with appropriate categories and the cities they're in.

-- -----------------------------------------------------
-- Schema placesdb
--
-- Places DB stores popular places with appropriate categories and the cities they're in.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `placesdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `placesdb` ;

-- -----------------------------------------------------
-- Table `placesdb`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `placesdb`.`city` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placesdb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `placesdb`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placesdb`.`place`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `placesdb`.`place` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(120) NULL,
  `categoryId` INT NULL,
  `cityId` INT NULL,
  `details` LONGTEXT NULL,
  `dateCreated` DATETIME NULL DEFAULT NOW(),
  `dateModified` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_city_id`
    FOREIGN KEY (`id`)
    REFERENCES `placesdb`.`city` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_id`
    FOREIGN KEY (`id`)
    REFERENCES `placesdb`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
