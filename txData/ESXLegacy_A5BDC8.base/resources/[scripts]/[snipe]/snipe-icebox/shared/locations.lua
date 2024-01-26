Config.Zones = {

    -- 1, 2 and 3 are for normal jewellery store
    [1] = {
        type = "inspect", -- inspect chains before buying
        coords = vec3(-625.0, -231.0, 38.0),
        size = vec3(2.0, 1, 2),
        rotation = 305.0,
    },
    [2] = {
        type = "craft", -- crafting chain (job required)
        coords = vec3(-616.75, -229.29, 38.0),
        size = vec3(2.0, 1, 1),
        rotation = 125.0,
        job = "vangelico" -- job is required!!!!
    },
    [3] = {
        type = "safe",
        coords = vec3(-631.3, -229.3, 38.0),
        size = vec3(1, 1, 1),
        rotation = 37.0,
        job = "icebox", -- job is required!!!!
        stashsize = 1000,
        stashslots = 100,
        stashName = "icebox_safe_1", -- make sure its unique if you create multiple stashes
        stashLabel = "Icebox Safe",
    },

    -- 4, 5 and 6 are for YBN milos Ice box MLO (https://ybnmilos-mlo-world.tebex.io/package/4978726)
    [4] = {
        type = "inspect", -- inspect chains before buying
        coords = vec3(-1238.14, -801.68, 18.0),
        size = vec3(1, 3.0, 1),
        rotation = 218.25,
    },
    [5] = {
        type = "craft", -- crafting chain (job required)
        coords = vec3(-1256.24, -825.79, 17.0),
        size = vec3(1, 3.0, 1),
        rotation = 128.25,
        job = "vangelico" -- job is required!!!!
    },
    [6] = {
        type = "safe",
        coords = vec3(-1258.61, -805.35, 17.0),
        size = vec3(1, 3.0, 1),
        rotation = 308.25,
        job = "vangelico", -- job is required!!!!
        stashsize = 1000,
        stashslots = 100,
        stashName = "icebox_safe_2", -- make sure its unique if you create multiple stashes
        stashLabel = "Icebox Safe",
    }
}
