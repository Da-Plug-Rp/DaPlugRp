return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 20,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 15,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 20,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 5,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 80,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 10,
	},

	['phone'] = {
		label = 'Phone',
		weight = 100,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 5,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 5,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 100,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["acyclovir"] = {
		label = "Acyclovir",
		weight = 1,
		stack = true,
		close = true,
	},

	["alive_chicken"] = {
		label = "Living chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["ammonium_nitrate"] = {
		label = "Ammonium nitrate",
		weight = 1,
		stack = true,
		close = true,
	},

	["aspirin"] = {
		label = "Aspirin",
		weight = 1,
		stack = true,
		close = true,
	},

	["azithromycin"] = {
		label = "Azithromycin",
		weight = 1,
		stack = true,
		close = true,
	},

	["bacon_double_cheeseburger"] = {
		label = "Bacon Double Cheeseburger",
		weight = 1,
		stack = true,
		close = true,
	},

	["bacon_ham_sausage"] = {
		label = "Fully Loaded Bacon Ham Sausage",
		weight = 1,
		stack = true,
		close = true,
	},

	["bacon_king"] = {
		label = "Bacon King",
		weight = 1,
		stack = true,
		close = true,
	},

	["bankcard"] = {
		label = "Bankcard",
		weight = 4,
		stack = true,
		close = true,
	},

	["big_fish"] = {
		label = "Big Fish",
		weight = 1,
		stack = true,
		close = true,
	},

	["blankcard"] = {
		label = "Blank Card",
		weight = 10,
		stack = true,
		close = true,
	},

	["blowpipe"] = {
		label = "Blowtorch",
		weight = 2,
		stack = true,
		close = true,
	},

	["bread"] = {
		label = "Bread",
		weight = 1,
		stack = true,
		close = true,
	},

	["bs_chicken_jr"] = {
		label = "Chicken Jr",
		weight = 1,
		stack = true,
		close = true,
	},

	["bs_coca_cola"] = {
		label = "Medium Coca-Cola",
		weight = 1,
		stack = true,
		close = true,
	},

	["bs_fanta_orange"] = {
		label = "Medium Fanta Orange",
		weight = 1,
		stack = true,
		close = true,
	},

	["bs_fruit_punch"] = {
		label = "Medium Hi-C Fruit Punch",
		weight = 1,
		stack = true,
		close = true,
	},

	["bs_hamburger"] = {
		label = "Hamburger",
		weight = 1,
		stack = true,
		close = true,
	},

	["bs_iced_tea"] = {
		label = "Medium Sweetened Iced Tea",
		weight = 1,
		stack = true,
		close = true,
	},

	["bs_mozzarella_sticks"] = {
		label = "Mozzarella Sticks",
		weight = 1,
		stack = true,
		close = true,
	},

	["bs_sprite"] = {
		label = "Medium Sprite",
		weight = 1,
		stack = true,
		close = true,
	},

	["bs_yello_mello"] = {
		label = "Medium Mello Yello",
		weight = 1,
		stack = true,
		close = true,
	},

	["buttermilk_biscuit"] = {
		label = "Fully Loaded Buttermilk",
		weight = 1,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
		stack = true,
		close = true,
	},

	["carbon"] = {
		label = "Carbon",
		weight = 1,
		stack = true,
		close = true,
	},

	["carokit"] = {
		label = "Body Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["carotool"] = {
		label = "Tools",
		weight = 2,
		stack = true,
		close = true,
	},

	["carplay"] = {
		label = "Carplay",
		weight = 3,
		stack = true,
		close = true,
	},

	["cheesy_tots"] = {
		label = "Cheesy Tots",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_fries"] = {
		label = "9 pc Chicken Fries",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_nuggets"] = {
		label = "Chicken Nuggets",
		weight = 1,
		stack = true,
		close = true,
	},

	["chocolate_cookie_shake"] = {
		label = "Chocolate OREO Cookie Shake",
		weight = 1,
		stack = true,
		close = true,
	},

	["clonedcard"] = {
		label = "Cloned Card",
		weight = 10,
		stack = true,
		close = true,
	},

	["clothe"] = {
		label = "Cloth",
		weight = 1,
		stack = true,
		close = true,
	},

	["cocaine"] = {
		label = "Cocaine",
		weight = 1,
		stack = true,
		close = true,
	},

	["codeine"] = {
		label = "Codeine",
		weight = 1,
		stack = true,
		close = true,
	},

	["copper"] = {
		label = "Copper",
		weight = 1,
		stack = true,
		close = true,
	},

	["covidvaccine"] = {
		label = "Covid Vaccine",
		weight = 1,
		stack = true,
		close = true,
	},

	["cutted_wood"] = {
		label = "Cut wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["deluxe_chicken_sandwich"] = {
		label = "Ch King Deluxe Chicken Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1,
		stack = true,
		close = true,
	},

	["doxycycline"] = {
		label = "Doxycycline",
		weight = 1,
		stack = true,
		close = true,
	},

	["dramamine"] = {
		label = "Dramamine",
		weight = 1,
		stack = true,
		close = true,
	},

	["drink_sprite"] = {
		label = "Sprite",
		weight = 1,
		stack = true,
		close = true,
	},

	["drug_ecstasy"] = {
		label = "Ecstasy",
		weight = 1,
		stack = true,
		close = true,
	},

	["drug_lean"] = {
		label = "Lean",
		weight = 1,
		stack = true,
		close = true,
	},

	["drug_lsd"] = {
		label = "LSD",
		weight = 1,
		stack = true,
		close = true,
	},

	["drug_meth"] = {
		label = "Meth",
		weight = 1,
		stack = true,
		close = true,
	},

	["egg_normous_burrito"] = {
		label = "Egg Normous Burrito",
		weight = 1,
		stack = true,
		close = true,
	},

	["essence"] = {
		label = "Gas",
		weight = 1,
		stack = true,
		close = true,
	},

	["fabric"] = {
		label = "Fabric",
		weight = 1,
		stack = true,
		close = true,
	},

	["fish"] = {
		label = "Fish",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixkit"] = {
		label = "Repair Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["fixtool"] = {
		label = "Repair Tools",
		weight = 2,
		stack = true,
		close = true,
	},

	["forgedcheck"] = {
		label = "Forged Check",
		weight = 10,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Gas Bottle",
		weight = 2,
		stack = true,
		close = true,
	},

	["generator"] = {
		label = "Generator",
		weight = 1,
		stack = true,
		close = true,
	},

	["gold"] = {
		label = "Gold",
		weight = 1,
		stack = true,
		close = true,
	},

	["green_gelato_cannabis"] = {
		label = "Green Gelato Cannabis",
		weight = 1,
		stack = true,
		close = true,
	},

	["ham_egg_cheese"] = {
		label = "Ham, Egg, & Cheese CroissanWich",
		weight = 1,
		stack = true,
		close = true,
	},

	["handcuffs"] = {
		label = "Handcuffs",
		weight = 1,
		stack = true,
		close = true,
	},

	["hydrogen"] = {
		label = "Hydrogen",
		weight = 1,
		stack = true,
		close = true,
	},

	["ibuprofen"] = {
		label = "Ibuprofen",
		weight = 1,
		stack = true,
		close = true,
	},

	["ice"] = {
		label = "Ice",
		weight = 1,
		stack = true,
		close = true,
	},

	["infousb"] = {
		label = "Info Usb",
		weight = 10,
		stack = true,
		close = true,
	},

	["iron"] = {
		label = "Iron",
		weight = 1,
		stack = true,
		close = true,
	},

	["jalapeno_cheddar_bites"] = {
		label = "Jalapeno Cheddar Bites",
		weight = 1,
		stack = true,
		close = true,
	},

	["joint"] = {
		label = "Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["jolly_ranchers"] = {
		label = "Jolly Ranchers",
		weight = 1,
		stack = true,
		close = true,
	},

	["laptop"] = {
		label = "Laptop",
		weight = 1,
		stack = true,
		close = true,
	},

	["laptop2"] = {
		label = "Laptop #2",
		weight = 1,
		stack = true,
		close = true,
	},

	["lccampbeans"] = {
		label = "Canned beans",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccampbutta"] = {
		label = "Butter",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccampcoffee"] = {
		label = "Coffee",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccampcorn"] = {
		label = "Ear Corn",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccampfish"] = {
		label = "Fresh Fish",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccampherbs"] = {
		label = "Wild Herbs",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccampmeat"] = {
		label = "Raw Beef",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccamppotato"] = {
		label = "Potato",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcchocolate"] = {
		label = "Chocolate Bar",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccookedbeans"] = {
		label = "Warmed Beans",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccookedcorn"] = {
		label = "Cooked Corn",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccookedfish"] = {
		label = "Cooked Fish",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccookedpotato"] = {
		label = "Cooked Potato",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccookedsteak"] = {
		label = "Grilled Steak",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcgramcrkrs"] = {
		label = "Graham Crackers",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcherbtea"] = {
		label = "Herbal Tea",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmarshmellow"] = {
		label = "Marshmellows",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcsmores"] = {
		label = "Smores",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcwater"] = {
		label = "Water",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_campbed"] = {
		label = "Camp Bed",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_campchair"] = {
		label = "Camp Chair",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_campcooler"] = {
		label = "Camp Cooler",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_campgrill"] = {
		label = "Camp Grill",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_camptent"] = {
		label = "Camp Tent",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_campwood"] = {
		label = "Camp Firewood",
		weight = 5,
		stack = true,
		close = true,
	},

	["liquid_sulfur"] = {
		label = "Liquid Sulfur",
		weight = 1,
		stack = true,
		close = true,
	},

	["loperamide"] = {
		label = "Loperamide",
		weight = 1,
		stack = true,
		close = true,
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 2,
		stack = true,
		close = true,
	},

	["medikit"] = {
		label = "Medikit",
		weight = 2,
		stack = true,
		close = true,
	},

	["muriatic_acid"] = {
		label = "Muriatic Acid",
		weight = 1,
		stack = true,
		close = true,
	},

	["nitrogen"] = {
		label = "Nitrogen",
		weight = 1,
		stack = true,
		close = true,
	},

	["opium"] = {
		label = "Opium",
		weight = 1,
		stack = true,
		close = true,
	},

	["oxygen"] = {
		label = "Oxygen",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_chicken"] = {
		label = "Chicken fillet",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_plank"] = {
		label = "Packaged wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["pancake_sausage_platter"] = {
		label = "Pancake & Sausage Platter",
		weight = 1,
		stack = true,
		close = true,
	},

	["peptobismol"] = {
		label = "Pepto-Bismol",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol"] = {
		label = "Oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol_raffin"] = {
		label = "Processed oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["pink_lemonade"] = {
		label = "Medium Hi-C Pink Lemonade",
		weight = 1,
		stack = true,
		close = true,
	},

	["printer"] = {
		label = "Printer",
		weight = 1,
		stack = true,
		close = true,
	},

	["pseudoefedrine"] = {
		label = "Pseudoefedrine",
		weight = 1,
		stack = true,
		close = true,
	},

	["red_sulfur"] = {
		label = "Red Sulfur",
		weight = 1,
		stack = true,
		close = true,
	},

	["skimmer"] = {
		label = "Skimmer",
		weight = 1,
		stack = true,
		close = true,
	},

	["slaughtered_chicken"] = {
		label = "Slaughtered chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["sodium_hydroxide"] = {
		label = "Sodium hydroxide",
		weight = 1,
		stack = true,
		close = true,
	},

	["sponge"] = {
		label = "Sponge",
		weight = 1,
		stack = true,
		close = true,
	},

	["stolencard"] = {
		label = "Stolencard",
		weight = 10,
		stack = true,
		close = true,
	},

	["stone"] = {
		label = "Stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["tylenol"] = {
		label = "Tylenol",
		weight = 1,
		stack = true,
		close = true,
	},

	["washed_stone"] = {
		label = "Washed stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["whitecheck"] = {
		label = "whitecheck",
		weight = 10,
		stack = true,
		close = true,
	},

	["whiteslip"] = {
		label = "White Slip",
		weight = 10,
		stack = true,
		close = true,
	},

	["wood"] = {
		label = "Wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["wool"] = {
		label = "Wool",
		weight = 1,
		stack = true,
		close = true,
	},
	['burger'] = {
		label = 'Hamburger',
		stack = false,
		weight = 220,
		close = true,
	},

	['chaser'] = {
		label = 'Chaser Choco Bar',
		stack = false,
		weight = 70,
		close = true,
	},

	['meteorite'] = {
		label = 'Meteorite Choco Bar',
		stack = false,
		weight = 80,
		close = true,
	},

	['hotdog'] = {
		label = 'Hotdog',
		stack = false,
		weight = 120,
		close = true,
	},

	['taco'] = {
		label = 'Taco',
		stack = false,
		weight = 100,
		close = true,
	},
	
	['piswasser'] = {
		label = 'Pißwasser',
		stack = false,
		weight = 5,
		close = true,
	},

	['mount_whiskey'] = {
		label = 'The Mount Whiskey',
		stack = false,
		weight = 7,
		close = true,
	},

	['tequila'] = {
		label = 'Tequilya',
		stack = false,
		weight = 700,
		close = true,
	},

	['nogo_vodka'] = {
		label = 'Nogo Vodka',
		stack = false,
		weight = 700,
		close = true,
	},

	['raine'] = {
		label = 'Raine Water',
		stack = false,
		weight = 500,
		close = true,
	},

	['energy_drink'] = {
		label = 'Energy drink',
		stack = false,
		weight = 5,
		close = true,
	},

	['alcotester'] = {
		label = 'Alcohol Tester',
		stack = false,
		weight = 20,
		close = true,
	},

	['sprunk'] = {
		label = 'Sprunk',
		stack = false,
		weight = 330,
		close = true,
	},

	['coffe'] = {
		label = 'Coffe',
		stack = false,
		weight = 330,
		close = true,
	},

	['cola'] = {
		label = 'Cola',
		stack = false,
		weight = 330,
		close = true,
	},


	['costa_del_perro'] = {
		label = 'Costa Del Perro',
		stack = false,
		weight = 500,
		close = true,
	},

	['rockford_hill'] = {
		label = 'Rockford Hill Reserve',
		stack = false,
		weight = 500,
		close = true,
	},

	['vinewood_red'] = {
		label = 'Vinewood Red Zinfadel',
		stack = false,
		weight = 500,
		close = true,
	},

	['vinewood_blanc'] = {
		label = 'Vinewood Sauvignon Blanc',
		stack = false,
		weight = 500,
		close = true,
	},

	['bleuterd'] = {
		label = 'Bleuterd Champagne',
		stack = false,
		weight = 700,
		close = true,
	},

	
	['shot_glass'] = {
		label = 'Glass for shot',
		stack = false,
		weight = 50,
		close = true,
	},
	
	['wine_glass'] = {
		label = 'Glass for wine',
		stack = false,
		weight = 250,
		close = true,
	},

	['flute_glass'] = {
		label = 'Glass for champagne',
		stack = false,
		weight = 250,
		close = true,
	},

	['whiskey_glass'] = {
		label = 'Glass for whiskey',
		stack = false,
		weight = 250,
		close = true,
	},
	   ----------------
    -----BurgerShot-------
    ----------------
    
       
	['bacon_double_cheeseburger'] = {
		label = 'Bacon Double Cheeseburger',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},   
	['bacon_ham_sausage'] = {
		label = 'Fully Loaded Bacon Ham Sausage',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['bacon_king'] = {
		label = 'Bacon King',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['big_fish'] = {
		label = 'Big Fish',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['bs_chicken_jr'] = {
		label = 'Chicken Jr',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['bs_hamburger'] = {
		label = 'Hamburger',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['buttermilk_biscuit'] = {
		label = 'Fully Loaded Buttermilk',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['deluxe_chicken_sandwich'] = {
		label = 'Ch King Deluxe Chicken Sandwich',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  









	['bs_mozzarella_sticks'] = {
		label = 'Mozzarella Sticks',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  
	['cheesy_tots'] = {
		label = 'Cheesy Tots',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  
	['chicken_fries'] = {
		label = '9 pc Chicken Fries',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  
	['chicken_nuggets'] = {
		label = 'Chicken Nuggets',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  
	['egg_normous_burrito'] = {
		label = 'Egg Normous Burrito',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  
	['ham_egg_cheese'] = {
		label = 'Ham, Egg, & Cheese CroissanWich',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  
	['jalapeno_cheddar_bites'] = {
		label = 'Jalapeno Cheddar Bites',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  
	['pancake_sausage_platter'] = {
		label = 'Pancake & Sausage Platter',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  





	
	
	['bs_coca_cola'] = {
		label = 'Medium Coca-Cola',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['bs_fanta_orange'] = {
		label = 'Medium Fanta Orange',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['bs_fruit_punch'] = {
		label = 'Medium Hi-C Fruit Punch',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['bs_iced_tea'] = {
		label = 'Medium Sweetened Iced Tea',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['bs_sprite'] = {
		label = 'Medium Sprite',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['bs_yello_mello'] = {
		label = 'Medium Mello Yello',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['chocolate_cookie_shake'] = {
		label = 'Chocolate OREO Cookie Shake',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['pink_lemonade'] = {
		label = 'Medium Hi-C Pink Lemonade',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	    ----------------
    -----Cannabis Cafe-------
    ----------------



    
    ['gelatti_joint'] = {
        label = 'Gelatti Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['gary_payton_joint'] = {
        label = 'Gary Payton Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cereal_milk_joint'] = {
        label = 'Cereal Milk Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cheetah_piss_joint'] = {
        label = 'Cheetah Piss Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['snow_man_joint'] = {
        label = 'Snow Man Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['georgia_pie_joint'] = {
        label = 'Georgia Pie Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['jefe_joint'] = {
        label = 'Jefe Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cake_mix_joint'] = {
        label = 'Cake Mix Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['white_runtz_joint'] = {
        label = 'White Runtz Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['blueberry_cruffin_joint'] = {
        label = 'Blueberry Cruffin Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['whitecherry_gelato_joint'] = {
        label = 'Whitecherry Gelato Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['fine_china_joint'] = {
        label = 'Fine China Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['pink_sandy_joint'] = {
        label = 'Pink Sandy Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['zushi_joint'] = {
        label = 'Zushi Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['apple_gelato_joint'] = {
        label = 'Apple Gelato Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['biscotti_joint'] = {
        label = 'Biscotti Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['collins_ave_joint'] = {
        label = 'Collins AVE Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['marathon_joint'] = {
        label = 'Marathon Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['oreoz_joint'] = {
        label = 'Oreoz Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['pirckly_pear_joint'] = {
        label = 'Pirckly Pear Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['runtz_og_joint'] = {
        label = 'Runtz OG Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['blue_tomyz_joint'] = {
        label = 'Blue Tomyz Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['ether_joint'] = {
        label = 'Ether Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['froties_joint'] = {
        label = 'Froties Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['gmo_cookies_joint'] = {
        label = 'GMO cookies Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['ice_cream_cake_pack_joint'] = {
        label = 'Ice Cream Cake Pack Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['khalifa_kush_joint'] = {
        label = 'Khalifa Kush Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['la_confidential_joint'] = {
        label = 'LA Confidential Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['marshmallow_og_joint'] = {
        label = 'Marshmallow OG Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['moon_rock_joint'] = {
        label = 'Moon Rock Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['sour_diesel_joint'] = {
        label = 'Sour Diesel Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['tahoe_og_joint'] = {
        label = 'Tahoe OG Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['gelatti'] = {
        label = 'Gelatti',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['gary_payton'] = {
        label = 'Gary Payton',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cereal_milk'] = {
        label = 'Cereal Milk',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cheetah_piss'] = {
        label = 'Cheetah Piss',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['snow_man'] = {
        label = 'Snow Man',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['georgia_pie'] = {
        label = 'Georgia Pie',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['jefe'] = {
        label = 'Jefe',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cake_mix'] = {
        label = 'Cake Mix',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['white_runtz'] = {
        label = 'White Runtz',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['whitecherry_gelato'] = {
        label = 'Whitecherry Gelato',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['blueberry_cruffin'] = {
        label = 'Blueberry Cruffin',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['fine_china'] = {
        label = 'Fine China',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['pink_sandy'] = {
        label = 'Pink Sandy',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['zushi'] = {
        label = 'Zushi',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['apple_gelato'] = {
        label = 'Apple Gelato',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['biscotti'] = {
        label = 'Biscotti',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['collins_ave'] = {
        label = 'Collins AVE',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['marathon'] = {
        label = 'Marathon',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['oreoz'] = {
        label = 'Oreoz',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['pirckly_pear'] = {
        label = 'Pirckly Pear',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['runtz_og'] = {
        label = 'Runtz OG',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['blue_tomyz'] = {
        label = 'Blue Tomyz',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['ether'] = {
        label = 'Ether',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['froties'] = {
        label = 'Froties',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['gmo_cookies'] = {
        label = 'GMO cookies',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['ice_cream_cake_pack'] = {
        label = 'Ice Cream Cake Pack',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['khalifa_kush'] = {
        label = 'Khalifa Kush',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['la_confidential'] = {
        label = 'LA Confidential',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['marshmallow_og'] = {
        label = 'Marshmallow OG',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['moon_rock'] = {
        label = 'Moon Rock',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['sour_diesel'] = {
        label = 'Sour Diesel',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['tahoe_og'] = {
        label = 'Tahoe OG',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['blueberry_jam_cookie'] = {
        label = 'Blueberry Jam Cookie',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['butter_cookie'] = {
        label = 'Butter Cookie',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cookie_craze'] = {
        label = 'Cookie Craze',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['get_figgy'] = {
        label = 'Get Figgy',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['key_lime_cookie'] = {
        label = 'Key Lime Cookie',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['marshmallow_crisp'] = {
        label = 'Marshmallow Crisp',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['no_99'] = {
        label = 'NO 99',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['paris_fog'] = {
        label = 'Paris Fog',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['pogo'] = {
        label = 'Pogo',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['pumpkin_cookie'] = {
        label = 'Pumpkin Cookie',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['shamrock_cookie'] = {
        label = 'Shamrock Cookie',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['strawberry_jam_cookie'] = {
        label = 'Strawberry Jam Cookie',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['lighter'] = {
        label = 'Lighter',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['empty_vape'] = {
        label = 'Empty Vape',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['empty_joint_pack'] = {
        label = 'Empty Joint Pack',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cutter'] = {
        label = 'Cutter',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
	    ----------------
    -----BurgerShot-------
    ----------------
    
       
	['bacon_double_cheeseburger'] = {
		label = 'Bacon Double Cheeseburger',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},   
	['bacon_ham_sausage'] = {
		label = 'Fully Loaded Bacon Ham Sausage',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['bacon_king'] = {
		label = 'Bacon King',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['big_fish'] = {
		label = 'Big Fish',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['bs_chicken_jr'] = {
		label = 'Chicken Jr',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['bs_hamburger'] = {
		label = 'Hamburger',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['buttermilk_biscuit'] = {
		label = 'Fully Loaded Buttermilk',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['deluxe_chicken_sandwich'] = {
		label = 'Ch King Deluxe Chicken Sandwich',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  









	['bs_mozzarella_sticks'] = {
		label = 'Mozzarella Sticks',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  
	['cheesy_tots'] = {
		label = 'Cheesy Tots',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  
	['chicken_fries'] = {
		label = '9 pc Chicken Fries',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  
	['chicken_nuggets'] = {
		label = 'Chicken Nuggets',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  
	['egg_normous_burrito'] = {
		label = 'Egg Normous Burrito',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  
	['ham_egg_cheese'] = {
		label = 'Ham, Egg, & Cheese CroissanWich',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  
	['jalapeno_cheddar_bites'] = {
		label = 'Jalapeno Cheddar Bites',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  
	['pancake_sausage_platter'] = {
		label = 'Pancake & Sausage Platter',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_food_bs_chips`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},  





	
	
	['bs_coca_cola'] = {
		label = 'Medium Coca-Cola',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['bs_fanta_orange'] = {
		label = 'Medium Fanta Orange',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['bs_fruit_punch'] = {
		label = 'Medium Hi-C Fruit Punch',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['bs_iced_tea'] = {
		label = 'Medium Sweetened Iced Tea',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['bs_sprite'] = {
		label = 'Medium Sprite',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['bs_yello_mello'] = {
		label = 'Medium Mello Yello',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['chocolate_cookie_shake'] = {
		label = 'Chocolate OREO Cookie Shake',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['pink_lemonade'] = {
		label = 'Medium Hi-C Pink Lemonade',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_bs_juice02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	    ----------------
    -----Cat Cafe-------
    ----------------
    
       
	['cupchocolate'] = {
		label = 'Chocolate Cup',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['cuplimao'] = {
		label = 'Limao Cup',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['cupmorango'] = {
		label = 'Morango Cup',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['gechocolate'] = {
		label = 'Chocolate Ge',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['gemorango'] = {
		label = 'Morango Ge',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['mufchocolate'] = {
		label = 'Chocolate Muf',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['panutela'] = {
		label = 'Panutela',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['paoreo'] = {
		label = 'Paoreo',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['amoras'] = {
		label = 'Amoras',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['chocolate'] = {
		label = 'Chocolate',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['graoscafe'] = {
		label = 'Graos Cafe',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['morangos'] = {
		label = 'Morangos',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['nutela'] = {
		label = 'Nutela',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['oreo'] = {
		label = 'Oreo',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['pfrango'] = {
		label = 'Pfrango',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 


	
	['btamora'] = {
		label = 'Btamora',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_energy_drink`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['btmenta'] = {
		label = 'Btmenta',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_energy_drink`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['btmorango'] = {
		label = 'Btmorango',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_energy_drink`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['mschocolate'] = {
		label = 'Ms Chocolate',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_energy_drink`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['msmorango'] = {
		label = 'Ms Morango',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_energy_drink`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	    ----------------
    -----Chick Fila-------
    ----------------
    
       
	['brown_scramble_bowl'] = {
		label = 'Brown Scramble Bowl',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},   

	['brown_scramble_burrito'] = {
		label = 'Brown Scramble Burrito',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['buttered_biscuit'] = {
		label = 'Buttered Biscuit',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['chick_fil_a_nuggets'] = {
		label = 'Chick-fil-A Nuggets',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['chick_n_minis'] = {
		label = 'Chick-n-Minis',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['chick_n_strips'] = {
		label = 'Chick-n-Strips',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['chicken_noodle_soup'] = {
		label = 'Chicken Noodle Soup',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['chocolate_chunk_cookie'] = {
		label = 'Chocolate Chunk Cookie',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['chocolate_fudge_brownie'] = {
		label = 'Chocolate Fudge Brownie',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['cobb_salad'] = {
		label = 'Cobb Salad',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['cool_wrap'] = {
		label = 'Cool Wrap',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['english_muffin'] = {
		label = 'English Muffin',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['fruit_cup'] = {
		label = 'Fruit Cup',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['greek_yogurt_parfait'] = {
		label = 'Greek Yogurt Parfait',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['grilled_nuggets'] = {
		label = 'Grilled Nuggets',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['hash_browns'] = {
		label = 'Hash Browns',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['icedream_cone'] = {
		label = 'Icedream Cone',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['icedream_cup'] = {
		label = 'Icedream Cup',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['kale_crunch_side'] = {
		label = 'Kale Crunch Side',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['mac_cheese'] = {
		label = 'Mac & Cheese',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['market_salad'] = {
		label = 'Market Salad',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['side_salad'] = {
		label = 'Side Salad',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['spicy_southwest_salad'] = {
		label = 'Spicy Southwest Salad',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['waffle_potato_chips'] = {
		label = 'Waffle Potato Chips',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 
	['waffle_potato_fries'] = {
		label = 'Waffle Potato Fries',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	}, 


	['chicken_biscuit'] = {
		label = 'Chicken Biscuit',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	}, 
	['egg_white_grill'] = {
		label = 'Egg White Grill',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	}, 
	['chicken_egg_cheese'] = {
		label = 'Chicken, Egg & Cheese Biscuit',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	}, 
	['sausage_egg_cheese'] = {
		label = 'Sausage, Egg & Cheese Biscuit',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	}, 
	['egg_cheese_muffin'] = {
		label = 'Egg & Cheese Muffin',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	}, 
	['chicken_sandwich'] = {
		label = 'Chicken Sandwich',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	}, 
	['deluxe_sandwich'] = {
		label = 'Deluxe Sandwich',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	}, 
	['chicken_club_sandwich'] = {
		label = 'Chicken Club Sandwich',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	}, 




	
	
	['apple_juice'] = {
		label = 'Honest Kids Apple Juice',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['apple_sauce'] = {
		label = 'Apple Sauce',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['brewed_iced_tea'] = {
		label = 'Brewed Iced Tea',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['chick_fil_a_lemonade'] = {
		label = 'Chick-fil-A Lemonade',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['chocolate_milk'] = {
		label = 'Chocolate Milk',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['chocolate_milkshake'] = {
		label = 'Chocolate Milkshake',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['coffee'] = {
		label = 'Coffee',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['cookies_cream_milkshake'] = {
		label = 'Cookies & Cream Milkshake',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['frosted_coffee'] = {
		label = 'Frosted Coffee',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['frosted_lemonade'] = {
		label = 'Frosted Lemonade',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['peach_milkshake'] = {
		label = 'Peach Milkshake',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['simply_orange'] = {
		label = 'Simply Orange',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['strawberry_milkshake'] = {
		label = 'Strawberry Milkshake',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['sweet_tea'] = {
		label = 'Sweet Tea',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['vanilla_milkshake'] = {
		label = 'Vanilla Milkshake',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	    ----------------
    ------KFC-------
    ----------------
    
       
	['crispy-duo-box'] = {
		label = 'Crispy Duo Box',
		description = "Deals",
		weight = 250,
		stack = true
	},

	['crunch-with-friesdrink'] = {
		label = 'Crunch Fries&drink',
		description = "Deals",
		weight = 250,
		stack = true
	},

	['family-festivle-3'] = {
		label = 'Family Festivle',
		description = "Deals",
		weight = 250,
		stack = true
	},

	['kfc-meal'] = {
		label = 'Kfc Meal',
		description = "Deals",
		weight = 250,
		stack = true
	},

	['midnight-deal'] = {
		label = 'Midnight Deal',
		description = "Deals",
		weight = 250,
		stack = true
	},

	['sharing'] = {
		label = 'Sharing',
		description = "Deals",
		weight = 250,
		stack = true
	},

	['signaturebox-deal'] = {
		label = 'Signaturebox Deal',
		description = "Deals",
		weight = 250,
		stack = true
	},

	['snacks-deal'] = {
		label = 'Snacks Deal',
		description = "Deals",
		weight = 250,
		stack = true
	},

	['twister-combo'] = {
		label = 'Cwister Combo',
		description = "Deals",
		weight = 250,
		stack = true
	},

	['zingerstack-combo'] = {
		label = 'Zingerstack Combo',
		description = "Deals",
		weight = 250,
		stack = true
	},

	



	['alacart'] = {
		label = 'Alacart',
		weight = 0, 
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},
	
	['bacon_double_cheeseburger'] = {
		label = 'Bacon Double Cheeseburger',
		weight = 0, 
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},
	
	['bacon_ham_sausage'] = {
		label = 'Bacon Ham Sausage',
		weight = 0, 
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},
	
	['bs_chicken_jr'] = {
		label = 'Chicken Jr',
		weight = 0, 
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},
	
	['bs_hamburger'] = {
		label = 'Hamburger',
		weight = 0, 
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},
	
	['chick_fil_a_nuggets'] = {
		label = 'Chicken Nuggets',
		weight = 0, 
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	
	['kfc-fries'] = {
		label = 'Kfc Fries',
		weight = 0, 
		client = {
			status = { hunger = 400000 }, 
			anim = 'eating',
            prop = { model = `ng_proc_food_aple2a`, pos = vec3(0.04, 0.01, -0.06), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	
	['sausage_burrito'] = {
		label = 'Sausage Burrito',
		weight = 0, 
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	



	
	['t_diet_pepsi'] = {
		label = 'Pepsi',
		weight = 0, 
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `v_res_tt_can02`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	
	['t_seven_up'] = {
		label = '7 UP',
		weight = 0, 
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `v_res_tt_can02`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	
	['t_tango_orange'] = {
		label = 'Tango Orange',
		weight = 0, 
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `v_res_tt_can02`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	    ----------------
    -----Mc Doland-------
    ----------------
    
       
	['big_mac'] = {
		label = 'Big Mac',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['chicken_mcnuggets'] = {
		label = 'Chicken McNuggets',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['crispy_chicken_sandwich'] = {
		label = 'Crispy Chicken Sandwich',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['double_quarter_pounder'] = {
		label = 'Double Quarter Pounder',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['egg_mcmuffin'] = {
		label = 'Egg McMuffin',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['quarter_pounder'] = {
		label = 'Quarter Pounder',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['quarter_pounder_cheese'] = {
		label = 'Quarter Pounder Cheese',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['sausage_biscuit'] = {
		label = 'Sausage Biscuit',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['sausage_burrito'] = {
		label = 'Sausage Burrito',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['spicy_crispy_chicken_sandwich'] = {
		label = 'Spicy Crispy Chicken Sandwich',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['spicy_deluxe_sandwich'] = {
		label = 'Spicy Deluxe Sandwich',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['big_mac_combo'] = {
		label = 'Big Mac Combo',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['cheeseburger_combo_meal'] = {
		label = 'Cheeseburger Combo Meal',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['deluxe_crispy_sandwich_combo'] = {
		label = 'Deluxe Crispy Sandwich Combo',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['double_quarter_combo'] = {
		label = 'Double Quarter Combo',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['egg_cheese_biscuit'] = {
		label = 'Egg Cheese Biscuit',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['mc_combo_chicken'] = {
		label = 'Combo Chicken',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['mc_nuggets_happy_meal'] = {
		label = 'McNuggets Happy Meal',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['spicy_chicken_sandwich_combo'] = {
		label = 'Spicy Chicken Sandwich Combo',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  
	['world_famous_fries'] = {
		label = 'World Famous Fries',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},  










	
	
	['hot_fudge_sundae'] = {
		label = 'Hot Fudge Sundae',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['mc_cappuccino'] = {
		label = 'Cappuccino',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['mc_diet_coke'] = {
		label = 'Diet Coke',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['mc_dr_pepper'] = {
		label = 'Dr Pepper',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['mc_fanta_orange'] = {
		label = 'Fanta Orange',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['mc_flurry_candies'] = {
		label = 'McFlurry Candies',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['mc_flurry_cookies'] = {
		label = 'McFlurry Cookies',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['mc_fruit_punch'] = {
		label = 'Fruit Punch',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['mc_hot_chocolate'] = {
		label = 'Hot Chocolate',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['mc_iced_coffee'] = {
		label = 'Iced Coffee',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['mc_iced_tea'] = {
		label = 'Iced Tea',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['mc_sprite'] = {
		label = 'Sprite',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['mc_strawberry_shake'] = {
		label = 'Strawberry Shake',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['mc_vanilla_shake'] = {
		label = 'Vanilla Shake',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['orange_juice'] = {
		label = 'Orange Juice',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['strawberry_watermelon_slushie'] = {
		label = 'Strawberry Watermelon Slushie',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['tropical_mango_slushie'] = {
		label = 'Tropical Mango Slushie',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_drink_redwine`, pos = vec3(0.05, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	    ----------------
    -----Taco-------
    ----------------
    
    
	['beefy_nacho'] = {
		label = 'Beefy Nacho',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['chalupa_supreme'] = {
		label = 'Chalupa Supreme',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['cheese_quesadilla'] = {
		label = 'Cheese Quesadilla',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['cheesy_black_bean'] = {
		label = 'Cheesy Black Bean',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['cheesy_gordita_crunch'] = {
		label = 'Cheesy Gordita Crunch',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['chicken_burrito'] = {
		label = 'Chicken Burrito',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['churros_dip'] = {
		label = 'Churros Dip',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['cinnamon_twists'] = {
		label = 'Cinnamon Twists',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['crispy_chicken_staco'] = {
		label = 'Crispy Chicken Soft Taco',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['crunchwrap_supreme'] = {
		label = 'Crunchwrap Supreme',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['crunchy_taco_supreme'] = {
		label = 'Crunchy Taco Supreme',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['crunchy_taco_supreme'] = {
		label = 'Crunchy Taco Supreme',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['crunchytaco'] = {
		label = 'Crunchy Taco',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['fishtaco'] = {
		label = 'Fish Taco',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['fries_grande'] = {
		label = 'Fries Grande',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['quesadilla'] = {
		label = 'Quesadilla',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['soft_taco'] = {
		label = 'Soft Taco',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['soft_taco_supreme'] = {
		label = 'Soft Taco Supreme',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['spicy_chicken_burrito'] = {
		label = 'Spicy Chicken Burrito',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['taco_regular'] = {
		label = 'Taco Regular',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['tacomeet'] = {
		label = 'Taco Meet',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},

	['volcano_burrito'] = {
		label = 'Volcano Burrito',
		weight = 500,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_taco_01`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			--prop = 'prop_taco_01',
			usetime = 2500,
		},
	},

	['t_diet_pepsi'] = {
		label = 'Diet Pepsi',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `v_res_tt_can02`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},

	['t_seven_up'] = {
		label = 'Seven Up',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `v_res_tt_can02`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},

	['t_tango_apple'] = {
		label = 'Tango Apple',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `v_res_tt_can02`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	
	['t_tango_orange'] = {
		label = 'Tango Orange',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `v_res_tt_can02`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	    ----------------
    --White Widow---
    ----------------



    
    ['gelatti_joint'] = {
        label = 'Gelatti Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['gary_payton_joint'] = {
        label = 'Gary Payton Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cereal_milk_joint'] = {
        label = 'Cereal Milk Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cheetah_piss_joint'] = {
        label = 'Cheetah Piss Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['snow_man_joint'] = {
        label = 'Snow Man Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['georgia_pie_joint'] = {
        label = 'Georgia Pie Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['jefe_joint'] = {
        label = 'Jefe Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cake_mix_joint'] = {
        label = 'Cake Mix Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['white_runtz_joint'] = {
        label = 'White Runtz Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['blueberry_cruffin_joint'] = {
        label = 'Blueberry Cruffin Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['whitecherry_gelato_joint'] = {
        label = 'Whitecherry Gelato Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['fine_china_joint'] = {
        label = 'Fine China Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['pink_sandy_joint'] = {
        label = 'Pink Sandy Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['zushi_joint'] = {
        label = 'Zushi Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['apple_gelato_joint'] = {
        label = 'Apple Gelato Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['biscotti_joint'] = {
        label = 'Biscotti Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['collins_ave_joint'] = {
        label = 'Collins AVE Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['marathon_joint'] = {
        label = 'Marathon Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['oreoz_joint'] = {
        label = 'Oreoz Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['pirckly_pear_joint'] = {
        label = 'Pirckly Pear Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['runtz_og_joint'] = {
        label = 'Runtz OG Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['blue_tomyz_joint'] = {
        label = 'Blue Tomyz Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['ether_joint'] = {
        label = 'Ether Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['froties_joint'] = {
        label = 'Froties Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['gmo_cookies_joint'] = {
        label = 'GMO cookies Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['ice_cream_cake_pack_joint'] = {
        label = 'Ice Cream Cake Pack Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['khalifa_kush_joint'] = {
        label = 'Khalifa Kush Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['la_confidential_joint'] = {
        label = 'LA Confidential Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['marshmallow_og_joint'] = {
        label = 'Marshmallow OG Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['moon_rock_joint'] = {
        label = 'Moon Rock Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['sour_diesel_joint'] = {
        label = 'Sour Diesel Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['tahoe_og_joint'] = {
        label = 'Tahoe OG Joint',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['gelatti'] = {
        label = 'Gelatti',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['gary_payton'] = {
        label = 'Gary Payton',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cereal_milk'] = {
        label = 'Cereal Milk',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cheetah_piss'] = {
        label = 'Cheetah Piss',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['snow_man'] = {
        label = 'Snow Man',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['georgia_pie'] = {
        label = 'Georgia Pie',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['jefe'] = {
        label = 'Jefe',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cake_mix'] = {
        label = 'Cake Mix',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['white_runtz'] = {
        label = 'White Runtz',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['whitecherry_gelato'] = {
        label = 'Whitecherry Gelato',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['blueberry_cruffin'] = {
        label = 'Blueberry Cruffin',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['fine_china'] = {
        label = 'Fine China',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['pink_sandy'] = {
        label = 'Pink Sandy',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['zushi'] = {
        label = 'Zushi',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['apple_gelato'] = {
        label = 'Apple Gelato',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['biscotti'] = {
        label = 'Biscotti',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['collins_ave'] = {
        label = 'Collins AVE',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['marathon'] = {
        label = 'Marathon',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['oreoz'] = {
        label = 'Oreoz',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['pirckly_pear'] = {
        label = 'Pirckly Pear',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['runtz_og'] = {
        label = 'Runtz OG',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['blue_tomyz'] = {
        label = 'Blue Tomyz',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['ether'] = {
        label = 'Ether',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['froties'] = {
        label = 'Froties',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['gmo_cookies'] = {
        label = 'GMO cookies',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['ice_cream_cake_pack'] = {
        label = 'Ice Cream Cake Pack',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['khalifa_kush'] = {
        label = 'Khalifa Kush',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['la_confidential'] = {
        label = 'LA Confidential',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['marshmallow_og'] = {
        label = 'Marshmallow OG',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['moon_rock'] = {
        label = 'Moon Rock',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['sour_diesel'] = {
        label = 'Sour Diesel',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['tahoe_og'] = {
        label = 'Tahoe OG',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['blueberry_jam_cookie'] = {
        label = 'Blueberry Jam Cookie',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['butter_cookie'] = {
        label = 'Butter Cookie',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cookie_craze'] = {
        label = 'Cookie Craze',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['get_figgy'] = {
        label = 'Get Figgy',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['key_lime_cookie'] = {
        label = 'Key Lime Cookie',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['marshmallow_crisp'] = {
        label = 'Marshmallow Crisp',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['no_99'] = {
        label = 'NO 99',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['paris_fog'] = {
        label = 'Paris Fog',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['pogo'] = {
        label = 'Pogo',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['pumpkin_cookie'] = {
        label = 'Pumpkin Cookie',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['shamrock_cookie'] = {
        label = 'Shamrock Cookie',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['strawberry_jam_cookie'] = {
        label = 'Strawberry Jam Cookie',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['lighter'] = {
        label = 'Lighter',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['empty_vape'] = {
        label = 'Empty Vape',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['empty_joint_pack'] = {
        label = 'Empty Joint Pack',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
    ['cutter'] = {
        label = 'Cutter',
        weight = 1,
        stack = true,
        close = true,
        description = "0"
    },
	['blankcard'] = {
		label = 'blank card',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['infousb'] = {
		label = 'info usb',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},
    
    ['clonedcard'] = {
		label = 'cloned card',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

    ['stolencard'] = {
		label = 'stolencard',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

    ['generator'] = {
		label = 'generator',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

    ['laptop2'] = {
		label = 'laptop #2',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

    ['printer'] = {
		label = 'printer',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['skimmer'] = {
		label = 'skimmer',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

    ['whiteslip'] = {
		label = 'white slip',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

    ['forgedcheck'] = {
		label = 'forged check',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},
	['bahama_mug'] 			= { label = 'Empty Mug', 		weight = 80, },
	['bahama_glass'] 		= { label = 'Empty Glass', 		weight = 80, },
	['bahama_shotglass'] 	= { label = 'Shot Glass', 		weight = 80, },
	['bahama_whiskey'] 		= { label = 'Whiskey', 			weight = 80, },
	['bahama_tequila'] 		= { label = 'Tequila', 			weight = 80, },
	['bahama_vodka'] 		= { label = 'Vodka', 			weight = 80, },
	['bahama_rum'] 			= { label = 'Rum', 				weight = 80, },
	['bahama_gin'] 			= { label = 'Gin', 				weight = 80, },
	['bahama_cachaca'] 		= { label = 'Cachaca', 			weight = 80, },
	['bahama_curacao'] 		= { label = 'Curacao', 			weight = 80, },
	['bahama_champagne'] 	= { label = 'Champagne', 		weight = 80, },
	['bahama_strawberry'] 	= { label = 'Strawberry', 		weight = 80, },
	['bahama_lime'] 		= { label = 'Lime', 			weight = 80, },
	['bahama_pineapple'] 	= { label = 'Pineapples', 		weight = 80, },
	['bahama_cranjuice'] 	= { label = 'Cranberry Juice', 	weight = 80, },
	['bahama_ojuice'] 		= { label = 'Orange Juice', 	weight = 80, },
	['bahama_coffee']	 	= { label = 'Coffee', 			weight = 80, },
	['bahama_sugarcube'] 	= { label = 'Sugar Cubes', 		weight = 80, },
	['bahama_icecube'] 		= { label = 'Ice Cubes', 		weight = 80, },
	['bahama_jello'] 		= { label = 'Jello Mix', 		weight = 80, },
	['bahama_ccheese'] 		= { label = 'Cream Cheese', 	weight = 80, },
	['bahama_mango'] 		= { label = 'Mango', 			weight = 80, },
	['bahama_cheddar'] 		= { label = 'Cheddar', 			weight = 80, },
	['bahama_rawwing'] 		= { label = 'Raw Wings', 		weight = 80, },
	['bahama_seasoning'] 	= { label = 'Seasoning', 		weight = 80, },
	['bahama_chips'] 		= { label = 'Tortilla Chips', 	weight = 80, },
	['bahama_beef'] 		= { label = 'Beef', 			weight = 80, },
	['bahama_avocado'] 		= { label = 'Avocado', 			weight = 80, },
	['bahama_peppers'] 		= { label = 'Peppers', 			weight = 80, },
	['bahama_bbq'] 			= { label = 'BBQ Sauce', 		weight = 80, },
	['bahama_shrimp'] 		= { label = 'Raw Shrimp', 		weight = 80, },
	['bahama_rawchik'] 		= { label = 'Raw Chicken', 		weight = 80, },
	['bahama_eggs'] 		= { label = 'Fresh Eggs', 		weight = 80, },
	['bahama_bredcrum'] 	= { label = 'Breadcrumbs', 		weight = 80, },
	['bahama_butter']		= { label = 'Butter', 			weight = 80, },

	-- Bahama Mama's Drink Items
	['bm_oldfashion'] 		= { label = 'Old Fashioned', 	weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_drink_whisky`, 	pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drank an Old Fashioned Whiskey!' } },
	['bm_pinacolada'] 		= { label = 'Pina Colada', 		weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_pinacolada`, 		pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drunk a Pina Colada!' } },
	['bm_cosmopolitan'] 	= { label = 'Cosmopolitan', 	weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_daiquiri`, 		pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drunk a Cosmopolitan!' } },
	['bm_daiquiri'] 		= { label = 'Daiquiri', 		weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_daiquiri`, 		pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drunk a Daiquiri!' } },
	['bm_martini'] 			= { label = 'Martini', 			weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_tequila`, 			pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drunk a Martini!' } },
	['bm_kahlua'] 			= { label = 'Kahlua', 			weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_tequila`, 			pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drunk a Kahlua!' } },
	['bm_mimosa'] 			= { label = 'Mimosa', 			weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_cocktail`, 		pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drunk a Mimosa!' } },
	['bm_whiskeysour'] 		= { label = 'Whiskey Sour', 	weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_drink_whisky`, 	pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You qdrunk a Whiskey Sour!' } }, 
	['bm_bluelagoon'] 		= { label = 'Blue Lagoon', 		weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_mojito`, 			pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You drunk a Blue Lagoon!' } },
	['bm_budlite'] 			    = { label = 'Bud Lite', 		weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_pint_glass_01`, 	pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You quenched your thirst with a Bud Lite!' } },
	['bm_millerlite'] 		    = { label = 'Miller Lite', 		weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_pint_glass_01`, 	pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You quenched your thirst with a Miller Lite!' } },
	['bm_coorslite'] 		    = { label = 'BCoors Lite', 		weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_pint_glass_01`, 	pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You quenched your thirst with Coors Lite!'} },
	['bm_corona'] 			    = { label = 'Corona',	 		weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' }, 		prop = { bone = 28422, model = `prop_pint_glass_01`, 	pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) }, 		usetime = math.random(3000, 5000), notification = 'You quenched your thirst with cola' } },
	['bm_tequilashot'] 		    = { label = 'Tequila Shot', 	weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'mp_player_intdrink', 							clip = 'loop_bottle' }, prop = { bone = 18905, model = `p_cs_shot_glass_2_s`, 	pos = vec3(0.12, 0.008, 0.03), 	rot = vec3(240.0, -60.0, 0.0) },	usetime = math.random(3000, 5000), notification = 'You took a shot of Tequila!' } }, 
	['bm_whiskeyshot'] 		    = { label = 'Whiskey Shot', 	weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'mp_player_intdrink', 							clip = 'loop_bottle' }, prop = { bone = 18905, model = `p_cs_shot_glass_2_s`, 	pos = vec3(0.12, 0.008, 0.03), 	rot = vec3(240.0, -60.0, 0.0) }, 	usetime = math.random(3000, 5000), notification = 'You took a shot of Whiskey!' } },
	['bm_seabreezeshot'] 	    = { label = 'Seabreeze Shot', 	weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'mp_player_intdrink', 							clip = 'loop_bottle' }, prop = { bone = 18905, model = `p_cs_shot_glass_2_s`, 	pos = vec3(0.12, 0.008, 0.03), 	rot = vec3(240.0, -60.0, 0.0) }, 	usetime = math.random(3000, 5000), notification = 'You drank a shot of Sea Breeze!' } },
	['bm_caipirinhashot'] 	    = { label = 'Caipirinha Shot', 	weight = 80, 		client = { status = { thirst = 200000 }, anim = { dict = 'mp_player_intdrink', 							clip = 'loop_bottle' }, prop = { bone = 18905, model = `p_cs_shot_glass_2_s`, 	pos = vec3(0.12, 0.008, 0.03), 	rot = vec3(240.0, -60.0, 0.0) }, 	usetime = math.random(3000, 5000), notification = 'You drank a Caipirinha Shot!' } }, 
    ['bm_jelloshot']            = { label = 'Jello Shot', 		weight = 80,        client = { status = { thirst = 200000 }, anim = { dict = 'mp_player_intdrink', 							clip = 'loop_bottle' }, prop = { bone = 18905, model = `p_cs_shot_glass_2_s`, 	pos = vec3(0.12, 0.008, 0.03), 	rot = vec3(240.0, -60.0, 0.0) }, 	usetime = math.random(3000, 5000), notification = 'You drank a Jello Shot!' } },
	
	-- Bahama Mama's Food Items
	['bm_wings'] 			    = { label = 'Jerk Chicken Wings', 	  weight = 80, 	client = { status = { hunger = 200000 }, anim = 'eating', prop = 'burger', usetime = math.random(3000, 5000), notification = 'You ate delicious Jerk Chicken Wings' } },
	['bm_rissole'] 			    = { label = 'Chicken Rissole', 		  weight = 80, 	client = { status = { hunger = 200000 }, anim = 'eating', prop = 'burger', usetime = math.random(3000, 5000), notification = 'You ate delicious Chicken Rissole' } },
	['bm_mgocake'] 			    = { label = 'Mango Cheesecake', 	  weight = 80, 	client = { status = { hunger = 200000 }, anim = 'eating', prop = 'burger', usetime = math.random(3000, 5000), notification = 'You ate a delicious Mango Cheesecake' } },
	['bm_caridea'] 			    = { label = 'Shrimp Caridean', 		  weight = 80, 	client = { status = { hunger = 200000 }, anim = 'eating', prop = 'burger', usetime = math.random(3000, 5000), notification = 'You ate delicious Shrimp Caridean' } },
	['bm_kebab'] 			    = { label = 'BBQ Beef Kebab', 		  weight = 80, 	client = { status = { hunger = 200000 }, anim = 'eating', prop = 'burger', usetime = math.random(3000, 5000), notification = 'You ate a delicious BBQ Beef Kebab' } },
	['bm_nachos'] 			    = { label = 'Guac Nachos', 			  weight = 80, 	client = { status = { hunger = 200000 }, anim = 'eating', prop = 'burger', usetime = math.random(3000, 5000), notification = 'You ate some delicious Guacamole Nachos' } },
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
	['turbo'] = { label = 'Turbo', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['headlights'] = { label = 'Headlights', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['coilovers'] = { label = 'Coilovers', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['coilover_wrenches'] = { label = 'Coilover Wrenches', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['hid_controller'] = { label = 'Hid Controller', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['underglow_controller'] = { label = 'Underglow Controller', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['tint_supplies'] = { label = 'Tint Supplies', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['engine0'] = { label = 'Engine 0', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['engine1'] = { label = 'Engine 1', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['engine2'] = { label = 'Engine 2', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['engine3'] = { label = 'Engine 3', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['engine4'] = { label = 'Engine 4', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['brake0'] = { label = 'Brake 0', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['brake1'] = { label = 'Brake 1', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['brake2'] = { label = 'Brake 2', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['brake3'] = { label = 'Brake 3', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['transmission0'] = { label = 'Transmission 0', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['transmission1'] = { label = 'Transmission 1', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['transmission2'] = { label = 'Transmission 2', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['transmission3'] = { label = 'Transmission 3', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['blackwrap'] = { label = 'Black Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['graywrap'] = { label = 'Gray Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['redwrap'] = { label = 'Red Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['orangewrap'] = { label = 'Orange Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['goldenwrap'] = { label = 'Golden Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['yellowwrap'] = { label = 'Yellow Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['bluewrap'] = { label = 'Blue Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['bronzewrap'] = { label = 'Bronze Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['brownwrap'] = { label = 'Brown Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['whitewrap'] = { label = 'White Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['pinkwrap'] = { label = 'Pink Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['pink2wrap'] = { label = 'Pink 2 Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['purplewrap'] = { label = 'Purple Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['greenwrap'] = { label = 'Green Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['bluewhiteplate'] = { label = 'Blue White Plate', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['yellowblackplate'] = { label = 'Yellow Black Plate', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['yellowblueplate'] = { label = 'Yellow Blue Plate', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['bluewhite2plate'] = { label = 'Blue White Plate', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['bluewhite3plate'] = { label = 'Blue White Plate', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['diagnosismachine'] = { label = 'Diagnostic Machine', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['airsuspension'] = { label = 'Air Suspension', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['mechaniccamera'] = { label = 'Mechanic Camera', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['nitrous'] = { label = 'Nitrous', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['emptynitrous'] = { label = 'Empty Nitrous', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['tire'] = { label = 'Tire', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['drift_tires'] = { label = 'Drift Tires', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['normal_tires'] = { label = 'Normal Tires', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['repairkit'] = { label = 'Repair Kit', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['advancedrepairkit'] = { label = 'Advanced Repair Kit', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['cleaningkit'] = { label = 'Cleaning Kit', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['metalscrap'] = { label = 'Metalscrap', weight = 50, stack = true, allowArmed = false },
    ['steel'] = { label = 'Steel', weight = 50, stack = true, allowArmed = false },
    ['glass'] = { label = 'Glass', weight = 50, stack = true, allowArmed = false },
    ['rubber'] = { label = 'rubber', weight = 50, stack = true, allowArmed = false },
	['lclobstertails'] 		    = { label = 'Frozen Lobster Tails', 		weight = 80,    stack = true,   close = true,   description = '', },
	['lcbutter'] 	            = { label = 'Stick of Butter', 		        weight = 80,    stack = true,   close = true,   description = '', },
	['lcpbutter'] 		        = { label = 'Peanut Butter', 			    weight = 80,    stack = true,   close = true,   description = '', },
	['lclemon'] 		        = { label = 'Fresh Lemon', 			        weight = 80,    stack = true,   close = true,   description = '', },
	['lcbeefpatty'] 		    = { label = 'Raw Beef Patty', 			    weight = 80,    stack = true,   close = true,   description = '', },
	['lcburgerbun'] 			= { label = 'Burger Bun', 				    weight = 80,    stack = true,   close = true,   description = '', },
	['lccheese'] 			    = { label = 'Cheddar Cheese', 				weight = 80,    stack = true,   close = true,   description = '', },
	['lcsausage'] 		        = { label = 'Sausage Pack', 			    weight = 80,    stack = true,   close = true,   description = '', },
	['lcbread'] 		        = { label = 'Fresh Bread', 			        weight = 80,    stack = true,   close = true,   description = '', },
	['lcveggiepack'] 	        = { label = 'Fresh Veggies', 		        weight = 80,    stack = true,   close = true,   description = '', },
	['lcdryrice'] 	            = { label = 'Bag of Rice', 		            weight = 80,    stack = true,   close = true,   description = '', },
	['lcmaccheese'] 		    = { label = 'Frozen Mac N Cheese', 			weight = 80,    stack = true,   close = true,   description = '', },
	['lcpancakes'] 	            = { label = 'Frozen Pancakes', 		        weight = 80,    stack = true,   close = true,   description = '', },
	['lcsyrup'] 	            = { label = 'Pancake Syrup', 	            weight = 80,    stack = true,   close = true,   description = '', },
	['lcramenpack'] 		    = { label = 'Ramen Pack', 	                weight = 80,    stack = true,   close = true,   description = '', },
	['lcfrozenpizza']	 	    = { label = 'Frozen Pizza', 			    weight = 80,    stack = true,   close = true,   description = '', },
	['lcgrapes'] 	            = { label = 'Fresh Grapes', 		        weight = 80,    stack = true,   close = true,   description = '', },
	['lcsugar'] 		        = { label = 'Sugar', 		                weight = 80,    stack = true,   close = true,   description = '', },
	['lcapple'] 		        = { label = 'Fresh Apple', 		            weight = 80,    stack = true,   close = true,   description = '', },
	['lcorange'] 		        = { label = 'Fresh Orange', 	            weight = 80,    stack = true,   close = true,   description = '', },
	['lcbanana'] 		        = { label = 'Ripe Banana', 			        weight = 80,    stack = true,   close = true,   description = '', },
	['lcicecubes'] 		        = { label = 'Cubed Ice', 			        weight = 80,    stack = true,   close = true,   description = '', },
	['lcmilk'] 		            = { label = 'Milk Carton', 		            weight = 80,    stack = true,   close = true,   description = '', },
	['lcstrawberry'] 	        = { label = 'Fresh Strawberry', 		    weight = 80,    stack = true,   close = true,   description = '', },
	['lcteabag'] 		        = { label = 'Tea Bag', 	                    weight = 80,    stack = true,   close = true,   description = '', },
	['lccoffeepod'] 		    = { label = 'Coffee Pod', 			        weight = 80,    stack = true,   close = true,   description = '', },
	['lcgteapod'] 		        = { label = 'Green Tea Pod', 			    weight = 80,    stack = true,   close = true,   description = '', },
	['lcrawribs'] 		        = { label = 'Raw Pork Ribs', 			    weight = 80,    stack = true,   close = true,   description = '', },
	['lcbbqsauce'] 			    = { label = 'BBQ Sauce', 		            weight = 80,    stack = true,   close = true,   description = '', },
	['lcrawchicken'] 		    = { label = 'Raw Leg Quarter', 		        weight = 80,    stack = true,   close = true,   description = '', },
	['lcrawbeef'] 		        = { label = 'Raw Steak Beef', 		        weight = 80,    stack = true,   close = true,   description = '', },
	['lccorncob'] 		        = { label = 'Ear of Corn', 		            weight = 80,    stack = true,   close = true,   description = '', },
	['lcptartpk'] 	            = { label = 'Poptart Pack', 		        weight = 80,    stack = true,   close = true,   description = '', },
	['lcicing']		            = { label = 'Poptart Icing', 			    weight = 80,    stack = true,   close = true,   description = '', },
    ['lcfrozewaff'] 		    = { label = 'Frozen Waffles', 			    weight = 80,    stack = true,   close = true,   description = '', },
	['lchamslice'] 		        = { label = 'Slice of Ham', 			    weight = 80,    stack = true,   close = true,   description = '', },
	['lcflour'] 			    = { label = 'Bag of Flour', 				weight = 80,    stack = true,   close = true,   description = '', },
	['lcvegoil'] 			    = { label = 'Vegetable Oil', 				weight = 80,    stack = true,   close = true,   description = '', },
	['lccheestkpk'] 		    = { label = 'Frozen Cheesesticks', 			weight = 80,    stack = true,   close = true,   description = '', },
	['lcmarinara'] 		        = { label = 'Marinara Sauce', 			    weight = 80,    stack = true,   close = true,   description = '', },
	['lcpotato'] 	            = { label = 'Fresh Potatos', 		        weight = 80,    stack = true,   close = true,   description = '', },
	['lcrawchops'] 	            = { label = 'Raw Lamb Chops', 		        weight = 80,    stack = true,   close = true,   description = '', },
	['lcrawfish'] 		        = { label = 'Raw Fish', 			        weight = 80,    stack = true,   close = true,   description = '', },
	['lcrawsalmon'] 	        = { label = 'Raw Salmon', 		            weight = 80,    stack = true,   close = true,   description = '', },
	['lcbeefstrips'] 	        = { label = 'Raw Beef Strip', 	            weight = 80,    stack = true,   close = true,   description = '', },
	['lcrawbreast'] 		    = { label = 'Raw Chicken Breast', 	        weight = 80,    stack = true,   close = true,   description = '', },
	['lccocoapod']	 	        = { label = 'Cocoa Pod', 			        weight = 80,    stack = true,   close = true,   description = '', },
	['lcvaniwafers'] 	        = { label = 'Vanilla Wafers', 		        weight = 80,    stack = true,   close = true,   description = '', },
	['lcpudding'] 		        = { label = 'Vanilla Pudding', 		        weight = 80,    stack = true,   close = true,   description = '', },
	['lcseasoning'] 		    = { label = 'Seasonings', 		            weight = 80,    stack = true,   close = true,   description = '', },
	['lcrawoxtail'] 		    = { label = 'Raw Ox Tails', 	            weight = 80,    stack = true,   close = true,   description = '', },
	['lccreamer'] 		        = { label = 'Coffee Cream', 			    weight = 80,    stack = true,   close = true,   description = '', },
	['water_jug'] 		        = { label = 'Water Jug', 			    	weight = 80,    stack = true,   close = true,   description = '', },
    ['lcjelly'] 		        = { label = 'Grape Jelly', 			        weight = 80,    stack = true,   close = true,   description = '', },
    ['lcegg'] 		            = { label = 'Fresh Egg', 			        weight = 80,    stack = true,   close = true,   description = '', },
    ['lccanbeans'] 		        = { label = 'Canned Beans', 			    weight = 80,    stack = true,   close = true,   description = '', },
    ['lccansoup'] 		        = { label = 'Canned Soup', 			        weight = 80,    stack = true,   close = true,   description = '', },
    ['lcglassjar'] 		        = { label = 'Glass Jar', 		            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcaluminum'] 		        = { label = 'Metal Parts', 		            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcsteelcan'] 		        = { label = 'Steel Can', 		            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcstyrofoam'] 		    = { label = 'Styrofoam', 		            weight = 80,    stack = true,   close = true,   description = '', },
	['lcmshine_melon'] 		    = { label = 'Melon', 		        		weight = 80,    stack = true,   close = true,   description = '', },
	['lcmshine_coffebean'] 		= { label = 'Coffee Bean', 		        	weight = 80,    stack = true,   close = true,   description = '', },
	['lcmshine_strawberry'] 	= { label = 'Strawberry', 		        	weight = 80,    stack = true,   close = true,   description = '', },
	['lcmshine_sugar'] 		    = { label = 'Brown Sugar', 		        	weight = 80,    stack = true,   close = true,   description = '', },
	['lcmshine_corn'] 		    = { label = 'Corn', 		        		weight = 80,    stack = true,   close = true,   description = '', },
	['lcmshine_yeast'] 		    = { label = 'Yeast', 		        		weight = 80,    stack = true,   close = true,   description = '', },
	['lcmshine_blkberry'] 		= { label = 'Blackberry', 		        	weight = 80,    stack = true,   close = true,   description = '', },
	['lcmshine_mash'] 		    = { label = 'Mash', 		        		weight = 80,    stack = true,   close = true,   description = '', },
    ['lccanpeas']               = { label = 'Canned Peas', 		            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcpeppers']               = { label = 'Fresh Peppers', 		        weight = 80,    stack = true,   close = true,   description = '', },
    ['lcrawshrimp']             = { label = 'Raw Shrimp', 		            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcrawgoat']               = { label = 'Goat Meat', 		            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcplantain']              = { label = 'Plantain', 		            weight = 80,    stack = true,   close = true,   description = '', },

 
    -- Let's Cook! Edible Items:
    ['lclemonlobster'] 			= { label = 'Lemony Lobster Tails', 	    weight = 80,    stack = true,   close = true,   description = '', },
    ['lccheeseburger'] 			= { label = 'Cheese Burger', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcsausagedog'] 			= { label = 'Sausage Dog', 	                weight = 80,    stack = true,   close = true,   description = '', },
    ['lcgumbo'] 			    = { label = 'Gumbo', 	                    weight = 80,    stack = true,   close = true,   description = '', },
    ['lcoxtails'] 			    = { label = 'Oxtails n Rice', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcmaccheesy'] 			= { label = 'Mac n Cheesy', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lchotcakes'] 			    = { label = 'Hot Cakes', 	                weight = 80,    stack = true,   close = true,   description = '', },
    ['lcricebowl'] 			    = { label = 'Rice Bowl', 	                weight = 80,    stack = true,   close = true,   description = '', },
    ['lcramennoodle'] 			= { label = 'Ramen Noodles', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcquickpizza'] 			= { label = 'Pepperoni Pizza', 	            weight = 80,    stack = true,   close = true,   description = '', }, 
    ['lcribs'] 			        = { label = 'BBQ Ribs', 	                weight = 80,    stack = true,   close = true,   description = '', },
    ['lclegquarter'] 			= { label = 'BBQ Chicken', 	                weight = 80,    stack = true,   close = true,   description = '', },
    ['lcsteak'] 			    = { label = 'Grilled Steak', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcgrillcorn'] 			= { label = 'Grilled Corn', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcgrillveggies'] 			= { label = 'Grilled Veggies', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lctoast'] 			    = { label = 'Toasted PB & J', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcpoptart'] 			    = { label = 'Iced Poptart', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcwaffle'] 			    = { label = 'Insta Waffle', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lctoasti'] 			    = { label = 'Cheese Toasti', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lchamtoastie'] 			= { label = 'Ham Toasti', 	                weight = 80,    stack = true,   close = true,   description = '', },
    ['lcfriedchicken'] 			= { label = 'Fried Chicken', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lccheesesticks'] 			= { label = 'Cheese Sticks', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcfrenchfries'] 			= { label = 'Home Fries', 	                weight = 80,    stack = true,   close = true,   description = '', },
    ['lclambchops'] 			= { label = 'Fried Chops', 	                weight = 80,    stack = true,   close = true,   description = '', },
    ['lcfriedfish'] 			= { label = 'Fried Fish', 	                weight = 80,    stack = true,   close = true,   description = '', },
    ['lcsalmon'] 			    = { label = 'Seered Salmon', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcbstirfry'] 			    = { label = 'Beef Stir Fry', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcchickensand'] 			= { label = 'Chicken Sandwich', 	        weight = 80,    stack = true,   close = true,   description = '', },
    ['lcbffriedrice'] 			= { label = 'Beef Fried Rice', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcckfriedrice'] 			= { label = 'Chicken Fried Rice', 	        weight = 80,    stack = true,   close = true,   description = '', },
    ['lcapplesauce'] 			= { label = 'Apple Sauce', 	                weight = 80,    stack = true,   close = true,   description = '', },
    ['lcnanacream'] 			= { label = 'Banana Split', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcberrycream'] 			= { label = 'Strawberry Icecream', 	        weight = 80,    stack = true,   close = true,   description = '', },
    ['lcchoccream'] 			= { label = 'Chocolate Icecream', 	        weight = 80,    stack = true,   close = true,   description = '', },
    ['lcbpudding'] 			    = { label = 'Banana Pudding', 	            weight = 80,    stack = true,   close = true,   description = '', },
    ['lceggsandwich'] 		    = { label = 'Egg Sandwich', 			    weight = 80,    stack = true,   close = true,   description = '', },
    ['lcbakedbeans'] 		    = { label = 'Baked Beans', 			        weight = 80,    stack = true,   close = true,   description = '', },
    ['lcsoupbowl'] 		        = { label = 'Soup', 			            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcpepshrimp']             = { label = 'Pepper Shrimp Plantain', 	    weight = 80,    stack = true,   close = true,   description = '', },
    ['lccurrgoat']              = { label = 'Curry Goat Bowl', 		        weight = 80,    stack = true,   close = true,   description = '', },
    ['lcricepeas']              = { label = 'Rice Peas Bowl', 		        weight = 80,    stack = true,   close = true,   description = '', },
    ['lcyellrice']              = { label = 'Yellow Rice Bowl', 		    weight = 80,    stack = true,   close = true,   description = '', },

    -- Let's Cook! Drinkable Items:
    ['lcgrapejuice']            = { label = 'Grape Juice', 				    weight = 80,    stack = true,   close = true,   description = '', },
    ['lcapplejuice']            = { label = 'Apple Juice', 		            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcorangejuice']           = { label = 'Orange Juice', 		        weight = 80,    stack = true,   close = true,   description = '', },
    ['lcnanasmoothie']          = { label = 'Banana Smoothie', 		        weight = 80,    stack = true,   close = true,   description = '', },
    ['lcberrysmoothie']         = { label = 'Berry Smoothie', 		        weight = 80,    stack = true,   close = true,   description = '', },
    ['lccuptea']                = { label = 'Glass of Tea', 		        weight = 80,    stack = true,   close = true,   description = '', },
    ['lccupcoffee']             = { label = 'Cup of Coffee', 		        weight = 80,    stack = true,   close = true,   description = '', },
    ['lchotcocoa']              = { label = 'Hot Cocoa', 		            weight = 80,    stack = true,   close = true,   description = '', },
    ['lcgreentea']              = { label = 'Green Tea', 		            weight = 80,    stack = true,   close = true,   description = '', },
    ['lccappucino']             = { label = 'Cappucino Expresso', 		    weight = 80,    stack = true,   close = true,   description = '', },
	['lcwhite_lighting']        = { label = 'White Lightnin Moonshine', 	weight = 80,    stack = true,   close = true,   description = '', },
    ['lcsour_watermelon']       = { label = 'Sour Watermelon Moonshine', 	weight = 80,    stack = true,   close = true,   description = '', },
    ['lcmountain_java']         = { label = 'Mountain Java Moonshine', 		weight = 80,    stack = true,   close = true,   description = '', },
    ['lcstrawberry_shine']      = { label = 'Strawberry Moonshine', 		weight = 80,    stack = true,   close = true,   description = '', },
    ['lcblkberry_shine']        = { label = 'Blackberry Moonshine', 		weight = 80,    stack = true,   close = true,   description = '', },

    --- Let's Cook Props
    ['lc_hobo'] 		        = { label = 'Hobo Stove', 			        weight = 80,    stack = false,   close = true,   description = '', },
	['lc_grill'] 		        = { label = 'BBQ Grill', 			        weight = 80,    stack = false,   close = true,   description = '', },
	['lc_microwave'] 		    = { label = 'Microwave', 		            weight = 80,    stack = false,   close = true,   description = '', },
	['lc_juicer'] 	            = { label = 'Juicer', 		                weight = 80,    stack = false,   close = true,   description = '', },
	['lc_coffee'] 		        = { label = 'Coffee Maker', 	            weight = 80,    stack = false,   close = true,   description = '', },
	['lc_griddle'] 		        = { label = 'Griddle', 			            weight = 80,    stack = false,   close = true,   description = '', },
	['lc_processor'] 		    = { label = 'Food Processor', 			    weight = 80,    stack = false,   close = true,   description = '', },
	['lc_toaster'] 		        = { label = 'Toaster', 			            weight = 80,    stack = false,   close = true,   description = '', },
	['lc_fryer'] 			    = { label = 'Copper Pot', 		            weight = 80,    stack = false,   close = true,   description = '', },
	['lc_table'] 		        = { label = 'Prep Table', 		            weight = 80,    stack = false,   close = true,   description = '', },
    ['lc_printer'] 		        = { label = 'Printer', 		                weight = 80,    stack = false,   close = true,   description = '', },
    ['lc_partybox'] 		    = { label = 'Party Box', 		            weight = 80,    stack = false,   close = true,   description = '', },
    ['lc_stove'] 		        = { label = 'Stove', 		                weight = 80,    stack = false,   close = true,   description = '', },
	['lc_chair'] 		        = { label = 'Chair', 			            weight = 80,    stack = false,   close = true,   description = '', },
	['lc_gazebo'] 			    = { label = 'Gazebo', 		            	weight = 80,    stack = false,   close = true,   description = '', },
	['lc_still'] 		        = { label = 'Moonshine Still', 		        weight = 80,    stack = false,   close = true,   description = '', },
    ['lc_weapbench'] 		    = { label = 'Weapons Bench', 		        weight = 80,    stack = false,   close = true,   description = '', },
    ['lc_attabench'] 		    = { label = 'Attachments Bench', 		    weight = 80,    stack = false,   close = true,   description = '', },
    ['lc_ammobench'] 		    = { label = 'Ammo Bench', 		            weight = 80,    stack = false,   close = true,   description = '', },

	["classic_phone"] = {
		["name"] = "classic_phone",
		["label"] = "Classic Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "classic_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
	},
	
	["black_phone"] = {
		["name"] = "black_phone",
		["label"] = "Black Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "black_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
	},
	
	["blue_phone"] = {
		["name"] = "blue_phone",
		["label"] = "Blue Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "blue_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
	},
	
	["gold_phone"] = {
		["name"] = "gold_phone",
		["label"] = "Gold Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "gold_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
	},
	
	["red_phone"] = {
		["name"] = "red_phone",
		["label"] = "Red Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "red_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
	},
	
	["green_phone"] = {
		["name"] = "green_phone",
		["label"] = "Green Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "green_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
	},
	
	["greenlight_phone"] = {
		["name"] = "greenlight_phone",
		["label"] = "Green Light Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "greenlight_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
	},
	
	["pink_phone"] = {
		["name"] = "pink_phone",
		["label"] = "Pink Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "pink_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
	},
	
	["white_phone"] = {
		["name"] = "white_phone",
		["label"] = "White Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "white_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
	},
	
	["wet_phone"] = {
		["name"] = "wet__phone",
		["label"] = "Wet Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "wet_classic_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "Did you really think that swimming in the ocean with your phone was a good idea?"
	},
	
	["wet_classic_phone"] = {
		["name"] = "wet_classic_phone",
		["label"] = "Wet Classic Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "wet_classic_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "Did you really think that swimming in the ocean with your phone was a good idea?"
	},
	
	["wet_black_phone"] = {
		["name"] = "wet_black_phone",
		["label"] = "Wet Black Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "wet_black_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "Did you really think that swimming in the ocean with your phone was a good idea?"
	},
	
	["wet_blue_phone"] = {
		["name"] = "wet_blue_phone",
		["label"] = "Wet Blue Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "wet_blue_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "Did you really think that swimming in the ocean with your phone was a good idea?"
	},
	
	["wet_gold_phone"] = {
		["name"] = "wet_gold_phone",
		["label"] = "Wet Gold Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "wet_gold_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "Did you really think that swimming in the ocean with your phone was a good idea?"
	},
	
	["wet_red_phone"] = {
		["name"] = "wet_red_phone",
		["label"] = "Wet Red Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "wet_red_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "Did you really think that swimming in the ocean with your phone was a good idea?"
	},
	
	["wet_green_phone"] = {
		["name"] = "wet_green_phone",
		["label"] = "Wet Green Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "wet_green_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
	},
	
	["wet_greenlight_phone"] = {
		["name"] = "wet_greenlight_phone",
		["label"] = "Wet Green Light Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "wet_greenlight_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
	},
	
	["wet_pink_phone"] = {
		["name"] = "wet_pink_phone",
		["label"] = "Wet Pink Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "wet_pink_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
	},
	
	["wet_white_phone"] = {
		["name"] = "wet_white_phone",
		["label"] = "Wet White Phone",
		["weight"] = 700,
		["type"] = "item",
		["image"] = "wet_white_phone.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
	},
	
	["phone_hack"] = {
		["name"] = "phone_hack",
		["label"] = "Phone Hack",
		["weight"] = 300,
		["type"] = "item",
		["image"] = "phone_hack.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "With this chip, you can access hidden areas of Discord."
	},
	
	["phone_module"] = {
		["name"] = "phone_module",
		["label"] = "Phone Module",
		["weight"] = 300,
		["type"] = "item",
		["image"] = "phone_module.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "It seems that we can fix a wet phone with this module, interesting."
	},
	
	["powerbank"] = {
		["name"] = "powerbank",
		["label"] = "Power Bank",
		["weight"] = 150,
		["type"] = "item",
		["image"] = "powerbank.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "Incredible portable charger!"
	},

	["weapon_smg_mk2"] = {
		label = "SMG MK2",
		weight = 5,
		stack = true,
		close = true,
	},

	["weapon_assaultrifle_mk2"] = {
		label = "AR MK2",
		weight = 5,
		stack = true,
		close = true,
	},

	["weapon_heavysniper_mk2"] = {
		label = "Heavy Sniper MK2",
		weight = 5,
		stack = true,
		close = true,
	},

	["weapon_pistol_mk2"] = {
		label = "Pistol MK2",
		weight = 5,
		stack = true,
		close = true,
	},

	["grocerya"] = {
		label = "Grocery Bag A",
		weight = 5,
		stack = true,
		close = true,
	},

	["groceryb"] = {
		label = "Grocery Bag B",
		weight = 5,
		stack = true,
		close = true,
	},

	["groceryc"] = {
		label = "Grocery Bag C",
		weight = 5,
		stack = true,
		close = true,
	},

	["weapon_pumpshotgun_mk2"] = {
		label = "Shotgun MK2",
		weight = 5,
		stack = true,
		close = true,
	},
	['bowl_calamari'] = {
		label = 'calamari bowl',
		stack = true,
		close = false,
		weight = 10,
	},
		['bowl_chickengnoccisoup'] = {
		label = 'bowl_chicken gnocci soup',
		stack = true,
		close = false,
		weight = 10,
	},
		['bowl_fivecheeseziti'] = {
		label = 'five cheese ziti',
		stack = true,
		close = false,
		weight = 10,
	},
		['bowl_friedmozzarella'] = {
		label = 'fried mozzarella',
		stack = true,
		close = false,
		weight = 10,
	},
		['bowl_housesalad'] = {
		label = 'house salad',
		stack = true,
		close = false,
		weight = 10,
	},
		['bowl_minestrone'] = {
		label = 'minestrone',
		stack = true,
		close = false,
		weight = 10,
	},
		['bowl_pastafagioli'] = {
		label = 'pasta fagioli',
		stack = true,
		close = false,
		weight = 10,
	},
		['bowl_shrimpalfredo'] = {
		label = 'shrimp alfredo',
		stack = true,
		close = false,
		weight = 10,
	},
		['bowl_shrimpscampi'] = {
		label = 'shrimp scampi',
		stack = true,
		close = false,
		weight = 10,
	},
		['bowl_toastedravioli'] = {
		label = 'toasted ravioli',
		stack = true,
		close = false,
		weight = 10,
	},
		['bowl_tomatosoup'] = {
		label = 'tomato soup',
		stack = true,
		close = false,
		weight = 10,
	},
		['bowl_zuppatoscana'] = {
		label = 'zuppa toscana',
		stack = true,
		close = false,
		weight = 10,
	},
		['cake_blacktiemouse'] = {
		label = 'black tie mouse',
		stack = true,
		close = false,
		weight = 10,
	},
		['food_piececalamari'] = {
		label = 'calamari',
		stack = true,
		close = false,
		weight = 10,
	},
		['food_piecefriedmozzarella'] = {
		label = 'fried mozzarella',
		stack = true,
		close = false,
		weight = 10,
	},
		['food_piecetoastedravioli'] = {
		label = 'toasted ravioli',
		stack = true,
		close = false,
		weight = 10,
	},
		['plate_cheeseravioli'] = {
		label = 'cheese ravioli',
		stack = true,
		close = false,
		weight = 10,
	},
		['plate_chickenfettucine'] = {
		label = 'chicken fettucine',
		stack = true,
		close = false,
		weight = 10,
	},
		['plate_chickenlinguini'] = {
		label = 'chicken linguini',
		stack = true,
		close = false,
		weight = 10,
	},
		['plate_chickenmarsala'] = {
		label = 'chicken marsala',
		stack = true,
		close = false,
		weight = 10,
	},
		['plate_chickenparm'] = {
		label = 'chicken parm',
		stack = true,
		close = false,
		weight = 10,
	},
		['plate_choclasagna'] = {
		label = 'choc lasagna',
		stack = true,
		close = false,
		weight = 10,
	},
		['plate_crablinguini'] = {
		label = 'crab linguini',
		stack = true,
		close = false,
		weight = 10,
	},
		['plate_eggplantparm'] = {
		label = 'eggplant parm',
		stack = true,
		close = false,
		weight = 10,
	},
		['plate_fettuccine'] = {
		label = 'fettuccine',
		stack = true,
		close = false,
		weight = 10,
	},
		['plate_lasagnaclassico'] = {
		label = 'lasagna classic',
		stack = true,
		close = false,
		weight = 10,
	},
		['plate_lobsterlinguini.'] = {
		label = 'lobster linguini.',
		stack = true,
		close = false,
		weight = 10,
	},
		['plate_ratatouille'] = {
		label = 'ratatouille',
		stack = true,
		close = false,
		weight = 10,
	},
		['plate_spaghettiandmeatballs'] = {
		label = 'spaghetti and meatballs',
		stack = true,
		close = false,
		weight = 10,
	},
		['plate_tiramisu'] = {
		label = 'tiramisu',
		stack = true,
		close = false,
		weight = 10,
	},
	['beer_keg'] = {
		label = 'Keg',
		stack = true,
		close = false,
		weight = 10,
	},
	['cocktail_jigger'] = {
		label = 'cocktail jigger',
		stack = true,
		close = false,
		weight = 10,
	},
	['cocktail_spoon'] = {
		label = 'cocktail spoon',
		stack = true,
		close = false,
		weight = 10,
	},
	['coconutdrink'] = {
		label = 'coconut',
		stack = true,
		close = false,
		weight = 10,
	},
	['cup_moscowmule'] = {
		label = 'cup moscowmule',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_baileys'] = {
		label = 'baileys',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_beerbudweiser'] = {
		label = 'budweiser',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_beerempty'] = {
		label = 'beer glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_beerheineken'] = {
		label = 'heineken glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_beernobrand'] = {
		label = 'beer glass no brand',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_beerstellartois'] = {
		label = 'stellartois glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_bluecosmopolitan'] = {
		label = 'blue cosmopolitan glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_bluemaita'] = {
		label = 'blue maita glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_champagne'] = {
		label = 'champagne glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_greencosmopolitan'] = {
		label = 'green cosmopolitan glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_kiwiflight'] = {
		label = 'kiwi flight glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_mojito'] = {
		label = 'mojito glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_pinacolada'] = {
		label = 'pinacolada glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_pinkmaitai'] = {
		label = 'pink maitai glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_redcosmopolitan'] = {
		label = 'red cosmopolitan glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_seabreeze'] = {
		label = 'seabreeze glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_shotblue'] = {
		label = 'shot blue glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_shotgreen'] = {
		label = 'shot glass green ',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_shotorange'] = {
		label = 'shot glass orange',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_shotpurple'] = {
		label = 'shot glass purple',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_strawberrysunrise'] = {
		label = 'strawberry sunrise glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_summerslushwithvodkablue'] = {
		label = 'slush vodka blue glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_summerslushwithvodkagreen.ydr'] = {
		label = 'slush vodka green glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_summerslushwithvodkaorange'] = {
		label = 'slush vodka orange glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_summerslushwithvodkapurple'] = {
		label = 'slush vodka purple glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_summerslushwithvodkarainbow'] = {
		label = 'slush vodka rainbow ',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_summerslushwithvodkared'] = {
		label = 'slush vodka red',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_summerslushwithvodkayellow'] = {
		label = 'slush vodka yellow',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_tropico'] = {
		label = 'tropico glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_vodka'] = {
		label = 'vodka glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_vodkabannanapineapple'] = {
		label = 'vodka bannana pineapple',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_vodkanightlava'] = {
		label = 'vodka night lava',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_vodkaorangesky'] = {
		label = 'vodka orange sky',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_vodkapeachbeachpunch'] = {
		label = 'vodka peach beach punch',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_vodkapineapplecherry'] = {
		label = 'vodka pineapple cherry',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_vodkawatermelonlemonade'] = {
		label = 'vodka watermelon lemonade',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_whisky'] = {
		label = 'whisky glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['glass_yellowcosmopolitan'] = {
		label = 'yellow cosmopolitan glass',
		stack = true,
		close = false,
		weight = 10,
	},
	['pineappledrink'] = {
		label = 'pineapple drink',
		stack = true,
		close = false,
		weight = 10,
	},
	['shaker_black'] = {
		label = 'shaker black',
		stack = true,
		close = false,
		weight = 10,
	},
	['shaker_bronze'] = {
		label = 'shaker bronze',
		stack = true,
		close = false,
		weight = 10,
	},
	['shaker_gold'] = {
		label = 'shaker gold',
		stack = true,
		close = false,
		weight = 10,
	},
	['shaker_silver'] = {
		label = 'shaker silver',
		stack = true,
		close = false,
		weight = 10,
	},
	['wine_keg'] = {
		label = 'wine keg',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_boardwithroller'] = {
		label = 'Pizza Board with Roller',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_boardwithroller2'] = {
		label = 'Pizza Board with Roller',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_boardwithroller3'] = {
		label = 'Pizza Board with Roller',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_cookingitems'] = {
		label = 'Cooking Items',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_cutter'] = {
		label = 'Pizza Cutter',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_cutter2'] = {
		label = 'Pizza Cutter',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_dough'] = {
		label = 'Pizza Dough',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_grinder'] = {
		label = 'Pizza Grinder',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_grinder2'] = {
		label = 'Pizza Grinder',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_grinder3'] = {
		label = 'Pizza Grinder',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_ovenempty'] = {
		label = 'oven empty',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_ovenwithpizza'] = {
		label = 'oven with pizza',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_plateslicebbqchicken'] = {
		label = 'plate slice bbq chicken',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_plateslicefourcheese'] = {
		label = 'plate slice four cheese',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_plateslicehawaiian'] = {
		label = 'plate slice hawaiian',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_plateslicemargherita'] = {
		label = 'plate slice margherita',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_plateslicepepperoni'] = {
		label = 'plate slice pepperoni',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_platesliceroastedgarlicchicken'] = {
		label = 'plate slice roasted garlic chicken',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_plateslicesicilian'] = {
		label = 'plate slice sicilian',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_plateslicespinachmushroomgarlic'] = {
		label = 'plate slice spinach mushroom garlic',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_plateslicesupreme'] = {
		label = 'plate slice supreme',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_plateslicewhitechicken'] = {
		label = 'plate slice white chicken',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_roller'] = {
		label = 'Pizza Roller',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_roller2'] = {
		label = 'Pizza Roller',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_roller3'] = {
		label = 'Pizza Roller',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_roller4'] = {
		label = 'Pizza Roller',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_sliceeatenbbqchicken'] = {
		label = 'slice eaten bbq chicken',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_sliceeatenfourcheese'] = {
		label = 'slice eaten four cheese',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_sliceeatenhawaiian'] = {
		label = 'slice eaten hawaiian',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_sliceeatenmargherita'] = {
		label = 'slice eaten margherita',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_sliceeatenpepperoni'] = {
		label = 'slice eaten pepperoni',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_sliceeatenroastedgarlicchicken'] = {
		label = 'slice eaten roasted garlic chicken',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_sliceeatensicilian'] = {
		label = 'slice eaten sicilian',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_sliceeatenspinachmushroomgarlic'] = {
		label = 'slice eaten spinach mushroom garlic',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_sliceeatensupreme'] = {
		label = 'slice eaten supreme',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_sliceeatenwhitechicken'] = {
		label = 'slice eaten white chicken',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_slicehawaiian'] = {
		label = 'slice hawaiian',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_slicepepperoni'] = {
		label = 'slice pepperoni',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_slicesupreme'] = {
		label = 'slice supreme',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_sliceveggie'] = {
		label = 'slice veggie',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_wholebbqchicken'] = {
		label = 'bbq chicken',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_wholefourcheese'] = {
		label = 'four cheese',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_wholehawaiian'] = {
		label = 'hawaiiane',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_wholemargherita'] = {
		label = 'Margherita',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_wholepepperoni'] = {
		label = 'Pepperoni',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_wholeroastedgarlicchicken'] = {
		label = 'Roasted Garlic Chicken',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_wholesicilian'] = {
		label = 'Sicilian',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_wholespinachmushroomgarlic'] = {
		label = 'Spinach Mushroom Garlic',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_wholesupreme'] = {
		label = 'Supreme',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_wholewhitechicken'] = {
		label = 'White Chicken',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_woodentray'] = {
		label = 'Wooden Tray',
		stack = true,
		close = false,
		weight = 10,
	},
	['pizza_woodentray2'] = {
		label = 'Wooden Tray',
		stack = true,
		close = false,
		weight = 10,
	},
	['bannasplit'] = {
		label = 'Bannasplit',
		stack = true,
		close = false,
		weight = 10,
	},
	['donut_icecream'] = {
		label = 'Donut Icecream',
		stack = true,
		close = false,
		weight = 10,
	},
	['donut_icecream2'] = {
		label = 'Donut Icecream',
		stack = true,
		close = false,
		weight = 10,
	},
	['donut_icecream3'] = {
		label = 'Donut Icecream',
		stack = true,
		close = false,
		weight = 10,
	},
	['donut_icecream4'] = {
		label = 'Donut Icecream',
		stack = true,
		close = false,
		weight = 10,
	},
	['donut_icecream5'] = {
		label = 'Donut Icecream',
		stack = true,
		close = false,
		weight = 10,
	},
	['donut_icecream6'] = {
		label = 'Donut Icecream',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreambar_brown'] = {
		label = 'Icecream Bar Brown',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreambar_choconut'] = {
		label = 'Icecream Bar Choconut',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreambar_choconut2'] = {
		label = 'Icecream Bar Choconut',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreambar_pink'] = {
		label = 'Icecream Bar Pink',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreambar_white'] = {
		label = 'Icecream Bar White',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcone_brown'] = {
		label = 'Icecream Cone Brown',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcone_brownberrys'] = {
		label = 'Icecream Cone Brownberry',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcone_greenberrys'] = {
		label = 'Icecream Cone Greenberry',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcone_pink'] = {
		label = 'Icecream Cone Pink',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcone_pinkberrys'] = {
		label = 'Icecream Cone Pinkberry',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcone_white'] = {
		label = 'Icecream Cone White',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcone_whiteandbrown'] = {
		label = 'Icecream Cone White and Brown',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcone_whiteandred'] = {
		label = 'Icecream Cone White and Red',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcone_whiteandyellow'] = {
		label = 'Icecream Cone White and Yellow',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcup_brownbrown'] = {
		label = 'Icecream Cup Brown',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcup_browngreen'] = {
		label = 'Icecream Cup Brown Green',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcup_brownwhite'] = {
		label = 'Icecream Cup Brown White',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcup_pinkgreen'] = {
		label = 'Icecream Cup Pink Green',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcup_pinkwhite'] = {
		label = 'Icecream Cup Pink White',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcup_whitegreen'] = {
		label = 'Icecream Cup White Green',
		stack = true,
		close = false,
		weight = 10,
	},
	['icecreamcup_whitepink'] = {
		label = 'Icecream Cup White Pink',
		stack = true,
		close = false,
		weight = 10,
	},
	['shavedice1'] = {
		label = 'Shaved Ice',
		stack = true,
		close = false,
		weight = 10,
	},
	['shavedice2'] = {
		label = 'Shaved Ice',
		stack = true,
		close = false,
		weight = 10,
	},
	['shavedice3'] = {
		label = 'Shaved Ice',
		stack = true,
		close = false,
		weight = 10,
	},
	['shavedice4'] = {
		label = 'Shaved Ice',
		stack = true,
		close = false,
		weight = 10,
	},
	['shavedice5'] = {
		label = 'Shaved Ice',
		stack = true,
		close = false,
		weight = 10,
	},
	['shavedice6'] = {
		label = 'Shaved Ice',
		stack = true,
		close = false,
		weight = 10,
	},
	['shavedice7'] = {
		label = 'Shaved Ice',
		stack = true,
		close = false,
		weight = 10,
	},
	['shavedice8'] = {
		label = 'Shaved Ice',
		stack = true,
		close = false,
		weight = 10,
	},
	['shavedice9'] = {
		label = 'Shaved Ice',
		stack = true,
		close = false,
		weight = 10,
	},
	['woodenspoon'] = {
		label = 'Wooden Spoon',
		stack = true,
		close = false,
		weight = 10,
	},
	['woodenspoon_icecreambrown'] = {
		label = 'Brown Icecream Spoon',
		stack = true,
		close = false,
		weight = 10,
	},
	['woodenspoon_icecreamgreen'] = {
		label = 'Green Wooden Icecream Spoon',
		stack = true,
		close = false,
		weight = 10,
	},
	['adobada_pringles'] = {
		label = 'adobada pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `adobada_pringles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	---pringles
	['adobada_pringles'] = {
		label = 'adobada pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `adobada_pringles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['bbq_pringles'] = {
		label = 'bbq pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `bbq_pringles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cheddarcheese_pringles'] = {
		label = 'cheddar cheese pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cheddarcheese_pringles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cheddarsourcream_pringles'] = {
		label = 'cheddar sourcream pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cheddarsourcream_pringles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['chililime_pringles'] = {
		label = 'chili lime pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `chililime_pringles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['frenchfiresketchup_pringles'] = {
		label = 'french fires ketchup pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `frenchfiresketchup_pringles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['frenchoniondip_pringles'] = {
		label = 'french onion dip pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `frenchoniondip_pringles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['hothoney_pringles'] = {
		label = 'hot honey pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `hothoney_pringles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['lightlysalted_pringles'] = {
		label = 'lightly salted pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `lightlysalted_pringles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['original_pringles'] = {
		label = 'original pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `original_pringles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['originalreductedfat_pringles'] = {
		label = 'original reduced fat pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `originalreductedfat_pringles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['paprika_pringles'] = {
		label = 'paprika pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `paprika_pringles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['phillycheesesteak_pringles'] = {
		label = 'philly cheese steak pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `phillycheesesteak_pringles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['pizza_pringles'] = {
		label = 'pizza pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `pizza_pringles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['ranch_pringles'] = {
		label = 'salt vinegar pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = 'ranch_pringles', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['scorchin_bbq_pringles'] = {
		label = 'scorchin bbq pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = 'scorchin_bbq_pringles', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['scorchin_buffalo_pringles'] = {
		label = 'scorchin buffalo pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = 'scorchin_buffalo_pringles', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['scorchin_cheddar_pringles'] = {
		label = 'scorchin cheddar pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = 'scorchin_cheddar_pringles', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['scorchin_sourcreamonion_pringles'] = {
		label = 'scorchin sourcream onion pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = 'scorchin_sourcreamonion_pringles', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['scorchinwavy_loadednachos_pringles'] = {
		label = 'scorchin wavy loaded nachos pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = 'scorchinwavy_loadednachos_pringles', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['sourcreamonion_pringles'] = {
		label = 'sour cream onion pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = 'sourcreamonion_pringles', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['wavy_applewoodsmokedcheddar_pringles'] = {
		label = 'wavy applewood smoked cheddar pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = 'wavy_applewoodsmokedcheddar_pringles', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['wavy_classic_pringles'] = {
		label = 'wavy classic pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = 'wavy_classic_pringles', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['wavy_fireroasted'] = {
		label = 'wavy fire roasted jalapeno pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = 'wavy_fireroasted_jalapeno_pringles', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['wavy_sweetspicybbq_pringles'] = {
		label = 'wavy sweet spicy bbq pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = 'wavy_sweetspicybbq_pringles', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['wavy_whitecheddar_pringles'] = {
		label = 'wavy white cheddar pringles',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = 'wavy_whitecheddar_pringles', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['remotecontrol'] = {
		label = "Remote control",
		weight = 10,
		stack = false,
		consume = 0,
		description = "Oh, will you watch tv?",
		client = {
		  event = "tgg-remotetv:use",
		  },
		},
--Kings drugs
['A1-zaza']                      = { label = 'A1 Zaza',                          weight = 10, },
['Agave_plant']                  = { label = 'Agave Plant',                      weight = 10, },
['alien_cheese']                 = { label = 'Alien Cheese',                     weight = 10, },
['berry_gelatin']                = { label = 'Berry Gelatin',                    weight = 10, },
['blue_cherries']                = { label = 'Blue Cherries',                    weight = 10, },
['blunt']                        = { label = 'Blunt',                            weight = 10, },
['blunts']                       = { label = 'Blunts',                           weight = 10, },
['bubble_jug_za']                = { label = 'Bubble Jug Za',                    weight = 10, },
['butter_finger_thc']            = { label = 'Butter Finger THC',                weight = 10, },
['butter_finger']                = { label = 'Butter Finger',                    weight = 10, },
['chicle_za']                    = { label = 'Chicle Za',                        weight = 10, },
['eighth_oz_bag']                = { label = 'Eighth Ounce Bag',                 weight = 10, },
['Empty_Bottle']                 = { label = 'Empty Bottle',                     weight = 10, },
['gummy_mold']                   = { label = 'Gummy Mold',                       weight = 10, },
['little_crawlers']               = { label = 'Liitt Crawlers',                   weight = 10, },
['little_crawlers_edibles']       = { label = 'Liitt Crawlers Edibles',           weight = 10, },
['magic_musroom_paradise']       = { label = 'Magic Mushroom Paradise',          weight = 10, },
['magic_musroom_skyzone']        = { label = 'Magic Mushroom Skyzone',           weight = 10, },
['mate_black_pound_bag']         = { label = 'Mate Black Pound Bag',             weight = 10, },
['Midnight_Cookies']             = { label = 'Midnight Cookies',                 weight = 10, },
['mora_fresa_za']                = { label = 'Mora Fresa Za',                    weight = 10, },
['Nightmare_Cookies']            = { label = 'Nightmare Cookies',                weight = 10, },
['paradise_shroom']              = { label = 'Paradise Shroom',                  weight = 10, },
['peach_pie_edibles']            = { label = 'Peach Pie Edibles',                weight = 10, },
['peach_pie_gummy']              = { label = 'Peach Pie Gummy',                  weight = 10, },
['pixcleaner']                   = { label = 'Pixcleaner',                       weight = 10, },
['skyzone_shroom']               = { label = 'Skyzone Shroom',                   weight = 10, },
['smoke_house_za']               = { label = 'Smoke House Za',                   weight = 10, },
['Sour_starwberry_edibles']      = { label = 'Sour Strawberry Edibles',          weight = 10, },
['Sour_starwberry_gummie']       = { label = 'Sour Strawberry Gummie',           weight = 10, },
['THC_Black']                    = { label = 'THC Black',                        weight = 10, },
['THC_Blue']                     = { label = 'THC Blue',                         weight = 10, },
['thc_jaguar_amber']             = { label = 'THC Jaguar Amber',                 weight = 10, },
['thc_jaguar_blue']              = { label = 'THC Jaguar Blue',                  weight = 10, },
['thc_jaguar_disco']             = { label = 'THC Jaguar Disco',                 weight = 10, },
['thc_jaguar_neon']              = { label = 'THC Jaguar Neon',                  weight = 10, },
['THC_Purple']                   = { label = 'THC Purple',                       weight = 10, },
['THC_Red']                      = { label = 'THC Red',                          weight = 10, },
['White_Gushers']                = { label = 'White Gushers',                    weight = 10, },
['THC-Peach']                    = { label = 'THC-Peach',                        weight = 10  },
['THC-Green']                    = { label = 'THC-Green',                        weight = 10  },
-- Custom Weapons
['WEAPON_AK47'] 		 	= { label = 'AK-47', 		    weight = 1000,	durability = 0.0,	ammoname = 'ammo-rifle',},  
['WEAPON_DE'] 					= { label = 'Desert Eagle',	    weight = 1000,	durability = 0.0,	ammoname = 'ammo-45',},     
['WEAPON_FNX45'] 			= { label = 'FN FNX-45', 	    weight = 1000,	durability = 0.0,	ammoname = 'ammo-45',},     
['WEAPON_GLOCK17'] 		= { label = ' Glock 17',      weight = 1000,	durability = 0.0,	ammoname = 'ammo-45',},     
['WEAPON_M4'] 				= { label = ' M4A1', 		    weight = 1000,	durability = 0.0,	ammoname = 'ammo-rifle',},  
['WEAPON_M9'] 			= { label = 'Beretta M9A3',     weight = 1000,	durability = 0.0,	ammoname = 'ammo-45',},     
['WEAPON_M70'] 				= { label = 'M70', 			    weight = 1000,	durability = 0.0,	ammoname = 'ammo-rifle',},  
['WEAPON_M1911'] 			= { label = 'M1911', 		    weight = 1000,	durability = 0.0,	ammoname = 'ammo-45',},     
['WEAPON_UZI'] 					= { label = 'UZI', 			    weight = 1000,	durability = 0.0,	ammoname = 'ammo-9',},      
['WEAPON_MAC10'] 				= { label = 'MAC-10', 		    weight = 1000,	durability = 0.0,	ammoname = 'ammo-9',},      
['WEAPON_MOSSBERG'] 	= { label = 'Mossberg 500',     weight = 1000,	durability = 0.0,	ammoname = 'ammo-shotgun',},
['WEAPON_REMINGTON'] 			= { label = 'Remington 870',    weight = 1000,	durability = 0.0,	ammoname = 'ammo-shotgun',},
['WEAPON_SCARH'] 		= { label = 'PD SCAR-H', 	    weight = 1000,	durability = 0.0,	ammoname = 'ammo-rifle',},  
['WEAPON_SHIV'] 				= { label = 'Shiv', 		    weight = 1000,	durability = 0.0,	},                          
['WEAPON_AR15'] 			= { label = 'PD AR-15', 	    weight = 1000,	durability = 0.0,	ammoname = 'ammo-rifle',},  
['WEAPON_MK14'] 			= { label = 'PD MK14', 		    weight = 1000,	durability = 0.0,	ammoname = 'ammo-sniper',}, 
['WEAPON_HUNTINGRIFLE'] 		 = { label = 'Hunting Rifle',    weight = 1000,	durability = 0.0,	ammoname = 'ammo-sniper',}, 
['WEAPON_KATANA'] 			= { label = 'Katana', 		    weight = 1000,	durability = 0.0,	},      		
['WEAPON_SLEDGEHAMMER'] 	   = { label = 'Sledge Hammer',    weight = 1000,	durability = 0.0,	},      		
['WEAPON_MP9'] 			          	= { label = 'MP9', 				weight = 1000,	durability = 0.0,	ammoname = 'ammo-9',},     
['WEAPON_M110'] 		           	 = { label = 'M110', 			weight = 1000,	durability = 0.0,	ammoname = 'ammo-sniper',},
['WEAPON_HK416'] 		           	 = { label = 'HK-416', 			weight = 1000,	durability = 0.0,	ammoname = 'ammo-rifle',}, 
['WEAPON_AK74'] 		 	= { label = 'AK-74', 		    weight = 1000,	durability = 0.0,	ammoname = 'ammo-rifle',}, 
['WEAPON_AKS74'] 		 	= { label = 'AK-S74', 		    weight = 1000,	durability = 0.0,	ammoname = 'ammo-rifle',}, 
['WEAPON_GLOCK18C'] 	= { label = 'Glock 18C', 	    weight = 1000,	durability = 0.0,	ammoname = 'ammo-45',},    
['WEAPON_GLOCK22'] 			  = { label = 'Glock 22',         weight = 1000,	durability = 0.0,	ammoname = 'ammo-45',},    
['WEAPON_MP5'] 				 	= { label = 'H&K MP5', 		    weight = 1000,	durability = 0.0,	ammoname = 'ammo-9',},  

['WEAPON_VALFM'] 		 	= { label = 'AS-Val', 		    weight = 1000,	durability = 0.0,	ammoname = 'ammo-rifle',},

    ----------------
    -----Pearl------
    ----------------
    
       
    ['baby_lobster'] = {
        label = 'Baby Lobster',
        description = "food",
        weight = 5,
        stack = true
    },
    ['catfish'] = {
        label = 'Catfish',
        description = "food",
        weight = 5,
        stack = true
    },
    ['crab_cake'] = {
        label = 'Crab Cake',
        description = "food",
        weight = 5,
        stack = true
    },
    ['crablegs_meal'] = {
        label = 'Crablegs Meal',
        description = "food",
        weight = 5,
        stack = true
    },
    ['double_gourmet'] = {
        label = 'Double Gourmet',
        description = "food",
        weight = 5,
        stack = true
    },
    ['fish_tilapia'] = {
        label = 'Fish Tilapia',
        description = "food",
        weight = 5,
        stack = true
    },
    ['fried_mushrooms'] = {
        label = 'Fried Mushrooms',
        description = "food",
        weight = 5,
        stack = true
    },
    ['glazed_almon'] = {
        label = 'Glazed Almon',
        description = "food",
        weight = 5,
        stack = true
    },
    ['half_oysters'] = {
        label = 'Half Oysters',
        description = "food",
        weight = 5,
        stack = true
    },
    ['lobster_bisque'] = {
        label = 'Lobster Bisque',
        description = "food",
        weight = 5,
        stack = true
    },
    ['shrimp_alfredo'] = {
        label = 'Shrimp Alfredo',
        description = "food",
        weight = 5,
        stack = true
    },
    ['shrimp_pasta'] = {
        label = 'Shrimp Pasta',
        description = "food",
        weight = 5,
        stack = true
    },
    ['tropical_chick'] = {
        label = 'Tropical Chick',
        description = "food",
        weight = 5,
        stack = true
    },



    ['caesar_side_salad'] = {
        label = 'Caesar Side Salad',
        description = "food",
        weight = 5,
        stack = true
    },
    ['chicken_caesar_salad'] = {
        label = 'Chicken Caesar Salad',
        description = "food",
        weight = 5,
        stack = true
    },
    ['classic_caesar_salad'] = {
        label = 'Classic Caesar Salad',
        description = "food",
        weight = 5,
        stack = true
    },
    ['salmon_caesar_salad'] = {
        label = 'Salmon Caesar Salad',
        description = "food",
        weight = 5,
        stack = true
    },
    ['side_caesar_salad'] = {
        label = 'Side Caesar Salad',
        description = "food",
        weight = 5,
        stack = true
    },




	

    ['pr_coca_cola'] = {
        label = 'Coca Cola',
		weight = 5,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `v_res_tt_can02`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
    ['pr_diet_coke'] = {
        label = 'Diet Coke',
		weight = 5,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `v_res_tt_can02`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
    ['pr_dr_pepper'] = {
        label = 'Pepper',
		weight = 5,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `v_res_tt_can02`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
    ['pr_fanta_orange'] = {
        label = 'Fanta',
		weight = 5,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `v_res_tt_can02`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
    ['pr_fruit_punch'] = {
        label = 'Fruit Punch',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `v_res_tt_can02`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
    ['pr-softdrink'] = {
        label = 'Soft Drink',
		weight = 500,
		client = {
			status = { thirst = 400000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `v_res_tt_can02`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['laptop'] = {
		label = 'Laptop',
		weight = 1,
		stack = false,
		close = true,
		description = ''
		},
		['decrypter'] = {
		label = 'Decrypter',
		weight = 1,
		stack = true,
		close = true,
		description = ''
		},
		['black_usb'] = {
		label = 'Black USB',
		weight = 1,
		stack = true,
		close = true,
		description = ''
		},
		['receipt'] = {
			label = 'Receipt',
			weight = 20, 
			stack = false,
			close = true,
			description = nil,
			buttons = {
				{
					label = 'Show Receipt',
					action = function(slot)
						TriggerEvent('envi-receipts:showReceiptToClosestPlayer', slot)
					end
				}
			}
		},
		
		['payment_terminal'] = {
			label = 'Receipt Printer',
			weight = 2000, 
			stack = false,
			close = true,
			description = 'A handy device for printing receipts on-the-go!',
			buttons = {
				{
					label = 'Print Receipt',
					action = function()
						TriggerEvent('envi-receipts:quickPrint')
					end
				}
			}
		},

	["testpack"] = {
		label = "Test Pack",
		weight = 10,
		stack = true,
		close = true,
	},

	["condom"] = {
		label = "Condom",
		weight = 10,
		stack = true,
		close = true,
	},

	["viagra"] = {
		label = "Viagra",
		weight = 10,
		stack = true,
		close = true,
	},

	["mifepristone"] = {
		label = "Mifepristone",
		weight = 10,
		stack = true,
		close = true,
	},

	["levonorgestrel"] = {
		label = "Levonorgestrel",
		weight = 10,
		stack = true,
		close = true,
	},
	["scratch_ticket"] = {
		label = "scratch_ticket",
		weight = 1,
		stack = true,
		close = true,
	},

	["acamprosate"] = {
		label = "Acamprosate",
		weight = 1,
		stack = true,
		close = true,
	},

	["acid"] = {
		label = "Acid",
		weight = 1,
		stack = true,
		close = true,
	},

	["acid_paper"] = {
		label = "Acid Paper",
		weight = 1,
		stack = true,
		close = true,
	},

	["adderall"] = {
		label = "Adderall",
		weight = 1,
		stack = true,
		close = true,
	},

	["angeldust"] = {
		label = "Angel Dust",
		weight = 1,
		stack = true,
		close = true,
	},

	["loaded_croissanwich_meal"] = {
		label = "Bacon, Sausage & Ham Meal Small",
		weight = 1,
		stack = true,
		close = true,
	},

	["lofexidine"] = {
		label = "Lofexidine",
		weight = 1,
		stack = true,
		close = true,
	},

	["louisiana_voodoo_fries"] = {
		label = "LOUISIANA VOODOO FRIES",
		weight = 1,
		stack = true,
		close = true,
	},

	["lsd"] = {
		label = "LSD",
		weight = 1,
		stack = true,
		close = true,
	},

	["applesauce"] = {
		label = "Applesauce",
		weight = 1,
		stack = true,
		close = true,
	},

	["baby_lobster_pasta"] = {
		label = "Baby Lobster Pasta",
		weight = 1,
		stack = true,
		close = true,
	},

	["backwoods_grape"] = {
		label = "Backwoods Grape",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_coca_cola"] = {
		label = "Coca Cola",
		weight = 1,
		stack = true,
		close = true,
	},

	["backwoods_russian_cream"] = {
		label = "Backwoods Russian Cream",
		weight = 1,
		stack = true,
		close = true,
	},

	["bagel_cream_cheese"] = {
		label = "BAGELS WITH CREAM CHEESE SPREAD",
		weight = 1,
		stack = true,
		close = true,
	},

	["bakingsoda"] = {
		label = "Baking Soda",
		weight = 1,
		stack = true,
		close = true,
	},

	["banana_backwoods"] = {
		label = "Banana Backwoods",
		weight = 1,
		stack = true,
		close = true,
	},

	["barqs_diet_beer"] = {
		label = "Medium Diet Barqs Root Beer",
		weight = 1,
		stack = true,
		close = true,
	},

	["bathsalts"] = {
		label = "Bath Salts",
		weight = 1,
		stack = true,
		close = true,
	},

	["bigger_family_feast"] = {
		label = "Bigger Family Feast",
		weight = 1,
		stack = true,
		close = true,
	},

	["md_ginger_ale"] = {
		label = "MD Ginger Ale",
		weight = 1,
		stack = true,
		close = true,
	},

	["md_seltzer_water"] = {
		label = "MD Seltzer Water",
		weight = 1,
		stack = true,
		close = true,
	},

	["meal_for_two"] = {
		label = "15PC MEAL FOR 2",
		weight = 1,
		stack = true,
		close = true,
	},

	["meat_zza"] = {
		label = "Meat ZZa",
		weight = 1,
		stack = true,
		close = true,
	},

	["bites_group_pack"] = {
		label = "THIGH BITES GROUP PACK",
		weight = 1,
		stack = true,
		close = true,
	},

	["mediterranean_veggie"] = {
		label = "Mediterranean Veggie",
		weight = 1,
		stack = true,
		close = true,
	},

	["blacktar"] = {
		label = "Black Tar Heroin",
		weight = 1,
		stack = true,
		close = true,
	},

	["medium_diet_coke"] = {
		label = "Medium Diet Coke",
		weight = 1,
		stack = true,
		close = true,
	},

	["medium_fanta_orange"] = {
		label = "Medium Fanta Orange",
		weight = 1,
		stack = true,
		close = true,
	},

	["medium_fanta_strawberry"] = {
		label = "Medium Fanta Strawberry",
		weight = 1,
		stack = true,
		close = true,
	},

	["medium_hawaiian_punch"] = {
		label = "Medium Hawaiian Punch",
		weight = 1,
		stack = true,
		close = true,
	},

	["medium_sprite"] = {
		label = "Medium Sprite",
		weight = 1,
		stack = true,
		close = true,
	},

	["medium_sweet_tea"] = {
		label = "Medium Sweet Tea",
		weight = 1,
		stack = true,
		close = true,
	},

	["medium_tropicana_lemonade"] = {
		label = "Medium Tropicana Lemonade",
		weight = 1,
		stack = true,
		close = true,
	},

	["blue_stone"] = {
		label = "Blue Stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth_pooch"] = {
		label = "Meth Pooch",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth_raw"] = {
		label = "Meth Raw",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth_shot"] = {
		label = "Meth Shot",
		weight = 1,
		stack = true,
		close = true,
	},

	["boneless_wings"] = {
		label = "BONELESS WINGS",
		weight = 1,
		stack = true,
		close = true,
	},

	["mild_tenders_box"] = {
		label = "10Pc Mild Tenders Box",
		weight = 1,
		stack = true,
		close = true,
	},

	["mild_tenders_bundle"] = {
		label = "10Pc Mild Tenders Bundle",
		weight = 1,
		stack = true,
		close = true,
	},

	["molly"] = {
		label = "Molly",
		weight = 1,
		stack = true,
		close = true,
	},

	["molly_pooch"] = {
		label = "Molly Pooch",
		weight = 1,
		stack = true,
		close = true,
	},

	["molly_tablet"] = {
		label = "Molly Tablet",
		weight = 1,
		stack = true,
		close = true,
	},

	["bs_barqs_beer"] = {
		label = "Medium Barqs Root Beer",
		weight = 1,
		stack = true,
		close = true,
	},

	["bs_cafe_decaf"] = {
		label = "Medium BK Cafe Decaf",
		weight = 1,
		stack = true,
		close = true,
	},

	["necklace_dogtag"] = {
		label = "Necklace Dogtag",
		weight = 1,
		stack = true,
		close = true,
	},

	["necklace_family"] = {
		label = "Necklace Family",
		weight = 1,
		stack = true,
		close = true,
	},

	["bs_dr_pepper"] = {
		label = "Medium Dr. Pepper",
		weight = 1,
		stack = true,
		close = true,
	},

	["nuggets_kids_meal"] = {
		label = "6Pc Nuggets Kids Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["nuggets_king_jr"] = {
		label = "Chicken Nuggets King Jr Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["nuggets_la_carte"] = {
		label = "48Pc Nuggets A la Carte",
		weight = 1,
		stack = true,
		close = true,
	},

	["nuggets_medium_combo"] = {
		label = "Nuggets Medium Combo",
		weight = 1,
		stack = true,
		close = true,
	},

	["bs_orange_juice"] = {
		label = "Simply Orange Juice",
		weight = 1,
		stack = true,
		close = true,
	},

	["opium_joint"] = {
		label = "Opium Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["bs_sprite_zero"] = {
		label = "Medium Sprite Zero",
		weight = 1,
		stack = true,
		close = true,
	},

	["buffalo_chicken"] = {
		label = "Buffalo Chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["buffalo_ranch_fries"] = {
		label = "BUFFALO RANCH FRIES",
		weight = 1,
		stack = true,
		close = true,
	},

	["original_chicken_sandwich"] = {
		label = "Original Chicken Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["oxycodone"] = {
		label = "Oxycodone",
		weight = 1,
		stack = true,
		close = true,
	},

	["oysters_half_shell"] = {
		label = "Oysters On the Half Shell",
		weight = 1,
		stack = true,
		close = true,
	},

	["cajun_fried_corn"] = {
		label = "CAJUN FRIED CORN",
		weight = 1,
		stack = true,
		close = true,
	},

	["cajun_fries"] = {
		label = "Regular Cajun Fries",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_coffee"] = {
		label = "PACKAGED COFFEE",
		weight = 1,
		stack = true,
		close = true,
	},

	["cali_chicken_bacon"] = {
		label = "Cali Chicken Bacon",
		weight = 1,
		stack = true,
		close = true,
	},

	["party_pack"] = {
		label = "50PC PARTY PACK",
		weight = 1,
		stack = true,
		close = true,
	},

	["pasta_primavera"] = {
		label = "Pasta Primavera",
		weight = 1,
		stack = true,
		close = true,
	},

	["patron_margarita"] = {
		label = "Patron Margarita",
		weight = 1,
		stack = true,
		close = true,
	},

	["carte_biscuit"] = {
		label = "À la Carte Biscuit",
		weight = 1,
		stack = true,
		close = true,
	},

	["casino_earrings"] = {
		label = "Casino Earrings",
		weight = 1,
		stack = true,
		close = true,
	},

	["pearl"] = {
		label = "Pearl",
		weight = 1,
		stack = true,
		close = true,
	},

	["pearls_coffee"] = {
		label = "Pearls Coffee",
		weight = 1,
		stack = true,
		close = true,
	},

	["pendulus_platinum"] = {
		label = "Pendulus Platinum",
		weight = 1,
		stack = true,
		close = true,
	},

	["chain_dogtag"] = {
		label = "Chain Dogtag",
		weight = 1,
		stack = true,
		close = true,
	},

	["chain_is"] = {
		label = "Chain IS",
		weight = 1,
		stack = true,
		close = true,
	},

	["chain_ls"] = {
		label = "Chain LS",
		weight = 1,
		stack = true,
		close = true,
	},

	["chain_m"] = {
		label = "Chain M",
		weight = 1,
		stack = true,
		close = true,
	},

	["chain_medal"] = {
		label = "Chain Medal",
		weight = 1,
		stack = true,
		close = true,
	},

	["chain_richman"] = {
		label = "Chain Richman",
		weight = 1,
		stack = true,
		close = true,
	},

	["chain_triangle"] = {
		label = "Chain Triangle",
		weight = 1,
		stack = true,
		close = true,
	},

	["cheap_lighter"] = {
		label = "Cheap Lighter",
		weight = 1,
		stack = true,
		close = true,
	},

	["cheeseburger_king_jr"] = {
		label = "Cheeseburger King Jr Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["cheese_fries"] = {
		label = "CHEESE FRIES",
		weight = 1,
		stack = true,
		close = true,
	},

	["cheese_sauce"] = {
		label = "CHEESE SAUCE",
		weight = 1,
		stack = true,
		close = true,
	},

	["pizza_deluxe"] = {
		label = "Pizza Deluxe",
		weight = 1,
		stack = true,
		close = true,
	},

	["plain_iced_coffee"] = {
		label = "Plain Iced Coffee Medium",
		weight = 1,
		stack = true,
		close = true,
	},

	["plastic_wrap"] = {
		label = "Plastic Wrap",
		weight = 1,
		stack = true,
		close = true,
	},

	["chemicals"] = {
		label = "Chemicals",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_and_waffles"] = {
		label = "Chicken & Waffles",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_bacon_ranch"] = {
		label = "Chicken Bacon Ranch",
		weight = 1,
		stack = true,
		close = true,
	},

	["pooch_bag"] = {
		label = "Pooch Bag",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_bundle"] = {
		label = "11Pc Chicken Bundle",
		weight = 1,
		stack = true,
		close = true,
	},

	["poppy_tears"] = {
		label = "Poppy Tears",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_carbonara"] = {
		label = "Chicken Carbonara",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_family_meal"] = {
		label = "16Pc Chicken Family Meal Classic",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_habanero"] = {
		label = "Chicken Habanero",
		weight = 1,
		stack = true,
		close = true,
	},

	["ps_coca_cola"] = {
		label = "Coca Cola",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_parm"] = {
		label = "Chicken Parm",
		weight = 1,
		stack = true,
		close = true,
	},

	["ps_sprite"] = {
		label = "Sprite",
		weight = 1,
		stack = true,
		close = true,
	},

	["p_chicken_alfredo"] = {
		label = "Chicken Alfredo",
		weight = 1,
		stack = true,
		close = true,
	},

	["chilled_premium_lemonade"] = {
		label = "Chilled Premium Lemonade",
		weight = 1,
		stack = true,
		close = true,
	},

	["chocolate_chunk_brownie"] = {
		label = "TRIPLE CHOCOLATE CHUNK BROWNIE",
		weight = 1,
		stack = true,
		close = true,
	},

	["raw_cone_king"] = {
		label = "Raw Cone King",
		weight = 1,
		stack = true,
		close = true,
	},

	["raw_lean"] = {
		label = "Lean ingredients",
		weight = 1,
		stack = true,
		close = true,
	},

	["rectdia_earrings"] = {
		label = "RectDia Earrings",
		weight = 1,
		stack = true,
		close = true,
	},

	["red_beans_rice"] = {
		label = "Regular Red Beans & Rice",
		weight = 1,
		stack = true,
		close = true,
	},

	["chocolate_shake"] = {
		label = "Chocolate Shake",
		weight = 1,
		stack = true,
		close = true,
	},

	["red_stone"] = {
		label = "Red Stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["cinnamon_apple_pie"] = {
		label = "Cinnamon Apple Pie",
		weight = 1,
		stack = true,
		close = true,
	},

	["regular_cajun_rice"] = {
		label = "Regular Cajun Rice",
		weight = 1,
		stack = true,
		close = true,
	},

	["regular_coleslaw"] = {
		label = "Regular Coleslaw",
		weight = 1,
		stack = true,
		close = true,
	},

	["classic_chicken_sandwich"] = {
		label = "Classic Chicken Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["rolling_paper"] = {
		label = "Rolling Paper",
		weight = 1,
		stack = true,
		close = true,
	},

	["classic_signature_chicken"] = {
		label = "Classic Signature Chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["classic_wings_combo"] = {
		label = "CLASSIC WINGS COMBO",
		weight = 1,
		stack = true,
		close = true,
	},

	["sausage_croissanwich"] = {
		label = "Sausage, Egg, & Cheese CroissanWich",
		weight = 1,
		stack = true,
		close = true,
	},

	["coca_leaf"] = {
		label = "Coca Leaf",
		weight = 1,
		stack = true,
		close = true,
	},

	["seasoned_fries"] = {
		label = "SEASONED FRIES",
		weight = 1,
		stack = true,
		close = true,
	},

	["seed_weed"] = {
		label = "Weed Seed",
		weight = 1,
		stack = true,
		close = true,
	},

	["coke_pooch"] = {
		label = "Coke Pooch",
		weight = 1,
		stack = true,
		close = true,
	},

	["shells_clam_chowder"] = {
		label = "Shells Clam Chowder",
		weight = 1,
		stack = true,
		close = true,
	},

	["cold_brew"] = {
		label = "COLD BREW",
		weight = 1,
		stack = true,
		close = true,
	},

	["shrimp_and_crab_dip"] = {
		label = "Shrimp & Crab Dip",
		weight = 1,
		stack = true,
		close = true,
	},

	["shroom"] = {
		label = "Shroom",
		weight = 1,
		stack = true,
		close = true,
	},

	["shroom_cut"] = {
		label = "Shroom Cut",
		weight = 1,
		stack = true,
		close = true,
	},

	["shroom_pooch"] = {
		label = "Shroom Pooch",
		weight = 1,
		stack = true,
		close = true,
	},

	["cookie_shake"] = {
		label = "OREO Cookie Shake",
		weight = 1,
		stack = true,
		close = true,
	},

	["side_of_flavor"] = {
		label = "SIDE OF FLAVOR",
		weight = 1,
		stack = true,
		close = true,
	},

	["covgari_gold"] = {
		label = "Covgari Gold",
		weight = 1,
		stack = true,
		close = true,
	},

	["signature_latte"] = {
		label = "SIGNATURE LATTE",
		weight = 1,
		stack = true,
		close = true,
	},

	["skull_bracelet"] = {
		label = "Skull Bracelet",
		weight = 1,
		stack = true,
		close = true,
	},

	["skull_earrings"] = {
		label = "Skull Earrings",
		weight = 1,
		stack = true,
		close = true,
	},

	["crack"] = {
		label = "Crack",
		weight = 1,
		stack = true,
		close = true,
	},

	["crack_pooch"] = {
		label = "Crack Pooch",
		weight = 1,
		stack = true,
		close = true,
	},

	["small_hash_browns"] = {
		label = "Small Hash Browns",
		weight = 1,
		stack = true,
		close = true,
	},

	["small_onion_rings"] = {
		label = "Small Onion Rings",
		weight = 1,
		stack = true,
		close = true,
	},

	["snackin_bacon"] = {
		label = "SNACKIN BACON",
		weight = 1,
		stack = true,
		close = true,
	},

	["crispy_tender_combo"] = {
		label = "LARGE 5 PC CRISPY TENDER COMBO",
		weight = 1,
		stack = true,
		close = true,
	},

	["croissanwich_meal"] = {
		label = "Sausage, Egg & Cheese Small",
		weight = 1,
		stack = true,
		close = true,
	},

	["crowex_black"] = {
		label = "Crowex Black",
		weight = 1,
		stack = true,
		close = true,
	},

	["crowex_brown"] = {
		label = "Crowex Brown",
		weight = 1,
		stack = true,
		close = true,
	},

	["soft_serve_cup"] = {
		label = "Soft Serve Cup",
		weight = 1,
		stack = true,
		close = true,
	},

	["crunchwrap_supreme_meal"] = {
		label = "Crunchwrap Supreme Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["sourdough_breakfast_sandwich"] = {
		label = "ICED CAPPUCCINO",
		weight = 1,
		stack = true,
		close = true,
	},

	["dab"] = {
		label = "DAB",
		weight = 1,
		stack = true,
		close = true,
	},

	["speedball"] = {
		label = "Speed Ball",
		weight = 1,
		stack = true,
		close = true,
	},

	["spice_joint"] = {
		label = "Spice Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["spice_leaf"] = {
		label = "Spice Leaf",
		weight = 1,
		stack = true,
		close = true,
	},

	["diagold_earrings"] = {
		label = "Diagold Earrings",
		weight = 1,
		stack = true,
		close = true,
	},

	["diaplatinum_earrings"] = {
		label = "Diaplatinum Earrings",
		weight = 1,
		stack = true,
		close = true,
	},

	["dom_perignon"] = {
		label = "Dom Perignon",
		weight = 1,
		stack = true,
		close = true,
	},

	["double_cheeseburger"] = {
		label = "Double Cheeseburger",
		weight = 1,
		stack = true,
		close = true,
	},

	["double_cup"] = {
		label = "Double cup",
		weight = 1,
		stack = true,
		close = true,
	},

	["spinach_feta"] = {
		label = "Spinach & Feta",
		weight = 1,
		stack = true,
		close = true,
	},

	["sprite"] = {
		label = "Sprite",
		weight = 1,
		stack = true,
		close = true,
	},

	["steak_and_lobster_meal"] = {
		label = "Steak & Lobster Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["double_sausage_croissanwich"] = {
		label = "Double Sausage, Egg, & Cheese",
		weight = 1,
		stack = true,
		close = true,
	},

	["strawberry_cheesecake_pie"] = {
		label = "Strawberry Cheesecake Fried Pie",
		weight = 1,
		stack = true,
		close = true,
	},

	["strawberry_lemonade"] = {
		label = "Chilled Strawberry Lemonade",
		weight = 1,
		stack = true,
		close = true,
	},

	["strawberry_shake"] = {
		label = "Strawberry Shake",
		weight = 1,
		stack = true,
		close = true,
	},

	["dunkin_americano"] = {
		label = "AMERICANO",
		weight = 1,
		stack = true,
		close = true,
	},

	["dunkin_bacon_egg_cheese"] = {
		label = "BACON, EGG & CHEESE",
		weight = 1,
		stack = true,
		close = true,
	},

	["dunkin_coffee"] = {
		label = "COFFEE",
		weight = 1,
		stack = true,
		close = true,
	},

	["dunkin_croissant"] = {
		label = "CROISSANT",
		weight = 1,
		stack = true,
		close = true,
	},

	["dunkin_donuts"] = {
		label = "DONUTS",
		weight = 1,
		stack = true,
		close = true,
	},

	["dunkin_hash_browns"] = {
		label = "HASH BROWNS",
		weight = 1,
		stack = true,
		close = true,
	},

	["dunkin_latte"] = {
		label = "LATTE",
		weight = 1,
		stack = true,
		close = true,
	},

	["dunkin_macchiato"] = {
		label = "MACCHIATO",
		weight = 1,
		stack = true,
		close = true,
	},

	["dunkin_muffins"] = {
		label = "MUFFINS",
		weight = 1,
		stack = true,
		close = true,
	},

	["dunkin_refresher"] = {
		label = "DUNKIN REFRESHERS",
		weight = 1,
		stack = true,
		close = true,
	},

	["dunkin_tea"] = {
		label = "TEA",
		weight = 1,
		stack = true,
		close = true,
	},

	["d_coca_cola"] = {
		label = "Coca Cola",
		weight = 1,
		stack = true,
		close = true,
	},

	["d_dr_pepper"] = {
		label = "Dr Pepper",
		weight = 1,
		stack = true,
		close = true,
	},

	["d_fanta_orange"] = {
		label = "Fanta Orange",
		weight = 1,
		stack = true,
		close = true,
	},

	["d_fruit_punch"] = {
		label = "Fruit Punch",
		weight = 1,
		stack = true,
		close = true,
	},

	["d_sprite"] = {
		label = "Sprite",
		weight = 1,
		stack = true,
		close = true,
	},

	["earrings_sgold"] = {
		label = "Earrings SGold",
		weight = 1,
		stack = true,
		close = true,
	},

	["thirty_crispy_tenders."] = {
		label = "30 CRISPY TENDERS",
		weight = 1,
		stack = true,
		close = true,
	},

	["tilapia_fish_meal"] = {
		label = "Steak & Lobster Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["triple_meal_deal"] = {
		label = "Chicken Biscuit",
		weight = 1,
		stack = true,
		close = true,
	},

	["tropical_chicken_salad"] = {
		label = "Tropical Chicken Salad",
		weight = 1,
		stack = true,
		close = true,
	},

	["empty_cup"] = {
		label = "Lean cup",
		weight = 1,
		stack = true,
		close = true,
	},

	["empty_lean_bottle"] = {
		label = "Empty Lean Bottle",
		weight = 1,
		stack = true,
		close = true,
	},

	["ergot"] = {
		label = "Ergot",
		weight = 1,
		stack = true,
		close = true,
	},

	["t_pepsi_max"] = {
		label = "Pepsi Max",
		weight = 1,
		stack = true,
		close = true,
	},

	["extra_vagan_zza"] = {
		label = "Extra Vagan ZZa",
		weight = 1,
		stack = true,
		close = true,
	},

	["ultimate_pepperoni"] = {
		label = "Ultimate Pepperoni",
		weight = 1,
		stack = true,
		close = true,
	},

	["family_bundle_classic"] = {
		label = "Family Bundle Classic",
		weight = 1,
		stack = true,
		close = true,
	},

	["fentanyl_pill"] = {
		label = "Fentanyl Pill",
		weight = 1,
		stack = true,
		close = true,
	},

	["fentanyl_pills"] = {
		label = "Fentanyl Pills",
		weight = 1,
		stack = true,
		close = true,
	},

	["vape"] = {
		label = "Vape",
		weight = 1,
		stack = true,
		close = true,
	},

	["veggie_sticks"] = {
		label = "VEGGIE STICKS",
		weight = 1,
		stack = true,
		close = true,
	},

	["volcano_burrito_meal"] = {
		label = "Volcano Burrito Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["flakka"] = {
		label = "Flakka",
		weight = 1,
		stack = true,
		close = true,
	},

	["flakka_joint"] = {
		label = "Flakka Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["watch_material"] = {
		label = "Watch Material",
		weight = 1,
		stack = true,
		close = true,
	},

	["french_toast_sticks"] = {
		label = "3 French Toast Sticks",
		weight = 1,
		stack = true,
		close = true,
	},

	["fresh_baked_rolls"] = {
		label = "FRESH BAKED ROLLS",
		weight = 1,
		stack = true,
		close = true,
	},

	["fried_scallops"] = {
		label = "Fried Scallops",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_fertilizer"] = {
		label = "Weed Fertilizer",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_joint"] = {
		label = "Weed Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_leaf"] = {
		label = "Weed Leaf",
		weight = 1,
		stack = true,
		close = true,
	},

	["garlic_parm_wings"] = {
		label = "Garlic Parm Wings",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_pot"] = {
		label = "Weed Pot",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_spray"] = {
		label = "Weed Spray",
		weight = 1,
		stack = true,
		close = true,
	},

	["glazed_salmon"] = {
		label = "Glazed Salmon",
		weight = 1,
		stack = true,
		close = true,
	},

	["goldak_earrings"] = {
		label = "GoldAK Earrings",
		weight = 1,
		stack = true,
		close = true,
	},

	["goldhex_earrings"] = {
		label = "GoldHex Earrings",
		weight = 1,
		stack = true,
		close = true,
	},

	["goldstone_earrings"] = {
		label = "Goldstone Earrings",
		weight = 1,
		stack = true,
		close = true,
	},

	["gold_bar"] = {
		label = "Gold Bar",
		weight = 1,
		stack = true,
		close = true,
	},

	["gourmet_double_burger"] = {
		label = "Gourmet Double Burger",
		weight = 1,
		stack = true,
		close = true,
	},

	["grabba_leaf"] = {
		label = "Grabba Leaf",
		weight = 1,
		stack = true,
		close = true,
	},

	["wingstop_dips"] = {
		label = "DIPS",
		weight = 1,
		stack = true,
		close = true,
	},

	["wing_combo"] = {
		label = "LARGE 10 PC WING COMBO",
		weight = 1,
		stack = true,
		close = true,
	},

	["wisconsin_cheese"] = {
		label = "Wisconsin 6 Cheese",
		weight = 1,
		stack = true,
		close = true,
	},

	["green_stone"] = {
		label = "Green Stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["w_diet_coke"] = {
		label = "Diet Coke",
		weight = 1,
		stack = true,
		close = true,
	},

	["w_diet_pepsi"] = {
		label = "Det Pepsi",
		weight = 1,
		stack = true,
		close = true,
	},

	["w_dr_pepper"] = {
		label = "Dr Pepper",
		weight = 1,
		stack = true,
		close = true,
	},

	["group_pack"] = {
		label = "WINGS & THIGH BITES GROUP PACK",
		weight = 1,
		stack = true,
		close = true,
	},

	["w_medium_fanta_orange"] = {
		label = "Ice Cola",
		weight = 1,
		stack = true,
		close = true,
	},

	["hamburger_king_jr"] = {
		label = "Hamburger King Jr. Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["w_medium_sprite"] = {
		label = "Medium Sprite",
		weight = 1,
		stack = true,
		close = true,
	},

	["w_tango_apple"] = {
		label = "Tango Apple",
		weight = 1,
		stack = true,
		close = true,
	},

	["w_tango_orange"] = {
		label = "Tango Orange",
		weight = 1,
		stack = true,
		close = true,
	},

	["hennessy_shot"] = {
		label = "Hennessy Shot",
		weight = 1,
		stack = true,
		close = true,
	},

	["heroin"] = {
		label = "Heroin",
		weight = 1,
		stack = true,
		close = true,
	},

	["heroin_brick"] = {
		label = "Heroinbrick",
		weight = 1,
		stack = true,
		close = true,
	},

	["heroin_shot"] = {
		label = "Heroin Shot",
		weight = 1,
		stack = true,
		close = true,
	},

	["hex4you_earrings"] = {
		label = "Hex4You Earrings",
		weight = 1,
		stack = true,
		close = true,
	},

	["hexdia_earrings"] = {
		label = "HexDia Earrings",
		weight = 1,
		stack = true,
		close = true,
	},

	["hex_gold"] = {
		label = "Hex Gold",
		weight = 1,
		stack = true,
		close = true,
	},

	["homestyle_mac_cheese"] = {
		label = "Regular Homestyle Mac & Cheese",
		weight = 1,
		stack = true,
		close = true,
	},

	["honolulu_hawaiian"] = {
		label = "Honolulu Hawaiian",
		weight = 1,
		stack = true,
		close = true,
	},

	["hot_chicken_wrap"] = {
		label = "Hot Chicken Wrap",
		weight = 1,
		stack = true,
		close = true,
	},

	["hundred_wings"] = {
		label = "100 WINGS",
		weight = 1,
		stack = true,
		close = true,
	},

	["iced_cappuccino"] = {
		label = "ICED CAPPUCCINO",
		weight = 1,
		stack = true,
		close = true,
	},

	["iced_macchiatto"] = {
		label = "ICED MACCHIATO",
		weight = 1,
		stack = true,
		close = true,
	},

	["iced_matcha_latte"] = {
		label = "ICED MATCHA LATTE",
		weight = 1,
		stack = true,
		close = true,
	},

	["iced_signaturea_latte"] = {
		label = "ICED SIGNATURE LATTE",
		weight = 1,
		stack = true,
		close = true,
	},

	["italian_sandwich"] = {
		label = "Italian Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["italian_sausage_marinara"] = {
		label = "Italian Sausage Marinara",
		weight = 1,
		stack = true,
		close = true,
	},

	["jolly_candy"] = {
		label = "Jolly Candy",
		weight = 1,
		stack = true,
		close = true,
	},

	["karaoke_earrings"] = {
		label = "Karaoke Earrings",
		weight = 1,
		stack = true,
		close = true,
	},

	["ketamine"] = {
		label = "Ketamine",
		weight = 1,
		stack = true,
		close = true,
	},

	["korean_q_wings"] = {
		label = "Korean Q Wings",
		weight = 1,
		stack = true,
		close = true,
	},

	["kronos_black"] = {
		label = "Kronos Black",
		weight = 1,
		stack = true,
		close = true,
	},

	["kronos_gold"] = {
		label = "Kronos Gold",
		weight = 1,
		stack = true,
		close = true,
	},

	["large_thigh_bites"] = {
		label = "LARGE THIGH BITES",
		weight = 1,
		stack = true,
		close = true,
	},

	["xpills"] = {
		label = "X-Pills",
		weight = 1,
		stack = true,
		close = true,
	},

	["xpill"] = {
		label = "X-Pill",
		weight = 1,
		stack = true,
		close = true,
	},

	["xanax_box"] = {
		label = "Xanax Box",
		weight = 1,
		stack = true,
		close = true,
	},

	["xanax"] = {
		label = "Xanax",
		weight = 1,
		stack = true,
		close = true,
	},

	["w_medium_fanta_strawberry"] = {
		label = "Medium Fanta Strawberry",
		weight = 1,
		stack = true,
		close = true,
	},

	["w_ice_cola"] = {
		label = "Ice Cola",
		weight = 1,
		stack = true,
		close = true,
	},

	["whopper_with_cheese"] = {
		label = "Triple Whopper with Cheese",
		weight = 1,
		stack = true,
		close = true,
	},

	["white_stone"] = {
		label = "White Stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_pooch"] = {
		label = "Weed Pooch",
		weight = 1,
		stack = true,
		close = true,
	},

	["wake_up_wrap"] = {
		label = "WAKE-UP WRAP",
		weight = 1,
		stack = true,
		close = true,
	},

	["vanilla_shake"] = {
		label = "Vanilla Shake",
		weight = 1,
		stack = true,
		close = true,
	},

	["upeel_shrimp"] = {
		label = "U-Peel Shrimp",
		weight = 1,
		stack = true,
		close = true,
	},

	["two_taco_supreme"] = {
		label = "Two Taco Supreme",
		weight = 1,
		stack = true,
		close = true,
	},

	["thigh_bites_combo"] = {
		label = "LARGE THIGH BITES COMBO",
		weight = 1,
		stack = true,
		close = true,
	},

	["texas_double_whopper"] = {
		label = "Texas Double Whopper",
		weight = 1,
		stack = true,
		close = true,
	},

	["tender_pack"] = {
		label = "24PC CRISPY TENDER PACK",
		weight = 1,
		stack = true,
		close = true,
	},

	["tenders_medium_combo"] = {
		label = "Tenders Medium Combo",
		weight = 1,
		stack = true,
		close = true,
	},

	["tenders_family_meal"] = {
		label = "16Pc Tenders Family Meal Mild",
		weight = 1,
		stack = true,
		close = true,
	},

	["syriange"] = {
		label = "Syriange",
		weight = 1,
		stack = true,
		close = true,
	},

	["surf_turf_combo"] = {
		label = "Surf & Turf Small Combo",
		weight = 1,
		stack = true,
		close = true,
	},

	["sun_apple_juice"] = {
		label = "Capri Sun Apple Juice",
		weight = 1,
		stack = true,
		close = true,
	},

	["sundae_pie"] = {
		label = "HERSHEYS Sundae Pie",
		weight = 1,
		stack = true,
		close = true,
	},

	["stuffed_bagel_minis"] = {
		label = "STUFFED BAGEL MINIS",
		weight = 1,
		stack = true,
		close = true,
	},

	["medium_coca_cola"] = {
		label = "Medium Coca-Cola",
		weight = 1,
		stack = true,
		close = true,
	},

	["bottle_diet_coke"] = {
		label = "20oz Bottle Diet Coke",
		weight = 1,
		stack = true,
		close = true,
	},

	["bong"] = {
		label = "Bong",
		weight = 1,
		stack = true,
		close = true,
	},

	["boneless_meal_deal"] = {
		label = "Boneless Meal Deal",
		weight = 1,
		stack = true,
		close = true,
	},

	["mashed_potatoes"] = {
		label = "Regular Mashed Potatoes with Cajun Gravy",
		weight = 1,
		stack = true,
		close = true,
	},

	["steroids"] = {
		label = "Steroids",
		weight = 1,
		stack = true,
		close = true,
	},

	["double_sausage_biscuit"] = {
		label = "Double Sausage, Egg, & Cheese",
		weight = 1,
		stack = true,
		close = true,
	},

	["memphis_bbq_chicken"] = {
		label = "Memphis BBQ Chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["spice_pooch"] = {
		label = "Spice Pooch",
		weight = 1,
		stack = true,
		close = true,
	},

	["soft_serve_cone"] = {
		label = "Soft Serve Cone",
		weight = 1,
		stack = true,
		close = true,
	},

	["crispy_tenders"] = {
		label = "8 PC MEAL FOR 2 CRISPY TENDERS",
		weight = 1,
		stack = true,
		close = true,
	},

	["small_classic_fries"] = {
		label = "Small Classic Fries",
		weight = 1,
		stack = true,
		close = true,
	},

	["crab_legs_meal"] = {
		label = "Crab Legs Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["crab_cakes"] = {
		label = "Crab Cakes",
		weight = 1,
		stack = true,
		close = true,
	},

	["signature_chicken_box"] = {
		label = "10Pc Mild Signature Chicken Box",
		weight = 1,
		stack = true,
		close = true,
	},

	["pacific_veggie"] = {
		label = "Pacific Veggie",
		weight = 1,
		stack = true,
		close = true,
	},

	["paxton_pearl_cigars"] = {
		label = "Paxton Pearl Cigars",
		weight = 1,
		stack = true,
		close = true,
	},

	["coke_rail"] = {
		label = "Coke Rail",
		weight = 1,
		stack = true,
		close = true,
	},

	["cokebrick"] = {
		label = "Coke Brick",
		weight = 1,
		stack = true,
		close = true,
	},

	["perc"] = {
		label = "Perc",
		weight = 1,
		stack = true,
		close = true,
	},

	["perc_pooch"] = {
		label = "Perc Pooch",
		weight = 1,
		stack = true,
		close = true,
	},

	["philly_cheese_sandwich"] = {
		label = "Philly Cheese Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["rodeo_burger"] = {
		label = "Rodeo Burger",
		weight = 1,
		stack = true,
		close = true,
	},

	["quesadilla_cravings"] = {
		label = "Quesadilla Cravings",
		weight = 1,
		stack = true,
		close = true,
	},

	["platinum_bar"] = {
		label = "Platinum Bar",
		weight = 1,
		stack = true,
		close = true,
	},

	["ps_dr_pepper"] = {
		label = "Dr Pepper",
		weight = 1,
		stack = true,
		close = true,
	},

	["platbox_earrings"] = {
		label = "Platbox Earrings",
		weight = 1,
		stack = true,
		close = true,
	},

	["popcorn_shrimp"] = {
		label = "1/4 Popcorn Shrimp Medium Combo",
		weight = 1,
		stack = true,
		close = true,
	},

	["philly_cheese_steak"] = {
		label = "Philly Cheese Steak",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_tea"] = {
		label = "PACKAGED TEA",
		weight = 1,
		stack = true,
		close = true,
	},

	["opium_pooch"] = {
		label = "Opium Pooch",
		weight = 1,
		stack = true,
		close = true,
	},

	["bs_diet_coke"] = {
		label = "Medium Diet Coke",
		weight = 1,
		stack = true,
		close = true,
	},

	["munchkins_donut_hole"] = {
		label = "MUNCHKINS DONUT HOLE TREATS",
		weight = 1,
		stack = true,
		close = true,
	},

	["lean"] = {
		label = "Lean",
		weight = 1,
		stack = true,
		close = true,
	},

	["lean_bottle"] = {
		label = "Lean bottle",
		weight = 1,
		stack = true,
		close = true,
	},

	["blacklightning"] = {
		label = "Black Lightning",
		weight = 1,
		stack = true,
		close = true,
	},

	["backwoods_honey"] = {
		label = "Backwoods Honey",
		weight = 1,
		stack = true,
		close = true,
	},

	["mac_cheese_meal"] = {
		label = "Mac & Cheese Kids Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["document"] = {
		label = "Document",
		weight = 1,
		stack = true,
		close = true,
	},

	["portablecopier"] = {
		label = "Portable Document Copier",
		weight = 1,
		stack = true,
		close = true,
	},

	["emptydocuments"] = {
		label = "Blank Documents",
		weight = 1,
		stack = true,
		close = true,
	},

	["lawyerid"] = {
		label = "Lawyer ID",
		weight = 1,
		stack = true,
		close = true,
	},

	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- FOOD: General

    ['sandwich'] = { -- A simple sandwich for a simple day
        label = 'Sandwich',
        weight = 350,
        stack = true,
        close = true,
        description = "A simple sandwich for a simple day",
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_sandwich_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

    ['burger'] = { -- A test hamburger that you can eat
        label = 'Hamburger',
        weight = 350,
        stack = true,
        close = true,
        description = "A test hamburger that you can eat",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_burger_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

    ['burger_chs'] = { -- A test hamburger that you can eat
        label = 'Cheese Burger',
        weight = 350,
        stack = true,
        close = true,
        description = "A test hamburger that you can eat, with cheese",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_burger_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

    ['burger_chsbcn'] = { -- A test hamburger that you can eat
        label = 'Bacon Cheese Burger',
        weight = 350,
        stack = true,
        close = true,
        description = "A test hamburger that you can eat, with cheese & bacon",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_burger_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

    ['hotdog'] = { -- A test hamburger that you can eat
        label = 'Hotdog',
        weight = 350,
        stack = true,
        close = true,
        description = "Not made with real dogs or meat",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_hotdog_01', 
            pos = vec3(0.06, -0.01, -0.03), rot = vec3(60.0, -90.0, 0.0) },
            usetime = 7500,
        },
    },

    ['noodles'] = { -- Fuck those baked shits are good af
        label = 'Thai Noodles',
        weight = 350,
        stack = true,
        close = true,
        description = "นี่คือบะหมี่",
        client = {
            status = { hunger = 230000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_ret_fh_noodle', 
            pos = vec3(-0.03, 0.01, 0.05), 
            rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['fr_fries'] = { -- A test hamburger that you can eat
        label = 'French Fries',
        weight = 350,
        stack = true,
        close = true,
        description = "Rib flavored chips, made with real wood chips",
        client = {
            status = { hunger = 180000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_food_chips', 
            pos = vec3(-0.01, 0.0, -0.02), rot = vec3(0.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },


    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- FOOD: Pizzas


    ['pizza_pep'] = { -- A simple sandwich for a simple day
        label = 'Peperoni Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "Who put cheese on my pepperoni",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice5', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

    ['pizza_chs'] = { -- A simple sandwich for a simple day
        label = 'Cheese Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "Is it enough cheese? No",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice4', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

    ['pizza_msh'] = { -- A simple sandwich for a simple day
        label = 'Mushroom Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "Fungi on my pizza? Who thought of this?",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice3', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

    ['pizza_mgt'] = { -- A simple sandwich for a simple day
        label = 'Margherita Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "I know, I thought it was alcohol pizza too",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice2', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

    ['pizza_dmt'] = { -- A simple sandwich for a simple day
        label = 'Double Meat Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "When one meat isn't enough and 3 is weird",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice1', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },


    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- FOOD: Snacks


    ['phatc_rib'] = { -- A skeletons favorite snack
        label = 'Phat Chips: Ribs',
        weight = 350,
        stack = true,
        close = true,
        description = "Rib flavored chips, made with real wood chips",
        client = {
            status = { hunger = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_food_chips01b', 
            pos = vec3(0.0, 0.08, 0.05), rot = vec3(90.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },

    ['phatc_bch'] = { -- Biggie Cheese
        label = 'Phat Chips: Big Cheese',
        weight = 350,
        stack = true,
        close = true,
        description = "Cheese flavored chips, made with real rats",
        client = {
            status = { hunger = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_food_chips01a', 
            pos = vec3(0.0, 0.08, 0.05), rot = vec3(90.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },

    ['ps_qs'] = { -- is that candy
        label = 'P\'s & Q\'s',
        weight = 350,
        stack = true,
        close = true,
        description = "Candy make your tongue go brrrr",
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_candy_pqs', 
            pos = vec3(0.0, 0.02, 0.05), rot = vec3(90.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },

    ['apple'] = { -- Apple good
        label = 'Apple',
        weight = 350,
        stack = true,
        close = true,
        description = "Yes, from the trees comes deez apples",
        client = {
            status = { hunger = 90000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'sf_prop_sf_apple_01a', 
            pos = vec3(0.03, -0.02, -0.03), rot = vec3(300.0, 340.0, 170.0) },
            usetime = 3000,
        },
    },

    ['banana'] = { -- banana good
        label = 'Banana',
        weight = 350,
        stack = true,
        close = true,
        description = "b a n a n a n a n a n a",
        client = {
            status = { hunger = 90000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'v_res_tre_banana', 
            pos = vec3(0.05, -0.02, 0.01), rot = vec3(270.0, 90.0, 0.0) },
            usetime = 3000,
        },
    },
    

    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- FOOD: Deserts

    ['donut_chc'] = { -- Fuck those baked shits are good af
        label = 'Chocolate Donut',
        weight = 350,
        stack = true,
        close = true,
        description = "Mmmmm, refrence",
        client = {
            status = { hunger = 150000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_foodpack_donut002', 
            bone = 18905,
            pos = vec3(0.13, 0.050, 0.020), 
            rot = vec3(-50.0, 100.0, 270.0) },
            usetime = 7500,
        },
    },

    ['donut_sby'] = { -- Fuck those baked shits are good af
        label = 'Strawberry Donut',
        weight = 350,
        stack = true,
        close = true,
        description = "Mmmmm, refrence",
        client = {
            status = { hunger = 150000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_foodpack_donut001', 
            bone = 18905,
            pos = vec3(0.13, 0.050, 0.020), 
            rot = vec3(-50.0, 100.0, 270.0) },
            usetime = 7500,
        },
    },

    ['smore'] = { -- Fuck those baked shits are good af
        label = 'Smore',
        weight = 350,
        stack = true,
        close = true,
        description = "Mmmmm, refrence",
        client = {
            status = { hunger = 90000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_food_dessert_a', 
            bone = 18905,
            pos = vec3(0.15, 0.03, 0.03), 
            rot = vec3(-42.0, -36.0, 0.0) },
            usetime = 7500,
        },
    },

    ['icecream_chr'] = { -- brain cold go brrrrr
        label = 'Cherry Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_cherry', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_chc'] = { -- brain cold go brrrrr
        label = 'Chocolate Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_chocolate', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_lmn'] = { -- brain cold go brrrrr
        label = 'Lemon Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_lemon', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_pso'] = { -- brain cold go brrrrr
        label = 'Pistachio Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_pistachio', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_rpy'] = { -- brain cold go brrrrr
        label = 'Raspberry Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_raspberry', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_ckd'] = { -- brain cold go brrrrr
        label = 'Cookie Dough Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_stracciatella', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_sby'] = { -- brain cold go brrrrr
        label = 'Strawberry Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_strawberry', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_vna'] = { -- brain cold go brrrrr
        label = 'Vanilla Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_walnut', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },








    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- DRINKS: General

    ['water'] = { -- Carbonized syrup is good for the soul
        label = 'Water Bottle',
        weight = 350,
        stack = true,
        close = true,
        description = "If you think you need more, you do",
        client = {
            status = { thirst = 330000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'vw_prop_casino_water_bottle_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['milk'] = { -- milky milky milky
        label = 'Milk Carton',
        weight = 350,
        stack = true,
        close = true,
        description = "You need strong bones for crimes",
        client = {
            status = { thirst = 330000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_tt_milk', 
            bone = 18905,
            pos = vec3(0.10, 0.008, 0.070), 
            rot = vec3(240.0, -60.0, 0.0) },
            usetime = 7500,
        },
    },


    -- COFFEES


    ['coffee_black'] = { -- Carbonized syrup is good for the soul
        label = 'Black Coffee',
        weight = 350,
        stack = true,
        close = true,
        description = "As black as the color wheel lets it be",
        client = {
            status = { thirst = 280000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['coffee_mocha'] = { -- Carbonized syrup is good for the soul
        label = 'Mocha',
        weight = 350,
        stack = true,
        close = true,
        description = "What even is a mocha",
        client = {
            status = { thirst = 280000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['coffee_cpcno'] = { -- Carbonized syrup is good for the soul
        label = 'Cappuccino',
        weight = 350,
        stack = true,
        close = true,
        description = "That might wake you up a smidge",
        client = {
            status = { thirst = 280000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['coffee_amrcno'] = { -- Carbonized syrup is good for the soul
        label = 'Americano',
        weight = 350,
        stack = true,
        close = true,
        description = "American coffee, with an o",
        client = {
            status = { thirst = 280000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },


    -- SODAS


    ['ecola'] = { -- Carbonized syrup is good for the soul
        label = 'eCola',
        weight = 350,
        stack = true,
        close = true,
        description = "Hey, there is soda in my cocaine",
        client = {
            status = { thirst = 210000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_ecola_can', 
            pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 130.0) },
            usetime = 5000,
        },
    },

    ['sprunk'] = { -- Carbonized syrup is good for the soul
        label = 'Sprunk',
        weight = 350,
        stack = true,
        close = true,
        description = "It tastes like water punched you in the throat",
        client = {
            status = { thirst = 210000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_sodacan_01b', 
            pos = vec3(0.005, -0.001, 0.08), rot = vec3(0.0, 0.0, 160.0) },
            usetime = 5000,
        },
    },

    ['orangotang'] = { -- Carbonized syrup is good for the soul
        label = 'Orang-o-tang',
        weight = 350,
        stack = true,
        close = true,
        description = "I didn't even know people wanted this",
        client = {
            status = { thirst = 210000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_orang_can_01', 
            pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 130.0) },
            usetime = 5000,
        },
    },

    ['ejunk'] = { -- Drinking too much of this wont kill you. I think.
        label = 'Junk Energy',
        weight = 350,
        stack = true,
        close = true,
        description = "Drinking too much of this wont kill you. I think.",
        client = {
            status = { thirst = 210000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'sf_prop_sf_can_01a', 
            pos = vec3(0.025, 0.010, 0.05), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 5000,
        },
    },










    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- ALCOHOL: Beers
    ['rancho_beer'] = { -- Good ol imported beer from mexico
        label = 'Cerbesa Barracho',
        weight = 290,
        stack = true,
        close = true,
        description = "Good ol imported beer from mexico",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_beer_bottle', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['dusche_beer'] = { -- Good ol imported beer from germany
        label = 'Dusche Beer',
        weight = 290,
        stack = true,
        close = true,
        description = "Good ol imported beer from germany",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_beerdusche', 
            pos = vec3(0.01, -0.01, -0.12), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 7500,
        },
    },

    ['blarny_beer'] = { -- Good ol imported beer from italy
        label = 'Blarny\'s Stout',
        weight = 290,
        stack = true,
        close = true,
        description = "Good ol imported stout from ireland",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_beer_blr', 
            pos = vec3(0.01, -0.02, -0.15), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 7500,
        },
    },

    ['patriot_beer'] = { -- Good ol homemade beer from the brewery
        label = 'Patriot Beer',
        weight = 290,
        stack = true,
        close = true,
        description = "Good ol homemade beer from the brewery",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_beer_patriot', 
            pos = vec3(0.01, -0.02, -0.15), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 7500,
        },
    },










    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- ALCOHOL: Bottles
    ['bb_bourgeoix'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Bourgeoix Cognac',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_bottle_cognac', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['bb_cariaque'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Cariaque Bourbon',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_bottle_brandy', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['cb_bleuterd'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Bleuter\'d Champagne',
        weight = 290,
        stack = true,
        close = true,
        description = "For those fancy events",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_champ_01b', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['rb_ragga'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Ragga Rum',
        weight = 290,
        stack = true,
        close = true,
        description = "A pirates drink for me",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_rum_bottle', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['tb_tequilya'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Tequilya Tequila',
        weight = 290,
        stack = true,
        close = true,
        description = "For extra kick, add snake venom",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_tequila_bottle', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['vb_nogo'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Nogo Vodka',
        weight = 290,
        stack = true,
        close = true,
        description = "Chilled like the mountains of Siberia",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_vodka_bottle', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['wb_mount'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Mount Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "The cowboy's choice for getting plastered",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_cs_whiskey_bottle', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['wb_richards'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Richard\'s Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "For the refined taste buds you so clearly have",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_bottle_richard', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },










    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- ALCOHOL: Glasses
    ['bg_bourgeiox'] = { -- Good ol imported beer from mexico
        label = 'Glass of Bourgeoix Cognac',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 70000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['bg_cariaque'] = { -- Good ol imported beer from mexico
        label = 'Glass of Cariaque Bourbon',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 70000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['bs_bourgeiox'] = { -- Good ol imported beer from mexico
        label = 'Shot of Bourgeoix Cognac',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

    ['bs_cariaque'] = { -- Good ol imported beer from mexico
        label = 'Shot of Cariaque Bourbon',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

    ['cg_bleuterd'] = { -- Good ol imported beer from mexico
        label = 'Glass of Bleuter\'d Champagne',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 70000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_champ', 
            pos = vec3(0.16, -0.19, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['tg_martini'] = { -- Good ol imported beer from mexico
        label = 'Martini',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_tequila', 
            pos = vec3(0.16, -0.12, -0.06), 
            rot = vec3(280.00, 90.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['tg_sunrise'] = { -- Good ol imported beer from mexico
        label = 'Tequilya Sunrise',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_tequsunrise', 
            pos = vec3(0.16, -0.1, -0.05), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['tg_tequilya'] = { -- Good ol imported beer from mexico
        label = 'Glass of Tequilya',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 70000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['ts_tequilya'] = { -- Good ol imported beer from mexico
        label = 'Shot of Tequilya',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

    ['vg_nogo'] = { -- Good ol imported beer from mexico
        label = 'Glass of Nogo Vodka',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 70000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['vs_nogo'] = { -- Good ol imported beer from mexico
        label = 'Shot of Nogo Vodka',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

    ['wg_mount'] = { -- Good ol imported beer from mexico
        label = 'Glass of Mount Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 70000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['wg_richards'] = { -- Good ol imported beer from mexico
        label = 'Glass of Richard\'s Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 70000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['ws_mount'] = { -- Good ol imported beer from mexico
        label = 'Shot of Mount Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

    ['ws_richards'] = { -- Good ol imported beer from mexico
        label = 'Shot of Richard\'s Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },
    







    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- USABLES: Beer crates
    ['box_rancho_beer'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Rancho Beer',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love beer",
    },

    ['box_dusche_beer'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Dusche Beer',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love beer",
    },

    ['box_blarny_beer'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Blarny\'s Stout',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love beer",
    },

    ['box_patriot_beer'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Patriot Beer',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love beer",
    },

    ['box_bourgeoix_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Bourgeoix Cognac',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },

    ['box_cariaque_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Cariaque Bourbon',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },

    ['box_bleuterd_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Bleuter\'d Champagne',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },

    ['box_ragga_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Ragga Rum',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },

    ['box_tequilya_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Tequilya Tequila',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },

    ['box_nogo_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Nogo Vodka',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },

    ['box_mount_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Mount Whiskey',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },

    ['box_richards_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Richard\'s Whiskey',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },

    ['cig_69brand'] = { 
        label = 'Pack of 69Brand Smokes',
        weight = 250,
        stack = false,
        consume = 0.08,
        description = "Good for your lungs",
    },

    ['cig_redwood'] = { 
        label = 'Pack of Redwood Smokes',
        weight = 250,
        stack = false,
        consume = 0.08,
        description = "Good for your lungs",
    },

    ['cig_debonaire'] = { 
        label = 'Pack of Debonaire Smokes',
        weight = 250,
        stack = false,
        consume = 0.08,
        description = "Good for your lungs",
    },

    ['cigar'] = { 
        label = 'Cigar',
        weight = 115,
        description = "These REALLY aren't good for you, but fuck it",
    },

    -- If you are below the mpchristmas3 update, change the prop to 'ba_prop_battle_vape_01'
    ['vape'] = {
        label = 'Vape',
        weight = 115,
        description = "Vape-nash bruh, tastes like dissapointment",
        consume = 0,
        degrade = 60,
    },

    ['armor_l1'] = { 
        label = 'Light Ballistic Vest',
        weight = 3000,
        stack = false,
        description = "Bullts hurt a bit less with this",
    },

    ['armor_l2'] = { 
        label = 'Medium Ballistic Vest',
        weight = 4000,
        stack = false,
        description = "Bullets hurt a lot less with this",
    },

    ['armor_l3'] = { 
        label = 'Heavy Ballistic Vest',
        weight = 4500,
        stack = false,
        description = "Keep the extra bullets for personal vest flair",
    },

    ['parachute'] = { 
        label = 'Parachute',
        weight = 3000,
        stack = false,
        description = "For your sake, I hope it opens at the last second",
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 1500
        }
    },

    ['lockpick'] = { 
        label = 'Lockpicks',
        weight = 115,
        description = "Modern problems require sneaky solutions",
    },

    ['money'] = { 
        label = 'Money',
        weight = 0.05,
        description = "The root of all evil and payer of rent",
    },

    ['black_money'] = { 
        label = 'Marked Bills',
        weight = 0.05,
        description = "If you don't wash this, you can't use them. And you're stinky",
    },


	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- USABLE: Tools
    ['bomb_exps'] = {
        label = 'I.E.D.',
        weight = 8500,
        description = "An improvised explosive device. In a bag",
        consume = 1,
        stack = false,
        close = true,
    },

    ['bomb_gas'] = {
        label = 'I.G.D.',
        weight = 8500,
        description = "An improvised explosive gas device. In a bag",
        consume = 1,
        stack = false,
        close = true,
    },

    ['vehkit_repair'] = { 
        label = 'Car Repair Kit',
        weight = 2500,
        consume = 1,
        description = "A trusty kit to fix even the dankest of dents",
    },

    ['vehkit_clean'] = { 
        label = 'Car Cleaning Kit',
        weight = 2500,
        consume = 1,
        description = "A trusty kit to fix even the dankest of dents",
    },

    ['divegear'] = { 
        label = 'Diving Gear',
        weight = 1500,
        consume = 0,
        description = "I can hold my breath longer than you can",
    },

	['outfitbag'] = {
		label = 'Outfitbag',
		weight = 20,
		stack = true,
		description = "Personal bag for your clothes",
	},

	["davidoffcigar"] = {
		label = "davidoffcigar",
		weight = 1,
		stack = true,
		close = true,
	},

	["redwcig"] = {
		label = "redwcig",
		weight = 1,
		stack = true,
		close = true,
	},

	["blue_dream_bag"] = {
		label = "blue_dream_bag",
		weight = 1,
		stack = true,
		close = true,
	},

	["blue_dream_joint"] = {
		label = "blue_dream_joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["redw"] = {
		label = "redw",
		weight = 1,
		stack = true,
		close = true,
	},

	["og_kush_bag"] = {
		label = "og_kush_bag",
		weight = 1,
		stack = true,
		close = true,
	},

	["og_kush_joint"] = {
		label = "og_kush_joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["marlboro"] = {
		label = "marlboro",
		weight = 1,
		stack = true,
		close = true,
	},

	["marlborocig"] = {
		label = "marlborocig",
		weight = 1,
		stack = true,
		close = true,
	},

	["purple_haze_joint"] = {
		label = "purple_haze_joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["banana_kush_bag"] = {
		label = "banana_kush_bag",
		weight = 1,
		stack = true,
		close = true,
	},

	["banana_kush_joint"] = {
		label = "banana_kush_joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["cubancigar"] = {
		label = "cubancigar",
		weight = 1,
		stack = true,
		close = true,
	},

	["purple_haze_bag"] = {
		label = "purple_haze_bag",
		weight = 1,
		stack = true,
		close = true,
	},

	["WEAPON_G30"] = {
		label = "Glock 30",
		weight = 2,
		stack = true,
		close = true,
	},

	["WEAPON_GARDONE"] = {
		label = "H&L Gardone",
		weight = 1,
		stack = true,
		close = true,
	},

	["WEAPON_M870"] = {
		label = "Remington M870",
		weight = 1,
		stack = true,
		close = true,
	},

	["WEAPON_MAC"] = {
		label = "Mac 10",
		weight = 3,
		stack = true,
		close = true,
	},

	["WEAPON_NSR"] = {
		label = "NSR",
		weight = 1,
		stack = true,
		close = true,
	},

	["WEAPON_P226"] = {
		label = "P226R",
		weight = 2,
		stack = true,
		close = true,
	},

	["WEAPON_PAINTBALL"] = {
		label = "PaintBall Gun",
		weight = 2,
		stack = true,
		close = true,
	},

	["WEAPON_TEC9"] = {
		label = "TEC-9",
		weight = 3,
		stack = true,
		close = true,
	},

	["WEAPON_BARRETT"] = {
		label = "Barrett 50",
		weight = 1,
		stack = true,
		close = true,
	},

	["WEAPON_DRACO"] = {
		label = "Mini Drac",
		weight = 1,
		stack = true,
		close = true,
	},

	["WEAPON_FNX"] = {
		label = "FNX",
		weight = 1,
		stack = true,
		close = true,
	},

	["WEAPON_G17"] = {
		label = "Glock 17",
		weight = 1,
		stack = true,
		close = true,
	},

	["WEAPON_G18C"] = {
		label = "Glock 18C",
		weight = 1,
		stack = true,
		close = true,
	},

	["WEAPON_SIG516"] = {
		label = "SIG516",
		weight = 1,
		stack = true,
		close = true,
	},

	["backpack1"] = {
		label = "backpack1",
		weight = 15,
		stack = false,
		close = true,
		description = "A stylish backpack"
   },
   ["backpack2"] = {
		label = "backpack2",
		weight = 15,
		stack = false,
		close = true,
		description = "A stylish backpack"
   },
   ["duffle1"] = {
		label = "Duffle bag",
		weight = 15,
		stack = false,
		close = true,
		description = "A stylish duffle bag"
   },
   ["briefcase"] = {
		label = "Briefcase",
		weight = 10,
		stack = false,
		close = true,
		description = "A portable rectangular case used for carrying important documents, files, or other personal belongings."
   },
   ["paramedicbag"] = {
		label = "Paramedic bag",
		weight = 5,
		stack = false,
		close = true,
		description = "A medical bag used by paramedics, containing essential supplies for emergency care."
   },
   ["policepouches"] = {
		label = "Police Pouch",
		weight = 5,
		stack = false,
		close = true,
		description = "A pouch used by police officers to store and carry essential supplies such as handcuffs, pepper spray, and other tactical equipment."
   },
   ["policepouches1"] = {
		label = "Police Pouch",
		weight = 5,
		stack = false,
		close = true,
		description = "A larger version of the police pouch used to store additional tactical gear and equipment."
   },
   
   ["briefcaselockpicker"] = {
		label = "Briefcase Lockpicker",
		weight = 0.5,
		stack = true,
		close = true,
		description = "Briefcase Lockpicker"
   },

   ["buspirone"] = {
	label = "Buspirone",
	weight = 1,
	stack = true,
	close = true,
    },

	["propranolol"] = {
		label = "Propranolol",
		weight = 1,
		stack = true,
		close = true,
	},

	["methadone"] = {
		label = "Methadone",
		weight = 1,
		stack = true,
		close = true,
	},

	["antimdma"] = {
		label = "Antimdma",
		weight = 1,
		stack = true,
		close = true,
	},

	['drugtablefan'] = {
		label = 'drugtablefan',
		weight = 1,
		stack = false,
	},
	['weedtable'] = {
		label = 'weedtable',
		weight = 1,
		stack = false,
	},
	['coketable'] = {
		label = 'coketable',
		weight = 1,
		stack = false,
	},
	['methtable'] = {
		label = 'methtable',
		weight = 1,
		stack = false,
	},
	['water_bottle'] = {
		label = 'water_bottle',
		weight = 1,
		stack = true,
	},
	['weedleaf'] = {
		label = 'weedleaf',
		weight = 1,
		stack = true,
	},

	["handcuff_key"] = {
		label = "Handcuff Key",
		weight = 1,
		stack = true,
		close = true,
	},

	["cam_hacking"] = {
		label = "Camera Hack",
		weight = 1,
		stack = true,
		close = true,
	},

	["sheriff_bulletproof"] = {
		label = "Sheriff Bulletproof",
		weight = 1,
		stack = true,
		close = true,
	},

	["police_bulletproof"] = {
		label = "Police Bulletproof",
		weight = 1,
		stack = true,
		close = true,
	},
	
	['corn_raw'] = {
		label = 'Raw Corn',
		weight = 1,
		stack = true,
		close = true,
		description = "You will need to process this."
	},
	
	['corn'] = {
		label = 'Corn',
		weight = 1,
		stack = true,
		close = true,
	},
	
	['tomato_seed'] = {
		label = 'Tomato Seed',
		weight = 1,
		stack = true,
		close = true,
		description = "This is a seed that grows a tomato."
	},
	
	['tomato_raw'] = {
		label = 'Raw Tomato',
		weight = 1,
		stack = true,
		close = true,
		description = "You will need to process this."
	},
	
	['tomato'] = {
		label = 'Tomato',
		weight = 1,
		stack = true,
		close = true,
	},
	
	['wheat_seed'] = {
		label = 'Wheat Seed',
		weight = 1,
		stack = true,
		close = true,
		description = "This is a seed that grows Wheat."
	},
	
	['wheat_raw'] = {
		label = 'Raw Wheat',
		weight = 1,
		stack = true,
		close = true,
		description = "You will need to process this."
	},
	
	['wheat'] = {
		label = 'Wheat',
		weight = 1,
		stack = true,
		close = true,
	},
	
	['broccoli_seed'] = {
		label = 'Broccoli Seed',
		weight = 1,
		stack = true,
		close = true,
		description = "This is a seed that grows broccoli."
	},
	
	['broccoli_raw'] = {
		label = 'Raw Broccoli',
		weight = 1,
		stack = true,
		close = true,
		description = "You will need to process this."
	},
	
	['broccoli'] = {
		label = 'Broccoli',
		weight = 1,
		stack = true,
		close = true,
	},
	
	['carrot_seed'] = {
		label = 'Carrot Seed',
		weight = 1,
		stack = true,
		close = true,
		description = "This is a seed that grows a carrot."
	},
	
	['carrot_raw'] = {
		label = 'Raw Carrot',
		weight = 1,
		stack = true,
		close = true,
		description = "You will need to process this."
	},
	
	['carrot'] = {
		label = 'Carrot',
		weight = 1,
		stack = true,
		close = true,
	},
	
	['potato_seed'] = {
		label = 'Potato Seed',
		weight = 1,
		stack = true,
		close = true,
		description = "This is a seed that grows a potato."
	},
	
	['potato_raw'] = {
		label = 'Raw Potato',
		weight = 1,
		stack = true,
		close = true,
		description = "You will need to process this."
	},
	
	['potato'] = {
		label = 'Potato',
		weight = 1,
		stack = true,
		close = true,
	},
	
	['pickle_seed'] = {
		label = 'Pickle Seed',
		weight = 1,
		stack = true,
		close = true,
		description = "This is a seed that grows a pickle."
	},
	
	['pickle_raw'] = {
		label = 'Raw Pickle',
		weight = 1,
		stack = true,
		close = true,
		description = "You will need to process this."
	},
	
	['pickle'] = {
		label = 'Pickle',
		weight = 1,
		stack = true,
		close = true,
	},
	
	['weed_seed'] = {
		label = 'Weed Seed',
		weight = 1,
		stack = true,
		close = true,
		description = "This is a seed that grows weed."
	},
	
	['weed_raw'] = {
		label = 'Raw Weed',
		weight = 1,
		stack = true,
		close = true,
		description = "You will need to process this."
	},
	
	['weed'] = {
		label = 'Weed',
		weight = 1,
		stack = true,
		close = true,
	},
	
	['cocaine_seed'] = {
		label = 'Cocaine Seed',
		weight = 1,
		stack = true,
		close = true,
		description = "This is a seed that grows cocaine."
	},
	
	['cocaine_raw'] = {
		label = 'Raw Cocaine',
		weight = 1,
		stack = true,
		close = true,
		description = "You will need to process this."
	},
	
	['cocaine'] = {
		label = 'Cocaine',
		weight = 1,
		stack = true,
		close = true,
	},
	
	['heroin_seed'] = {
		label = 'Heroin Seed',
		weight = 1,
		stack = true,
		close = true,
		description = "This is a seed that grows heroin."
	},
	
	['heroin_raw'] = {
		label = 'Raw Heroin',
		weight = 1,
		stack = true,
		close = true,
		description = "You will need to process this."
	},
	
	['heroin'] = {
		label = 'Heroin',
		weight = 1,
		stack = true,
		close = true,
	},
	
	['garden_pitcher'] = {
		label = 'Garden Pitcher',
		weight = 1,
		stack = true,
		close = true,
	},
	
	['garden_shovel'] = {
		label = 'Garden Shovel',
		weight = 1,
		stack = true,
		close = true,
	},

	--Rapsnack Items
	['rapsnack_barbquinwithmyhoney'] = {
		label = 'Barbquin With Honey',
		weight = 1,
		client = {
			anim = 'eating',
                        prop = { model = `rapsnack_barbquinwithmyhoney`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['rapsnack_barbquinwithmyhoneyb'] = {
		label = 'Barbquin With My Honey B',
		weight = 1,
		client = {
			anim = 'eating',
                        prop = { model = `rapsnack_barbquinwithmyhoneyb`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['rapsnack_barbquinwithmyhoneyheat'] = {
		label = 'Barbquin With My Honey Heat',
		weight = 1,
		client = {
			anim = 'eating',
                        prop = { model = `rapsnack_barbquinwithmyhoneyheat`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['rapsnack_cheddarbbq'] = {
		label = 'Cheddar BBQ',
		weight = 1,
		client = {
			anim = 'eating',
                        prop = { model = `rapsnack_cheddarbbq`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['rapsnack_crucnhycurl'] = {
		label = 'Crucnhy Curl',
		weight = 1,
		client = {
			anim = 'eating',
                        prop = { model = `rapsnack_crucnhycurl`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['rapsnack_crucnhycurlshot'] = {
		label = 'Crucnhy Curl',
		weight = 1,
		client = {
			anim = 'eating',
                        prop = { model = `rapsnack_crucnhycurlshot`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['rapsnack_heatcheesepuffs'] = {
		label = 'Heat Cheese Puffs',
		weight = 1,
		client = {
			anim = 'eating',
                        prop = { model = `rapsnack_heatcheesepuffs`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['rapsnack_honeydrip'] = {
		label = 'Honey Drip',
		weight = 1,
		client = {
			anim = 'eating',
                        prop = { model = `rapsnack_honeydrip`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['rapsnack_honeyjalapeno'] = {
		label = 'Honey Jalapeno',
		weight = 1,
		client = {
			anim = 'eating',
                        prop = { model = `rapsnack_honeyjalapeno`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['rapsnack_honeyjalapenob'] = {
		label = 'Honey Jalapenob',
		weight = 1,
		client = {
			anim = 'eating',
                        prop = { model = `rapsnack_honeyjalapeno`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['rapsnack_jerkbbq'] = {
		label = 'Jerk BBQ',
		weight = 1,
		client = {
			anim = 'eating',
                        prop = { model = `rapsnack_jerkbbq`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['rapsnack_louisianaheat'] = {
		label = 'Louisiana Heat',
		weight = 1,
		client = {
			anim = 'eating',
                        prop = { model = `rapsnack_louisianaheat`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['rapsnack_notoruousbighoneyjalapeno'] = {
		label = 'Notoruous Bighoney Jalapeno',
		weight = 1,
		client = {
			anim = 'eating',
                        prop = { model = `rapsnack_notoruousbighoneyjalapeno`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['rapsnack_redhotcheddar'] = {
		label = 'Redhot Cheddar',
		weight = 1,
		client = {
			anim = 'eating',
                        prop = { model = `rapsnack_redhotcheddar`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
	['rapsnack_sourcreamwithadabofranch'] = {
		label = 'Sourcream With Adabo Franch',
		weight = 1,
		client = {
			anim = 'eating',
                        prop = { model = `rapsnack_sourcreamwithadabofranch`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
		},
	},
--hunting food
['deer_meat'] = {
	label = 'Meat',
	weight = 1,
	stack = true,
	close = true,
	description = "0"
},
['boar_meat'] = {
	label = 'Meat',
	weight = 1,
	stack = true,
	close = true,
	description = "0"
},
['coyote_meat'] = {
	label = 'Meat',
	weight = 1,
	stack = true,
	close = true,
	description = "0"
},
['pig_meat'] = {
	label = 'Meat',
	weight = 1,
	stack = true,
	close = true,
	description = "0"
},
['rabbit_meat'] = {
	label = 'Meat',
	weight = 1,
	stack = true,
	close = true,
	description = "0"
},
['leather'] = {
	label = 'Leather',
	weight = 1,
	stack = true,
	close = true,
	description = "0"
},
['Suede'] = {
	label = 'Leather',
	weight = 1,
	stack = true,
	close = true,
	description = "0"
},
['cotton'] = {
	label = 'Leather',
	weight = 1,
	stack = true,
	close = true,
	description = "0"
},
['fur'] = {
	label = 'Leather',
	weight = 1,
	stack = true,
	close = true,
	description = "0"
},
['wool'] = {
	label = 'Leather',
	weight = 1,
	stack = true,
	close = true,
	description = "0"
},

['car_registration'] = { label = 'Car Registration', weight = 50, stack = true, allowArmed = false },
['health_insurance'] = { label = 'Health Insurance', weight = 50, stack = true, allowArmed = false },
['insurance'] = { label = 'Car Insurance', weight = 50, stack = true, allowArmed = false },

['copper'] = {
	label = 'Copper',
	weight = 750,
	stack = true,
	close = false,
},

['jackhammer'] = {
    label = 'Jack Hammer',
    weight = 10000,
    stack = false,
    close = true,
},
['pickaxe'] = {
    label = 'Pickaxe',
    weight = 2500,
    stack = false,
    close = true,
},
['shovel'] = {
    label = 'Shovel',
    weight = 1500,
    stack = false,
    close = true,
},

['full_bucket'] = {
    label = 'Full Bucket',
    weight = 1000,
    stack = true,
    close = false,
},
['empty_bucket'] = {
    label = 'Empty Bucket',
    weight =  500,
    stack = true,
    close = false,
},
['gem_rock'] = {
    label = 'Gem Rock',
    weight = 1,
    stack = true,
    close = false,
},
['ruby'] = {
    label = 'Ruby',
    weight = 0.1,
    stack = true,
    close = false,
},
['sapphire'] = {
    label = 'Sapphire',
    weight = 0.1,
    stack = true,
    close = false,
},
['emerald'] = {
    label = 'Emerald',
    weight = 0.1,
    stack = true,
    close = false,
},

-- By deault ox_inventory has a diamond item but if you removed it include this
['diamond'] = {
    label = 'Diamond',
    weight = 1,
    stack = true,
    close = true,
    description = nil
},

	["mining_copperbar"] = {
		label = "Copper Bar",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_copperfragment"] = {
		label = "Copper Fragment",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_goldbar"] = {
		label = "Gold Bar",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_goldnugget"] = {
		label = "Gold Nugget",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_ironbar"] = {
		label = "Iron Bar",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_ironfragment"] = {
		label = "Iron Nugget",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_pan"] = {
		label = "Pan",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_pickaxe"] = {
		label = "Pickaxe",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_stone"] = {
		label = "Dirty Stone ",
		weight = 1,
		stack = true,
		close = true,
	},

	["mining_washedstone"] = {
		label = "Washed Stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["meat"] = {
		label = "Meat",
		weight = 1,
		stack = true,
		close = true,
	},

	["clothing_chain"] = {
        label = "Clothing Chain",
        weight = 1,
        stack = false,
        close = true,
        consume = 0,
        server = {
            export = 'snipe-icebox.useChain',
        }
    },
    ["prop_chain"] = {
        label = "Prop Chain",
        weight = 1,
        stack = false,
        close = true,
        consume = 0,
        server = {
            export = 'snipe-icebox.useChain',
        }
    },

    ["clothing_watch"] = {
        label = "Clothing Watch",
        weight = 1,
        stack = false,
        close = true,
        consume = 0,
        server = {
            export = 'snipe-icebox.useWatch',
        }
    },

    ["diamond"] = {
        label = "Diamond",
        weight = 1,
        stack = true,
        close = true,
    },

    ["ruby"] = {
        label = "Ruby",
        weight = 1,
        stack = true,
        close = true,
    },

    ["buff_diamond"] = {
		label = "Buff Diamond",
		weight = 1,
		stack = true,
		close = true,
	},
    
    ["buff_ruby"] = {
		label = "Buff Ruby",
		weight = 1,
		stack = true,
		close = true,
	},

    ["real_chain_tester"] = {
        label = "Chain Tester (Real)",
        weight = 1,
        stack = true,
        close = true,
    },
    ["fake_chain_tester"] = {
        label = "Chain Tester (Fake)",
        weight = 1,
        stack = true,
        close = true,
    },
	['carplate'] = {
		label = 'Car plate',
		weight = 500,
		stack = true
	},
	['turbo'] = { label = 'Turbo', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['headlights'] = { label = 'Headlights', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['coilovers'] = { label = 'Coilovers', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['coilover_wrenches'] = { label = 'Coilover Wrenches', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['hid_controller'] = { label = 'Hid Controller', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['underglow_controller'] = { label = 'Underglow Controller', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['tint_supplies'] = { label = 'Tint Supplies', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['engine0'] = { label = 'Engine 0', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['engine1'] = { label = 'Engine 1', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['engine2'] = { label = 'Engine 2', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['engine3'] = { label = 'Engine 3', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['engine4'] = { label = 'Engine 4', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['brake0'] = { label = 'Brake 0', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['brake1'] = { label = 'Brake 1', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['brake2'] = { label = 'Brake 2', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['brake3'] = { label = 'Brake 3', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['transmission0'] = { label = 'Transmission 0', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['transmission1'] = { label = 'Transmission 1', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['transmission2'] = { label = 'Transmission 2', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['transmission3'] = { label = 'Transmission 3', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['blackwrap'] = { label = 'Black Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['graywrap'] = { label = 'Gray Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['redwrap'] = { label = 'Red Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['orangewrap'] = { label = 'Orange Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['goldenwrap'] = { label = 'Golden Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['yellowwrap'] = { label = 'Yellow Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['bluewrap'] = { label = 'Blue Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['bronzewrap'] = { label = 'Bronze Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['brownwrap'] = { label = 'Brown Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['whitewrap'] = { label = 'White Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['pinkwrap'] = { label = 'Pink Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['pink2wrap'] = { label = 'Pink 2 Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['purplewrap'] = { label = 'Purple Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['greenwrap'] = { label = 'Green Wrap', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['bluewhiteplate'] = { label = 'Blue White Plate', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['yellowblackplate'] = { label = 'Yellow Black Plate', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['yellowblueplate'] = { label = 'Yellow Blue Plate', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['bluewhite2plate'] = { label = 'Blue White Plate', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['bluewhite3plate'] = { label = 'Blue White Plate', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['diagnosismachine'] = { label = 'Diagnostic Machine', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['airsuspension'] = { label = 'Air Suspension', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['mechaniccamera'] = { label = 'Mechanic Camera', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['nitrous'] = { label = 'Nitrous', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['emptynitrous'] = { label = 'Empty Nitrous', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['tire'] = { label = 'Tire', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['drift_tires'] = { label = 'Drift Tires', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['normal_tires'] = { label = 'Normal Tires', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['repairkit'] = { label = 'Repair Kit', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['advancedrepairkit'] = { label = 'Advanced Repair Kit', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['cleaningkit'] = { label = 'Cleaning Kit', weight = 50, stack = true, allowArmed = false, client = {useitem = 3500} },
    ['metalscrap'] = { label = 'Metalscrap', weight = 50, stack = true, allowArmed = false },
    ['steel'] = { label = 'Steel', weight = 50, stack = true, allowArmed = false },
    ['glass'] = { label = 'Glass', weight = 50, stack = true, allowArmed = false },
    ['rubber'] = { label = 'rubber', weight = 50, stack = true, allowArmed = false },

	["peixegato"] = {
		label = "Catfish",
		weight = 1,
		stack = true,
		close = true,
	},

	["starfish"] = {
		label = "Starfish",
		weight = 1,
		stack = true,
		close = true,
	},

	["salmao"] = {
		label = "Salmon",
		weight = 1,
		stack = true,
		close = true,
	},

	["salmaocozido"] = {
		label = "Cooked Salmon",
		weight = 1,
		stack = true,
		close = true,
	},

	["sardinha"] = {
		label = "Sardine",
		weight = 1,
		stack = true,
		close = true,
	},

	["sardinhacozida"] = {
		label = "Cooked Sardines",
		weight = 1,
		stack = true,
		close = true,
	},

	["fishbait"] = {
		label = "Fish Bait",
		weight = 1,
		stack = true,
		close = true,
	},

	["fishbaitilegal"] = {
		label = "Fish Bait Ilegal",
		weight = 1,
		stack = true,
		close = true,
	},

	["fishingboot"] = {
		label = "Fishing Boot",
		weight = 1,
		stack = true,
		close = true,
	},

	["atum"] = {
		label = "Tuna fish",
		weight = 1,
		stack = true,
		close = true,
	},

	["fishingloot"] = {
		label = "Metal Box",
		weight = 1,
		stack = true,
		close = true,
	},

	["fishinglootbig"] = {
		label = "Treasure Chest",
		weight = 1,
		stack = true,
		close = true,
	},

	["fishingtin"] = {
		label = "Fishing Tin",
		weight = 1,
		stack = true,
		close = true,
	},

	["bacalhau"] = {
		label = "Cod",
		weight = 1,
		stack = true,
		close = true,
	},

	["bacalhaucozido"] = {
		label = "Cooked Cod",
		weight = 1,
		stack = true,
		close = true,
	},

	["shell_2"] = {
		label = "Shell",
		weight = 1,
		stack = true,
		close = true,
	},

	["tamboril"] = {
		label = "Monkfish",
		weight = 1,
		stack = true,
		close = true,
	},

	["fogueira"] = {
		label = "Campfire",
		weight = 1,
		stack = true,
		close = true,
	},

	["cananivel1"] = {
		label = "Fishingrod Nivel 1",
		weight = 1,
		stack = true,
		close = true,
	},

	["cananivel2"] = {
		label = "Fishingrod Nivel 2",
		weight = 1,
		stack = true,
		close = true,
	},

	["cananivel3"] = {
		label = "Fishingrod Nivel 3",
		weight = 1,
		stack = true,
		close = true,
	},

	["cananivel4"] = {
		label = "Fishingrod Nivel 4",
		weight = 1,
		stack = true,
		close = true,
	},

	["cananivel5"] = {
		label = "Fishingrod Nivel 5",
		weight = 1,
		stack = true,
		close = true,
	},

	["beach_shovel"] = {
		label = "Beach Shovel",
		weight = 1,
		stack = true,
		close = true,
	},

	["tubaraomartelo"] = {
		label = "Hammer shark",
		weight = 1,
		stack = true,
		close = true,
	},

	["tubaraotigre"] = {
		label = "Tiger shark",
		weight = 1,
		stack = true,
		close = true,
	},

	["shell"] = {
		label = "Shell",
		weight = 1,
		stack = true,
		close = true,
	},

	["raia"] = {
		label = "Stingray",
		weight = 1,
		stack = true,
		close = true,
	},

	["conch"] = {
		label = "Conch",
		weight = 1,
		stack = true,
		close = true,
	},

	["sea_snail"] = {
		label = "Sea Snail",
		weight = 1,
		stack = true,
		close = true,
	},

	["baleia"] = {
		label = "Whale",
		weight = 1,
		stack = true,
		close = true,
	},

	["rededepescanivel1"] = {
		label = "Fishing net Nivel 1",
		weight = 1,
		stack = true,
		close = true,
	},

	["rededepescanivel2"] = {
		label = "Fishing net Nivel 2",
		weight = 1,
		stack = true,
		close = true,
	},

	["rededepescanivel3"] = {
		label = "Fishing net Nivel 3",
		weight = 1,
		stack = true,
		close = true,
	},

	["rededepescanivel4"] = {
		label = "Fishing net Nivel 4",
		weight = 1,
		stack = true,
		close = true,
	},

	["rededepescanivel5"] = {
		label = "Fishing net Nivel 5",
		weight = 1,
		stack = true,
		close = true,
	},

	["golfinho"] = {
		label = "Dolphin",
		weight = 1,
		stack = true,
		close = true,
	},

	["fishingkey"] = {
		label = "Corroded Key",
		weight = 1,
		stack = true,
		close = true,
	},

	["robalo"] = {
		label = "Sea Bass",
		weight = 1,
		stack = true,
		close = true,
	},

	["linguado"] = {
		label = "Sole",
		weight = 1,
		stack = true,
		close = true,
	},

	["anchor"] = {
		label = "Anchor",
		weight = 1,
		stack = true,
		close = true,
	},
	["anchor"] = {
		label = "Anchor",
		weight = 20000,
		stack = true,
		close = true,
	},

	["cananivel1"] = {
		label = "Fishing rod 1",
		weight = 2000,
		stack = true,
		close = true,
	},

	["cananivel2"] = {
		label = "Fishing rod 2",
		weight = 2000,
		stack = true,
		close = true,
	},

	["cananivel3"] = {
		label = "Fishing rod 3",
		weight = 2000,
		stack = true,
		close = true,
	},

	["cananivel4"] = {
		label = "Fishing rod 4",
		weight = 2000,
		stack = true,
		close = true,
	},

	["cananivel5"] = {
		label = "Fishing rod 5",
		weight = 2000,
		stack = true,
		close = true,
	},

	["rededepescanivel1"] = {
		label = "Fishing Net 1",
		weight = 1000,
		stack = true,
		close = true,
	},

	["rededepescanivel2"] = {
		label = "Fishing Net 2",
		weight = 1000,
		stack = true,
		close = true,
	},

	["rededepescanivel3"] = {
		label = "Fishing Net 3",
		weight = 1000,
		stack = true,
		close = true,
	},

	["rededepescanivel4"] = {
		label = "Fishing Net 4",
		weight = 1000,
		stack = true,
		close = true,
	},

	["rededepescanivel5"] = {
		label = "Fishing Net 5",
		weight = 1000,
		stack = true,
		close = true,
	},

	["beach_shovel"] = {
		label = "Shovel beach",
		weight = 1000,
		stack = true,
		close = true,
	},

	["fishingboot"] = {
		label = "Old boot",
		weight = 10,
		stack = true,
		close = true,
	},

	["fishingkey"] = {
		label = "Old key",
		weight = 5,
		stack = true,
		close = true,
	},

	["fishingloot"] = {
		label = "Metal box",
		weight = 10,
		stack = true,
		close = true,
	},

	["fishinglootbig"] = {
		label = "Treasure Box",
		weight = 10000,
		stack = true,
		close = true,
	},

	["fishingtin"] = {
		label = "Old can",
		weight = 10,
		stack = true,
		close = true,
	},

	["fogueira"] = {
		label = "Bonfire",
		weight = 100,
		stack = true,
		close = true,
	},

	["fishbait"] = {
		label = "Bait",
		weight = 10,
		stack = true,
		close = true,
	},

	["fishbaitilegal"] = {
		label = "Illegal Bait",
		weight = 15,
		stack = true,
		close = true,
	},

	["atum"] = {
		label = "Tuna",
		weight = 30000,
		stack = true,
		close = true,
	},

	["cavala"] = {
		label = "Mackerel",
		weight = 9000,
		stack = true,
		close = true,
	},

	["bacalhau"] = {
		label = "Mackerel",
		weight = 9000,
		stack = true,
		close = true,
	},

	["baleia"] = {
		label = "Whale",
		weight = 60000,
		stack = true,
		close = true,
	},

	["golfinho"] = {
		label = "Dolphin",
		weight = 50000,
		stack = true,
		close = true,
	},

	["linguado"] = {
		label = "Sole",
		weight = 2500,
		stack = true,
		close = true,
	},

	["peixegato"] = {
		label = "Catfish",
		weight = 25000,
		stack = true,
		close = true,
	},

	["raia"] = {
		label = "Streak",
		weight = 2000,
		stack = true,
		close = true,
	},

	["robalo"] = {
		label = "Sea bass",
		weight = 5000,
		stack = true,
		close = true,
	},

	["salmao"] = {
		label = "Salmon",
		weight = 5000,
		stack = true,
		close = true,
	},

	["sardinha"] = {
		label = "Sardine",
		weight = 130,
		stack = true,
		close = true,
	},

	["tamboril"] = {
		label = "Monkfish",
		weight = 2500,
		stack = true,
		close = true,
	},

	["tubaraomartelo"] = {
		label = "Hammer shark",
		weight = 60000,
		stack = true,
		close = true,
	},

	["tubaraotigre"] = {
		label = "Tiger shark",
		weight = 60000,
		stack = true,
		close = true,
	},

	["conch"] = {
		label = "Conch",
		weight = 2,
		stack = true,
		close = true,
	},

	["starfish"] = {
		label = "Starfish",
		weight = 100,
		stack = true,
		close = true,
	},

	["sea_snail"] = {
		label = "Sea snail",
		weight = 10,
		stack = true,
		close = true,
	},

	["shell"] = {
		label = "Conch",
		weight = 3,
		stack = true,
		close = true,
	},

	["shell2"] = {
		label = "Conch",
		weight = 3,
		stack = true,
		close = true,
	},

	["bacalhaucozido"] = {
		label = "Cooked codfish",
		weight = 250,
		client = {
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You are eating a beautiful cooked cod'
		},
	},

	["salmaocozido"] = {
		label = "Baked Salmon",
		weight = 250,
		client = {
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You\'re eating a nice roasted salmon'
		},
	},

	["sardinhacozida"] = {
		label = "Grilled Sardine",
		weight = 150,
		client = {
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You are eating a beautiful grilled sardine'
		},
	},

	["miner_pcb"] = {
		label = "Miner PCB",
		weight = 1,
		stack = true,
		close = true,
	},

	["asic_miner_fan"] = {
		label = "Asic Miner Fan",
		weight = 1,
		stack = true,
		close = true,
	},

	["antminers9"] = {
		label = "AntminerS9",
		weight = 1,
		stack = true,
		close = true,
	},

	["miner_s9shell"] = {
		label = "AntminerS9 Shell",
		weight = 1,
		stack = true,
		close = true,
	},

	["scratchcard01"] = {
		label = "Scratch Card",
		weight = 1,
		stack = true,
		close = true,
	},

	["scratchcard02"] = {
		label = "Scratch Card",
		weight = 1,
		stack = true,
		close = true,
	},

	["scratchcard03"] = {
		label = "Scratch Card",
		weight = 1,
		stack = true,
		close = true,
	},

	["scratchcard04"] = {
		label = "Scratch Card",
		weight = 1,
		stack = true,
		close = true,
	},

	["scratchcard05"] = {
		label = "Scratch Card",
		weight = 1,
		stack = true,
		close = true,
	},

	["asic_miner_hashing_board"] = {
		label = "Hashing Board",
		weight = 1,
		stack = true,
		close = true,
	},

	["motelkey"] = {
		label = "Motel Key",
		weight = 1,
		stack = false,
		close = true,
	},

	["breads_11"] = {
		label = "Breads 11",
		weight = 1,
		stack = true,
		close = true,
	},
	["Prada_Bag2"] = {
		label = "Prada Bag2",
		weight = 1,
		stack = true,
		close = true,
	},
	["Prada_Bag"] = {
		label = "Prada Bag",
		weight = 1,
		stack = true,
		close = true,
	},
	["Prada_Betty_Boop"] = {
		label = "Prada Bag",
		weight = 1,
		stack = true,
		close = true,
	},
	["Red_bottoms"] = {
		label = "Prada Bag",
		weight = 1,
		stack = true,
		close = true,
	},
	["spice_pooch"] = {
		label = "Spice Pooch",
		weight = 1,
		stack = true,
		close = true,
	},
	["spice_leaf"] = {
		label = "Spice Leaf",
		weight = 1,
		stack = true,
		close = true,
	},
	["vil_gummy"] = {
		label = "Vil Gummy",
		weight = 1,
		stack = true,
		close = true,
	},
	["watch_material"] = {
		label = "Watch Material",
		weight = 1,
		stack = true,
		close = true,
	},
	["watch_material"] = {
		label = "Watch Material",
		weight = 1,
		stack = true,
		close = true,
	},
	["weed_pooch"] = {
		label = "Weed Pooch",
		weight = 1,
		stack = true,
		close = true,
	},
	["whitecherry_gelato"] = {
		label = "Whitecherry Gelato",
		weight = 1,
		stack = true,
		close = true,
	},
	["wig_dye"] = {
		label = "Wig Dye",
		weight = 1,
		stack = true,
		close = true,
	},
	["zushi"] = {
		label = "Zushi",
		weight = 1,
		stack = true,
		close = true,
	},
	["xtc_baggy"] = {
		label = "xtc_baggy",
		weight = 1,
		stack = true,
		close = true,
	},
	["xpills"] = {
		label = "Xpills",
		weight = 1,
		stack = true,
		close = true,
	},
	["angeldust"] = {
		label = "Xpills",
		weight = 1,
		stack = true,
		close = true,
	},
	["Balenciaga"] = {
		label = "Balenciaga",
		weight = 1,
		stack = true,
		close = true,
	},
	["black_tar"] = {
		label = "Black Tar",
		weight = 1,
		stack = true,
		close = true,
	},
	["blacklightning"] = {
		label = "Black Lightning",
		weight = 1,
		stack = true,
		close = true,
	},
	["retro_1"] = {
		label = "Retro",
		weight = 1,
		stack = true,
		close = true,
	},
	["crack_pooch"] = {
		label = "black Toe",
		weight = 1,
		stack = true,
		close = true,
	},
	["crack_baggy"] = {
		label = "black Toe",
		weight = 1,
		stack = true,
		close = true,
	},
	["crack"] = {
		label = "black Toe",
		weight = 1,
		stack = true,
		close = true,
	},
	["double_cup"] = {
		label = "Double Cup",
		weight = 1,
		stack = true,
		close = true,
	},
	["empty_lean_bottle"] = {
		label = "Empty Lean Bottle",
		weight = 1,
		stack = true,
		close = true,
	},
	["empty_cup"] = {
		label = "Empty Cup",
		weight = 1,
		stack = true,
		close = true,
	},
	["ether"] = {
		label = "Ether",
		weight = 1,
		stack = true,
		close = true,
	},
	["fentanyl_pill"] = {
		label = "Fentanyl Pill",
		weight = 1,
		stack = true,
		close = true,
	},
	["fentanyl_pills"] = {
		label = "Fentanyl Pills",
		weight = 1,
		stack = true,
		close = true,
	},
	["fine_china"] = {
		label = "Fine China",
		weight = 1,
		stack = true,
		close = true,
	},
	['burger'] = {
		label = 'Hamburger',
		stack = false,
		weight = 220,
		close = true,
	},

	['chaser'] = {
		label = 'Chaser Choco Bar',
		stack = false,
		weight = 70,
		close = true,
	},

	['meteorite'] = {
		label = 'Meteorite Choco Bar',
		stack = false,
		weight = 80,
		close = true,
	},

	['hotdog'] = {
		label = 'Hotdog',
		stack = false,
		weight = 120,
		close = true,
	},

	['taco'] = {
		label = 'Taco',
		stack = false,
		weight = 100,
		close = true,
	},
	
	['piswasser'] = {
		label = 'Pißwasser',
		stack = false,
		weight = 500,
		close = true,
	},

	['mount_whiskey'] = {
		label = 'The Mount Whiskey',
		stack = false,
		weight = 700,
		close = true,
	},

	['tequila'] = {
		label = 'Tequilya',
		stack = false,
		weight = 700,
		close = true,
	},

	['nogo_vodka'] = {
		label = 'Nogo Vodka',
		stack = false,
		weight = 700,
		close = true,
	},

	['raine'] = {
		label = 'Raine Water',
		stack = false,
		weight = 500,
		close = true,
	},

	['energy_drink'] = {
		label = 'Energy drink',
		stack = false,
		weight = 500,
		close = true,
	},

	['alcotester'] = {
		label = 'Alcohol Tester',
		stack = false,
		weight = 20,
		close = true,
	},

	['sprunk'] = {
		label = 'Sprunk',
		stack = false,
		weight = 330,
		close = true,
	},

	['coffe'] = {
		label = 'Coffe',
		stack = false,
		weight = 330,
		close = true,
	},

	['cola'] = {
		label = 'Cola',
		stack = false,
		weight = 330,
		close = true,
	},


	['costa_del_perro'] = {
		label = 'Costa Del Perro',
		stack = false,
		weight = 500,
		close = true,
	},

	['rockford_hill'] = {
		label = 'Rockford Hill Reserve',
		stack = false,
		weight = 500,
		close = true,
	},

	['vinewood_red'] = {
		label = 'Vinewood Red Zinfadel',
		stack = false,
		weight = 500,
		close = true,
	},

	['vinewood_blanc'] = {
		label = 'Vinewood Sauvignon Blanc',
		stack = false,
		weight = 500,
		close = true,
	},

	['bleuterd'] = {
		label = 'Bleuterd Champagne',
		stack = false,
		weight = 700,
		close = true,
	},

	
	['shot_glass'] = {
		label = 'Glass for shot',
		stack = false,
		weight = 50,
		close = true,
	},
	
	['wine_glass'] = {
		label = 'Glass for wine',
		stack = false,
		weight = 250,
		close = true,
	},

	['flute_glass'] = {
		label = 'Glass for champagne',
		stack = false,
		weight = 250,
		close = true,
	},

	['whiskey_glass'] = {
		label = 'Glass for whiskey',
		stack = false,
		weight = 250,
		close = true,
	},

	['copper'] = {
		label = 'Copper',
		weight = 750,
		stack = true,
		close = false,
	},

	['diamond'] = {
		label = 'Diamond',
		weight = 105,
		stack = true,
		close = false,
	},

	['gold'] = {
		label = 'Gold Bar',
		weight = 950,
		stack = false,
		close = false,
	},

	['iron'] = {
		label = 'Iron',
		weight = 750,
		stack = true,
		close = false,
	},

	['steel'] = {
		label = 'Steel',
		weight = 610,
		stack = true,
		close = false,
	},

	['emerald'] = {
		label = 'Emerald',
		weight = 105,
		stack = true,
		close = false,
	},

	['pickaxe'] = {
		label = 'Pickaxe',
		weight = 450,
		stack = false,
		close = false,
	},

	--BeanMachine

	['almondcroissant'] = {
		label = 'Almond Croissant',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_almondcroissant`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['birthdaycakepopt'] = {
		label = 'Birthday Cakepopt',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_birthdaycakepop`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['blueberrymuffin'] = {
		label = 'Blueberry Muffin',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_blueberrymuffin`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['blueberryoatmeal'] = {
		label = 'Blueberry Oatmeal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_blueberryoatmeal`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['blueberryoatmeal'] = {
		label = 'Blueberry Oatmeal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_blueberryoatmeal`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['buttercroissant'] = {
		label = 'Butter Croissant',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_buttercroissant`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cuttercroissant'] = {
		label = 'Butter Croissant',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_buttercroissant`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cheesedanish'] = {
		label = 'Cheese danish',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_cheesedanish`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['Chocolatecakepop'] = {
		label = 'Chocolate Cake Pop',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_chocolatecakepop`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['classicoatmeal'] = {
		label = 'Classic Oatmeal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_classicoatmeal`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['coffeecuplarge'] = {
		label = 'Coffee Cup Large',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_coffeecuplarge`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['Coffeecupmedium'] = {
		label = 'Coffee Cup Medium',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_coffeecupmedium`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['coffeecupsmall'] = {
		label = 'Coffee Cup Small',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_coffeecupsmall`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['impossiblesbreakfastsandwich'] = {
		label = 'Impossibles Breakfast Sandwich',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_impossiblesbreakfastsandwich`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['pumpkincreamcheesemuffin'] = {
		label = 'Pumpkin Cream Cheese Muffin',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_pumpkincreamcheesemuffin`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['sandwichsmokedbacon'] = {
		label = 'Sandwich Smoked Bacon',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_sandwichsmokedbacon`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['turkeybaconcheddareggwhite'] = {
		label = 'Turkey Bacon Cheddar Egg White',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_sandwichsmokedbacon`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	--Breakfast

	['bigplate_baconeggtoast'] = {
		label = 'Bacon Egg Toast',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `bigplate_baconeggtoast`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['bigplate_cinnamonroll'] = {
		label = 'Cinnamon Roll',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `bigplate_cinnamonroll`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['plate_avocadotoast'] = {
		label = 'Avocado Toast',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `plate_avocadotoast`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['plate_bacon'] = {
		label = 'Bacon',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `plate_bacon`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['plate_baconeggtoast'] = {
		label = 'Bacon Egg Toast',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `plate_baconeggtoast`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['plate_blueberrypancakes'] = {
		label = 'Blueberry Pancakes',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `plate_blueberrypancakes`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['plate_cinnamonroll'] = {
		label = 'Cinnamon Roll',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `plate_cinnamonroll`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['plate_creamcheeseavocadotoast'] = {
		label = 'Cream Cheese Avocado Toast',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `plate_creamcheeseavocadotoast`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['plate_pancakestack'] = {
		label = 'Pancake Stack',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `plate_pancakestack`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['plate_starberrypancakes'] = {
		label = 'Starberry Pancakes',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `plate_starberrypancakes`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['plate_sunnyegg'] = {
		label = 'Sunny Egg',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `plate_starberrypancakes`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['plate_toastsasuageeggs'] = {
		label = 'Toast Sasuage Eggs',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `plate_toastsasuageeggs`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['avocadotoast'] = {
		label = 'Avocado Toast',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_avocadotoast`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['chocolatemilk'] = {
		label = 'Chocolate Milk',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_chocolatemilk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cinnamonroll'] = {
		label = 'Cinnamon Roll',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_cinnamonroll`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['coffeemug'] = {
		label = 'Coffee Mug',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_coffeemug`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['creamcheeseavocadotoast'] = {
		label = 'Cream Cheese Avocado Toast',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_creamcheeseavocadotoast`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['maplesyurp'] = {
		label = 'Maple Syurp',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_maplesyurp`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['milk'] = {
		label = 'Milk',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_milk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['orangejuice'] = {
		label = 'Orange Juice',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `prop_orangejuice`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	--cerealbowls
	['cereal1'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal1`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal2'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal2`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal3'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal3`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal4'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal4`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal5'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal5`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal6'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal6`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal7'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal7`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal8'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal8`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal9'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal9`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal10'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal10`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal11'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal11`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal12'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal12`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal13'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal13`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal14'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal14`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal15'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal15`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal16'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal16`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal17'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal17`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal18'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal18`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal19'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal19`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal20'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal20`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal21'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal21`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal22'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal22`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal23'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal23`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	['cereal24'] = {
		label = 'cereal',
		weight = 10,
		client = {
			status = { hunger = 400000 },
			anim = 'eating',
            prop = { model = `cereal24`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
			usetime = 2500,
		},
	},
	--cocktails

['cocktail_blue'] = {
	label = 'cocktail_blue',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_blue`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_blue2'] = {
	label = 'Cocktail Blue2',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_blue2`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_blue3'] = {
	label = 'Cocktail Blue3',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_blue3`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_blue4'] = {
	label = 'Cocktail Blue4',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_blue4`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_blue5'] = {
	label = 'Cocktail Blue5',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_blue5`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_blue6'] = {
	label = 'Cocktail Blue6',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_blue6`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_blue7'] = {
	label = 'Cocktail Blue7',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_blue7`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_blue8'] = {
	label = 'Cocktail Blue8',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_blue8`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_green'] = {
	label = 'Cocktail Green',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_green`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_green2'] = {
	label = 'Cocktail Green2',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_green2`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_green3'] = {
	label = 'Cocktail Green3',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_green3`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_green4'] = {
	label = 'Cocktail Green4',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_green4`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_green5'] = {
	label = 'Cocktail Green5',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_green5`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_green6'] = {
	label = 'Cocktail Green6',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_green6`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_green7'] = {
	label = 'Cocktail Green7',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_green7`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_green8'] = {
	label = 'Cocktail Green8',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_green8`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_orange'] = {
	label = 'Cocktail Orange',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_orange`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_orange2'] = {
	label = 'Cocktail Orange2',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_orange2`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_orange3'] = {
	label = 'Cocktail Orange3',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_orange3`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_orange4'] = {
	label = 'Cocktail Orange4',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_orange4`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_orange5'] = {
	label = 'Cocktail Orange5',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_orange5`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_orange6'] = {
	label = 'Cocktail Orange6',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_orange6`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_orange7'] = {
	label = 'Cocktail Orange7',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_orange7`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_orange8'] = {
	label = 'Cocktail Orange8',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_orange8`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_purple'] = {
	label = 'Cocktail Purple',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_purple`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_purple2'] = {
	label = 'Cocktail Purple2',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_purple2`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_purple3'] = {
	label = 'Cocktail Purple3',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_purple3`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_purple4'] = {
	label = 'Cocktail Purple4',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_purple4`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_purple5'] = {
	label = 'Cocktail Purple5',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_purple5`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_purple6'] = {
	label = 'Cocktail Purple6',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_purple6`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_purple7'] = {
	label = 'Cocktail Purple7',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_purple7`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_purple8'] = {
	label = 'Cocktail Purple8',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_purple8`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_red'] = {
	label = 'Cocktail Red',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_red`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_red2'] = {
	label = 'Cocktail Red2',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_red2`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_red3'] = {
	label = 'Cocktail Red3',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_red3`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_red4'] = {
	label = 'Cocktail Red4',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_red4`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_red5'] = {
	label = 'Cocktail Red5',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_red5`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_red6'] = {
	label = 'Cocktail Red6',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_red6`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_red7'] = {
	label = 'Cocktail Red7',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_red7`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_red8'] = {
	label = 'Cocktail Red8',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model = `cocktail_red8`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
--cocktailsV2 

['beer_keg'] = {
	label = 'Beer Keg',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `beer_keg` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_jigger'] = {
	label = 'Cocktail Jigger',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `cocktail_jigger` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cocktail_spoon'] = {
	label = 'Cocktail Spoon',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `cocktail_spoon` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['coconutdrink'] = {
	label = 'Coconut Drink',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `coconutdrink` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['cup_moscowmule'] = {
	label = 'Moscow Mule',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `cup_moscowmule` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_baileys'] = {
	label = 'Baileys',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_baileys` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_beerbudweiser'] = {
	label = 'Budweiser',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_beerbudweiser` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_beerempty'] = {
	label = 'empty glass',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_beerempty` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_beerheineken'] = {
	label = 'Heineken',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_beerheineken` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_beernobrand'] = {
	label = 'Beer',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_beernobrand` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_beerstellartois'] = {
	label = 'Stella Artois',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_beerstellartois` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_bluecosmopolitan'] = {
	label = 'Blue Cosmo',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_bluecosmopolitan` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_bluemaita'] = {
	label = 'Blue Maitai',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_bluemaita` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_champagne'] = {
	label = 'Champagne',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_champagne` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_greencosmopolitan'] = {
	label = 'Green Cosmo',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_greencosmopolitan` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_kiwiflight'] = {
	label = 'Kiwi Flight',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_kiwiflight` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_mojito'] = {
	label = 'Mojo',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_mojito` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_pinacolada'] = {
	label = 'Pina Colada',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_pinacolada` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_pinkmaitai'] = {
	label = 'Pink Maitai',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_pinkmaitai` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_redcosmopolitan'] = {
	label = 'Red Cosmo',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_redcosmopolitan` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_seabreeze'] = {
	label = 'Sea Breeze',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_seabreeze` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_shotblue'] = {
	label = 'Blue Shot',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_shotblue` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_shotgreen'] = {
	label = 'Green Shot',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_shotgreen` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_shotorange'] = {
	label = 'Orange Shot',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_shotorange` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_shotpurple'] = {
	label = 'Purple Shot',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_shotpurple` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_strawberrysunrise'] = {
	label = 'Strawerry Sunrise',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_strawberrysunrise` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_summerslushwithvodkablue'] = {
	label = 'Blue Vodka Slush',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_summerslushwithvodkablue` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_summerslushwithvodkagreen'] = {
	label = 'Green Vodka Slush',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_summerslushwithvodkagreen` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_summerslushwithvodkaorange'] = {
	label = 'Orange Vodka Slush',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_summerslushwithvodkaorange` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_summerslushwithvodkapurple'] = {
	label = 'Purple Vodka Slush',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_summerslushwithvodkapurple` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_summerslushwithvodkarainbow'] = {
	label = 'Rainbow Vodka Slush',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_summerslushwithvodkarainbow` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_summerslushwithvodkared'] = {
	label = 'Red Vodka Slush',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_summerslushwithvodkared` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_summerslushwithvodkayellow'] = {
	label = 'Yellow Vodka Slush',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_summerslushwithvodkayellow` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_tropico'] = {
	label = 'Tropico',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_tropico` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_vodka'] = {
	label = 'Vodka',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_vodka` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_vodkabannanapineapple'] = {
	label = 'Banana Pineappla Vodka',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_vodkabannanapineapple` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_vodkanightlava'] = {
	label = 'Nightlava Vodka',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_vodkanightlava` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_vodkaorangesky'] = {
	label = 'Orangesky Vodka',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_vodkaorangesky` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_vodkapeachbeachpunch'] = {
	label = 'Peach Beach Punch Vodka',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_vodkapeachbeachpunch` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_vodkapineapplecherry'] = {
	label = 'Pineapple Cherry Vodka',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_vodkapineapplecherry` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_vodkawatermelonlemonade'] = {
	label = 'Watermelon Lemonade Vodka',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_vodkawatermelonlemonade` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_whisky'] = {
	label = 'Whiskey',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_whisky` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['glass_yellowcosmopolitan'] = {
	label = 'Yellow Cosmo',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `glass_yellowcosmopolitan` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['pineappledrink'] = {
	label = 'Pineapple Juice',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `pineappledrink` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['shaker_black'] = {
	label = 'Black Shaker',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `shaker_black` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['shaker_bronze'] = {
	label = 'Bronze Shaker',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `shaker_bronze` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['shaker_gold'] = {
	label = 'Gold Shaker',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `shaker_gold` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['shaker_silver'] = {
	label = 'Silver Shaker',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `shaker_silver` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
['wine_keg'] = {
	label = 'Wine Keg',
	weight = 500,
	client = {
		status = { thirst = 400000 },
		anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		prop = { model =  `wine_keg` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
		usetime = 2500,
	},
},
--cookiesandbrownies
['brownie_chocolatewithnuts'] = {
	label = 'Brownie Chocolate With Nuts',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `brownie_chocolatewithnuts`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['brownie_cosmic'] = {
	label = 'Brownie Cosmic',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `brownie_cosmic`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['brownie_cosmic2'] = {
	label = 'Brownie Cosmic2',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `brownie_cosmic2`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['brownie_redvelvet'] = {
	label = 'Brownie Redvelvet',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `brownie_redvelvet`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['chocolatemilkglass'] = {
	label = 'Chocolate Milk Glass',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `chocolatemilkglass`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['chocolatemilkglass2'] = {
	label = 'Chocolate Milk Glass2',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `chocolatemilkglass2`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['chocolatemilkglass3'] = {
	label = 'Chocolate Milk Glass3',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `chocolatemilkglass3`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['chocolatemilkglass4'] = {
	label = 'Chocolate Milk Glass4',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `chocolatemilkglass4`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_cake'] = {
	label = 'Cookie Cake',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_cake`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_cake2'] = {
	label = 'Cookie Cake2',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_cake2`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_cake3'] = {
	label = 'Cookie Cake3',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_cake3`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_cake4'] = {
	label = 'Cookie Cake4',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_cake4`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_cake5'] = {
	label = 'Cookie Cake5',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_cake5`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_cake6'] = {
	label = 'Cookie Cake6',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_cake6`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_carameldelites'] = {
	label = 'Cookie Caramel Delites2',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_carameldelites`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_chocolatechip'] = {
	label = 'Cookie Chocolate Chip',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_chocolatechip`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_chocolatechipcremepie'] = {
	label = 'Cookie Chocolate Chip Creme Pie',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_chocolatechipcremepie`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_chocolatepeanutbuttercup'] = {
	label = 'Cookie Chocolate Peanut Butter Cup',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_chocolatepeanutbuttercup`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_confetti'] = {
	label = 'Cookie Confetti',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_confetti`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_dobulechocolatemint'] = {
	label = 'Cookie Dobule Chocolate Mint',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_dobulechocolatemint`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_doublechocolatechunk'] = {
	label = 'Cookie Double Chocolate Chunk',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_doublechocolatechunk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_fudgerounds'] = {
	label = 'Cookie Fudgerounds',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_fudgerounds`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_girlscout'] = {
	label = 'cookie_girlscout',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_girlscout`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_girlscout2'] = {
	label = 'cookie_girlscout2',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_girlscout2`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_girlscout3'] = {
	label = 'cookie_girlscout3',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_girlscout3`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_girlscoutsmores'] = {
	label = 'Cookie Girl Scout Smores',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_girlscoutsmores`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_mandm'] = {
	label = 'Cookie Mandm',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_mandm`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_matchalatte'] = {
	label = 'Cookie Matchalatte',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_matchalatte`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_oatmealcremepie'] = {
	label = 'Cookie Oatmeal Creme Pie',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_oatmealcremepie`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_oatmealraisin'] = {
	label = 'cookie_oatmealraisin',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `Cookie Oatmeal Raisin`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_oatmealwalnut'] = {
	label = 'cookie_oatmealwalnut',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `Cookie Oatmeal Walnut`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_pumpkinspicelatte'] = {
	label = 'cookie_pumpkinspicelatte',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_pumpkinspicelatte`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_saltedcaramel'] = {
	label = 'Cookie Salted Caramel',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_saltedcaramel`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['Cookie_savannahsmiles'] = {
	label = 'Cookie Savannahsmiles',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_savannahsmiles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_smores'] = {
	label = 'Cookie Smores',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_smores`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_snickerdoodle'] = {
	label = 'Cookie Snicker Doodle',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_snickerdoodle`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_starcrunch'] = {
	label = 'Cookie Starcrunch',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_starcrunch`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_sugar'] = {
	label = 'Cookie Sugar',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_sugar`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_trefoil'] = {
	label = 'cookie_trefoil',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_trefoil`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_triplechocolate'] = {
	label = 'Cookie Triple Chocolate',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_triplechocolate`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cookie_whitechocolatemacadamia'] = {
	label = 'cookie White Chocolate Macadamia',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cookie_whitechocolatemacadamia`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['honeybun'] = {
	label = 'honeybun',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `honeybun`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['icecreamcookie_chocolatechip'] = {
	label = 'Icecream Cookie Chocolate Chip',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `icecreamcookie_chocolatechip`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['icecreamcookie_chocolatechunk'] = {
	label = 'Icecream Cookie Chocolate Chunk',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `icecreamcookie_chocolatechip`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['icecreamcookie_chocolatewhitechip'] = {
	label = 'icecream Cookie Chocolate White Chip',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `icecreamcookie_chocolatewhitechip`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['icecreamcookie_chocolatewhitechunk'] = {
	label = 'icecream Cookie Chocolate White Chunk',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `icecreamcookie_chocolatewhitechunk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['icecreamcookie_mandm'] = {
	label = 'icecream Cookie Mandm',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `icecreamcookie_mandm`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['icecreamcookie_peanutbutter'] = {
	label = 'icecream Cookie Peanut Butter',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `icecreamcookie_peanutbutter`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['icecreamcookie_redvelvet'] = {
	label = 'Icecream Cookie Red Velvet',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `icecreamcookie_redvelvet`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['icecreamcookie_saltedcarmel'] = {
	label = 'Ice Cream Cookie Salted Carmel',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `icecreamcookie_saltedcarmel`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['icecreamcookie_sprinkles'] = {
	label = 'Icecream Cookie Sprinkles',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `icecreamcookie_sprinkles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['icecreamcookie_sugar'] = {
	label = 'Icecream Cookie Sugar',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `icecreamcookie_sugar`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['icecreamcookie_sugarpink'] = {
	label = 'Icecream Cookie Sugarpink',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `icecreamcookie_sugarpink`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['icecreamcookie_whitechocolatemacnut'] = {
	label = 'Icecream Cookie white Chocolate Macnut',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `icecreamcookie_whitechocolatemacnut`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['largecookie_chocolatechip'] = {
	label = 'Large Cookie Chocolate Chip',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `largecookie_chocolatechip`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['largecookie_chocolatechunk'] = {
	label = 'Large Cookie Chocolate Chunk',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `largecookie_chocolatechunk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['largecookie_chocolatewhitechip'] = {
	label = 'Large Cookie Chocolate White Chip',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `largecookie_chocolatewhitechip`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['largecookie_chocolatewhitechunk'] = {
	label = 'Large Cookie Chocolate White Chunk',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `largecookie_chocolatewhitechunk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['largecookie_doublechocolatechip'] = {
	label = 'Large Cookie Double Chocolate Chip',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `largecookie_chocolatewhitechunk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['largecookie_mandm'] = {
	label = 'Largecookie Mandm',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `largecookie_mandm`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['largecookie_peanut'] = {
	label = 'Large Cookie Peanut',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `largecookie_peanut`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['largecookie_redvelvet'] = {
	label = 'Large Cookie Redvelvet',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `largecookie_redvelvet`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['largecookie_saltedcarmel'] = {
	label = 'Large Cookie Salted Carmel',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `largecookie_saltedcarmel`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['largecookie_sprinkles'] = {
	label = 'Large Cookie Sprinkles',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `largecookie_sprinkles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['largecookie_sugar'] = {
	label = 'Large Cookie Sugar',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `largecookie_sugar`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['largecookie_sugarpink'] = {
	label = 'Large Cookie Sugar Pink',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `largecookie_sugarpink`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['milkglass'] = {
	label = 'milkglass',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `milkglass`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['milkglass2'] = {
	label = 'milkglass2',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `milkglass2`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['milkglass3'] = {
	label = 'milkglass3',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `milkglass3`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['milkglass4'] = {
	label = 'milkglass4',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `milkglass4`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['vegancookie_chocolatechunk'] = {
	label = 'Vegan Cookie Chocolate Chunk',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `vegancookie_chocolatechunk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['vegancookie_doublechocolatechunk'] = {
	label = 'Vegan Cookie Double Chocolate Chunk',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `vegancookie_doublechocolatechunk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['vegancookie_pimpkinspice'] = {
	label = 'Vegan Cookie Pimpkin Spice',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `vegancookie_pimpkinspice`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['zebracake'] = {
	label = 'Zebra Cake',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `zebracake`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
--Breakfast

['bigplate_baconeggtoast'] = {
	label = 'Bacon Egg Toast',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `bigplate_baconeggtoast`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['bigplate_cinnamonroll'] = {
	label = 'Cinnamon Roll',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `bigplate_cinnamonroll`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['plate_avocadotoast'] = {
	label = 'Avocado Toast',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `plate_avocadotoast`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['plate_bacon'] = {
	label = 'Bacon',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `plate_bacon`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['plate_baconeggtoast'] = {
	label = 'Bacon Egg Toast',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `plate_baconeggtoast`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['plate_blueberrypancakes'] = {
	label = 'Blueberry Pancakes',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `plate_blueberrypancakes`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['plate_cinnamonroll'] = {
	label = 'Cinnamon Roll',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `plate_cinnamonroll`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['plate_creamcheeseavocadotoast'] = {
	label = 'Cream Cheese Avocado Toast',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `plate_creamcheeseavocadotoast`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['plate_pancakestack'] = {
	label = 'Pancake Stack',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `plate_pancakestack`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['plate_starberrypancakes'] = {
	label = 'Starberry Pancakes',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `plate_starberrypancakes`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['plate_sunnyegg'] = {
	label = 'Sunny Egg',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `plate_starberrypancakes`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['plate_toastsasuageeggs'] = {
	label = 'Toast Sasuage Eggs',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `plate_toastsasuageeggs`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['avocadotoast'] = {
	label = 'Avocado Toast',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `prop_avocadotoast`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['chocolatemilk'] = {
	label = 'Chocolate Milk',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `prop_chocolatemilk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cinnamonroll'] = {
	label = 'Cinnamon Roll',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `prop_cinnamonroll`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['coffeemug'] = {
	label = 'Coffee Mug',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `prop_coffeemug`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['creamcheeseavocadotoast'] = {
	label = 'Cream Cheese Avocado Toast',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `prop_creamcheeseavocadotoast`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['maplesyurp'] = {
	label = 'Maple Syurp',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `prop_maplesyurp`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['milk'] = {
	label = 'Milk',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `prop_milk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['orangejuice'] = {
	label = 'Orange Juice',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `prop_orangejuice`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
--cerealbowls
['cereal1'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal1`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal2'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal2`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal3'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal3`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal4'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal4`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal5'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal5`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal6'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal6`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal7'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal7`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal8'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal8`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal9'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal9`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal10'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal10`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal11'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal11`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal12'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal12`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal13'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal13`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal14'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal14`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal15'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal15`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal16'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal16`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal17'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal17`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal18'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal18`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal19'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal19`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal20'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal20`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal21'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal21`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal22'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal22`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal23'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal23`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
['cereal24'] = {
	label = 'cereal',
	weight = 10,
	client = {
		status = { hunger = 400000 },
		anim = 'eating',
		prop = { model = `cereal24`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
		usetime = 2500,
	},
},
--cocktails

['cocktail_blue'] = {
label = 'cocktail_blue',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_blue`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_blue2'] = {
label = 'Cocktail Blue2',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_blue2`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_blue3'] = {
label = 'Cocktail Blue3',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_blue3`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_blue4'] = {
label = 'Cocktail Blue4',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_blue4`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_blue5'] = {
label = 'Cocktail Blue5',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_blue5`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_blue6'] = {
label = 'Cocktail Blue6',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_blue6`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_blue7'] = {
label = 'Cocktail Blue7',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_blue7`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_blue8'] = {
label = 'Cocktail Blue8',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_blue8`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_green'] = {
label = 'Cocktail Green',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_green`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_green2'] = {
label = 'Cocktail Green2',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_green2`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_green3'] = {
label = 'Cocktail Green3',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_green3`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_green4'] = {
label = 'Cocktail Green4',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_green4`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_green5'] = {
label = 'Cocktail Green5',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_green5`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_green6'] = {
label = 'Cocktail Green6',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_green6`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_green7'] = {
label = 'Cocktail Green7',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_green7`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_green8'] = {
label = 'Cocktail Green8',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_green8`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_orange'] = {
label = 'Cocktail Orange',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_orange`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_orange2'] = {
label = 'Cocktail Orange2',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_orange2`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_orange3'] = {
label = 'Cocktail Orange3',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_orange3`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_orange4'] = {
label = 'Cocktail Orange4',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_orange4`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_orange5'] = {
label = 'Cocktail Orange5',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_orange5`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_orange6'] = {
label = 'Cocktail Orange6',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_orange6`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_orange7'] = {
label = 'Cocktail Orange7',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_orange7`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_orange8'] = {
label = 'Cocktail Orange8',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_orange8`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_purple'] = {
label = 'Cocktail Purple',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_purple`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_purple2'] = {
label = 'Cocktail Purple2',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_purple2`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_purple3'] = {
label = 'Cocktail Purple3',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_purple3`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_purple4'] = {
label = 'Cocktail Purple4',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_purple4`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_purple5'] = {
label = 'Cocktail Purple5',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_purple5`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_purple6'] = {
label = 'Cocktail Purple6',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_purple6`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_purple7'] = {
label = 'Cocktail Purple7',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_purple7`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_purple8'] = {
label = 'Cocktail Purple8',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_purple8`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_red'] = {
label = 'Cocktail Red',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_red`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_red2'] = {
label = 'Cocktail Red2',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_red2`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_red3'] = {
label = 'Cocktail Red3',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_red3`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_red4'] = {
label = 'Cocktail Red4',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_red4`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_red5'] = {
label = 'Cocktail Red5',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_red5`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_red6'] = {
label = 'Cocktail Red6',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_red6`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_red7'] = {
label = 'Cocktail Red7',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_red7`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_red8'] = {
label = 'Cocktail Red8',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `cocktail_red8`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
--cocktailsV2 

['beer_keg'] = {
label = 'Beer Keg',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `beer_keg` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_jigger'] = {
label = 'Cocktail Jigger',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cocktail_jigger` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cocktail_spoon'] = {
label = 'Cocktail Spoon',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cocktail_spoon` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['coconutdrink'] = {
label = 'Coconut Drink',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `coconutdrink` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cup_moscowmule'] = {
label = 'Moscow Mule',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cup_moscowmule` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_baileys'] = {
label = 'Baileys',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_baileys` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_beerbudweiser'] = {
label = 'Budweiser',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_beerbudweiser` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_beerempty'] = {
label = 'empty glass',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_beerempty` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_beerheineken'] = {
label = 'Heineken',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_beerheineken` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_beernobrand'] = {
label = 'Beer',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_beernobrand` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_beerstellartois'] = {
label = 'Stella Artois',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_beerstellartois` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_bluecosmopolitan'] = {
label = 'Blue Cosmo',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_bluecosmopolitan` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_bluemaita'] = {
label = 'Blue Maitai',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_bluemaita` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_champagne'] = {
label = 'Champagne',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_champagne` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_greencosmopolitan'] = {
label = 'Green Cosmo',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_greencosmopolitan` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_kiwiflight'] = {
label = 'Kiwi Flight',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_kiwiflight` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_mojito'] = {
label = 'Mojo',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_mojito` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_pinacolada'] = {
label = 'Pina Colada',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_pinacolada` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_pinkmaitai'] = {
label = 'Pink Maitai',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_pinkmaitai` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_redcosmopolitan'] = {
label = 'Red Cosmo',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_redcosmopolitan` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_seabreeze'] = {
label = 'Sea Breeze',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_seabreeze` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_shotblue'] = {
label = 'Blue Shot',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_shotblue` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_shotgreen'] = {
label = 'Green Shot',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_shotgreen` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_shotorange'] = {
label = 'Orange Shot',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_shotorange` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_shotpurple'] = {
label = 'Purple Shot',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_shotpurple` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_strawberrysunrise'] = {
label = 'Strawerry Sunrise',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_strawberrysunrise` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_summerslushwithvodkablue'] = {
label = 'Blue Vodka Slush',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_summerslushwithvodkablue` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_summerslushwithvodkagreen'] = {
label = 'Green Vodka Slush',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_summerslushwithvodkagreen` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_summerslushwithvodkaorange'] = {
label = 'Orange Vodka Slush',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_summerslushwithvodkaorange` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_summerslushwithvodkapurple'] = {
label = 'Purple Vodka Slush',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_summerslushwithvodkapurple` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_summerslushwithvodkarainbow'] = {
label = 'Rainbow Vodka Slush',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_summerslushwithvodkarainbow` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_summerslushwithvodkared'] = {
label = 'Red Vodka Slush',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_summerslushwithvodkared` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_summerslushwithvodkayellow'] = {
label = 'Yellow Vodka Slush',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_summerslushwithvodkayellow` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_tropico'] = {
label = 'Tropico',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_tropico` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_vodka'] = {
label = 'Vodka',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_vodka` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_vodkabannanapineapple'] = {
label = 'Banana Pineappla Vodka',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_vodkabannanapineapple` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_vodkanightlava'] = {
label = 'Nightlava Vodka',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_vodkanightlava` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_vodkaorangesky'] = {
label = 'Orangesky Vodka',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_vodkaorangesky` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_vodkapeachbeachpunch'] = {
label = 'Peach Beach Punch Vodka',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_vodkapeachbeachpunch` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_vodkapineapplecherry'] = {
label = 'Pineapple Cherry Vodka',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_vodkapineapplecherry` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_vodkawatermelonlemonade'] = {
label = 'Watermelon Lemonade Vodka',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_vodkawatermelonlemonade` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_whisky'] = {
label = 'Whiskey',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_whisky` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['glass_yellowcosmopolitan'] = {
label = 'Yellow Cosmo',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `glass_yellowcosmopolitan` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['pineappledrink'] = {
label = 'Pineapple Juice',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `pineappledrink` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['shaker_black'] = {
label = 'Black Shaker',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `shaker_black` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['shaker_bronze'] = {
label = 'Bronze Shaker',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `shaker_bronze` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['shaker_gold'] = {
label = 'Gold Shaker',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `shaker_gold` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['shaker_silver'] = {
label = 'Silver Shaker',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `shaker_silver` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['wine_keg'] = {
label = 'Wine Keg',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `wine_keg` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
--cookiesandbrownies
['brownie_chocolatewithnuts'] = {
label = 'Brownie Chocolate With Nuts',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `brownie_chocolatewithnuts`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['brownie_cosmic'] = {
label = 'Brownie Cosmic',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `brownie_cosmic`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['brownie_cosmic2'] = {
label = 'Brownie Cosmic2',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `brownie_cosmic2`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['brownie_redvelvet'] = {
label = 'Brownie Redvelvet',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `brownie_redvelvet`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['chocolatemilkglass'] = {
label = 'Chocolate Milk Glass',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `chocolatemilkglass`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['chocolatemilkglass2'] = {
label = 'Chocolate Milk Glass2',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `chocolatemilkglass2`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['chocolatemilkglass3'] = {
label = 'Chocolate Milk Glass3',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `chocolatemilkglass3`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['chocolatemilkglass4'] = {
label = 'Chocolate Milk Glass4',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `chocolatemilkglass4`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_cake'] = {
label = 'Cookie Cake',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_cake`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_cake2'] = {
label = 'Cookie Cake2',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_cake2`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_cake3'] = {
label = 'Cookie Cake3',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_cake3`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_cake4'] = {
label = 'Cookie Cake4',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_cake4`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_cake5'] = {
label = 'Cookie Cake5',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_cake5`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_cake6'] = {
label = 'Cookie Cake6',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_cake6`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_carameldelites'] = {
label = 'Cookie Caramel Delites2',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_carameldelites`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_chocolatechip'] = {
label = 'Cookie Chocolate Chip',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_chocolatechip`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_chocolatechipcremepie'] = {
label = 'Cookie Chocolate Chip Creme Pie',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_chocolatechipcremepie`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_chocolatepeanutbuttercup'] = {
label = 'Cookie Chocolate Peanut Butter Cup',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_chocolatepeanutbuttercup`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_confetti'] = {
label = 'Cookie Confetti',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_confetti`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_dobulechocolatemint'] = {
label = 'Cookie Dobule Chocolate Mint',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_dobulechocolatemint`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_doublechocolatechunk'] = {
label = 'Cookie Double Chocolate Chunk',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_doublechocolatechunk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_fudgerounds'] = {
label = 'Cookie Fudgerounds',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_fudgerounds`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_girlscout'] = {
label = 'cookie_girlscout',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_girlscout`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_girlscout2'] = {
label = 'cookie_girlscout2',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_girlscout2`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_girlscout3'] = {
label = 'cookie_girlscout3',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_girlscout3`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_girlscoutsmores'] = {
label = 'Cookie Girl Scout Smores',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_girlscoutsmores`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_mandm'] = {
label = 'Cookie Mandm',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_mandm`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_matchalatte'] = {
label = 'Cookie Matchalatte',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_matchalatte`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_oatmealcremepie'] = {
label = 'Cookie Oatmeal Creme Pie',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_oatmealcremepie`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_oatmealraisin'] = {
label = 'cookie_oatmealraisin',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `Cookie Oatmeal Raisin`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_oatmealwalnut'] = {
label = 'cookie_oatmealwalnut',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `Cookie Oatmeal Walnut`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_pumpkinspicelatte'] = {
label = 'cookie_pumpkinspicelatte',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_pumpkinspicelatte`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_saltedcaramel'] = {
label = 'Cookie Salted Caramel',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_saltedcaramel`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['Cookie_savannahsmiles'] = {
label = 'Cookie Savannahsmiles',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_savannahsmiles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_smores'] = {
label = 'Cookie Smores',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_smores`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_snickerdoodle'] = {
label = 'Cookie Snicker Doodle',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_snickerdoodle`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_starcrunch'] = {
label = 'Cookie Starcrunch',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_starcrunch`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_sugar'] = {
label = 'Cookie Sugar',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_sugar`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_trefoil'] = {
label = 'cookie_trefoil',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_trefoil`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_triplechocolate'] = {
label = 'Cookie Triple Chocolate',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_triplechocolate`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['cookie_whitechocolatemacadamia'] = {
label = 'cookie White Chocolate Macadamia',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `cookie_whitechocolatemacadamia`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['honeybun'] = {
label = 'honeybun',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `honeybun`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcookie_chocolatechip'] = {
label = 'Icecream Cookie Chocolate Chip',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcookie_chocolatechip`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcookie_chocolatechunk'] = {
label = 'Icecream Cookie Chocolate Chunk',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcookie_chocolatechip`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcookie_chocolatewhitechip'] = {
label = 'icecream Cookie Chocolate White Chip',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcookie_chocolatewhitechip`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcookie_chocolatewhitechunk'] = {
label = 'icecream Cookie Chocolate White Chunk',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcookie_chocolatewhitechunk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcookie_mandm'] = {
label = 'icecream Cookie Mandm',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcookie_mandm`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcookie_peanutbutter'] = {
label = 'icecream Cookie Peanut Butter',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcookie_peanutbutter`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcookie_redvelvet'] = {
label = 'Icecream Cookie Red Velvet',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcookie_redvelvet`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcookie_saltedcarmel'] = {
label = 'Ice Cream Cookie Salted Carmel',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcookie_saltedcarmel`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcookie_sprinkles'] = {
label = 'Icecream Cookie Sprinkles',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcookie_sprinkles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcookie_sugar'] = {
label = 'Icecream Cookie Sugar',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcookie_sugar`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcookie_sugarpink'] = {
label = 'Icecream Cookie Sugarpink',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcookie_sugarpink`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcookie_whitechocolatemacnut'] = {
label = 'Icecream Cookie white Chocolate Macnut',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcookie_whitechocolatemacnut`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['largecookie_chocolatechip'] = {
label = 'Large Cookie Chocolate Chip',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `largecookie_chocolatechip`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['largecookie_chocolatechunk'] = {
label = 'Large Cookie Chocolate Chunk',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `largecookie_chocolatechunk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['largecookie_chocolatewhitechip'] = {
label = 'Large Cookie Chocolate White Chip',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `largecookie_chocolatewhitechip`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['largecookie_chocolatewhitechunk'] = {
label = 'Large Cookie Chocolate White Chunk',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `largecookie_chocolatewhitechunk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['largecookie_doublechocolatechip'] = {
label = 'Large Cookie Double Chocolate Chip',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `largecookie_chocolatewhitechunk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['largecookie_mandm'] = {
label = 'Largecookie Mandm',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `largecookie_mandm`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['largecookie_peanut'] = {
label = 'Large Cookie Peanut',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `largecookie_peanut`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['largecookie_redvelvet'] = {
label = 'Large Cookie Redvelvet',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `largecookie_redvelvet`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['largecookie_saltedcarmel'] = {
label = 'Large Cookie Salted Carmel',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `largecookie_saltedcarmel`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['largecookie_sprinkles'] = {
label = 'Large Cookie Sprinkles',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `largecookie_sprinkles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['largecookie_sugar'] = {
label = 'Large Cookie Sugar',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `largecookie_sugar`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['largecookie_sugarpink'] = {
label = 'Large Cookie Sugar Pink',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `largecookie_sugarpink`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['milkglass'] = {
label = 'milkglass',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `milkglass`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['milkglass2'] = {
label = 'milkglass2',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `milkglass2`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['milkglass3'] = {
label = 'milkglass3',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `milkglass3`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['milkglass4'] = {
label = 'milkglass4',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `milkglass4`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['vegancookie_chocolatechunk'] = {
label = 'Vegan Cookie Chocolate Chunk',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `vegancookie_chocolatechunk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['vegancookie_doublechocolatechunk'] = {
label = 'Vegan Cookie Double Chocolate Chunk',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `vegancookie_doublechocolatechunk`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['vegancookie_pimpkinspice'] = {
label = 'Vegan Cookie Pimpkin Spice',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `vegancookie_pimpkinspice`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['zebracake'] = {
label = 'Zebra Cake',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `zebracake`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
-- Donuts
['donut_halfapplepie'] = {
label = 'Donut Halfapplepie',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_halfapplepie`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_halfreeses'] = {
label = 'Donut Halfreeses',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_halfreeses`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_halfdulcdeleche'] = {
label = 'Donut Halfdulcdeleche',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_halfdulcdeleche`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_halfcakebatter'] = {
label = 'Donut Halfcakebatter',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_halfcakebatter`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_halfnycheesecake'] = {
label = 'Donut Halfnycheesecake',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_halfnycheesecake`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_halfcookiescream'] = {
label = 'Donut Halfcookiescream',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_halfcookiescream`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_chocsprinkles'] = {
label = 'Donut Chocsprinkles',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_chocsprinkles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_strawberrysprinkle'] = {
label = 'Donut Strawberrysprinkle',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_strawberrysprinkle`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_blueberryglazed'] = {
label = 'Donut Blueberryglazed',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_blueberryglazed`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_cinnamon'] = {
label = 'Donut Cinnamon',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_cinnamon`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_applepie'] = {
label = 'Donut Applepie',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_applepie`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_reeses'] = {
label = 'Donut Reese',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_reese`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_dulcedeleche'] = {
label = 'Donut Dulcedeleche',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_dulcedeleche`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_cakebatter'] = {
label = 'Donut Cakebatter',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_cakebatter`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_nycheesecake'] = {
label = 'Donut NYcheesecake',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_nycheesecake`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_cookiescream'] = {
label = 'Donut Cookiescream',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_cookiescream`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_chocglazed'] = {
label = 'Donut Chocglazed',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_chocglazed`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_origglaze'] = {
label = 'Donut Origglaze',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_origglaze`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_halfstrawberrysprinkle'] = {
label = 'Donut Halfstrawberrysprinkle',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_halfstrawberrysprinkle`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_halfchocsprinkles'] = {
label = 'Donut Halfchocsprinkles',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_halfchocsprinkles`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_halfblueberryglazed'] = {
label = 'Donut Halfblueberryglazed',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_halfblueberryglazed`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_halfcinnamon'] = {
label = 'Donut Halfcinnamon',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_halfcinnamon`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_halfchocglazed'] = {
label = 'Donut Halfchocglazed',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_halfchocglazed`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_halforiglaze'] = {
label = 'Donut Halforiglaze',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_halforiglaze`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donuts'] = {
label = 'Donuts',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donuts`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
--frappuccinos
['starbucks1'] = {
label = 'Starbucks 1',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `starbucks1` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['starbucks2'] = {
label = 'Starbucks 2',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `starbucks2` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['starbucks3'] = {
label = 'Starbucks 3',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `starbucks3` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['starbucks4'] = {
label = 'Starbucks 4',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `starbucks4` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['starbucks5'] = {
label = 'Starbucks 5',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `starbucks5` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['starbucks6'] = {
label = 'Starbucks 6',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `starbucks6` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['starbucks7'] = {
label = 'Starbucks 7',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `starbucks7` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['starbucks8'] = {
label = 'Starbucks 8',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `starbucks8` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['starbucks9'] = {
label = 'Starbucks 9',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `starbucks9` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['starbucks10'] = {
label = 'Starbucks 10',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `starbucks10` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
--ice cream

['bannasplit'] = {
label = 'Banana Split',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `bannasplit`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_icecream'] = {
label = 'Donut Ice Cream',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_icecream`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_icecream2'] = {
label = 'Donut Ice Cream 2',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_icecream2`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_icecream3'] = {
label = 'Donut Ice Cream 3',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_icecream3`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_icecream4'] = {
label = 'Donut Ice Cream 4',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_icecream4`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_icecream5'] = {
label = 'Donut Ice Cream 5',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_icecream5`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['donut_icecream6'] = {
label = 'Donut Ice Cream 6',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `donut_icecream6`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreambar_brown'] = {
label = 'Icecream bar Brown',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreambar_brown`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreambar_choconut'] = {
label = 'Icecream bar Choconout',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreambar_choconut`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreambar_choconut2'] = {
label = 'Icecream bar Choconout 2',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreambar_choconut2`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreambar_pink'] = {
label = 'Icecream bar Pink',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreambar_pink`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreambar_white'] = {
label = 'Icecream bar White',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreambar_white`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcone_brown'] = {
label = 'Icecream Cone Brown',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcone_brown`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcone_brownberrys'] = {
label = 'Icecream Cone Brown Berries',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcone_brownberrys`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcone_greenberrys'] = {
label = 'Icecream Cone Green Berries',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcone_greenberrys`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcone_pink'] = {
label = 'Icecream Cone Pink',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcone_pink`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcone_pinkberrys'] = {
label = 'Icecream Cone Pink Berries',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcone_pinkberrys`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcone_white'] = {
label = 'Icecream Cone White',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcone_white`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcone_whiteandbrown'] = {
label = 'Icecream Cone White and Brown',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcone_whiteandbrown`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcone_whiteandred'] = {
label = 'Icecream Cone White and Red',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcone_whiteandred`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcone_whiteandyellow'] = {
label = 'Icecream Cone White and Yellow',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcone_whiteandyellow`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcone_whiteberrys'] = {
label = 'Icecream Cone White Berries',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcone_whiteberrys`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcup_brownbrown'] = {
label = 'Icecream Cup Brown Brown',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcup_brownbrown`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcup_browngreen'] = {
label = 'Icecream Cup Brown Green',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcup_browngreen`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcup_brownwhite'] = {
label = 'Icecream Cup Brown White',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcup_brownwhite`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcup_pinkgreen'] = {
label = 'Icecream Cup Pink Green',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcup_pinkgreen`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcup_pinkwhite'] = {
label = 'Icecream Cup Pink White',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcup_pinkwhite`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcup_whitegreen'] = {
label = 'Icecream Cup Pink White',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcup_whitegreen`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['icecreamcup_whitepink'] = {
label = 'Icecream Cup White Pink',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `icecreamcup_whitepink`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['shavedice1'] = {
label = 'Shaved Ice 1',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `shavedice1`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['shavedice2'] = {
label = 'Shaved Ice 2',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `shavedice2`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['shavedice3'] = {
label = 'Shaved Ice 3',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `shavedice3`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['shavedice4'] = {
label = 'Shaved Ice 4',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `shavedice4`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['shavedice5'] = {
label = 'Shaved Ice 5',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `shavedice5`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['shavedice6'] = {
label = 'Shaved Ice 6',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `shavedice6`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['shavedice7'] = {
label = 'Shaved Ice 7',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `shavedice7`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['shavedice8'] = {
label = 'Shaved Ice 8',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `shavedice8`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['shavedice9'] = {
label = 'Shaved Ice 9',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `shavedice9`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['woodenspoon'] = {
label = 'Wooden Spoon',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `woodenspoon`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['woodenspoon_icecreambrown'] = {
label = 'Wooden Spoon Brown',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `woodenspoon_icecreambrown`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['woodenspoon_icecreamgreen'] = {
label = 'Wooden Spoon Green',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `woodenspoon_icecreamgreen`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['woodenspoon_icecreampink'] = {
label = 'Wooden Spoon Pink',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `woodenspoon_icecreampink`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['woodenspoon_icecreamwhite'] = {
label = 'Wooden Spoon White',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `woodenspoon_icecreamwhite`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['bowl_calamari'] = {
label = 'bowl_calamari',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `bowl_calamari`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['bowl_chickengnoccisoup'] = {
label = 'bowl_chickengnoccisoup',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `bowl_chickengnoccisoup`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['bowl_fivecheeseziti'] = {
label = 'Bowl Fivecheeseziti',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `bowl_fivecheeseziti`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['bowl_friedmozzarella'] = {
label = 'bowl_friedmozzarella',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `bowl_friedmozzarella`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
--Jamaican food

['bigplate_jerkchickenrice'] = {
label = 'Bigplate Jerk Chicken Rice',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `bigplate_jerkchickenrice`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['bigplate_oxtailricepeas'] = {
label = 'Big Plate Oxtail Rice Peas',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `bigplate_oxtailricepeas`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['bigplate_peppershrimpplantains'] = {
label = 'Bigplate Pepper Shrimp Plantains',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `bigplate_peppershrimpplantains`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['bowl_currygoat'] = {
label = 'Bowl Curry Goat',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `bowl_currygoat`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['bowl_ricepeas'] = {
label = 'Bowl Rice Peas',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `bowl_ricepeas`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['bowl_yellowrice'] = {
label = 'Bowl Yellow Rice',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `bowl_yellowrice`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_cocobeefpatty'] = {
label = 'Plate Coco Beef Patty',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `plate_cocobeefpatty`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_cocobeefpattyeaten'] = {
label = 'Plate Cocobeef Patty Eaten',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `plate_cocobeefpattyeaten`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_currygoatrice'] = {
label = 'Plate Curry Goat Rice',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `plate_currygoatrice`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_friedplantains'] = {
label = 'Plate Fried Plantains',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `plate_friedplantains`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_jerkchickenrice'] = {
label = 'Plate Jerk Chicken Rice',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `plate_jerkchickenrice`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_oxtailricepeas'] = {
label = 'Plate Oxtail Rice Peas',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `plate_oxtailricepeas`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['prop_chicken'] = {
label = 'Chicken',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `prop_chicken`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['prop_cocobeefbread'] = {
label = 'Coco Beef Bread',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `prop_cocobeefbread`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['prop_coconutdrink'] = {
label = 'Coconut Drink',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `prop_coconutdrink`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['prop_friedplantains'] = {
label = 'Fried Plantains',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `prop_friedplantains`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['prop_pineapple'] = {
label = 'Pineapple',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `prop_pineapple`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
--mcdoanlds
['mcdonalds_10pnuggests'] = {
label = 'Mcdonalds 10p Nuggests',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `mcdonalds_10pnuggests`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['mcdonalds_bag'] = {
label = 'Mcdonalds Bag',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `mcdonalds_bag`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['mcdonalds_bigmac'] = {
label = 'Mcdonalds Bigmac',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `mcdonalds_bigmac`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['mcdonalds_carmelfrap'] = {
label = 'Mcdonalds Carmel Frap',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `mcdonalds_carmelfrap`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['mcdonalds_chocolatefrap'] = {
label = 'Mcdonalds Chocolate Frap',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `mcdonalds_chocolatefrap`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['mcdonalds_coffee'] = {
label = 'Mcdonalds Coffee',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `mcdonalds_coffee`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['mcdonalds_coffeewithlid'] = {
label = 'Mcdonalds Coffee lid',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `mcdonalds_coffeewithlid`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['mcdonalds_fries'] = {
label = 'Mcdonalds Fries',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `mcdonalds_fries`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['mcdonalds_happymeal'] = {
label = 'Mcdonalds Happy Meal',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `mcdonalds_happymeal`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['mcdonalds_nugget'] = {
label = 'Mcdonalds Nugget',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `mcdonalds_nugget`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['mcdonalds_salad'] = {
label = 'Mcdonalds Salad',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = `mcdonalds_salad`, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
--Redbull ox_inventory

['redbull_sugarfree'] = {
label = 'Sugar Free',
weight = 1,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `redbull9`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['redbull_acai'] = {
label = 'Acai',
weight = 1,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `redbull8`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['redbull_tropical'] = {
label = 'Tropical',
weight = 1,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `redbull7`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['redbull_peach'] = {
label = 'Peach Nectarine',
weight = 1,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `redbull6`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['redbull_beach'] = {
label = 'Beach Breeze',
weight = 1,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `redbull5`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['redbull_cranberry'] = {
label = 'Cranberry',
weight = 1,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `redbull4`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['redbull_tangerine'] = {
label = 'Tangerine',
weight = 1,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `redbull3`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['redbull_kiwiapple'] = {
label = 'Kiwi Apple',
weight = 1,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `redbull2`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['redbull_cocountberry'] = {
label = 'Cocount Berry',
weight = 1,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `redbull1`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['redbull_crisppear'] = {
label = 'Crisp Pear Sugar Free',
weight = 1,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model = `redbull`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
--Steakhouse
['plate_ribscornmac'] = {
label = 'Plate Ribscornmac',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'plate_ribscornmac', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_chickenparm'] = {
label = 'Plate Chickenparm',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'plate_chickenparm', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_grilledshrimp'] = {
label = 'Plate Grilledshrimp',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'plate_grilledshrimp', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_chickentendersandfries'] = {
label = 'Plate Chickentendersandfries',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'plate_chickentendersandfries', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_sirloin'] = {
label = 'Plate Sirloin',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'plate_sirloin', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_chocolatecake'] = {
label = 'Plate Chocolatecake',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'plate_chocolatecake', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_ribeyesteak'] = {
label = 'Plate Ribeyesteak',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'plate_ribeyesteak', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_filetmigon'] = {
label = 'Plate Filetmigon',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'plate_filetmigon', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_tbone'] = {
label = 'Plate Tbone',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'plate_tbone', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_nystrip'] = {
label = 'Plate Nystrip',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'plate_nystrip', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_stuffedmushrooms'] = {
label = 'Plate Stuffedmushrooms',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'plate_stuffedmushrooms', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['prop_grilledshrimp'] = {
label = 'Grilledshrimp',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'prop_grilledshrimp', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_spinachdip'] = {
label = 'Plate Spinachdip',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'plate_spinachdip', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_buffalochickendip'] = {
label = 'Plate Buffalochickendip',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'plate_buffalochickendip', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_moltenlavacake'] = {
label = 'Plate Moltenlavacake',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'plate_moltenlavacake', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['plate_strawberrycake'] = {
label = 'Plate Strawberrycake',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'plate_strawberrycake', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['bowl_frenchonionsoup'] = {
label = 'Bowl Frenchonionsoup',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'bowl_frenchonionsoup', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['prop_chickentender'] = {
label = 'Chickentender',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'prop_chickentender', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['prop_chip'] = {
label = 'Chip',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = prop_chip, pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['bowl_loadedpotatosoup'] = {
label = 'Bowl Loadedpotatosoup',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'bowl_loadedpotatosoup', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['steakhouse'] = {
label = 'Steakhouse',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'steakhouse', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
--togochinesefood
['togocontainer_noodles'] = {
label = 'Togocontainer Noodles',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togocontainer_noodles', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togocontainer_chicken'] = {
label = 'Togocontainer Chicken',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togocontainer_chicken', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togo_kungpaochicken'] = {
label = 'Togo Kungpaochicken',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togo_kungpaochicken', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togo_beijingbeef'] = {
label = 'Togo Beijingbeef',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togo_beijingbeef', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togo_mushroomchicken'] = {
label = 'Togo Mushroomchicken',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togo_mushroomchicken', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togo_blackpepperchicken'] = {
label = 'Togo Blackpepperchicken',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togo_blackpepperchicken', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togo_honeywalnutshrimp'] = {
label = 'Togo Honeywalnutshrimp',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togo_honeywalnutshrimp', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togo_broccolibeef'] = {
label = 'Togo Broccolibeef',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togo_broccolibeef', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togo_blackpepperangussteak'] = {
label = 'Togo Blackpepperangussteak',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togo_blackpepperangussteak', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togo_sweetfirechicken'] = {
label = 'Togo Sweetfirechicken',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togo_sweetfirechicken', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togo_orangechicken'] = {
label = 'Togo Orangechicken',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togo_orangechicken', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togo_supergreens'] = {
label = 'Togo Supergreens',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togo_supergreens', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togocontainer_mangorice'] = {
label = 'Togocontainer Mangorice',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togocontainer_mangorice', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togo_teriyakichicken'] = {
label = 'Togo Teriyakichicken',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togo_teriyakichicken', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togocontainer_whiterice'] = {
label = 'Togocontainer Whiterice',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togocontainer_whiterice', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togo_chveggieeggroll'] = {
label = 'Togo chveggie Eggroll',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togo_chveggieeggroll', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togo_eggroll'] = {
label = 'togo Eggroll',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togo_eggroll', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['food_eggroll'] = {
label = 'Eggroll',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'food_eggrol', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['food_veggieeggroll'] = {
label = 'Veggieeggroll',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'food_veggieeggroll', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['soysauce_yellow'] = {
label = 'Soysauce Yellow',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'soysauce_yellow', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['soysauce_green'] = {
label = 'Soysauce Green',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'soysauce_green', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['soysauce_red'] = {
label = 'Soysauce Red',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'soysauce_red', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['soysauce_black'] = {
label = 'Soysauce Black',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'soysauce_black', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bigbox6'] = {
label = 'Togopremade Bigbox6',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bigbox6', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bigbox3'] = {
label = 'Togopremade Bigbox3',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bigbox3', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_box4'] = {
label = 'Togopremade Bigbox4',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bigbox4', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_box5'] = {
label = 'Togopremade Bigbox5',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bigbo5', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_box3'] = {
label = 'Togopremade Bigbox6',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bigbox3', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_box2'] = {
label = 'Togopremade Bigbox6',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bigbox2', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_box6'] = {
label = 'Togopremade Bigbox6',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bigbox6', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bigbox4'] = {
label = 'Togopremade Bigbox4',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bigbox4', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bigbox5'] = {
label = 'Togopremade Bigbox5',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bigbox5', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bigbox'] = {
label = 'Togopremade Bigbox',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bigbox', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_box'] = {
label = 'Togopremade Box',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_box', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bigbox2'] = {
label = 'Togopremade Bigbox2',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_box2', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['packet_sauce'] = {
label = 'Packet Sauce',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'packet_sauce', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['packet_sauce2'] = {
label = 'Packet Sauce2',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'packet_sauce2', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bowl'] = {
label = 'togopremade_bowl',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bowl', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bowl7'] = {
label = 'Togopremade Bowl7',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bowl7', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bowl2'] = {
label = 'Togopremade Bowl2',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bowl2', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bowl3'] = {
label = 'Togopremade Bowl3',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bowl3', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bowl9'] = {
label = 'Togopremade Bowl9',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bowl9', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bowl8'] = {
label = 'Togopremade Bowl8',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bowl8', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bowl5'] = {
label = 'Togopremade Bowl5',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bowl5', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bowl6'] = {
label = 'Togopremade Bowl6',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bowl6', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bowl10'] = {
label = 'Togopremade Bowl10',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bowl10', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togopremade_bowl4'] = {
label = 'Togopremade Bowl4',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togopremade_bowl4', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['togochinesefood'] = {
label = 'Togo Chinesefood',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'togochinesefood', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['chopstick'] = {
label = 'Chopstick',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'chopstick', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['chopstick3'] = {
label = 'Chopstick3',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'chopstick3', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['chopstick2'] = {
label = 'Chopstick2',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'chopstick2', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['chopstick4'] = {
label = 'Chopstick4',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'chopstick4', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['chopstick5'] = {
label = 'Chopstick5',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'chopstick5', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['chopstick6'] = {
label = 'Chopstick6',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'chopstick6', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
--togocups

['cup_barqs'] = {
label = 'Barqs Cup',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cup_barqs` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cup_carlsjr'] = {
label = 'Carls Jr Cup',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cup_carlsjr` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cup_chickfila'] = {
label = 'Chick Fil A Cup',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cup_chickfila` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cup_coke'] = {
label = 'Coke Cup',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cup_coke` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cup_dq'] = {
label = 'DQ Cup',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cup_dq` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cup_drpepper'] = {
label = 'DrPepper Cup',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cup_drpepper` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cup_dunkindonuts'] = {
label = 'Dunkin Donuts Cup',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cup_dunkindonuts` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cup_kfc'] = {
label = 'KFC Cup',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cup_kfc` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cup_mcdonalds'] = {
label = 'McDonalds Cup',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cup_mcdonalds` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cup_panera'] = {
label = 'Panera Cup',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cup_panera` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cup_pepsi'] = {
label = 'Pepsi Cup',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cup_pepsi` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cup_sonic'] = {
label = 'Sonic Cup',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cup_sonic` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cup_wafflehouse'] = {
label = 'Waffle House Cup',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cup_wafflehouse` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
['cup_wafflehouse'] = {
label = 'Waffle House Cup',
weight = 500,
client = {
	status = { thirst = 400000 },
	anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
	prop = { model =  `cup_wafflehouse` , pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.5) },
	usetime = 2500,
},
},
--wingsandfries

['wings_hothoneyrub'] = {
label = 'Wings Hothoneyrub',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'wings_hothoneyrub', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['wings_plain'] = {
label = 'Wings Plain',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'wings_plain', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['wings_hickorysmaokedbbq'] = {
label = 'Wings Hickorysmaokedbbq',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'wings_hickorysmaokedbbq', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['wings_lemonpepper'] = {
label = 'Wings Lemonpepper',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'wings_lemonpepper', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['wings_mangohabanero'] = {
label = 'Wings Mangohabanero',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'wings_mangohabanero', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['wings_garlicparm'] = {
label = 'Wings Garlicparm',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'wings_garlicparm', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['wings_orighot'] = {
label = 'Wings Orighot',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'wings_orighot', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['wings_cajun'] = {
label = 'Wings Cajun',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'wings_cajun', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['wings_spicykorenanq'] = {
label = 'Wings Spicykorenanq',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'wings_spicykorenanq', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['wings_louisianarub'] = {
label = 'Wings Louisianarub',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'wings_louisianarub', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['wings_atomic'] = {
label = 'Wings Atomic',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'wings_atomic', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['wings_hawaiian'] = {
label = 'Wings Hawaiian',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'wings_hawaiian', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['fries_buffalo'] = {
label = 'Fries Buffalo',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'fries_buffalo', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['singlewing_lemonpepper'] = {
label = 'Singlewing Lemonpepper',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'singlewing_lemonpepper', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['fries_voodoo'] = {
label = 'Fries Voodoo',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'fries_voodoo', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['fries_cheese'] = {
label = 'Fries Cheese',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'fries_cheese', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['singlewing_hothoneyrub.ydr'] = {
label = 'Singlewing Hothoneyrub',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'singlewing_hothoneyrub', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['singlewing_hickorysmokedbbq'] = {
label = 'Singlewing Hickorysmokedbbq',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'singlewing_hickorysmokedbbq', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['singlewing_garlicparm'] = {
label = 'Singlewing Garlicparm',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'singlewing_garlicparm', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['singlewing_mangohabanero'] = {
label = 'Singlewing Mangohabanero',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'singlewing_mangohabanero', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['singlewing_orighot'] = {
label = 'Singlewing Orighot',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'singlewing_orighot', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['singlewing_spicykoreanq'] = {
label = 'Singlewing Spicykoreanq',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'singlewing_spicykoreanq', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['singlewing_cajun'] = {
label = 'Singlewing Cajun',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'singlewing_cajun', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['singlewing_louisianarub'] = {
label = 'Singlewing Louisianarub',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'singlewing_louisianarub', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['singlewing_atomic'] = {
label = 'Singlewing Atomic',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'prop_almondcroissant', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['singlewing_hawaiian'] = {
label = 'Singlewing Hawaiian',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'singlewing_hawaiian', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
['wings'] = {
label = 'Wings',
weight = 10,
client = {
	status = { hunger = 400000 },
	anim = 'eating',
	prop = { model = 'wings', pos = vec3(0.06, 0.01, -0.02), rot = vec3(5.0, 5.0, -80.5) },
	usetime = 2500,
},
},
["cigarette"] = {
    label = 'Cigarette',
    weight = 1,
    stack = true,
    description = ""
},
["cigbox"] = {
    label = 'Cigarette Box',
    weight = 1,
    stack = true,
    description = ""
},
["hamburger"] = {
    label = 'Hamburger',
    weight = 1,
    stack = true,
    description = ""
},
["water"] = {
    label = 'Water',
    weight = 1,
    stack = true,
    description = ""
},
["beer"] = {
    label = 'Beer',
    weight = 1,
    stack = true,
    description = ""
},
["soda"] = {
    label = 'Soda',
    weight = 1,
    stack = true,
    description = ""
},
["coffee"] = {
    label = 'Coffee',
    weight = 1,
    stack = true,
    description = ""
},
["egobar"] = {
    label = 'Egobar',
    weight = 1,
    stack = true,
    description = ""
},
["sandwich"] = {
    label = 'Sandwich',
    weight = 1,
    stack = true,
    description = ""
},
["crisps"] = {
    label = 'Crisps',
    weight = 1,
    stack = true,
    description = ""
},
["gin_shot"] = {
    label = 'Gin Shot',
    weight = 1,
    stack = true,
    description = ""
},
["vodka_shot"] = {
    label = 'Vodka Shot',
    weight = 1,
    stack = true,
    description = ""
},
["whiskey_bottle"] = {
    label = 'Whiskey Bottle',
    weight = 1,
    stack = true,
    description = ""
},
["tequila_bottle"] = {
    label = 'Tequila Bottle',
    weight = 1,
    stack = true,
    description = ""
},
["vodka_bottle"] = {
    label = 'Vodka Bottle',
    weight = 1,
    stack = true,
    description = ""
},

	["notepad"] = {
		label = "Notepad",
		weight = 1,
		stack = true,
		close = true,
	},

	["mdma"] = {
		label = "MDMA",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth"] = {
		label = "Meth",
		weight = 1,
		stack = true,
		close = true,
	},

	["leather_fabric"] = {
		label = 'leather fabric',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["cotton_fabric"] = {
		label = 'cotton fabric',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["suede_fabric"] = {
		label = 'suede fabric',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["mesh_fabric"] = {
		label = 'mesh fabric',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["zipper"] = {
		label = 'zipper',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["thread"] = {
		label = 'thread',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["shoebox1"] = {
		label = 'shoebox1',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["shoebox2"] = {
		label = 'shoebox2',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["shoebox3"] = {
		label = 'shoebox3',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["shoebox_wm1"] = {
		label = 'shoebox_wm1',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["shoebox_wm2"] = {
		label = 'shoebox_wm2',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["shoe_sole"] = {
		label = 'shoe_sole',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["shoe_laces"] = {
		label = 'shoe_laces',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["shoe_insole"] = {
		label = 'shoe_insole',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["shoe_glue"] = {
		label = 'shoe_glue',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["shoe_glue"] = {
		label = 'shoe_glue',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["shoe_hinge_form"] = {
		label = 'shoe_hinge_form',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["heel_hinge_form"] = {
		label = 'heel_hinge_form',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["purse_strap"] = {
		label = 'purse strap',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["backpac_template"] = {
		label = 'backpac template',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["backpack_insulation"] = {
		label = 'backpack insulation',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["backpack_straps"] = {
		label = 'backpack straps',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["kq_wild_cannabis"] = {
		label = "Wild cannabis",
		weight = 1,
		stack = true,
		close = true,
	},

	["kq_empty_baggie"] = {
		label = "Empty baggie",
		weight = 1,
		stack = true,
		close = true,
	},

	["kq_packaged_wild_cannabis"] = {
		label = "Bagged wild cannabis",
		weight = 1,
		stack = true,
		close = true,
	},

	['fishingrod1'] = { label = 'Fishingrod Level 1', weight = 1000, stack = true, allowArmed = false },
	['fishingrod2'] = { label = 'Fishingrod Level 2', weight = 1000, stack = true, allowArmed = false },
	['fishingrod3'] = { label = 'Fishingrod Level 3', weight = 1000, stack = true, allowArmed = false },
	['fishingrod4'] = { label = 'Fishingrod Level 4', weight = 1000, stack = true, allowArmed = false },
	['fishingrod5'] = { label = 'Fishingrod Level 5', weight = 1000, stack = true, allowArmed = false },

	['fishnet1'] = { label = 'Fishing net Nivel 1', weight = 1000, stack = true, allowArmed = false },
	['fishnet2'] = { label = 'Fishing net Nivel 2', weight = 1000, stack = true, allowArmed = false },
	['fishnet3'] = { label = 'Fishing net Nivel 3', weight = 1000, stack = true, allowArmed = false },
	['fishnet4'] = { label = 'Fishing net Nivel 4', weight = 1000, stack = true, allowArmed = false },
	['fishnet5'] = { label = 'Fishing net Nivel 5', weight = 1000, stack = true, allowArmed = false },

	['mackerel'] = { label = 'Mackerel', weight = 25, stack = true, allowArmed = false },
	['cod'] = { label = 'Cod', weight = 25, stack = true, allowArmed = false },
	['seabass'] = { label = 'Sea Bass', weight = 25, stack = true, allowArmed = false },
	['sole'] = { label = 'Sole', weight = 25, stack = true, allowArmed = false },
	['stingray'] = { label = 'Stingray', weight = 25, stack = true, allowArmed = false },
	['salmon'] = { label = 'Salmon', weight = 25, stack = true, allowArmed = false },
	['tunafish'] = { label = 'Tuna fish', weight = 25, stack = true, allowArmed = false },
	['sardine'] = { label = 'Sardine', weight = 25, stack = true, allowArmed = false },
	['catfish'] = { label = 'Catfish', weight = 25, stack = true, allowArmed = false },
	['monkfish'] = { label = 'Monkfish', weight = 25, stack = true, allowArmed = false },

	['fishingtin'] = { label = 'Fishing Tin', weight = 2500, stack = true, allowArmed = false },
	['fishingboot'] = { label = 'Fishing Boot', weight = 2500, stack = true, allowArmed = false },

	['dolphin'] = { label = 'Dolphin', weight = 15000, stack = true, allowArmed = false },
	['tigershark'] = { label = 'Tiger shark', weight = 5000, stack = true, allowArmed = false },
	['hammershark'] = { label = 'Hammer shark', weight = 5000, stack = true, allowArmed = false },
	['whale'] = { label = 'Whale', weight = 5000, stack = true, allowArmed = false },

	['fishbait'] = { label = 'Fish Bait', weight = 400, stack = true, allowArmed = false },
	['illegalfishbait'] = { label = 'Illegal Fish Bait', weight = 400, stack = true, allowArmed = false },
	['anchor'] = { label = 'Boat Anchor', weight = 2500, stack = true, allowArmed = false },
	['diving_gear'] = { label = 'Diving Gear', weight = 30000, stack = true, allowArmed = false },
	['diving_fill'] = { label = 'Diving Tube', weight = 3000, stack = true, allowArmed = false },

	['treasurechest'] = { label = 'Treasure Chest', weight = 2500, stack = true, allowArmed = false },
	['fishingkey'] = { label = 'Corroded Key', weight = 100, stack = true, allowArmed = false },

	['bonfire'] = { label = 'Campfire', weight = 20, stack = true, allowArmed = false },
	['cookedcod'] = { label = 'Cooked Cod', weight = 20, stack = true, allowArmed = false },
	['cookedmackerel'] = { label = 'Cooked Mackerel', weight = 20, stack = true, allowArmed = false },

	['conch'] = { label = 'Conch', weight = 500, stack = true, allowArmed = false },
	['sea_snail'] = { label = 'Sea Snail', weight = 500, stack = true, allowArmed = false },
	['shell'] = { label = 'Shell', weight = 500, stack = true, allowArmed = false },
	['conch_shell'] = { label = 'Shell', weight = 500, stack = true, allowArmed = false },
	['starfish'] = { label = 'Starfish', weight = 500, stack = true, allowArmed = false },
	['knife'] = { label = 'Knife', weight = 500, stack = true, allowArmed = false },

	['red_coral'] = { label = 'Red Coral', weight = 500, stack = true, allowArmed = false },
	['yellow_coral'] = { label = 'Yellow Coral', weight = 500, stack = true, allowArmed = false },
	['blue_coral'] = { label = 'Blue Coral', weight = 500, stack = true, allowArmed = false },
	['pink_coral'] = { label = 'Pink Coral', weight = 500, stack = true, allowArmed = false },
	['white_coral'] = { label = 'White Coral', weight = 500, stack = true, allowArmed = false },
	['green_coral'] = { label = 'Green Coral', weight = 500, stack = true, allowArmed = false },
	['babyblue_coral'] = { label = 'Baby Blue Coral', weight = 500, stack = true, allowArmed = false },

	["moneywashcard"] = {
		label = "moneywashcard",
		weight = 1,
		stack = true,
		close = true,
	},

	["vil_gummy"] = {
		label = 'vil_gummy',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["wig_dye"] = {
		label = 'wig_dye',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["Prada_Bag2"] = {
		label = 'Prada Bag2',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["Prada_Bag"] = {
		label = 'Prada Bag',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["Prada_Betty_Boop"] = {
		label = 'Prada Betty Boop',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["Red_bottoms"] = {
		label = 'Red bottoms',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["Balenciaga"] = {
		label = 'Balenciaga',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["playstation5"] = {
		label = 'playstation5',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["LV_nails"] = {
		label = 'LV nails',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["purple_nails"] = {
		label = 'purple nails',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["Hello_Kitty"] = {
		label = 'Hello Kitty',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["GANJAORGANICS"] = {
		label = 'GANJAORGANICS',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["Eye_lashes"] = {
		label = 'Eye_lashes',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["LV_BAG"] = {
		label = 'LV BAG',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	["Blue_Dream"] = {
		label = 'Blue Dream',
		weight = 1,
		stack = true,
		description = "" --Put what ever u want
	},
	['motelcard'] = {
		label = 'Motel Card',
		weight = 200,
		stack = false
	},
	
	['doorlockpick'] = {
		label = 'Lockpick',
		weight = 200,
		stack = false
	},

	['weapon_case'] =                     {label = 'Weapon Case',               weight = 5, stack = true, close = false, description = "Case for something", image = "weapon_case.png"},
['weapon_blueprint_pistol'] =         {label = 'Pistol Blueprint',          weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_pistol.png"},
['weapon_blueprint_snspistol'] =      {label = 'SNS Pistol Blueprint',      weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_snspistol.png"},
['weapon_blueprint_vintagepistol'] =  {label = 'Vintage Pistol Blueprint',  weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_vintagepistol.png"},
['weapon_blueprint_appistol'] =       {label = 'AP Pistol Blueprint',       weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_appistol.png"},
['weapon_blueprint_pistol50'] =       {label = 'Pistol 50 Blueprint',       weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_pistol50.png"},
['weapon_blueprint_heavypistol'] =    {label = 'Heavy Pistol Blueprint',    weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_heavypistol.png"},
['weapon_blueprint_microsmg'] =       {label = 'Micro SMG Blueprint',       weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_microsmg.png"},
['weapon_blueprint_minismg'] =        {label = 'Mini SMG Blueprint',        weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_minismg.png"},
['weapon_blueprint_sawnoffshotgun'] = {label = 'Sawnoff Shotgun Blueprint', weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_sawnoffshotgun.png"},
['weapon_blueprint_assaultrifle'] =   {label = 'Assault Rifle Blueprint',   weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_assaultrifle.png"},
['pistol_frame'] =                    {label = 'Pistol Frame',              weight = 5, stack = true, close = false, description = "A frame?",           image = "pistol_frame.png"},
['snspistol_frame'] =                 {label = 'SNS Pistol Frame',          weight = 5, stack = true, close = false, description = "A frame?",           image = "snspistol_frame.png"},
['vintagepistol_frame'] =             {label = 'Vintage Pistol Frame',      weight = 5, stack = true, close = false, description = "A frame?",           image = "vintagepistol_frame.png"},
['appistol_frame'] =                  {label = 'AP Pistol Frame',           weight = 5, stack = true, close = false, description = "A frame?",           image = "appistol_frame.png"},
['pistol50_frame'] =                  {label = 'Pistol 50 Frame',           weight = 5, stack = true, close = false, description = "A frame?",           image = "pistol50_frame.png"},
['heavypistol_frame'] =               {label = 'Heavy Pistol Frame',        weight = 5, stack = true, close = false, description = "A frame?",           image = "heavypistol_frame.png"},
['microsmg_frame'] =                  {label = 'Micro SMG Frame',           weight = 5, stack = true, close = false, description = "A frame?",           image = "microsmg_frame.png"},
['minismg_frame'] =                   {label = 'Mini SMG Frame',            weight = 5, stack = true, close = false, description = "A frame?",           image = "minismg_frame.png"},
['sawnoffshotgun_frame'] =            {label = 'Sawnoff Shotgun Frame',     weight = 5, stack = true, close = false, description = "A frame?",           image = "sawnoffshotgun_frame.png"},
['assaultrifle_frame'] =              {label = 'Assault Rifle Frame',       weight = 5, stack = true, close = false, description = "A frame?",           image = "assaultrifle_frame.png"},
['brass'] =                           {label = 'Brass',                     weight = 5, stack = true, close = false, description = "Crafting Material",  image = "brass.png"},
['gunpowder'] =                       {label = 'Gunpowder',                 weight = 5, stack = true, close = false, description = "Powder?",            image = "gunpowder.png"},
['pistol'] =                          {label = 'Pistol Model',              weight = 5, stack = true, close = false, description = "Nice Model?",        image = "pistol.png"},
['snspistol'] =                       {label = 'SNS Pistol Model',          weight = 5, stack = true, close = false, description = "Nice Model?",        image = "snspistol.png"},
['vintagepistol'] =                   {label = 'Vintage Pistol Model',      weight = 5, stack = true, close = false, description = "Nice Model?",        image = "vintagepistol.png"},
['appistol'] =                        {label = 'AP Pistol Model',           weight = 5, stack = true, close = false, description = "Nice Model?",        image = "appistol.png"},
['pistol50'] =                        {label = 'Pistol 50 Model',           weight = 5, stack = true, close = false, description = "Nice Model?",        image = "pistol50.png"},
['heavypistol'] =                     {label = 'Heavy Pistol Model',        weight = 5, stack = true, close = false, description = "Nice Model?",        image = "heavypistol.png"},
['microsmg'] =                        {label = 'Micro SMG Model',           weight = 5, stack = true, close = false, description = "Nice Model?",        image = "microsmg.png"},
['minismg'] =                         {label = 'Mini SMG Model',            weight = 5, stack = true, close = false, description = "Nice Model?",        image = "minismg.png"},
['sawnoffshotgun'] =                  {label = 'Sawnoff Shotgun Model',     weight = 5, stack = true, close = false, description = "Nice Model?",        image = "sawnoffshotgun.png"},
['assaultrifle'] =                    {label = 'Assault Rifle Model',       weight = 5, stack = true, close = false, description = "Nice Model?",        image = "assaultrifle.png"},

	["weed_skunk"] = {
		label = "Weed skunk",
		weight = 10,
		stack = true,
		close = true,
	},

	["cokebaggy"] = {
		label = "Coke baggy",
		weight = 10,
		stack = true,
		close = true,
	},

	["testosterone"] = {
		label = "Testosterone",
		weight = 1,
		stack = true,
		close = true,
	},

	["bitcoin"] = {
		label = "Bitcoin",
		weight = 10,
		stack = true,
		close = true,
	},

	["protein"] = {
		label = "Protein",
		weight = 1,
		stack = true,
		close = true,
	},

	["preworkout"] = {
		label = "Pre-Workout",
		weight = 1,
		stack = true,
		close = true,
	},

	["coke_small_brick"] = {
		label = "Coke small brick",
		weight = 10,
		stack = true,
		close = true,
	},

	["weed_purplehaze"] = {
		label = "Weed Purple Haze",
		weight = 10,
		stack = true,
		close = true,
	},

	["creatine"] = {
		label = "Creatine",
		weight = 1,
		stack = true,
		close = true,
	},

	["tablet"] = {
		label = "tablet",
		weight = 1,
		stack = true,
		close = true,
	},

	["roadpods"] = {
		label = "roadpods",
		weight = 1,
		stack = true,
		close = true,
	},

	['display_stand'] = {
		label = 'Display Stand',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	["ngd_tobaccotrimmer"] = {
		label = "Tobacco Trimmer",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_tobaccotrimmer.png",
		}
	},
	["ngd_cigtobaccoleaf"] = {
		label = "Cigarette Tobacco Leaves",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "ngd_cigtobaccoleaf.png",
		}
	},
	["ngd_pipetobaccoleaf"] = {
		label = "Pipe Tobacco Leaves",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "ngd_pipetobaccoleaf.png",
		}
	},
	["ngd_cigartobaccoleaf"] = {
		label = "Cigar Tobacco Leaves",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "ngd_cigartobaccoleaf.png",
		}
	},
	["ngd_drypipetobacco"] = {
		label = "Dried Pipe Tobacco Leaves",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_drypipetobacco.png",
		}
	},
	["ngd_drycigtobacco"] = {
		label = "Dried Cigarette Tobacco Leaves",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_drycigtobacco.png",
		}
	},
	["ngd_drycigartobacco"] = {
		label = "Dried Cigar Tobacco Leaves",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_drycigartobacco.png",
		}
	},
	["ngd_drycherrytobacco"] = {
		label = "Dried Cherry Pipe Tobacco Leaves",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_drycherrytobacco.png",
		}
	},
	["ngd_drymapletobacco"] = {
		label = "Dried Maple Pipe Tobacco Leaves",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_drymapletobacco.png",
		}
	},
	["ngd_drylemontobacco"] = {
		label = "Dried Lemon Pipe Tobacco Leaves",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_drylemontobacco.png",
		}
	},
	["ngd_drywintergtobacco"] = {
		label = "Dried Wintergreen Pipe Tobacco Leaves",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_drywintergtobacco.png",
		}
	},
	["ngd_cigrollingpaper"] = {
		label = "Cigarette Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigrollingpaper.png",
		}
	},
	["ngd_premcigrollingpaper"] = {
		label = "Premium Cigarette Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_premcigrollingpaper.png",
		}
	},
	["ngd_cigfilter"] = {
		label = "Cigarette Filter",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigfilter.png",
		}
	},

	["ngd_cigarrollingpaper"] = {
		label = "Cigar Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigarrollingpaper.png",
		}
	},
	["ngd_cigarbinder"] = {
		label = "Cigar Binder",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigarbinder.png",
		}
	},
	["ngd_cigarillopaper"] = {
		label = "Cigarillo Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigarillopaper.png",
		}
	},
	["ngd_menthol"] = {
		label = "Menthol",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_menthol.png",
		}
	},
	["ngd_premiumcigarpaper"] = {
		label = "Premium Cigar Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_premiumcigarpaper.png",
		}
	},
	["ngd_importcuban"] = {
		label = "Imported Cuban Tobacco",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_importcuban.png",
		}
	},
	["ngd_cig1"] = {
		label = "Standard Cigarette",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cig1.png",
		}
	},
	["ngd_cig2"] = {
		label = "Premium Cigarette",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cig2.png",
		}
	},
	["ngd_cig3"] = {
		label = "Cigarillo",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cig3.png",
		}
	},
	["ngd_cig4"] = {
		label = "Menthol Cigarette",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cig4.png",
		}
	},
	["ngd_cigar1"] = {
		label = "Standard Cigar",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigar1.png",
		}
	},
	["ngd_cigar2"] = {
		label = "Premium Cigar",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigar2.png",
		}
	},
	["ngd_cigar3"] = {
		label = "Cuban Cigar",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigar3.png",
		}
	},
	["ngd_pipe1"] = {
		label = "Ivory Pipe",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_pipe1.png",
		}
	},
	["ngd_pipe2"] = {
		label = "Cherrywood Pipe",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_pipe2.png",
		}
	},
	["ngd_pipe3"] = {
		label = "Cocobolo Pipe",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_pipe3.png",
		}
	},
	["ngd_pipe4"] = {
		label = "Corncob Pipe",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_pipe4.png",
		}
	},
	["ngd_pipe5"] = {
		label = "Churchwarden Pipe",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_pipe5.png",
		}
	},
	["ngd_cherryoil"] = {
		label = "Cherry Tobacco Flavoring",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cherryoil.png",
		}
	},
	["ngd_mapleoil"] = {
		label = "Maple Tobacco Flavoring",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_mapleoil.png",
		}
	},
	["ngd_lemonoil"] = {
		label = "Lemon Tobacco Flavoring",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_lemonoil.png",
		}
	},
	["ngd_wintergreenoil"] = {
		label = "Wintergreen Tobacco Flavoring",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_wintergreenoil.png",
		}
	},
	["ngd_standardcigpack"] = {
		label = "Pack Of Cigarettes",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_standardcigpack.png",
		}
	},
	["ngd_premiumcigpack"] = {
		label = "Pack Of Premium Cigarettes",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_premiumcigpack.png",
		}
	},
	["ngd_cigarillopack"] = {
		label = "Pack Of Cigarillos",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cigarillopack.png",
		}
	},
	["ngd_mentholcigpack"] = {
		label = "Pack Of Menthol Cigarettes",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_mentholcigpack.png",
		}
	},
	["ngd_stdcigarbox"] = {
		label = "Box Of Cigars",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_stdcigarbox.png",
		}
	},
	["ngd_premiumcigarbox"] = {
		label = "Premium Box Of Cigars",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_premiumcigarbox.png",
		}
	},
	["ngd_cubancigarbox"] = {
		label = "Box Of Cuban Cigars",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_cubancigarbox.png",
		}
	},
	["ngd_tobaccowhisky"] = {
		label = "Whisky",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ngd_tobaccowhisky.png",
		}
	},
	['weapon_case'] =                     {label = 'Weapon Case',               weight = 5, stack = true, close = false, description = "Case for something", image = "weapon_case.png"},
['weapon_blueprint_pistol'] =         {label = 'Pistol Blueprint',          weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_pistol.png"},
['weapon_blueprint_snspistol'] =      {label = 'SNS Pistol Blueprint',      weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_snspistol.png"},
['weapon_blueprint_vintagepistol'] =  {label = 'Vintage Pistol Blueprint',  weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_vintagepistol.png"},
['weapon_blueprint_appistol'] =       {label = 'AP Pistol Blueprint',       weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_appistol.png"},
['weapon_blueprint_pistol50'] =       {label = 'Pistol 50 Blueprint',       weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_pistol50.png"},
['weapon_blueprint_heavypistol'] =    {label = 'Heavy Pistol Blueprint',    weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_heavypistol.png"},
['weapon_blueprint_microsmg'] =       {label = 'Micro SMG Blueprint',       weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_microsmg.png"},
['weapon_blueprint_minismg'] =        {label = 'Mini SMG Blueprint',        weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_minismg.png"},
['weapon_blueprint_sawnoffshotgun'] = {label = 'Sawnoff Shotgun Blueprint', weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_sawnoffshotgun.png"},
['weapon_blueprint_assaultrifle'] =   {label = 'Assault Rifle Blueprint',   weight = 5, stack = true, close = false, description = "A blueprint?",       image = "weapon_blueprint_assaultrifle.png"},
['pistol_frame'] =                    {label = 'Pistol Frame',              weight = 5, stack = true, close = false, description = "A frame?",           image = "pistol_frame.png"},
['snspistol_frame'] =                 {label = 'SNS Pistol Frame',          weight = 5, stack = true, close = false, description = "A frame?",           image = "snspistol_frame.png"},
['vintagepistol_frame'] =             {label = 'Vintage Pistol Frame',      weight = 5, stack = true, close = false, description = "A frame?",           image = "vintagepistol_frame.png"},
['appistol_frame'] =                  {label = 'AP Pistol Frame',           weight = 5, stack = true, close = false, description = "A frame?",           image = "appistol_frame.png"},
['pistol50_frame'] =                  {label = 'Pistol 50 Frame',           weight = 5, stack = true, close = false, description = "A frame?",           image = "pistol50_frame.png"},
['heavypistol_frame'] =               {label = 'Heavy Pistol Frame',        weight = 5, stack = true, close = false, description = "A frame?",           image = "heavypistol_frame.png"},
['microsmg_frame'] =                  {label = 'Micro SMG Frame',           weight = 5, stack = true, close = false, description = "A frame?",           image = "microsmg_frame.png"},
['minismg_frame'] =                   {label = 'Mini SMG Frame',            weight = 5, stack = true, close = false, description = "A frame?",           image = "minismg_frame.png"},
['sawnoffshotgun_frame'] =            {label = 'Sawnoff Shotgun Frame',     weight = 5, stack = true, close = false, description = "A frame?",           image = "sawnoffshotgun_frame.png"},
['assaultrifle_frame'] =              {label = 'Assault Rifle Frame',       weight = 5, stack = true, close = false, description = "A frame?",           image = "assaultrifle_frame.png"},
['brass'] =                           {label = 'Brass',                     weight = 5, stack = true, close = false, description = "Crafting Material",  image = "brass.png"},
['gunpowder'] =                       {label = 'Gunpowder',                 weight = 5, stack = true, close = false, description = "Powder?",            image = "gunpowder.png"},
['pistol'] =                          {label = 'Pistol Model',              weight = 5, stack = true, close = false, description = "Nice Model?",        image = "pistol.png"},
['snspistol'] =                       {label = 'SNS Pistol Model',          weight = 5, stack = true, close = false, description = "Nice Model?",        image = "snspistol.png"},
['vintagepistol'] =                   {label = 'Vintage Pistol Model',      weight = 5, stack = true, close = false, description = "Nice Model?",        image = "vintagepistol.png"},
['appistol'] =                        {label = 'AP Pistol Model',           weight = 5, stack = true, close = false, description = "Nice Model?",        image = "appistol.png"},
['pistol50'] =                        {label = 'Pistol 50 Model',           weight = 5, stack = true, close = false, description = "Nice Model?",        image = "pistol50.png"},
['heavypistol'] =                     {label = 'Heavy Pistol Model',        weight = 5, stack = true, close = false, description = "Nice Model?",        image = "heavypistol.png"},
['microsmg'] =                        {label = 'Micro SMG Model',           weight = 5, stack = true, close = false, description = "Nice Model?",        image = "microsmg.png"},
['minismg'] =                         {label = 'Mini SMG Model',            weight = 5, stack = true, close = false, description = "Nice Model?",        image = "minismg.png"},
['sawnoffshotgun'] =                  {label = 'Sawnoff Shotgun Model',     weight = 5, stack = true, close = false, description = "Nice Model?",        image = "sawnoffshotgun.png"},
['assaultrifle'] =                    {label = 'Assault Rifle Model',       weight = 5, stack = true, close = false, description = "Nice Model?",        image = "assaultrifle.png"},

}