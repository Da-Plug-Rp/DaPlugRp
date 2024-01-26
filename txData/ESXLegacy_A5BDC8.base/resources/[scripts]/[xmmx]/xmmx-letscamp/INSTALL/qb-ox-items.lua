-- If not using the AutoAddItems feature then Manually Add the items below to qb-core/shared/items.lua

----[QB] Let's Camp! 
----Ingredients:    
    ["lcmarshmellow"] 		= {["name"] = "lcmarshmellow",       ["label"] = "Marshmellows", 	    ["weight"] = 100, 	["type"] = "item", 	["image"] = "lcmarshmellow.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Lets Camp! Ingredient."},
    ["lcchocolate"] 		= {["name"] = "lcchocolate",         ["label"] = "Chocolate Bar", 	    ["weight"] = 100, 	["type"] = "item", 	["image"] = "lcchocolate.png", 	    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Lets Camp! Ingredient."},
    ["lcgramcrkrs"] 		= {["name"] = "lcgramcrkrs",         ["label"] = "Graham Crackers", 	["weight"] = 100, 	["type"] = "item", 	["image"] = "lcgramcrkrs.png", 	    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Lets Camp! Ingredient."},
     
    ["lccampmeat"] 		    = {["name"] = "lccampmeat",          ["label"] = "Raw Beef", 	        ["weight"] = 100, 	["type"] = "item", 	["image"] = "lccampmeat.png", 	    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Lets Camp! Ingredient."},
    ["lccampherbs"] 		= {["name"] = "lccampherbs",         ["label"] = "Wild Herbs", 	        ["weight"] = 100, 	["type"] = "item", 	["image"] = "lccampherbs.png", 	    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Lets Camp! Ingredient."},
    ["lccampbeans"] 		= {["name"] = "lccampbeans",         ["label"] = "Canned beans", 	    ["weight"] = 100, 	["type"] = "item", 	["image"] = "lccampbeans.png", 	    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Lets Camp! Ingredient."},
    ["lccampcorn"] 	        = {["name"] = "lccampcorn",          ["label"] = "Ear Corn", 	        ["weight"] = 100, 	["type"] = "item", 	["image"] = "lccampcorn.png", 	    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Lets Camp! Ingredient."},
    ["lccamppotato"] 	    = {["name"] = "lccamppotato",        ["label"] = "Potato", 	            ["weight"] = 100, 	["type"] = "item", 	["image"] = "lccamppotato.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Lets Camp! Ingredient."},
    ["lccampbutta"] 		= {["name"] = "lccampbutta",         ["label"] = "Butter", 	            ["weight"] = 100, 	["type"] = "item", 	["image"] = "lccampbutta.png", 	    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Lets Camp! Ingredient."},
    ["lccampfish"] 		    = {["name"] = "lccampfish",          ["label"] = "Fresh Fish", 	    	["weight"] = 100, 	["type"] = "item", 	["image"] = "lccampfish.png", 	    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Lets Camp! Ingredient."},

----Eat / Drink Items
    ['lcsmores']            = {['name'] = 'lcsmores', 	         ['label'] = 'Smores',		        ['weight'] = 200, 	['type'] = 'item', 	['image'] = 'lcsmores.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "Lets Camp! S\'mores"},
    ['lccookedsteak']       = {['name'] = 'lccookedsteak', 	     ['label'] = 'Grilled Steak',		['weight'] = 200, 	['type'] = 'item', 	['image'] = 'lccookedsteak.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "Lets Camp! Grilled Steak"},
    ['lccookedbeans']       = {['name'] = 'lccookedbeans', 	     ['label'] = 'Warmed Beans',		['weight'] = 200, 	['type'] = 'item', 	['image'] = 'lccookedbeans.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "Lets Camp! Cooked Beans"},
    ['lccookedcorn']        = {['name'] = 'lccookedcorn', 	     ['label'] = 'Cooked Corn',		    ['weight'] = 200, 	['type'] = 'item', 	['image'] = 'lccookedcorn.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "Lets Camp! Cooked Corn on the Cob"},
    ['lccookedfish']        = {['name'] = 'lccookedfish', 	     ['label'] = 'Cooked Fish',		    ['weight'] = 200, 	['type'] = 'item', 	['image'] = 'lccookedfish.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "Lets Camp! Cooked Fished"},
    ['lccookedpotato']      = {['name'] = 'lccookedpotato', 	 ['label'] = 'Cooked Potato',		['weight'] = 200, 	['type'] = 'item', 	['image'] = 'lccookedpotato.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "Lets Camp! Cooked Potato"},

    ['lcherbtea']           = {['name'] = 'lcherbtea', 	         ['label'] = 'Herbal Tea',		    ['weight'] = 200, 	['type'] = 'item', 	['image'] = 'lcherbtea.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "Lets Camp! Herbal Tea"},
    ['lcwater']             = {['name'] = 'lcwater', 	         ['label'] = 'Water',		        ['weight'] = 200, 	['type'] = 'item', 	['image'] = 'lcwater.png', 	        ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "Lets Camp! Water Canteen"},
    ['lccampcoffee']        = {['name'] = 'lccampcoffee', 	     ['label'] = 'Coffee',		        ['weight'] = 200, 	['type'] = 'item', 	['image'] = 'lccampcoffee.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "Lets Camp! Cup of Coffee"},

----Camping Supplies
    ['lc_camptent'] 	    = {['name'] = 'lc_camptent',         ['label'] = 'Camp Tent',           ['weight'] = 5000,  ['type'] = 'item',  ['image'] = 'lc_camptent.png', 		['unique'] = true, 	    ['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Lets Camp! Tent'},
    ['lc_campchair'] 	    = {['name'] = 'lc_campchair',        ['label'] = 'Camp Chair',          ['weight'] = 5000,  ['type'] = 'item',  ['image'] = 'lc_campchair.png', 	['unique'] = true, 	    ['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Lets Camp! Chair'},
    ['lc_campbed'] 	        = {['name'] = 'lc_campbed',          ['label'] = 'Camp Bed',            ['weight'] = 5000,  ['type'] = 'item',  ['image'] = 'lc_campbed.png', 		['unique'] = true, 	    ['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Lets Camp! Bed'},
    ['lc_campcooler'] 	    = {['name'] = 'lc_campcooler',       ['label'] = 'Camp Cooler',         ['weight'] = 5000,  ['type'] = 'item',  ['image'] = 'lc_campcooler.png', 	['unique'] = true, 	    ['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Lets Camp! Cooler'},
    ['lc_campgrill'] 	    = {['name'] = 'lc_campgrill',        ['label'] = 'Camp Grill',          ['weight'] = 5000,  ['type'] = 'item',  ['image'] = 'lc_campgrill.png', 	['unique'] = true, 	    ['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Lets Camp! Grill'},
    ['lc_campwood'] 	    = {['name'] = 'lc_campwood',         ['label'] = 'Camp Firewood',       ['weight'] = 5000,  ['type'] = 'item',  ['image'] = 'lc_campwood.png', 		['unique'] = true, 	    ['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Lets Camp! Firewood'},



    
--   ______   __    __        ______  __    __  __     __  ________  __    __  ________   ______   _______  __      __    
--  /      \ |  \  |  \      |      \|  \  |  \|  \   |  \|        \|  \  |  \|        \ /      \ |       \|  \    /  \   
-- |  $$$$$$\| $$  | $$       \$$$$$$| $$\ | $$| $$   | $$| $$$$$$$$| $$\ | $$ \$$$$$$$$|  $$$$$$\| $$$$$$$\\$$\  /  $$__ 
-- | $$  | $$ \$$\/  $$        | $$  | $$$\| $$| $$   | $$| $$__    | $$$\| $$   | $$   | $$  | $$| $$__| $$ \$$\/  $$|  \
-- | $$  | $$  >$$  $$         | $$  | $$$$\ $$ \$$\ /  $$| $$  \   | $$$$\ $$   | $$   | $$  | $$| $$    $$  \$$  $$  \$$
-- | $$  | $$ /  $$$$\         | $$  | $$\$$ $$  \$$\  $$ | $$$$$   | $$\$$ $$   | $$   | $$  | $$| $$$$$$$\   \$$$$   __ 
-- | $$__/ $$|  $$ \$$\       _| $$_ | $$ \$$$$   \$$ $$  | $$_____ | $$ \$$$$   | $$   | $$__/ $$| $$  | $$   | $$   |  \
--  \$$    $$| $$  | $$      |   $$ \| $$  \$$$    \$$$   | $$     \| $$  \$$$   | $$    \$$    $$| $$  | $$   | $$    \$$
--   \$$$$$$  \$$   \$$       \$$$$$$ \$$   \$$     \$     \$$$$$$$$ \$$   \$$    \$$     \$$$$$$  \$$   \$$    \$$       
                                                                                                                                                                                                                                                                             
	['lcmarshmellow'] 		    = { label = 'Marshmellows', 		  weight = 80, },
    ['lcchocolate'] 		    = { label = 'Chocolate Bar', 		  weight = 80, },
    ['lcgramcrkrs'] 		    = { label = 'Graham Crackers', 		  weight = 80, },
    ['lccampmeat'] 		        = { label = 'Raw Beef', 		      weight = 80, },
    ['lccampherbs'] 		    = { label = 'Wild Herbs', 		      weight = 80, },
    ['lccampbeans'] 		    = { label = 'Canned beans', 		  weight = 80, },
    ['lccampcorn'] 		        = { label = 'Ear Corn', 		      weight = 80, },
    ['lccamppotato'] 		    = { label = 'Potato', 		          weight = 80, },
    ['lccampbutta'] 		    = { label = 'Butter', 		          weight = 80, },
    ['lccampfish'] 		        = { label = 'Fresh Fish', 		      weight = 80, },

    ['lcsmores'] 		        = { label = 'Smores', 		          weight = 80, },
    ['lccookedsteak'] 		    = { label = 'Grilled Steak', 		  weight = 80, },
    ['lccookedbeans'] 		    = { label = 'Warmed Beans', 		  weight = 80, },
    ['lccookedcorn'] 		    = { label = 'Cooked Corn', 		      weight = 80, },
    ['lccookedfish'] 		    = { label = 'Cooked Fish', 		      weight = 80, },
    ['lccookedpotato'] 		    = { label = 'Cooked Potato', 		  weight = 80, },
    ['lcherbtea'] 		        = { label = 'Herbal Tea', 		      weight = 80, },
    ['lcwater'] 		        = { label = 'Water', 		          weight = 80, },
    ['lccampcoffee'] 		    = { label = 'Coffee', 		          weight = 80, },

    ['lc_camptent'] 		    = { label = 'Camp Tent', 		      weight = 80, },
    ['lc_campchair'] 		    = { label = 'Camp Chair', 		      weight = 80, },
    ['lc_campbed'] 		        = { label = 'Camp Bed', 		      weight = 80, },
    ['lc_campcooler'] 		    = { label = 'Camp Cooler', 		      weight = 80, },
    ['lc_campgrill'] 		    = { label = 'Camp Grill', 		      weight = 80, },
    ['lc_campwood'] 		    = { label = 'Camp Firewood', 		  weight = 80, },
