-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema BingrDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `BingrDB` ;

-- -----------------------------------------------------
-- Schema BingrDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BingrDB` DEFAULT CHARACTER SET utf8 ;
USE `BingrDB` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `username` VARCHAR(32) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `display_name` VARCHAR(45) NOT NULL,
  `img_url` VARCHAR(90) NOT NULL DEFAULT 'img/default.jpg',
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `show`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `show` ;

CREATE TABLE IF NOT EXISTS `show` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(128) NOT NULL,
  `description` VARCHAR(1000) NULL,
  `img_url` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `season`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `season` ;

CREATE TABLE IF NOT EXISTS `season` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(1000) NULL,
  `title` VARCHAR(120) NULL,
  `img_url` VARCHAR(90) NULL,
  `season_number` INT NULL,
  `show_id` INT NOT NULL,
  PRIMARY KEY (`id`, `show_id`),
  CONSTRAINT `fk_seasons_show1`
    FOREIGN KEY (`show_id`)
    REFERENCES `show` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_seasons_show1_idx` ON `season` (`show_id` ASC);


-- -----------------------------------------------------
-- Table `episode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `episode` ;

CREATE TABLE IF NOT EXISTS `episode` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(120) NULL,
  `description` VARCHAR(1000) NULL,
  `img_url` VARCHAR(90) NULL,
  `episode_number` INT NOT NULL,
  `season_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_episodes_seasons1`
    FOREIGN KEY (`season_id`)
    REFERENCES `season` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_episodes_seasons1_idx` ON `episode` (`season_id` ASC);


-- -----------------------------------------------------
-- Table `user_has_Show`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_Show` ;

CREATE TABLE IF NOT EXISTS `user_has_Show` (
  `user_id` INT NOT NULL,
  `show_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `show_id`),
  CONSTRAINT `fk_user_has_Show_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_Show_Show1`
    FOREIGN KEY (`show_id`)
    REFERENCES `show` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX `fk_user_has_Show_Show1_idx` ON `user_has_Show` (`show_id` ASC);

CREATE INDEX `fk_user_has_Show_user_idx` ON `user_has_Show` (`user_id` ASC);


-- -----------------------------------------------------
-- Table `user_episode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_episode` ;

CREATE TABLE IF NOT EXISTS `user_episode` (
  `watchewd` INT NOT NULL DEFAULT 0,
  `user_id` INT NOT NULL,
  `episode_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_episode_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_episode_episode1`
    FOREIGN KEY (`episode_id`)
    REFERENCES `episode` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_user_episode_user1_idx` ON `user_episode` (`user_id` ASC);

CREATE INDEX `fk_user_episode_episode1_idx` ON `user_episode` (`episode_id` ASC);

SET SQL_MODE = '';
GRANT USAGE ON *.* TO student;
 DROP USER student;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'student' IDENTIFIED BY 'student';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'student';

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `BingrDB`;
INSERT INTO `user` (`username`, `password`, `id`, `display_name`, `img_url`) VALUES ('Chaz', 'chaz', 1, 'Chaaaz', DEFAULT);
INSERT INTO `user` (`username`, `password`, `id`, `display_name`, `img_url`) VALUES ('Nik', 'nik', 2, 'Nikolaus', DEFAULT);
INSERT INTO `user` (`username`, `password`, `id`, `display_name`, `img_url`) VALUES ('Robert', 'robert', 3, 'Rupert', DEFAULT);
INSERT INTO `user` (`username`, `password`, `id`, `display_name`, `img_url`) VALUES ('JoshZ', 'joshz', 4, 'JayDizzle', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `show`
-- -----------------------------------------------------
START TRANSACTION;
USE `BingrDB`;
INSERT INTO `show` (`id`, `title`, `description`, `img_url`) VALUES (1, 'Game of Swords', 'People killing eachother', NULL);
INSERT INTO `show` (`id`, `title`, `description`, `img_url`) VALUES (2, 'Stranger Thrones', 'Throne Improvement Show', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `season`
-- -----------------------------------------------------
START TRANSACTION;
USE `BingrDB`;
INSERT INTO `season` (`id`, `Description`, `title`, `img_url`, `season_number`, `show_id`) VALUES (1, 'Season 1 of Stranger Thrones', 'Season 1', NULL, 1, 2);
INSERT INTO `season` (`id`, `Description`, `title`, `img_url`, `season_number`, `show_id`) VALUES (2, 'Season 2 of Stranger Thrones', 'Season 2', NULL, 2, 2);
INSERT INTO `season` (`id`, `Description`, `title`, `img_url`, `season_number`, `show_id`) VALUES (3, 'Season 1 of Game of Swords', 'Season 1', NULL, 1, 1);
INSERT INTO `season` (`id`, `Description`, `title`, `img_url`, `season_number`, `show_id`) VALUES (4, 'Season 2 of Game of Swords', 'Season2', NULL, 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `episode`
-- -----------------------------------------------------
START TRANSACTION;
USE `BingrDB`;
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 1 GOS', 'Episode 1', NULL, 1, 3);
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 2 GOS', 'Episode 2', NULL, 2, 3);
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 1 GOS', 'Episode 1', NULL, 1, 4);
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 2 GOS', 'Episode 2', NULL, 2, 4);
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 1 ST', 'Episode 1', NULL, 1, 1);
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 2 ST', 'Episode 2', NULL, 2, 1);
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 1 ST', 'Episode 1', NULL, 1, 2);
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 2ST', 'Episode 2', NULL, 2, 2);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
