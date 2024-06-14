-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tech_blog_web
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tech_blog_web
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tech_blog_web
-- -----------------------------------------------------
# drop schema tech_blog_web;
CREATE SCHEMA IF NOT EXISTS `tech_blog_web` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `tech_blog_web` ;

-- -----------------------------------------------------
-- Table `tech_blog_web`.`blog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tech_blog_web`.`blog` (
  `blog_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `url` VARCHAR(200) NOT NULL,
  `provider` VARCHAR(45) NULL DEFAULT NULL,
  `register_time` DATETIME NOT NULL DEFAULT NOW(),
  `update_time` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  `category` VARCHAR(100) NULL DEFAULT NULL,
  `read_count` INT NULL DEFAULT 0,
  `like_count` INT NULL DEFAULT 0,
  `gpt_summary` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`blog_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tech_blog_web`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tech_blog_web`.`member` (
  `member_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `member_level` VARCHAR(45) NULL DEFAULT 'MEMBER',
  `register_time` DATETIME NOT NULL DEFAULT NOW(),
  `update_time` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  `nickname` VARCHAR(45) NULL DEFAULT NULL,
  `provider` VARCHAR(45) NULL DEFAULT NULL,
  `gender` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE INDEX `member_id_UNIQUE` (`member_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `tech_blog_web`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tech_blog_web`.`board` (
  `board_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `member_id` INT NOT NULL,
  `content` VARCHAR(45) NOT NULL,
  `like_count` INT NULL DEFAULT 0,
  `read_count` INT NULL DEFAULT 0,
  `register_time` DATETIME NOT NULL DEFAULT NOW(),
  `update_time` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  `type` INT NULL DEFAULT NULL,
  PRIMARY KEY (`board_id`),
  INDEX `fk_Board_Member_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_Board_Member`
    FOREIGN KEY (`member_id`)
    REFERENCES `tech_blog_web`.`member` (`member_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tech_blog_web`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tech_blog_web`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(45) NOT NULL,
  `board_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  `register_time` DATETIME NOT NULL DEFAULT NOW(),
  `update_time` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  `depth` VARCHAR(45) NULL DEFAULT NULL,
  `mother_comment_id` INT NULL DEFAULT NULL,
  `comment_seq` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Comment_Board1_idx` (`board_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comment_Board1`
    FOREIGN KEY (`board_id`)
    REFERENCES `tech_blog_web`.`board` (`board_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comment_Member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `tech_blog_web`.`member` (`member_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tech_blog_web`.`favorite_blog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tech_blog_web`.`favorite_blog` (
  `favorite_blog_id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NOT NULL,
  `blog_id` INT NOT NULL,
  `register_time` DATETIME NOT NULL DEFAULT NOW(),
  `update_time` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`favorite_blog_id`),
  INDEX `fk_Favorite_Blog_blog1_idx` (`blog_id` ASC) VISIBLE,
  INDEX `fk_Favorite_Blog_Member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_Favorite_Blog_blog1`
    FOREIGN KEY (`blog_id`)
    REFERENCES `tech_blog_web`.`blog` (`blog_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Favorite_Blog_Member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `tech_blog_web`.`member` (`member_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tech_blog_web`.`favorite_blog_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tech_blog_web`.`favorite_blog_list` (
  `favorite_blog_list_id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `register_time` DATETIME NOT NULL DEFAULT NOW(),
  `update_time` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`favorite_blog_list_id`),
  UNIQUE INDEX `favorite_blog_list_UNIQUE` (`favorite_blog_list_id` ASC) VISIBLE,
  INDEX `fk_Favorite_Blog_List_Member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_Favorite_Blog_List_Member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `tech_blog_web`.`member` (`member_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tech_blog_web`.`favorite_list_to_blog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tech_blog_web`.`favorite_list_to_blog` (
  `favorite_blog_list_id` INT NOT NULL,
  `favorite_blog_id` INT NOT NULL,
  PRIMARY KEY (`favorite_blog_list_id`, `favorite_blog_id`),
  INDEX `fk_favorite_list_to_blog_Favorite_Blog1_idx` (`favorite_blog_id` ASC) VISIBLE,
  CONSTRAINT `fk_favorite_list_to_blog_Favorite_Blog1`
    FOREIGN KEY (`favorite_blog_id`)
    REFERENCES `tech_blog_web`.`favorite_blog` (`favorite_blog_id`),
  CONSTRAINT `fk_favorite_list_to_blog_Favorite_Blog_List1`
    FOREIGN KEY (`favorite_blog_list_id`)
    REFERENCES `tech_blog_web`.`favorite_blog_list` (`favorite_blog_list_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


