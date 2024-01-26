fx_version { "cerulean"}
game { "gta5" }

lua54 { "yes" }

author { "XMMX Development" }
description { "[QB/ESX] Lets Camp!" }
version { '1.6' }

shared_scripts { 
    '@ox_lib/init.lua', -- delete or comment out if not using ox_lib.
    'config.lua', 
    'shared/*.lua', 
    'locales/*.lua', 
}

client_scripts { 'client/*.lua' }
server_scripts { 'server/*.lua' }

escrow_ignore { 
    'client/editable.lua',
    'config.lua', 
    'locales/*.lua', 
    'INSTALL/*' 
}
dependency '/assetpacks'