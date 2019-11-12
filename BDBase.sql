DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `senha` varchar(100) NOT NULL,
  `tipo` int(6) unsigned DEFAULT NULL,
  `version` int(6) DEFAULT '0',
  `UUID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Administrador','email_do_administrador@dcc.ufla.br','22aa8a081b1b26276f2b930618fe25d8',0,4,'5cfd4172-f49c-4bfa-a1b0-3cb643d2ca63');

######################NEW############################################################

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`interviewer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`interviewer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`interviewer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `age` INT(3) NOT NULL,
  `cep` INT(8) NOT NULL,
  `skinColor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`test` ;

CREATE TABLE IF NOT EXISTS `mydb`.`test` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`question` ;

CREATE TABLE IF NOT EXISTS `mydb`.`question` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `type` ENUM('') NOT NULL,
  `test_id` INT NOT NULL,
  PRIMARY KEY (`id`, `test_id`),
  INDEX `fk_question_test_idx` (`test_id` ASC),
  CONSTRAINT `fk_question_test`
    FOREIGN KEY (`test_id`)
    REFERENCES `mydb`.`test` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`answer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`answer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`answer` (
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
    REFERENCES `mydb`.`interviewer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_question1`
    FOREIGN KEY (`question_id` , `question_test_id`)
    REFERENCES `mydb`.`question` (`id` , `test_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `type` INT UNSIGNED NULL DEFAULT NULL,
  `version` INT NOT NULL DEFAULT 0,
  `UUID` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Administrador','email_do_administrador@dcc.ufla.br','22aa8a081b1b26276f2b930618fe25d8',0,4,'5cfd4172-f49c-4bfa-a1b0-3cb643d2ca63');

-- -----------------------------------------------------
-- Table `mydb`.`images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`images` ;

CREATE TABLE IF NOT EXISTS `mydb`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `base64` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rel_img_question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`rel_img_question` ;

CREATE TABLE IF NOT EXISTS `mydb`.`rel_img_question` (
  `images_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  PRIMARY KEY (`images_id`, `question_id`),
  INDEX `fk_images_has_question_question1_idx` (`question_id` ASC),
  INDEX `fk_images_has_question_images1_idx` (`images_id` ASC),
  CONSTRAINT `fk_images_has_question_images1`
    FOREIGN KEY (`images_id`)
    REFERENCES `mydb`.`images` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_images_has_question_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `mydb`.`question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
