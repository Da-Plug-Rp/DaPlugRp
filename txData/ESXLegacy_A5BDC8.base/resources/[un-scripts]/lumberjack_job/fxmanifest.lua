fx_version 'cerulean'
game 'gta5'

author 'Your Name'
description 'ESX Lumberjack Job'
version '1.0.0'

client_scripts {
    'config.lua',
    'client.lua',
}

server_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'server.lua',
}

dependencies {
    'es_extended',
}
