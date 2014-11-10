-- MySQL Script generated by MySQL Workbench
-- 11/03/14 15:56:39
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ripsils
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ripsils
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ripsils` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ripsils` ;

-- -----------------------------------------------------
-- Table `ripsils`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ripsils`.`users` ;

CREATE TABLE IF NOT EXISTS `ripsils`.`users` (
  `ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_date` INT(11) UNSIGNED NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ripsils`.`challenges`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ripsils`.`challenges` ;

CREATE TABLE IF NOT EXISTS `ripsils`.`challenges` (
  `ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_date` INT(11) UNSIGNED NOT NULL,
  `active` TINYINT(1) UNSIGNED NOT NULL,
  `expiration_date` INT(11) UNSIGNED NULL,
  `challenger_user_ID` INT(11) UNSIGNED NOT NULL,
  `challenger_move` TINYINT(1) UNSIGNED NOT NULL,
  `challenged_user_ID` INT(11) UNSIGNED NOT NULL,
  `challenged_move` TINYINT(1) UNSIGNED NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_challenges_users_idx` (`challenger_user_ID` ASC),
  INDEX `fk_challenges_users1_idx` (`challenged_user_ID` ASC),
  CONSTRAINT `fk_challenges_users`
    FOREIGN KEY (`challenger_user_ID`)
    REFERENCES `ripsils`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_challenges_users1`
    FOREIGN KEY (`challenged_user_ID`)
    REFERENCES `ripsils`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ripsils`.`games`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ripsils`.`games` ;

CREATE TABLE IF NOT EXISTS `ripsils`.`games` (
  `ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `challenger_user_ID` INT(11) UNSIGNED NOT NULL,
  `challenged_user_ID` INT(11) UNSIGNED NOT NULL,
  `winner_user_ID` INT(11) UNSIGNED NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_games_users1_idx` (`challenger_user_ID` ASC),
  INDEX `fk_games_users2_idx` (`challenged_user_ID` ASC),
  INDEX `fk_games_users3_idx` (`winner_user_ID` ASC),
  CONSTRAINT `fk_games_users1`
    FOREIGN KEY (`challenger_user_ID`)
    REFERENCES `ripsils`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_users2`
    FOREIGN KEY (`challenged_user_ID`)
    REFERENCES `ripsils`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_users3`
    FOREIGN KEY (`winner_user_ID`)
    REFERENCES `ripsils`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ripsils`.`moves`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ripsils`.`moves` ;

CREATE TABLE IF NOT EXISTS `ripsils`.`moves` (
  `ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `datetime` INT(11) UNSIGNED NOT NULL,
  `move` TINYINT(1) UNSIGNED NOT NULL,
  `user_ID` INT(11) UNSIGNED NOT NULL,
  `game_ID` INT(11) UNSIGNED NOT NULL,
  `turn` SMALLINT(2) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_moves_users1_idx` (`user_ID` ASC),
  INDEX `fk_moves_games1_idx` (`game_ID` ASC),
  CONSTRAINT `fk_moves_users1`
    FOREIGN KEY (`user_ID`)
    REFERENCES `ripsils`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_moves_games1`
    FOREIGN KEY (`game_ID`)
    REFERENCES `ripsils`.`games` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `ripsils`.`users` (`ID`, `create_date`, `username`, `password`) VALUES ('1', '123456789', 'Bob', '$2y$10$askTJQK09uKFFgSUKOJ9QO/1MSunJIhmnx3RDeQkTA9bW3.JXaCka');
INSERT INTO `ripsils`.`users` (`ID`, `create_date`, `username`, `password`) VALUES ('2', '123456789', 'Jan', '$2y$10$askTJQK09uKFFgSUKOJ9QO/1MSunJIhmnx3RDeQkTA9bW3.JXaCka');
INSERT INTO `ripsils`.`users` (`ID`, `create_date`, `username`, `password`) VALUES ('3', '123456789', 'Pieter', '$2y$10$askTJQK09uKFFgSUKOJ9QO/1MSunJIhmnx3RDeQkTA9bW3.JXaCka');
INSERT INTO `ripsils`.`users` (`ID`, `create_date`, `username`, `password`) VALUES ('4', '123456789', '12345', '$2y$10$askTJQK09uKFFgSUKOJ9QO/1MSunJIhmnx3RDeQkTA9bW3.JXaCka');