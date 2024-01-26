CREATE TABLE `ft_dominos` (
    `id` int(11) NOT NULL,
    `items` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

ALTER TABLE `ft_dominos`
  ADD PRIMARY KEY (`id`);
  

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_dominos', 'dominos', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_dominos', 'dominos', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_dominos', 'dominos', 1)
;


INSERT INTO `jobs` (name, label) VALUES
	('dominos','Dominos')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('dominos',0,'recruit','Cook',10,'{}','{}'),
	('dominos',1,'novice','Shopkeeper',25,'{}','{}'),
	('dominos',2,'experienced','Manager',40,'{}','{}'),
	('dominos',3,'boss','Owner',0,'{}','{}')
;


