fx_version 'cerulean'
game 'gta5'

description 'fs_shopsystem'
version '1.0'
lua54 'yes'

author "Team FwB Studio"

ui_page "web/index.html"
shared_scripts {
    '@es_extended/imports.lua',
	'@ox_lib/init.lua',
    '@es_extended/locale.lua',
	'locales/language.lua',
	'shared/*.lua',
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
    'locales/language.lua',
    'shared/*.lua',
    'installation/**/*.lua',
}
dependency '/assetpacks'