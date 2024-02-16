Config = {}

Config.Preset = "esx" -- esx, qb, custom (esx require ox_inventory)

-- Groups authorized to use the shaker and interact with it.
-- Each key represents the name of a group, and the corresponding value is the grade required.
Config.Groups = {
    ["bartender"] = 0
}

-- Each key represents a unique bottle model, and the corresponding values include:
--   - name: Internal identifier for drink pattern detection.
--   - color: Color code for the liquid.
--   - animProp: (Optional) Prop used during pouring animation.
--   - label: Display label, used in the notifications content resume.
Config.Bottles = {
    ["prop_vodka_bottle"] = {
        name = "vodka",
        color = "#BFC0EE",
        
        animProp = "fm_bar_props_bottle_vodka_1",
        label = "~b~Vodka",
    },
    ["fm_bar_props_bottle_campari"] = {
        name = "cumpa",
        color = "#ee0000",
        
        animProp = "fm_bar_props_bottle_campari_1",
        label = "~r~Cumpa",
    },
    ["fm_bar_props_bottle_aperol"] = {
        name = "beerol",
        color = "#ff4827",
        
        animProp = "fm_bar_props_bottle_aperol_1",
        label = "~o~BeeRol",
    },
    ["prop_tequila_bottle"] = {
        name = "tequila",
        color = "#BFC0EE",
        
        animProp = "fm_bar_props_bottle_tequila_1",
        label = "~b~Tequila",
    },
    ["prop_rum_bottle"] = {
        name = "rum",
        color = "#7a230d",
        
        animProp = "fm_bar_props_bottle_rum_1",
        label = "~o~Rum",
    },
    ["prop_whiskey_bottle"] = {
        name = "whiskey",
        color = "#7a1c07",

        animProp = "p_whiskey_bottle_s",
        label = "~o~Whiskey",
    },

    -- No alcohol

    ["fm_bar_props_bottle_tonic"] = {
        name = "tonica",
        color = "#dddded",

        animProp = "fm_bar_props_bottle_tonic_1",
        label = "~b~Tonica",
    },
    ["fm_bar_props_bottle_cola"] = {
        name = "ecola",
        color = "#441a1b",

        animProp = "fm_bar_props_bottle_cola_1",
        label = "~o~eCola",
    },
    ["fm_bar_props_bottle_sprunk"] = {
        name = "sprunk",
        color = "#b99643",

        animProp = "fm_bar_props_bottle_sprunk_1",
        label = "~g~Sprunk",
    },
    ["h4_prop_battle_waterbottle_01a"] = {
        name = "water",
        color = "#9fc5e8",

        animProp = "fm_bar_props_bottle_water_1",
        label = "~b~Water",
    },
    ["prop_champ_01a"] = {
        name = "prosecco",
        color = "#ed7c05",

        animProp = "fm_bar_props_bottle_champ_1",
        label = "~o~Prosecco",
    },
    ["fm_bar_props_bottle_juice"] = {
        name = "fruit_juice",
        color = "#ed7c05",

        animProp = "fm_bar_props_bottle_juice_1",
        label = "~o~Fruit Juice",
    },
    ["prop_food_sugarjar"] = {
        name = "sugar",
        color = "#ffffff",

        animProp = "fm_bar_props_bottle_sugar_1",
        label = "Sugar",
    }
}

Config.Menu = {
    Interaction = {
        -- works for ox_target
        Target = {
            label = "Create drink",
            icon = "fa-solid fa-cocktail",
        },

        -- if ox_taget cant be found it will use the native interactions
        Native = {
            notify = "Press {E} to start creating a drink.",
            input = 38
        }
    },

    SearchRadius = 1.5, -- Find all bottles in this radius from the shaker
    
    Selection = {
        BottleMovement = 0.045, -- How much the bottle moves when it's selected
        Duration = 300, -- Duration of the selection animation
    },

    -- https://docs.fivem.net/docs/game-references/controls/#controls
    Navigation = {
        Left = {174, "~INPUT_CELLPHONE_LEFT~"},
        Right = {175, "~INPUT_CELLPHONE_RIGHT~"},

        Pour = {176, "~INPUT_CELLPHONE_SELECT~"},
        Mix = {37, "~INPUT_SELECT_WEAPON~"},

        Back = {177, "~INPUT_CELLPHONE_CANCEL~"},
    }
}

Config.Translations = {
    ["menu_selected"] = "Selected: %s",

    ["menu_change_selection"] = "Press %s %s to change selection.",
    ["menu_pour_selection"] = "Press %s to pour the selected bottle.",

    ["menu_content_decision"] = "Shaker content:",
    ["menu_continue_decision"] = "Press %s to continue adding a drink.",
    ["menu_mix_decision"] = "Press %s to mix.",

    ["menu_exit"] = "Press %s to step away.",
}

-- List of layers-to-drink patterns for crafting cocktails.
-- The structure is a nested table where each key represents an item to give, and the corresponding value is another table
-- with drink names as keys and their respective amounts as values.
--
-- This configuration serves as a blueprint for crafting cocktails, specifying the required amounts of each drink for a particular item.
-- If no drink pattern can be found the item "cocktail" will be given.
Config.DrinksPattern = {
    ["ecola_rum"] = {
        ["ecola"] = 1,
        ["rum"] = 1,
    },
    ["spritz-bee"] = {
        ["beerol"] = 1,
        ["prosecco"] = 1,
        ["water"] = 1,
    },
    ["spritz-cumpa"] = {
        ["cumpa"] = 1,
        ["prosecco"] = 1,
        ["water"] = 1,
    },
    ["americano"] = {
        ["cumpa"] = 1,
        ["beerol"] = 1,
        ["water"] = 1,
    },
    ["mojito"] = {
        ["sugar"] = 1,
        ["rum"] = 1,
        ["water"] = 1,
        ["fruit_juice"] = 1,
    },
    ["sex_on_the_beach"] = {
        ["vodka"] = 2,
        ["fruit_juice"] = 1,
        ["sugar"] = 1,
    },
    ["moscow_mule"] = {
        ["vodka"] = 2,
        ["fruit_juice"] = 1,
    },
    ["margarita"] = {
        ["tequila"] = 1,
        ["fruit_juice"] = 1,
        ["water"] = 1,
    },
}

-- List of items that are on the blackboards
Config.OnBoard = {
    ["ecola_rum"] = "eCola Rum",
    ["spritz-bee"] = "Spritz Bee",
    ["spritz-cumpa"] = "Spritz Cumpa",
    ["americano"] = "Americano",
    ["mojito"] = "Mojito",
    ["sex_on_the_beach"] = "Sex on the b.",
    ["moscow_mule"] = "Moscow Mule",
    ["margarita"] = "Margarita",
}
  
-- Configure this functions only when using the "custom" preset
Config.CustomFunctions = {
    -- [SERVER] Called when a player mix a drink and create a cocktail
    ---@param source int server id of the player
    ---@param item string the cocktail item, detected from Config.DrinksPattern or "cocktail"
    ---@param metadata table the metadata of the cocktail (already correctly formatted)
    ---@param layers table the layers of the cocktail
    
    GiveCocktail = function(source, item, metadata, layers)
        -- Metadata should be set only if the item its "cocktail"
        -- Layers format example:
        --[[
            {
                {
                    name = "vodka",
                    label = "Vodka",
                    model = "prop_vodka_bottle"
                }, 
                {
                    name = "whiskey",
                    label = "Whiskey",
                    model = "prop_whiskey_bottle"
                }
            }
        ]]

        -- Add your code here
    end,

    -- [SERVER] Checks if a player have the specified job and grade
    ---@param source int server id of the player
    ---@param group string name of the job
    ---@param grade int grade of the job

    ---@return boolean

    HaveGroup = function(source, group, grade)
        -- Add your code here
    end
}