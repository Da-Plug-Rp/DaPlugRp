fx_version 'cerulean'
game 'gta5'
version '1.0.0'

shared_scripts {
    'config.lua'
}

client_script 'client/menu.lua'
client_script 'client/main.lua'

server_script 'server/functions.lua'
server_script 'server/main.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',

	'img/*.png'
}

lua54 'yes'

escrow_ignore {
    'client/menu.lua',
    'config.lua',
    'server/functions.lua'
}
dependency '/assetpacks'