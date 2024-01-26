fx_version "bodacious"

game "gta5"

script "0r_motels"

author "0Resmon"

description "Advanced Motel And Apartment System"

writer "Kibra"

version "1.1.4"

lua54 "yes"

client_scripts {
    "@ox_lib/init.lua",
    "modules/client/pedShot.lua",
    "modules/client/main.lua",
    -- "modules/client/target.lua",
    "modules/client/entity.lua",
    "modules/client/adminMenu.lua",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "config/config_functions.lua",
    "modules/server/main.lua",
    "modules/server/version.lua",
}

shared_scripts {
    "config.lua",
    "config/config_lang.lua",
    "config/config_functions.lua"
}

escrow_ignore {
    "config.lua",
    "config/config_lang.lua",
    "config/config_functions.lua",
    -- "modules/client/pedShot.lua",
    -- "modules/client/main.lua",
    -- "modules/client/entity.lua",
    -- "modules/client/adminMenu.lua",
    -- "modules/server/main.lua",
    -- "modules/server/version.lua",
}

ui_page 'web/index.html'

files {
    "web/js/*",
    "web/index.html",
    "web/style.css",
    "web/pimg/*.png",
    "hash.json",
    "web/back.png",
    "web/back.jpg",
    "web/fonts/*.otf",
    "web/rooms/*"
}

depencedy '0r_lib'

dependency '/assetpacks'