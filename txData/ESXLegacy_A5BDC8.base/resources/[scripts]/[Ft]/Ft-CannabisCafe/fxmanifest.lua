fx_version 'adamant'

game 'gta5'

lua54 'yes'

author 'Team Fatality'

description 'Ft-CannabisCafe'

version '3.0'

shared_scripts{
    'shared/*' 
}

client_scripts{
    'client/*'
}

server_scripts{
    'server/*'
}

ui_page 'dist/index.html'

files{ 
    'dist/index.html',
    'dist/assets/*',
    'dist/images/*',
    'dist/sounds/*.ogg'
}

escrow_ignore {
    'Important/*',
    'client/target.lua',
    'shared/config.lua'
}

dependency '/assetpacks'