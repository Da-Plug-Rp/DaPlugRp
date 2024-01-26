CREATE TABLE `ft_mcdonald` (
    `id` int(11) NOT NULL,
    `items` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

ALTER TABLE `ft_mcdonald`
  ADD PRIMARY KEY (`id`);
  

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_mcdonald', 'mcdonald', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_mcdonald', 'mcdonald', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_mcdonald', 'mcdonald', 1)
;


INSERT INTO `jobs` (name, label) VALUES
	('mcdonald','Mc Donald')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mcdonald',0,'recruit','Cook',10,'{}','{}'),
	('mcdonald',1,'novice','Shopkeeper',25,'{}','{}'),
	('mcdonald',2,'experienced','Manager',40,'{}','{}'),
	('mcdonald',3,'boss','Owner',0,'{}','{}')
;


