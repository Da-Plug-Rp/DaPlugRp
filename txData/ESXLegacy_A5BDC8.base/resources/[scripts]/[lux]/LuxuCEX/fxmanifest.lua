fx_version 'cerulean'
game 'gta5'
lua54 'yes'
version '2.1.6'
author 'Luxu.gg'
description 'Crypto Exchange by Luxu.gg'

skipYarn 'yes'


ui_page('nui/index.html')

files { 'nui/index.html', 'nui/**/*', "locales/*.json" }

shared_scripts { '@ox_lib/init.lua', '@LuxuModules/init.lua', 'config.lua' }

client_scripts {
      'client/*'
}
server_scripts { '@mysql-async/lib/MySQL.lua', 'secrets.lua', 'server/server.lua', 'server/webhooks.lua',
      'server/server-public-events.lua', 'server/functions.lua', 'server/server.js' }

escrow_ignore {
      'config.lua',
      'server/server-public-events.lua',
      'client/notify.lua',
      'server/webhooks.lua',
      "server/functions.lua",
      'secrets.lua'
}
dependencies {
      'ox_lib',
      'LuxuModules'
}

dependency '/assetpacks'