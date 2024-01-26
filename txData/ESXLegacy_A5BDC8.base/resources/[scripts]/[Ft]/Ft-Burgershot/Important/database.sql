CREATE TABLE `ft_burgershot` (
    `id` int(11) NOT NULL,
    `items` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

ALTER TABLE `ft_burgershot`
  ADD PRIMARY KEY (`id`);
  

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_burgershot', 'burgershot', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_burgershot', 'burgershot', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_burgershot', 'burgershot', 1)
;


INSERT INTO `jobs` (name, label) VALUES
	('burgershot','Burger Shot')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('burgershot',0,'recruit','Cook',10,'{}','{}'),
	('burgershot',1,'novice','Shopkeeper',25,'{}','{}'),
	('burgershot',2,'experienced','Manager',40,'{}','{}'),
	('burgershot',3,'boss','Owner',0,'{}','{}')
;


