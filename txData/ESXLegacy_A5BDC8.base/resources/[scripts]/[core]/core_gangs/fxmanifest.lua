
fx_version 'adamant'

game 'gta5'

author 'C8re dev team'
description 'Core Gangs war'
version '1.1.2'

lua54 'yes'

ui_page 'html/form.html'

files {
	'html/form.html',
	'html/css.css',
	'html/script.js',
	'html/map.js',
	'html/border/script.js',
	'html/border/border.html',
	'html/border/css.css',
	'html/jquery-3.4.1.min.js',
	'html/img/*.png',
	'html/img/**/*.png',
	'sounds/*.mp3',
	'html/mapStyles/**/*.png',
}

client_scripts{
	'client/main.lua',
}

shared_scripts {
	'config.lua',
	'shared/utils.lua',
	'shared/framework.lua',
}

server_scripts{
	'config_discord.lua',
    'server/main.lua',
	'server/user_config.json',
	'server/functions_override.lua',
	'@oxmysql/lib/MySQL.lua'
}

escrow_ignore {
	'client/main.lua',
	'config.lua',
	'config_discord.lua',
	'server/user_config.json',
	'server/functions_override.lua',
}

dependencies {
	'oxmysql'
}
dependency '/assetpacks'