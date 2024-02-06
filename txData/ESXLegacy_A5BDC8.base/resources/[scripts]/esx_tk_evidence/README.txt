Hey! Thanks for purchasing my script. Remember:
   - You are not allowed to resell or re-release my scripts

Requirements:
   - Any es_extended version
   - Any esx_menu_default
   - Any esx_menu_dialog

Installing the script:
   1. Download the file and extract "esx_tk_evidence" into your resources folder
   2. Add "start esx_tk_evidence" into your server.cfg file
   3. Import the SQL file into your server's database
   4. Edit config.lua to your liking
   5. Restart your server

Items (for ox_inventory):
	["bullet_casing"] = {
		label = "Bullet casing",
		weight = 1,
		stack = false,
		buttons = {
			{
				label = 'Copy serial',
				action = function(slot)
					exports['esx_tk_evidence']:CopyItemSerial(slot)
				end
			},
			{
				label = 'Set tag',
				action = function(slot)
					exports['esx_tk_evidence']:SetItemTag(slot)
				end
			}
		},
	},

	["bullet_fragment"] = {
		label = "Bullet fragment",
		weight = 1,
		stack = false,
		buttons = {
			{
				label = 'Copy serial',
				action = function(slot)
					exports['esx_tk_evidence']:CopyItemSerial(slot)
				end
			},
			{
				label = 'Set tag',
				action = function(slot)
					exports['esx_tk_evidence']:SetItemTag(slot)
				end
			}
		},
	},

	["blood_sample"] = {
		label = "Blood sample",
		weight = 1,
		stack = false,
		buttons = {
			{
				label = 'Set tag',
				action = function(slot)
					exports['esx_tk_evidence']:SetItemTag(slot)
				end
			}
		},
	},

	["fingerprint_sample"] = {
		label = "Fingerprint sample",
		weight = 1,
		stack = false,
		buttons = {
			{
				label = 'Set tag',
				action = function(slot)
					exports['esx_tk_evidence']:SetItemTag(slot)
				end
			}
		},
	},

	["evidence"] = {
		label = "Evidence",
		weight = 1,
		stack = false,
		buttons = {
			{
				label = 'Set tag',
				action = function(slot)
					exports['esx_tk_evidence']:SetItemTag(slot)
				end
			}
		},
	},

More questions?
   - Join our Discord and open a ticket: https://discord.gg/YndnF9tkqu