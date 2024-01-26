Config = {
    Framework = "esx", --[[ framework to use.
        * esx - es_extended (v1 legacy)
        * qb - qbcore
    ]]
    MenuSystem = "esx", --[[
        * esx - esx_menu_default
        * qb - qb-menu
        * zf - zf_context https://github.com/zf-development/zf_context
    ]]
    MenuAlign = "bottom-right", -- esx_menu_default align
    TargetSystem = "qtarget", --[[
        * qtarget
        * qb-target
    ]]
    BrowseStyle = "browse", --[[
        * menu - a menu where you select the vehicle
        * browse - you will sit inside the vehicle and you can use the arrow keys to change vehicle
    ]]
    GarageStyle = "garage", --[[
        * garage - one circle to take out vehicle (retrieve), one circle to store vehicles (store), and a location where vehicles spawn (spawn) 
        * parking - multiple parking lots, use qtarget or qb-target to retrieve/store vehicle
    ]]

    PingAlreadyOut = true, -- should the vehicle be pinged if it is already out? false = don't ping, true = ping
    IndependentGarage = false, -- should you only be able to take out the car from the garage you stored it at?
    SaveDamages = true, -- https://www.youtube.com/watch?v=-gAgVyG7vJw Requires https://github.com/Kiminaze/VehicleDeformation
    DebugPoly = false, -- debug poly for qtarget / qb-target
    Passive = false, -- should vehicles be made "passive" (no collision) when taking them out?
    SpawnServer = false, -- should the vehicle be spawned server side? 
    SetImpoundedRetrieve = true,
    Impound = {
        enabled = true, -- enable impounds?
        price = 1000, -- the price to retrieve a vehicle from the impound
    },

    Blip = {
        garage = {
            sprite = 357,
            color = 3,
            scale = 0.75,
        },
        impound = {
            sprite = 67,
            color = 47,
            scale = 0.75,
        },
    },
    
    Garages = {
        ["motel"] = {
            retrieve = vector3(277.37646484375, -345.60275268555, 43.919891357422),
            spawn = vector4(290.06335449219, -339.18823242188, 44.506492614746, 156.48341369629),
            store = vector3(274.81018066406, -330.51040649414, 43.923034667969),
            vehicleTypes = {"car"},
            jobs = "civ", -- civ = only show vehicles without job in db. all = show all vehicles. you can also put a table with the allowed job vehicles, e.g.: {"police"}

            parkingLots = {
                vector4(266.17074584961, -332.22232055664, 44.49560546875, 250.17141723633),
                vector4(267.50012207031, -328.89996337891, 44.495601654053, 249.36679077148),
                vector4(268.79653930664, -325.70404052734, 44.4953956604, 249.70141601563),
                vector4(270.00717163086, -322.50653076172, 44.495899200439, 248.99468994141),
                vector4(270.97381591797, -319.23361206055, 44.495922088623, 249.1252746582),
                vector4(283.03857421875, -323.7873840332, 44.495681762695, 69.344871520996),
                vector4(281.77841186523, -327.06588745117, 44.495906829834, 69.702278137207),
                vector4(280.61965942383, -330.29125976563, 44.496337890625, 70.277946472168),
                vector4(279.57043457031, -333.63519287109, 44.495624542236, 70.283752441406),
                vector4(278.54858398438, -336.93417358398, 44.495487213135, 68.249633789063),
                vector4(277.59622192383, -340.21615600586, 44.496185302734, 68.87353515625),
                vector4(289.13952636719, -326.17449951172, 44.495029449463, 251.67984008789),
                vector4(288.20220947266, -329.30221557617, 44.495826721191, 248.34872436523),
                vector4(286.91821289063, -332.56475830078, 44.495872497559, 249.02827453613), 
                vector4(285.82528686523, -335.71481323242, 44.495780944824, 250.47790527344),
                vector4(284.76864624023, -339.08660888672, 44.495586395264, 250.08279418945),
                vector4(283.38931274414, -342.39611816406, 44.495704650879, 250.6480255127),
                vector4(300.0537109375, -330.12924194336, 44.495140075684, 70.874855041504),
                vector4(298.76043701172, -333.23919677734, 44.495574951172, 68.070129394531),
                vector4(297.87664794922, -336.53680419922, 44.495807647705, 68.751419067383),
                vector4(296.37661743164, -339.75686645508, 44.495864868164, 70.944961547852),
                vector4(295.32186889648, -342.93341064453, 44.49524307251, 70.466506958008),
                vector4(294.1520690918, -346.20217895508, 44.495761871338, 68.633094787598),
                vector4(293.28854370117, -349.62084960938, 44.514511108398, 69.956901550293),
            },
        },
        ["Pillbox Garage"] = {
            retrieve = vector3(215.4738, -809.7433, 30.0000),
            spawn = vector4(229.9207, -799.1450, 30.5769, 155.6246),
            store = vector3(216.1404, -786.0403, 30.0000),
            vehicleTypes = {"car"},
            jobs = "civ",
            
            parkingLots = {
                vector4(446.15393066406, -1024.90234375, 28.229749679565, 3.3737599849701),
                vector4(442.43511962891, -1025.4991455078, 28.305545806885, 6.4385643005371),
                vector4(438.65930175781, -1025.73828125, 28.375896453857, 3.7558765411377),
                vector4(434.86602783203, -1025.9569091797, 28.443691253662, 5.851438999176),
                vector4(431.13177490234, -1026.5302734375, 28.515933990479, 8.9433498382568),
                vector4(427.59909057617, -1026.4479980469, 28.571384429932, 3.5505225658417),
            },
        },
        ["Rord Ford Garage"] = {
            retrieve = vector3(-342.4792, -226.7340, 36.9400),
            spawn = vector4(-336.8585, -217.2438, 38.1263, 322.2143),
            store = vector3(-330.4434, -224.9572, 36.9109),
            vehicleTypes = {"car"},
            jobs = "civ",
            
            parkingLots = {
                vector4(446.15393066406, -1024.90234375, 28.229749679565, 3.3737599849701),
                vector4(442.43511962891, -1025.4991455078, 28.305545806885, 6.4385643005371),
                vector4(438.65930175781, -1025.73828125, 28.375896453857, 3.7558765411377),
                vector4(434.86602783203, -1025.9569091797, 28.443691253662, 5.851438999176),
                vector4(431.13177490234, -1026.5302734375, 28.515933990479, 8.9433498382568),
                vector4(427.59909057617, -1026.4479980469, 28.571384429932, 3.5505225658417),
            },
        },
        ["Paleto Bay Garage"] = {
            retrieve = vector3(84.9278, 6421.3618, 30.5283),
            spawn = vector4(88.7968, 6423.0693, 30.3687, 41.7221),
            store = vector3(79.8926, 6416.7915, 30.2783),
            vehicleTypes = {"car"},
            jobs = "civ",
            
            parkingLots = {
                vector4(446.15393066406, -1024.90234375, 28.229749679565, 3.3737599849701),
                vector4(442.43511962891, -1025.4991455078, 28.305545806885, 6.4385643005371),
                vector4(438.65930175781, -1025.73828125, 28.375896453857, 3.7558765411377),
                vector4(434.86602783203, -1025.9569091797, 28.443691253662, 5.851438999176),
                vector4(431.13177490234, -1026.5302734375, 28.515933990479, 8.9433498382568),
                vector4(427.59909057617, -1026.4479980469, 28.571384429932, 3.5505225658417),
            },
        },
        ["Sandy Shores Garage"] = {
            retrieve = vector3(1966.5328, 3781.8101, 31.2053),
            spawn = vector4(1963.3698, 3766.4844, 31.1965, 26.5572),
            store = vector3(1950.1647, 3758.3530, 31.2054),
            vehicleTypes = {"car"},
            jobs = "civ",
            
            parkingLots = {
                vector4(446.15393066406, -1024.90234375, 28.229749679565, 3.3737599849701),
                vector4(442.43511962891, -1025.4991455078, 28.305545806885, 6.4385643005371),
                vector4(438.65930175781, -1025.73828125, 28.375896453857, 3.7558765411377),
                vector4(434.86602783203, -1025.9569091797, 28.443691253662, 5.851438999176),
                vector4(431.13177490234, -1026.5302734375, 28.515933990479, 8.9433498382568),
                vector4(427.59909057617, -1026.4479980469, 28.571384429932, 3.5505225658417),
            },
        },
        ["Docks"] = {
            retrieve = vector3(-845.70098876953, -1497.6790771484, 0.6341668367386),
            spawn = vector4(-840.52972412109, -1485.4296875, -1.11102887988091, 202.31701660156),
            store = vector3(-847.10943603516, -1469.4711914063, -0.34531825780869),
            vehicleTypes = {"boat"},
            jobs = "all",

            parkingLots = {},
        },
        ["LSIA"] = {
            retrieve = vector3(-992.14, -2955.46, 13.0),
            spawn = vector4(-990.87, -2967.83, 13.9, 59.52),
            store = vector3(-1011.62, -3009.13, 13.0),
            vehicleTypes = {"airplane", "plane", "aircraft"},
            jobs = "all",
            parkingLots = {
                vector4(-990.87, -2967.83, 13.9, 59.52),
            }
        }
    },

    Impounds = {
        {
            retrieve = vector3(-191.1160, -1166.1837, 22.6714), -- where you open the menu to retrieve the car
            spawn = vector4(-153.1200, -1169.6193, 23.7696, 268.3277), -- where the car spawns
            vehicleTypes = {"car"},
        },
        {
            retrieve = vector3(-1615.52, -3137.48, 13.00), -- where you open the menu to retrieve the plane
            spawn = vector4(-1654.096, -3146.48, 13.57, 329.89), -- where the plane spawns
            vehicleTypes = {"airplane", "plane", "aircraft"},
        },
        {
            retrieve = vector3(-944.03, -1375.26, 0.6), -- where you open the menu to retrieve the plane
            spawn = vector4(-947.69, -1365.79, 0.0, 290.0), -- where the plane spawns
            vehicleTypes = {"boat"},
        },
    },
}
