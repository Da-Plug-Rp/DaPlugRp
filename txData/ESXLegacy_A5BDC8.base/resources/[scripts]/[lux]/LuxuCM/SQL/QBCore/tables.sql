CREATE TABLE IF NOT EXISTS `luxucm_warehouses` (
  `warehouse` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `workers` longtext NOT NULL,
  `jobapplications` longtext NOT NULL,
  `guests` longtext NOT NULL,
  `miners` longtext NOT NULL,
  `statistics` longtext NOT NULL,
  `orders` longtext NOT NULL,
  `logs` longtext NOT NULL,
  PRIMARY KEY (`warehouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

ALTER TABLE `players` ADD COLUMN `luxucexassets` LONGTEXT NOT NULL DEFAULT '{}';