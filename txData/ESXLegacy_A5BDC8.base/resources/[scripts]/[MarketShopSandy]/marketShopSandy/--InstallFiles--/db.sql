
DROP TABLE IF EXISTS `pata_marketshopsandystallregnoconf`;
CREATE TABLE IF NOT EXISTS `pata_marketshopsandystallregnoconf` (
  `id` int(11) NOT NULL,
  `typeOf` varchar(100) DEFAULT NULL,
  `itemIn` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `pata_marketshopsandystallregnoconf`
--

INSERT INTO `pata_marketshopsandystallregnoconf` (`id`, `typeOf`, `itemIn`) VALUES
(15, 'food', '[]'),
(16, 'food', '[]'),
(17, 'food', '[]'),
(18, 'food', '[]'),
(19, 'food', '[]'),
(20, 'food', '[]'),
(21, 'food', '[]'),
(22, 'food', '[]'),
(23, 'food', '[]'),
(24, 'food', '[]'),
(25, 'food', '[]'),
(26, 'food', '[]'),
(27, 'food', '[]'),
(28, 'food', '[]'),
(29, 'food', '[]'),
(30, 'food', '[]'),
(31, 'food', '[]');



DROP TABLE IF EXISTS `pata_marketshopsandystallnoconf`;
CREATE TABLE IF NOT EXISTS `pata_marketshopsandystallnoconf` (
  `id` int(11) NOT NULL,
  `AitemIn` longtext DEFAULT NULL,
  `AtypeOf` varchar(100) DEFAULT NULL,
  `BitemIn` longtext DEFAULT NULL,
  `BtypeOf` varchar(100) DEFAULT NULL,
  `CitemIn` longtext DEFAULT NULL,
  `CtypeOf` varchar(100) DEFAULT NULL,
  `DitemIn` longtext DEFAULT NULL,
  `DtypeOf` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `pata_marketshopsandystallnoconf` (`id`, `AitemIn`, `AtypeOf`, `BitemIn`, `BtypeOf`, `CitemIn`, `CtypeOf`, `DitemIn`, `DtypeOf`) VALUES
(5, '[]', 'drink', '[]', 'drink', '[]', 'drink', '[]', 'drink'),
(6, '[]', 'drink', '[]', 'drink', '[]', 'drink', '[]', 'drink'),
(12, '[]', 'drink', '[]', 'drink', '[]', 'drink', '[]', 'drink'),
(13, '[]', 'drink', '[]', 'drink', '[]', 'drink', '[]', 'drink'),
(14, '[]', 'drink', '[]', 'drink', '[]', 'drink', '[]', 'drink');



DROP TABLE IF EXISTS `pata_marketshopsandystall`;
CREATE TABLE IF NOT EXISTS `pata_marketshopsandystall` (
  `id` int(11) NOT NULL,
  `color` varchar(100) DEFAULT NULL,
  `sizeOf` varchar(100) DEFAULT NULL,
  `AtypeOf` varchar(100) DEFAULT NULL,
  `Amodel` varchar(100) DEFAULT NULL,
  `AitemIn` longtext DEFAULT NULL,
  `BtypeOf` varchar(100) DEFAULT NULL,
  `Bmodel` varchar(100) DEFAULT NULL,
  `BitemIn` longtext DEFAULT NULL,
  `CtypeOf` varchar(100) DEFAULT NULL,
  `Cmodel` varchar(100) DEFAULT NULL,
  `CitemIn` longtext DEFAULT NULL,
  `DtypeOf` varchar(100) DEFAULT NULL,
  `Dmodel` varchar(100) DEFAULT NULL,
  `DitemIn` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;



INSERT INTO `pata_marketshopsandystall` (`id`, `color`, `sizeOf`, `AtypeOf`, `Amodel`, `AitemIn`, `BtypeOf`, `Bmodel`, `BitemIn`, `CtypeOf`, `Cmodel`, `CitemIn`, `DtypeOf`, `Dmodel`, `DitemIn`) VALUES
(8, 'orange', 'medium', 'fastfood', 'medium', '[]', 'food', 'medium', '[]', 'alcohol', 'medium', '[]', 'snacks', 'medium', '[]'),
(7, 'orange', 'medium', 'snacks', 'medium', '[]', 'food', 'medium', '[]', 'equipment', 'medium', '[]', 'medical', 'medium', '[]'),
(4, 'blue', 'large', 'medical1', 'large', '[]', 'hygieneproduct', 'large', '[]', 'medical2', 'large', '[]', 'medical1', 'large', '[]'),
(3, 'orange', 'large', 'sugar1', 'large', '[]', 'camping', 'large', '[]', 'cereal', 'large', '[]', 'snacks', 'large', '[]'),
(1, 'orange', 'large', 'snacks', 'large', '[]', 'food', 'large', '[]', 'drink', 'bottlelarge', '[]', 'fastfood', 'large', '[]'),
(2, 'blue', 'large', 'fastfood', 'large', '[]', 'drink', 'bottlelarge', '[]', 'equipment', 'large', '[]', 'sugar3', 'large', '[]'),
(9, 'blue', 'medium', 'fastfood', 'medium', '[]', 'drink', 'bottlemedium', '[]', 'food', 'medium', '[]', 'sugar1', 'medium', '[]'),
(10, 'orange', 'medium', 'sugar1', 'medium', '[]', 'alcohol', 'medium', '[]', 'alcohol', 'medium', '[]', 'sugar3', 'medium', '[]'),
(11, 'blue', 'medium', 'medical1', 'medium', '[]', 'medical2', 'medium', '[]', 'medical2', 'medium', '[]', 'medical1', 'medium', '[]');



DROP TABLE IF EXISTS `pata_marketshopsandystock`;
CREATE TABLE IF NOT EXISTS `pata_marketshopsandystock` (
  `name` varchar(100) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sellingprice` varchar(100) DEFAULT '2.0',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `pata_marketshopsandystock`
--



