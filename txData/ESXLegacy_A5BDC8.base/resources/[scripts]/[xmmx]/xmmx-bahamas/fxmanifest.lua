fx_version "cerulean"
game "gta5"

lua54 "yes"

author "XMMX SCRIPTS"
description "ESX - Bahama Mamas"
version "2.1"

shared_scripts { 
    '@ox_lib/init.lua',
    'config.lua',
    'locales/*.lua',	
    'shared/*.lua' 
}

client_scripts {
	'client/*.lua',
}

server_scripts { 
    'server/*.lua' 
}

dependencies {
    'ox_lib',
    'ox_target'
}

-- Security Cameras Addition:
ui_page 'client/html/index.html'

files {
	'client/html/index.html'
}

-- CFX Assets Unescrowed:
escrow_ignore { 
    'config.lua', 
    'locales/*.lua', 
    'INSTALL/*',
    'client/html/*',
    'client/editable.lua',
    'server/editable.lua',
}
dependency '/assetpacks'