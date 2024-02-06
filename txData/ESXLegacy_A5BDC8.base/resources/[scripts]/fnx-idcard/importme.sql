
/* ESX */
ALTER TABLE `users` ADD COLUMN `idCardPhoto` VARCHAR(255)  DEFAULT (NULL) COLLATE 'utf8mb4_bin';

/* QBCORE */
ALTER TABLE `players` ADD COLUMN `idCardPhoto` VARCHAR(255)  DEFAULT (NULL) COLLATE 'utf8mb4_bin';    