-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = {}

Config.checkForUpdates = true -- Check for Updates?

Config.Elevators = {
    PillboxElevatorNorth = { -- Elevator name(Doesn't show it's just to name table)
        [1] = {
            coords = vec3(332.37, -595.56, 43.28), -- Coords, if you're new; last number is heading
            heading = 70.65, -- Heading of how will spawn on floor
            title = 'Floor 2', -- Title 
            description = 'Main Floor', -- Description
            target = { -- Target length/width
                width = 5,
                length = 4
            },
            groups = {-- Job locks
                'police',
                'ambulance'
            },
        },
        [2] = {
            coords = vec3(344.31, -586.12, 28.79), -- Coords, if you're new; last number is heading
            heading = 252.84,
            title = 'Floor 1',
            description = 'Lower Floor',
            target = {
            width = 5,
            length = 4
            } -- Example without group
        },
    },
    CasinoPentHouse = { -- Elevator name(Doesn't show it's just to name table)
    [1] = {
        coords = vec3(980.2216, 57.0665, 116.1642), -- Coords, if you're new; last number is heading
        heading = 234.5477, -- Heading of how will spawn on floor
        title = 'Floor 2', -- Title 
        description = 'Main Floor', -- Description
        target = { -- Target length/width
            width = 5,
            length = 4
        },
        groups = {-- Job locks
            
        },
    },
    [2] = {
        coords = vec3(919.2814, 38.5486, 81.0959), -- Coords, if you're new; last number is heading
        heading = 159.9657,
        title = 'Floor 1',
        description = 'Lower Floor',
        target = {
        width = 5,
        length = 4
        } -- Example without group
    },
},
}