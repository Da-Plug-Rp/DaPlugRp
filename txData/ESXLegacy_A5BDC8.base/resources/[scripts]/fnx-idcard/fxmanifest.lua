fx_version 'adamant'

game 'gta5'

this_is_a_map "yes"

ui_page 'html/index.html'
lua54 'yes'

author 'Fenix Development'
version '1.5.5'

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua',
	'core.lua',
}

server_script {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
}

client_script {
	'client/*.lua'
}

files {
	'html/index.html',
	'html/assets/css/*.css',
	'html/assets/js/*.js',
	'html/assets/image/*.png',
}

escrow_ignore {
    'config.lua',
	'core.lua',
}

dependency {
	'ox_lib',
	'screenshot-basic'
}
dependency '/assetpacks'