######################NEW############################################################

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema websondatabase
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `websondatabase` ;

-- -----------------------------------------------------
-- Schema websondatabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `websondatabase` DEFAULT CHARACTER SET utf8 ;
USE `websondatabase` ;

-- -----------------------------------------------------
-- Table `websondatabase`.`interviewer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `websondatabase`.`interviewer` ;

CREATE TABLE IF NOT EXISTS `websondatabase`.`interviewer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `age` INT(3) NOT NULL,
  `cep` INT(8) NOT NULL,
  `skinColor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `websondatabase`.`test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `websondatabase`.`test` ;

CREATE TABLE IF NOT EXISTS `websondatabase`.`test` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `websondatabase`.`question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `websondatabase`.`question` ;

CREATE TABLE IF NOT EXISTS `websondatabase`.`question` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `type` ENUM('') NOT NULL,
  `test_id` INT NOT NULL,
  PRIMARY KEY (`id`, `test_id`),
  INDEX `fk_question_test_idx` (`test_id` ASC),
  CONSTRAINT `fk_question_test`
    FOREIGN KEY (`test_id`)
    REFERENCES `websondatabase`.`test` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `websondatabase`.`answer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `websondatabase`.`answer` ;

CREATE TABLE IF NOT EXISTS `websondatabase`.`answer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `value` DOUBLE NOT NULL,
  `interviewer_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  `question_test_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_answer_interviewer1_idx` (`interviewer_id` ASC),
  INDEX `fk_answer_question1_idx` (`question_id` ASC, `question_test_id` ASC),
  CONSTRAINT `fk_answer_interviewer1`
    FOREIGN KEY (`interviewer_id`)
    REFERENCES `websondatabase`.`interviewer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_question1`
    FOREIGN KEY (`question_id` , `question_test_id`)
    REFERENCES `websondatabase`.`question` (`id` , `test_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `websondatabase`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `websondatabase`.`user` ;

CREATE TABLE IF NOT EXISTS `websondatabase`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `type` INT UNSIGNED NULL DEFAULT NULL,
  `version` INT NOT NULL DEFAULT 0,
  `UUID` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `websondatabase`.`images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `websondatabase`.`images` ;

CREATE TABLE IF NOT EXISTS `websondatabase`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `base64` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `websondatabase`.`rel_img_question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `websondatabase`.`rel_img_question` ;

CREATE TABLE IF NOT EXISTS `websondatabase`.`rel_img_question` (
  `images_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  PRIMARY KEY (`images_id`, `question_id`),
  INDEX `fk_images_has_question_question1_idx` (`question_id` ASC),
  INDEX `fk_images_has_question_images1_idx` (`images_id` ASC),
  CONSTRAINT `fk_images_has_question_images1`
    FOREIGN KEY (`images_id`)
    REFERENCES `websondatabase`.`images` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_images_has_question_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `websondatabase`.`question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
