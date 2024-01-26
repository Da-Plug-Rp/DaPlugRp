author 'jaksam1074'

version '3.15'

server_scripts {
    -- Warnings
    "utils/warnings/sv_*.lua",

    -- Config
    "sv_config.lua",
    "sh_config.lua",

    -- Callbacks
    "utils/callbacks/sv_callbacks.lua",

    -- Integrations
    'integrations/sh_integrations.lua',
    'integrations/sv_integrations.lua',    

    -- Miscellaneous
    "utils/miscellaneous/sh_miscellaneous.lua",
    "utils/miscellaneous/sv_miscellaneous.lua",

    -- Settings
    "utils/settings/sv_settings.lua",

    -- Framework
    'utils/framework/sh_framework.lua',
    'utils/framework/sv_framework.lua',    

    -- Dependency
    '@mysql-async/lib/MySQL.lua',

    -- Locales
    'locales/*.lua',
    
    -- Database creation
    'utils/database/database.lua',

    -- Server
    'server/main.lua',
    'server/code_integrator.lua',
}

client_scripts {
    -- Config
    "sh_config.lua",
    'cl_config.lua',

    -- Callbacks
    "utils/callbacks/cl_callbacks.lua",

    -- Integrations
    'integrations/sh_integrations.lua',
    'integrations/cl_integrations.lua',
    
    -- Miscellaneous
    "utils/miscellaneous/sh_miscellaneous.lua",
    "utils/miscellaneous/cl_miscellaneous.lua",

    -- Settings
    "utils/settings/cl_settings.lua",

    -- Framework
    'utils/framework/sh_framework.lua',
    'utils/framework/cl_framework.lua',

    -- Locales
    "locales/*",

    -- Client
    'client/kvp.lua',
    'client/main.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
}

lua54 'yes'

this_is_a_map 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/L1_1.ytyp' 

files {
    'stream/L1_1.ytyp',
    'stream/L1_1.ydr',
}

escrow_ignore {
    "cl_config.lua",
    "sv_config.lua",
    "sh_config.lua",

    "integrations/*.lua",

    "locales/*.lua",
}

dependencies {
    '/server:4752'
}

fx_version 'cerulean'
game 'gta5'
dependency '/assetpacks'