fx_version 'cerulean'
game 'gta5'

description 'fs_trapphone'
version '2.4'
lua54 'yes'

author "Team FwB Studio"

shared_scripts {
	'locales/*.lua',
	'@es_extended/imports.lua',
	'@ox_lib/init.lua',
	'@es_extended/locale.lua',
	'shared/*.lua',

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
    'es_extended',
    'ox_lib',
	
}

escrow_ignore {
	'shared/*.lua',
	'ox_items.lua',
    'server/util.lua',
	'locales/*.lua',
}

dependency '/assetpacks'