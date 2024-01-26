CREATE TABLE IF NOT EXISTS `bit_motels` (
  `room` int(10) DEFAULT NULL,
  `motel` varchar(50) DEFAULT NULL,
  `renter` varchar(50) DEFAULT NULL,
  `rentername` varchar(200) DEFAULT NULL,
  `amount` int(20) DEFAULT NULL,
  `inroom` int(11) DEFAULT 0
);

CREATE TABLE IF NOT EXISTS `bit_motels_owners` (
  `motel` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `balance` int(200) DEFAULT NULL
);


-- If you are upgrading to version 1.4 use the following query to add the new column
ALTER TABLE bit_motels
ADD COLUMN inroom INT(11) DEFAULT 0;