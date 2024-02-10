fx_version 'adamant'

game 'gta5'

client_script { 
"config.lua",
"main/client.lua"
}

server_script {
"main/server.lua",
'@mysql-async/lib/MySQL.lua',
"config.lua"
} 

ui_page "html/index.html"

files {
    'html/index.html',
    'html/*.js',
    'html/*.css',
    'html/images/*.png',
    'html/images/games/*.png',
    'html/images/games/*.jpg',
    'html/images/bg/*.png'
}

escrow_ignore {
    -- 'main/client.lua',
    -- 'main/server.lua'
}

data_file 'DLC_ITYP_REQUEST' 'cyan.ytyp'
data_file 'DLC_ITYP_REQUEST' 'red.ytyp'
data_file 'DLC_ITYP_REQUEST' 'gray.ytyp'
data_file 'DLC_ITYP_REQUEST' 'green.ytyp'
data_file 'DLC_ITYP_REQUEST' 'pink.ytyp'
data_file 'DLC_ITYP_REQUEST' 'purple.ytyp'

lua54 'yes'
dependency '/assetpacks'
dependency '/assetpacks'