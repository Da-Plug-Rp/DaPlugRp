Description 'ngd-tobacco | Nemesis Gaming Development'
author 'deluce#0'
fx_version 'cerulean'
game 'gta5'

shared_scripts {
    "config/config.lua",
    "config/cigtobacco.lua",
    "config/pipetobacco.lua",
    "config/cigartobacco.lua",
    'bridge/bridge.lua',
    'translate.lua'
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}

escrow_ignore {
    "config/*.lua",
    "README.md",
    "fxmanifest.lua",
    "client/editableclient.lua",
    'server/editableserver.lua',
    'translate.lua',
    "tobacco.lua",
    'bridge/**/**/*.lua',
    'bridge/**/*.lua',
    'bridge/bridge.lua',
    'html/camera_ui.html',
    'html/style.css',
    'html/script.js'
}

files {
    'bridge/**/**/client.lua',
    'bridge/**/*.lua',
    'html/camera_ui.html',
    'html/style.css',
    'html/script.js',
    'html/menuimages/*.png'
}

ui_page 'html/camera_ui.html'


lua54 'yes'
use_experimental_fxv2_oal 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/tobacco_YT.ytyp'

dependency '/assetpacks'