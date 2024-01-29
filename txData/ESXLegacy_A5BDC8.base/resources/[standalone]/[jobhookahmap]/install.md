Hello and Thank you for purchasing!

This script supports Hookah Job + Mapping By : Family FiveM

## Installation

To add new locations copy one of the locations in the Locations folder and then then change the appropritate targets. We will not be able to help you with MLOs we do not own.

1. Copy all items in the `install` > `items.lua`

and paste them in your `QB-Core` / `shared` / `items.lua`
(they should automatically convert for ox_inventory)

2. Copy images from the `install` > `images` folder

paste them into your `ps-inventory/html/images` or
`qb-inventory/html/images` or
`lj_inventory/web/images`

3. Copy this into your `QBCore` / `Shared` / `jobs.lua`

## Jobs in qb-core > shared > jobs.lua

Under the QBShared.Jobs in jobs.lua

	['hookah'] = {
		label = 'Hookah',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Manager', isboss = true, payment = 250 },
        },
	},

4. Add the animations provided in the customanims.md to your emote menu of choice they are currently formattted for dp/rp emotes

## items

You will have to set up your own toys. I left in one example toy This is how you would set it up in your items.lua - there is no limit to how many toys you can have.

	-- Hookah ITEMS
	['water_bottle'] 				 = {['name'] = 'water_bottle', 			  	  	['label'] = 'Bottle of Water', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'water_bottle.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'For all the thirsty out there'},
	['coffee'] 				 		 = {['name'] = 'coffee', 			  	  		['label'] = 'Coffee', 					['weight'] = 200, 		['type'] = 'item', 		['image'] = 'coffee.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Pump 4 Caffeine'},
	['kurkakola'] 				 	 = {['name'] = 'kurkakola', 			  	  	['label'] = 'Cola', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'cola.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'For all the thirsty out there'},
	["cheesecake"] 					= {["name"] = "cheesecake",  	    		["label"] = "Cheese Cake",				["weight"] = 100, 		["type"] = "item", 		["image"] = "cheesecake.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(10, 15) },
    ["crisps"] 						= {["name"] = "crisps",  	    			["label"] = "Crisps",					["weight"] = 100, 		["type"] = "item", 		["image"] = "chips.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(10, 15) },
	["sprunk"] 						= {["name"] = "sprunk",  	    	 		["label"] = "Sprunk",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunk.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
    ["sprunklight"] 				= {["name"] = "sprunklight",  	    	 	["label"] = "Sprunk Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunklight.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
    ["ecola"] 						= {["name"] = "ecola",  	    	 		["label"] = "eCola",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "ecola.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
    ["ecolalight"] 					= {["name"] = "ecolalight",  	    	 	["label"] = "eCola Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "ecolalight.png", 		["unique"] 
	["beandonut"] 					= {["name"] = "beandonut",  	    		["label"] = "Donut",					["weight"] = 100, 		["type"] = "item", 		["image"] = "popdonut.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },= false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },

## Jim-shops: https://github.com/jimathy/jim-shops.git

		["hookah"] = { -- The name of the table to be called by a shop
			{ name = "water_bottle", price = 20, amount = 100, },
			{ name = "beer", price = 60, amount = 100, },
			{ name = "cheesecake", price = 70, amount = 150 },
			{ name = "ecola", price = 50, amount = 150, },
			{ name = "ecolalight", price = 50, amount = 150, },
			{ name = "sprunk", price = 50, amount = 150, },
			{ name = "sprunklight", price = 50, amount = 150, },
			{ name = "beandonut", price = 40, amount = 150, },
			{ name = "vodka", price = 50, amount = 150, },
			{ name = "crisps", price = 40, amount = 150, },
			{ name = "watermelon", price = 20, amount = 150, },

		},

# Jim Dj : https://github.com/jimathy/jim-djbooth

install Jim djbooth Free playlist youtube !