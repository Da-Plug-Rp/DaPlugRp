CREATE TABLE `ft_whitewidow` (
    `id` int(11) NOT NULL,
    `items` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

ALTER TABLE `ft_whitewidow`
  ADD PRIMARY KEY (`id`);
  

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_whitewidow', 'whitewidow', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_whitewidow', 'whitewidow', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_whitewidow', 'whitewidow', 1)
;


INSERT INTO `jobs` (name, label) VALUES
	('whitewidow','White Widow')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('whitewidow',0,'recruit','Cook',10,'{}','{}'),
	('whitewidow',1,'novice','Shopkeeper',25,'{}','{}'),
	('whitewidow',2,'experienced','Manager',40,'{}','{}'),
	('whitewidow',3,'boss','Owner',0,'{}','{}')
;


