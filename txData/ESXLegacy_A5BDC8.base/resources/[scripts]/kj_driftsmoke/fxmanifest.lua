-- Resource Metadata
fx_version 'cerulean'
games {'gta5'}
lua54 'yes'

author 'KJ @thisisnotkj'
description 'KJ_DRIFTSMOKE - Custom Drift Smoke'
version '1.0.0'

shared_scripts {
    'config.lua',
}
client_scripts {
    'client/*.lua',
}
server_scripts{
    'server/*.lua',
}

escrow_ignore {
    'config.lua',
    'README.md'
}


dependency '/assetpacks'