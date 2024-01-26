## WARNING: Do NOT rename this resource or it will stop working!!
                                                                                                            
## Thank you for supporting my work by purchasing this scripts!

## For Support, and/or more releases, join my discord at https://discord.gg/BvJbVQhnfA


## Mapping/MLO: This is not my mapping of the Bahama Mama's! It is not included with this script. You may purchase the MLO by visiting the link below:
## Gabz: 



########################################### Update 2.2 ##################################################
•  Added support for qs-inventory
•  Added support for emote menus (rpemotes, scully_emotemenu, or configure emotes below to your system)
•  (IMPORTANT INSTRUCTIONS FOR OX_INVENTORY USERS - SEE STEP 4 BELOW)
•  added client and server editable.lua's for more customization of the script.
##########################################################################################################





*****************************************************************************************************************
 ______  __    __   ______  ________   ______   __        __         ______  ________  ______   ______   __    __ 
|      \|  \  |  \ /      \|        \ /      \ |  \      |  \       /      \|        \|      \ /      \ |  \  |  \
 \$$$$$$| $$\ | $$|  $$$$$$\\$$$$$$$$|  $$$$$$\| $$      | $$      |  $$$$$$\\$$$$$$$$ \$$$$$$|  $$$$$$\| $$\ | $$
  | $$  | $$$\| $$| $$___\$$  | $$   | $$__| $$| $$      | $$      | $$__| $$  | $$     | $$  | $$  | $$| $$$\| $$
  | $$  | $$$$\ $$ \$$    \   | $$   | $$    $$| $$      | $$      | $$    $$  | $$     | $$  | $$  | $$| $$$$\ $$
  | $$  | $$\$$ $$ _\$$$$$$\  | $$   | $$$$$$$$| $$      | $$      | $$$$$$$$  | $$     | $$  | $$  | $$| $$\$$ $$
 _| $$_ | $$ \$$$$|  \__| $$  | $$   | $$  | $$| $$_____ | $$_____ | $$  | $$  | $$    _| $$_ | $$__/ $$| $$ \$$$$
|   $$ \| $$  \$$$ \$$    $$  | $$   | $$  | $$| $$     \| $$     \| $$  | $$  | $$   |   $$ \ \$$    $$| $$  \$$$
 \$$$$$$ \$$   \$$  \$$$$$$    \$$    \$$   \$$ \$$$$$$$$ \$$$$$$$$ \$$   \$$   \$$    \$$$$$$  \$$$$$$  \$$   \$$

******************************************************************************************************************


## 1st Step:
    • Add folder to your server resources folder. (You can remove the install folder after completing the installation)
    

## 2nd Step:
    • Navigate to xmmx-bahamas/config.lua and configure to your server specifications.


## 3rd Step:
    • Find the images at xmmx-bahamas/INSTALL/images. Copy all the images and then paste them into your inventories images directory.
        - for example: ox_inventory/web/images
        - for example: qs-inventory/html/images


## 4th Step: (IMPORTANT INSTRUCTIONS FOR OX_INVENTORY USERS)
    • From the INSTALL folder, localte the appropriate items.lua for your inventory. Copy and paste those items into your inventory system. You 
    may adjust the props and animations to your liking. If you are updating from a previous version, REMOVE THE ITEMS, FUNCTIONS, AND EVENTS
    from ox_inventory that you previously installed, and install the new items


## 5th Step:
    • Navigate to xmmx-bahamas/INSTALL/jobs.sql and import into your database. Be sure to adjust the job roles and pay to your liking.


## Final Step:
    • Add ensure xmmx-bahamas to your server.cfg, then restart your server.


## OPTIONAL:
    • If using cs-hall (FiveM Hall) by Critical Scripts, and you want to use my configuration as shown in the video, copy and paste the config from
      xmmx-bahamas/INSTALL/hall.lua into the config.lua of the cs-hall script.




## Emotes: (pre-configurations below for scully_emotemenu and rpemotes)

## Add to scully_emotemenu/custom_emotes.lua

```lua
---- Bahama Mama's:
        {
            Label = 'Pinacolada',
            Command = 'pinacolada',
            Animation = 'idle_c',
            Dictionary = 'amb@world_human_drinking@coffee@male@idle_a',
            Options = { Flags = { Loop = true, Move = true, },
                Props = { { Bone = 28422, Name = 'prop_pinacolada',
                        Placement = { vector3(0.010000, -0.010000, -0.060000), vector3(0.000000, 0.000000, 0.000000), },
                    },
                },
            },
        },
        {
            Label = 'Cocktail',
            Command = 'cocktail',
            Animation = 'idle_c',
            Dictionary = 'amb@world_human_drinking@coffee@male@idle_a',
            Options = { Flags = { Loop = true, Move = true, },
                Props = { { Bone = 28422, Name = 'prop_cocktail',
                        Placement = { vector3(0.010000, -0.010000, -0.060000), vector3(0.000000, 0.000000, 0.000000), },
                    },
                },
            },
        },
        {
            Label = 'Daiquiri',
            Command = 'daiquiri',
            Animation = 'idle_c',
            Dictionary = 'amb@world_human_drinking@coffee@male@idle_a',
            Options = { Flags = { Loop = true, Move = true, },
                Props = { { Bone = 28422, Name = 'prop_daiquiri',
                        Placement = { vector3(0.010000, -0.010000, -0.060000), vector3(0.000000, 0.000000, 0.000000), },
                    },
                },
            },
        },
        {
            Label = 'Sunrise',
            Command = 'sunrise',
            Animation = 'idle_c',
            Dictionary = 'amb@world_human_drinking@coffee@male@idle_a',
            Options = { Flags = { Loop = true, Move = true, },
                Props = { { Bone = 28422, Name = 'prop_tequsunrise',
                        Placement = { vector3(0.010000, -0.010000, -0.060000), vector3(0.000000, 0.000000, 0.000000), },
                    },
                },
            },
        },
        {
            Label = 'Tequila',
            Command = 'tequila',
            Animation = 'idle_c',
            Dictionary = 'amb@world_human_drinking@coffee@male@idle_a',
            Options = { 
                Flags = { Loop = true, Move = true, },
                Props = { 
                    { 
                        Bone = 28422, 
                        Name = 'prop_tequila',
                        Placement = { vector3(0.010000, -0.010000, -0.060000), vector3(0.000000, 0.000000, 0.000000), },
                    },
                },
            },
        },
        {
            Label = 'Drink Shot',
            Command = 'shotdrink',
            Animation = 'loop_bottle',
            Dictionary = 'mp_player_intdrink',
            Options = { 
                Flags = { Loop = true, Move = true, },
                Props = {
                    {
                        Bone = 18905,
                        Name = 'p_cs_shot_glass_2_s',
                        Placement = { vector3(0.120000, 0.008000, 0.030000), vector3(240.000000, -60.000000, 0.000000), },
                    },
                },
            },
        },
```



## Add to rpemotes/custom_emotes.lua

```lua
   ["pinacolada"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Pina Colada", AnimationOptions =
   {
        Prop = "prop_pinacolada",
        PropBone = 28422,
        PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
        EmoteMoving = true,
        EmoteLoop = true,
   }},
   ["cocktail"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Cocktail", AnimationOptions =
   {
        Prop = "prop_cocktail",
        PropBone = 28422,
        PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
        EmoteMoving = true,
        EmoteLoop = true,
   }},
   ["daiquiri"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Daiquiri", AnimationOptions =
   {
        Prop = "prop_daiquiri",
        PropBone = 28422,
        PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
        EmoteMoving = true,
        EmoteLoop = true,
   }},
   ["sunrise"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Sunrise", AnimationOptions =
   {
        Prop = "prop_tequsunrise",
        PropBone = 28422,
        PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
        EmoteMoving = true,
        EmoteLoop = true,
   }},
   ["tequila"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Tequila", AnimationOptions =
   {
        Prop = "prop_tequila",
        PropBone = 28422,
        PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
        EmoteMoving = true,
        EmoteLoop = true,
   }},
   ["shotdrink"] = {"mp_player_intdrink", "loop_bottle", "Shot Drink", AnimationOptions =
   {
        Prop = "p_cs_shot_glass_2_s",
        PropBone = 18905,
        PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        EmoteMoving = true,
        EmoteLoop = true,
   }},

```