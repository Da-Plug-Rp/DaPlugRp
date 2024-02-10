CREATE TABLE IF NOT EXISTS `vehiclekeys_permanent_keys` (
	`plate` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`identifier` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`model` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`plate`, `identifier`) USING BTREE,
	INDEX `plate` (`plate`) USING BTREE
)
COMMENT='Permanent shared keys between players'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
