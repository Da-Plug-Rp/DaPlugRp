--[[ FX Information ]]--
fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
name         'realistic-needs'
author       'devcore'
version      '3.4'
repository   'https://store.devcore.cz/'
description  'https://discord.gg/zcG9KQj3sa'


shared_scripts {
	'configs/*.lua',
	'@ox_lib/init.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

escrow_ignore {
	'client/functions.lua',
	'client/client.lua',
	'server/server.lua',
	'configs/*.lua',
	'upload/sql/*.sql',
	'upload/inventory/*.sql',
	'upload/inventory/*.txt',
	'upload/icons/*.png',
	'fxmanifest.lua',
	'README.txt'
}

client_scripts {
	'client/*.lua',
}

dependency 'ox_lib'
dependency '/assetpacks'