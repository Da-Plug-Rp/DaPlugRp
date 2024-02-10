--[[
    If you have a different script name for the following ones, change it to your one
    Example:

    EXTERNAL_SCRIPTS_NAMES = {
        ["es_extended"] = "mygamemode_extended",
    }
]]

EXTERNAL_SCRIPTS_NAMES = {
    ["es_extended"] = "es_extended",
    ["qb-core"] = "qb-core",

    -- If you don't use these inventories, don't touch
    ["ox_inventory"] = "ox_inventory",
    ["qs-inventory"] = "qs-inventory",
    
    -- lockpick minigame, credits: https://github.com/baguscodestudio/lockpick
    ["lockpick"] = "lockpick",
}

--[[
    The shared object of the framework will refresh each X seconds. If for any reason you don't want it to refresh, set to nil
]] 
SECONDS_TO_REFRESH_SHARED_OBJECT = nil

--[[
    Available options: default, qs-inventory, ox-inventory      (they MUST be between double quotes "")
]]
INVENTORY_TO_USE = "default"

-- These are vehicles models that won't be locked on their spawn (NPC spawned vehicles). This will happen because the vehicles don't have doors
NO_DOORS_VEHICLES = {
    [ GetHashKey("dune") ] = true,
    [ GetHashKey("dune2") ] = true,
    [ GetHashKey("dune3") ] = true,
    [ GetHashKey("dune4") ] = true,
    [ GetHashKey("dune5") ] = true,
    [ GetHashKey("dump") ] = true,
    [ GetHashKey("apc") ] = true,
    [ GetHashKey("thruster") ] = true,
    [ GetHashKey("trailersmall2") ] = true,
    [ GetHashKey("bifta") ] = true,
    [ GetHashKey("blazer") ] = true,
    [ GetHashKey("blazer2") ] = true,
    [ GetHashKey("blazer3") ] = true,
    [ GetHashKey("blazer4") ] = true,
    [ GetHashKey("blazer5") ] = true,
    [ GetHashKey("vagrant") ] = true,
    [ GetHashKey("verus") ] = true,
    [ GetHashKey("winky") ] = true,
    [ GetHashKey("formula") ] = true,
    [ GetHashKey("formula2") ] = true,
    [ GetHashKey("openwheel1") ] = true,
    [ GetHashKey("openwheel2") ] = true,
    [ GetHashKey("wastelander") ] = true,
    [ GetHashKey("airtug") ] = true,
    [ GetHashKey("caddy") ] = true,
    [ GetHashKey("caddy2") ] = true,
    [ GetHashKey("caddy3") ] = true,
    [ GetHashKey("forklift") ] = true,
    [ GetHashKey("mower") ] = true,
    [ GetHashKey("tractor") ] = true,

    -- Only has for vehicles with 0 doors found automatically with GetNumberOfVehicleDoors

    [3087536137] = true,
    [2657817814] = true,
    [2818520053] = true,
    [3895125590] = true,
    [3945366167] = true,
    [4246935337] = true,
    [3025077634] = true,
    [3854198872] = true,
    [2704629607] = true,
    [2166734073] = true,
    [524108981] = true,
    [3757070668] = true,
    [3525819835] = true,
    [1147287684] = true,
    [6774487] = true,
    [276773164] = true,
    [509498602] = true,
    [867467158] = true,
    [1033245328] = true,
    [2154757102] = true,
    [534258863] = true,
    [1897744184] = true,
    [3467805257] = true,
    [3982671785] = true,
    [2633113103] = true,
    [970356638] = true,
    [1491375716] = true,
    [184361638] = true,
    [240201337] = true,
    [3517691494] = true,
    [1058115860] = true,
    [861409633] = true,
    [3251507587] = true,
    [2531412055] = true,
    [3806844075] = true,
    [390902130] = true,
    [3620039993] = true,
    [4008920556] = true,
    [777714999] = true,
    [3678636260] = true,
    [3983945033] = true,
    [3264692260] = true,
    [437538602] = true,
    [231083307] = true,
    [400514754] = true,
    [4012021193] = true,
    [1956216962] = true,
    [3564062519] = true,
    [586013744] = true,
    [1489874736] = true,
    [908897389] = true,
    [1070967343] = true,
    [1641462412] = true,
    [2016027501] = true,
    [3194418602] = true,
    [3417488910] = true,
    [2413121211] = true,
    [712162987] = true,
    [2942498482] = true,
    [1448677353] = true,
    [290013743] = true,
    [2194326579] = true,
    [2382949506] = true,
}