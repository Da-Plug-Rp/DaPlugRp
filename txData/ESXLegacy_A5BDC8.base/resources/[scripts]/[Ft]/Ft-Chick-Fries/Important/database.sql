CREATE TABLE `ft_kfc` (
    `id` int(11) NOT NULL,
    `items` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

ALTER TABLE `ft_kfc`
  ADD PRIMARY KEY (`id`);
  

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_kfc', 'kfc', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_kfc', 'kfc', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_kfc', 'kfc', 1)
;


INSERT INTO `jobs` (name, label) VALUES
	('kfc','Mc Donald')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('kfc',0,'recruit','Cook',10,'{}','{}'),
	('kfc',1,'novice','Shopkeeper',25,'{}','{}'),
	('kfc',2,'experienced','Manager',40,'{}','{}'),
	('kfc',3,'boss','Owner',0,'{}','{}')
;


