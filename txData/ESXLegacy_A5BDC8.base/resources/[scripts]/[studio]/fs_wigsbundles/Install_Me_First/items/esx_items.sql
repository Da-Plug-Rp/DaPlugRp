

DELETE FROM items WHERE name = 'wigtable';
DELETE FROM items WHERE name = 'wigphone';
DELETE FROM items WHERE name = 'sewinkit';
DELETE FROM items WHERE name = 'wigcap';
DELETE FROM items WHERE name = 'hairbundles';
DELETE FROM items WHERE name = 'fortyinchwig';
DELETE FROM items WHERE name = 'braidswig';
DELETE FROM items WHERE name = 'curlywig';
DELETE FROM items WHERE name = 'bangwig';

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
    ('wigtable', 'Wig Table', 1),
    ('wigphone', 'Wig Phone', 1),
    ('sewinkit', 'Sew in Kit', 1),
    ('wigcap', 'Wig Cap', 1),
    ('hairbundles', 'Hair Bundles', 1),
    ('fortyinchwig', '40 inch Wig', 1),
    ('braidswig', 'Braids Wig', 1),
    ('curlywig', 'Curly Wig', 1),
    ('bangwig', 'Bang Wig', 1);