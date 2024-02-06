INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES -- you will need to check database structure before running this, my version of esx and yours may not be the same
    ('fs_generator', 'Generator', 1, 0, 1),
    ('fs_laptop', 'Laptop', 1, 0, 1),
    ('fs_whiteslip', 'White Slip', 10, 0, 1),
    ('fs_skimmer', 'Skimmer', 1, 0, 1),
    ('fs_clonnedcard', 'Cloned Card', 10, 0, 1),
    ('fs_blankcard', 'Blank Card', 10, 0, 1),
    ('fs_forgedcheque', 'Forged Check', 10, 0, 1),
    ('fs_usb', 'Info Usb', 10, 0, 1),
    ('fs_stolencard', 'Stolencard', 10, 0, 1),
    ('fs_printer', 'Printer', 1, 0, 1);

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES 
    ('scammer', 'Scammer', 1);
    
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES 
    ('scammer', 0, 'scammer', 'Scammer', 0, '{}', '{}');