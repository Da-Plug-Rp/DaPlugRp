fx_version "cerulean"
game "gta5"
lua54 "yes"

description 'Mod to get weapon licenses using UI for theorical test and mini-game for practical part'
author "XeX#2501"

version '1.1.5'

shared_scripts{
	'locales.lua',
	'config.lua',
}

server_scripts {
	'server/*.lua'
}

client_scripts {
	'client/*.lua'
}

ui_page 'ui/ui.html'

files {
	'ui/**',
}

escrow_ignore {
	'locales.lua',
	'config.lua',
	'client/*.lua',
	'server/esx.lua',
	'server/qb.lua'
}


dependency '/assetpacks'