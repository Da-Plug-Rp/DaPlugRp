INSERT IGNORE INTO `addon_account` (name, label, shared) VALUES
	('society_court','Court', 1)
;

INSERT IGNORE INTO `addon_account_data` (account_name, money) VALUES
	('society_court', 0)
;

INSERT IGNORE INTO `jobs` (name, label) VALUES
	('court','Court')
;

INSERT IGNORE INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('court',0,'staff','Staff',100,'{}','{}'),
	('court',1,'boss','Judge',200,'{}','{}')
;

INSERT IGNORE INTO `items` (`name`, `label`) VALUES
('lawyerid', 'Lawyer ID');
