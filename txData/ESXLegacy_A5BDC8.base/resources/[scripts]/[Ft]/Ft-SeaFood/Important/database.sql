CREATE TABLE `ft_pearl` (
    `id` int(11) NOT NULL,
    `items` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

ALTER TABLE `ft_pearl`
  ADD PRIMARY KEY (`id`);
  

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_pearl', 'pearl', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_pearl', 'pearl', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_pearl', 'pearl', 1)
;


INSERT INTO `jobs` (name, label) VALUES
	('pearl','Pearl')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('pearl',0,'recruit','Cook',10,'{}','{}'),
	('pearl',1,'novice','Shopkeeper',25,'{}','{}'),
	('pearl',2,'experienced','Manager',40,'{}','{}'),
	('pearl',3,'boss','Owner',0,'{}','{}')
;


