fx_version 'adamant'
games { 'gta5' }

mod 'ESX AP DOCUMENTS'
version '1.1'

lua54 'yes'

ui_page 'html/index.html'

files {
    'html/*.*'
}

shared_scripts {
  '@ox_lib/init.lua', -- UNCOMMENT THIS IF YOUR USING OX LIBS
  'config.lua',
  'shared/documents.lua'
}

client_scripts {
  'client/main.lua',
  'client/menu.lua'
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server/custominventory.lua',
  'server/main.lua'
}

escrow_ignore {
	'config.lua',
  'shared/documents.lua',
  'client/menu.lua',
  'server/custominventory.lua'
}
dependency '/assetpacks'