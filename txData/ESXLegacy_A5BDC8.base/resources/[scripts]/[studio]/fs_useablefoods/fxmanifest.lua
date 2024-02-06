fx_version 'cerulean'
game 'gta5'

description 'fs_trapphone'
version '2.0'
lua54 'yes'

author "Team FwB Studio"

ui_page "web/index.html"
shared_scripts {
    '@es_extended/imports.lua',
	'@ox_lib/init.lua',
	'@es_extended/locale.lua',
    'config/config.lua',
    'config/drinks.lua',
    'config/drunks.lua',
    'config/eatable.lua',
    'config/icecream.lua',
	
}
files {
	"web/**/*",
}
server_script {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
	
}
client_script {
	'client/*.lua',

}

escrow_ignore {
    'config/*.lua',
    'installation/sql/ox_items.lua',
    'server/editable.lua',
}
 
data_file 'DLC_ITYP_REQUEST' 'stream/fs_prop_food.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/fs_prop_drink.ytyp'
dependency '/assetpacks'