-- IF YOU ARE UPDATING FROM V1, MAKE SURE TO DELETE loaf_houses TABLE
-- DROP TABLE `loaf_houses`;

CREATE TABLE IF NOT EXISTS `loaf_houses` (
    `id` INT NOT NULL,
    
    `label` VARCHAR(40) NOT NULL DEFAULT "Property",
    `house_apart` VARCHAR(40) NOT NULL DEFAULT "house",

    `interior_type` VARCHAR(40) NOT NULL DEFAULT "shell",
    `interior` VARCHAR(40) DEFAULT NULL,
    `category` VARCHAR(40),

    `entrance` VARCHAR(255) NOT NULL,
    `price` INT NOT NULL DEFAULT 100000,
    `rent` INT DEFAULT NULL,

    `garage_entrance` VARCHAR(255),
    `garage_exit` VARCHAR(255),

    `misc` LONGTEXT,

    PRIMARY KEY(`id`)
);

ALTER TABLE `loaf_houses` ADD COLUMN IF NOT EXISTS `misc` LONGTEXT;
ALTER TABLE `loaf_houses` ADD COLUMN IF NOT EXISTS `rent` INT DEFAULT NULL;
ALTER TABLE `loaf_houses` MODIFY `interior` VARCHAR(40) DEFAULT NULL;