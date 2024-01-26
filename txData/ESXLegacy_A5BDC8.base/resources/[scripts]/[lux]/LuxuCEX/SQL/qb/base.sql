CREATE TABLE `luxucextransactions` (
  `lcex_id` int(11) NOT NULL AUTO_INCREMENT,
  `lcex_type` varchar(255) NOT NULL,
  `lcex_coin` varchar(255) NOT NULL,
  `lcex_amount` decimal(20,7) NOT NULL,
  `lcex_price` decimal(20,7) DEFAULT NULL,
  `lcex_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lcex_sender` varchar(255) DEFAULT NULL,
  `lcex_receiver` varchar(255) DEFAULT NULL,
  `lcex_identifier` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lcex_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `luxucex_positions` (
  `code` char(36) NOT NULL,
  `pair` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `contract_quantity` varchar(100) NOT NULL,
  `entry` float NOT NULL,
  `leverage` int(11) NOT NULL,
  `allocated_margin` float NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `liquidation` float DEFAULT NULL,
  `owner` varchar(100) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `luxucex_tradinghistory` (
  `key` int(11) NOT NULL AUTO_INCREMENT,
  `pair` varchar(100) NOT NULL,
  `entry` varchar(100) DEFAULT NULL,
  `margin` varchar(100) NOT NULL,
  `leverage` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `close` varchar(100) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `action` varchar(100) NOT NULL,
  `pnl` varchar(100) DEFAULT NULL,
  `owner` varchar(100) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `players` ADD COLUMN `luxucryptoaddress` LONGTEXT;
ALTER TABLE `players` ADD COLUMN `luxucexassets` LONGTEXT NOT NULL DEFAULT '{}';
ALTER TABLE `players` ADD COLUMN `luxucwbalance` float NOT NULL DEFAULT '0';