fx_version 'cerulean'
game 'gta5'

description 'fs_dutysystem'
version '1.0'
lua54 'yes'

author "Team FwB Studio"

shared_scripts {
    '@es_extended/imports.lua',
	'@ox_lib/init.lua',
    '@es_extended/locale.lua',
	'locales/language.lua',
	'shared/SvConfig.lua',
    'shared/Config.lua',
	
}

server_script {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
	
}
client_script {
	'client/*.lua',
	'shared/utils.lua',
}

escrow_ignore {
    'locales/language.lua',
    'shared/*.lua',
	
}

dependency {
    'es_extended',
    'ox_lib',
	
}



dependency '/assetpacks'