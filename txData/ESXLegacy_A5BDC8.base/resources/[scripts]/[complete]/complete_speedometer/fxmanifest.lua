fx_version 'adamant'
lua54 'on'
game 'gta5'

ui_page 'html/main.html'

files {
	'html/main.html',
	'html/jquery-3.4.1.min.js',
	'html/app.js',
	'html/style.css',
}

client_scripts{
    'config.lua',
    'client/client.lua',
}

escrow_ignore {
    "config.lua",
}
dependency '/assetpacks'