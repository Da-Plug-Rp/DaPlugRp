return {
	General = {
		name = 'Shop',
		blip = {
			id = 59, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'adobada_pringles', price = 10 },
			{ name = 'bbq_pringles', price = 10 },
			{ name = 'cheddarcheese_pringles', price = 10 },
			{ name = 'cheddarsourcream_pringles', price = 10 },
			{ name = 'chililime_pringles', price = 10 },
			{ name = 'frenchfiresketchup_pringles', price = 10 },
			{ name = 'frenchoniondip_pringles', price = 10 },
			{ name = 'hothoney_pringles', price = 10 },
			{ name = 'lightlysalted_pringles', price = 10 },
			{ name = 'original_pringles', price = 10 },
			{ name = 'originalreductedfat_pringles', price = 10 },
			{ name = 'paprika_pringles', price = 10 },
			{ name = 'WEAPON_PETROLCAN', price = 10 },
			{ name = 'scratchcard01', price = 10 },
			{ name = 'scratchcard02', price = 25 },
			{ name = 'scratchcard03', price = 50 },
			{ name = 'scratchcard04', price = 75 },
			{ name = 'scratchcard05', price = 100 },
			{ name = 'rapsnack_barbquinwithmyhoney', price = 225},
			{ name = 'rapsnack_barbquinwithmyhoneyb', price = 225},
		}, locations = {
			vec3(25.7, -1347.3, 29.49),
			vec3(-3038.71, 585.9, 7.9),
			vec3(-3241.47, 1001.14, 12.83),
			vec3(1728.66, 6414.16, 35.03),
			vec3(1697.99, 4924.4, 42.06),
			vec3(1961.48, 3739.96, 32.34),
			vec3(547.79, 2671.79, 42.15),
			vec3(2679.25, 3280.12, 55.24),
			vec3(2557.94, 382.05, 108.62),
			vec3(373.55, 325.56, 103.56),
			vec3(-707.3153, -914.9887, 19.2156),
			vec3(813.9791, -781.8195, 26.1748),
		}, targets = {
			{ loc = vec3(25.06, -1347.32, 29.5), length = 0.7, width = 0.5, heading = 0.0, minZ = 29.5, maxZ = 29.9, distance = 1.5 },
			{ loc = vec3(-3039.18, 585.13, 7.91), length = 0.6, width = 0.5, heading = 15.0, minZ = 7.91, maxZ = 8.31, distance = 1.5 },
			{ loc = vec3(-3242.2, 1000.58, 12.83), length = 0.6, width = 0.6, heading = 175.0, minZ = 12.83, maxZ = 13.23, distance = 1.5 },
			{ loc = vec3(1728.39, 6414.95, 35.04), length = 0.6, width = 0.6, heading = 65.0, minZ = 35.04, maxZ = 35.44, distance = 1.5 },
			{ loc = vec3(1698.37, 4923.43, 42.06), length = 0.5, width = 0.5, heading = 235.0, minZ = 42.06, maxZ = 42.46, distance = 1.5 },
			{ loc = vec3(1960.54, 3740.28, 32.34), length = 0.6, width = 0.5, heading = 120.0, minZ = 32.34, maxZ = 32.74, distance = 1.5 },
			{ loc = vec3(548.5, 2671.25, 42.16), length = 0.6, width = 0.5, heading = 10.0, minZ = 42.16, maxZ = 42.56, distance = 1.5 },
			{ loc = vec3(2678.29, 3279.94, 55.24), length = 0.6, width = 0.5, heading = 330.0, minZ = 55.24, maxZ = 55.64, distance = 1.5 },
			{ loc = vec3(2557.19, 381.4, 108.62), length = 0.6, width = 0.5, heading = 0.0, minZ = 108.62, maxZ = 109.02, distance = 1.5 },
			{ loc = vec3(373.13, 326.29, 103.57), length = 0.6, width = 0.5, heading = 345.0, minZ = 103.57, maxZ = 103.97, distance = 1.5 },
			{ loc = vec3(-707.3153, -914.9887, 19.2156), length = 0.6, width = 0.5, heading = 345.0, minZ = 103.57, maxZ = 103.97, distance = 1.5 },
			{ loc = vec3(813.9791, -781.8195, 26.1748), length = 0.6, width = 0.5, heading = 345.0, minZ = 103.57, maxZ = 103.97, distance = 1.5 },
		}
	},

	Liquor = {
		name = 'Liquor Store',
		blip = {
			id = 52, colour = 27, scale = 0.7
		}, inventory = {
			{ name = 'water', price = 10 },
			{ name = 'dusche_beer', price = 50 },
			{ name = 'patriot_beer', price = 50 },
			{ name = 'cigar', price = 20 },

		}, locations = {
			vec3(1135.808, -982.281, 46.415),
			vec3(-1222.915, -906.983, 12.326),
			vec3(-1487.553, -379.107, 40.163),
			vec3(-2968.243, 390.910, 15.043),
			vec3(1166.024, 2708.930, 38.157),
			vec3(1392.562, 3604.684, 34.980),
			vec3(-2966.412, 391.526, 14.043),
		}, targets = {
			{
                ped = 'a_m_y_soucent_03',
                scenario = 'WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT_FACILITY',
                loc = vec3(-1221.451, -907.974, 11.326),
                heading = 34.865,
            },
			{
                ped = 'a_m_o_genstreet_01',
                scenario = 'WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT_FACILITY',
                loc = vec3(-1486.721, -377.599, 39.163),
                heading = 134.444,
            },
			{
                ped = 'a_f_o_indian_01',
                scenario = 'WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT_FACILITY',
                loc = vec3(1134.287, -983.168, 45.415),
                heading = 275.97,
            },
			{
                ped = 'a_m_m_salton_01',
                scenario = 'WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT_FACILITY',
                loc = vec3(1165.301, 2710.945, 37.157),
                heading = 177.103,
            },
			{
                ped = 'a_m_y_golfer_01',
                scenario = 'WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT_FACILITY',
                loc = vec3(-160.633, 6320.865, 30.586),
                heading = 315.998,
            },
			{
                ped = 'a_f_y_indian_01',
                scenario = 'WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT_FACILITY',
                loc = vec3(-2966.412, 391.526, 14.043),
                heading = 88.237,
            },
		},
	},

	DigitalDen = {
		name = 'Digital Den',
		blip = {
			id = 521, colour = 29, scale = 1.0
		}, inventory = {
			{ name = 'phone', price = 1000 },
			{ name = 'laptop', price = 100000 },
			{ name = 'tablet', price = 100000 },
			{ name = 'remotecontrol', price = 500 },
			{ name = 'powerbank', price = 1000 },


		}, locations = {
			vec3(-1209.1494, -1503.2137, 4.3739),
			vec3(-1230.9044, -1440.5933, 4.2445),
			vec3(-1230.9044, -1440.5933, 4.2445),
			
		}, targets = {

		}
	},

	BackpackShop = {
		name = 'Backpack Shop',
		blip = {
			id = 381, colour = 3, scale = 1.0
		}, inventory = {
			{ name = 'backpack1', price = 15000 },
			{ name = 'backpack2', price = 30000 },
			{ name = 'backpack3', price = 50000 },
			{ name = 'backpack4', price = 100000 },
			{ name = 'backpack5', price = 1000 },
			{ name = 'backpack6', price = 1000 },
			{ name = 'backpack7', price = 1000 },

		}, locations = {
			vec3(398.2151, 97.0851, 101.4882),

			
		}, targets = {

		}
	},

	Farming = {
		name = 'Farming Supply',
		blip = {
			id = 171, colour = 5, scale = 1.0
		}, inventory = {
			{ name = 'pickle_seed', price = 1 },
			{ name = 'broccoli_seed', price = 1 },
			{ name = 'weed_seed', price = 1 },
			{ name = 'wheat_seed', price = 1 },
			{ name = 'carrot_seed', price = 1 },
			{ name = 'cocaine_seed', price = 1 },
			{ name = 'corn_seed', price = 1 },
			{ name = 'potato_seed', price = 1 },
			{ name = 'tomato_seed', price = 1 },
			{ name = 'garden_pitcher', price = 100 },
			{ name = 'garden_shovel', price = 100 },

		}, locations = {
			vec3(-421.8464, 6137.1064, 31.8773),
			
		}, targets = {

		}
	},

	Doctor = {
		name = 'Medicine Cabinet',
		inventory = {
			{ name = 'acyclovir', price = 0 },
			{ name = 'aspirin', price = 0 },
			{ name = 'azithromycin', price = 0 },
			{ name = 'covidvaccine', price = 0 },
			{ name = 'doxycycline', price = 0 },
			{ name = 'dramamine', price = 0 },
			{ name = 'ibuprofen', price = 0 },
			{ name = 'loperamide', price = 0 },
			{ name = 'peptobismol', price = 0 },
			{ name = 'tylenol', price = 0 },
			{ name = 'buspirone', price = 0 },
			{ name = 'propranolol', price = 0 },
			{ name = 'methadone', price = 0 },
			{ name = 'antimdma', price = 0 },

		}, locations = {
			vec3(303.7350, -600.5740, 43.2841),
		}, targets = {

		}
	},


	BlackMarketArms = {
		name = 'Black Market',
		inventory = {
			{ name = 'WEAPON_ILLGLOCK17', price = 5000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_GARDONE', price = 5000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_FNX', price = 5000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_G30', price = 5000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_CERAMICPISTOL', price = 50000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'at_suppressor_light', price = 50000, currency = 'black_money' },
			{ name = 'ammo-rifle', price = 1000, currency = 'black_money' },
			{ name = 'ammo-rifle2', price = 1000, currency = 'black_money' },
			{ name = 'moneywashcard', price = 1000, currency = 'black_money' }

		}, locations = {
			vec3(-2166.4614, 5198.3652, 16.8804)
		}, targets = {

		}
	},

	--------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------
	-- vending
	VendingMachineDrinks = {
		name = 'Vending Machine',
		inventory = {
			{ name = 'water', price = 4 },
			{ name = 'ecola', price = 3 },
			{ name = 'sprunk', price = 3 },
			{ name = 'orangotang', price = 3 },
			{ name = 'ejunk', price = 5 },
		},
		model = {
			'prop_vend_soda_02', 'prop_vend_water_01', 'prop_vend_soda_01', 
			'ch_chint10_vending_smallroom_01', 'sf_prop_sf_vend_drink_01a'
		}
	},

	VendingMachineSnacks = {
		name = 'Vending Machine',
		inventory = {
			{ name = 'phatc_rib', price = 3 },
			{ name = 'phatc_bch', price = 3 },
			{ name = 'ps_qs', price = 2 },
			{ name = 'apple', price = 2 },
			{ name = 'banana', price = 2 },
		},
		model = {
			'prop_vend_snak_01', 'prop_vend_snak_01_tu'
		}
	},

	VendingMachineCoffee = {
		name = 'Coffee Machine',
		inventory = {
			{ name = 'coffee_black', price = 4 },
			{ name = 'coffee_mocha', price = 3 },
			{ name = 'coffee_cpcno', price = 3 },
			{ name = 'coffee_amrcno', price = 3 }
		},
		model = {
			'prop_vend_coffe_01'
		}
	}
}
