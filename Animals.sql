-- В подключенном MySQL репозитории создать базу данных “Друзья человека”
CREATE SCHEMA `human_friends` DEFAULT CHARACTER SET utf8mb4;
--  Создать таблицы с иерархией из диаграммы в БД 
CREATE TABLE `human_friends`.`animals` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `isMail` TINYINT NULL,
  `food` VARCHAR(45) NULL,
  `birth` DATE NULL,
  `animal_type` TINYINT NULL,
  PRIMARY KEY (`id`));
  
CREATE TABLE `human_friends`.`animal_types` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
  
INSERT INTO `human_friends`.`animal_types` (`id`, `type`) VALUES ('1', 'Cat');
INSERT INTO `human_friends`.`animal_types` (`id`, `type`) VALUES ('2', 'Dog');
INSERT INTO `human_friends`.`animal_types` (`id`, `type`) VALUES ('3', 'Humster');
INSERT INTO `human_friends`.`animal_types` (`id`, `type`) VALUES ('4', 'Horse');
INSERT INTO `human_friends`.`animal_types` (`id`, `type`) VALUES ('5', 'Donkey');
INSERT INTO `human_friends`.`animal_types` (`id`, `type`) VALUES ('6', 'Camel');

CREATE TABLE `human_friends`.`pets` (
  `animal_id` INT NOT NULL,
  `alias` VARCHAR(45) NULL,
  `owner` VARCHAR(45) NULL,
  PRIMARY KEY (`animal_id`),
  CONSTRAINT `fk_pets_1`
    FOREIGN KEY (`animal_id`)
    REFERENCES `human_friends`.`animals` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE TABLE `human_friends`.`packs` (
  `animal_id` INT NOT NULL,
  `farm` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`animal_id`),
  CONSTRAINT `fk_packs_1`
    FOREIGN KEY (`animal_id`)
    REFERENCES `human_friends`.`animals` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
CREATE TABLE `human_friends`.`comands_list` (
  `id` INT NOT NULL,
  `comand` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

INSERT INTO `human_friends`.`comands_list` (`id`, `comand`) VALUES ('1', 'Голос');
INSERT INTO `human_friends`.`comands_list` (`id`, `comand`) VALUES ('2', 'Сидеть');
INSERT INTO `human_friends`.`comands_list` (`id`, `comand`) VALUES ('3', 'Домой');
INSERT INTO `human_friends`.`comands_list` (`id`, `comand`) VALUES ('4', 'Лежать');
INSERT INTO `human_friends`.`comands_list` (`id`, `comand`) VALUES ('5', 'Еда');
INSERT INTO `human_friends`.`comands_list` (`id`, `comand`) VALUES ('6', 'Охотиться');
INSERT INTO `human_friends`.`comands_list` (`id`, `comand`) VALUES ('7', 'Прятаться');
INSERT INTO `human_friends`.`comands_list` (`id`, `comand`) VALUES ('8', 'Следовать');
INSERT INTO `human_friends`.`comands_list` (`id`, `comand`) VALUES ('9', 'Исследовать');


CREATE TABLE `human_friends`.`animal_comands` (
  `animal_id` INT NOT NULL,
  `comand_id` INT NOT NULL,
  INDEX `fk_comand_id_idx` (`comand_id` ASC) VISIBLE,
  CONSTRAINT `fk_animal_id`
    FOREIGN KEY (`animal_id`)
    REFERENCES `human_friends`.`animals` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comand_id`
    FOREIGN KEY (`comand_id`)
    REFERENCES `human_friends`.`comands_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Заполнить низкоуровневые таблицы именами(животных), командами которые они выполняют и датами рождения

INSERT INTO `human_friends`.`animals` (`isMail`, `birth`, `animal_type`) VALUES ('1', '1.1.2000', '1');
INSERT INTO `human_friends`.`pets` (`animal_id`, `alias`, `owner`) VALUES ('1', 'Рыжик', 'Иван');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('1', '1');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('1', '4');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('1', '6');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('1', '3');

INSERT INTO `human_friends`.`animals` (`isMail`, `birth`, `animal_type`) VALUES ('1', '2.1.2000', '1');
INSERT INTO `human_friends`.`pets` (`animal_id`, `alias`, `owner`) VALUES ('2', 'Васька', 'Иван');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('2', '1');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('2', '4');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('2', '6');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('2', '3');

INSERT INTO `human_friends`.`animals` (`isMail`, `birth`, `animal_type`) VALUES ('1', '1.1.2000', '1');
INSERT INTO `human_friends`.`pets` (`animal_id`, `alias`, `owner`) VALUES ('1', 'Рыжик', 'Иван');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('1', '1');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('1', '4');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('1', '6');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('1', '3');

INSERT INTO `human_friends`.`animals` (`isMail`, `birth`, `animal_type`) VALUES ('1', '1.3.2000', '5');
INSERT INTO `human_friends`.`packs` (`animal_id`, `farm`, `status`) VALUES ('3', 'farm 1', 'Рабочая лошадка');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('3', '1');

INSERT INTO `human_friends`.`animals` (`isMail`, `birth`, `animal_type`) VALUES ('1', '2020-01-03', '5');
INSERT INTO `human_friends`.`packs` (`animal_id`, `farm`, `status`) VALUES ('7', 'farm 1', 'Жеребенок');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('7', '1');

INSERT INTO `human_friends`.`animals` (`isMail`, `birth`, `animal_type`) VALUES ('1', '2020-01-03', '5');
INSERT INTO `human_friends`.`packs` (`animal_id`, `farm`, `status`) VALUES ('9', 'farm 1', 'Жеребенок');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('9', '1');

INSERT INTO `human_friends`.`animals` (`isMail`, `birth`, `animal_type`) VALUES ('1', '1.3.2000', '6');
INSERT INTO `human_friends`.`packs` (`animal_id`, `farm`, `status`) VALUES ('10', 'farm 1', 'Рабочая лошадка');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('10', '1');

INSERT INTO `human_friends`.`animals` (`isMail`, `birth`, `animal_type`) VALUES ('1', '2020-01-03', '6');
INSERT INTO `human_friends`.`packs` (`animal_id`, `farm`, `status`) VALUES ('11', 'farm 1', 'Жеребенок');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('11', '1');

INSERT INTO `human_friends`.`animals` (`isMail`, `birth`, `animal_type`) VALUES ('1', '2020-01-03', '6');
INSERT INTO `human_friends`.`packs` (`animal_id`, `farm`, `status`) VALUES ('12', 'farm 1', 'Жеребенок');
INSERT INTO `human_friends`.`animal_comands` (`animal_id`, `comand_id`) VALUES ('12', '1');


-- Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.
DELETE FROM `human_friends`.`animals` WHERE `animal_type` = 6;
CREATE TABLE `human_friends`.`horsers_and_donkeys` AS
SELECT * FROM `human_friends`.`animals` WHERE `animal_type` = 5
UNION
SELECT * FROM `human_friends`.`animals` WHERE `animal_type` = 6;