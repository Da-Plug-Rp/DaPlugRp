Config = {}

Config.SkinMenu = {
    ['skinchanger'] = false,
    ['fivem-appearance'] = false,
    ['illenium-appearance'] = true
}

-- ComponentsId = 1,        -- mask
-- ComponentsId = 2,        -- torso
-- ComponentsId = 3,        -- pants
-- ComponentsId = 4,        -- bags
-- ComponentsId = 5,        -- shoes
-- ComponentsId = 6,        -- undershirt
-- ComponentsId = 7,        -- armor
-- ComponentsId = 8,       -- decals
-- ComponentsId = 9,       -- hats
-- ComponentsId = 10,       --glasses
-- ComponentsId = 11,       -- watches
-- ComponentsId = 12,       -- braclets

-- Here you can add more lashes to the menu
Config.Lashes = {
    ComponentId = 7, -- not touching
    Numbers = {
        --  { id = clotheid, max = maximumtexture},
        {id = 1, max = 4},
        {id = 2, max = 4},
        {id = 3, max = 4},
        {id = 4, max = 4}, 
        {id = 5, max = 4},
        {id = 6, max = 4},
        {id = 7, max = 4},
        {id = 11, max = 4},
        {id = 12, max = 4},
        {id = 13, max = 4},
        {id = 14, max = 1},
        {id = 15, max = 1},
        {id = 33, max = 0}

    }
}

-- Keybind for Job Menu to open billing and lashes menu
Config.JobMenuKey = 'F6'
 
Config.Saloons = { -- business
    ['lashes'] = {
        blip = {
            enable = true,
            title = 'Lashes Saloon',
            Sprite = 280,
            color = 48,
            scale = 1.0
        },
        boss = vector3(117.0043, -1335.1815, 29.4148 )
    }

}

Config.Shops = { -- non business
    price = 400,
    account = 'money', -- money , bank , black_money
    coords = {
    --    vector3(369.0590, -1095.7761, 29.4783)
    }
}

Config.Language = 'en'
Config.Languages = {
    ['en'] = {
        ['OPEN_MENU'] = 'Press E to Open Menu',
        ['JOB_MENU'] = 'Job Menu',
        ['LASHES_MENU'] = 'Lashes Menu',
        ['BILLING_MENU'] = 'Billing Menu',

        ['LANG_UI'] = {
            ['LASHES'] = 'Lashes',
            ['DIVISER'] = '/',
            ['LASHES_COLOR'] = 'Colour',
            ['BUTTON_SUCCESS'] = 'Success'
        }
    }
}

-- Draw marker types
Config.DrawMarker = {
    DrawDistance = 10.0,
    type = 20,
    size = {0.5, 0.5, 0.5},
    rgb = {46, 129, 183}
}

Config.Blip = {id = 1, color = 4, scale = 0.7}

-- Time animation in miliseconds
Config.Animation = {
    Dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
    Anim = 'machinic_loop_mechandplayer',
    TimeAnimation = 3000
}

Config.Billing = function(job)
    local playerid, playerped = lib.getClosestPlayer(GetEntityCoords(
                                                         PlayerPedId()), 3.0,
                                                     false)
    if playerid then
        local input = lib.inputDialog(GetPlayerName(playerid), {
            {type = 'number', label = 'Enter Bill Amount', icon = 'hashtag'}
        })

        if input then
            TriggerServerEvent('esx_billing:sendBill',
                               GetPlayerServerId(playerid), 'society_' .. job,
                               job, input[1])
        end
    end
end

Config.Boss = function(job)
    TriggerEvent('esx_society:openBossMenu', job,
                 function(menu) ESX.CloseContext() end, {wash = false})
end
