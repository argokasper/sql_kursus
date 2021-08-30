-- MySQL Script generated by MySQL Workbench
-- Fri Aug 20 15:11:29 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `school` ;

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `school` DEFAULT CHARACTER SET utf8 ;
USE `school` ;

-- -----------------------------------------------------
-- Table `school`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`course` ;

CREATE TABLE IF NOT EXISTS `school`.`course` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` CHAR(6) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NOW(),
  `updated_at` TIMESTAMP NULL DEFAULT NOW(),
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`course_subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`course_subject` ;

CREATE TABLE IF NOT EXISTS `school`.`course_subject` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `course_id` INT NOT NULL,
  `subject_id` INT NOT NULL,
  INDEX `fk_course_has_subject_subject1_idx` (`subject_id` ASC) VISIBLE,
  INDEX `fk_course_has_subject_course1_idx` (`course_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_course_has_subject_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `school`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_has_subject_subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `school`.`subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`homework`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`homework` ;

CREATE TABLE IF NOT EXISTS `school`.`homework` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  `mark` TINYINT(1) NULL,
  `status_id` VARCHAR(20) NOT NULL DEFAULT 'draft',
  `uploaded_by` INT NOT NULL,
  `uploaded_at` TIMESTAMP NOT NULL DEFAULT NOW(),
  `task_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NOW(),
  `updated_at` TIMESTAMP NULL DEFAULT NOW(),
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_homework_uploaded_by_idx` (`uploaded_by` ASC) VISIBLE,
  INDEX `fk_homework_status_id_idx` (`status_id` ASC) VISIBLE,
  INDEX `fk_homework_task_id_idx` (`task_id` ASC) VISIBLE,
  CONSTRAINT `fk_homework_uploaded_by`
    FOREIGN KEY (`uploaded_by`)
    REFERENCES `school`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_homework_status_id`
    FOREIGN KEY (`status_id`)
    REFERENCES `school`.`homework_status` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_homework_task_id`
    FOREIGN KEY (`task_id`)
    REFERENCES `school`.`task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`homework_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`homework_status` ;

CREATE TABLE IF NOT EXISTS `school`.`homework_status` (
  `name` VARCHAR(20) NOT NULL,
  `description` VARCHAR(100) NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`material` ;

CREATE TABLE IF NOT EXISTS `school`.`material` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  `course_id` INT NULL,
  `subject_id` INT NULL,
  `uploaded_by` INT NOT NULL,
  `uploaded_at` TIMESTAMP NULL DEFAULT NOW(),
  `created_at` TIMESTAMP NULL DEFAULT NOW(),
  `updated_at` TIMESTAMP NULL DEFAULT NOW(),
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_material_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_material_subject1_idx` (`subject_id` ASC) VISIBLE,
  INDEX `fk_material_uploaded_by_idx` (`uploaded_by` ASC) VISIBLE,
  CONSTRAINT `fk_material_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `school`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_material_subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `school`.`subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_material_uploaded_by`
    FOREIGN KEY (`uploaded_by`)
    REFERENCES `school`.`teacher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`student` ;

CREATE TABLE IF NOT EXISTS `school`.`student` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` SMALLINT(4) NOT NULL,
  `user_id` INT NOT NULL,
  `registration_date` DATE NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NOW(),
  `updated_at` TIMESTAMP NULL DEFAULT NOW(),
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_student_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `school`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`student_course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`student_course` ;

CREATE TABLE IF NOT EXISTS `school`.`student_course` (
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `course_id`),
  INDEX `fk_student_has_course_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_student_has_course_student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_course_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `school`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_course_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `school`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`student_subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`student_subject` ;

CREATE TABLE IF NOT EXISTS `school`.`student_subject` (
  `student_id` INT NOT NULL,
  `subject_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `subject_id`),
  INDEX `fk_student_has_subject_subject1_idx` (`subject_id` ASC) VISIBLE,
  INDEX `fk_student_has_subject_student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_subject_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `school`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_subject_subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `school`.`subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`subject` ;

CREATE TABLE IF NOT EXISTS `school`.`subject` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` CHAR(10) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NOW(),
  `updated_at` TIMESTAMP NULL DEFAULT NOW(),
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`task` ;

CREATE TABLE IF NOT EXISTS `school`.`task` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `course_subject_id` INT NOT NULL,
  `created_by` INT NOT NULL,
  `published_at` TIMESTAMP NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NOW(),
  `updated_at` TIMESTAMP NULL DEFAULT NOW(),
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_task_created_by_idx` (`created_by` ASC) VISIBLE,
  INDEX `fk_task_course_subject_id_idx` (`course_subject_id` ASC) VISIBLE,
  CONSTRAINT `fk_task_course_subject_id`
    FOREIGN KEY (`course_subject_id`)
    REFERENCES `school`.`course_subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_created_by`
    FOREIGN KEY (`created_by`)
    REFERENCES `school`.`teacher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`teacher` ;

CREATE TABLE IF NOT EXISTS `school`.`teacher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NOW(),
  `updated_at` TIMESTAMP NULL DEFAULT NOW(),
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_teacher_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_teacher_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `school`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`teacher_course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`teacher_course` ;

CREATE TABLE IF NOT EXISTS `school`.`teacher_course` (
  `teacher_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`teacher_id`, `course_id`),
  INDEX `fk_teacher_has_course_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_teacher_has_course_teacher1_idx` (`teacher_id` ASC) VISIBLE,
  CONSTRAINT `fk_teacher_has_course_teacher1`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `school`.`teacher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_has_course_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `school`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`user` ;

CREATE TABLE IF NOT EXISTS `school`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(100) NOT NULL,
  `date_of_birth` DATE NULL,
  `password` VARCHAR(32) NULL,
  `last_login` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL DEFAULT NOW(),
  `updated_at` TIMESTAMP NULL DEFAULT NOW(),
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
