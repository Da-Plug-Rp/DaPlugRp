-- DO NOT CHANGE THE NAME OF THE RESOURCE, THE FOLDER NAME SHOULD ALWAYS BE kj_driftsmoke --
-- DO NOT CHANGE THE NAME OF THE RESOURCE, THE FOLDER NAME SHOULD ALWAYS BE kj_kj_driftsmoke --
-- This resource will break if you rename it!--

config = {}

config.DEBUG = false

-- If other players can see your drift smoke
config.MULTIPLAYER = true

-- How far away the smoke will render to other players. Larger numbers will cause a little bit more cpu ms to be used.
config.RENDER_DISTANCE = 100.0

-- DRIFT SMOKE SETTINGS --

-- How big the smoke is
config.DRIFT_SIZE = 0.25
-- How many particles to spawn
-- GTA V has a weird limit of 128 particles. After that, the particles will start to disappear.
-- This is a game limitation afaik. Keep this in mind when changing the density. The Density is per vehicle. So if 2 vehicles are drifting, 30 particles are spawned.
config.DRIFT_DENS = 15
-- How transparent the smoke is
config.DRIFT_ALPHA = 0.4

-- BURNOUT SMOKE SETTINGS --

-- How big the smoke is
config.BURNOUT_SIZE = 0.55
-- How much bigger the smoke gets per second of doing a burnout continuously. Bigger number = slower increase
config.BURNOUT_SIZE_INCREASE_RATE = 5
-- How many particles to spawn
-- GTA V has a weird limit of 128 particles. After that, the particles will start to disappear.
-- This is a game limitation afaik. Keep this in mind when changing the density. The Density is per vehicle. So if 2 vehicles are drifting, 30 particles are spawned.
config.BURNOUT_DENS = 15
-- How transparent the smoke is
config.BURNOUT_ALPHA = 1.0

-- Road surfaces that will allow smoke to be created, any integer that is commented out will not allow smoke to be created on that surface.
-- for more info, refer to MATERIALS.DAT in the game files.
-- enable config.DEBUG to see the surface type if you're driving a vehicle.
config.ROAD_SURFACES = {
    1, -- CONCRETE
    2, -- CONCRETE_POTHOLE
    3, -- CONCRETE_DUSTY
    4, -- TARMAC
    5, -- TARMAC_PAINTED
    6, -- TARMAC_POTHOLE
    11, -- STONE
    12, -- COBBLESTONE
    13, -- BRICK
    14, -- MARBLE
    15, -- PAVING_SLAB
    55, -- METAL_SOLID_SMALL
    68, -- METAL_MANHOLE
}

-- Enable or disable whitelist, if enabled, only vehicles in the whitelist will be able to create smoke.
-- enable config.DEBUG to see the model of the vehicle you're driving.
config.whitelist = {
    enabled = false, -- true or false
    vehicles = { -- model string
        'futo',
    }
}

---- @thisisnotkj or https://discord.gg/Nba2Yj2Nqp for questions or support! ----
---- @thisisnotkj or https://discord.gg/Nba2Yj2Nqp for questions or support! ----