fx_version 'cerulean'

game 'gta5'

description 'ESX Evidence System'

author 'TuKeh_'

version '2.0.1'

lua54 'yes'

shared_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'config.lua',
}

client_scripts {
    'client/main_editable.lua',
    'client/main.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    'server/main_editable.lua',
    'server/main.lua',
}

ui_page 'web/index.html'

files {
    'web/*.*'
}

escrow_ignore {
    'locales/*.lua',
    'config.lua',
    'client/main_editable.lua',
    'server/main_editable.lua',
}

exports {
    'GSRTest',
    'removeGSR',
    'SaveFingerprint',
}

dependencies {
    'es_extended'
}

dependency '/assetpacks'