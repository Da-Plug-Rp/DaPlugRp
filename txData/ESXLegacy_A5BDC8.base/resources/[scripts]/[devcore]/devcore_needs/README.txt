Realistic Needs script from https://store.devcore.cz/
If you have a problem with the script, contact our support Discord: https://discord.gg/zcG9KQj3sa


The script uses the escrow system

How to install the script


1. After purchasing the script, the script can be downloaded here https://keymaster.fivem.net/assets

2. Upload the contents of the zip file to your server

3. ensure devcore_needs in server.cfg after es_extended and ox_lib / https://github.com/overextended/ox_lib

4. Now create items depending on the inventory.

If you are using ox_inventory 
paste the contents of the file upload/inventory/ox_inventory_items.txt into the file ox_inventory/data/items.lua,

If you are using qs-inventory
paste the contents of the file upload/inventory/qs_inventory_items.txt into the file qs-inventory/shared/items.lua,

if you are using a different inventory
paste the contents of the file upload/inventory/items.sql file into the database.

5.If you want to store the positions of items placed on the ground in the database, don't forget to upload the upload/sql/needs.sql file to the database

6. Go to esx_basicneeds/config.lua and delete all created items 
-- Default --
Config.Items = {
	["bread"] = {
		type = "food",
		prop= "prop_cs_burger_01",
		status = 200000,
		remove = true
	},
	
	["water"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle",
		status = 100000,
		remove = true
	}
}
--
After removed --
Config.Items = {

}
----
7. restart server

Make sure your server artifacts version is above the 5181.