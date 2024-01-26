# m-Fishing script for QB-Core

| If you are intested in recieving updates join the community on **[Discord](https://discord.gg/marcinhu)**! |

# About:

- Highly Optimized
- Many Features
- Full and easy customization
- 0.00ms
- Drops configured for each fishing rod
- Drops configured for each fishing net
- Compatible with ox target
- Compatible with ox inventory
- Compatible with ox menu
- Compatible with "none" or "qs" or "renewed"
- Minigame on normal fishing. ( optional )
- Configurable zones with radius, type of zone
- Experience system
- Boats are rented depending on the experience of the player
- Custom fishingrod props
- Custom fishingnet props
- Custom shell's props
- Custom coral's props
- Illegal bait can only be obtained with a specific fish.
- Illegal bait can only be created in illegal zones. ( optional )
- Minigame on creating illegal bait. ( optional )
- Webhooks on all events server-side
- Crafting system to upgrade the fishingnet / fishingrod.
- Protected server-side events.
- Treasure chests
- Fishing license
- Fishing tournaments
- Illegal selling corals
- Illegal fishing
- 47 new items

# How the script works:

**Fishing Rod (config_fishingrod.lua):**
- Configurable drops for each level
- Configurable amount for each drop for each level
- Configurable props for each level
- Configurable progress bar time for each level
- Configurable zones and their radius
- Each zone can be chosen as "legal," "illegal," or "all"
- Configurable animations

**Fishing Net (config_fishingnet.lua):**
- Configurable drops for each level
- Configurable amount for each drop for each level
- Configurable props for each level
- Configurable progress bar time for each level
- Configurable zones with radius and associated blip
- Ability to activate the running net and the chance of it happening
- Listing of props for the fish that appear in the net
- Configurable animations

**Seashell Harvesting (config_seashell.lua):**
- Configurable animations
- 15 predefined locations
- Configurable progress bar time
- Configurable props for each location
- Configurable list of drops
- Configurable the items for selling
- Configurable blips, peds

**Fishing Tournaments (config_tournament.lua):**
- Configurable maximum number of participants
- Configurable entry time for tournament participation
- Configurable payment type "cash" or "bank"
- Configurable bait type "legal" or "illegal"
- Configurable commands and their permissions
- Configurable blips
- List of fish that can be caught when participating in a tournament
- Configurable requirements when creating a tournament

**Upgrades (config_upgrades.lua):**
- Ability to change the required items for each upgrade
- Configurable names

**General (config.lua):**
- Configurable qb-core name
- Configurable display as "target" or "showHelpText"
- Configurable inventory for "qb," "ox," and "qs"
- Configurable help text for "qb" or "ox"
- Configurable emote menu "rp" or "dp"
- Configurable vehicle keys for "qb" or "qs"
- Configurable dispatch for 'ps-dispatch' -- "ps-dispatch" or "cd_dispatch" or "qs-dispatch"
- Configurable fuel for "LegacyFuel" or "okokFuel" or "ox_fuel" or "ti_fuel" or "qs-fuel"
- Configurable notify for "qb" or "okok" or "ox"
- Enable/disable the minigame ("ps-ui" or "bl_ui" or "ox_lib")
- Enable/disable debug system
- Blips for Fishing Shop, Selling Items, and Renting Boats
- Configurable fish selling with minimum and maximum prices
- Configurable boat rentals based on player experience
- Configurable experience gain for legal fishing, illegal fishing, or fishing with a net
  - Illegal Bait:
    - Possibility to activate a mini-game
    - Possibility to only create it in illegal zones
    - Configurable required item
    - Configurable creation time
    - Configurable fish required for creation
    - Configurable amount received for illegal bait per fish
- Configurable cooking items
    - Option to change the items for players cooking
    - Amount receive after cooking
- Configurable usable items cooking
    - Item used to consume
    - Effects for each item
    - Values of the effect for each item
- Configurable trasure opening
    - Reward items list

**Diving Fishing (config_diving.lua):**
- Configurable mask model
- Configurable oxygen tank model
- Configurable animation for when the player searches corals
- Configurable ped, zone, and sell locations
- Configurable each coral price selling
- Configurable animations when player collect a coral
- Configurable chance to get a trasure chest
- Enable/disable treasure chests and the chance of it happening
- Unlimited locations with defined props for each location and rewards

**Other Things:**
- *File sv_utils.lua:*
    - Configurable webhooks in the file
    - Event to provide experience to the player
    - Open functions:
        - Get Player
        - Has Item
        - Register Usable Item
        - Add Item
        - Remove Item
        - Add Money
        - Remove Money
- *File cl_utils.lua:*
    - Upgrades function
    - Sell Fishing function
    - Sell Seashell function
    - Sell Corals function
    - Tournament menu
- *File config_functions.lua*
    - Customizable Notify function
    - Customizable GiveKeys function
    - Customizable SetFuel function
    - Customizable SendHelpText function
    - Customizable RemoveHelpText function
    - Customizable OpenFishingShop function
    - Customizable StartMinigame function
    - Customizable StartAnimation function
    - Customizable CallCops function
    

# Required:

You need to SetUp `fishing.sql`. Basically click on the file and run it using HeidSQL.


# Installation:

1. ox_inventory/data/items.lua

```lua

    ['fishingrod1'] = { label = 'Fishingrod Level 1', weight = 1000, stack = true, allowArmed = false },
	['fishingrod2'] = { label = 'Fishingrod Level 2', weight = 1000, stack = true, allowArmed = false },
	['fishingrod3'] = { label = 'Fishingrod Level 3', weight = 1000, stack = true, allowArmed = false },
	['fishingrod4'] = { label = 'Fishingrod Level 4', weight = 1000, stack = true, allowArmed = false },
	['fishingrod5'] = { label = 'Fishingrod Level 5', weight = 1000, stack = true, allowArmed = false },

	['fishnet1'] = { label = 'Fishing net Nivel 1', weight = 1000, stack = true, allowArmed = false },
	['fishnet2'] = { label = 'Fishing net Nivel 2', weight = 1000, stack = true, allowArmed = false },
	['fishnet3'] = { label = 'Fishing net Nivel 3', weight = 1000, stack = true, allowArmed = false },
	['fishnet4'] = { label = 'Fishing net Nivel 4', weight = 1000, stack = true, allowArmed = false },
	['fishnet5'] = { label = 'Fishing net Nivel 5', weight = 1000, stack = true, allowArmed = false },

	['mackerel'] = { label = 'Mackerel', weight = 25, stack = true, allowArmed = false },
	['cod'] = { label = 'Cod', weight = 25, stack = true, allowArmed = false },
	['seabass'] = { label = 'Sea Bass', weight = 25, stack = true, allowArmed = false },
	['sole'] = { label = 'Sole', weight = 25, stack = true, allowArmed = false },
	['stingray'] = { label = 'Stingray', weight = 25, stack = true, allowArmed = false },
	['salmon'] = { label = 'Salmon', weight = 25, stack = true, allowArmed = false },
	['tunafish'] = { label = 'Tuna fish', weight = 25, stack = true, allowArmed = false },
	['sardine'] = { label = 'Sardine', weight = 25, stack = true, allowArmed = false },
	['catfish'] = { label = 'Catfish', weight = 25, stack = true, allowArmed = false },
	['monkfish'] = { label = 'Monkfish', weight = 25, stack = true, allowArmed = false },

	['fishingtin'] = { label = 'Fishing Tin', weight = 2500, stack = true, allowArmed = false },
	['fishingboot'] = { label = 'Fishing Boot', weight = 2500, stack = true, allowArmed = false },

	['dolphin'] = { label = 'Dolphin', weight = 15000, stack = true, allowArmed = false },
	['tigershark'] = { label = 'Tiger shark', weight = 5000, stack = true, allowArmed = false },
	['hammershark'] = { label = 'Hammer shark', weight = 5000, stack = true, allowArmed = false },
	['whale'] = { label = 'Whale', weight = 5000, stack = true, allowArmed = false },

	['fishbait'] = { label = 'Fish Bait', weight = 400, stack = true, allowArmed = false },
	['illegalfishbait'] = { label = 'Illegal Fish Bait', weight = 400, stack = true, allowArmed = false },
	['anchor'] = { label = 'Boat Anchor', weight = 2500, stack = true, allowArmed = false },
	['diving_gear'] = { label = 'Diving Gear', weight = 30000, stack = true, allowArmed = false },
	['diving_fill'] = { label = 'Diving Tube', weight = 3000, stack = true, allowArmed = false },

	['treasurechest'] = { label = 'Treasure Chest', weight = 2500, stack = true, allowArmed = false },
	['fishingkey'] = { label = 'Corroded Key', weight = 100, stack = true, allowArmed = false },

	['bonfire'] = { label = 'Campfire', weight = 20, stack = true, allowArmed = false },
	['cookedcod'] = { label = 'Cooked Cod', weight = 20, stack = true, allowArmed = false },
	['cookedmackerel'] = { label = 'Cooked Mackerel', weight = 20, stack = true, allowArmed = false },

	['conch'] = { label = 'Conch', weight = 500, stack = true, allowArmed = false },
	['sea_snail'] = { label = 'Sea Snail', weight = 500, stack = true, allowArmed = false },
	['shell'] = { label = 'Shell', weight = 500, stack = true, allowArmed = false },
	['conch_shell'] = { label = 'Shell', weight = 500, stack = true, allowArmed = false },
	['starfish'] = { label = 'Starfish', weight = 500, stack = true, allowArmed = false },
	['knife'] = { label = 'Knife', weight = 500, stack = true, allowArmed = false },

	['red_coral'] = { label = 'Red Coral', weight = 500, stack = true, allowArmed = false },
	['yellow_coral'] = { label = 'Yellow Coral', weight = 500, stack = true, allowArmed = false },
	['blue_coral'] = { label = 'Blue Coral', weight = 500, stack = true, allowArmed = false },
	['pink_coral'] = { label = 'Pink Coral', weight = 500, stack = true, allowArmed = false },
	['white_coral'] = { label = 'White Coral', weight = 500, stack = true, allowArmed = false },
	['green_coral'] = { label = 'Green Coral', weight = 500, stack = true, allowArmed = false },
	['babyblue_coral'] = { label = 'Baby Blue Coral', weight = 500, stack = true, allowArmed = false },

```

