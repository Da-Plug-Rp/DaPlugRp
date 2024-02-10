fx_version('cerulean')
games({ 'gta5' })
author "aymannajim"
lua54 "yes"

shared_script('config.lua');

ui_page "nui/index.html"


files {
	'nui/index.html',
	'nui/click.mp3',
	'nui/style.css',
	'nui/script.js',
}

server_scripts({
    'server.lua',
});

client_scripts({
    'client.lua',
});

escrow_ignore {
	"*",
	"*/*",
}
dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks'