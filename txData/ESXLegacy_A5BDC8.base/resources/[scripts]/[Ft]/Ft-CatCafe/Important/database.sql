CREATE TABLE `ft_catcafe` (
    `id` int(11) NOT NULL,
    `items` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

ALTER TABLE `ft_catcafe`
  ADD PRIMARY KEY (`id`);
  

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_catcafe', 'catcafe', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_catcafe', 'catcafe', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_catcafe', 'catcafe', 1)
;


INSERT INTO `jobs` (name, label) VALUES
	('catcafe','Cat Cafe')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('catcafe',0,'recruit','Cook',10,'{}','{}'),
	('catcafe',1,'novice','Shopkeeper',25,'{}','{}'),
	('catcafe',2,'experienced','Manager',40,'{}','{}'),
	('catcafe',3,'boss','Owner',0,'{}','{}')
;

