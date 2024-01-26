fx_version 'cerulean'
game 'gta5'
description 'east_addiction'

shared_script 'config.lua'

client_scripts {
    'client/*.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

escrow_ignore {
    'config.lua'
}

lua54 'yes'
dependency '/assetpacks'