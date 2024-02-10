--- @param WARNING: Do NOT rename this resource or it will stop working!!

---  __    __  __       __  __       __  __    __         ______    ______   _______   ______  _______  ________   ______  -----
--  |  \  |  \|  \     /  \|  \     /  \|  \  |  \       /      \  /      \ |       \ |      \|       \|        \ /      \  ----
--  | $$  | $$| $$\   /  $$| $$\   /  $$| $$  | $$      |  $$$$$$\|  $$$$$$\| $$$$$$$\ \$$$$$$| $$$$$$$\\$$$$$$$$|  $$$$$$\  ---
---  \$$\/  $$| $$$\ /  $$$| $$$\ /  $$$ \$$\/  $$      | $$___\$$| $$   \$$| $$__| $$  | $$  | $$__/ $$  | $$   | $$___\$$  ---
----  >$$  $$ | $$$$\  $$$$| $$$$\  $$$$  >$$  $$        \$$    \ | $$      | $$    $$  | $$  | $$    $$  | $$    \$$    \  ----
---  /  $$$$\ | $$\$$ $$ $$| $$\$$ $$ $$ /  $$$$\        _\$$$$$$\| $$   __ | $$$$$$$\  | $$  | $$$$$$$   | $$    _\$$$$$$\  ---
--  |  $$ \$$\| $$ \$$$| $$| $$ \$$$| $$|  $$ \$$\      |  \__| $$| $$__/  \| $$  | $$ _| $$_ | $$        | $$   |  \__| $$  ---
--  | $$  | $$| $$  \$ | $$| $$  \$ | $$| $$  | $$       \$$    $$ \$$    $$| $$  | $$|   $$ \| $$        | $$    \$$    $$ ----
---  \$$   \$$ \$$      \$$ \$$      \$$ \$$   \$$        \$$$$$$   \$$$$$$  \$$   \$$ \$$$$$$ \$$         \$$     \$$$$$$ -----

Locales = {}

Config = {

    --- @param Debugging: Enable for polyzone and config related errors.  
    Debug = false, -- Be sure to turn false before running on live server. Enabled for location updates.

    Language = "en", -- (en or sp available) If using a different language, copy and paste the en.lua, create a new .lua in the locales folder, then set language here.

    --- @param Framework: Add the export if you renamed qb-core here. If using a renamed qb-target or one that works the same.
    Core = 'es_extended', -- uses some es_extended functionality, otherwise solely "ox_lib compatible"   
    Target = 'ox_target', -- ox_target compatible with qb-target and bt-target (changing will not do anything, only for reference)
    TargetDistance = 2.5, -- player distance from targetable locations.
    Inventory = 'ox', -- this version only works with 'ox'
    Menu = 'ox', -- this version only works with 'ox'


    StressEvent = 'hud:server:RelieveStress', -- to relieve stress on Urinal Useage. (set to nil if not using a stress event)
    StressAmount = math.random(4, 8), -- Amount of stress to relieve. (set to nil if not using a stress event)
    
    --- @param Images: Add the folder location of your inventory images for the menus here.
    Images = "ox_inventory/web/images/", 


    --- @param Payments: Use built in event for charging at cash registers or add here your own.
    PayEvent = 'TriggerEvent("billing_ui:activateBillingMode")', -- Add your client side billing event here for the registers.

    DutyToggleEvent = '', -- Add your duty toggle event here if using one.

    SinkTimer = 5000, --- Time for progressbar when washing hands.
    UrinalTimer = 7000, -- Time for progressbar when using urinal. (Relieves Stress)

    CocktailsTimer = 10000, -- Time for progressbar when crafting cocktails.
    ShotsTimer = 10000, -- Time for progressbar when crafting drinks (shots).
    BeersTimer = 5000, -- Time for progressbar when crafting (pulling) beer from taps.

    MicroTimer = 10000, -- Time for progressbar when crafting drinks (shots).
    GrillTimer = 10000, -- Time for progressbar when crafting (pulling) beer from taps.



    HandwshAnimDict = "mp_arresting", -- animation when washing hands.
    HandwshAnim = "a_uncuff",

    UrinalAnimDict = "misscarsteal2peeing", -- animation when using urinal.
    UrinalAnim = "peeing_loop",

    CocktailsAnimDict = "mini@strip_club@drink@one", -- animation when mixing cocktails.
    CocktailsAnim = "one_bartender",

    ShotsAnimDict = "mini@strip_club@drink@one", -- animation when pouring shots.
    ShotsAnim = "one_bartender",

    BeersAnimDict = "mp_ped_interaction", -- animation when pulling beers.
    BeersAnim = "handshake_guy_a",

    MicroAnimDict = "mini@repair", -- animation when using micro oven.
    MicroAnim = "fixing_a_ped",

    GrillAnimDict = "amb@prop_human_bbq@male@base", -- animation when using griddle.
    GrillAnim = "base",

    

    --- @param Setup: Job and Location related Configurations.
    JobName = "bahama", -- If you change, also change the name of the location below.
    
    ClearPeds = true, -- If you have those pesky npc peds lined up at the front door, enable to auto clear them!

    Locations = {
        ["bahama"] = { -- Must match the job name above.
            enableBlip = true,
            blipLabel = "Bahama Mama\'s",
			blipCoords = vector3(-1386.33, -590.16, 30.32),
            blipSprite = 93,
            blipDisplay = 6,
            blipScale = 0.85,
			blipColor = 48,

            dutyName = "BahamaDuty", -- Target Name for Duty / Boss Menu
            jobCoords = { coords = vector3(-1383.7314, -592.2582, 30.0), heading = 33.0, minZ = 30.1, maxZ = 30.9, w = 0.7, h = 0.5, },
            
            bossName = "BahamaBoss", -- Target Name of Boss Menu (has some functionality for managing employees, grades, and pay)
            bossCoords = { coords = vector3(-1370.1331, -625.9238, 30.0473), heading = 305.0, minZ = 30.035, maxZ = 30.152, w = 0.55, h = 0.25, },

            CamsName = "BahamaCams", -- Target Name of Cameras Access Point
            CamsCoords = { coords = vector3(-1370.5264, -625.3998, 30.3248), heading = 305.0, minZ = 30.25, maxZ = 30.852, w = 0.9, h = 0.15, },

            CounterName = "BahamaCounter1", -- Target Name for Counter Stash / DO NOT CHANGE
            CounterCoords = { coords = vector3(-1398.4381, -601.4736, 30.409), heading = 254.1, minZ = 30.35, maxZ = 30.62, w = 0.5, h = 0.6, },

            Counter2Name = "BahamaCounter2", -- Target Name for Counter Stash 2 / DO NOT CHANGE
            Counter2Coords = { coords = vector3(-1402.0974, -603.5207, 30.409), heading = 161.97, minZ = 30.35, maxZ = 30.62, w = 0.5, h = 0.6, },

            Register1Name = "BahamaRegister1", -- Target Name for Primary Register
            Register1Coords = { coords = vector3(-1398.9078, -600.1309, 30.398), heading = 281.02, minZ = 30.27, maxZ = 30.87, w = 0.5, h = 0.5, },
            
            Register2Name = "BahamaRegister2", -- Target Name for Secondary Register
            Register2Coords = { coords = vector3(-1402.8337, -602.5296, 30.398), heading = 148.87, minZ = 30.27, maxZ = 30.87, w = 0.5, h = 0.5, },

            SinkName = "BahamaSink", -- Target Name for Handwashing Sink (Employee)
            SinkCoords = { coords = vector3(-1403.0709, -597.9698, 29.533), heading = 303.0, minZ = 28.55, maxZ = 29.52, w = 1.2, h = 0.8, },

            Sink2Name = "BahamaSink2", -- Target Name for Handwashing Sink (Anyone)
            Sink2Coords = { coords = vector3(-1387.4956, -603.6207, 30.2017), heading = 303.0, minZ = 29.97, maxZ = 30.47, w = 2.8, h = 0.8, },

            UrinalName = "BahamaUrinal", -- Urinal for urinating.
            UrinalCoords = { coords = vector3(-1390.6371, -597.5551, 29.6061), heading = 303.0, minZ = 29.07, maxZ = 30.38, w = 4.5, h = 0.6, },
        
            DrinksName = "BahamaDrinks1", -- Target Name for Shot Drinks
            DrinksCoords = { coords = vector3(-1402.0907, -597.2324, 30.439), heading = 303.0, minZ = 30.05, maxZ = 30.85, w = 0.8, h = 0.6, },

            Drinks2Name = "BahamaDrinks2", -- Target Name for Cocktails Drinks
            Drinks2Coords = { coords = vector3(-1404.1202, -598.5065, 30.439), heading = 303.0, minZ = 30.05, maxZ = 30.85, w = 0.8, h = 0.6, },

            Drinks3Name = "BahamaDrinks3", -- Target Name for Draft Beers
            Drinks3Coords = { coords = vector3(-1399.9821, -598.1522, 30.173), heading = 305.09, minZ = 30.10, maxZ = 31.0, w = 0.6, h = 1.4, },

            ToasterName = "BahamaMicro", -- Target Name for Microwave Toaster Oven
            ToasterCoords = { coords = vector3(-1404.9036, -600.0015, 30.3502), heading = 109.71, minZ = 30.27, maxZ = 30.87, w = 0.5, h = 0.6, },

            GriddleName = "BahamaGriddle", -- Target Name for Microwave Toaster Oven
            GriddleCoords = { coords = vector3(-1400.5355, -597.075, 30.3502), heading = 321.78, minZ = 30.35, maxZ = 30.62, w = 0.42, h = 0.68, },

            StashName = "BahamaStash", -- Target Name for Storage / Stash
            StashCoords = { coords = vector3(-1401.7014, -597.4945, 29.382), heading = 303.0, minZ = 29.47, maxZ = 30.37, w = 1.15, h = 0.6, },

            StockName = "BahamaShop", -- Target Name for Stock / Shop / DO NOT CHANGE
            StockCoords = { coords = vector3(-1403.9791, -598.9736, 29.382), heading = 303.0, minZ = 29.47, maxZ = 30.37, w = 1.15, h = 0.6, },

        },
    },

    --- @param PropSpawns: Enable or disable prop spawn and/or change the coordinates here.
    enableGriddle = true,
    GriddleProp = `prop_griddle_02`,
    GriddleCoords = vector4(-1400.5332, -597.0728, 30.373+1.032, 321.78), -- Should be at/near GriddleCoords Above.
    
    enableMicro = true,
    MicroProp = `prop_microwave_1`,
    MicroCoords = vector4(-1405.02, -600.05, 30.37+1.032, 109.71), -- Should be at/near MicroCoords Above.
    
    enableTray1 = true,
    Tray1Prop = `v_res_r_silvrtray`,
    Tray1Coords = vector4(-1398.4381, -601.4736, 30.409+1.027, 253.39), -- Should be at/near CounterCoords Above.
    
    enableTray2 = true,
    Tray2Prop = `v_res_r_silvrtray`,
    Tray2Coords = vector4(-1402.0974, -603.5207, 30.409+1.027, 161.97), -- Should be at/near Counter2Coords Above.


    --- @param Cameras: Configure the camera locations to your liking. In particular, the camera in the Dressing Room if you dont want it there for privacy.
    Cameras = {
        Enabled = true,
        locations = {
            ['1'] = { coords = vector3(-1382.6570, -591.0401, 32.5674), rot = { x = -25.0, y = 0.0, z = 80.00  }, Rotation = true }, -- Bahama Main Lobby
            ['2'] = { coords = vector3(-1378.6005, -608.8534, 33.3356), rot = { x = -27.0, y = 0.0, z = -55.05 }, Rotation = true }, -- Bahama DJ Booth
            ['3'] = { coords = vector3(-1385.9082, -624.5057, 33.0056), rot = { x = -25.0, y = 0.0, z = 30.0   }, Rotation = true }, -- Bahama Rear Building
            ['4'] = { coords = vector3(-1397.8463, -605.8002, 33.0056), rot = { x = -25.0, y = 0.0, z = 35.0   }, Rotation = true }, -- Bahama Bar Area
            ['5'] = { coords = vector3(-1375.4314, -632.2014, 32.4198), rot = { x = -35.0, y = 0.0, z = 80.00  }, Rotation = true }, -- Bahama Dressing Room 
        },
    },


    --- @param Configuration: I wouldnt advise touching this unless disabling them or you are good with getting coords for prop specific animations.

    AnimationsEnabled = true, --- This enables all Poles, Dance Booths, Hot Tub Dancing and Hot Tub Bubbles Effects.
    HotTubControl = {
        { coords = vector4(-1377.9125, -606.6511, 31.0446, 70.57), minZ = 31.0, maxZ = 31.5561, }, -- Location of hot tub bubbles controls (change if you want).
    },
    HotTub = {
        { coords = vector4(-1384.42, -605.14, 29.91-1, 78.56), minZ = 28.51, maxZ = 29.96 },
        { coords = vector4(-1381.32, -606.24, 29.91-1, 229.43), minZ = 28.51, maxZ = 29.96 },
        { coords = vector4(-1380.81, -602.64, 29.91-1, 151.51), minZ = 28.51, maxZ = 29.96 },
        { coords = vector4(-1377.27, -612.4, 29.91-1, 74.79), minZ = 28.51, maxZ = 29.96 },
        { coords = vector4(-1377.52, -615.68, 29.91-1, 347.09), minZ = 28.51, maxZ = 29.96 },
        { coords = vector4(-1373.8, -613.41, 29.91-1, 94.5), minZ = 28.51, maxZ = 29.96 },
    },
    Booths = {
        { coords = vector4(-1407.22, -609.89, 30.68-1, 300.0), minZ = 29.28, maxZ = 32.08 },
        { coords = vector4(-1405.26, -612.46, 30.68-1, 300.0), minZ = 29.28, maxZ = 32.08 },
        { coords = vector4(-1403.63, -615.09, 30.68-1, 300.0), minZ = 29.28, maxZ = 32.08 },
        { coords = vector4(-1401.84, -617.77, 30.68-1, 300.0), minZ = 29.28, maxZ = 32.08 },
    },
    Poles = {
        { coords = vector4(-1393.7627, -612.0366, 29.7864, 30.0), minZ = 29.5128, maxZ = 34.3628, pole = 3 },
        { coords = vector4(-1390.8264, -616.5738, 29.7864, 30.0), minZ = 29.5128, maxZ = 34.3628, pole = 2 }, 
        { coords = vector4(-1387.8630, -621.1016, 29.7864, 30.0), minZ = 29.5128, maxZ = 34.3628, pole = 1 },
        { coords = vector4(-1391.3578, -632.0099, 30.3084, 30.0), minZ = 30.0994, maxZ = 34.3684, pole = 2 }, 
        { coords = vector4(-1409.1314, -606.6612, 29.5000, 30.0), minZ = 29.5128, maxZ = 34.3624, pole = 3 }, 
        { coords = vector4(-1369.9546, -621.0739, 29.4999, 30.0), minZ = 29.5128, maxZ = 34.3624, pole = 2 }, 
    },



    --- @param Inventory: Stock Shop Items. Can add a price to charge business for stock items.

    Stock = {
		label = "Bahama Stock",
		slots = 36,
		items = {
			{ name = 'bahama_mug',        price = 2, amount = 200, info = {}, type = 'item', slot = 1, },
			{ name = 'bahama_glass',      price = 2, amount = 200, info = {}, type = 'item', slot = 2, },
			{ name = 'bahama_shotglass',  price = 2, amount = 200, info = {}, type = 'item', slot = 3, },
			{ name = 'bahama_whiskey',    price = 2, amount = 200, info = {}, type = 'item', slot = 4, },
            { name = 'bahama_tequila',    price = 2, amount = 200, info = {}, type = 'item', slot = 5, },
			{ name = 'bahama_vodka',      price = 2, amount = 200, info = {}, type = 'item', slot = 6, },
            { name = 'bahama_rum',        price = 2, amount = 200, info = {}, type = 'item', slot = 7, },
            { name = 'bahama_gin',        price = 2, amount = 200, info = {}, type = 'item', slot = 8, },
            { name = 'bahama_champagne',  price = 2, amount = 200, info = {}, type = 'item', slot = 9, },
            { name = 'bahama_cachaca',    price = 2, amount = 200, info = {}, type = 'item', slot = 10, },
            { name = 'bahama_curacao',    price = 2, amount = 200, info = {}, type = 'item', slot = 11, },
            { name = 'bahama_lime',       price = 2, amount = 200, info = {}, type = 'item', slot = 12, },
            { name = 'bahama_strawberry', price = 2, amount = 200, info = {}, type = 'item', slot = 13, },
            { name = 'bahama_pineapple',  price = 2, amount = 200, info = {}, type = 'item', slot = 14, },
            { name = 'bahama_cranjuice',  price = 2, amount = 200, info = {}, type = 'item', slot = 15, },
            { name = 'bahama_ojuice',     price = 2, amount = 200, info = {}, type = 'item', slot = 16, },
			{ name = 'bahama_coffee',     price = 2, amount = 200, info = {}, type = 'item', slot = 17, },
			{ name = 'bahama_sugarcube',  price = 2, amount = 200, info = {}, type = 'item', slot = 18, },
			{ name = 'bahama_icecube',    price = 2, amount = 200, info = {}, type = 'item', slot = 19, },
            { name = 'bahama_jello',      price = 2, amount = 200, info = {}, type = 'item', slot = 20, },
            { name = 'bahama_ccheese',    price = 2, amount = 200, info = {}, type = 'item', slot = 21, },
            { name = 'bahama_mango',      price = 2, amount = 200, info = {}, type = 'item', slot = 22, },
            { name = 'bahama_cheddar',    price = 2, amount = 200, info = {}, type = 'item', slot = 23, },
            { name = 'bahama_rawwing',    price = 2, amount = 200, info = {}, type = 'item', slot = 24, },
            { name = 'bahama_seasoning',  price = 2, amount = 200, info = {}, type = 'item', slot = 25, },
			{ name = 'bahama_chips',      price = 2, amount = 200, info = {}, type = 'item', slot = 26, },
			{ name = 'bahama_beef',       price = 2, amount = 200, info = {}, type = 'item', slot = 27, },
			{ name = 'bahama_avocado',    price = 2, amount = 200, info = {}, type = 'item', slot = 28, },
            { name = 'bahama_peppers',    price = 2, amount = 200, info = {}, type = 'item', slot = 29, },
			{ name = 'bahama_bbq',        price = 2, amount = 200, info = {}, type = 'item', slot = 30, },
            { name = 'bahama_shrimp',     price = 2, amount = 200, info = {}, type = 'item', slot = 31, },
            { name = 'bahama_rawchik',    price = 2, amount = 200, info = {}, type = 'item', slot = 32, },
            { name = 'bahama_eggs',       price = 2, amount = 200, info = {}, type = 'item', slot = 33, },
            { name = 'bahama_bredcrum',   price = 2, amount = 200, info = {}, type = 'item', slot = 34, },
            { name = 'bahama_butter',     price = 2, amount = 200, info = {}, type = 'item', slot = 35, },
			{ name = 'water',             price = 2, amount = 200, info = {}, type = 'item', slot = 36, },
        },
    },

    --- @param Ingredients: Required items to craft a particular food item. Adjust amunts to your specs.
    Making = {        
        -- Drinks
        Cocktails = { -- 
            { ['bm_mimosa'] =         { ['bahama_glass'] = 3,  ['bahama_ojuice'] = 1,    ['bahama_champagne'] = 1,  ['bahama_icecube'] = 1,    }, ["amount"] = 3, },
            { ['bm_pinacolada'] =     { ['bahama_glass'] = 3,  ['bahama_pineapple'] = 1, ['bahama_rum'] = 1,        ['bahama_icecube'] = 1,    }, ["amount"] = 3, },
            { ['bm_cosmopolitan'] =   { ['bahama_glass'] = 3,  ['bahama_vodka'] = 1,     ['bahama_cranjuice'] = 1,  ['bahama_lime'] = 1,       }, ["amount"] = 3, },
            { ['bm_daiquiri'] =       { ['bahama_glass'] = 3,  ['bahama_rum'] = 1,       ['bahama_cranjuice'] = 1,  ['bahama_icecube'] = 1,    }, ["amount"] = 3, },
            { ['bm_martini'] =        { ['bahama_glass'] = 3,  ['bahama_gin'] = 1,       ['bahama_lime'] = 1,       ['bahama_icecube'] = 1,    }, ["amount"] = 3, },
            { ['bm_kahlua'] =         { ['bahama_glass'] = 3,  ['bahama_coffee'] = 1,    ['bahama_rum'] = 1,        ['bahama_sugarcube'] = 1,  }, ["amount"] = 3, },
            { ['bm_whiskeysour'] =    { ['bahama_glass'] = 3,  ['bahama_whiskey'] = 1,   ['bahama_lime'] = 1,       ['bahama_icecube'] = 1,    }, ["amount"] = 3, },
            { ['bm_bluelagoon'] =     { ['bahama_glass'] = 3,  ['bahama_vodka'] = 1,     ['bahama_lime'] = 1,       ['bahama_curacao'] = 1,    }, ["amount"] = 3, },
            { ['bm_oldfashion'] =     { ['bahama_glass'] = 3,  ['bahama_whiskey'] = 1,   ['bahama_sugarcube'] = 1,  ['bahama_icecube'] = 1,    }, ["amount"] = 3, },
        },
        Shots = {
            { ['bm_tequilashot'] =     { ['bahama_shotglass'] = 5, ['bahama_tequila'] = 1,    ['bahama_lime'] = 1,      }, ["amount"] = 5, },
            { ['bm_whiskeyshot'] =     { ['bahama_shotglass'] = 5, ['bahama_whiskey'] = 1,    ['bahama_icecube'] = 1,   }, ["amount"] = 5, },
            { ['bm_seabreezeshot'] =   { ['bahama_shotglass'] = 5, ['bahama_vodka'] = 1,      ['bahama_cranjuice'] = 1, }, ["amount"] = 5, },
            { ['bm_caipirinhashot'] =  { ['bahama_shotglass'] = 5, ['bahama_cachaca'] = 1,    ['bahama_lime'] = 1,      }, ["amount"] = 5, },
            { ['bm_jelloshot'] =       { ['bahama_jello'] = 1,     ['bahama_tequila'] = 1,    ['water'] = 1,     }, ["amount"] = 5, },

        },
        Beers = { 
            { ['bm_budlite'] =     { ['bahama_mug'] = 1, }, ["amount"] = 1, }, 
            { ['bm_millerlite'] =  { ['bahama_mug'] = 1, }, ["amount"] = 1, },
            { ['bm_coorslite'] =   { ['bahama_mug'] = 1, }, ["amount"] = 1, },
            { ['bm_corona'] =      { ['bahama_mug'] = 1, }, ["amount"] = 1, },
        },
        -- Foods
        Microwave = {
            { ['bm_wings'] =       { ['bahama_rawwing'] = 1,    ['bahama_seasoning'] = 1,   ['bahama_lime'] = 1,    ['bahama_butter'] = 1,     }, ["amount"] = 2, },
            { ['bm_rissole'] =     { ['bahama_rawchik'] = 1,    ['bahama_cheddar'] = 1,     ['bahama_eggs'] = 1,    ['bahama_bredcrum'] = 1,   }, ["amount"] = 2, }, 
            { ['bm_mgocake'] =     { ['bahama_ccheese'] = 1,    ['bahama_mango'] = 1,       ['bahama_cheddar'] = 1, ['bahama_eggs'] = 1,       }, ["amount"] = 2, },
        },
        Griddle = {
            { ['bm_caridea'] =     { ['bahama_shrimp'] = 1,     ['bahama_seasoning'] = 1,    ['bahama_lime'] = 1,     }, ["amount"] = 2, }, 
            { ['bm_kebab'] =       { ['bahama_beef'] = 1,       ['bahama_peppers'] = 1,      ['bahama_bbq'] = 1,      }, ["amount"] = 2, },
            { ['bm_nachos'] =      { ['bahama_chips'] = 1,      ['bahama_beef'] = 1,         ['bahama_avocado'] = 1,  }, ["amount"] = 2, },
        },
    },
}


ScriptName = "xmmx-bahamas" -- Do NOT Touch!!!