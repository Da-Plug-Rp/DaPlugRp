fx_version 'cerulean'
game 'gta5'

description 'fs_ChopShop'
version '1.2'
lua54 'yes'

author "Team FwB Studio"
 
shared_scripts {
    '@es_extended/imports.lua',
	'@ox_lib/init.lua',
    '@es_extended/locale.lua',
	'locales/language.lua',
    'shared/Config.lua',
	
}

server_script {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
	
}
client_script {
	'client/*.lua',
}

escrow_ignore {
    'client/unlocked.lua',
    'locales/language.lua',
    'shared/*.lua',
    'Install_Me_First/**/*.lua',
}

dependency {
    'es_extended',
    'ox_lib',
}



dependency '/assetpacks'