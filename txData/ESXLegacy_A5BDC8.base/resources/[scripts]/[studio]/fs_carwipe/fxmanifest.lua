fx_version 'cerulean'
game 'gta5'

version '1.0'
lua54 'yes'

author "Team FwB Studio"

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
	'config/language.lua'
}

server_script {
	'server/*.lua',
	
}
client_script {
	'client/*.lua',
}
 
escrow_ignore {
    'client/unlocked.lua',
	'config/language.lua'
}
dependency '/assetpacks'