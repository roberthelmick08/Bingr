-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema BinjrDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `BinjrDB` ;

-- -----------------------------------------------------
-- Schema BinjrDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BinjrDB` DEFAULT CHARACTER SET utf8 ;
USE `BinjrDB` ;

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
-- Table `tv_show`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tv_show` ;

CREATE TABLE IF NOT EXISTS `tv_show` (
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
  `tv_show_id` INT NOT NULL,
  PRIMARY KEY (`id`, `tv_show_id`),
  CONSTRAINT `fk_seasons_show1`
    FOREIGN KEY (`tv_show_id`)
    REFERENCES `tv_show` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_seasons_show1_idx` ON `season` (`tv_show_id` ASC);


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
-- Table `user_tv_show`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_tv_show` ;

CREATE TABLE IF NOT EXISTS `user_tv_show` (
  `user_id` INT NOT NULL,
  `tv_show_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `tv_show_id`),
  CONSTRAINT `fk_user_has_Show_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_Show_Show1`
    FOREIGN KEY (`tv_show_id`)
    REFERENCES `tv_show` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX `fk_user_has_Show_Show1_idx` ON `user_tv_show` (`tv_show_id` ASC);

CREATE INDEX `fk_user_has_Show_user_idx` ON `user_tv_show` (`user_id` ASC);


-- -----------------------------------------------------
-- Table `user_episode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_episode` ;

CREATE TABLE IF NOT EXISTS `user_episode` (
  `watched` INT NOT NULL DEFAULT 0,
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


-- -----------------------------------------------------
-- Table `group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `group` ;

CREATE TABLE IF NOT EXISTS `group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `group_user` ;

CREATE TABLE IF NOT EXISTS `group_user` (
  `group_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`group_id`, `user_id`),
  CONSTRAINT `fk_Group_has_user_Group1`
    FOREIGN KEY (`group_id`)
    REFERENCES `group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Group_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Group_has_user_user1_idx` ON `group_user` (`user_id` ASC);

CREATE INDEX `fk_Group_has_user_Group1_idx` ON `group_user` (`group_id` ASC);


-- -----------------------------------------------------
-- Table `group_tv_show`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `group_tv_show` ;

CREATE TABLE IF NOT EXISTS `group_tv_show` (
  `group_id` INT NOT NULL,
  `tv_show_id` INT NOT NULL,
  PRIMARY KEY (`group_id`, `tv_show_id`),
  CONSTRAINT `fk_group_has_tv_show_group1`
    FOREIGN KEY (`group_id`)
    REFERENCES `group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_has_tv_show_tv_show1`
    FOREIGN KEY (`tv_show_id`)
    REFERENCES `tv_show` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_group_has_tv_show_tv_show1_idx` ON `group_tv_show` (`tv_show_id` ASC);

CREATE INDEX `fk_group_has_tv_show_group1_idx` ON `group_tv_show` (`group_id` ASC);

SET SQL_MODE = '';
GRANT USAGE ON *.* TO student;
 DROP USER student;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'student' IDENTIFIED BY 'student';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'student';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `BinjrDB`;
INSERT INTO `user` (`username`, `password`, `id`, `display_name`, `img_url`) VALUES ('Chaz', 'chaz', 1, 'Chaaaz', DEFAULT);
INSERT INTO `user` (`username`, `password`, `id`, `display_name`, `img_url`) VALUES ('Nik', 'nik', 2, 'Nikolaus', DEFAULT);
INSERT INTO `user` (`username`, `password`, `id`, `display_name`, `img_url`) VALUES ('Robert', 'robert', 3, 'Rupert', DEFAULT);
INSERT INTO `user` (`username`, `password`, `id`, `display_name`, `img_url`) VALUES ('JoshZ', 'joshz', 4, 'JayDizzle', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tv_show`
-- -----------------------------------------------------
START TRANSACTION;
USE `BinjrDB`;
INSERT INTO `tv_show` (`id`, `title`, `description`, `img_url`) VALUES (1, 'Game of Swords', 'People killing eachother', NULL);
INSERT INTO `tv_show` (`id`, `title`, `description`, `img_url`) VALUES (2, 'Stranger Thrones', 'Throne Improvement Show', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `season`
-- -----------------------------------------------------
START TRANSACTION;
USE `BinjrDB`;
INSERT INTO `season` (`id`, `Description`, `title`, `img_url`, `season_number`, `tv_show_id`) VALUES (1, 'Season 1 of Stranger Thrones', 'Season 1', NULL, 1, 2);
INSERT INTO `season` (`id`, `Description`, `title`, `img_url`, `season_number`, `tv_show_id`) VALUES (2, 'Season 2 of Stranger Thrones', 'Season 2', NULL, 2, 2);
INSERT INTO `season` (`id`, `Description`, `title`, `img_url`, `season_number`, `tv_show_id`) VALUES (3, 'Season 1 of Game of Swords', 'Season 1', NULL, 1, 1);
INSERT INTO `season` (`id`, `Description`, `title`, `img_url`, `season_number`, `tv_show_id`) VALUES (4, 'Season 2 of Game of Swords', 'Season2', NULL, 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `episode`
-- -----------------------------------------------------
START TRANSACTION;
USE `BinjrDB`;
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 1 GOS', 'Episode 1', NULL, 1, 3);
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 2 GOS', 'Episode 2', NULL, 2, 3);
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 1 GOS', 'Episode 1', NULL, 1, 4);
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 2 GOS', 'Episode 2', NULL, 2, 4);
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 1 ST', 'Episode 1', NULL, 1, 1);
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 2 ST', 'Episode 2', NULL, 2, 1);
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 1 ST', 'Episode 1', NULL, 1, 2);
INSERT INTO `episode` (`id`, `title`, `description`, `img_url`, `episode_number`, `season_id`) VALUES (DEFAULT, 'Ep 2ST', 'Episode 2', NULL, 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_tv_show`
-- -----------------------------------------------------
START TRANSACTION;
USE `BinjrDB`;
INSERT INTO `user_tv_show` (`user_id`, `tv_show_id`) VALUES (1, 1);
INSERT INTO `user_tv_show` (`user_id`, `tv_show_id`) VALUES (1, 2);
INSERT INTO `user_tv_show` (`user_id`, `tv_show_id`) VALUES (2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_episode`
-- -----------------------------------------------------
START TRANSACTION;
USE `BinjrDB`;
INSERT INTO `user_episode` (`watched`, `user_id`, `episode_id`, `id`) VALUES (1, 1, 1, DEFAULT);
INSERT INTO `user_episode` (`watched`, `user_id`, `episode_id`, `id`) VALUES (1, 1, 3, DEFAULT);
INSERT INTO `user_episode` (`watched`, `user_id`, `episode_id`, `id`) VALUES (1, 2, 3, DEFAULT);
INSERT INTO `user_episode` (`watched`, `user_id`, `episode_id`, `id`) VALUES (0, 2, 1, DEFAULT);
INSERT INTO `user_episode` (`watched`, `user_id`, `episode_id`, `id`) VALUES (1, 2, 2, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `group`
-- -----------------------------------------------------
START TRANSACTION;
USE `BinjrDB`;
INSERT INTO `group` (`id`, `name`) VALUES (1, 'First Group');

COMMIT;


-- -----------------------------------------------------
-- Data for table `group_user`
-- -----------------------------------------------------
START TRANSACTION;
USE `BinjrDB`;
INSERT INTO `group_user` (`group_id`, `user_id`) VALUES (1, 1);
INSERT INTO `group_user` (`group_id`, `user_id`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `group_tv_show`
-- -----------------------------------------------------
START TRANSACTION;
USE `BinjrDB`;
INSERT INTO `group_tv_show` (`group_id`, `tv_show_id`) VALUES (1, 2);
INSERT INTO `group_tv_show` (`group_id`, `tv_show_id`) VALUES (1, 1);

COMMIT;

