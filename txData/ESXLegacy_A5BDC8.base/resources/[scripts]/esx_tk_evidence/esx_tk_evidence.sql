CREATE TABLE `esx_tk_evidence` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`coords` VARCHAR(255) NOT NULL,
	`time` INT(40) NOT NULL,
	`data` LONGTEXT,

	PRIMARY KEY (`id`)
);

ALTER TABLE `users` ADD COLUMN `gsr` INT(40) NULL;

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('gsr_test_kit', 'GSR test kit', 1),
	('gsr_cloth', 'GSR cloth', 1),
	('uv_light', 'UV Flashlight', 1)
;