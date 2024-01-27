------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
--                                                                                                        --
--                                                                                                        --
--                                                                                                        --
--					   			PLEASE, PLEASE READ CAREFULLY THE ANOTATION                               --
--					   OPEN A TICKET ON OUR DISCORD IF YOU ARE STRUGGLING WITH OUR CONFIG                 --
--                                     https://discord.gg/patamods                                        --
--                                                                                                        --
--                                                                                                        --
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------










FrameWork = "esx"    				-- qb or esx or other
Lang = "EN"          				-- Traduction are located to Lang folder.
Targetting = "OX"					-- OX or QB for ox_target or qb-target
JobManagement = "esx_society"		-- esx_society or bcs_companymanager ONLY FOR ESX


lstCat = {}                 			----------------------
lstCatType = {}							-- DON'T TOUCH THIS --
lstCatTrad = {}             			----------------------








------------------------------------------------------------------------------------------------------------
-- 						Here, you can add new categories to your Market shop.  							  --
--     If you want to add a new category, per exemple "furniture", follow the same patern:				  --
--																										  --
-- 					["furniture"]  			= "Wonderfull Fourniture",                                    --
--																										  --
-- Do not add caps/space to the first one. 		The seconde one is the name displayed in the menu INGAME. --
--                                                                                                        --
------------------------------------------------------------------------------------------------------------


CatTrad = { 

-- Category name	    -- Category name displayed Ingame

	["food"]  			      = "Food",
	["cookingingredient"]     = "Cooking Ingredient",
	["drink"]  			      = "Drink",
	["drink2"]  			   = "Drink2",
	["alcohol"]  		      = "Alcokol 1",
	["snacks"]  		      = "Snacks",
	["medical1"]  		      = "Medical 1",
	["medical2"]  		      = "Medical 2",
	["medical3"]  		      = "Medical 3",
	["equipment"]  		      = "Equipement",
	["camping"]  		      = "Camping",
	["condiments"]  	      = "Condiments",
	["fastfood"]  		      = "Fast Food",
	["cereal"] 			      = "Céréales",
	["hygieneproduct"]        = "Hygiène",
	["cleaningproduct"]       = "Entretien",
	["alcohol2"] 		      = "Alcool 2",
	["sugar1"] 			      = "Sugar1",
	["sugar2"] 			      = "Sugar2",
	["sugar3"] 			      = "Sugar3",
	["sugar4"] 			      = "sugar4",
	["sugar5"] 			      = "sugar5",
	["plant"] 			      = "Plant",
	["mechanic"] 		      = "Mechanic",
	["electronics"] 	      = "Electronics",
	["alcohol3"] 		      = "Alcool 3",
}



-----------------------
-- DO NOT TOUCH THIS --
-----------------------

function CatToTrad(cat)
	local iDX=0
	local founded = false
	for k,v in pairs(lstCat) do
		if v == cat then
			iDX = k
			founded = true
			break;
		end
	end
	if founded then
		return lstCatTrad[iDX]
	end
end









------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------- Here, you can define the props model displayed in your shelves according to your categories previously defined. --------------------------------------------------------------------							  


-- props= gz_large_cans_c						     Display 3D model of 	cans 				                in your shelve
-- props= gz_large_beers_c		                     Display 3D model of 	beers 				                in your shelve
-- props= gz_large_beers_c2                          Display 3D model of 	beers 				                in your shelve                        - another variation of beers
-- props= gz_large_chips_a	                         Display 3D model of 	chips 				                in your shelve
-- props= gz_large_latexgloves_a                     Display 3D model of 	latex gloves boxes	                in your shelve
-- props= gz_large_latexgloves_a2                    Display 3D model of 	latex gloves boxes 	                in your shelve                        - another variation of gloves boxes 
-- props= gz_large_pharma_c		                     Display 3D model of 	pharmacy's stuff 	                in your shelve
-- props= gz_large_sauces_b	                         Display 3D model of 	sauce's stuff 		                in your shelve
-- props= gz_large_noodles_d	                     Display 3D model of 	instant noodles 				    in your shelve
-- props= gz_large_cereal_b		                     Display 3D model of 	cereal boxes, soft bread, eggs 		in your shelve
-- props= gz_large_beauty_b		                     Display 3D model of 	shampoo's stuff                     in your shelve
-- props= gz_large_cleaning_b	                     Display 3D model of 	cleaning product                    in your shelve
-- props= gz_large_candy_a	                         Display 3D model of 	candy                               in your shelve
-- props= gz_large_candy_a2	                         Display 3D model of 	candy                               in your shelve						 - another variation of candy
-- props= gz_large_candy_c		               	     Display 3D model of 	candy                               in your shelve       				 - another variation of candy
-- props= gz_large_candy_d		               	     Display 3D model of 	candy                               in your shelve       				 - another variation of candy
-- props= gz_large_candy_d2		                     Display 3D model of 	candy                               in your shelve       				 - another variation of candy

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

LargeStallType = {
	["food"]  = 			{props="gz_large_cans_c",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="C"},
	["cookingingredient"]  = {props="gz_large_cans_c",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="C"},
	["alcohol"]  = 			{props="gz_large_beers_c",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="C"},
	["alcohol2"]  = 		{props="gz_large_beers_c2",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="C"},
	["snacks"]  = 			{props="gz_large_chips_a",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="A"},
	["medical1"]  = 		{props="gz_large_latexgloves_a",	offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="A"},
	["medical2"]  = 		{props="gz_large_latexgloves_a2",	offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="A"},
	["medical3"] = 			{props="gz_large_pharma_c",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="C"},
	["condiments"]  = 		{props="gz_large_sauces_b",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="B"},
	["fastfood"]  = 		{props="gz_large_noodles_d",		offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="D"},
	["cereal"] = 			{props="gz_large_cereal_b",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="B"},
	["hygieneproduct"] = 	{props="gz_large_beauty_b",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="B"},
	["cleaningproduct"] = 	{props="gz_large_cleaning_b",		offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="B"},
	["sugar1"] = 			{props="gz_large_candy_a",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="A"},
	["sugar5"] = 			{props="gz_large_candy_a2",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="A"},
	["sugar2"] = 			{props="gz_large_candy_c",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="C"},
	["sugar3"] = 			{props="gz_large_candy_d",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="D"},
	["sugar4"] = 			{props="gz_large_candy_d2",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="D"},
	["plant"] = 			{props="gz_large_cans_c",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="C"},
	["mechanic"] = 			{props="gz_large_cans_c",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="C"},
	["electronics"] = 		{props="gz_large_cans_c",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="C"},
	["equipment"]  = 		{props="gz_large_cans_c",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="C"},
	["camping"]  = 			{props="gz_large_cans_c",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="C"},
	["alcohol3"]  = 		{props="gz_large_alcohol_c",		offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="C"},
}


------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
-- Same explanation as before, but the bottles use a different shelve as others ones -- Display 3D model of cola, sprunk  ...
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

LargeBottleStallType = {
	["drink"] = {props="gz_large_bottles_b",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="B"},
	["drink2"] = {props="gz_large_bottles_b2",			offset={x=0.0,y=0.0,z=0.0,h=0.0},IsA="B"},
	
}









---------------------------------------------------------
---------------- DON'T TOUCH THIS -----------------------
---------------------------------------------------------
MediumStallType = LargeStallType										
MediumBottleStallType = LargeBottleStallType


local cpt = 0
for k,v in pairs(LargeStallType) do
	cpt = cpt + 1
	lstCat[cpt] = k
	lstCatType[cpt] = v.IsA
	lstCatTrad[cpt] = CatTrad[k]
end


for k,v in pairs(LargeBottleStallType) do	
	cpt = cpt + 1
	lstCat[cpt] = k
	lstCatType[cpt] = v.IsA
	lstCatTrad[cpt] = CatTrad[k]
end







------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 								                  	Here, you can add your available item on your Market shop.  	THEY NEED TO BE AVAILABLE IN YOUR INVENTORY SCRIPT  				                                             -----
--								                  																																						                             -----
--								                  																		                                                                                                             -----
--     							                  		If you want to add a new item, per exemple "Low Quality Soil", follow the same patern and add it in the right category:                                                      -----
--								                  																		                                                                                                             -----
--								                  																		                                                                                                             -----
-- 			{name = "Low Quality Soil",	spawnName = "lowqualsoil",                Price = 2  , 			BuyingPrice = 2,		IMG = "itemIMG/apple.png" , 		 DESC = "" , 					CAT = "food" },                  -----
--			 "YourItemDisplayName"  	  "ItemSpawnCode"                   Price Paid By Player		     Restock Price			  YourImageHERE IN .PNG		      No used right now           add the same category name         -----
--                                                                                at checkout                                  located in marketShop\html\itemIMG                                                                    -----
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ItemDESC = {
	
	["food"] = {                                                                                                                                                                  ---------------------------------------------------
		{name = "Apple",		spawnName = "apple",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/apple.png" , DESC = "" , CAT = "food" },                                                           -- ALL THE ITEM HERE ARE WORKING FOR QBCORE      --
		{name = "Banana",		spawnName = "banana",        Price = 3	, BuyingPrice = 2,	IMG = "itemIMG/banane.png", DESC = "", 	CAT = "food" },                                                           -- WE DON'T KNOW FOR ESX SO PLEASE, BE SURE      --
		{name = "Poire", 		spawnName = "poire",        Price = 2.8	, BuyingPrice = 2,	IMG = "itemIMG/poire.png" , DESC = "" , CAT = "food" },                                                           -- THAT THEY ARE ADDED TO YOUR INVENTORY ITEMS   --
		{name = "Peche", 		spawnName = "pear",        Price = 3.5	, BuyingPrice = 2,	IMG = "itemIMG/peach.png" , DESC = "" , CAT = "food" },                                                           -- 	   YOU CAN DELETE THEM IF YOU WANT         --
		{name = "Raisin",		spawnName = "grappe",        Price = 20.2, BuyingPrice = 2,	IMG = "itemIMG/raisin.png", DESC = "" , CAT = "food" },                                                           ---------------------------------------------------
		{name = "pepperoni",	spawnName = "pepperoni",        Price = 20.2, BuyingPrice = 2,	IMG = "itemIMG/pepperoni.png", DESC = "" ,CAT = "food" },
		{name = "turkey",		spawnName = "turkey",        Price = 20.2, BuyingPrice = 2,	IMG = "itemIMG/turkey.png", DESC = "" , CAT = "food" },
		{name = 'Lobster Tails',   spawnName = "lclobstertails", Price = 5, BuyingPrice = 2,	IMG = "itemIMG/turkey.png", DESC = "" , CAT = "food"},
	},        
    ["cookingingredient"] = {                                                                                                                                                                  ---------------------------------------------------

		{name = 'Lobster Tails',   spawnName = "lclobstertails", Price = 5, BuyingPrice = 2,	IMG = "itemIMG/turkey.png", DESC = "" , CAT = "cookingingredient"},
	}, 
	
	["fastfood"] = {        
		{name = "Bsfries",		spawnName = "bsfries",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/bsfries.png" , DESC = "" , CAT = "fastfood" },
		{name = "Burger",		spawnName = "burger",        Price = 3	, BuyingPrice = 2,	IMG = "itemIMG/burger.png", DESC = "", 	CAT = "fastfood" },
		{name = "Chipscheese",	spawnName = "Chipscheese",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/chipscheese.png" , DESC = "" , CAT = "fastfood" },
		{name = "Chipshabanero",spawnName = "Chipshabanero",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/chipshabanero.png" , DESC = "" , CAT = "fastfood" },
		{name = "Chipsribs",	spawnName = "Chipsribs",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/chipsribs.png" , DESC = "" , CAT = "fastfood" },
		{name = "Chipssalt",	spawnName = "Chipssalt",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/chipssalt.png" , DESC = "" , CAT = "fastfood" },
		{name = "Hotdog",		spawnName = "Hotdog",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/hotdog.png" , DESC = "" , CAT = "fastfood" },
		{name = "Ramen",		spawnName = "Ramen",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/ramen.png" , DESC = "" , CAT = "fastfood" },
		{name = "Taco",			spawnName = "Taco",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/taco.png" , DESC = "" , CAT = "fastfood" },
	},	                    
        
	["drink"] = {           
		{name = "Sprite",		spawnName = "Sprite",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/apple.png" , DESC = "" , CAT = "drink" },
		{name = "ECola",		spawnName = "cola",        Price = 3	, BuyingPrice = 2,	IMG = "itemIMG/banane.png", DESC = "",  CAT = "drink" },
		{name = "Cola Cherry", 	spawnName = "ecolacherry",        Price = 2.8	, BuyingPrice = 2,	IMG = "itemIMG/poire.png" , DESC = "" , CAT = "drink" },
		{name = "IceTea", 		spawnName = "icetea",        Price = 3.5	, BuyingPrice = 2,	IMG = "itemIMG/peach.png" , DESC = "" , CAT = "drink" },
		{name = "Fanta",		spawnName = "fanta",        Price = 20.2, BuyingPrice = 2,	IMG = "itemIMG/raisin.png", DESC = "" , CAT = "drink" },
		{name = "Water",		spawnName = "water",        Price = 3	, BuyingPrice = 2,	IMG = "itemIMG/water.png", DESC = "",  CAT = "drink" },
	},        
        
	["medical1"] = {        
		{name = "Bandage",		spawnName = "bandage",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/bandage.png" , DESC = "" , CAT = "medical1" },
		{name = "Cigarette",	spawnName = "cigarette",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/CIGARETTE.png" , DESC = "" , CAT = "medical1" },
		{name = "joint",		spawnName = "joint",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/joint.png" , DESC = "" , CAT = "medical1" },
		{name = "medikit",		spawnName = "medikit",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/medikit.png" , DESC = "" , CAT = "medical1" },
	},

	["alcohol"] = { 
		{name = "Beer",		    spawnName = "beer",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/beer.png" , DESC = "" , CAT = "alcohol" },

	},
	["alcohol3"] = {
		{name = "Beer",		    spawnName = "beer",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/beer.png" , DESC = "" , CAT = "alcohol" },

	},
	["sugar1"] = {  
		{name = "Candy",		spawnName = "candy",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/candy.png" , DESC = "" , CAT = "sugar1" },
		{name = "Donut",		spawnName = "donut",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/donut.png" , DESC = "" , CAT = "sugar1" },
	},

	["plant"] = {   
		{name = "Fertilizer",	spawnName = "fertilizer",	    Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/fertilizer.png" , DESC = "" , CAT = "plant" },
		{name = "Paperbag",		spawnName = "paperbag",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/paperbag.png" , DESC = "" , CAT = "plant" },
	},

	["mechanic"] = {
		{name = "Fixkit",		spawnName = "fixkit",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/fixkit.png" , DESC = "" , CAT = "mechanic" },
		{name = "Lockpick",		spawnName = "lockpick",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/lockpick.png" , DESC = "" , CAT = "mechanic" },
	},

	["condiments"] = {
		{name = "Mustard",		spawnName = "mustard",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/mustard.png" , DESC = "" , CAT = "condiments" },
	},

	["electronics"] = {
		{name = "Phone",		spawnName = "phone",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/phone.png" , DESC = "" , CAT = "electronics" },
		{name = "radio",		spawnName = "radio",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/radio.png" , DESC = "" , CAT = "electronics" },
		{name = "rolex",		spawnName = "rolex",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/rolex.png" , DESC = "" , CAT = "electronics" },
	},

	["cereal"] = {  
		{name = "Phone",		spawnName = "phone",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/phone.png" , DESC = "" , CAT = "electronics" },
	},
	
	-- ["snacks"] = {  
		-- {name = "Phone",		spawnName = "phone",        Price = 2   , BuyingPrice = 2,	IMG = "itemIMG/phone.png" , DESC = "" , CAT = "electronics" },
	-- },
}






-------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------
-- 								Here's you can config the Maximum amount per item put in a shelves                                             --
-- For example if you have beer in a Large Stall you can have a maximum of 100 beer, and add a lot of other item for a maximum of 100 per item --
-------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------

MaxStockMediumStall = 50
MaxStockLargeStall = 100
MaxStockFixedStall = 100
MaxStockRegularStall = 100








-------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------
-- 								Here's you can config all non configurable shelves                                                             --
-- Non configurable shelves are displayed permanently in the MLO, but you can add your item in these shelves or not                            --
-------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------

-- Clothes Shelves
NonConfigurableRegularStall[5].actif = true      -- If false, all the shelves is inactif

NonConfigurableRegularStall[5].a.actif = true    -- If false, only the A side is inactif
NonConfigurableRegularStall[5].b.actif = true    -- If false, only the B side is inactif
NonConfigurableRegularStall[5].c.actif = true    -- If false, only the C side is inactif
NonConfigurableRegularStall[5].d.actif = true    -- If false, only the D side is inactif




-- Clothes Shelves
NonConfigurableRegularStall[6].actif = true

NonConfigurableRegularStall[6].a.actif = true
NonConfigurableRegularStall[6].b.actif = true
NonConfigurableRegularStall[6].c.actif = true
NonConfigurableRegularStall[6].d.actif = true




-- hygieneproduct and books
NonConfigurableRegularStall[12].actif = true

NonConfigurableRegularStall[12].a.actif = true
NonConfigurableRegularStall[12].b.actif = true
NonConfigurableRegularStall[12].c.actif = true
NonConfigurableRegularStall[12].d.actif = true




-- books and nothing
NonConfigurableRegularStall[13].actif = true

NonConfigurableRegularStall[13].a.actif = true
NonConfigurableRegularStall[13].b.actif = true
NonConfigurableRegularStall[13].c.actif = true
NonConfigurableRegularStall[13].d.actif = true




-- guitare and misc -tv, bbq
NonConfigurableRegularStall[14].actif = true

NonConfigurableRegularStall[14].a.actif = true
NonConfigurableRegularStall[14].b.actif = true
NonConfigurableRegularStall[14].c.actif = true
NonConfigurableRegularStall[14].d.actif = true







--------------------------------------------------------------------------
--------------------------------------------------------------------------
--                          CLEANING MISSION                            --
--------------------------------------------------------------------------
--------------------------------------------------------------------------

CleaningOn = true
degradatingTime = 120      -- in Seconds, define the time between splat is created
newSplatChance = 25        -- in percent, define the chance of a new splat is created at each **degradatingTime** tick
nbSplatGenerated = 3       -- number define how simultaneous splat are generated, its a random between 1 and value specified

CleaningPrice = 5			-- The amount taken from society account and given to the player who have cleaned the splat in dollars
