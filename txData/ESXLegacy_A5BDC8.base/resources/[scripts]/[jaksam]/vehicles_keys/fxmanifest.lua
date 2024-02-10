version '3.2.1' -- THIS IS THE SCRIPT VERSION

author 'jaksam1074'

shared_scripts {
    "shared/shared.lua"
}

client_scripts {
    -- Callbacks
    "utils/callbacks/cl_callbacks.lua",

    -- Integrations
    'integrations/cl_*.lua',
    'integrations/sh_*.lua',

    -- Miscellaneous
    "utils/miscellaneous/sh_miscellaneous.lua",
    "utils/miscellaneous/cl_miscellaneous.lua",

    -- Framework
    "utils/framework/sh_framework.lua",
    "utils/framework/cl_framework.lua",

    -- Settings
    "utils/settings/cl_settings.lua",

    -- Dialogs
    "utils/dialogs/**/cl_*.lua",

    -- Police
    "utils/police/cl_police.lua",

    -- Locales
    "locales/*.lua",

    -- Script client files
    "client/main.lua",
    "client/extra.lua",
    "client/nui_callbacks.lua",
    "client/player_settings.lua",
    "client/menu.lua",
    "client/jobs_vehicles.lua",
    "client/keys_list.lua",
    "client/alarm.lua",
    "client/hotwire.lua",
    "client/lockpick.lua",
    "client/npc_vehicles.lua",
    "client/vehicle_transfer.lua",
}

server_scripts {
    -- Warnings
    "utils/warnings/sv_*.lua",

    -- Dependency
    '@mysql-async/lib/MySQL.lua',

    -- Callbacks
    "utils/callbacks/sv_callbacks.lua",
    
    -- Integrations
    'integrations/sv_*.lua',
    'integrations/sh_*.lua',    

    -- Database
    "utils/database/database.lua",

    -- Miscellaneous
    "utils/miscellaneous/sh_miscellaneous.lua",
    "utils/miscellaneous/sv_miscellaneous.lua",

    -- Framework
    "utils/framework/sh_framework.lua",
    "utils/framework/sv_framework.lua",

    -- Settings
    "utils/settings/sv_settings.lua",

    -- Dialogs
    "utils/dialogs/**/sv_*.lua",

    -- Police
    "utils/police/sv_police.lua",

    -- Locales
    "locales/*.lua",

    -- Script server files
    "server/main.lua",
    "server/jobs_vehicles.lua",
    "server/menu.lua",
    "server/alarm.lua",
    "server/extra.lua",
    "server/keys_list.lua",
    "server/lockpick.lua",
    "server/vehicle_transfer.lua"
}

ui_page "html/index.html"

files {
    "html/index.html",
    "html/index.js",
    "html/index.css",
    "html/menu_translations/*.json",
    "utils/dialogs/**/*.js",
    "utils/dialogs/**/*.css",
    'html/assets/**/*.*',

    -- For remote control
    "html/*.*",
    "html/assets/*.*",
    "html/assets/fonts/*.*",
}

fx_version 'cerulean' -- (This is NOT the script version)
game 'gta5'

dependencies {
    '/onesync',
    '/server:4752',
    "baseevents" -- From official FiveM -> https://github.com/citizenfx/cfx-server-data/tree/master/resources/%5Bsystem%5D/baseevents
}

lua54 'yes' 

this_is_a_map 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/L1_1.ytyp' 

files {
    'stream/L1_1.ytyp',
    'stream/L1_1.ydr',
}

escrow_ignore {
    -- Integration files
    "integrations/*.lua",

    -- Locales
    "locales/*.lua",

    -- Extra files
    "client/hotwire.lua",
    "client/lockpick.lua",
}
dependency '/assetpacks'