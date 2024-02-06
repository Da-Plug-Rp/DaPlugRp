fx_version 'cerulean'
game 'gta5'

description 'fs_weaponswitch'
version '2.0'
lua54 'yes'

author "Team FwB Studio"

shared_scripts {
	'shared/*.lua',
	'locales/*.lua',
	'@ox_lib/init.lua',
}

server_script {
	'server/*.lua',
	'shared/*.lua',
}
client_script {
	'client/*.lua',
	'shared/*.lua',
}

dependency {
	'ox_lib',
}

escrow_ignore {
	'shared/*.lua',
	'Installations/**/*.lua',
	'locales/*.lua',
}

dependency '/assetpacks'