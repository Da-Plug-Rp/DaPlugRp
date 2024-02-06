fx_version 'cerulean'
game 'gta5'

description 'fs_gunjaming'
version '1.0.0'
lua54 'yes'

author "Team FwB Studio"

shared_scripts { 
	'@es_extended/imports.lua',	
	'@es_extended/locale.lua',
	'config.lua',
}

server_script {
			'server/*.lua',
			'@oxmysql/lib/MySQL.lua'
				}
client_script {
		'client/*.lua',
}
 
dependency {
    'es_extended',
    'ox_inventory',
	
}

escrow_ignore {
	'config.lua',
}

dependency '/assetpacks'