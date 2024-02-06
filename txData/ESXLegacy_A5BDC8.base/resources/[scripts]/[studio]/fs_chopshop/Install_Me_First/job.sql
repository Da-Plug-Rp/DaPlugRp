INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_scraper', 'Scraper', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_scraper', 'Scraper', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_scraper', 'Scraper', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('scraper', 'Scraper')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('scraper',0,'recruit','Recruit',0,'{}','{}'),
	('scraper',1,'employe','Employe',0,'{}','{}'),
	('scraper',2,'manager','Manager',0,'{}','{}'),
	('scraper',3,'boss','Boss',0,'{}','{}');