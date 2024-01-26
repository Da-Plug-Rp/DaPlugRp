Config = {}
-- DISCORD : https://discord.gg/zcG9KQj3sa
-- STORE : https://store.devcore.cz/

Config.PlaceItems = {} -- DONT TOUCH --

-- ESX --
Config.EsxExport = function()
    return exports['es_extended']:getSharedObject()
end

-- MAIN --
Config.SaveDB = true -- Storing placed items in the database (after restarting the server/script the items remain on the ground)
Config.DisableCombatButtons = true -- Deactivate combat buttons when consuming
Config.AutoTake = { -- only for ox_inventory
    enable = false, -- true if the set items are to be used automatically if they are found in the inventory.
    items = { -- The listed items are automatically placed in your hand if they are in inventory and the item is not returned when you press the x button.
        'cola',
        'coffe',
        'sprunk'
    },
}

-- BUTTONS --
Config.Buttons = {
    Use = 38, -- Button for consumption
    AutoConsume = 58, -- Button for automatic consumption
    Give = 10, -- Button to give the item to the player
    PlaceDistance = {scrollup = 50, scrolldown = 99},
    Place = 11, -- Button to place an item on the ground
    Hide = 105, -- Button to cancel consumption
    Accept = 38, -- Button to confirm that the item will be placed on the ground, Button to confirm the give of the item to the player 
    Take = 38, -- Button to pick up an item from the ground
    Pour = 172, -- Button for pouring drinks into glasses
    Back = 105 -- Button to return from the menu to place the item on the ground and give the item to the player
}

-- MENU CUSTOMIZE --
Config.Menu = {
    ['MAIN'] = {
        TextFont = 4,
        TextColor = {255, 255, 255},
        Scale = 0.4,
        Position = {x = 0.50, y = 0.95},
        Background = {
            enable = true,
            color = { r = 35, g = 35, b = 35, alpha = 200 },
        },
    },
    ['STATUS'] = {
        TextFont = 4,
        TextColor = {255, 255, 255},
        Scale = 0.4,
        Position = {x = 0.94, y = 0.94},
        Background = {
            enable = true,
            color = { r = 35, g = 35, b = 35, alpha = 200 },
        },
    },
    ['INFO'] = {
        TextFont = 4,
        TextColor = {255, 255, 255},
        Scale = 0.4,
        Position = {x = 0.94, y = 0.90},
        Background = {
            enable = true,
            color = { r = 35, g = 35, b = 35, alpha = 200 },
        },
    },

}

-- NOTIFY --
Config.Notify = function(message, type)

    ESX.ShowNotification(message, 2000, type)

end


-- MENU FUNCTION --
Config.CustomMenu = function(text, menuid) -- menuid is only for Realistic needs default menu 

    Draw2DNeedsMenu(text, menuid)

end

-- STATUS -- Default triggers work only for esx_basicneeds and esx_status so for proper functioning don't forget to have the scripts enabled
Config.Status = { --Settings for adding food, drink, alcohol and removing stress
    ["FOOD"] = function(data) -- Trigger to increase hunger status
        TriggerEvent('esx_status:add', 'hunger', data.Consume.Status) -- Default triggers work only for esx_basicneeds and esx_status so for proper functioning don't forget to have the scripts enabled
    end,
    ["DRINK"] = function(data) -- Trigger to increase thirst status
        TriggerEvent('esx_status:add', 'thirst', data.Consume.Status) -- Default triggers work only for esx_basicneeds and esx_status so for proper functioning don't forget to have the scripts enabled
    end,
    ["STRESS"] = function(data) -- Trigger to increase stress status
         TriggerEvent('esx_status:remove', 'stress', data.Consume.Stress) 
    end,
    ["ALCOHOL"] = function(data)
        setAlcohol(data.Consume.Alcohol)
    end,
}

-- DRUNK SYSTEM -- 
Config.DrunkSystem = {
    TesterItem = 'alcotester', -- Item name for breath test
    ResultTime = 3, -- Duration per breath test result in seconds
    Driving = true, -- Difficult driving under the influence of alcohol
    DisableSprint = true, -- No sprinting while drunk walking
    Ragdoll = true, --true if you want a drunk player to occasionally fall to the ground while walking.
    MaxDrunk = 2.3, -- blood alcohol limit
    Time = 10, -- Effect update time in seconds
    Remove = 0.02, -- Removal of alcohol from the blood after updating the effect
    Effect = "spectator5", -- Effect of drunkenness
    MovementTime = 3, -- -- the lower the time you give the harder it will be for the drunk driver to drive the vehicle
    RandomVehicleInteraction = { -- Drunk driving interactions
        {interaction = 10, time = 300}, --turn left and restore wheel pos
        {interaction = 11, time = 300}, --turn right and restore wheel pos
        {interaction = 10, time = 500}, --turn left and restore wheel pos
        {interaction = 11, time = 500}, --turn right and restore wheel pos
    },
}

-- MENU AND TEXT --
Translations = {
    ['MENU'] = {
        ['use_menu'] = '~g~[E]~w~ Use ~g~[G]~w~ Auto ~g~[PGUP]~w~ Give ~g~[PGDN]~w~ Place ~g~[X]~w~ Hide',
        ['empty_glass'] = '~g~[PGUP]~w~ Give ~g~[PGDN]~w~ Place ~g~[X]~w~ Hide',
        ['back'] = '~g~[X]~w~ Back',
        ['give_menu'] = '~g~[E]~w~ Give ~g~[X]~w~ Back',
        ['place_menu'] = '~g~[E]~w~ Place ~g~[SCROLL]~w~ Distance ~g~[X]~w~ Back',
        ['item_placed_menu'] = '~g~[E]~w~ Take',
        ['pour_menu'] = '~g~[AUP]~w~ Pour',
        ['tester_menu'] = '~g~[E]~w~ Use ~g~[X]~w~ Hide',
    },
    ['TEXT'] = { 
        ['already'] = 'You already have something in your hand',
        ['player_already'] = 'The player is already consuming something',
        ['max_drunk'] = 'Im drunk enough',
        ['add_content'] = 'How much add ml into ',
        ['large_number'] = 'Its not possible to pour more into a glass than will fit',
        ['dont_have_ml'] = 'Thats how many ml you dont have in the bottle',
        ['item_cannot_be_poured'] = 'This item cannot be poured into a glass',
        ['item_in_glass'] = 'There is a different type of drink in the glass than the one you want to pour',
        ['no_near_you'] = 'Theres no one near you',
        ['result'] = 'Result: ',
        ['request_rejected'] = 'The person refused the request for a breath test',
        ['request_text'] = 'Request for breath test',
        ['pour_menu_title'] = 'Choose what you want to pour into the ',
        ['waiting'] = ' Waiting..',
    },
}