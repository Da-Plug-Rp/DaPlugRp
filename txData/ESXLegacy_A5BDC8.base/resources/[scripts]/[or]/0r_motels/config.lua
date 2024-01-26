Config = {}

Apartments = {}

Apartments.Starting = true

Config.Motels = {}

Config.Locale = 'en' -- "tr" "pt" "de" "es" "en", "french"

Config.Corridor = {
    Coord = vec3(-238.2847, -832.6072, 95.2551),
    SecondFloor = vec3(-238.0607, -832.6706, 100.7658),
    Colors = {
        {name = 'marble', price = 0, default = true},
        {name = 'blue', price = 600, default = false},
        {name = 'orange', price = 1000, default = false},
        {name = 'red', price = 500, default = false},
        {name = 'normal', price = 500, default = false},
    }
}

Config.Apartment = true
-- If you activate this setting, the player will be allocated a hotel room when registering to the server.

-- This information allows the player to be given a motel room when they first enter the server. Here is the motel room information:
Config.RandomMotelRoomData = { 
    mCode = '0resmon5',
    Day = 2,
    All = false -- Includes All Motels
}

Config.Blip = {
    Id = 475,
    Scale = 0.8
}
-- Blip Settings

Config.CustomShowerSystem = false
-- If you want to your shower system, you should open config_functions.lua than you should edit it.

Config.MetaDataSystem = true
-- Metadata System If True, you must have an inventory with metadata. Because the system will work with a unique motel key.

Config.MotelGarages = true 
-- Motel Garages Bool

Config.TargetedRevenueValue = 150000 
-- The maximum income value that can appear in the Boss Menu.

Config.GarageVehiclesLock = false
-- It ensures that the vehicles in the garage are locked.

Config.AutoLock = true 
-- If true, the doors will automatically close.

Config.KeysListCommand = 'mykeys'
-- This feature will only work if Config.MetaDataSystem is turned off. It allows you to give your room keys to other players.

Config.KeyPrices = {
    ChangeKeyPrice = 100, -- Player Motel Key Change Price
    CopyKeyPrice = 100 -- Player Motel Key Copy Price
}

Config.CustomNotify = false -- If you have a Notify that you use, you can place it in the function below.

Config.LockPickSystemOxSkillbar = true
-- If this is checked true you will need to run ox_lib on your server.
-- But if you do not want to use ox_lib, you can integrate a skillbar of your own choice or use into the function below.

Config.ShowerCoords = { -- Locations where players can shower in their rooms.
    vec3(-223.6933, -840.7189, 108.2197),
    vec3(-383.5846, 148.9360, 62.1624),
    vec3(-888.7896, -440.9120, -22.1450)
}


Config.GarageCoord = vec3(519.9156, -2639.1565, -38.6916) -- Garage Entrance Coordinate.
Config.GarageElevator = vec3(532.0820, -2637.8948, -38.6916) -- Garage Elevator Coordinate.

Config.GaragePos = { -- Coordinates of vehicles in the garage.
    vec4(514.4383, -2612.6721, -39.0003, 274.1918),
    vec4(514.4879, -2616.6702, -39.0006, 274.1838),
    vec4(514.3720, -2620.6768, -39.0003, 274.1891),
    vec4(514.3495, -2624.6777, -39.0005, 274.1892), 
    vec4(514.4037, -2628.6765, -39.0002, 274.1837),
    vec4(514.3548, -2632.6812, -39.0005, 274.1834),
    vec4(523.8234, -2612.4009, -39.0002, 99.1836),
    vec4(525.1952, -2616.7732, -39.0016, 93.8991),
    vec4(525.2364, -2620.6472, -38.9987, 92.5212),
    vec4(525.1260, -2624.6538, -38.9999, 92.5225),
    vec4(525.3015, -2628.6465, -39.0003, 92.5232), 
    vec4(525.2893, -2632.6470, -39.0004, 92.5235), 
}

Config.MotelCardItem = 'motelcard' 
-- Motel Card Item Name || If Config.MetaDataSystem true

Config.DoorLockPickItem = 'doorlockpick' 
-- This doorlockpick item allows players to enter rooms.

Config.StashInfo = {
    Weight = 40,
    StashWeightPrice = 50, -- 1kg
    StashWeightMaxValue = 1000000 -- kg
}

Config.RoomTypes = {
    {
        RoomLabel = "Double",
        Image = 'roomplus.png',
        Ipl = 'qua_loft_milo',
        Url = 'Double',

        Coords = {
            Stash = vec3(-224.6644, -833.6180, 108.1514),
            Exit = vec4(-226.2884, -839.8974, 105.3926, 76.7111),
            Wardrobe = vec3(-223.1058, -838.1527, 108.1514)
        },

        EditRoomMenu = vec3(-225.3148, -843.6209, 105.3927),

        Teleport = true,
        Colors = {
            {name = 'marble', price = 0, default = true},
            {name = 'blue', price = 600, default = false},
            {name = 'orange', price = 1000, default = false},
            {name = 'red', price = 500, default = false},
            {name = 'normal', price = 500, default = false},
        },

        Description = 'Big, Double Room, Bedroom and Lux Toilet',
        DetailDescription = 'Modern Comfort: 2-Storey Motel Room Warm welcome and spacious design. Large living area and kitchen on the ground floor. Comfy bed and private bathroom upstairs. We are here for your unforgettable stay!'
    },

    {
        RoomLabel = "Modern",
        Image = 'modern.png',
        Ipl = 'qua_adez_k_milo',
        Url = 'modern',

        Coords = {
            Stash = vec3(-894.7706, -446.8845, -22.3347),
            Exit = vec4(-896.7320, -445.9584, -22.3347, 125.6001),
            Wardrobe = vec3(895.6776, -443.3054, -22.3347)
        },

        EditRoomMenu = vec3(-891.5780, -446.6640, -22.3347),

        Teleport = true,

        Colors = {
            {name = 'turuncu', price = 0, default = true},
            {name = 'kirmizi', price = 600, default = false},
            {name = 'mor', price = 1000, default = false},
        },

        Description = 'Big, Modern Room, Bedroom and Lux Toilet',
        DetailDescription = 'Modern Comfort: 2-Storey Motel Room Warm welcome and spacious design. Large living area and kitchen on the ground floor. Comfy bed and private bathroom upstairs. We are here for your unforgettable stay!'
    },

    {
        RoomLabel = "Modern Plus",
        Image = 'modernplus.png',
        Ipl = 'qua_adez_b_milo',
        Url = 'modernplus',

        Coords = {
            Stash = vec3(-898.5288, -440.5303, -16.0115),
            Exit = vec4(-896.9307, -446.6819, -16.0115, 148.6216),
            Wardrobe = vec3(-894.0433, -439.5612, -16.0115)
        },

        EditRoomMenu = vec3(-891.4050, -446.3079, -16.0115),

        Teleport = true,

        Colors = {
            {name = 'turuncu', price = 0, default = true},
            {name = 'kirmizi', price = 600, default = false},
            {name = 'mor', price = 1000, default = false},
        },

        Description = 'Big, Modern Plus Room, Bedroom and Lux Toilet',
        DetailDescription = 'Modern Comfort Plus: 2-Storey Motel Room Warm welcome and spacious design. Large living area and kitchen on the ground floor. Comfy bed and private bathroom upstairs. We are here for your unforgettable stay!'
    },

    {
        RoomLabel = 'Standard',
        Image = 'roomtype1int4.png',

        Coords = {
            Exit = vec4(-384.4520, 152.1615, 62.1190, 96.5731),
            Stash = vec3(-379.86370849609,153.00648498535,62.118995666504),
            Wardrobe = vec3(-382.78698730469,152.97123718262,62.118995666504)
        },
        
        Teleport = true,
        Colors = false,

        EditRoomMenu = vector3(1,1,1),

        Description = 'Standard Room',
        DetailDescription = 'Comfortable and Simple: Standard Motel Room Welcome! A comfortable bed and basic furniture await you in our simple and comfortable standard room. The modern bathroom offers freshness and comfort.'
    },

    {
        RoomLabel = 'Simple',
        Image = 'roomtype1int6.png',
        Teleport = true,
        Colors = false,

        EditRoomMenu = vector3(1,1,1),
        Coords = {
            Exit = vec4(291.0083, -925.0219, -22.9948, 173.1460),
            Stash = vec3(283.4391, -925.4509, -23.0018),
            Wardrobe = vec3(286.5710, -922.4359, -23.0018)
        },

        Description = 'Simple Room',
        DetailDescription = "Welcome to our cozy, simple room. It's designed for your comfort and convenience. You'll find a comfortable bed, a clean, functional bathroom, and a small sitting area. While it's not extravagant, it has everything you need for a peaceful and relaxing stay."
    },
    
    -- for pinkcage motel 

    -- {
    --     RoomLabel = 'Classic',
    --     Image = 'roomtype1int.png',
    --     Teleport = false,
    --     Colors = false,
    --     EditRoomMenu = false,
    --     Description = 'Classic Room',
    --     DetailDescription = 'Comfortable and Simple: Classic Motel Room Welcome! A comfortable bed and basic furniture await you in our simple and comfortable standard room. The modern bathroom offers freshness and comfort.'
    -- },

    {
        RoomLabel = 'Rustic',
        Image = 'roomtype1int5.png',
        Teleport = false,
        Colors = false,
        EditRoomMenu = false,
        Description = 'Rustic Room',
        DetailDescription = 'Rustic Motel Room: Comfort & Simplicity Experience simplicity and comfort in our rustic motel room. Enjoy a cozy bed, basic furniture, and a modern bathroom for your stay.'
    },

    {
        RoomLabel = 'Economy',
        Image = 'roomtype1int7.png',
        Teleport = false,
        Colors = false,
        EditRoomMenu = false,
        Description = 'Economy Room',
        DetailDescription = "Our economy room offers a budget-friendly stay with essential amenities. It's a comfortable and practical choice for travelers looking to save without sacrificing comfort."
    },

    {
        RoomLabel = 'Normal',
        Image = 'roomtype1int9.png',
        Teleport = false,
        Colors = false,
        EditRoomMenu = false,
        Description = 'Normal Room',
        DetailDescription = "Our normal room room offers a budget-friendly stay with essential amenities. It's a comfortable and practical choice for travelers looking to save without sacrificing comfort."
    },

    {
        RoomLabel = 'Modest',
        Image = 'roomtype1int10.png',
        Teleport = false,
        Colors = false,
        EditRoomMenu = false,
        Description = 'Modest Room',
        DetailDescription = "In a modest motel room, warm-colored walls and simple, comfortable furnishings offer a tranquil and unpretentious lodging experience. Equipped with all necessary amenities, it provides an ideal space to relax and enjoy the journey."
    },

    {
        RoomLabel = 'Modest VIP',
        Image = 'roomtype1int11.png',
        Teleport = false,
        Colors = false,
        EditRoomMenu = false,
        Description = 'Modest VIP Room',
        DetailDescription = "In a modest motel room, warm-colored walls and simple, comfortable furnishings offer a tranquil and unpretentious lodging experience. Equipped with all necessary amenities, it provides an ideal space to relax and enjoy the journey."
    }
}

Config.DueDate = 3
-- The number of days entered into this variable ensures that the player's room will be canceled if he does not pay the room rent within the specified day.

Config.MotelAdminMenuAccessible = { -- Enter the license IDs of the players you want to be able to access the /moteladmin menu here.
    "license:80877aca6164d3df0a469fe3c96f2524127ab052",
    "license:62f00dc3b8e577187d9588808140bb8b1daa20eb",
    "license:fd581068d91ab38fe0150add0df96e651c3b6d5c"
}

Config.Keys = {
    ["reception"] = {"E", 38, "Reception"}
}

Config.CreateMotelEditorKeys = {
    ["reception"] = {"E", 38, "Reception"},
    ["room"] = {"E", 38}
}

Config.Ipl = {
    ["Double"] = 'qua_loft_milo',
    ["Modern"] = 'qua_adez_k_milo',
    ["Modern Plus"] = 'qua_adez_k_milo'
}

Config.MotelAdminMenuCommand = 'moteladmin' -- Motel Admin Menu Open Command

Config.DefaultNumberOfCharacters = 5 -- Define maximum amount of default characters (maximum 5 characters defined by default)
Config.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", numberOfChars = 2 },
}