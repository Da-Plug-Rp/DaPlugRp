fx_version 'cerulean'
game 'gta5'

description 'fs_fraud'
version '2.0'
lua54 'yes'

author "Team FwB Studio"
data_file 'DLC_ITYP_REQUEST' 'stream/fs_prop_sweeper_1.ytyp'
shared_scripts {
    '@es_extended/imports.lua',
	'@ox_lib/init.lua',
    '@es_extended/locale.lua',
	'locales/language.lua',
    'shared/Config.lua',
	
}

server_script {
	'server/*.lua',
}
client_script {
	'client/*.lua',
}

escrow_ignore {
    'client/datacrack.lua', -- minigame by utkali https://github.com/utkuali/datacrack
    'locales/language.lua',
    'shared/*.lua',
    'Install_Me_First/**/*.lua',
    'client/unlocked.lua',
    'server/unlocked.lua',
    'client/datacrack.lua',
}

dependency {
    'es_extended',
    'ox_lib',
}



dependency '/assetpacks'