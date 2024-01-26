lua54 'yes'

author "0Resmon"

description "Created by 0Resmon discord.gg/0resmon"

fx_version 'bodacious'

game 'gta5'

version "1.0.2"

script "s4-house"

client_scripts { 'config.lua', 'client/client.lua', 'client/new.lua' }

server_scripts { 'config.lua', '@mysql-async/lib/MySQL.lua', 'server/server.lua', 'server/s4http.js', 'server/version.lua'}

ui_page "nui/ui.html"

files {
	"nui/ui.html",
	"nui/fonts/*.ttf",
	"nui/properties/*.png",
	"nui/interiors/*.png",
	"nui/garages/*.png",
	"nui/items/*.png",
	"nui/s4.png",
	"nui/door_handle.png",
	"nui/style.css",
	"nui/s4.js",
	"nui/images/*.*",
}

escrow_ignore {
    'config.lua',
	-- 'server/server.lua',
	-- 'client/client.lua',
}

dependencies {
	'0r-core',
	'screenshot-basic'
}