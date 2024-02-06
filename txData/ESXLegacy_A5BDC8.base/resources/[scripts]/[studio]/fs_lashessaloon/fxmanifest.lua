fx_version "adamant"

game "gta5"

version '2.0'

description 'FwB Studio'

lua54 'yes'

ui_page 'html/index.html'

shared_scripts {
	'@ox_lib/init.lua'
}

files {
	'html/css/*.css',
	'html/js/*.js',
	'html/img/*.png',
	'html/img/*.jpg',
	'html/index.html',
}

client_script {
	'config.lua',
	'client/*.lua',

}

server_script {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/*.lua',

}

escrow_ignore {
	"config.lua",
	"install_me_first/**/*.lua"
}
dependency '/assetpacks'

dependency '/assetpacks'