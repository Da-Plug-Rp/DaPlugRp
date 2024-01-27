fx_version 'cerulean'
game 'gta5'
lua54 'yes'
name 'MarketShop Sandy'
version '1.2.0'
author 'Sarish, Patatichette'
description 'Market shop by PataMods in collaboration with GigZ https://discord.gg/patamods'



ui_page 'html/index.html'

files {
	'html/index.html',
	'html/itemIMG/*.*',
	'html/img/*.*',
	'html/img/overlayAisle/*.*',
	'html/audio/*.*',
	'html/font/*.*',
	'html/debug.js',
	'html/ItemPicture.js',
	'html/app.js',
	'html/style.css'
}

shared_scripts {
    '@ox_lib/init.lua',
	"dataCoords/data.lua",
	"config/config.lua",
	"lang/*.lua",
	
}

server_scripts {
	"@oxmysql/lib/MySQL.lua",
    'unencryptedServer/*.lua',
	"server/*.lua",
	"unencryptedServer/esx/*.lua",
	"unencryptedServer/qbus/*.lua",
	"unencryptedServer/otherFramework/*.lua",
}

client_scripts {
    'unencryptedClient/debug.lua',
	'client/entitySet.lua',
    'unencryptedClient/*.lua',
	"unencryptedClient/esx/*.lua",
	"unencryptedClient/qbus/*.lua",
	"unencryptedClient/otherFramework/*.lua",
	'client/*.lua',
}


escrow_ignore {
 'config/*.*',
 'config/**/*.*',
 
 'unencryptedClient/*.*',
 'unencryptedClient/**/*.*',
 
 'unencryptedServer/*.*',
 'unencryptedServer/**/*.*',
 
 'lang/*.*',
 'lang/**/*.*',
}


dependency '/assetpacks'