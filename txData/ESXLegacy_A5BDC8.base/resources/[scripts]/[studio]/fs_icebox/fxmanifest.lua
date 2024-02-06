fx_version 'adamant'
game 'gta5'

description 'fs_icebox'
version '1.1'
lua54 'yes'

author "Team FwB Studio"

ui_page "nui/main.html"

shared_script {
    "@ox_lib/init.lua",
	"shared/shared.lua",
	"@es_extended/imports.lua",
}

client_scripts {
	"config.lua",
	"client/*.lua",
	"locales/*.lua",
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"config.lua",
	"server/*.lua",
	"locales/*.lua",
}

files {
	"nui/**/*",
}

escrow_ignore {
    "config.lua",
    "locales/*.lua",
    "client/unlocked.lua",
    "INSTALL_ME_FIRST/**/*.lua",
	
}

dependencies {
    'es_extended',
    'ox_lib',
}
dependency '/assetpacks'
dependency '/assetpacks'