Shared = {
    Locale = 'en',

    Notify = {
        duration = 5000, -- miliseconds
        position = 'top-right' -- 'top' or 'top-right' or 'top-left' or 'bottom' or 'bottom-right' or 'bottom-left' or 'center-right' or 'center-left'
    },
    
    Logs = {
        enabled = true,
        webhook = '',
        servername = 'Uniq Scripts',
        color = 6579450,
        icon_url = 'https://dunb17ur4ymx4.cloudfront.net/webstore/logos/248d77847b320034db12949cf577772b654daadd.png'
    },

    Commands = {
        adminpanel = {
            name = 'adsadmin',              -- command for accessing admin panel
            restricted = 'group.admin',     -- group that will have access to the command 
        }
    },

    Keys = { -- https://docs.fivem.net/docs/game-references/controls/
        finish = 191,
        cancel = 194,
    },

    Duration = { -- advertisement duration configuration
        min = 1,
        max = 7,
    },
    
    Currency = '$',
    MaxAdPrice = 50000000, -- the maximum price the poster can input on the ad

    PromotionPrice = 2000, -- price per promotion day (5 days = 10000 if PromotionPrice is 2000)

    RPName = true, -- if false steam/rockstar name will be used in contact details

    Target = {
        ped = 'a_m_y_business_02', -- https://docs.fivem.net/docs/game-references/ped-models/
        coords = vector4(-599.2646, -933.6917, 23.8644, 100.2251),
        distance = 3
    },

    Blip = { -- https://docs.fivem.net/docs/game-references/blips/
        id = 459,
        scale = .8,
        colour = 7,
        label = 'Ad Board'
    }
}

-- Framework
ESX = exports["es_extended"]:getSharedObject()