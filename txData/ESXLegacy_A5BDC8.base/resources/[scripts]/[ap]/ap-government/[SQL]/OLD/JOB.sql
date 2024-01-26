INSERT IGNORE INTO `addon_account` (name, label, shared) VALUES
	('society_cityhall','Cityhall', 1)
;

INSERT IGNORE INTO `addon_account_data` (account_name, money) VALUES
	('society_cityhall', 0)
;

INSERT IGNORE INTO `jobs` (name, label) VALUES
	('cityhall','Cityhall')
;

INSERT IGNORE INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('cityhall',0,'government','Government Staff',100,'{}','{}'),
	('cityhall',1,'mayor','Mayor',200,'{}','{}')
;