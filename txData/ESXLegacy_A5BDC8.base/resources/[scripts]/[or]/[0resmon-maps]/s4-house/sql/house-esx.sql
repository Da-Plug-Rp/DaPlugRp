
CREATE TABLE IF NOT EXISTS `s4-house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apartTypeID` varchar(50) DEFAULT NULL,
  `garage_in` text DEFAULT NULL,
  `house_in` text DEFAULT NULL,
  `owner` text NOT NULL,
  `name` text NOT NULL DEFAULT 'House for sale',
  `garage` text NOT NULL DEFAULT '[]',
  `friends` text NOT NULL DEFAULT '[]',
  `theme` text NOT NULL DEFAULT 'modern',
  `garageId` int(11) NOT NULL DEFAULT 1,
  `extends` text NOT NULL DEFAULT '[]',
  `props` text NOT NULL DEFAULT '[]',
  `prop` text NOT NULL DEFAULT 'esyali',
  `alarm` tinyint(1) NOT NULL DEFAULT 0,
  `price` int(11) DEFAULT 0,
  `img` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE IF NOT EXISTS `s4-house-cache` (
  `hid` int(11) NOT NULL,
  `identifier` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `s4-house-realestate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `money` float NOT NULL,
  `jobname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES ('realestate', 'Reak Estate', 0);
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES (41, 'realestate', 4, 'boss', 'Boss', 0, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES (42, 'realestate', 3, 'trader', 'trader', 40, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES (43, 'realestate', 2, 'recrue', 'recrue', 40, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES (44, 'realestate', 1, 'employer', 'employer', 40, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES (45, 'realestate', 0, 'newbie', 'yeni', 40, '{}', '{}')