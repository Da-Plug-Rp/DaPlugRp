Config = {}

Config.Chains = {
    ["prop_chain"] = { -- item name
        label = "Prop Chain", -- item label that will show on the context menu
        prop = "snipe_chain", -- prop name
        category = "gang",
        bone = 10706, -- bone on which the chain will be attached
        offset = vec3(-0.03, -0.01, -0.02), -- offset of the chain
        rotation = vec3(-9.0, -22.0, -165.0), -- rotation of the chain
        offsets = { -- offsets for different infused items particle effects
            ["diamond"] = vec3(0.0,  -0.2 , -0.1), -- offset for diamond
            ["ruby"] = vec3(0.0,  -0.15 , -0.1), -- offset for ruby
        },
        craftItems = { -- items required for crafting
            ["diamond"] = { -- item name
                label = "Diamond", -- label to show on ui
                amount = 1, -- amount required
            },
            ["ruby"] = { -- item name
                label = "Ruby", -- label to show on ui
                amount = 1, -- amount required
            },
        }
    },

    ["clothing_chain"] = { -- item name
        label = "Clothing Chain", -- item label that will show on the context menu
        drawable = true, -- if the chain is clothing item
        category = "business",
        -- componentId = 8, -- (you can now overwrite the component Id) (by default its 7, but you can set the value here)
        clothing = {
            ["mp_m_freemode_01"] = {drawable = 17, texture = 0}, -- texture and drawable if its a male ped model
            ["mp_f_freemode_01"] = {drawable = 32, texture = 0}, -- texture and drawable if its a female ped model
        },
        offsets = { -- offsets for different infused items particle effects
            ["diamond"] = vec3( 0.0, 0.08, 0.34), -- offset for diamond
            ["ruby"] = vec3(0.0, 0.14, 0.36),   -- offset for ruby
        },
        craftItems = {
            ["diamond"] = {
                label = "Diamond",
                amount = 1,
            },
            ["ruby"] = {
                label = "Ruby",
                amount = 1,
            },
        }
    },
}