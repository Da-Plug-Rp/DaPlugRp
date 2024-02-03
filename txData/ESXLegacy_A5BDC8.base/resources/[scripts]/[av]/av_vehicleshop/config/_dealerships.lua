-- The garage field was fullfiled using the QBCore garage names, if you are using ESX or other QBCore garage system make sure to write the correct garage name where the vehicle will be stored after purchase.

Config.Dealerships = {
    ['pdm_dealership'] = { -- dealership key index, should be unique for each dealership.
        job = false, -- Job ("string") or false
        garage = "Legion Square", -- Where the vehicle will be stored.
        money_account = "bank", -- Account used for purchase.
        money_sign = "$", -- For price display of the vehicle: $, €, £, ¥, etc... or leave it empty ""
        categories = {"compact", "coupe", "cycle", "motorcycle", "muscle", "offroad", "openwheel", "sedan", "service", "sport"}, -- Categories the dealership can sell.
        test_vehicles = true, -- False if you don't want players be able to test vehicles... prevent trolls from testing helicopters and crashing?.
        test_coords = {x = -12.65, y = -1088.88, z = 27.04, h = 156.6}, -- Where the test vehicle spawns.
        text_zones = { -- Zones where clients can access the catalogue.
            {x = -40.63, y = -1094.69, z = 27.27, distance = 2.0},
            {x = -38.56, y = -1100.12, z = 27.27, distance = 2.0},
            {x = -46.82, y = -1095.8, z = 27.27, distance = 2.0},
            {x = -51.38, y = -1094.86, z = 27.27, distance = 2.0},
            {x = -51.21, y = -1087.35, z = 27.27, distance = 2.0},
        },
        preview_vehicle_coords = {x = -49.8425, y = -1084.1154, z = 27.3023, h = 160.0492}, -- Spawn coords for vehicle preview (x, y, z, heading)
        preview_vehicle_camera = {x = -49.6597, y = -1083.3295, z = 27.3023, rotation = 180.0, fov = 50.0}, -- Camera coords, rotation and field of view
        buy_vehicle = true, -- Enable/Disable the buy vehicle option... maybe you just want a dealership to display vehicles and not sell them?
        purchased_vehicle_spawn = {x = -33.82, y = -1080.45, z = 27.04, h = 68.2}, -- Where the vehicle/player will be spawned after purchased a vehicle.
        av_vip = false, -- True = If player has VIP the Buy Vehicle button will be enabled, false = you don't need VIP. Requires: https://av-scripts.tebex.io/package/4422968
        blip = {
            label = "PDM Dealership",
            icon = 227, -- https://docs.fivem.net/docs/game-references/blips/#blips
            color = 5, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
            scale = 0.7,
            coords = {x = -46.62, y = -1094.36, z = 27.3}
        }
    },
    ['luxuary Autos'] = { -- dealership key index, should be unique for each dealership.
    job = false, -- Job ("string") or false
    garage = "Legion Square", -- Where the vehicle will be stored.
    money_account = "bank", -- Account used for purchase.
    money_sign = "$", -- For price display of the vehicle: $, €, £, ¥, etc... or leave it empty ""
    categories = {"super"}, -- Categories the dealership can sell.
    test_vehicles = true, -- False if you don't want players be able to test vehicles... prevent trolls from testing helicopters and crashing?.
    test_coords = {x = 151.9082, y = -120.4674, z = 54.8260, h = 147.6277}, -- Where the test vehicle spawns.
    text_zones = { -- Zones where clients can access the catalogue.
        {x = 126.6416, y = -143.9712, z = 54.8001, distance = 2.0},   
    },
    preview_vehicle_coords = {x = 137.9162, y = -149.7049, z = 55.0500, h = 105.1593}, -- Spawn coords for vehicle preview (x, y, z, heading) 
    preview_vehicle_camera = {x = 133.4337, y = -1083.3295, z = -151.3341, rotation = 180.0, fov = 50.0}, -- Camera coords, rotation and field of view 
    buy_vehicle = false, -- Enable/Disable the buy vehicle option... maybe you just want a dealership to display vehicles and not sell them?
    purchased_vehicle_spawn = {x = 111.5689, y = -127.6865, z = 54.7473, h = 69.5225}, -- Where the vehicle/player will be spawned after purchased a vehicle.
    av_vip = false, -- True = If player has VIP the Buy Vehicle button will be enabled, false = you don't need VIP. Requires: https://av-scripts.tebex.io/package/4422968
    blip = {
        label = "luxuary Autos",
        icon = 227, -- https://docs.fivem.net/docs/game-references/blips/#blips
        color = 5, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        scale = 1.0,
        coords = {x = 124.9317, y = -152.3213, z = 54.8001,}
    }
},
['Sanders Motorcycles'] = { -- dealership key index, should be unique for each dealership.
job = false, -- Job ("string") or false
garage = "Legion Square", -- Where the vehicle will be stored.
money_account = "bank", -- Account used for purchase.
money_sign = "$", -- For price display of the vehicle: $, €, £, ¥, etc... or leave it empty ""
categories = {"cycle"}, -- Categories the dealership can sell.
test_vehicles = true, -- False if you don't want players be able to test vehicles... prevent trolls from testing helicopters and crashing?.
test_coords = {x = 337.4831, y = -1156.8979, z = 29.2920, h =  89.6681}, -- Where the test vehicle spawns. 
text_zones = { -- Zones where clients can access the catalogue.
    {x =  288.4178, y = -1163.6416, z = 29.2729, distance = 2.0},  
},
preview_vehicle_coords = {x = 287.5910, y = -1155.7148, z = 29.2728, h = 176.9707}, -- Spawn coords for vehicle preview (x, y, z, heading)
preview_vehicle_camera = {x = 287.9727, y = -1159.6130, z =  29.2729, rotation = 180.0, fov = 50.0}, -- Camera coords, rotation and field of view 
buy_vehicle = false, -- Enable/Disable the buy vehicle option... maybe you just want a dealership to display vehicles and not sell them?
purchased_vehicle_spawn = {x = 111.5689, y = -127.6865, z = 54.7473, h = 69.5225}, -- Where the vehicle/player will be spawned after purchased a vehicle.
av_vip = false, -- True = If player has VIP the Buy Vehicle button will be enabled, false = you don't need VIP. Requires: https://av-scripts.tebex.io/package/4422968
blip = {
    label = "Sanders Motorcycles",
    icon = 227, -- https://docs.fivem.net/docs/game-references/blips/#blips
    color = 5, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
    scale = 1.0,
    coords = {x = 287.9704, y = -1159.5381, z = 29.2729,}
}
},
    ['boat_dealership'] = { -- dealership key index, should be unique for each dealership.
        job = false, -- Job ("string") or false
        garage = "millars", -- Where the vehicle will be stored.
        money_account = "bank", -- Account used for purchase.
        money_sign = "$", -- For price display of the vehicle: $, €, £, ¥, etc... or leave it empty ""
        categories = {"boats"}, -- Categories the dealership can sell.
        test_vehicles = false, -- False if you don't want players be able to test vehicles... prevent trolls from testing helicopters and crashing?.
        test_coords = {x = -721.65, y = -1344.16, z = 0.0, h = 134.67}, -- Where the test vehicle spawns.
        text_zones = { -- Zones where clients can access the catalogue.
            {x = -711.77, y = -1299.29, z = 5.4, distance = 3.0},
        },
        preview_vehicle_coords = {x = -720.05, y = -1344.16, z = -0.50, h = 134.67}, -- Spawn coords for vehicle preview (x, y, z, heading)
        preview_vehicle_camera = {x = -712.16, y = -1350.44, z = 1.50, rotation = 50.0, fov = 50.0}, -- Camera coords, rotation and field of view
        buy_vehicle = true, -- Enable/Disable the buy vehicle option... maybe you just want a dealership to display vehicles and not sell them?
        purchased_vehicle_spawn = {x = -734.97, y = -1362.08, z = 0.0, h = 138.3}, -- Where the vehicle/player will be spawned after purchased a vehicle.
        av_vip = false, -- True = If player has VIP the Buy Vehicle button will be enabled, false = you don't need VIP. Requires: https://av-scripts.tebex.io/package/4422968
        blip = {
            label = "Boats Dealership",
            icon = 371, -- https://docs.fivem.net/docs/game-references/blips/#blips
            color = 5, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
            scale = 0.7,
            coords = {x = -711.77, y = -1299.29, z = 5.4}
        }
    },
    ['pegasus_dealership'] = { -- dealership key index, should be unique for each dealership.
        job = false, -- Job ("string") or false
        garage = "higginsheli", -- Where the vehicle will be stored.
        money_account = "bank", -- Account used for purchase.
        money_sign = "$", -- For price display of the vehicle: $, €, £, ¥, etc... or leave it empty ""
        categories = {"helicopter"}, -- Categories the dealership can sell.
        test_vehicles = false, -- False if you don't want players be able to test vehicles... prevent trolls from testing helicopters and crashing?.
        test_coords = {x = -721.65, y = -1344.16, z = 0.0, h = 134.67}, -- Where the test vehicle spawns.
        text_zones = { -- Zones where clients can access the catalogue.
            {x = -703.91, y = -1398.27, z = 5.5, distance = 3.0},
        },
        preview_vehicle_coords = {x = -724.95, y = -1443.78, z = 5.0, h = 230.23}, -- Spawn coords for vehicle preview (x, y, z, heading)
        preview_vehicle_camera = {x = -716.39, y = -1433.79, z = 5.0, rotation = 140.0, fov = 60.0}, -- Camera coords, rotation and field of view
        buy_vehicle = true, -- Enable/Disable the buy vehicle option... maybe you just want a dealership to display vehicles and not sell them?
        purchased_vehicle_spawn = {x = -745.06, y = -1468.35, z = 5.0, h = 140.98}, -- Where the vehicle/player will be spawned after purchased a vehicle.
        av_vip = false, -- True = If player has VIP the Buy Vehicle button will be enabled, false = you don't need VIP. Requires: https://av-scripts.tebex.io/package/4422968
        blip = {
            label = "Pegasus Dealership",
            icon = 370, -- https://docs.fivem.net/docs/game-references/blips/#blips
            color = 5, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
            scale = 0.7,
            coords = {x = -703.91, y = -1398.27, z = 5.5}
        }
    },
    ['mrpd_dealership'] = { -- dealership key index, should be unique for each dealership.
        job = false, -- Job ("string") or false
        garage = "mrpd", -- Where the vehicle will be stored.
        money_account = "bank", -- Account used for purchase.
        money_sign = "$", -- For price display of the vehicle: $, €, £, ¥, etc... or leave it empty ""
        categories = {"lspd"}, -- Categories the dealership can sell.
        test_vehicles = true, -- False if you don't want players be able to test vehicles... prevent trolls from testing helicopters and crashing?.
        test_coords = {x = 412.65, y = -1068.67, z = 29.3, h = 84.35}, -- Where the test vehicle spawns.
        text_zones = { -- Zones where clients can access the catalogue.
            {x = 458.09, y =  -986.57, z = 25.7, distance = 3.0},			
        },
        preview_vehicle_coords = {x = 458.81, y = -993.17, z = 25.7, h = 0.15}, -- Spawn coords for vehicle preview (x, y, z, heading)
        preview_vehicle_camera = {x = 454.81, y = -993.17, z = 26, rotation = 140.0, fov = 60.0}, -- Camera coords, rotation and field of view
        buy_vehicle = true, -- Enable/Disable the buy vehicle option... maybe you just want a dealership to display vehicles and not sell them?
        purchased_vehicle_spawn = {x = 441.75, y = -1014.06, z = 28.65, h = 92.49}, -- Where the vehicle/player will be spawned after purchased a vehicle.
        av_vip = false, -- True = If player has VIP the Buy Vehicle button will be enabled, false = you don't need VIP. Requires: https://av-scripts.tebex.io/package/4422968
        blip = {
            label = "MRPD Dealership",
            icon = 370, -- https://docs.fivem.net/docs/game-references/blips/#blips
            color = 5, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
            scale = 0.7,
            coords = {x = 459.50, y = -986.48, z = 25.7, distance = 3.0}
        }
    }
}