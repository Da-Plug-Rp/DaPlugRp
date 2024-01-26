ALTER TABLE owned_vehicles 
ADD COLUMN `noslevel` int(10) DEFAULT 0;
ALTER TABLE owned_vehicles 
ADD COLUMN `hasnitro` tinyint(4) DEFAULT 0;


INSERT INTO `jobs` (`name`, `label`) VALUES
	('tunners', 'Tunners');

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(6, 'tunners', 0, 'recruit', 'Recruit', 250, '{}', '{}'),
	(7, 'tunners', 1, 'novice', 'Novice', 400, '{}', '{}'),
	(8, 'tunners', 2, 'experienced', 'Gerente', 600, '{}', '{}'),
	(9, 'tunners', 3, 'boss', 'Boss', 750, '{}', '{}');

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_tunners', 'Tunners', 1);


INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(10, 'society_tunners', 0, NULL);