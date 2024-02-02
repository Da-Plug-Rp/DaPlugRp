-- █████╗ ██████╗ ███████╗██╗  ██╗    ███████╗████████╗██╗   ██╗██████╗ ██╗ ██████╗ ███████╗
--██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝    ██╔════╝╚══██╔══╝██║   ██║██╔══██╗██║██╔═══██╗██╔════╝
--███████║██████╔╝█████╗   ╚███╔╝     ███████╗   ██║   ██║   ██║██║  ██║██║██║   ██║███████╗
--██╔══██║██╔═══╝ ██╔══╝   ██╔██╗     ╚════██║   ██║   ██║   ██║██║  ██║██║██║   ██║╚════██║
--██║  ██║██║     ███████╗██╔╝ ██╗    ███████║   ██║   ╚██████╔╝██████╔╝██║╚██████╔╝███████║
--╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝    ╚══════╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ ╚══════╝

----------------------------------------------------------------------------------------------------
   
-- ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗         ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
--██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██║         ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
--██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██║         ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
--██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║         ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
--╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║███████╗    ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
-- ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

Config = {}
Config.Debug = false


--     ██╗ ██████╗ ██████╗     ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
--     ██║██╔═══██╗██╔══██╗    ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
--     ██║██║   ██║██████╔╝    ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
--██   ██║██║   ██║██╔══██╗    ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
--╚█████╔╝╚██████╔╝██████╔╝    ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
-- ╚════╝  ╚═════╝ ╚═════╝     ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

Config.Access = {
    job = { -- Recommended for job limitations
        enabled = false,
        job = "ammunition",
    },
    gang = { -- Recommended for gang limitations
        enabled = false,
        gang = "gangname",
    },
    all = { -- Recommended for most servers (Allows everyone to access the factory)
        enabled = true,
    },
}

Config.Blips = {
    -- Paleto Bay
    {
        enabled = true, point = vector3(-54.85, 6428.31, 31.29),
        sprite = 478, scale = 0.8, colour = 78, title = "Paleto Bay - Weapon Manufacturer",
    },
    -- Los Santos
    {
        enabled = true, point = vector3(9.2028, -1103.1265, 29.0955),
        sprite = 478, scale = 0.8, colour = 78, title = "Strawberry - Weapon Manufacturer",
    },
    -- Cypress Flats
    {
        enabled = true, point = vector3(863.92, -2383.35, 30.15),
        sprite = 478, scale = 0.8, colour = 78, title = "Cypress Flats - Weapon Manufacturer",
    },
}

Config.Features = {
    Materials = true,
    MaterialsSettings = {
        shelves = {
            label = "Materials",
            slots = 15,
            items = {
                { name = "weapon_case",                     price = 10, amount = 100, info = {}, type = "item", slot = 1, },
                { name = "weapon_blueprint_pistol",         price = 10, amount = 100, info = {}, type = "item", slot = 2, },
                { name = "weapon_blueprint_snspistol",      price = 10, amount = 100, info = {}, type = "item", slot = 3, },
                { name = "weapon_blueprint_vintagepistol",  price = 10, amount = 100, info = {}, type = "item", slot = 4, },
                { name = "weapon_blueprint_appistol",       price = 10, amount = 100, info = {}, type = "item", slot = 5, },
                { name = "weapon_blueprint_pistol50",       price = 10, amount = 100, info = {}, type = "item", slot = 6, },
                { name = "weapon_blueprint_heavypistol",    price = 10, amount = 100, info = {}, type = "item", slot = 7, },
                { name = "weapon_blueprint_microsmg",       price = 10, amount = 100, info = {}, type = "item", slot = 8, },
                { name = "weapon_blueprint_minismg",        price = 10, amount = 100, info = {}, type = "item", slot = 9, },
                { name = "weapon_blueprint_sawnoffshotgun", price = 10, amount = 100, info = {}, type = "item", slot = 10, },
                { name = "weapon_blueprint_assaultrifle",   price = 10, amount = 100, info = {}, type = "item", slot = 11, },
                -- { name = "itemname", price = 0, amount = 0, info = {}, type = "item", slot = 11, },
            },
        },
    },

    Production = true,
    ProductionSettings = {
        WeaponMakingDuration = 10, -- Duration in seconds
        Stations = {
            CuttingStation = {
                {
                    label = "Pistol Frame",
                    materials = {
                        {name = "steel", amount = 1},
                        {name = "weapon_blueprint_pistol", amount = 1},
                    },
                    output = {
                        {name = "pistol_frame", amount = 1},
                    },
                },
                {
                    label = "SNS Pistol Frame",
                    materials = {
                        {name = "steel", amount = 1},
                        {name = "weapon_blueprint_snspistol", amount = 1},
                    },
                    output = {
                        {name = "snspistol_frame", amount = 1},
                    },
                },
                {
                    label = "Vintage Pistol Frame",
                    materials = {
                        {name = "steel", amount = 1},
                        {name = "weapon_blueprint_vintagepistol", amount = 1},
                    },
                    output = {
                        {name = "vintagepistol_frame", amount = 1},
                    },
                },
                {
                    label = "AP Pistol Frame",
                    materials = {
                        {name = "steel", amount = 1},
                        {name = "weapon_blueprint_appistol", amount = 1},
                    },
                    output = {
                        {name = "appistol_frame", amount = 1},
                    },
                },
                {
                    label = "Pistol 50 Frame",
                    materials = {
                        {name = "steel", amount = 1},
                        {name = "weapon_blueprint_pistol50", amount = 1},
                    },
                    output = {
                        {name = "pistol50_frame", amount = 1},
                    },
                },
                {
                    label = "Heavy Pistol Frame",
                    materials = {
                        {name = "steel", amount = 1},
                        {name = "weapon_blueprint_heavypistol", amount = 1},
                    },
                    output = {
                        {name = "heavypistol_frame", amount = 1},
                    },
                },
                {
                    label = "Micro SMG Frame",
                    materials = {
                        {name = "steel", amount = 1},
                        {name = "weapon_blueprint_microsmg", amount = 1},
                    },
                    output = {
                        {name = "microsmg_frame", amount = 1},
                    },
                },
                {
                    label = "Mini SMG Frame",
                    materials = {
                        {name = "steel", amount = 1},
                        {name = "weapon_blueprint_minismg", amount = 1},
                    },
                    output = {
                        {name = "minismg_frame", amount = 1},
                    },
                },
                {
                    label = "Sawnoff Shotgun Frame",
                    materials = {
                        {name = "steel", amount = 1},
                        {name = "weapon_blueprint_sawnoffshotgun", amount = 1},
                    },
                    output = {
                        {name = "sawnoffshotgun_frame", amount = 1},
                    },
                },
                {
                    label = "Assault Rifle Frame",
                    materials = {
                        {name = "steel", amount = 1},
                        {name = "weapon_blueprint_assaultrifle", amount = 1},
                    },
                    output = {
                        {name = "assaultrifle_frame", amount = 1},
                    },
                },
                -- {
                --     label = "Name of Item",
                --     materials = {
                --         {name = "itemname", amount = 1},
                --     },
                --     output = {
                --         {name = "itemname", amount = 1},
                --     },
                -- },
            },
            AmmoStation = {
                {
                    label = "Pistol Ammo",
                    materials = {
                        {name = "brass", amount = 12},
                        {name = "gunpowder", amount = 12},
                    },
                    output = {
                        {name = "pistol_ammo", amount = 1},
                    },
                },
                {
                    label = "SMG Ammo",
                    materials = {
                        {name = "brass", amount = 20},
                        {name = "gunpowder", amount = 20},
                    },
                    output = {
                        {name = "smg_ammo", amount = 1},
                    },
                },
                {
                    label = "Rifle Ammo",
                    materials = {
                        {name = "brass", amount = 30},
                        {name = "steel", amount = 30},
                        {name = "gunpowder", amount = 30},
                    },
                    output = {
                        {name = "rifle_ammo", amount = 1},
                    },
                },
                {
                    label = "Shotgun Ammo",
                    materials = {
                        {name = "plastic", amount = 10},
                        {name = "brass", amount = 10},
                        {name = "steel", amount = 10},
                        {name = "gunpowder", amount = 10},
                    },
                    output = {
                        {name = "shotgun_ammo", amount = 1},
                    },
                },
                -- {
                --     label = "Name of Item",
                --     materials = {
                --         {name = "itemname", amount = 1},
                --     },
                --     output = {
                --         {name = "itemname", amount = 1},
                --     },
                -- },
            },
            DrillStation = {
                {
                    label = "Pistol",
                    materials = {
                        {name = "pistol_frame", amount = 1},
                        {name = "weapon_blueprint_pistol", amount = 1},
                    },
                    output = {
                        {name = "pistol", amount = 1},
                    },
                },
                {
                    label = "SNS Pistol",
                    materials = {
                        {name = "snspistol_frame", amount = 1},
                        {name = "weapon_blueprint_snspistol", amount = 1},
                    },
                    output = {
                        {name = "snspistol", amount = 1},
                    },
                },
                {
                    label = "Vintage Pistol",
                    materials = {
                        {name = "vintagepistol_frame", amount = 1},
                        {name = "weapon_blueprint_vintagepistol", amount = 1},
                    },
                    output = {
                        {name = "vintagepistol", amount = 1},
                    },
                },
                {
                    label = "AP Pistol",
                    materials = {
                        {name = "appistol_frame", amount = 1},
                        {name = "weapon_blueprint_appistol", amount = 1},
                    },
                    output = {
                        {name = "appistol", amount = 1},
                    },
                },
                {
                    label = "Pistol 50",
                    materials = {
                        {name = "pistol50_frame", amount = 1},
                        {name = "weapon_blueprint_pistol50", amount = 1},
                    },
                    output = {
                        {name = "pistol50", amount = 1},
                    },
                },
                {
                    label = "Heavy Pistol",
                    materials = {
                        {name = "heavypistol_frame", amount = 1},
                        {name = "weapon_blueprint_heavypistol", amount = 1},
                    },
                    output = {
                        {name = "heavypistol", amount = 1},
                    },
                },
                {
                    label = "Micro SMG",
                    materials = {
                        {name = "microsmg_frame", amount = 1},
                        {name = "weapon_blueprint_microsmg", amount = 1},
                    },
                    output = {
                        {name = "microsmg", amount = 1},
                    },
                },
                {
                    label = "Mini SMG",
                    materials = {
                        {name = "minismg_frame", amount = 1},
                        {name = "weapon_blueprint_minismg", amount = 1},
                    },
                    output = {
                        {name = "minismg", amount = 1},
                    },
                },
                {
                    label = "Sawnoff Shotgun",
                    materials = {
                        {name = "sawnoffshotgun_frame", amount = 1},
                        {name = "weapon_blueprint_sawnoffshotgun", amount = 1},
                    },
                    output = {
                        {name = "sawnoffshotgun", amount = 1},
                    },
                },
                {
                    label = "Assault Rifle",
                    materials = {
                        {name = "assaultrifle_frame", amount = 1},
                        {name = "weapon_blueprint_assaultrifle", amount = 1},
                    },
                    output = {
                        {name = "assaultrifle", amount = 1},
                    },
                },
                -- {
                --     label = "Name of Item",
                --     materials = {
                --         {name = "itemname", amount = 1},
                --     },
                --     output = {
                --         {name = "itemname", amount = 1},
                --     },
                -- },
            },
            AssemblingStation = {
                {
                    label = "Pistol",
                    materials = {
                        {name = "weapon_case", amount = 1},
                        {name = "pistol", amount = 1},
                    },
                    output = {
                        {name = "weapon_pistol", amount = 1},
                    },
                },
                {
                    label = "SNS Pistol",
                    materials = {
                        {name = "weapon_case", amount = 1},
                        {name = "snspistol", amount = 1},
                    },
                    output = {
                        {name = "weapon_snspistol", amount = 1},
                    },
                },
                {
                    label = "Vintage Pistol",
                    materials = {
                        {name = "weapon_case", amount = 1},
                        {name = "vintagepistol", amount = 1},
                    },
                    output = {
                        {name = "weapon_vintagepistol", amount = 1},
                    },
                },
                {
                    label = "AP Pistol",
                    materials = {
                        {name = "weapon_case", amount = 1},
                        {name = "appistol", amount = 1},
                    },
                    output = {
                        {name = "weapon_appistol", amount = 1},
                    },
                },
                {
                    label = "Pistol 50",
                    materials = {
                        {name = "weapon_case", amount = 1},
                        {name = "pistol50", amount = 1},
                    },
                    output = {
                        {name = "weapon_pistol50", amount = 1},
                    },
                },
                {
                    label = "Heavy Pistol",
                    materials = {
                        {name = "weapon_case", amount = 1},
                        {name = "heavypistol", amount = 1},
                    },
                    output = {
                        {name = "weapon_heavypistol", amount = 1},
                    },
                },
                {
                    label = "Micro SMG",
                    materials = {
                        {name = "weapon_case", amount = 1},
                        {name = "microsmg", amount = 1},
                    },
                    output = {
                        {name = "weapon_microsmg", amount = 1},
                    },
                },
                {
                    label = "Mini SMG",
                    materials = {
                        {name = "weapon_case", amount = 1},
                        {name = "minismg", amount = 1},
                    },
                    output = {
                        {name = "weapon_minismg", amount = 1},
                    },
                },
                {
                    label = "Sawnoff Shotgun",
                    materials = {
                        {name = "weapon_case", amount = 1},
                        {name = "sawnoffshotgun", amount = 1},
                    },
                    output = {
                        {name = "weapon_sawnoffshotgun", amount = 1},
                    },
                },
                {
                    label = "Assault Rifle",
                    materials = {
                        {name = "weapon_case", amount = 1},
                        {name = "assaultrifle", amount = 1},
                    },
                    output = {
                        {name = "weapon_assaultrifle", amount = 1},
                    },
                },
                -- {
                --     label = "Name of Item",
                --     materials = {
                --         {name = "itemname", amount = 1},
                --     },
                --     output = {
                --         {name = "itemname", amount = 1},
                --     },
                -- },
            },
        }
    },
}



--████████╗ █████╗ ██████╗  ██████╗ ███████╗████████╗███████╗
--╚══██╔══╝██╔══██╗██╔══██╗██╔════╝ ██╔════╝╚══██╔══╝██╔════╝
--   ██║   ███████║██████╔╝██║  ███╗█████╗     ██║   ███████╗
--   ██║   ██╔══██║██╔══██╗██║   ██║██╔══╝     ██║   ╚════██║
--   ██║   ██║  ██║██║  ██║╚██████╔╝███████╗   ██║   ███████║
--   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝

Config.AdditionalTargets = {
    OrderingBoard = {-- Feature coming later
        -- Paleto Bay
        {
            Coords = vector3(-54.85, 6428.31, 31.29),
            Heading = 315.0,
            Size = {0.5, 0.5},
            Distance = 2.0,
            minZ = 31.29-0.1,
            maxZ = 31.29+0.3,
        },
        -- Los Santos
        {
            Coords = vector3(4.2564, -1105.7578, 29.1093),
            Heading = 0.0,
            Size = {0.5, 0.5},
            Distance = 2.0,
            minZ = 31.19-0.1,
            maxZ = 31.19+0.3,
        },
        -- Cypress Flats
        {
            Coords = vector3(863.92, -2383.35, 30.15),
            Heading = 355.0,
            Size = {0.5, 0.5},
            Distance = 2.0,
            minZ = 30.15-0.1,
            maxZ = 30.15+0.3,
        },
    },
    CuttingStation1 = {
        -- Paleto Bay
        {
            Coords = vector3(-46.07, 6432.59, 31.29),
            Heading = 315.0,
            Size = {1.2, 3.0},
            Distance = 2.0,
            minZ = 31.29-1,
            maxZ = 31.29+1,
        },
        -- Los Santos
        {
            Coords = vector3(30.0367, -1075.0641, 27.7234),
            Heading = 0.0,
            Size = {1.2, 3.0},
            Distance = 2.0,
            minZ = 31.19-1,
            maxZ = 31.19+1,
        },
        -- Cypress Flats
        {
            Coords = vector3(855.00, -2379.37, 30.15),
            Heading = 355.0,
            Size = {3.0, 1.2},
            Distance = 2.0,
            minZ = 30.15-1,
            maxZ = 30.15+1,
        },
    },
    CuttingStation2 = {
        -- Paleto Bay
        {
            Coords = vector3(-37.31, 6428.35, 31.29),
            Heading = 315.0,
            Size = {1.2, 3.0},
            Distance = 2.0,
            minZ = 31.29-1,
            maxZ = 31.29+1,
        },
        -- los Santos
        {
            Coords = vector3(34.2832, -1076.6072, 27.7232),
            Heading = 0.0,
            Size = {1.2, 3.0},
            Distance = 2.0,
            minZ = 31.19-1,
            maxZ = 31.19+1,
        },
        -- Cypress Flats
        {
            Coords = vector3(852.61, -2369.93, 30.15),
            Heading = 355.0,
            Size = {3.0, 1.2},
            Distance = 2.0,
            minZ = 30.15-1,
            maxZ = 30.15+1,
        },
    },
    AmmoStation = {
        -- Paleto Bay
        {
            Coords = vector3(-36.72, 6424.94, 31.29),
            Heading = 315.0,
            Size = {2.0, 1.0},
            Distance = 2.0,
            minZ = 31.29-1,
            maxZ = 31.29+1,
        },
        -- Los Santos
        {
            Coords = vector3(12.1369, -1102.1755, 29.1145),
            Heading = 0.0,
            Size = {2.0, 1.0},
            Distance = 2.0,
            minZ = 31.19-1,
            maxZ = 31.19+1,
        },
        -- Cypress Flats
        {
            Coords = vector3(854.85, -2367.30, 30.15),
            Heading = 355.0,
            Size = {2.0, 1.0},
            Distance = 2.0,
            minZ = 30.15-1,
            maxZ = 30.15+1,
        },
    },
    DrillStation = {
        -- Paleto Bay
        {
            Coords = vector3(-40.46, 6427.99, 31.29),
            Heading = 315.0,
            Size = {1.0, 1.0},
            Distance = 2.0,
            minZ = 31.29-1,
            maxZ = 31.29+1,
        },
        -- Los Santos
        {
            Coords = vector3(32.1443, -1075.8372, 27.7232),
            Heading = 0.0,
            Size = {1.0, 1.0},
            Distance = 2.0,
            minZ = 31.19-1,
            maxZ = 31.19+1,
        },
        -- Cypress Flats
        {
            Coords = vector3(854.91, -2372.12, 30.15),
            Heading = 355.0,
            Size = {1.0, 1.0},
            Distance = 2.0,
            minZ = 30.15-1,
            maxZ = 30.15+1,
        },
    },
    AssemblingStation = {
        -- Paleto Bay
        {
            Coords = vector3(-40.47, 6431.71, 31.29),
            Heading = 315.0,
            Size = {1.0, 4.0},
            Distance = 2.0,
            minZ = 31.29-1,
            maxZ = 31.29+1,
        },
        -- Los Santos
        {
            Coords = vector3(13.6126, -1109.7456, 29.1159),
            Heading = 0.0,
            Size = {1.0, 4.0},
            Distance = 2.0,
            minZ = 31.19-1,
            maxZ = 31.19+1,
        },
        -- Cypress Flats
        {
            Coords = vector3(852.07, -2374.52, 30.15),
            Heading = 355.0,
            Size = {4.0, 1.0},
            Distance = 2.0,
            minZ = 30.15-1,
            maxZ = 30.15+1,
        },
    },
    Materials = {
        -- Paleto Bay
        {
            Coords = vector3(-48.96, 6436.6, 31.49),
            Heading = 315.0,
            Size = {1.8, 3.0},
            Distance = 2.0,
            minZ = 31.49-1,
            maxZ = 31.49+1,
        },
        -- Los Santos
        {
            Coords = vector3(28.2552, -1079.6049, 27.7232),
            Heading = 0.0,
            Size = {1.8, 3.0},
            Distance = 2.0,
            minZ = 31.39-1,
            maxZ = 31.39+1,
        },
        -- Cypress Flats
        {
            Coords = vector3(853.76, -2384.17, 30.36),
            Heading = 85.0,
            Size = {1.8, 3.0},
            Distance = 2.0,
            minZ = 30.36-1,
            maxZ = 30.36+1,
        },
    },
}