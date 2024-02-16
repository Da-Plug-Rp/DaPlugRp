CREATE TABLE IF NOT EXISTS `roadshop_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(80) CHARACTER SET utf8 NOT NULL,
  `firstname` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `lastname` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `mail` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `birth` varchar(50) NULL DEFAULT NULL,
  `password` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `profile` varchar(265) COLLATE utf8mb4_bin DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `mail` (`mail`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `roadshop_twitter_accounts` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`password` VARCHAR(64) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_bin',
	`avatar_url` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	`profilavatar` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
  `verify` INT(2) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `username` (`username`) USING BTREE
)
COLLATE='utf8mb4_bin'
ENGINE=InnoDB
;

CREATE TABLE IF NOT EXISTS `roadshop_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(80) NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `roadshop_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(80) NOT NULL DEFAULT '0',
  `tabletsetup` int(2) NOT NULL DEFAULT 0,
  `phonesetup` int(2) NOT NULL DEFAULT 0,
  `crypto` longtext NOT NULL DEFAULT '{}',
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `roadshop_twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` LONGTEXT NULL COLLATE 'utf8mb4_unicode_ci',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_roadshop_twitter_tweets_roadshop_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_roadshop_twitter_tweets_roadshop_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `roadshop_twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `roadshop_twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_roadshop_twitter_likes_roadshop_twitter_accounts` (`authorId`),
  KEY `FK_roadshop_twitter_likes_roadshop_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_roadshop_twitter_likes_roadshop_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `roadshop_twitter_accounts` (`id`),
  CONSTRAINT `FK_roadshop_twitter_likes_roadshop_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `roadshop_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `roadshop_camera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(80) NOT NULL,
  `picture` longtext NOT NULL,
  `isFavourite` int(2) NOT NULL DEFAULT 0,
  `isDeleted` int(2) NOT NULL DEFAULT 0,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `roadshop_bankcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(80) NOT NULL DEFAULT '0',
  `card` varchar(50) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `roadshop_banktransfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(30) NOT NULL DEFAULT '0',
  `receiver` varchar(30) NOT NULL DEFAULT '0',
  `reason` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `roadshop_business_job_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(80) NOT NULL DEFAULT '0',
  `job` varchar(50) DEFAULT NULL,
  `name` varchar(80) NOT NULL DEFAULT '0',
  `mail` varchar(80) NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `state` varchar(30) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `roadshop_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) NOT NULL DEFAULT '0',
  `sendermail` varchar(80) NOT NULL DEFAULT '0',
  `receivermail` varchar(80) NOT NULL DEFAULT '0',
  `receiver` varchar(80) DEFAULT NULL,
  `title` varchar(80) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `image` varchar(120) DEFAULT NULL,
  `button` text DEFAULT NULL,
  `isSystem` int(11) DEFAULT NULL,
  `read` int(2) DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `roadshop_ebay_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(80) DEFAULT NULL,
  `product_name` varchar(50) NOT NULL DEFAULT '0',
  `product_description` varchar(80) DEFAULT '',
  `product_type` varchar(50) DEFAULT '',
  `product_amount` int(11) DEFAULT 0,
  `vehicle_class` varchar(50) DEFAULT '0',
  `vehicle_color` varchar(50) DEFAULT '0',
  `vehicle_image` varchar(80) DEFAULT '0',
  `item_name` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `roadshop_ebay_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(80) NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `roadshop_music_playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(80) NOT NULL,
  `title` varchar(25) NOT NULL,
  `image` varchar(265) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `roadshop_music_playlists_songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlistId` int(11) DEFAULT NULL,
  `songid` varchar(50) NOT NULL DEFAULT '0',
  `song` varchar(200) NOT NULL DEFAULT '0',
  `artist` varchar(200) NOT NULL DEFAULT '0',
  `image` varchar(265) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `playlistId` (`playlistId`),
  CONSTRAINT `FK__roadshop_music_playlists` FOREIGN KEY (`playlistId`) REFERENCES `roadshop_music_playlists` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;