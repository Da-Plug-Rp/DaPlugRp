fx_version 'cerulean'
game 'gta5'

description 'fs_wigsbundles'
version '1.3'
lua54 'yes'

author "Team FwB Studio"
data_file 'DLC_ITYP_REQUEST' 'stream/fs_prop_table_queens.ytyp'
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
	'shared/utils.lua',
}

escrow_ignore {
    'locales/language.lua',
    'shared/*.lua',
    'Install_Me_First/**/*.lua',
}

dependency {
    'es_extended',
    'ox_lib',
}



dependency '/assetpacks'