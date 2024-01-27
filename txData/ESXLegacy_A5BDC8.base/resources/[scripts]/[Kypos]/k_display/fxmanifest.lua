fx_version 'cerulean'
game 'gta5'

author 'Kypos'

discription 'Display stands for FiveM servers'
version '1.0.0'


shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua',
    'Framework/**/server/*.lua',
}

lua54 'yes'

files {
    'html/*.*',
    'stream/display_stand.ytyp'
}

data_file 'DLC_ITYP_REQUEST' 'display_stand.ytyp'

ui_page 'html/index.html'


escrow_ignore {
    'config.lua',
    'server/server_editable.lua',
    'Framework/**/*.lua',

}
  
dependency '/assetpacks'