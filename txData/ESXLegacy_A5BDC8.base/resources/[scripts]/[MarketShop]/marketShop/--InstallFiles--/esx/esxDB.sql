
INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_supermarket', 'Super Market', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_supermarket', 'Super Market', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_supermarket', 'Super Market', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('supermarket', 'Super Market')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('supermarket',0,    'employee','Employee',12,'{}', '{}'),
	('supermarket',1,    'boss','Boss',0,'{}', '{}')
;