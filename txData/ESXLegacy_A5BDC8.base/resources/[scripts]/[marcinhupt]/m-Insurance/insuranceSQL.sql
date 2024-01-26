CREATE TABLE IF NOT EXISTS `m_insurance_health` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

CREATE TABLE IF NOT EXISTS `m_insurance_home` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

CREATE TABLE IF NOT EXISTS `m_insurance_registration` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `plate` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `model` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `registration` int NOT NULL DEFAULT (0),
  `identifier` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

CREATE TABLE IF NOT EXISTS `m_insurance_vehicles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `plate` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  `model` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `identifier` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
