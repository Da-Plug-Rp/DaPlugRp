CREATE TABLE `ft_chickfila` (
    `id` int(11) NOT NULL,
    `items` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

ALTER TABLE `ft_chickfila`
  ADD PRIMARY KEY (`id`);
  

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_chickfila', 'chickfila', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_chickfila', 'chickfila', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_chickfila', 'chickfila', 1)
;


INSERT INTO `jobs` (name, label) VALUES
	('chickfila','Chickfila')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('chickfila',0,'recruit','Cook',10,'{}','{}'),
	('chickfila',1,'novice','Shopkeeper',25,'{}','{}'),
	('chickfila',2,'experienced','Manager',40,'{}','{}'),
	('chickfila',3,'boss','Owner',0,'{}','{}')
;


