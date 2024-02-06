fx_version 'adamant'
game 'gta5'
description 'FS Clothing As Item'
version '1.4'

shared_script '@es_extended/imports.lua'

server_scripts {
    
    'config.lua',
    'preset/*.lua',
    'server/utils.lua',
    'server/main.lua',

    "locales/locale.lua",
    "locales/en.lua",
}

client_scripts {
    'config.lua',
    'preset/*.lua',
    'client/utils.lua',
    'client/convert.lua',
    'client/main.lua',
    "locales/locale.lua",
    "locales/en.lua",
}

escrow_ignore {
    'locales/*.lua',
    'config*.lua',
    'preset/*.lua',
    'server/utils.lua',
    'client/utils.lua',
    'INSTALL_ME_FIRST/items/qs_inventory.lua'
}

lua54 'yes'

dependencies {
    'es_extended',
    '/server:5181', -- requires at least server build 5181
}
dependency '/assetpacks'

dependency '/assetpacks'