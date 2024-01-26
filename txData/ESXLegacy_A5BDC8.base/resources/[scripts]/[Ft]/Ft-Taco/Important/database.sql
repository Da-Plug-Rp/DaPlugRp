CREATE TABLE `ft_taco` (
      `id` int(11) NOT NULL,
    `items` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

ALTER TABLE `ft_taco`
  ADD PRIMARY KEY (`id`);
  

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_taco', 'Taco', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_taco', 'Taco', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_taco', 'Taco', 1)
;


INSERT INTO `jobs` (name, label) VALUES
	('taco','Taco')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('taco',0,'recruit','Farmer',10,'{}','{}'),
	('taco',1,'novice','Shopkeeper',25,'{}','{}'),
	('taco',2,'experienced','Manager',40,'{}','{}'),
	('taco',3,'boss','Owner',0,'{}','{}')
;

