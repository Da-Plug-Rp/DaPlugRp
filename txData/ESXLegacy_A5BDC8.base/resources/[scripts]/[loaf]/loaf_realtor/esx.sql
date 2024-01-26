INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES ("society_rea", "Real estate agent", 1);

INSERT INTO `jobs` (`name`, `label`) VALUES ("rea", "Real estate agent");

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	("rea", 0, "trainee", "Trainee", 75, "{}", "{}"),
	("rea", 1, "agent", "Agent", 100, "{}", "{}"),
	("rea", 2, "managher", "Manager", 150, "{}", "{}"),
	("rea", 3, "boss", "Boss", 200, "{}", "{}");