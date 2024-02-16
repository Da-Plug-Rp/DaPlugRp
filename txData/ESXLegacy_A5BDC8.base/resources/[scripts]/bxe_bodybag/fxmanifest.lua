fx_version 'adamant'
game 'gta5' 

lua54 'yes'

author 'ButcherXclusivee'
description 'Bodybag and Bury script for ESX'
version '1.1'

client_script {
    'client/*.lua'
}

server_scripts {'server/*.lua'}

shared_scripts {'@es_extended/imports.lua','@ox_lib/init.lua','configuration/*.lua'}


escrow_ignore {
    "configuration/*.lua"
}
dependency '/assetpacks'