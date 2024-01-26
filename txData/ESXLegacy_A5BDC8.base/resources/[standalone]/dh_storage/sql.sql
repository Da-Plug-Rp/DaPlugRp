CREATE TABLE IF NOT EXISTS `dh_storage` (
  `identifier` varchar(50) DEFAULT NULL,
  `tables` longtext DEFAULT NULL,
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

