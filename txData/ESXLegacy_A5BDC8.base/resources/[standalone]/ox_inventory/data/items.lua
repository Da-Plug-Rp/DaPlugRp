return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
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
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	["shield"] = {
        label = "Police shield",
        weight = 8000,
        stack = false,
        consume = 0,
        client = {
            export = "ND_Police.useShield",
            add = function(total)
                if total > 0 then
                        pcall(function() return exports["ND_Police"]:hasShield(true) end)
                    end
                end,
            remove = function(total)
                if total < 1 then
                    pcall(function() return exports["ND_Police"]:hasShield(false) end)
                end
            end
        }
    },
	

	['xphone'] = {
		label = 'xPhone',
		weight = 185,
		stack = false
	},

	['uvlight'] = {
		label = 'UV Light',
		weight = 95,
		stack = false
	},
	['bleachwipes'] = {
		label = 'Bleach Wipes',
		weight = 185,
		stack = true
	},
	
	['medicalbag'] = {
		label = 'Medical Bag',
		weight = 220,
		stack = true,
		description = "A comprehensive medical kit for treating injuries and ailments.",
	},

	['crutch'] = {
		label = 'Crutch',
		weight = 165,
		stack = false,
		close = true,
	},
	
	['wheelchair'] = {
		label = 'Wheelchair',
		weight = 540,
		stack = false,
		close = true,
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 100,
		stack = true,
		description = "A simple bandage used to cover and protect wounds.",
	},
	
	['defibrillator'] = {
		label = 'Defibrillator',
		weight = 100,
		stack = true,
		description = "Used for reviving patients.",
	},
	
	['tweezers'] = {
		label = 'Tweezers',
		weight = 100,
		stack = true,
		description = "Precision tweezers for safely removing foreign objects, such as bullets, from wounds.",
	},
	
	['burncream'] = {
		label = 'Burn Cream',
		weight = 100,
		stack = true,
		description = "Specialized cream for treating and soothing minor burns and skin irritations.",
	},
	
	['suturekit'] = {
		label = 'Suture Kit',
		weight = 100,
		stack = true,
		description = "A kit containing surgical tools and materials for stitching and closing wounds.",
	},
	
	['icepack'] = {
		label = 'Ice Pack',
		weight = 200,
		stack = true,
		description = "An ice pack used to reduce swelling and provide relief from pain and inflammation.",
	},
	
	['stretcher'] = {
		label = 'Ice Pack',
		weight = 200,
		stack = true,
		description = "An ice pack used to reduce swelling and provide relief from pain and inflammation.",
	},

	['boombox'] = {
		label = 'boom-box',
		weight = 200,
		stack = true,
		description = "An ice pack used to reduce swelling and provide relief from pain and inflammation.",
	},
	
	['emstablet'] = {
		label = 'Ems tablet',
		weight = 200,
		stack = true,
		client = {
			export = 'ars_ambulancejob.openDistressCalls'
		}
	},

	['handcuffs'] = {
		label = 'handcuffs',
		weight = 200,
		stack = true,
		client = {
			export = 'ars_ambulancejob.openDistressCalls'
		}
	},
	
	
	['tuna'] = {
		label = 'Tuna',
		weight = 650,
		stack = true,
		close = false,
	},
	
	['salmon'] = {
		label = 'Salmon',
		weight = 350,
		stack = true,
		close = false,
	},

	['wood'] = {
		label = 'Wood',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	
	['metal'] = {
		label = 'Metal',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	
	['rope'] = {
		label = 'Rope',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	
	['shovel'] = {
		label = 'Shovel',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	
	['empty_evidence_bag'] = {
		label = 'Empty Evidence Bag',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	
	['filled_evidence_bag'] = {
		label = 'Evidence Bag',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	
	['evidence_tools'] = {
		label = 'Evidence Tools Bag',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	
	['uvlight'] = {
		label = 'UV Light',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['trout'] = {
		label = 'Trout',
		weight = 250,
		stack = true,
		close = false,
	},

	['anchovy'] = {
		label = 'Anchovy',
		weight = 50,
		stack = true,
		close = false,
	},

	['fishbait'] = {
		label = 'Fish Bait',
		weight = 50,
		stack = true,
		close = false,
	},

	['fishingrod'] = {
		label = 'Fishing Rod',
		weight = 800,
		stack = true,
		close = true,
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['animal_tracker'] = {
		label = 'Animal Tracker',
		weight = 200,
		allowArmed = true,
		stack = false,
	},
	['campfire'] = {
		label = 'Campfire',
		weight = 200,
		allowArmed = true,
		stack = false,
	},
	
	['huntingbait'] = {
		label = 'Hunting Bait',
		weight = 100,
		allowArmed = true,
	},
	
	['cooked_meat'] = {
		label = 'Cooked Meat',
		weight = 200,
	},
	['raw_meat'] = {
		label = 'Raw Meat',
		weight = 200,
	},
	
	['skin_deer_ruined'] = {
		label = 'Tattered Deer Pelt',
		weight = 200,
		stack = false,
	},
	['skin_deer_low'] = {
		label = 'Worn Deer Pelt',
		weight = 200,
	},
	['skin_deer_medium'] = {
		label = 'Supple Deer Pelt',
		weight = 200,
	},
	['skin_deer_good'] = {
		label = 'Prime Deer Pelt',
		weight = 200,
	},
	['skin_deer_perfect'] = {
		label = 'Flawless Deer Pelt',
		weight = 200,
	},
	
	['deer_horn'] = {
		label = 'Deer Horn',
		weight = 1000,
	},
	
	['burger'] = {
		label = 'Burger',
		weight = 220,
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
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},


	["chain_medal"] = {
		label = "Chain Medal",
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
	["chain_is"] = {
		label = "Chain IS",
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
	["chain_dogtag"] = {
		label = "Chain Dogtag",
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
	["chain_m"] = {
		label = "Chain M",
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
	["earrings_sgold"] = {
		label = "Earrings SGold",
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
	["karaoke_earrings"] = {
		label = "Karaoke Earrings",
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
	["rectdia_earrings"] = {
		label = "RectDia Earrings",
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
	["skull_bracelet"] = {
		label = "Skull Bracelet",
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
	["necklace_dogtag"] = {
		label = "Necklace Dogtag",
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
	["hex_gold"] = {
		label = "Hex Gold",
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
	["pendulus_platinum"] = {
		label = "Pendulus Platinum",
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
	["platinum_bar"] = {
		label = "Platinum Bar",
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
	["blue_stone"] = {
		label = "Blue Stone",
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
	["red_stone"] = {
		label = "Red Stone",
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
	["pearl"] = {
		label = "Pearl",
		weight = 1,
		stack = true,
		close = true,
	},
	["fs_chain"] = {
		label = "Chain",
		weight = 1,
		stack = true,
		close = true,
	},
	["black_stone"] = {
		label = "Black Stone",
		weight = 1,
		stack = true,
		close = true,
	},
	["earring_material"] = {
		label = "Earring Base",
		weight = 1,
		stack = true,
		close = true,
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

 	['garbage'] = {
		label = 'Garbage',
	},

	["fs_trapphone"] = {
		label = "Trap Phone",
		weight = 1,
		stack = true,
		close = true,
		description = 'Secure Phone for Drug sell'
	},

	['wigphone'] = {
		label = 'Wig Phone',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	
	['wigtable'] = {
		label = 'Wig Table',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['sewinkit'] = {
		label = 'Sew in Kit',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['wigcap'] = {
		label = 'Wig Cap',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['hairbundles'] = {
		label = 'Hair Bundles',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['wigphone'] = {
		label = 'Wig Phone',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	
	["fs_redswitch"] = {
		label = "Red Switch",
		weight = 1,
		stack = true,
		close = true,
		allowArmed = true,
		description = 'Red Weapon Switch',
		client = {
			export = 'fs_switch.fs_redswitch'
		},
},
	
	['fortyinchwig'] = {
		label = '40 inch Wig',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['braidswig'] = {
		label = 'Braids Wig',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['curlywig'] = {
		label = 'Curly Wig',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['bangwig'] = {
		label = 'Bang Wig',
		weight = 1,
		stack = true,
		close = true,
		description = nil
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
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
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
		weight = 500,
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
		weight = 500,
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
		weight = 1000,
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

	["alive_chicken"] = {
		label = "Living chicken",
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

	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
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

	["catfish"] = {
		label = "Catfish",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_caesar_salad"] = {
		label = "Chicken Caesar Salad",
		weight = 1,
		stack = true,
		close = true,
	},

	["clothe"] = {
		label = "Cloth",
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

	["crab_cakes"] = {
		label = "Crab Cakes",
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

	["cutted_wood"] = {
		label = "Cut wood",
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

	["dom_perignon"] = {
		label = "Dom Perignon",
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

	["fried_mushrooms"] = {
		label = "Fried Mushrooms",
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

	["gazbottle"] = {
		label = "Gas Bottle",
		weight = 2,
		stack = true,
		close = true,
	},

	["glazed_salmon"] = {
		label = "Glazed Salmon",
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

	["gourmet_double_burger"] = {
		label = "Gourmet Double Burger",
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

	["iron"] = {
		label = "Iron",
		weight = 1,
		stack = true,
		close = true,
	},

	["lobster_bisque"] = {
		label = "Lobster Bisque",
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

	["oysters_half_shell"] = {
		label = "Oysters On the Half Shell",
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

	["patron_margarita"] = {
		label = "Patron Margarita",
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

	["ps_coca_cola"] = {
		label = "Coca Cola",
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

	["ps_sprite"] = {
		label = "Sprite",
		weight = 1,
		stack = true,
		close = true,
	},

	["salmon_caesar_salad"] = {
		label = "Salmon Caesar Salad",
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

	["shrimp_alfredo"] = {
		label = "Shrimp Alfredo",
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

	["shrimp_pasta"] = {
		label = "Shrimp Pasta",
		weight = 1,
		stack = true,
		close = true,
	},

	["side_caesar_salad"] = {
		label = "Side Caesar Salad",
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

	["steak_and_lobster_meal"] = {
		label = "Steak & Lobster Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["stone"] = {
		label = "Stone",
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

	["tropical_chicken_salad"] = {
		label = "Tropical Chicken Salad",
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

	["washed_stone"] = {
		label = "Washed stone",
		weight = 1,
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

	["black_bag"] = {
		label = "Black Bag",
		weight = 1,
		stack = true,
		close = true,
	},

	["black_glass"] = {
		label = "Black Glass",
		weight = 1,
		stack = true,
		close = true,
	},

	["black_hat"] = {
		label = "Black Hat",
		weight = 1,
		stack = true,
		close = true,
	},

	["black_jeans"] = {
		label = "Black Jeans",
		weight = 1,
		stack = true,
		close = true,
	},

	["black_vest"] = {
		label = "Black Vest",
		weight = 1,
		stack = true,
		close = true,
	},

	["yellow_shoes"] = {
		label = "Yellow Shoes",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_blankcard"] = {
		label = "Blank Card",
		weight = 10,
		stack = true,
		close = true,
	},

	["fs_bonnet"] = {
		label = "Scrap Bonnet",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_boot"] = {
		label = "Scrap Boot",
		weight = 10,
		stack = true,
		close = true,
	},

	["fs_clonnedcard"] = {
		label = "Cloned Card",
		weight = 10,
		stack = true,
		close = true,
	},

	["fs_door"] = {
		label = "Scap Door",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_forgedcheque"] = {
		label = "Forged Check",
		weight = 10,
		stack = true,
		close = true,
	},

	["fs_generator"] = {
		label = "Generator",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_laptop"] = {
		label = "Laptop",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_printer"] = {
		label = "Printer",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_skimmer"] = {
		label = "Skimmer",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_stolencard"] = {
		label = "Stolencard",
		weight = 10,
		stack = true,
		close = true,
	},

	["fs_usb"] = {
		label = "Info Usb",
		weight = 10,
		stack = true,
		close = true,
	},

	["fs_whiteslip"] = {
		label = "White Slip",
		weight = 10,
		stack = true,
		close = true,
	},

	["threequarter_raglan_sleeve"] = {
		label = "Three Quarter Raglan Sleeve",
		weight = 1,
		stack = true,
		close = true,
	},

	["monkey_mask"] = {
		label = "Monkey Mask",
		weight = 1,
		stack = true,
		close = true,
	},

	["apple_gelato"] = {
		label = "Apple Gelato",
		weight = 1,
		stack = true,
		close = true,
	},

	["apple_gelato_joint"] = {
		label = "Apple Gelato Joint",
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

	["backwoods_honey"] = {
		label = "Backwoods Honey",
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

	["banana_backwoods"] = {
		label = "Banana Backwoods",
		weight = 1,
		stack = true,
		close = true,
	},

	["biscotti"] = {
		label = "Biscotti",
		weight = 1,
		stack = true,
		close = true,
	},

	["biscotti_joint"] = {
		label = "Biscotti Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["blacknmild"] = {
		label = "Blacknmild",
		weight = 1,
		stack = true,
		close = true,
	},

	["blueberry_cruffin"] = {
		label = "Blueberry Cruffin",
		weight = 1,
		stack = true,
		close = true,
	},

	["blueberry_cruffin_joint"] = {
		label = "Blueberry Cruffin Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["blueberry_jam_cookie"] = {
		label = "Blueberry Jam Cookie",
		weight = 1,
		stack = true,
		close = true,
	},

	["blue_tomyz"] = {
		label = "Blue Tomyz",
		weight = 1,
		stack = true,
		close = true,
	},

	["blue_tomyz_joint"] = {
		label = "Blue Tomyz Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["butter_cookie"] = {
		label = "Butter Cookie",
		weight = 1,
		stack = true,
		close = true,
	},

	["cake_mix"] = {
		label = "Cake Mix",
		weight = 1,
		stack = true,
		close = true,
	},

	["cake_mix_joint"] = {
		label = "Cake Mix Joint",
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

	["ice_cream_cake_pack"] = {
		label = "Ice Cream Cake Pack",
		weight = 1,
		stack = true,
		close = true,
	},

	["ice_cream_cake_pack_joint"] = {
		label = "Ice Cream Cake Pack Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["jefe"] = {
		label = "Jefe",
		weight = 1,
		stack = true,
		close = true,
	},

	["jefe_joint"] = {
		label = "Jefe Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["key_lime_cookie"] = {
		label = "Key Lime Cookie",
		weight = 1,
		stack = true,
		close = true,
	},

	["khalifa_kush"] = {
		label = "Khalifa Kush",
		weight = 1,
		stack = true,
		close = true,
	},

	["khalifa_kush_joint"] = {
		label = "Khalifa Kush Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["la_confidential"] = {
		label = "LA Confidential",
		weight = 1,
		stack = true,
		close = true,
	},

	["la_confidential_joint"] = {
		label = "LA Confidential Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["lighter"] = {
		label = "Lighter",
		weight = 1,
		stack = true,
		close = true,
	},

	["marathon"] = {
		label = "Marathon",
		weight = 1,
		stack = true,
		close = true,
	},

	["marathon_joint"] = {
		label = "Marathon Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["marlboro"] = {
		label = "Marlboro",
		weight = 1,
		stack = true,
		close = true,
	},

	["marshmallow_crisp"] = {
		label = "Marshmallow Crisp",
		weight = 1,
		stack = true,
		close = true,
	},

	["marshmallow_og"] = {
		label = "Marshmallow OG",
		weight = 1,
		stack = true,
		close = true,
	},

	["marshmallow_og_joint"] = {
		label = "Marshmallow OG Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["moon_rock"] = {
		label = "Moon Rock",
		weight = 1,
		stack = true,
		close = true,
	},

	["moon_rock_joint"] = {
		label = "Moon Rock Joint",
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

	["newport"] = {
		label = "Newport",
		weight = 1,
		stack = true,
		close = true,
	},

	["cereal_milk_joint"] = {
		label = "Cereal Milk Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["oreoz"] = {
		label = "Oreoz",
		weight = 1,
		stack = true,
		close = true,
	},

	["oreoz_joint"] = {
		label = "Oreoz Joint",
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

	["packaged_tea"] = {
		label = "PACKAGED TEA",
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

	["cheetah_piss"] = {
		label = "Cheetah Piss",
		weight = 1,
		stack = true,
		close = true,
	},

	["cheetah_piss_joint"] = {
		label = "Cheetah Piss Joint",
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

	["collins_ave"] = {
		label = "Collins AVE",
		weight = 1,
		stack = true,
		close = true,
	},

	["collins_ave_joint"] = {
		label = "Collins AVE Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["cookie_craze"] = {
		label = "Cookie Craze",
		weight = 1,
		stack = true,
		close = true,
	},

	["pink_sandy_joint"] = {
		label = "Pink Sandy Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["pirckly_pear"] = {
		label = "Pirckly Pear",
		weight = 1,
		stack = true,
		close = true,
	},

	["pirckly_pear_joint"] = {
		label = "Pirckly Pear Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["plastic"] = {
		label = "Plastic",
		weight = 1,
		stack = true,
		close = true,
	},

	["pogo"] = {
		label = "Pogo",
		weight = 1,
		stack = true,
		close = true,
	},

	["cubancigar"] = {
		label = "Cubancigar",
		weight = 1,
		stack = true,
		close = true,
	},

	["pink_sandy"] = {
		label = "Pink Sandy",
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

	["davidoffcigar"] = {
		label = "Davidoffcigar",
		weight = 1,
		stack = true,
		close = true,
	},

	["pumpkin_cookie"] = {
		label = "Pumpkin Cookie",
		weight = 1,
		stack = true,
		close = true,
	},

	["white_runtz_joint"] = {
		label = "White Runtz Joint",
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

	["white_runtz"] = {
		label = "White Runtz",
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

	["whitecherry_gelato_joint"] = {
		label = "Whitecherry Gelato Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["electronics"] = {
		label = "Electronics",
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

	["ether"] = {
		label = "Ether",
		weight = 1,
		stack = true,
		close = true,
	},

	["ether_joint"] = {
		label = "Ether Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["runtz_og_joint"] = {
		label = "Runtz OG Joint",
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

	["fine_china_joint"] = {
		label = "Fine China Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["snow_man"] = {
		label = "Snow Man",
		weight = 1,
		stack = true,
		close = true,
	},

	["snow_man_joint"] = {
		label = "Snow Man Joint",
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

	["sour_diesel"] = {
		label = "Sour Diesel",
		weight = 1,
		stack = true,
		close = true,
	},

	["sour_diesel_joint"] = {
		label = "Sour Diesel Joint",
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

	["froties"] = {
		label = "Froties",
		weight = 1,
		stack = true,
		close = true,
	},

	["froties_joint"] = {
		label = "Froties Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["strawberry_jam_cookie"] = {
		label = "Strawberry Jam Cookie",
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

	["tahoe_og"] = {
		label = "Tahoe OG",
		weight = 1,
		stack = true,
		close = true,
	},

	["tahoe_og_joint"] = {
		label = "Tahoe OG Joint",
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

	["seed_weed"] = {
		label = "Weed Seed",
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

	["steel"] = {
		label = "Steel",
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

	["wake_up_wrap"] = {
		label = "WAKE-UP WRAP",
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

	["shamrock_cookie"] = {
		label = "Shamrock Cookie",
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

	["gary_payton"] = {
		label = "Gary Payton",
		weight = 1,
		stack = true,
		close = true,
	},

	["gary_payton_joint"] = {
		label = "Gary Payton Joint",
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

	["gelatti"] = {
		label = "Gelatti",
		weight = 1,
		stack = true,
		close = true,
	},

	["gelatti_joint"] = {
		label = "Gelatti Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["georgia_pie"] = {
		label = "Georgia Pie",
		weight = 1,
		stack = true,
		close = true,
	},

	["georgia_pie_joint"] = {
		label = "Georgia Pie Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["get_figgy"] = {
		label = "Get Figgy",
		weight = 1,
		stack = true,
		close = true,
	},

	["runtz_og"] = {
		label = "Runtz OG",
		weight = 1,
		stack = true,
		close = true,
	},

	["gmo_cookies"] = {
		label = "GMO Cookies",
		weight = 1,
		stack = true,
		close = true,
	},

	["gmo_cookies_joint"] = {
		label = "GMO Cookies Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["rubber"] = {
		label = "Rubber",
		weight = 1,
		stack = true,
		close = true,
	},

	["recvoucher"] = {
		label = "Redeem Voucher",
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

	["zushi_joint"] = {
		label = "Zushi Joint",
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

	["grabba_leaf"] = {
		label = "Grabba Leaf",
		weight = 1,
		stack = true,
		close = true,
	},

	["paris_fog"] = {
		label = "Paris Fog",
		weight = 1,
		stack = true,
		close = true,
	},

	["no_99"] = {
		label = "NO 99",
		weight = 1,
		stack = true,
		close = true,
	},

	["cereal_milk"] = {
		label = "Cereal Milk",
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

	["noodle_chinese"] = {
		label = "Noodle Chinese",
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

	["onion_ring"] = {
		label = "Onion Ring",
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

	["pancake_sausage_platter"] = {
		label = "Pancake & Sausage Platter",
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

	["big_fish"] = {
		label = "Big Fish",
		weight = 1,
		stack = true,
		close = true,
	},

	["pasta_salad"] = {
		label = "Pasta Salad",
		weight = 1,
		stack = true,
		close = true,
	},

	["pasta_soup"] = {
		label = "Pasta Soup",
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

	["pepsi_max"] = {
		label = "Pepsi Max",
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

	["blue_lagoon"] = {
		label = "Blue Lagoon",
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

	["boneless_meal_deal"] = {
		label = "Boneless Meal Deal",
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

	["bottle_diet_coke"] = {
		label = "20oz Bottle Diet Coke",
		weight = 1,
		stack = true,
		close = true,
	},

	["prawn_chicken_ramen"] = {
		label = "Prawn Chicken Ramen",
		weight = 1,
		stack = true,
		close = true,
	},

	["prawn_ramen"] = {
		label = "prawn ramen",
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

	["bs_chicken_jr"] = {
		label = "Chicken Jr.",
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

	["bs_diet_coke"] = {
		label = "Medium Diet Coke",
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

	["rodeo_burger"] = {
		label = "Rodeo Burger",
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

	["bs_sprite"] = {
		label = "Medium Sprite",
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

	["saimin_ramen_chinese_yakisoba"] = {
		label = "Saimin Ramen Chinese Yakisoba",
		weight = 1,
		stack = true,
		close = true,
	},

	["salad_chicken"] = {
		label = "Salad Chicken",
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

	["salmon_soup"] = {
		label = "Salmon Soup",
		weight = 1,
		stack = true,
		close = true,
	},

	["sammer_drink"] = {
		label = "Sammer Drink",
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

	["sandwichfood_slice_salad"] = {
		label = "Sandwichfood Slice Salad",
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

	["seasoned_fries"] = {
		label = "SEASONED FRIES",
		weight = 1,
		stack = true,
		close = true,
	},

	["seven_up"] = {
		label = "Seven Up",
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

	["cheeseburger_king_jr"] = {
		label = "Cheeseburger King Jr Meal",
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

	["small_hash_browns"] = {
		label = "Small Hash Browns",
		weight = 1,
		stack = true,
		close = true,
	},

	["cheesy_tots"] = {
		label = "Cheesy Tots",
		weight = 1,
		stack = true,
		close = true,
	},

	["chesse_salad"] = {
		label = "Chesse Salad",
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

	["soft_serve_cup"] = {
		label = "Soft Serve Cup",
		weight = 1,
		stack = true,
		close = true,
	},

	["soupsthick"] = {
		label = "Soupsthick",
		weight = 1,
		stack = true,
		close = true,
	},

	["soup_prawn"] = {
		label = "Soup Prawn",
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

	["chocolate_chunk_brownie"] = {
		label = "TRIPLE CHOCOLATE CHUNK BROWNIE",
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

	["sour_ramen"] = {
		label = "Sour Ramen",
		weight = 1,
		stack = true,
		close = true,
	},

	["spicy_deluxe_sandwich"] = {
		label = "Spicy Ch King Deluxe Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["chopped_salads"] = {
		label = "Chopped Salads",
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

	["coca_cola"] = {
		label = "Coca Cola",
		weight = 1,
		stack = true,
		close = true,
	},

	["cocktail"] = {
		label = "Cocktail",
		weight = 1,
		stack = true,
		close = true,
	},

	["cocktail_drink"] = {
		label = "Cocktail Drink",
		weight = 1,
		stack = true,
		close = true,
	},

	["cocktail_lemon"] = {
		label = "Cocktail Lemon",
		weight = 1,
		stack = true,
		close = true,
	},

	["summer_cocktail"] = {
		label = "Summer Cocktail",
		weight = 1,
		stack = true,
		close = true,
	},

	["summer_drinks"] = {
		label = "Summer Drinks",
		weight = 1,
		stack = true,
		close = true,
	},

	["summer_drink_mojita"] = {
		label = "Summer Drink Mojita",
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

	["sun_apple_juice"] = {
		label = "Capri Sun Apple Juice",
		weight = 1,
		stack = true,
		close = true,
	},

	["corn_chicken_ramen"] = {
		label = "Corn Chicken Ramen",
		weight = 1,
		stack = true,
		close = true,
	},

	["corn_soup"] = {
		label = "Corn Soup",
		weight = 1,
		stack = true,
		close = true,
	},

	["tango_apple"] = {
		label = "Tango Apple",
		weight = 1,
		stack = true,
		close = true,
	},

	["tango_orange"] = {
		label = "Tango Orange",
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

	["creamy_chicken_ramen"] = {
		label = "Creamy Chicken Ramen",
		weight = 1,
		stack = true,
		close = true,
	},

	["creamy_ramen"] = {
		label = "Creamy Ramen",
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

	["crispy_tender_combo"] = {
		label = "LARGE 5 PC CRISPY TENDER COMBO",
		weight = 1,
		stack = true,
		close = true,
	},

	["croissant"] = {
		label = "Croissant",
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

	["triple_meal_deal"] = {
		label = "Chicken Biscuit",
		weight = 1,
		stack = true,
		close = true,
	},

	["cupcake_dessert"] = {
		label = "Cupcake Dessert",
		weight = 1,
		stack = true,
		close = true,
	},

	["vegetable_mix_ramen"] = {
		label = "Vegetable Mix Ramen",
		weight = 1,
		stack = true,
		close = true,
	},

	["vegetable_mix_salad"] = {
		label = "Vegetable Mix Salad",
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

	["diet_pepsi"] = {
		label = "Diet Pepsi",
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

	["double_sausage_biscuit"] = {
		label = "Double Sausage, Egg, & Cheese",
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

	["drinks_summer_cocktail"] = {
		label = "Drinks Summer Cocktail",
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

	["egg_corn_mix_ramen"] = {
		label = "Egg Corn Mix Ramen",
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

	["w_medium_fanta_orange"] = {
		label = "Ice Cola",
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

	["family_bundle_classic"] = {
		label = "Family Bundle Classic",
		weight = 1,
		stack = true,
		close = true,
	},

	["fench_fry"] = {
		label = "Fench Fry",
		weight = 1,
		stack = true,
		close = true,
	},

	["food_taco_salad"] = {
		label = "Food Taco Salad",
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

	["fresh_healthy"] = {
		label = "Fresh Healthy",
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

	["group_pack"] = {
		label = "WINGS & THIGH BITES GROUP PACK",
		weight = 1,
		stack = true,
		close = true,
	},

	["hackingcard"] = {
		label = "ATM Hacking card",
		weight = 1,
		stack = true,
		close = true,
	},

	["hackingusb"] = {
		label = "Hacking usb",
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

	["ham_egg_cheese"] = {
		label = "Ham, Egg, & Cheese CroissanWich",
		weight = 1,
		stack = true,
		close = true,
	},

	["healthy_soup"] = {
		label = "Healthy Soup",
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

	["hot_dog"] = {
		label = "Hot Dog",
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

	["yuzu_kara_kuren"] = {
		label = "Yuzu Kara Kuren",
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

	["w_dr_pepper"] = {
		label = "Dr Pepper",
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

	["vanilla_shake"] = {
		label = "Vanilla Shake",
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

	["tofu_soup"] = {
		label = "Tofu Soup",
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

	["sundae_pie"] = {
		label = "HERSHEYS Sundae Pie",
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

	["korean_q_wings"] = {
		label = "Korean Q Wings",
		weight = 1,
		stack = true,
		close = true,
	},

	["spicy_ramen"] = {
		label = "Spicy Ramen",
		weight = 1,
		stack = true,
		close = true,
	},

	["spicy_noodle_ramen"] = {
		label = "spicy Noodle Ramen",
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

	["bs_mozzarella_sticks"] = {
		label = "Mozzarella Sticks",
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

	["party_pack"] = {
		label = "50PC PARTY PACK",
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

	["cheese_sauce"] = {
		label = "CHEESE SAUCE",
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

	["original_chicken_sandwich"] = {
		label = "Original Chicken Sandwich",
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

	["chocolate_dessert_cake"] = {
		label = "Chocolate Dessert Cake",
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

	["chicken_egg_ramen"] = {
		label = "Chicken Egg Ramen",
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

	["small_onion_rings"] = {
		label = "Small Onion Rings",
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

	["cheese_fries"] = {
		label = "CHEESE FRIES",
		weight = 1,
		stack = true,
		close = true,
	},

	["mix_ramen_bowl"] = {
		label = "Mix Ramen Bowl",
		weight = 1,
		stack = true,
		close = true,
	},

	["mix_salad"] = {
		label = "Mix Salad",
		weight = 1,
		stack = true,
		close = true,
	},

	["ramen_japan"] = {
		label = "Ramen Japan",
		weight = 1,
		stack = true,
		close = true,
	},

	["sandwich"] = {
		label = "Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["c4_bomb"] = {
		label = "C4 Bomb",
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

	["mushroom_ramen"] = {
		label = "Mushroom Ramen",
		weight = 1,
		stack = true,
		close = true,
	},

	["naga_chickens"] = {
		label = "Naga Chickens",
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

	["noodle_chicken"] = {
		label = "Noodle Chicken",
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

	["jolly_candy"] = {
		label = "Jolly Candy",
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

	["weed_pooch"] = {
		label = "Weed Pooch",
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

	["xpill"] = {
		label = "X-Pill",
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

	["dab"] = {
		label = "DAB",
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

	["weed_joint"] = {
		label = "Weed Joint",
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

	["fentanyl_pill"] = {
		label = "Fentanyl Pill",
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

	["plastic_wrap"] = {
		label = "Plastic Wrap",
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

	["bathsalts"] = {
		label = "Bath Salts",
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

	["poppy_tears"] = {
		label = "Poppy Tears",
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

	["sprite"] = {
		label = "Sprite",
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

	["spice_pooch"] = {
		label = "Spice Pooch",
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

	["cocaine"] = {
		label = "Cocaine",
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

	["rolling_paper"] = {
		label = "Rolling Paper",
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

	["syriange"] = {
		label = "Syriange",
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

	["opium_joint"] = {
		label = "Opium Joint",
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

	["opium"] = {
		label = "Opium",
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

	["codeine"] = {
		label = "Codeine",
		weight = 1,
		stack = true,
		close = true,
	},

	["cokebrick"] = {
		label = "Cokebrick",
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

	["coke_rail"] = {
		label = "Coke Rail",
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

	["fentanyl_pills"] = {
		label = "Fentanyl Pills",
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

	["oxycodone"] = {
		label = "Oxycodone",
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

	["bakingsoda"] = {
		label = "Baking Soda",
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

	["ketamine"] = {
		label = "Ketamine",
		weight = 1,
		stack = true,
		close = true,
	},

	["id_card_f"] = {
		label = "Malicious Access Card",
		weight = 1,
		stack = true,
		close = true,
	},

	["secure_card"] = {
		label = "Secure ID Card",
		weight = 1,
		stack = true,
		close = true,
	},

	["morphine15"] = {
		label = "Morphine 15MG",
		weight = 1,
		stack = true,
		close = true,
	},

	["morphine30"] = {
		label = "Morphine 30MG",
		weight = 1,
		stack = true,
		close = true,
	},

	["medbag"] = {
		label = "Medical Bag",
		weight = 1,
		stack = true,
		close = true,
	},

	["perc10"] = {
		label = "Percocet 10MG",
		weight = 1,
		stack = true,
		close = true,
	},

	["perc30"] = {
		label = "Percocet 30MG",
		weight = 1,
		stack = true,
		close = true,
	},

	["perc5"] = {
		label = "Percocet 5MG",
		weight = 1,
		stack = true,
		close = true,
	},

	["vic10"] = {
		label = "Vicodin 10MG",
		weight = 1,
		stack = true,
		close = true,
	},

	["defib"] = {
		label = "Defibrillator",
		weight = 1,
		stack = true,
		close = true,
	},

	["vic5"] = {
		label = "Vicodin 5MG",
		weight = 1,
		stack = true,
		close = true,
	},

	["sedative"] = {
		label = "Sedative",
		weight = 1,
		stack = true,
		close = true,
	},

	["acyclovir"] = {
		label = "Acyclovir",
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

	["anchor"] = {
		label = "Anchor",
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

	["apple_juice"] = {
		label = "Honest Kids Apple Juice",
		weight = 1,
		stack = true,
		close = true,
	},

	["apple_sauce"] = {
		label = "Apple Sauce",
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

	["asic_miner_hashing_board"] = {
		label = "Hashing Board",
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

	["atum"] = {
		label = "Tuna fish",
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

	["baby_lobster"] = {
		label = "Baby Lobster",
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

	["baleia"] = {
		label = "Whale",
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

	["beach_shovel"] = {
		label = "Beach Shovel",
		weight = 1,
		stack = true,
		close = true,
	},

	["beefy_nacho"] = {
		label = "Beefy Nacho",
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

	["big_mac"] = {
		label = "Big Mac",
		weight = 1,
		stack = true,
		close = true,
	},

	["big_mac_combo"] = {
		label = "Big Mac Combo",
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

	["black_phone"] = {
		label = "Black Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["blankcard"] = {
		label = "Blank Card",
		weight = 10,
		stack = true,
		close = true,
	},

	["blue_phone"] = {
		label = "Blue Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["brewed_iced_tea"] = {
		label = "Brewed Iced Tea",
		weight = 1,
		stack = true,
		close = true,
	},

	["brown_scramble_bowl"] = {
		label = "Brown Scramble Bowl",
		weight = 1,
		stack = true,
		close = true,
	},

	["brown_scramble_burrito"] = {
		label = "Brown Scramble Burrito",
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

	["buttered_biscuit"] = {
		label = "Buttered Biscuit",
		weight = 1,
		stack = true,
		close = true,
	},

	["caesar_side_salad"] = {
		label = "Caesar Side Salad",
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

	["cali_chicken_bacon"] = {
		label = "Cali Chicken Bacon",
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

	["carbon"] = {
		label = "Carbon",
		weight = 1,
		stack = true,
		close = true,
	},

	["carplay"] = {
		label = "Carplay",
		weight = 3,
		stack = true,
		close = true,
	},

	["carte_biscuit"] = {
		label = "À la Carte Biscuit",
		weight = 1,
		stack = true,
		close = true,
	},

	["chalupa_supreme"] = {
		label = "Chalupa Supreme",
		weight = 1,
		stack = true,
		close = true,
	},

	["cheeseburger_combo_meal"] = {
		label = "Cheeseburger Combo Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["cheese_quesadilla"] = {
		label = "Cheese Quesadilla",
		weight = 1,
		stack = true,
		close = true,
	},

	["cheesy_black_bean"] = {
		label = "Cheesy Black Bean",
		weight = 1,
		stack = true,
		close = true,
	},

	["cheesy_gordita_crunch"] = {
		label = "Cheesy Gordita Crunch",
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

	["chicken_biscuit"] = {
		label = "Chicken Biscuit",
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

	["chicken_burrito"] = {
		label = "Chicken Burrito",
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

	["chicken_club_sandwich"] = {
		label = "Chicken Club Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_egg_cheese"] = {
		label = "Chicken, Egg & Cheese Biscuit",
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

	["chicken_mcnuggets"] = {
		label = "Chicken McNuggets",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_noodle_soup"] = {
		label = "Chicken Noodle Soup",
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

	["chicken_sandwich"] = {
		label = "Chicken Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["chick_fil_a_lemonade"] = {
		label = "Chick-fil-A Lemonade",
		weight = 1,
		stack = true,
		close = true,
	},

	["chick_fil_a_nuggets"] = {
		label = "Chick-fil-A Nuggets",
		weight = 1,
		stack = true,
		close = true,
	},

	["chick_n_minis"] = {
		label = "Chick-n-Minis",
		weight = 1,
		stack = true,
		close = true,
	},

	["chick_n_strips"] = {
		label = "Chick-n-Strips",
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

	["chocolate_chunk_cookie"] = {
		label = "Chocolate Chunk Cookie",
		weight = 1,
		stack = true,
		close = true,
	},

	["chocolate_fudge_brownie"] = {
		label = "Chocolate Fudge Brownie",
		weight = 1,
		stack = true,
		close = true,
	},

	["chocolate_milk"] = {
		label = "Chocolate Milk",
		weight = 1,
		stack = true,
		close = true,
	},

	["chocolate_milkshake"] = {
		label = "Chocolate Milkshake",
		weight = 1,
		stack = true,
		close = true,
	},

	["churros_dip"] = {
		label = "Churros Dip",
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

	["cinnamon_twists"] = {
		label = "Cinnamon Twists",
		weight = 1,
		stack = true,
		close = true,
	},

	["classic_caesar_salad"] = {
		label = "Classic Caesar Salad",
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

	["classic_phone"] = {
		label = "Classic Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["classic_signature_chicken"] = {
		label = "Classic Signature Chicken",
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

	["cobb_salad"] = {
		label = "Cobb Salad",
		weight = 1,
		stack = true,
		close = true,
	},

	["coffee"] = {
		label = "Coffee",
		weight = 1,
		stack = true,
		close = true,
	},

	["cokebaggy"] = {
		label = "Coke baggy",
		weight = 10,
		stack = true,
		close = true,
	},

	["coke_small_brick"] = {
		label = "Coke small brick",
		weight = 10,
		stack = true,
		close = true,
	},

	["conch"] = {
		label = "Conch",
		weight = 1,
		stack = true,
		close = true,
	},

	["condom"] = {
		label = "Condom",
		weight = 100,
		stack = true,
		close = true,
	},

	["cookies_cream_milkshake"] = {
		label = "Cookies & Cream Milkshake",
		weight = 1,
		stack = true,
		close = true,
	},

	["cool_wrap"] = {
		label = "Cool Wrap",
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

	["crablegs_meal"] = {
		label = "Crablegs Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["crab_cake"] = {
		label = "Crab Cake",
		weight = 1,
		stack = true,
		close = true,
	},

	["creatine"] = {
		label = "Creatine",
		weight = 1,
		stack = true,
		close = true,
	},

	["crispy_chicken_sandwich"] = {
		label = "Crispy Chicken Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["crispy_chicken_staco"] = {
		label = "Crispy Chicken Soft Taco",
		weight = 1,
		stack = true,
		close = true,
	},

	["crunchwrap_supreme"] = {
		label = "Crunchwrap Supreme",
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

	["crunchytaco"] = {
		label = "Crunchy Taco",
		weight = 1,
		stack = true,
		close = true,
	},

	["crunchy_taco_supreme"] = {
		label = "Crunchy Taco Supreme",
		weight = 1,
		stack = true,
		close = true,
	},

	["cutchicken"] = {
		label = "Cut Chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["deluxe_crispy_sandwich_combo"] = {
		label = "Deluxe Crispy Sandwich Combo",
		weight = 1,
		stack = true,
		close = true,
	},

	["deluxe_sandwich"] = {
		label = "Deluxe Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["diamonds_box"] = {
		label = "Diamonds box",
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

	["double_gourmet"] = {
		label = "Double Gourmet",
		weight = 1,
		stack = true,
		close = true,
	},

	["double_quarter_combo"] = {
		label = "Double Quarter Combo",
		weight = 1,
		stack = true,
		close = true,
	},

	["double_quarter_pounder"] = {
		label = "Double Quarter Pounder",
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

	["drill"] = {
		label = "Drill",
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

	["egg_cheese_biscuit"] = {
		label = "Egg Cheese Biscuit",
		weight = 1,
		stack = true,
		close = true,
	},

	["egg_cheese_muffin"] = {
		label = "Egg & Cheese Muffin",
		weight = 1,
		stack = true,
		close = true,
	},

	["egg_mcmuffin"] = {
		label = "Egg McMuffin",
		weight = 1,
		stack = true,
		close = true,
	},

	["egg_white_grill"] = {
		label = "Egg White Grill",
		weight = 1,
		stack = true,
		close = true,
	},

	["emerald"] = {
		label = "Emerald",
		weight = 20,
		stack = true,
		close = true,
	},

	["emptydocuments"] = {
		label = "Blank Documents",
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

	["english_muffin"] = {
		label = "English Muffin",
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

	["fishingkey"] = {
		label = "Corroded Key",
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

	["fishtaco"] = {
		label = "Fish Taco",
		weight = 1,
		stack = true,
		close = true,
	},

	["fish_tilapia"] = {
		label = "Fish Tilapia",
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

	["forgedcheck"] = {
		label = "Forged Check",
		weight = 10,
		stack = true,
		close = true,
	},

	["fries_grande"] = {
		label = "Fries Grande",
		weight = 1,
		stack = true,
		close = true,
	},

	["frosted_coffee"] = {
		label = "Frosted Coffee",
		weight = 1,
		stack = true,
		close = true,
	},

	["frosted_lemonade"] = {
		label = "Frosted Lemonade",
		weight = 1,
		stack = true,
		close = true,
	},

	["fruit_cup"] = {
		label = "Fruit Cup",
		weight = 1,
		stack = true,
		close = true,
	},

	["gameboy_black"] = {
		label = "Gameboy",
		weight = 1,
		stack = true,
		close = true,
	},

	["gameboy_cyan"] = {
		label = "Gameboy",
		weight = 1,
		stack = true,
		close = true,
	},

	["gameboy_green"] = {
		label = "Gameboy",
		weight = 1,
		stack = true,
		close = true,
	},

	["gameboy_pink"] = {
		label = "Gameboy",
		weight = 1,
		stack = true,
		close = true,
	},

	["gameboy_purple"] = {
		label = "Gameboy",
		weight = 1,
		stack = true,
		close = true,
	},

	["gameboy_red"] = {
		label = "Gameboy",
		weight = 1,
		stack = true,
		close = true,
	},

	["gamepad"] = {
		label = "Gamepad",
		weight = 1,
		stack = true,
		close = true,
	},

	["gas_mask"] = {
		label = "Gas mask",
		weight = 1,
		stack = true,
		close = true,
	},

	["generator"] = {
		label = "Generator",
		weight = 1,
		stack = true,
		close = true,
	},

	["glazed_almon"] = {
		label = "Glazed Almon",
		weight = 1,
		stack = true,
		close = true,
	},

	["gold_ingot"] = {
		label = "Gold ingot",
		weight = 1,
		stack = true,
		close = true,
	},

	["gold_phone"] = {
		label = "Gold Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["golfinho"] = {
		label = "Dolphin",
		weight = 1,
		stack = true,
		close = true,
	},

	["greek_yogurt_parfait"] = {
		label = "Greek Yogurt Parfait",
		weight = 1,
		stack = true,
		close = true,
	},

	["greenlight_phone"] = {
		label = "Green Light Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["green_gelato_cannabis"] = {
		label = "Green Gelato Cannabis",
		weight = 1,
		stack = true,
		close = true,
	},

	["green_phone"] = {
		label = "Green Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["grilled_nuggets"] = {
		label = "Grilled Nuggets",
		weight = 1,
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

	["gsr_cloth"] = {
		label = "GSR cloth",
		weight = 1,
		stack = true,
		close = true,
	},

	["gsr_test_kit"] = {
		label = "GSR test kit",
		weight = 1,
		stack = true,
		close = true,
	},

	["hacking_computer"] = {
		label = "Hacking computer",
		weight = 1,
		stack = true,
		close = true,
	},

	["half_oysters"] = {
		label = "Half Oysters",
		weight = 1,
		stack = true,
		close = true,
	},

	["handcuff_key"] = {
		label = "Handcuff Key",
		weight = 1,
		stack = true,
		close = true,
	},

	["hash_browns"] = {
		label = "Hash Browns",
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

	["hot_fudge_sundae"] = {
		label = "Hot Fudge Sundae",
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

	["icedream_cone"] = {
		label = "Icedream Cone",
		weight = 1,
		stack = true,
		close = true,
	},

	["icedream_cup"] = {
		label = "Icedream Cup",
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

	["kale_crunch_side"] = {
		label = "Kale Crunch Side",
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

	["kq_wild_cannabis"] = {
		label = "Wild cannabis",
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

	["lawyerid"] = {
		label = "Lawyer ID",
		weight = 1,
		stack = true,
		close = true,
	},

	["lcaluminum"] = {
		label = "Aluminum Pans",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcapple"] = {
		label = "Fresh Apple",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcapplejuice"] = {
		label = "Apple Juice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcapplesauce"] = {
		label = "Apple Sauce",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbanana"] = {
		label = "Ripe Banana",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbbqsauce"] = {
		label = "Barbecue Sauce",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbeefpatty"] = {
		label = "Raw Beef Patty",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbeefstrips"] = {
		label = "Raw Beef Strip",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcberrycream"] = {
		label = "Strawberry Icecream",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcberrysmoothie"] = {
		label = "Berry Smoothie",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbffriedrice"] = {
		label = "Beef Fried Rice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcblkberry_shine"] = {
		label = "Blackberry Moonshine",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbpudding"] = {
		label = "Banana Pudding",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbread"] = {
		label = "Fresh Bread",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbstirfry"] = {
		label = "Beef Stir Fry",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcburgerbun"] = {
		label = "Burger Bun",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbutter"] = {
		label = "Stick of Butter",
		weight = 5,
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

	["lccappucino"] = {
		label = "Cappucino Expresso",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccheese"] = {
		label = "Cheddar Cheese",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccheeseburger"] = {
		label = "Cheese Burger",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccheesesticks"] = {
		label = "Cheese Sticks",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccheestkpk"] = {
		label = "Frozen Cheesesticks",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcchickensand"] = {
		label = "Chicken Sandwich",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcchoccream"] = {
		label = "Chocolate Icecream",
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

	["lcckfriedrice"] = {
		label = "Chicken Fried Rice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccocoapod"] = {
		label = "Cocoa Pod",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccoffeepod"] = {
		label = "Coffee Pod",
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

	["lccorncob"] = {
		label = "Ear of Corn",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccreamer"] = {
		label = "Coffee Cream",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccupcoffee"] = {
		label = "Cup of Coffee",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccuptea"] = {
		label = "Glass of Tea",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcdryrice"] = {
		label = "Bag of Rice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcflour"] = {
		label = "Bag of Flour",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcfrenchfries"] = {
		label = "Home Fries",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcfriedchicken"] = {
		label = "Fried Chicken",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcfriedfish"] = {
		label = "Fried Fish",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcfrozenpizza"] = {
		label = "Frozen Pizza",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcfrozewaff"] = {
		label = "Frozen Eggo Waffle",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcglassjar"] = {
		label = "Glass Jar",
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

	["lcgrapejuice"] = {
		label = "Grape Juice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcgrapes"] = {
		label = "Fresh Grapes",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcgreentea"] = {
		label = "Green Tea",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcgrillcorn"] = {
		label = "Grilled Corn",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcgrillveggies"] = {
		label = "Grilled Veggies",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcgteapod"] = {
		label = "Green Tea Pod",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcgumbo"] = {
		label = "Grill",
		weight = 5,
		stack = true,
		close = true,
	},

	["lchamslice"] = {
		label = "Slice of Ham",
		weight = 5,
		stack = true,
		close = true,
	},

	["lchamtoastie"] = {
		label = "Ham Toasti",
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

	["lchotcakes"] = {
		label = "Hot Cakes",
		weight = 5,
		stack = true,
		close = true,
	},

	["lchotcocoa"] = {
		label = "Hot Cocoa",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcicecubes"] = {
		label = "Cubed Ice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcicing"] = {
		label = "Poptart Icing",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcjelly"] = {
		label = "Grape Jelly Pack",
		weight = 5,
		stack = true,
		close = true,
	},

	["lclambchops"] = {
		label = "Fried Chops",
		weight = 5,
		stack = true,
		close = true,
	},

	["lclegquarter"] = {
		label = "BBQ Chicken",
		weight = 5,
		stack = true,
		close = true,
	},

	["lclemon"] = {
		label = "Fresh Lemon",
		weight = 5,
		stack = true,
		close = true,
	},

	["lclemonlobster"] = {
		label = "Lemony Lobster Tails",
		weight = 5,
		stack = true,
		close = true,
	},

	["lclobstertails"] = {
		label = "Frozen Lobster Tails",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmaccheese"] = {
		label = "Frozen Mac N Cheese",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmaccheesy"] = {
		label = "Mac n Cheesy",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmarinara"] = {
		label = "Marinara Sauce",
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

	["lcmilk"] = {
		label = "Milk Carton",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmountain_java"] = {
		label = "Mountain Java Moonshine",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmshine_blkberry"] = {
		label = "Blackberry",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmshine_coffebean"] = {
		label = "Coffee Bean",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmshine_corn"] = {
		label = "Corn",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmshine_mash"] = {
		label = "Mash",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmshine_melon"] = {
		label = "Melon",
		weight = 5,
		stack = true,
		close = true,
	},

	["sardinhacozida"] = {
		label = "Cooked Sardines",
		weight = 1,
		stack = true,
		close = true,
	},

	["sausage_biscuit"] = {
		label = "Sausage Biscuit",
		weight = 1,
		stack = true,
		close = true,
	},

	["sausage_burrito"] = {
		label = "Sausage Burrito",
		weight = 1,
		stack = true,
		close = true,
	},

	["lcmshine_strawberry"] = {
		label = "Strawberry",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmshine_sugar"] = {
		label = "Sugar",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmshine_yeast"] = {
		label = "Yeast",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcnanacream"] = {
		label = "Banana Split",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcnanasmoothie"] = {
		label = "Banana Smoothie",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcorange"] = {
		label = "Fresh Orange",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcorangejuice"] = {
		label = "Orange Juice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcoxtails"] = {
		label = "Oxtails n Rice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcpancakes"] = {
		label = "Frozen Pancakes",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcpbutter"] = {
		label = "Peanut Butter",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcpoptart"] = {
		label = "Iced Poptart",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcpotato"] = {
		label = "Fresh Potatos",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcptartpk"] = {
		label = "Poptart Pack",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcpudding"] = {
		label = "Vanilla Pudding",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcquickpizza"] = {
		label = "Pepperoni Pizza",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcramennoodle"] = {
		label = "Ramen Noodles",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcramenpack"] = {
		label = "Ramen Pack",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawbeef"] = {
		label = "Raw Steak Beef",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawbreast"] = {
		label = "Raw Chicken Breast\"",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawchicken"] = {
		label = "Raw Leg Quarter",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawchops"] = {
		label = "Raw Lamb Chops",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawfish"] = {
		label = "Raw Fish",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawoxtail"] = {
		label = "Raw Ox Tails",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawribs"] = {
		label = "Raw Pork Ribs",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawsalmon"] = {
		label = "Raw Salmon",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcribs"] = {
		label = "BBQ Ribs",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcricebowl"] = {
		label = "Rice Bowl",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcsalmon"] = {
		label = "Seered Salmon",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcsausage"] = {
		label = "Sausage Pack",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcsausagedog"] = {
		label = "Sausage Dog",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcseasoning"] = {
		label = "Seasonings",
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

	["lcsour_watermelon"] = {
		label = "Sour Watermelon Moonshine",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcsteak"] = {
		label = "Grilled Steak",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcsteelcan"] = {
		label = "Steel Can",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcstrawberry"] = {
		label = "Fresh Strawberry",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcstrawberry_shine"] = {
		label = "Strawberry Moonshine",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcstyrofoam"] = {
		label = "Styrofoam",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcsugar"] = {
		label = "Sugar",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcsyrup"] = {
		label = "Pancake Syrup",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcteabag"] = {
		label = "Tea Bag",
		weight = 5,
		stack = true,
		close = true,
	},

	["lctoast"] = {
		label = "Toasted PB n J",
		weight = 5,
		stack = true,
		close = true,
	},

	["lctoasti"] = {
		label = "Cheese Toasti",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcvaniwafers"] = {
		label = "Vanilla Wafers",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcveggiepack"] = {
		label = "Fresh Veggies",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcvegoil"] = {
		label = "Vegetable Oil",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcwaffle"] = {
		label = "Insta Waffle",
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

	["lcwhite_lighting"] = {
		label = "White Lightnin Moonshine",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_ammobench"] = {
		label = "Ammo Bench",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_attabench"] = {
		label = "Attachments Bench",
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

	["lc_chair"] = {
		label = "Chill Chair",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_coffee"] = {
		label = "Coffee Maker",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_fryer"] = {
		label = "Copper Pot",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_gazebo"] = {
		label = "Gazebo",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_griddle"] = {
		label = "Griddle",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_grill"] = {
		label = "Grill",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_hobo"] = {
		label = "Hobo Stove",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_juicer"] = {
		label = "Juicer",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_microwave"] = {
		label = "Microwave",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_processor"] = {
		label = "Food Processor",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_still"] = {
		label = "Moonshine Still",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_table"] = {
		label = "Prep Table",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_toaster"] = {
		label = "Toaster",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_weapbench"] = {
		label = "Weapon Bench",
		weight = 5,
		stack = true,
		close = true,
	},

	["tacomeet"] = {
		label = "Taco Meet",
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

	["levonorgestrel"] = {
		label = "Levonorgestrel",
		weight = 100,
		stack = true,
		close = true,
	},

	["linguado"] = {
		label = "Sole",
		weight = 1,
		stack = true,
		close = true,
	},

	["liquid_sulfur"] = {
		label = "Liquid Sulfur",
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

	["testosterone"] = {
		label = "Testosterone",
		weight = 1,
		stack = true,
		close = true,
	},

	["testpack"] = {
		label = "Test Pack",
		weight = 100,
		stack = true,
		close = true,
	},

	["loperamide"] = {
		label = "Loperamide",
		weight = 1,
		stack = true,
		close = true,
	},

	["thermal_charge"] = {
		label = "Thermal charge",
		weight = 1,
		stack = true,
		close = true,
	},

	["mac_cheese"] = {
		label = "Mac & Cheese",
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

	["tropical_chick"] = {
		label = "Tropical Chick",
		weight = 1,
		stack = true,
		close = true,
	},

	["market_salad"] = {
		label = "Market Salad",
		weight = 1,
		stack = true,
		close = true,
	},

	["tropical_mango_slushie"] = {
		label = "Tropical Mango Slushie",
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

	["mashed_potatoes"] = {
		label = "Regular Mashed Potatoes with Cajun Gravy",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_cappuccino"] = {
		label = "Cappuccino",
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

	["mc_combo_chicken"] = {
		label = "Combo Chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_diet_coke"] = {
		label = "Diet Coke",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_dr_pepper"] = {
		label = "Dr Pepper",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_fanta_orange"] = {
		label = "Fanta Orange",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_flurry_candies"] = {
		label = "McFlurry Candies",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_flurry_cookies"] = {
		label = "McFlurry Cookies",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_fruit_punch"] = {
		label = "Fruit Punch",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_hot_chocolate"] = {
		label = "Hot Chocolate",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_iced_coffee"] = {
		label = "Iced Coffee",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_iced_tea"] = {
		label = "Iced Tea",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_nuggets_happy_meal"] = {
		label = "McNuggets Happy Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_sprite"] = {
		label = "Sprite",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_strawberry_shake"] = {
		label = "Strawberry Shake",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_vanilla_shake"] = {
		label = "Vanilla Shake",
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

	["viagra"] = {
		label = "Viagra",
		weight = 100,
		stack = true,
		close = true,
	},

	["meat_zza"] = {
		label = "Meat ZZa",
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

	["waffle_potato_chips"] = {
		label = "Waffle Potato Chips",
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

	["medium_coca_cola"] = {
		label = "Medium Coca-Cola",
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

	["memphis_bbq_chicken"] = {
		label = "Memphis BBQ Chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["world_famous_fries"] = {
		label = "World Famous Fries",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_purplehaze"] = {
		label = "Weed Purple Haze",
		weight = 10,
		stack = true,
		close = true,
	},

	["weed_skunk"] = {
		label = "Weed skunk",
		weight = 10,
		stack = true,
		close = true,
	},

	["mifepristone"] = {
		label = "Mifepristone",
		weight = 100,
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

	["miner_pcb"] = {
		label = "Miner PCB",
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

	["wet_greenlight_phone"] = {
		label = "Wet Green Light Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["wet_green_phone"] = {
		label = "Wet Green Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["wet_phone"] = {
		label = "Wet Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["wet_pink_phone"] = {
		label = "Wet Pink Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["wet_red_phone"] = {
		label = "Wet Red Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["wet_white_phone"] = {
		label = "Wet White Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["whitecheck"] = {
		label = "whitecheck",
		weight = 10,
		stack = true,
		close = true,
	},

	["muriatic_acid"] = {
		label = "Muriatic Acid",
		weight = 1,
		stack = true,
		close = true,
	},

	["wet_classic_phone"] = {
		label = "Wet Classic Phone",
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

	["nitrogen"] = {
		label = "Nitrogen",
		weight = 1,
		stack = true,
		close = true,
	},

	["notepad"] = {
		label = "Notepad",
		weight = 1,
		stack = true,
		close = true,
	},

	["white_phone"] = {
		label = "White Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["nuggets_kids_meal"] = {
		label = "6Pc Nuggets Kids Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["wet_gold_phone"] = {
		label = "Wet Gold Phone",
		weight = 10,
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

	["wisconsin_cheese"] = {
		label = "Wisconsin 6 Cheese",
		weight = 1,
		stack = true,
		close = true,
	},

	["wet_blue_phone"] = {
		label = "Wet Blue Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["wet_black_phone"] = {
		label = "Wet Black Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["orange_juice"] = {
		label = "Orange Juice",
		weight = 1,
		stack = true,
		close = true,
	},

	["water_jug"] = {
		label = "Water Jug",
		weight = 5,
		stack = true,
		close = true,
	},

	["waffle_potato_fries"] = {
		label = "Waffle Potato Fries",
		weight = 1,
		stack = true,
		close = true,
	},

	["volcano_burrito"] = {
		label = "Volcano Burrito",
		weight = 1,
		stack = true,
		close = true,
	},

	["vehicle_transfer_contract"] = {
		label = "Vehicle transfer contract",
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

	["vehicle_alarm_4"] = {
		label = "Vehicle alarm level 4",
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

	["packagedchicken"] = {
		label = "Packaged Chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["vehicle_alarm_3"] = {
		label = "Vehicle alarm level 3",
		weight = 1,
		stack = true,
		close = true,
	},

	["vehicle_alarm_2"] = {
		label = "Vehicle alarm level 2",
		weight = 1,
		stack = true,
		close = true,
	},

	["vehicle_alarm_1"] = {
		label = "Vehicle alarm level 1",
		weight = 1,
		stack = true,
		close = true,
	},

	["vanilla_milkshake"] = {
		label = "Vanilla Milkshake",
		weight = 1,
		stack = true,
		close = true,
	},

	["painting"] = {
		label = "Painting",
		weight = 1,
		stack = true,
		close = true,
	},

	["uv_light"] = {
		label = "UV Flashlight",
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

	["t_tango_orange"] = {
		label = "Tango Orange",
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

	["t_tango_apple"] = {
		label = "Tango Apple",
		weight = 1,
		stack = true,
		close = true,
	},

	["t_seven_up"] = {
		label = "Seven Up",
		weight = 1,
		stack = true,
		close = true,
	},

	["peach_milkshake"] = {
		label = "Peach Milkshake",
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

	["t_diet_pepsi"] = {
		label = "Diet Pepsi",
		weight = 1,
		stack = true,
		close = true,
	},

	["peixegato"] = {
		label = "Catfish",
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

	["peptobismol"] = {
		label = "Pepto-Bismol",
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

	["tenders_family_meal"] = {
		label = "16Pc Tenders Family Meal Mild",
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

	["taco_regular"] = {
		label = "Taco Regular",
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

	["philly_cheese_steak"] = {
		label = "Philly Cheese Steak",
		weight = 1,
		stack = true,
		close = true,
	},

	["sweet_tea"] = {
		label = "Sweet Tea",
		weight = 1,
		stack = true,
		close = true,
	},

	["phone_hack"] = {
		label = "Phone Hack",
		weight = 10,
		stack = true,
		close = true,
	},

	["phone_module"] = {
		label = "Phone Module",
		weight = 10,
		stack = true,
		close = true,
	},

	["pickaxe"] = {
		label = "Pickaxe",
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

	["pink_phone"] = {
		label = "Pink Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["strawberry_watermelon_slushie"] = {
		label = "Strawberry Watermelon Slushie",
		weight = 1,
		stack = true,
		close = true,
	},

	["strawberry_milkshake"] = {
		label = "Strawberry Milkshake",
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

	["strawberry_cheesecake_pie"] = {
		label = "Strawberry Cheesecake Fried Pie",
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

	["stolencard"] = {
		label = "Stolencard",
		weight = 10,
		stack = true,
		close = true,
	},

	["starfish"] = {
		label = "Starfish",
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

	["spinach_feta"] = {
		label = "Spinach & Feta",
		weight = 1,
		stack = true,
		close = true,
	},

	["spicy_southwest_salad"] = {
		label = "Spicy Southwest Salad",
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

	["spicy_crispy_chicken_sandwich"] = {
		label = "Spicy Crispy Chicken Sandwich",
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

	["spicy_chicken_sandwich_combo"] = {
		label = "Spicy Chicken Sandwich Combo",
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

	["powerbank"] = {
		label = "Power Bank",
		weight = 10,
		stack = true,
		close = true,
	},

	["pr-softdrink"] = {
		label = "Soft Drink",
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

	["printer"] = {
		label = "Printer",
		weight = 1,
		stack = true,
		close = true,
	},

	["protein"] = {
		label = "Protein",
		weight = 1,
		stack = true,
		close = true,
	},

	["pr_coca_cola"] = {
		label = "Coca Cola",
		weight = 1,
		stack = true,
		close = true,
	},

	["pr_diet_coke"] = {
		label = "Diet Coke",
		weight = 1,
		stack = true,
		close = true,
	},

	["pr_dr_pepper"] = {
		label = "Pepper",
		weight = 1,
		stack = true,
		close = true,
	},

	["pr_fanta_orange"] = {
		label = "Fanta",
		weight = 1,
		stack = true,
		close = true,
	},

	["pr_fruit_punch"] = {
		label = "Fruit Punch",
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

	["spicy_chicken_burrito"] = {
		label = "Spicy Chicken Burrito",
		weight = 1,
		stack = true,
		close = true,
	},

	["soft_taco_supreme"] = {
		label = "Soft Taco Supreme",
		weight = 1,
		stack = true,
		close = true,
	},

	["soft_taco"] = {
		label = "Soft Taco",
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

	["p_chicken_alfredo"] = {
		label = "Chicken Alfredo",
		weight = 1,
		stack = true,
		close = true,
	},

	["quarter_pounder"] = {
		label = "Quarter Pounder",
		weight = 1,
		stack = true,
		close = true,
	},

	["quarter_pounder_cheese"] = {
		label = "Quarter Pounder Cheese",
		weight = 1,
		stack = true,
		close = true,
	},

	["quesadilla"] = {
		label = "Quesadilla",
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

	["skimmer"] = {
		label = "Skimmer",
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

	["simply_orange"] = {
		label = "Simply Orange",
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

	["signature_chicken_box"] = {
		label = "10Pc Mild Signature Chicken Box",
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

	["red_beans_rice"] = {
		label = "Regular Red Beans & Rice",
		weight = 1,
		stack = true,
		close = true,
	},

	["red_phone"] = {
		label = "Red Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["side_salad"] = {
		label = "Side Salad",
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

	["robalo"] = {
		label = "Sea Bass",
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

	["shell_2"] = {
		label = "Shell",
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

	["sea_snail"] = {
		label = "Sea Snail",
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

	["scratch_ticket"] = {
		label = "Scratching Ticket",
		weight = 2,
		stack = true,
		close = true,
	},

	["sardinha"] = {
		label = "Sardine",
		weight = 1,
		stack = true,
		close = true,
	},

	["sausage_egg_cheese"] = {
		label = "Sausage, Egg & Cheese Biscuit",
		weight = 1,
		stack = true,
		close = true,
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
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
		weight = 220,
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
		weight = 350,
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
		weight = 8000,
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
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
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
		weight = 500,
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
		weight = 500,
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
		weight = 1000,
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

	['breads_11'] = {
		label = 'Breads 11',
		weight = 80,
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

	["acyclovir"] = {
		label = "Acyclovir",
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

	["anchor"] = {
		label = "Anchor",
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

	["antminers9"] = {
		label = "AntminerS9",
		weight = 1,
		stack = true,
		close = true,
	},

	["appistol"] = {
		label = "AP Pistol Model",
		weight = 10,
		stack = true,
		close = true,
	},

	["appistol_frame"] = {
		label = "AP Pistol Frame",
		weight = 10,
		stack = true,
		close = true,
	},

	["applesauce"] = {
		label = "Applesauce",
		weight = 1,
		stack = true,
		close = true,
	},

	["apple_gelato"] = {
		label = "Apple Gelato",
		weight = 1,
		stack = true,
		close = true,
	},

	["apple_gelato_joint"] = {
		label = "Apple Gelato Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["apple_juice"] = {
		label = "Honest Kids Apple Juice",
		weight = 1,
		stack = true,
		close = true,
	},

	["apple_sauce"] = {
		label = "Apple Sauce",
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

	["asic_miner_hashing_board"] = {
		label = "Hashing Board",
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

	["assaultrifle"] = {
		label = "Assault Rifle Model",
		weight = 10,
		stack = true,
		close = true,
	},

	["assaultrifle_frame"] = {
		label = "Assault Rifle Frame",
		weight = 10,
		stack = true,
		close = true,
	},

	["atum"] = {
		label = "Tuna fish",
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

	["baby_lobster"] = {
		label = "Baby Lobster",
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

	["backwoods_grape"] = {
		label = "Backwoods Grape",
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

	["backwoods_russian_cream"] = {
		label = "Backwoods Russian Cream",
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

	["baleia"] = {
		label = "Whale",
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

	["bankcard"] = {
		label = "Bankcard",
		weight = 4,
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

	["beach_shovel"] = {
		label = "Beach Shovel",
		weight = 1,
		stack = true,
		close = true,
	},

	["beefy_nacho"] = {
		label = "Beefy Nacho",
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

	["big_fish"] = {
		label = "Big Fish",
		weight = 1,
		stack = true,
		close = true,
	},

	["big_mac"] = {
		label = "Big Mac",
		weight = 1,
		stack = true,
		close = true,
	},

	["big_mac_combo"] = {
		label = "Big Mac Combo",
		weight = 1,
		stack = true,
		close = true,
	},

	["biscotti"] = {
		label = "Biscotti",
		weight = 1,
		stack = true,
		close = true,
	},

	["biscotti_joint"] = {
		label = "Biscotti Joint",
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

	["bites_group_pack"] = {
		label = "THIGH BITES GROUP PACK",
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

	["blacktar"] = {
		label = "Black Tar Heroin",
		weight = 1,
		stack = true,
		close = true,
	},

	["black_bag"] = {
		label = "Black Bag",
		weight = 1,
		stack = true,
		close = true,
	},

	["black_glass"] = {
		label = "Black Glass",
		weight = 1,
		stack = true,
		close = true,
	},

	["black_hat"] = {
		label = "Black Hat",
		weight = 1,
		stack = true,
		close = true,
	},

	["black_jeans"] = {
		label = "Black Jeans",
		weight = 1,
		stack = true,
		close = true,
	},

	["black_phone"] = {
		label = "Black Phone",
		weight = 10,
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

	["blueberry_cruffin"] = {
		label = "Blueberry Cruffin",
		weight = 1,
		stack = true,
		close = true,
	},

	["blueberry_cruffin_joint"] = {
		label = "Blueberry Cruffin Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["blueberry_jam_cookie"] = {
		label = "Blueberry Jam Cookie",
		weight = 1,
		stack = true,
		close = true,
	},

	["blue_phone"] = {
		label = "Blue Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["blue_stone"] = {
		label = "Blue Stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["blue_tomyz"] = {
		label = "Blue Tomyz",
		weight = 1,
		stack = true,
		close = true,
	},

	["blue_tomyz_joint"] = {
		label = "Blue Tomyz Joint",
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

	["boneless_wings"] = {
		label = "BONELESS WINGS",
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

	["bottle_diet_coke"] = {
		label = "20oz Bottle Diet Coke",
		weight = 1,
		stack = true,
		close = true,
	},

	["brass"] = {
		label = "Brass",
		weight = 10,
		stack = true,
		close = true,
	},

	["bread"] = {
		label = "Bread",
		weight = 1,
		stack = true,
		close = true,
	},

	["brewed_iced_tea"] = {
		label = "Brewed Iced Tea",
		weight = 1,
		stack = true,
		close = true,
	},

	["brown_scramble_bowl"] = {
		label = "Brown Scramble Bowl",
		weight = 1,
		stack = true,
		close = true,
	},

	["brown_scramble_burrito"] = {
		label = "Brown Scramble Burrito",
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

	["bs_chicken_jr"] = {
		label = "Chicken Jr.",
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

	["bs_diet_coke"] = {
		label = "Medium Diet Coke",
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

	["bs_orange_juice"] = {
		label = "Simply Orange Juice",
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

	["bs_sprite_zero"] = {
		label = "Medium Sprite Zero",
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

	["buttered_biscuit"] = {
		label = "Buttered Biscuit",
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

	["butter_cookie"] = {
		label = "Butter Cookie",
		weight = 1,
		stack = true,
		close = true,
	},

	["caesar_side_salad"] = {
		label = "Caesar Side Salad",
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

	["cake_mix"] = {
		label = "Cake Mix",
		weight = 1,
		stack = true,
		close = true,
	},

	["cake_mix_joint"] = {
		label = "Cake Mix Joint",
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

	["cam_hacking"] = {
		label = "Camera Hack",
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

	["cannabis"] = {
		label = "Cannabis",
		weight = 1,
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

	["catfish"] = {
		label = "Catfish",
		weight = 1,
		stack = true,
		close = true,
	},

	["cereal_milk"] = {
		label = "Cereal Milk",
		weight = 1,
		stack = true,
		close = true,
	},

	["cereal_milk_joint"] = {
		label = "Cereal Milk Joint",
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

	["chalupa_supreme"] = {
		label = "Chalupa Supreme",
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

	["cheeseburger_combo_meal"] = {
		label = "Cheeseburger Combo Meal",
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

	["cheese_quesadilla"] = {
		label = "Cheese Quesadilla",
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

	["cheesy_black_bean"] = {
		label = "Cheesy Black Bean",
		weight = 1,
		stack = true,
		close = true,
	},

	["cheesy_gordita_crunch"] = {
		label = "Cheesy Gordita Crunch",
		weight = 1,
		stack = true,
		close = true,
	},

	["cheesy_tots"] = {
		label = "Cheesy Tots",
		weight = 1,
		stack = true,
		close = true,
	},

	["cheetah_piss"] = {
		label = "Cheetah Piss",
		weight = 1,
		stack = true,
		close = true,
	},

	["cheetah_piss_joint"] = {
		label = "Cheetah Piss Joint",
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

	["chicken_biscuit"] = {
		label = "Chicken Biscuit",
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

	["chicken_burrito"] = {
		label = "Chicken Burrito",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_caesar_salad"] = {
		label = "Chicken Caesar Salad",
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

	["chicken_club_sandwich"] = {
		label = "Chicken Club Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_egg_cheese"] = {
		label = "Chicken, Egg & Cheese Biscuit",
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

	["chicken_fries"] = {
		label = "9 pc Chicken Fries",
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

	["chicken_mcnuggets"] = {
		label = "Chicken McNuggets",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_noodle_soup"] = {
		label = "Chicken Noodle Soup",
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

	["chicken_parm"] = {
		label = "Chicken Parm",
		weight = 1,
		stack = true,
		close = true,
	},

	["chicken_sandwich"] = {
		label = "Chicken Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["chick_fil_a_lemonade"] = {
		label = "Chick-fil-A Lemonade",
		weight = 1,
		stack = true,
		close = true,
	},

	["chick_fil_a_nuggets"] = {
		label = "Chick-fil-A Nuggets",
		weight = 1,
		stack = true,
		close = true,
	},

	["chick_n_minis"] = {
		label = "Chick-n-Minis",
		weight = 1,
		stack = true,
		close = true,
	},

	["chick_n_strips"] = {
		label = "Chick-n-Strips",
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

	["chocolate_chunk_cookie"] = {
		label = "Chocolate Chunk Cookie",
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

	["chocolate_fudge_brownie"] = {
		label = "Chocolate Fudge Brownie",
		weight = 1,
		stack = true,
		close = true,
	},

	["chocolate_milk"] = {
		label = "Chocolate Milk",
		weight = 1,
		stack = true,
		close = true,
	},

	["chocolate_milkshake"] = {
		label = "Chocolate Milkshake",
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

	["churros_dip"] = {
		label = "Churros Dip",
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

	["cinnamon_twists"] = {
		label = "Cinnamon Twists",
		weight = 1,
		stack = true,
		close = true,
	},

	["classic_caesar_salad"] = {
		label = "Classic Caesar Salad",
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

	["classic_phone"] = {
		label = "Classic Phone",
		weight = 10,
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

	["cobb_salad"] = {
		label = "Cobb Salad",
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

	["coca_leaf"] = {
		label = "Coca Leaf",
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

	["coffee"] = {
		label = "Coffee",
		weight = 1,
		stack = true,
		close = true,
	},

	["cokebaggy"] = {
		label = "Coke baggy",
		weight = 10,
		stack = true,
		close = true,
	},

	["cokebrick"] = {
		label = "Coke Brick",
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

	["coke_rail"] = {
		label = "Coke Rail",
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

	["cold_brew"] = {
		label = "COLD BREW",
		weight = 1,
		stack = true,
		close = true,
	},

	["collins_ave"] = {
		label = "Collins AVE",
		weight = 1,
		stack = true,
		close = true,
	},

	["collins_ave_joint"] = {
		label = "Collins AVE Joint",
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

	["condom"] = {
		label = "Condom",
		weight = 100,
		stack = true,
		close = true,
	},

	["cookies_cream_milkshake"] = {
		label = "Cookies & Cream Milkshake",
		weight = 1,
		stack = true,
		close = true,
	},

	["cookie_craze"] = {
		label = "Cookie Craze",
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

	["cool_wrap"] = {
		label = "Cool Wrap",
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

	["covgari_gold"] = {
		label = "Covgari Gold",
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

	["crablegs_meal"] = {
		label = "Crablegs Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["crab_cake"] = {
		label = "Crab Cake",
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

	["crab_legs_meal"] = {
		label = "Crab Legs Meal",
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

	["creatine"] = {
		label = "Creatine",
		weight = 1,
		stack = true,
		close = true,
	},

	["crispy_chicken_sandwich"] = {
		label = "Crispy Chicken Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["crispy_chicken_staco"] = {
		label = "Crispy Chicken Soft Taco",
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

	["crunchwrap_supreme"] = {
		label = "Crunchwrap Supreme",
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

	["crunchytaco"] = {
		label = "Crunchy Taco",
		weight = 1,
		stack = true,
		close = true,
	},

	["crunchy_taco_supreme"] = {
		label = "Crunchy Taco Supreme",
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

	["dab"] = {
		label = "DAB",
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

	["deluxe_crispy_sandwich_combo"] = {
		label = "Deluxe Crispy Sandwich Combo",
		weight = 1,
		stack = true,
		close = true,
	},

	["deluxe_sandwich"] = {
		label = "Deluxe Sandwich",
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

	["diamond"] = {
		label = "Diamond",
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

	["document"] = {
		label = "Document",
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

	["double_gourmet"] = {
		label = "Double Gourmet",
		weight = 1,
		stack = true,
		close = true,
	},

	["double_quarter_combo"] = {
		label = "Double Quarter Combo",
		weight = 1,
		stack = true,
		close = true,
	},

	["double_quarter_pounder"] = {
		label = "Double Quarter Pounder",
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

	["double_sausage_croissanwich"] = {
		label = "Double Sausage, Egg, & Cheese",
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

	["egg_cheese_biscuit"] = {
		label = "Egg Cheese Biscuit",
		weight = 1,
		stack = true,
		close = true,
	},

	["egg_cheese_muffin"] = {
		label = "Egg & Cheese Muffin",
		weight = 1,
		stack = true,
		close = true,
	},

	["egg_mcmuffin"] = {
		label = "Egg McMuffin",
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

	["egg_white_grill"] = {
		label = "Egg White Grill",
		weight = 1,
		stack = true,
		close = true,
	},

	["emerald"] = {
		label = "Emerald",
		weight = 20,
		stack = true,
		close = true,
	},

	["emptydocuments"] = {
		label = "Blank Documents",
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

	["english_muffin"] = {
		label = "English Muffin",
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

	["essence"] = {
		label = "Gas",
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

	["ether_joint"] = {
		label = "Ether Joint",
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

	["fabric"] = {
		label = "Fabric",
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

	["fine_china"] = {
		label = "Fine China",
		weight = 1,
		stack = true,
		close = true,
	},

	["fine_china_joint"] = {
		label = "Fine China Joint",
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

	["fishingkey"] = {
		label = "Corroded Key",
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

	["fishtaco"] = {
		label = "Fish Taco",
		weight = 1,
		stack = true,
		close = true,
	},

	["fish_tilapia"] = {
		label = "Fish Tilapia",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixkit"] = {
		label = "Fix kit",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixtool"] = {
		label = "Repair Tools",
		weight = 2,
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

	["fogueira"] = {
		label = "Campfire",
		weight = 1,
		stack = true,
		close = true,
	},

	["forgedcheck"] = {
		label = "Forged Check",
		weight = 10,
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

	["fried_mushrooms"] = {
		label = "Fried Mushrooms",
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

	["fries_grande"] = {
		label = "Fries Grande",
		weight = 1,
		stack = true,
		close = true,
	},

	["frosted_coffee"] = {
		label = "Frosted Coffee",
		weight = 1,
		stack = true,
		close = true,
	},

	["frosted_lemonade"] = {
		label = "Frosted Lemonade",
		weight = 1,
		stack = true,
		close = true,
	},

	["froties"] = {
		label = "Froties",
		weight = 1,
		stack = true,
		close = true,
	},

	["froties_joint"] = {
		label = "Froties Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["fruit_cup"] = {
		label = "Fruit Cup",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_blankcard"] = {
		label = "Blank Card",
		weight = 10,
		stack = true,
		close = true,
	},

	["fs_bonnet"] = {
		label = "Scrap Bonnet",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_boot"] = {
		label = "Scrap Boot",
		weight = 10,
		stack = true,
		close = true,
	},

	["fs_clonnedcard"] = {
		label = "Cloned Card",
		weight = 10,
		stack = true,
		close = true,
	},

	["fs_door"] = {
		label = "Scap Door",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_forgedcheque"] = {
		label = "Forged Check",
		weight = 10,
		stack = true,
		close = true,
	},

	["fs_generator"] = {
		label = "Generator",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_laptop"] = {
		label = "Laptop",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_printer"] = {
		label = "Printer",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_skimmer"] = {
		label = "Skimmer",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_stolencard"] = {
		label = "Stolencard",
		weight = 10,
		stack = true,
		close = true,
	},

	["fs_usb"] = {
		label = "Info Usb",
		weight = 10,
		stack = true,
		close = true,
	},

	["fs_whiteslip"] = {
		label = "White Slip",
		weight = 10,
		stack = true,
		close = true,
	},

	["garlic_parm_wings"] = {
		label = "Garlic Parm Wings",
		weight = 1,
		stack = true,
		close = true,
	},

	["gary_payton"] = {
		label = "Gary Payton",
		weight = 1,
		stack = true,
		close = true,
	},

	["gary_payton_joint"] = {
		label = "Gary Payton Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Gas Bottle",
		weight = 2,
		stack = true,
		close = true,
	},

	["gelatti"] = {
		label = "Gelatti",
		weight = 1,
		stack = true,
		close = true,
	},

	["gelatti_joint"] = {
		label = "Gelatti Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["generator"] = {
		label = "Generator",
		weight = 1,
		stack = true,
		close = true,
	},

	["georgia_pie"] = {
		label = "Georgia Pie",
		weight = 1,
		stack = true,
		close = true,
	},

	["georgia_pie_joint"] = {
		label = "Georgia Pie Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["get_figgy"] = {
		label = "Get Figgy",
		weight = 1,
		stack = true,
		close = true,
	},

	["glazed_almon"] = {
		label = "Glazed Almon",
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

	["gmo_cookies"] = {
		label = "GMO Cookies",
		weight = 1,
		stack = true,
		close = true,
	},

	["gmo_cookies_joint"] = {
		label = "GMO Cookies Joint",
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

	["gold_phone"] = {
		label = "Gold Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["golfinho"] = {
		label = "Dolphin",
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

	["greek_yogurt_parfait"] = {
		label = "Greek Yogurt Parfait",
		weight = 1,
		stack = true,
		close = true,
	},

	["greenlight_phone"] = {
		label = "Green Light Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["green_gelato_cannabis"] = {
		label = "Green Gelato Cannabis",
		weight = 1,
		stack = true,
		close = true,
	},

	["green_phone"] = {
		label = "Green Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["green_stone"] = {
		label = "Green Stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["grilled_nuggets"] = {
		label = "Grilled Nuggets",
		weight = 1,
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

	["group_pack"] = {
		label = "WINGS & THIGH BITES GROUP PACK",
		weight = 1,
		stack = true,
		close = true,
	},

	["gsr_cloth"] = {
		label = "GSR cloth",
		weight = 1,
		stack = true,
		close = true,
	},

	["gsr_test_kit"] = {
		label = "GSR test kit",
		weight = 1,
		stack = true,
		close = true,
	},

	["gunpowder"] = {
		label = "Gunpowder",
		weight = 10,
		stack = true,
		close = true,
	},

	["half_oysters"] = {
		label = "Half Oysters",
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

	["handcuff_key"] = {
		label = "Handcuff Key",
		weight = 1,
		stack = true,
		close = true,
	},

	["hash_browns"] = {
		label = "Hash Browns",
		weight = 1,
		stack = true,
		close = true,
	},

	["heavypistol"] = {
		label = "Heavy Pistol Model",
		weight = 10,
		stack = true,
		close = true,
	},

	["heavypistol_frame"] = {
		label = "Heavy Pistol Frame",
		weight = 10,
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

	["hot_fudge_sundae"] = {
		label = "Hot Fudge Sundae",
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

	["icedream_cone"] = {
		label = "Icedream Cone",
		weight = 1,
		stack = true,
		close = true,
	},

	["icedream_cup"] = {
		label = "Icedream Cup",
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

	["ice_cream_cake_pack"] = {
		label = "Ice Cream Cake Pack",
		weight = 1,
		stack = true,
		close = true,
	},

	["ice_cream_cake_pack_joint"] = {
		label = "Ice Cream Cake Pack Joint",
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

	["jalapeno_cheddar_bites"] = {
		label = "Jalapeno Cheddar Bites",
		weight = 1,
		stack = true,
		close = true,
	},

	["jefe"] = {
		label = "Jefe",
		weight = 1,
		stack = true,
		close = true,
	},

	["jefe_joint"] = {
		label = "Jefe Joint",
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

	["jolly_candy"] = {
		label = "Jolly Candy",
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

	["kale_crunch_side"] = {
		label = "Kale Crunch Side",
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

	["key_lime_cookie"] = {
		label = "Key Lime Cookie",
		weight = 1,
		stack = true,
		close = true,
	},

	["khalifa_kush"] = {
		label = "Khalifa Kush",
		weight = 1,
		stack = true,
		close = true,
	},

	["khalifa_kush_joint"] = {
		label = "Khalifa Kush Joint",
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

	["kq_wild_cannabis"] = {
		label = "Wild cannabis",
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

	["large_thigh_bites"] = {
		label = "LARGE THIGH BITES",
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

	["la_confidential"] = {
		label = "LA Confidential",
		weight = 1,
		stack = true,
		close = true,
	},

	["la_confidential_joint"] = {
		label = "LA Confidential Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["lcaluminum"] = {
		label = "Aluminum Pans",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcapple"] = {
		label = "Fresh Apple",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcapplejuice"] = {
		label = "Apple Juice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcapplesauce"] = {
		label = "Apple Sauce",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbanana"] = {
		label = "Ripe Banana",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbbqsauce"] = {
		label = "Barbecue Sauce",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbeefpatty"] = {
		label = "Raw Beef Patty",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbeefstrips"] = {
		label = "Raw Beef Strip",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcberrycream"] = {
		label = "Strawberry Icecream",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcberrysmoothie"] = {
		label = "Berry Smoothie",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbffriedrice"] = {
		label = "Beef Fried Rice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcblkberry_shine"] = {
		label = "Blackberry Moonshine",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbpudding"] = {
		label = "Banana Pudding",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbread"] = {
		label = "Fresh Bread",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbstirfry"] = {
		label = "Beef Stir Fry",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcburgerbun"] = {
		label = "Burger Bun",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcbutter"] = {
		label = "Stick of Butter",
		weight = 5,
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

	["lccappucino"] = {
		label = "Cappucino Expresso",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccheese"] = {
		label = "Cheddar Cheese",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccheeseburger"] = {
		label = "Cheese Burger",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccheesesticks"] = {
		label = "Cheese Sticks",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccheestkpk"] = {
		label = "Frozen Cheesesticks",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcchickensand"] = {
		label = "Chicken Sandwich",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcchoccream"] = {
		label = "Chocolate Icecream",
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

	["lcckfriedrice"] = {
		label = "Chicken Fried Rice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccocoapod"] = {
		label = "Cocoa Pod",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccoffeepod"] = {
		label = "Coffee Pod",
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

	["lccorncob"] = {
		label = "Ear of Corn",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccreamer"] = {
		label = "Coffee Cream",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccupcoffee"] = {
		label = "Cup of Coffee",
		weight = 5,
		stack = true,
		close = true,
	},

	["lccuptea"] = {
		label = "Glass of Tea",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcdryrice"] = {
		label = "Bag of Rice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcflour"] = {
		label = "Bag of Flour",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcfrenchfries"] = {
		label = "Home Fries",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcfriedchicken"] = {
		label = "Fried Chicken",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcfriedfish"] = {
		label = "Fried Fish",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcfrozenpizza"] = {
		label = "Frozen Pizza",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcfrozewaff"] = {
		label = "Frozen Eggo Waffle",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcglassjar"] = {
		label = "Glass Jar",
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

	["lcgrapejuice"] = {
		label = "Grape Juice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcgrapes"] = {
		label = "Fresh Grapes",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcgreentea"] = {
		label = "Green Tea",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcgrillcorn"] = {
		label = "Grilled Corn",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcgrillveggies"] = {
		label = "Grilled Veggies",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcgteapod"] = {
		label = "Green Tea Pod",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcgumbo"] = {
		label = "Grill",
		weight = 5,
		stack = true,
		close = true,
	},

	["lchamslice"] = {
		label = "Slice of Ham",
		weight = 5,
		stack = true,
		close = true,
	},

	["lchamtoastie"] = {
		label = "Ham Toasti",
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

	["lchotcakes"] = {
		label = "Hot Cakes",
		weight = 5,
		stack = true,
		close = true,
	},

	["lchotcocoa"] = {
		label = "Hot Cocoa",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcicecubes"] = {
		label = "Cubed Ice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcicing"] = {
		label = "Poptart Icing",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcjelly"] = {
		label = "Grape Jelly Pack",
		weight = 5,
		stack = true,
		close = true,
	},

	["lclambchops"] = {
		label = "Fried Chops",
		weight = 5,
		stack = true,
		close = true,
	},

	["lclegquarter"] = {
		label = "BBQ Chicken",
		weight = 5,
		stack = true,
		close = true,
	},

	["lclemon"] = {
		label = "Fresh Lemon",
		weight = 5,
		stack = true,
		close = true,
	},

	["lclemonlobster"] = {
		label = "Lemony Lobster Tails",
		weight = 5,
		stack = true,
		close = true,
	},

	["lclobstertails"] = {
		label = "Frozen Lobster Tails",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmaccheese"] = {
		label = "Frozen Mac N Cheese",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmaccheesy"] = {
		label = "Mac n Cheesy",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmarinara"] = {
		label = "Marinara Sauce",
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

	["lcmilk"] = {
		label = "Milk Carton",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmountain_java"] = {
		label = "Mountain Java Moonshine",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmshine_blkberry"] = {
		label = "Blackberry",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmshine_coffebean"] = {
		label = "Coffee Bean",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmshine_corn"] = {
		label = "Corn",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmshine_mash"] = {
		label = "Mash",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmshine_melon"] = {
		label = "Melon",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmshine_strawberry"] = {
		label = "Strawberry",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmshine_sugar"] = {
		label = "Sugar",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcmshine_yeast"] = {
		label = "Yeast",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcnanacream"] = {
		label = "Banana Split",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcnanasmoothie"] = {
		label = "Banana Smoothie",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcorange"] = {
		label = "Fresh Orange",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcorangejuice"] = {
		label = "Orange Juice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcoxtails"] = {
		label = "Oxtails n Rice",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcpancakes"] = {
		label = "Frozen Pancakes",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcpbutter"] = {
		label = "Peanut Butter",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcpoptart"] = {
		label = "Iced Poptart",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcpotato"] = {
		label = "Fresh Potatos",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcptartpk"] = {
		label = "Poptart Pack",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcpudding"] = {
		label = "Vanilla Pudding",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcquickpizza"] = {
		label = "Pepperoni Pizza",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcramennoodle"] = {
		label = "Ramen Noodles",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcramenpack"] = {
		label = "Ramen Pack",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawbeef"] = {
		label = "Raw Steak Beef",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawbreast"] = {
		label = "Raw Chicken Breast\"",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawchicken"] = {
		label = "Raw Leg Quarter",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawchops"] = {
		label = "Raw Lamb Chops",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawfish"] = {
		label = "Raw Fish",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawoxtail"] = {
		label = "Raw Ox Tails",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawribs"] = {
		label = "Raw Pork Ribs",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcrawsalmon"] = {
		label = "Raw Salmon",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcribs"] = {
		label = "BBQ Ribs",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcricebowl"] = {
		label = "Rice Bowl",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcsalmon"] = {
		label = "Seered Salmon",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcsausage"] = {
		label = "Sausage Pack",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcsausagedog"] = {
		label = "Sausage Dog",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcseasoning"] = {
		label = "Seasonings",
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

	["lcsour_watermelon"] = {
		label = "Sour Watermelon Moonshine",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcsteak"] = {
		label = "Grilled Steak",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcsteelcan"] = {
		label = "Steel Can",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcstrawberry"] = {
		label = "Fresh Strawberry",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcstrawberry_shine"] = {
		label = "Strawberry Moonshine",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcstyrofoam"] = {
		label = "Styrofoam",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcsugar"] = {
		label = "Sugar",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcsyrup"] = {
		label = "Pancake Syrup",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcteabag"] = {
		label = "Tea Bag",
		weight = 5,
		stack = true,
		close = true,
	},

	["lctoast"] = {
		label = "Toasted PB n J",
		weight = 5,
		stack = true,
		close = true,
	},

	["lctoasti"] = {
		label = "Cheese Toasti",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcvaniwafers"] = {
		label = "Vanilla Wafers",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcveggiepack"] = {
		label = "Fresh Veggies",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcvegoil"] = {
		label = "Vegetable Oil",
		weight = 5,
		stack = true,
		close = true,
	},

	["lcwaffle"] = {
		label = "Insta Waffle",
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

	["lcwhite_lighting"] = {
		label = "White Lightnin Moonshine",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_ammobench"] = {
		label = "Ammo Bench",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_attabench"] = {
		label = "Attachments Bench",
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

	["lc_chair"] = {
		label = "Chill Chair",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_coffee"] = {
		label = "Coffee Maker",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_fryer"] = {
		label = "Copper Pot",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_gazebo"] = {
		label = "Gazebo",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_griddle"] = {
		label = "Griddle",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_grill"] = {
		label = "Grill",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_hobo"] = {
		label = "Hobo Stove",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_juicer"] = {
		label = "Juicer",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_microwave"] = {
		label = "Microwave",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_processor"] = {
		label = "Food Processor",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_still"] = {
		label = "Moonshine Still",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_table"] = {
		label = "Prep Table",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_toaster"] = {
		label = "Toaster",
		weight = 5,
		stack = true,
		close = true,
	},

	["lc_weapbench"] = {
		label = "Weapon Bench",
		weight = 5,
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

	["levonorgestrel"] = {
		label = "Levonorgestrel",
		weight = 100,
		stack = true,
		close = true,
	},

	["lighter"] = {
		label = "Lighter",
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

	["liquid_sulfur"] = {
		label = "Liquid Sulfur",
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

	["lobster_bisque"] = {
		label = "Lobster Bisque",
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

	["loperamide"] = {
		label = "Loperamide",
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

	["mac_cheese"] = {
		label = "Mac & Cheese",
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

	["marathon"] = {
		label = "Marathon",
		weight = 1,
		stack = true,
		close = true,
	},

	["marathon_joint"] = {
		label = "Marathon Joint",
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

	["market_salad"] = {
		label = "Market Salad",
		weight = 1,
		stack = true,
		close = true,
	},

	["marshmallow_crisp"] = {
		label = "Marshmallow Crisp",
		weight = 1,
		stack = true,
		close = true,
	},

	["marshmallow_og"] = {
		label = "Marshmallow OG",
		weight = 1,
		stack = true,
		close = true,
	},

	["marshmallow_og_joint"] = {
		label = "Marshmallow OG Joint",
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

	["mc_cappuccino"] = {
		label = "Cappuccino",
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

	["mc_combo_chicken"] = {
		label = "Combo Chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_diet_coke"] = {
		label = "Diet Coke",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_dr_pepper"] = {
		label = "Dr Pepper",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_fanta_orange"] = {
		label = "Fanta Orange",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_flurry_candies"] = {
		label = "McFlurry Candies",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_flurry_cookies"] = {
		label = "McFlurry Cookies",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_fruit_punch"] = {
		label = "Fruit Punch",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_hot_chocolate"] = {
		label = "Hot Chocolate",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_iced_coffee"] = {
		label = "Iced Coffee",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_iced_tea"] = {
		label = "Iced Tea",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_nuggets_happy_meal"] = {
		label = "McNuggets Happy Meal",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_sprite"] = {
		label = "Sprite",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_strawberry_shake"] = {
		label = "Strawberry Shake",
		weight = 1,
		stack = true,
		close = true,
	},

	["mc_vanilla_shake"] = {
		label = "Vanilla Shake",
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

	["medikit"] = {
		label = "Medikit",
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

	["medium_coca_cola"] = {
		label = "Medium Coca-Cola",
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

	["memphis_bbq_chicken"] = {
		label = "Memphis BBQ Chicken",
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

	["microsmg"] = {
		label = "Micro SMG Model",
		weight = 10,
		stack = true,
		close = true,
	},

	["microsmg_frame"] = {
		label = "Micro SMG Frame",
		weight = 10,
		stack = true,
		close = true,
	},

	["mifepristone"] = {
		label = "Mifepristone",
		weight = 100,
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

	["miner_pcb"] = {
		label = "Miner PCB",
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

	["minismg"] = {
		label = "Mini SMG Model",
		weight = 10,
		stack = true,
		close = true,
	},

	["minismg_frame"] = {
		label = "Mini SMG Frame",
		weight = 10,
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

	["monkey_mask"] = {
		label = "Monkey Mask",
		weight = 1,
		stack = true,
		close = true,
	},

	["moon_rock"] = {
		label = "Moon Rock",
		weight = 1,
		stack = true,
		close = true,
	},

	["moon_rock_joint"] = {
		label = "Moon Rock Joint",
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

	["muriatic_acid"] = {
		label = "Muriatic Acid",
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

	["nitrogen"] = {
		label = "Nitrogen",
		weight = 1,
		stack = true,
		close = true,
	},

	["notepad"] = {
		label = "Notepad",
		weight = 1,
		stack = true,
		close = true,
	},

	["no_99"] = {
		label = "NO 99",
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

	["opium"] = {
		label = "Opium",
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

	["opium_pooch"] = {
		label = "Opium Pooch",
		weight = 1,
		stack = true,
		close = true,
	},

	["orange_juice"] = {
		label = "Orange Juice",
		weight = 1,
		stack = true,
		close = true,
	},

	["oreoz"] = {
		label = "Oreoz",
		weight = 1,
		stack = true,
		close = true,
	},

	["oreoz_joint"] = {
		label = "Oreoz Joint",
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

	["oxygen"] = {
		label = "Oxygen",
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

	["pacific_veggie"] = {
		label = "Pacific Veggie",
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

	["packaged_coffee"] = {
		label = "PACKAGED COFFEE",
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

	["packaged_tea"] = {
		label = "PACKAGED TEA",
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

	["paris_fog"] = {
		label = "Paris Fog",
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

	["paxton_pearl_cigars"] = {
		label = "Paxton Pearl Cigars",
		weight = 1,
		stack = true,
		close = true,
	},

	["peach_milkshake"] = {
		label = "Peach Milkshake",
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

	["peixegato"] = {
		label = "Catfish",
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

	["peptobismol"] = {
		label = "Pepto-Bismol",
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

	["philly_cheese_sandwich"] = {
		label = "Philly Cheese Sandwich",
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

	["phone_hack"] = {
		label = "Phone Hack",
		weight = 10,
		stack = true,
		close = true,
	},

	["phone_module"] = {
		label = "Phone Module",
		weight = 10,
		stack = true,
		close = true,
	},

	["pickaxe"] = {
		label = "Pickaxe",
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

	["pink_phone"] = {
		label = "Pink Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["pink_sandy"] = {
		label = "Pink Sandy",
		weight = 1,
		stack = true,
		close = true,
	},

	["pink_sandy_joint"] = {
		label = "Pink Sandy Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["pirckly_pear"] = {
		label = "Pirckly Pear",
		weight = 1,
		stack = true,
		close = true,
	},

	["pirckly_pear_joint"] = {
		label = "Pirckly Pear Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["pistol"] = {
		label = "Pistol Model",
		weight = 10,
		stack = true,
		close = true,
	},

	["pistol50"] = {
		label = "Pistol 50 Model",
		weight = 10,
		stack = true,
		close = true,
	},

	["pistol50_frame"] = {
		label = "Pistol 50 Frame",
		weight = 10,
		stack = true,
		close = true,
	},

	["pistol_frame"] = {
		label = "Pistol Frame",
		weight = 10,
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

	["platbox_earrings"] = {
		label = "Platbox Earrings",
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

	["pogo"] = {
		label = "Pogo",
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

	["pooch_bag"] = {
		label = "Pooch Bag",
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

	["poppy_tears"] = {
		label = "Poppy Tears",
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

	["powerbank"] = {
		label = "Power Bank",
		weight = 10,
		stack = true,
		close = true,
	},

	["pr-softdrink"] = {
		label = "Soft Drink",
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

	["printer"] = {
		label = "Printer",
		weight = 1,
		stack = true,
		close = true,
	},

	["protein"] = {
		label = "Protein",
		weight = 1,
		stack = true,
		close = true,
	},

	["pr_coca_cola"] = {
		label = "Coca Cola",
		weight = 1,
		stack = true,
		close = true,
	},

	["pr_diet_coke"] = {
		label = "Diet Coke",
		weight = 1,
		stack = true,
		close = true,
	},

	["pr_dr_pepper"] = {
		label = "Pepper",
		weight = 1,
		stack = true,
		close = true,
	},

	["pr_fanta_orange"] = {
		label = "Fanta",
		weight = 1,
		stack = true,
		close = true,
	},

	["pr_fruit_punch"] = {
		label = "Fruit Punch",
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

	["ps_coca_cola"] = {
		label = "Coca Cola",
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

	["ps_sprite"] = {
		label = "Sprite",
		weight = 1,
		stack = true,
		close = true,
	},

	["pumpkin_cookie"] = {
		label = "Pumpkin Cookie",
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

	["quarter_pounder"] = {
		label = "Quarter Pounder",
		weight = 1,
		stack = true,
		close = true,
	},

	["quarter_pounder_cheese"] = {
		label = "Quarter Pounder Cheese",
		weight = 1,
		stack = true,
		close = true,
	},

	["quesadilla"] = {
		label = "Quesadilla",
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

	["raia"] = {
		label = "Stingray",
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

	["red_beans_rice"] = {
		label = "Regular Red Beans & Rice",
		weight = 1,
		stack = true,
		close = true,
	},

	["red_phone"] = {
		label = "Red Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["red_stone"] = {
		label = "Red Stone",
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

	["robalo"] = {
		label = "Sea Bass",
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

	["rolling_paper"] = {
		label = "Rolling Paper",
		weight = 1,
		stack = true,
		close = true,
	},

	["runtz_og"] = {
		label = "Runtz OG",
		weight = 1,
		stack = true,
		close = true,
	},

	["runtz_og_joint"] = {
		label = "Runtz OG Joint",
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

	["salmon_caesar_salad"] = {
		label = "Salmon Caesar Salad",
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

	["sausage_biscuit"] = {
		label = "Sausage Biscuit",
		weight = 1,
		stack = true,
		close = true,
	},

	["sausage_burrito"] = {
		label = "Sausage Burrito",
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

	["sausage_egg_cheese"] = {
		label = "Sausage, Egg & Cheese Biscuit",
		weight = 1,
		stack = true,
		close = true,
	},

	["sawnoffshotgun"] = {
		label = "Sawnoff Shotgun Model",
		weight = 10,
		stack = true,
		close = true,
	},

	["sawnoffshotgun_frame"] = {
		label = "Sawnoff Shotgun Frame",
		weight = 10,
		stack = true,
		close = true,
	},

	["scratch_ticket"] = {
		label = "Scratching Ticket",
		weight = 2,
		stack = true,
		close = true,
	},

	["seasoned_fries"] = {
		label = "SEASONED FRIES",
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

	["seed_weed"] = {
		label = "Weed Seed",
		weight = 1,
		stack = true,
		close = true,
	},

	["shamrock_cookie"] = {
		label = "Shamrock Cookie",
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

	["shells_clam_chowder"] = {
		label = "Shells Clam Chowder",
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

	["sheriff_bulletproof"] = {
		label = "Sheriff Bulletproof",
		weight = 1,
		stack = true,
		close = true,
	},

	["shrimp_alfredo"] = {
		label = "Shrimp Alfredo",
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

	["shrimp_pasta"] = {
		label = "Shrimp Pasta",
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

	["side_caesar_salad"] = {
		label = "Side Caesar Salad",
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

	["side_salad"] = {
		label = "Side Salad",
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

	["signature_latte"] = {
		label = "SIGNATURE LATTE",
		weight = 1,
		stack = true,
		close = true,
	},

	["simply_orange"] = {
		label = "Simply Orange",
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

	["slaughtered_chicken"] = {
		label = "Slaughtered chicken",
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

	["snow_man"] = {
		label = "Snow Man",
		weight = 1,
		stack = true,
		close = true,
	},

	["snow_man_joint"] = {
		label = "Snow Man Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["snspistol"] = {
		label = "SNS Pistol Model",
		weight = 10,
		stack = true,
		close = true,
	},

	["snspistol_frame"] = {
		label = "SNS Pistol Frame",
		weight = 10,
		stack = true,
		close = true,
	},

	["sodium_hydroxide"] = {
		label = "Sodium hydroxide",
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

	["soft_serve_cup"] = {
		label = "Soft Serve Cup",
		weight = 1,
		stack = true,
		close = true,
	},

	["soft_taco"] = {
		label = "Soft Taco",
		weight = 1,
		stack = true,
		close = true,
	},

	["soft_taco_supreme"] = {
		label = "Soft Taco Supreme",
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

	["sour_diesel"] = {
		label = "Sour Diesel",
		weight = 1,
		stack = true,
		close = true,
	},

	["sour_diesel_joint"] = {
		label = "Sour Diesel Joint",
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

	["spice_pooch"] = {
		label = "Spice Pooch",
		weight = 1,
		stack = true,
		close = true,
	},

	["spicy_chicken_burrito"] = {
		label = "Spicy Chicken Burrito",
		weight = 1,
		stack = true,
		close = true,
	},

	["spicy_chicken_sandwich_combo"] = {
		label = "Spicy Chicken Sandwich Combo",
		weight = 1,
		stack = true,
		close = true,
	},

	["spicy_crispy_chicken_sandwich"] = {
		label = "Spicy Crispy Chicken Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["spicy_deluxe_sandwich"] = {
		label = "Spicy Deluxe Sandwich",
		weight = 1,
		stack = true,
		close = true,
	},

	["spicy_southwest_salad"] = {
		label = "Spicy Southwest Salad",
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

	["sponge"] = {
		label = "Sponge",
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

	["starfish"] = {
		label = "Starfish",
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

	["steel"] = {
		label = "Steel",
		weight = 10,
		stack = true,
		close = true,
	},

	["steroids"] = {
		label = "Steroids",
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

	["strawberry_cheesecake_pie"] = {
		label = "Strawberry Cheesecake Fried Pie",
		weight = 1,
		stack = true,
		close = true,
	},

	["strawberry_jam_cookie"] = {
		label = "Strawberry Jam Cookie",
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

	["strawberry_milkshake"] = {
		label = "Strawberry Milkshake",
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

	["strawberry_watermelon_slushie"] = {
		label = "Strawberry Watermelon Slushie",
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

	["sundae_pie"] = {
		label = "HERSHEYS Sundae Pie",
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

	["surf_turf_combo"] = {
		label = "Surf & Turf Small Combo",
		weight = 1,
		stack = true,
		close = true,
	},

	["sweet_tea"] = {
		label = "Sweet Tea",
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

	["tacomeet"] = {
		label = "Taco Meet",
		weight = 1,
		stack = true,
		close = true,
	},

	["taco_regular"] = {
		label = "Taco Regular",
		weight = 1,
		stack = true,
		close = true,
	},

	["tahoe_og"] = {
		label = "Tahoe OG",
		weight = 1,
		stack = true,
		close = true,
	},

	["tahoe_og_joint"] = {
		label = "Tahoe OG Joint",
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

	["tenders_family_meal"] = {
		label = "16Pc Tenders Family Meal Mild",
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

	["tender_pack"] = {
		label = "24PC CRISPY TENDER PACK",
		weight = 1,
		stack = true,
		close = true,
	},

	["testosterone"] = {
		label = "Testosterone",
		weight = 1,
		stack = true,
		close = true,
	},

	["testpack"] = {
		label = "Test Pack",
		weight = 100,
		stack = true,
		close = true,
	},

	["texas_double_whopper"] = {
		label = "Texas Double Whopper",
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

	["thirty_crispy_tenders."] = {
		label = "30 CRISPY TENDERS",
		weight = 1,
		stack = true,
		close = true,
	},

	["threequarter_raglan_sleeve"] = {
		label = "Three Quarter Raglan Sleeve",
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

	["tropical_chick"] = {
		label = "Tropical Chick",
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

	["tropical_mango_slushie"] = {
		label = "Tropical Mango Slushie",
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

	["two_taco_supreme"] = {
		label = "Two Taco Supreme",
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

	["t_diet_pepsi"] = {
		label = "Diet Pepsi",
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

	["t_seven_up"] = {
		label = "Seven Up",
		weight = 1,
		stack = true,
		close = true,
	},

	["t_tango_apple"] = {
		label = "Tango Apple",
		weight = 1,
		stack = true,
		close = true,
	},

	["t_tango_orange"] = {
		label = "Tango Orange",
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

	["upeel_shrimp"] = {
		label = "U-Peel Shrimp",
		weight = 1,
		stack = true,
		close = true,
	},

	["uv_light"] = {
		label = "UV Flashlight",
		weight = 1,
		stack = true,
		close = true,
	},

	["vanilla_milkshake"] = {
		label = "Vanilla Milkshake",
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

	["viagra"] = {
		label = "Viagra",
		weight = 100,
		stack = true,
		close = true,
	},

	["vintagepistol"] = {
		label = "Vintage Pistol Model",
		weight = 10,
		stack = true,
		close = true,
	},

	["vintagepistol_frame"] = {
		label = "Vintage Pistol Frame",
		weight = 10,
		stack = true,
		close = true,
	},

	["volcano_burrito"] = {
		label = "Volcano Burrito",
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

	["waffle_potato_chips"] = {
		label = "Waffle Potato Chips",
		weight = 1,
		stack = true,
		close = true,
	},

	["waffle_potato_fries"] = {
		label = "Waffle Potato Fries",
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

	["washed_stone"] = {
		label = "Washed stone",
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

	["water_jug"] = {
		label = "Water Jug",
		weight = 5,
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

	["weed_pooch"] = {
		label = "Weed Pooch",
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

	["weed_purplehaze"] = {
		label = "Weed Purple Haze",
		weight = 10,
		stack = true,
		close = true,
	},

	["weed_skunk"] = {
		label = "Weed skunk",
		weight = 10,
		stack = true,
		close = true,
	},

	["weed_spray"] = {
		label = "Weed Spray",
		weight = 1,
		stack = true,
		close = true,
	},

	["wet_black_phone"] = {
		label = "Wet Black Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["wet_blue_phone"] = {
		label = "Wet Blue Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["wet_classic_phone"] = {
		label = "Wet Classic Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["wet_gold_phone"] = {
		label = "Wet Gold Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["wet_greenlight_phone"] = {
		label = "Wet Green Light Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["wet_green_phone"] = {
		label = "Wet Green Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["wet_phone"] = {
		label = "Wet Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["wet_pink_phone"] = {
		label = "Wet Pink Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["wet_red_phone"] = {
		label = "Wet Red Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["wet_white_phone"] = {
		label = "Wet White Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["whitecheck"] = {
		label = "whitecheck",
		weight = 10,
		stack = true,
		close = true,
	},

	["whitecherry_gelato"] = {
		label = "Whitecherry Gelato",
		weight = 1,
		stack = true,
		close = true,
	},

	["whitecherry_gelato_joint"] = {
		label = "Whitecherry Gelato Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["whiteslip"] = {
		label = "White Slip",
		weight = 10,
		stack = true,
		close = true,
	},

	["white_phone"] = {
		label = "White Phone",
		weight = 10,
		stack = true,
		close = true,
	},

	["white_runtz"] = {
		label = "White Runtz",
		weight = 1,
		stack = true,
		close = true,
	},

	["white_runtz_joint"] = {
		label = "White Runtz Joint",
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

	["whopper_with_cheese"] = {
		label = "Triple Whopper with Cheese",
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

	["world_famous_fries"] = {
		label = "World Famous Fries",
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

	["w_ice_cola"] = {
		label = "Ice Cola",
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

	["w_medium_fanta_strawberry"] = {
		label = "Medium Fanta Strawberry",
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

	["xanax"] = {
		label = "Xanax",
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

	["xpill"] = {
		label = "X-Pill",
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

	["yellow_shoes"] = {
		label = "Yellow Shoes",
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

	["zushi_joint"] = {
		label = "Zushi Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_trapphone"] = {
		label = "Zushi Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["fs_ricechicken"] = {
		label = "Rice Chicken",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_hotdog"] = {
		label = "Hotdog",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_7up1"] = {
		label = "7up",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_cola1"] = {
		label = "cola",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_cola3"] = {
		label = "Cola Zero",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_corona1"] = {
		label = "Corona",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_cupcake"] = {
		label = "cupcake",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_doritos"] = {
		label = "Doritos",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_fanta1"] = {
		label = "fanta",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_steak"] = {
		label = "Steak",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_soup"] = {
		label = "Soup",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_starbucks1"] = {
		label = "Starbuck can",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_rollcake"] = {
		label = "rollcake",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_lays"] = {
		label = "lays",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_monstere1"] = {
		label = "monster",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_frenchfries"] = {
		label = "FrenchFries",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_drpepper1"] = {
		label = "Drpepper",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_drpepper2"] = {
		label = "Drpepper Diet",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_minutem1"] = {
		label = "Minutem Maid",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_nosdrink1"] = {
		label = "Nos Drink",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_mntdew"] = {
		label = "Dew",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_juice3"] = {
		label = "Mango juice",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_juice1"] = {
		label = "Apple juice",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_juice2"] = {
		label = "Guava juice",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_juice4"] = {
		label = "Orange juice",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_juice5"] = {
		label = "Pineapple juice",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_juice6"] = {
		label = "Grape juice",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_juice7"] = {
		label = "Strawberry juice",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_prime1"] = {
		label = "Prime Tropical Punch",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_redbull1"] = {
		label = "redbull",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_redwine"] = {
		label = "RedWine",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_whtwine"] = {
		label = "WhiteWine",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_rum"] = {
		label = "Rum",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_beer"] = {
		label = "beer",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_nuget"] = {
		label = "Nuget",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_ramen"] = {
		label = "Ramen",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_prime2"] = {
		label = "Prime Blue Raspberry",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_prime3"] = {
		label = "Prime Lemon Lime",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_prime4"] = {
		label = "Prime Grape",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_prime5"] = {
		label = "Prime Ice Pop",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fs_prime6"] = {
		label = "PRIME STRAWBERRY WATERMELON",
		weight = 1,
		stack = true,
		close = true,
	},

	['wigphone'] = {
		label = 'Wig Phone',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	
	['wigtable'] = {
		label = 'Wig Table',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['sewinkit'] = {
		label = 'Sew in Kit',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['wigcap'] = {
		label = 'Wig Cap',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['hairbundles'] = {
		label = 'Hair Bundles',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['wigphone'] = {
		label = 'Wig Phone',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	
	--wigs
	
	['fortyinchwig'] = {
		label = '40 inch Wig',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['braidswig'] = {
		label = 'Braids Wig',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['curlywig'] = {
		label = 'Curly Wig',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['bangwig'] = {
		label = 'Bang Wig',
		weight = 1,
		stack = true,
		close = true,
		description = nil
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


	["gameboy_black"] = {
		label = "Gameboy",
		weight = 1,
		stack = true,
		close = true,
	},

	["gameboy_cyan"] = {
		label = "Gameboy",
		weight = 1,
		stack = true,
		close = true,
	},

	["gameboy_green"] = {
		label = "Gameboy",
		weight = 1,
		stack = true,
		close = true,
	},

	["gameboy_pink"] = {
		label = "Gameboy",
		weight = 1,
		stack = true,
		close = true,
	},

	["gameboy_purple"] = {
		label = "Gameboy",
		weight = 1,
		stack = true,
		close = true,
	},

	["gameboy_red"] = {
		label = "Gameboy",
		weight = 1,
		stack = true,
		close = true,
	},

	["gamepad"] = {
		label = "Gamepad",
		weight = 1,
		stack = true,
		close = true,
	},

	["cutchicken"] = {
		label = "Cut Chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["packagedchicken"] = {
		label = "Packaged Chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	['plastic_table_heroine'] = {
		label = 'Heroin Table',
		weight = 1250,
		stack = false,
		close = true,
	},

	['plastic_table_cocaine'] = {
		label = 'Cocaine Table',
		weight = 1250,
		stack = false,
		close = true,
	},

	['plastic_table_ecstasy'] = {
		label = 'Ecstasy Table',
		weight = 1250,
		stack = false,
		close = true,
	},

	['plastic_table_meth'] = {
		label = 'Meth Table',
		weight = 1250,
		stack = false,
		close = true,
	},

	['plastic_table_mushrooms'] = {
		label = 'Mushroom Table',
		weight = 1250,
		stack = false,
		close = true,
	},

	['plastic_table_weed'] = {
		label = 'Weed Table',
		weight = 1250,
		stack = false,
		close = true,
	},

	['plastic_table_fentanyl'] = {
		label = 'Fentanyl Table',
		weight = 1250,
		stack = false,
		close = true,
	},

    ['poppy'] = {
		label = 'Poppy',
		weight = 20,
		stack = true,
		close = true,
	},

    ['plastic_baggy'] = {
		label = 'Plastic Baggy',
		weight = 12,
		stack = true,
		close = true,
	},

	['heroin_shot'] = {
		label = 'Heroin Shot',
		weight = 15,
		stack = true,
		close = true,
	},

	['cocaine'] = {
		label = 'Cocaine',
		weight = 15,
		stack = true,
		close = true,
	},

	['ogkushkush'] = {
		label = 'OG Kush',
		weight = 15,
		stack = true,
		close = true,
	},

	['meth'] = {
		label = 'Meth',
		weight = 15,
		stack = true,
		close = true,
	},

	['fentanyl'] = {
		label = 'Fentanyl',
		weight = 15,
		stack = true,
		close = true,
	},

	['shrooms'] = {
		label = 'Shrooms',
		weight = 15,
		stack = true,
		close = true,
	},

	['ecstasy'] = {
		label = 'Ecstasy',
		weight = 15,
		stack = true,
		close = true,
	},

	["drill"] = {
		label = "Drill",
		weight = 1,
		stack = true,
		close = true,
	},

	["diamonds_box"] = {
		label = "Diamonds box",
		weight = 1,
		stack = true,
		close = true,
	},

	["vehicle_alarm_1"] = {
		label = "Vehicle alarm level 1",
		weight = 1,
		stack = true,
		close = true,
	},

	["vehicle_alarm_2"] = {
		label = "Vehicle alarm level 2",
		weight = 1,
		stack = true,
		close = true,
	},

	["gold_ingot"] = {
		label = "Gold ingot",
		weight = 1,
		stack = true,
		close = true,
	},

	["vehicle_alarm_4"] = {
		label = "Vehicle alarm level 4",
		weight = 1,
		stack = true,
		close = true,
	},

	["hacking_computer"] = {
		label = "Hacking computer",
		weight = 1,
		stack = true,
		close = true,
	},

	["thermal_charge"] = {
		label = "Thermal charge",
		weight = 1,
		stack = true,
		close = true,
	},

	["vehicle_transfer_contract"] = {
		label = "Vehicle transfer contract",
		weight = 1,
		stack = true,
		close = true,
	},

	["vehicle_alarm_3"] = {
		label = "Vehicle alarm level 3",
		weight = 1,
		stack = true,
		close = true,
	},

	["gas_mask"] = {
		label = "Gas mask",
		weight = 1,
		stack = true,
		close = true,
	},

	["painting"] = {
		label = "Painting",
		weight = 1,
		stack = true,
		close = true,
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

['trigger'] = {
	label = 'Trigger',
	weight = 10,
	stack = true
},
['springs'] = {
	label = 'Springs',
	weight = 10,
	stack = true
},
['smg_barrel'] = {
	label = 'Smg Barrel',
	weight = 10,
	stack = true
},
['shotgun_casings'] = {
	label = 'Shotgun Casings',
	weight = 10,
	stack = true
},
['shotgun_barrel'] = {
	label = 'Shotgun Barrel',
	weight = 10,
	stack = true
},
['pistol_handle'] = {
	label = 'Pistol Handle',
	weight = 10,
	stack = true
},
['pistol_casings'] = {
	label = 'Pistol Casings',
	weight = 10,
	stack = true
},
['large_handle'] = {
	label = 'Large Handle',
	weight = 10,
	stack = true
},
['gun_magazine'] = {
	label = 'Gun Magazine',
	weight = 10,
	stack = true
},
['gun_oil'] = {
	label = 'Gun Oil',
	weight = 10,
	stack = true
},
['firing_pin'] = {
	label = 'Firing Pin',
	weight = 10,
	stack = true
},
['ar_casings'] = {
	label = 'Ar Casings',
	weight = 10,
	stack = true
},
['ar_barrel'] = {
	label = 'Ar Barrel',
	weight = 10,
	stack = true
},
['pistol_barrel'] = {
	label = 'Pistol Barrel',
	weight = 10,
	stack = true
},
['tablet'] = {
	label = 'tablet',
	weight = 10,
	stack = true
}, 
['roadpods'] = {
	label = 'roadpods',
	weight = 10,
	stack = true
},
['outfitbag'] = {
    label = 'Outfitbag',
    weight = 20,
    stack = true,
    description = "Personal bag for your clothes",
},
}