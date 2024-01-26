print('[QB/ESX] Let\'s Camp! v.1.5')

---@param WARNING: Do NOT rename this resource or it will stop working!!
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

    VersionCheck = true,

--  ________  _______    ______   __       __  ________  __       __   ______   _______   __    __    
-- |        \|       \  /      \ |  \     /  \|        \|  \  _  |  \ /      \ |       \ |  \  /  \   
-- | $$$$$$$$| $$$$$$$\|  $$$$$$\| $$\   /  $$| $$$$$$$$| $$ / \ | $$|  $$$$$$\| $$$$$$$\| $$ /  $$__ 
-- | $$__    | $$__| $$| $$__| $$| $$$\ /  $$$| $$__    | $$/  $\| $$| $$  | $$| $$__| $$| $$/  $$|  \
-- | $$  \   | $$    $$| $$    $$| $$$$\  $$$$| $$  \   | $$  $$$\ $$| $$  | $$| $$    $$| $$  $$  \$$
-- | $$$$$   | $$$$$$$\| $$$$$$$$| $$\$$ $$ $$| $$$$$   | $$ $$\$$\$$| $$  | $$| $$$$$$$\| $$$$$\  __ 
-- | $$      | $$  | $$| $$  | $$| $$ \$$$| $$| $$_____ | $$$$  \$$$$| $$__/ $$| $$  | $$| $$ \$$\|  \
-- | $$      | $$  | $$| $$  | $$| $$  \$ | $$| $$     \| $$$    \$$$ \$$    $$| $$  | $$| $$  \$$\\$$
--  \$$       \$$   \$$ \$$   \$$ \$$      \$$ \$$$$$$$$ \$$      \$$  \$$$$$$  \$$   \$$ \$$   \$$  

    Core = 'esx', -- "qb" for QBCore or "esx" for ESX.
    CoreObject = 'es_extended', -- "qb-core" or "es_extended".

    Language = 'en',

    Target = 'ox', -- "qb" for qb-target, "ox" for ox_target, or "qt" for "qtarget".
    Distance = 2.0, -- Target Distance

    Inventory = "ox", -- "qb", "ox", "esx", or if ESX and using qs-inventory, set to "qs" -- qs is for ESX only, QB using "qs" set it to "qb"!

    Menu = "ox", -- "qb" or "ox" only!

    Utils = "ox", -- "qb" for QBCore progressbar, or "ox" for ox_lib progressCircle.

    Notify = "ox", -- "qb" for QBCore Notifications, or "ox" for ox_lib Notifications.

    Images = "ox-inventory/web/images/", -- "qb-inventory/html/images/", -- the name of your inventory and location of the images folder for the menu. 

    CantCampInCity = true, -- Set to true to deny camping within City Limits or false to camp anywhere.



--  ________   ______   _______    ______   ________  ________         ______   _______      _____  ________   ______  ________   ______      
-- |        \ /      \ |       \  /      \ |        \|        \       /      \ |       \    |     \|        \ /      \|        \ /      \     
--  \$$$$$$$$|  $$$$$$\| $$$$$$$\|  $$$$$$\| $$$$$$$$ \$$$$$$$$      |  $$$$$$\| $$$$$$$\    \$$$$$| $$$$$$$$|  $$$$$$\\$$$$$$$$|  $$$$$$\ __ 
--    | $$   | $$__| $$| $$__| $$| $$ __\$$| $$__       | $$         | $$  | $$| $$__/ $$      | $$| $$__    | $$   \$$  | $$   | $$___\$$|  \
--    | $$   | $$    $$| $$    $$| $$|    \| $$  \      | $$         | $$  | $$| $$    $$ __   | $$| $$  \   | $$        | $$    \$$    \  \$$
--    | $$   | $$$$$$$$| $$$$$$$\| $$ \$$$$| $$$$$      | $$         | $$  | $$| $$$$$$$\|  \  | $$| $$$$$   | $$   __   | $$    _\$$$$$$\ __ 
--    | $$   | $$  | $$| $$  | $$| $$__| $$| $$_____    | $$         | $$__/ $$| $$__/ $$| $$__| $$| $$_____ | $$__/  \  | $$   |  \__| $$|  \
--    | $$   | $$  | $$| $$  | $$ \$$    $$| $$     \   | $$          \$$    $$| $$    $$ \$$    $$| $$     \ \$$    $$  | $$    \$$    $$ \$$
--     \$$    \$$   \$$ \$$   \$$  \$$$$$$  \$$$$$$$$    \$$           \$$$$$$  \$$$$$$$   \$$$$$$  \$$$$$$$$  \$$$$$$    \$$     \$$$$$$     

---@param Props: You may change the prop objects to any object of your choice.

    GrillObject = `prop_bbq_4`,
    TentObject = `ba_prop_battle_tent_02`,
    ChairObject = `prop_skid_chair_01`,
    BedObject = `bkr_prop_biker_campbed_01`,
    WoodObject = `prop_beach_fire`,
    CoolerObject = `v_ret_fh_coolbox`,




--  ______   __    __  ______  __       __   ______  ________  ______   ______   __    __   ______      
--  /      \ |  \  |  \|      \|  \     /  \ /      \|        \|      \ /      \ |  \  |  \ /      \     
-- |  $$$$$$\| $$\ | $$ \$$$$$$| $$\   /  $$|  $$$$$$\\$$$$$$$$ \$$$$$$|  $$$$$$\| $$\ | $$|  $$$$$$\ __ 
-- | $$__| $$| $$$\| $$  | $$  | $$$\ /  $$$| $$__| $$  | $$     | $$  | $$  | $$| $$$\| $$| $$___\$$|  \
-- | $$    $$| $$$$\ $$  | $$  | $$$$\  $$$$| $$    $$  | $$     | $$  | $$  | $$| $$$$\ $$ \$$    \  \$$
-- | $$$$$$$$| $$\$$ $$  | $$  | $$\$$ $$ $$| $$$$$$$$  | $$     | $$  | $$  | $$| $$\$$ $$ _\$$$$$$\ __ 
-- | $$  | $$| $$ \$$$$ _| $$_ | $$ \$$$| $$| $$  | $$  | $$    _| $$_ | $$__/ $$| $$ \$$$$|  \__| $$|  \
-- | $$  | $$| $$  \$$$|   $$ \| $$  \$ | $$| $$  | $$  | $$   |   $$ \ \$$    $$| $$  \$$$ \$$    $$ \$$
--  \$$   \$$ \$$   \$$ \$$$$$$ \$$      \$$ \$$   \$$   \$$    \$$$$$$  \$$$$$$  \$$   \$$  \$$$$$$     
 
---@param Scenarios: Set below the Scenario/Animations when completing Tasks.

    PlaceGrillAnim = "PROP_HUMAN_BUM_BIN",
    PickupGrillAnim = "PROP_HUMAN_BUM_BIN",

    PlaceTentAnim = "PROP_HUMAN_BUM_BIN",
    PickupTentAnim = "PROP_HUMAN_BUM_BIN",

    PlaceChairAnim = "PROP_HUMAN_BUM_BIN",
    PickupChairAnim = "PROP_HUMAN_BUM_BIN",

    PlaceBedAnim = "PROP_HUMAN_BUM_BIN",
    PickupBedAnim = "PROP_HUMAN_BUM_BIN",

    PlaceCoolerAnim = "PROP_HUMAN_BUM_BIN",
    PickupCoolerAnim = "PROP_HUMAN_BUM_BIN",

    PlaceWoodAnim = "CODE_HUMAN_MEDIC_KNEEL",
    PutOutFireAnim = "CODE_HUMAN_MEDIC_KNEEL",

    CookGrillAnim = "PROP_HUMAN_BBQ",
    GrillTimer = 5000,

    CookFireAnim = "CODE_HUMAN_MEDIC_KNEEL",
    FireTimer = 5000,



---@param BagAnimation: To enable the use of backbacks animation set true then set bags below.

    enableBags = false, -- Enables Hiking Animation and Clothing Item Configured Below.
    
    FemaleBag = 14, -- Slot number of bags clothing item.
    FemaleBagTx = 0, -- Slot number of above clothing item texture.

    MaleBag = 18, -- Slot number of bags clothing item.
    MaleBagTx = 0, -- Slot number of above clothing item texture.

    HikeAnimDict = "move_m@hiking", -- Hiking Animation
    HikeAnim = "idle",




-- ______  __    __   ______   _______   ________  _______   ______  ________  __    __  ________   ______      
-- |      \|  \  |  \ /      \ |       \ |        \|       \ |      \|        \|  \  |  \|        \ /      \     
--  \$$$$$$| $$\ | $$|  $$$$$$\| $$$$$$$\| $$$$$$$$| $$$$$$$\ \$$$$$$| $$$$$$$$| $$\ | $$ \$$$$$$$$|  $$$$$$\ __ 
--   | $$  | $$$\| $$| $$ __\$$| $$__| $$| $$__    | $$  | $$  | $$  | $$__    | $$$\| $$   | $$   | $$___\$$|  \
--   | $$  | $$$$\ $$| $$|    \| $$    $$| $$  \   | $$  | $$  | $$  | $$  \   | $$$$\ $$   | $$    \$$    \  \$$
--   | $$  | $$\$$ $$| $$ \$$$$| $$$$$$$\| $$$$$   | $$  | $$  | $$  | $$$$$   | $$\$$ $$   | $$    _\$$$$$$\ __ 
--  _| $$_ | $$ \$$$$| $$__| $$| $$  | $$| $$_____ | $$__/ $$ _| $$_ | $$_____ | $$ \$$$$   | $$   |  \__| $$|  \
-- |   $$ \| $$  \$$$ \$$    $$| $$  | $$| $$     \| $$    $$|   $$ \| $$     \| $$  \$$$   | $$    \$$    $$ \$$
--  \$$$$$$ \$$   \$$  \$$$$$$  \$$   \$$ \$$$$$$$$ \$$$$$$$  \$$$$$$ \$$$$$$$$ \$$   \$$    \$$     \$$$$$$                                                                                                                                                                                                                          

---@param Ingredients: You can create more ingredients yourself and add them below. You can also change the amounts required per item.

    Cooking = {
        CampGrill = {
            { ['lccookedsteak']     = { ["lccampmeat"] = 1,     ['lccampbutta'] = 1,  ['lccampherbs'] = 1, },  ["amount"] = 2, },
            { ['lccookedcorn']      = { ["lccampcorn"] = 1,     ['lccampbutta'] = 1,  ['lccampherbs'] = 1, },  ["amount"] = 2, },
            { ['lccookedfish']      = { ["lccampfish"] = 1,     ['lccampbutta'] = 1,  ['lccampherbs'] = 1, },  ["amount"] = 2, },
            { ['lccookedbeans']     = { ["lccampbeans"] = 1,    ['lccampbutta'] = 1,  ['lccampherbs'] = 1, },  ["amount"] = 2, },            
        },
        CampFire = {
            { ['lcsmores']          = { ["lcmarshmellow"] = 1,  ['lcchocolate'] = 1,  ['lcgramcrkrs'] = 1, },  ["amount"] = 2, },
            { ['lccookedbeans']     = { ["lccampbeans"] = 1,    ['lccampbutta'] = 1,  ['lccampherbs'] = 1, },  ["amount"] = 2, },
            { ['lccookedpotato']    = { ["lccamppotato"] = 1,   ['lccampbutta'] = 1,  ['lccampherbs'] = 1, },  ["amount"] = 2, },
        }, 
    },




-- __    __  __    __  __    __   ______   ________  _______          ___            ________  __    __  ______  _______    ______  ________    
-- |  \  |  \|  \  |  \|  \  |  \ /      \ |        \|       \        /   \          |        \|  \  |  \|      \|       \  /      \|        \   
-- | $$  | $$| $$  | $$| $$\ | $$|  $$$$$$\| $$$$$$$$| $$$$$$$\      |  $$$\          \$$$$$$$$| $$  | $$ \$$$$$$| $$$$$$$\|  $$$$$$\\$$$$$$$$__ 
-- | $$__| $$| $$  | $$| $$$\| $$| $$ __\$$| $$__    | $$__| $$       \$$ $$__          | $$   | $$__| $$  | $$  | $$__| $$| $$___\$$  | $$  |  \
-- | $$    $$| $$  | $$| $$$$\ $$| $$|    \| $$  \   | $$    $$      | \$$$/  \         | $$   | $$    $$  | $$  | $$    $$ \$$    \   | $$   \$$
-- | $$$$$$$$| $$  | $$| $$\$$ $$| $$ \$$$$| $$$$$   | $$$$$$$\      | $$\$$ $$         | $$   | $$$$$$$$  | $$  | $$$$$$$\ _\$$$$$$\  | $$   __ 
-- | $$  | $$| $$__/ $$| $$ \$$$$| $$__| $$| $$_____ | $$  | $$      | $$_\$$\          | $$   | $$  | $$ _| $$_ | $$  | $$|  \__| $$  | $$  |  \
-- | $$  | $$ \$$    $$| $$  \$$$ \$$    $$| $$     \| $$  | $$       \$$  \$$\         | $$   | $$  | $$|   $$ \| $$  | $$ \$$    $$  | $$   \$$
--  \$$   \$$  \$$$$$$  \$$   \$$  \$$$$$$  \$$$$$$$$ \$$   \$$        \$$$$ $$          \$$    \$$   \$$ \$$$$$$ \$$   \$$  \$$$$$$    \$$      
 
---@param Consumables: Set below the math.random, min and max amount of hunger or thirst.
    -- ESX Consumable Fill Ratio: (Delete or comment out this section if using QBCore and use next section)
    EatsMeta = {
        ["lccookedsteak"]      = math.random(200000, 300000), -- ESX Set Math Random 
        ["lccookedcorn"]       = math.random(200000, 300000),
        ["lccookedfish"]       = math.random(200000, 300000),
        ["lccookedpotato"]     = math.random(200000, 300000),
        ["lcsmores"]           = math.random(200000, 300000),
    },    
    DrinksMeta = {
        ["lcherbtea"]          = math.random(200000, 300000),
        ["lcwater"]            = math.random(200000, 300000),
        ["lccampcoffee"]       = math.random(200000, 300000),            
    }, 
    BeansMeta = {
        ["lccookedbeans"]      = math.random(200000, 300000),            
    }, --]]

    --[[ QBCore Consumables Fill Ratio: (Leave commented out or delete this section if using QBCore and use above section)
    EatsMeta = {
        ["lccookedsteak"]      = math.random(20, 30),  
        ["lccookedcorn"]       = math.random(20, 30),
        ["lccookedfish"]       = math.random(20, 30),
        ["lccookedpotato"]     = math.random(20, 30),
        ["lcsmores"]           = math.random(20, 30),
    },    
    DrinksMeta = {
        ["lcherbtea"]          = math.random(20, 30),
        ["lcwater"]            = math.random(20, 30),
        ["lccampcoffee"]       = math.random(20, 30),            
    }, 
    BeansMeta = {
        ["lccookedbeans"]      = math.random(20, 30),            
    }, --]]


--   ______    ______   __       __  _______          ______    ______    ______   __        ________  _______      
--  /      \  /      \ |  \     /  \|       \        /      \  /      \  /      \ |  \      |        \|       \     
-- |  $$$$$$\|  $$$$$$\| $$\   /  $$| $$$$$$$\      |  $$$$$$\|  $$$$$$\|  $$$$$$\| $$      | $$$$$$$$| $$$$$$$\ __ 
-- | $$   \$$| $$__| $$| $$$\ /  $$$| $$__/ $$      | $$   \$$| $$  | $$| $$  | $$| $$      | $$__    | $$__| $$|  \
-- | $$      | $$    $$| $$$$\  $$$$| $$    $$      | $$      | $$  | $$| $$  | $$| $$      | $$  \   | $$    $$ \$$
-- | $$   __ | $$$$$$$$| $$\$$ $$ $$| $$$$$$$       | $$   __ | $$  | $$| $$  | $$| $$      | $$$$$   | $$$$$$$\ __ 
-- | $$__/  \| $$  | $$| $$ \$$$| $$| $$            | $$__/  \| $$__/ $$| $$__/ $$| $$_____ | $$_____ | $$  | $$|  \
--  \$$    $$| $$  | $$| $$  \$ | $$| $$             \$$    $$ \$$    $$ \$$    $$| $$     \| $$     \| $$  | $$ \$$
--   \$$$$$$  \$$   \$$ \$$      \$$ \$$              \$$$$$$   \$$$$$$   \$$$$$$  \$$$$$$$$ \$$$$$$$$ \$$   \$$    
                                                                                                                                                                                                                                                                                                                                                   
---@param CoolerShop: This is basically a portable store with the items listed below. Configure prices, add or remove items to your liking. 

    Cooler = {
        Stock = {
            label = "Cooler Supplies",
            slots = 13, 
            items = {
                { name = 'lcmarshmellow',  price = 10, amount = 200, info = {}, type = 'item', slot = 1, },
                { name = 'lcchocolate',    price = 10, amount = 200, info = {}, type = 'item', slot = 2, },
                { name = 'lcgramcrkrs',    price = 10, amount = 200, info = {}, type = 'item', slot = 3, },
                { name = 'lccampmeat',     price = 10, amount = 200, info = {}, type = 'item', slot = 4, },
                { name = 'lccampherbs',    price = 10, amount = 200, info = {}, type = 'item', slot = 5, },
                { name = 'lccampbeans',    price = 10, amount = 200, info = {}, type = 'item', slot = 6, },
                { name = 'lccampcorn',     price = 10, amount = 200, info = {}, type = 'item', slot = 7, },
                { name = 'lccamppotato',   price = 10, amount = 200, info = {}, type = 'item', slot = 8, },
                { name = 'lccampbutta',    price = 10, amount = 200, info = {}, type = 'item', slot = 9, },
                { name = 'lccampfish',     price = 10, amount = 200, info = {}, type = 'item', slot = 10, },
                { name = 'lcherbtea',      price = 10, amount = 200, info = {}, type = 'item', slot = 11, },
                { name = 'lcwater',        price = 10, amount = 200, info = {}, type = 'item', slot = 12, },
                { name = 'lccampcoffee',   price = 10, amount = 200, info = {}, type = 'item', slot = 13, },
            },
        },
    }
}




--  ______   __    __   ______  ________   ______   __       __        ________  __     __  ________  __    __  ________   ______      
-- /      \ |  \  |  \ /      \|        \ /      \ |  \     /  \      |        \|  \   |  \|        \|  \  |  \|        \ /      \     
-- |  $$$$$$\| $$  | $$|  $$$$$$\\$$$$$$$$|  $$$$$$\| $$\   /  $$      | $$$$$$$$| $$   | $$| $$$$$$$$| $$\ | $$ \$$$$$$$$|  $$$$$$\ __ 
-- | $$   \$$| $$  | $$| $$___\$$  | $$   | $$  | $$| $$$\ /  $$$      | $$__    | $$   | $$| $$__    | $$$\| $$   | $$   | $$___\$$|  \
-- | $$      | $$  | $$ \$$    \   | $$   | $$  | $$| $$$$\  $$$$      | $$  \    \$$\ /  $$| $$  \   | $$$$\ $$   | $$    \$$    \  \$$
-- | $$   __ | $$  | $$ _\$$$$$$\  | $$   | $$  | $$| $$\$$ $$ $$      | $$$$$     \$$\  $$ | $$$$$   | $$\$$ $$   | $$    _\$$$$$$\ __ 
-- | $$__/  \| $$__/ $$|  \__| $$  | $$   | $$__/ $$| $$ \$$$| $$      | $$_____    \$$ $$  | $$_____ | $$ \$$$$   | $$   |  \__| $$|  \
--  \$$    $$ \$$    $$ \$$    $$  | $$    \$$    $$| $$  \$ | $$      | $$     \    \$$$   | $$     \| $$  \$$$   | $$    \$$    $$ \$$
--   \$$$$$$   \$$$$$$   \$$$$$$    \$$     \$$$$$$  \$$      \$$       \$$$$$$$$     \$     \$$$$$$$$ \$$   \$$    \$$     \$$$$$$     
                                                                                                                                                                                                                                                                                                                                                                                                            
---@param Events: Configure your own events below or use the default stress relief event.

function CustomEventTent()
    return --TriggerServerEvent('hud:server:RelieveStress', math.random(7, 8)) -- Add your own event here. (Preconfigured for QBCore)
end

function CustomEventSitting()
    return --TriggerServerEvent('hud:server:RelieveStress', math.random(7, 8)) -- Add your own event here. (Preconfigured for QBCore)
end

function CustomEventLaying()
    return --TriggerServerEvent('hud:server:RelieveStress', math.random(7, 8)) -- Add your own event here. (Preconfigured for QBCore)
end




--  ______    ______   __       __  _______          ______   __    __   ______   _______      
-- /      \  /      \ |  \     /  \|       \        /      \ |  \  |  \ /      \ |       \     
-- |  $$$$$$\|  $$$$$$\| $$\   /  $$| $$$$$$$\      |  $$$$$$\| $$  | $$|  $$$$$$\| $$$$$$$\ __ 
-- | $$   \$$| $$__| $$| $$$\ /  $$$| $$__/ $$      | $$___\$$| $$__| $$| $$  | $$| $$__/ $$|  \
-- | $$      | $$    $$| $$$$\  $$$$| $$    $$       \$$    \ | $$    $$| $$  | $$| $$    $$ \$$
-- | $$   __ | $$$$$$$$| $$\$$ $$ $$| $$$$$$$        _\$$$$$$\| $$$$$$$$| $$  | $$| $$$$$$$  __ 
-- | $$__/  \| $$  | $$| $$ \$$$| $$| $$            |  \__| $$| $$  | $$| $$__/ $$| $$      |  \
--  \$$    $$| $$  | $$| $$  \$ | $$| $$             \$$    $$| $$  | $$ \$$    $$| $$       \$$
--   \$$$$$$  \$$   \$$ \$$      \$$ \$$              \$$$$$$  \$$   \$$  \$$$$$$  \$$          

---@param Shop: Below is the settings for the store, blip, and items in the store. Configure to your liking.

CampShop = {
    enableShop = true, -- If enabled, a ped will spawn at the PedCoords with all the items listed in Stock.
    PedModel = `a_m_y_hiker_01`,
    Scenario = 'WORLD_HUMAN_TOURIST_MAP',
    PedCoords = { coords = vector3(-1490.91, 4981.61, 63.33), heading = 83.96 }, -- Will also be the location of the blip if enabled below.

    enableBlip = true, -- Must enable shop above first.
    blipLabel = "Camping Store",
    blipSprite = 557,
    blipDisplay = 6,
    blipScale = 0.8,
    blipColor = 52, 

    Stock = {
        label = "Camping Supplies",
        slots = 19,
        items = {
            { name = 'lc_camptent',     price = 50, amount = 200, info = {}, type = 'item', slot = 1, }, -- Can pick up item.
            { name = 'lc_campchair',    price = 50, amount = 200, info = {}, type = 'item', slot = 2, }, -- Can pick up item.
            { name = 'lc_campbed',      price = 50, amount = 200, info = {}, type = 'item', slot = 3, }, -- Can pick up item.
            { name = 'lc_campcooler',   price = 50, amount = 200, info = {}, type = 'item', slot = 4, }, -- Can pick up item.
            { name = 'lc_campgrill',    price = 50, amount = 200, info = {}, type = 'item', slot = 5, }, -- Can pick up item.
            { name = 'lc_campwood',     price = 30, amount = 200, info = {}, type = 'item', slot = 6, }, -- Can NOT pick up item.

            { name = 'lcmarshmellow',   price = 5, amount = 200, info = {}, type = 'item', slot = 7, },
            { name = 'lcchocolate',     price = 5, amount = 200, info = {}, type = 'item', slot = 8, },
            { name = 'lcgramcrkrs',     price = 5, amount = 200, info = {}, type = 'item', slot = 9, },
            { name = 'lccampmeat',      price = 5, amount = 200, info = {}, type = 'item', slot = 10, },
            { name = 'lccampherbs',     price = 5, amount = 200, info = {}, type = 'item', slot = 11, },
            { name = 'lccampbeans',     price = 5, amount = 200, info = {}, type = 'item', slot = 12, },
            { name = 'lccampcorn',      price = 5, amount = 200, info = {}, type = 'item', slot = 13, },
            { name = 'lccamppotato',    price = 5, amount = 200, info = {}, type = 'item', slot = 14, },
            { name = 'lccampbutta',     price = 5, amount = 200, info = {}, type = 'item', slot = 15, },
            { name = 'lccampfish',      price = 5, amount = 200, info = {}, type = 'item', slot = 16, },
            { name = 'lcherbtea',       price = 5, amount = 200, info = {}, type = 'item', slot = 17, },
            { name = 'lcwater',         price = 5, amount = 200, info = {}, type = 'item', slot = 18, },
            { name = 'lccampcoffee',    price = 5, amount = 200, info = {}, type = 'item', slot = 19, },
        },
    },
}