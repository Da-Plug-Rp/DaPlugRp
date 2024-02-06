INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_lashes', 'lashes', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_lashes', 'lashes', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_lashes', 'Lashes', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
	('lashes','Lashess Shop', 1)
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('lashes', 0, 'employed', 'Employe', 100, '{}', '{}'),
('lashes', 1, 'submanager', 'Sub manager', 100, '{}', '{}'),
('lashes', 2, 'manager', 'Manager', 100, '{}', '{}'),
('lashes', 3, 'boss', 'Boss', 100, '{}', '{}');
