fx_version "cerulean"
game "gta5"
lua54 "yes"

client_scripts {
    "@utility_lib/client/native.lua",
    "config.lua",
    "build/client/*.lua",
}

server_scripts {
    "config.lua",
    "build/server/*.lua",
}

files {
    "dui/**.*",
}

dependencies {
    "/gameBuild:2699",
    "/onesync",
}

escrow_ignore {
    "config.lua"
}
dependency '/assetpacks'