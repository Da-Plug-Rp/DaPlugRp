CREATE TABLE IF NOT EXISTS `billing` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(80) NOT NULL COLLATE 'utf8mb4_general_ci',
	`sender` VARCHAR(80) NOT NULL COLLATE 'utf8mb4_general_ci',
	`target_type` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`target` VARCHAR(80) NOT NULL COLLATE 'utf8mb4_general_ci',
	`label` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`amount` INT(11) NOT NULL,
	`date` BIGINT(20) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
);
