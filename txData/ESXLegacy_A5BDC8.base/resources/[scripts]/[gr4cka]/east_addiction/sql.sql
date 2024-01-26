ALTER TABLE `users`
ADD `addiction` text NOT NULL DEFAULT '[]';

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('joint', 'Joint', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('cocaine', 'Cocaine', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('meth', 'Meth', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('heroin', 'Heroin', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('mdma', 'MDMA', 1, 0, 1);

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('buspirone', 'Buspirone', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('propranolol', 'Propranolol', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('methadone', 'Methadone', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('antimdma', 'Anti-MDMA', 1, 0, 1);