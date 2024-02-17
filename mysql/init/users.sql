CREATE TABLE `db1`.`users` (
    `id` INT NOT NULL AUTO_INCREMENT ,
    `user` VARCHAR(25) NOT NULL ,
    `password` CHAR(255) NOT NULL ,
    `reg_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    PRIMARY KEY (`id`), UNIQUE (`user`)
) ENGINE = InnoDB;

