fx_version "cerulean"
description "AV Vehicleshop"
author "Avilchiis"
version '2.0.0'
lua54 'yes'
games {
  "gta5"
}

ui_page 'web/build/index.html'

shared_scripts {
-- '@ox_lib/init.lua', -- Uncomment this if you aren't using ESX/QBCore
 "config/*.lua",
 "categories/*.lua",
}

client_scripts {
 "client/**/*.lua",
} 

server_scripts {
 '@oxmysql/lib/MySQL.lua',
 "server/**/*.lua"
}

files {
 'web/build/index.html',
 'web/build/**/*',
}

escrow_ignore { 
 "config/*.lua",
 "categories/*.lua",
 "client/framework/*.lua",
 "server/framework/*.lua",
 "server/photobooth/*.lua",
}
dependency '/assetpacks'