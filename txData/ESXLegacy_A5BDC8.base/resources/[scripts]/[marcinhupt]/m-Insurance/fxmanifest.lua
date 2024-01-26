fx_version 'cerulean'
author 'marcinhu#0001'
Description 'm-Insurance'
game 'gta5'

data_file 'DLC_ITYP_REQUEST' 'stream/m_insurance_cards.ytyp'

ui_page 'html/index.html'

shared_scripts {
    "@ox_lib/init.lua",
    "config/**",
}

server_script {
    '@oxmysql/lib/MySQL.lua',
    "server/**.lua",
}

client_script {
    "client/**.lua",
}

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/main.js',
    'html/img/*'
}

escrow_ignore {
    "images/**",
    "config/**",
    "README.lua",
    "SQL.sql",
}

lua54 'yes'
dependency '/assetpacks'

dependency '/assetpacks'