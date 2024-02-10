CREATE TABLE IF NOT EXISTS `vehiclekeys_jobs` (
	`id` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`type` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`allowed_jobs` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`kick_if_not_allowed` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
