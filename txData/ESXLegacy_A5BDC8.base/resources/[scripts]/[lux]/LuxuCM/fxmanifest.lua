fx_version 'cerulean'
game 'gta5'
lua54 'yes'
version '3.1.3'
author 'luxu.gg'
description 'Crypto Mining'

shared_scripts { '@ox_lib/init.lua', '@LuxuModules/init.lua', 'config.lua', 'locales/*', 'shared/*' }

ui_page('nui/index.html')
files { 'nui/index.html', 'nui/**/*', 'nui/*', 'dui/*', 'dui/*' }


client_scripts {
      'client/_.lua', 'client/animations.lua', 'client/cl_utils.lua', 'client/menus.lua', 'client/pickup_with_truck.lua',
      'client/client.lua'
}

server_scripts { '@mysql-async/lib/MySQL.lua', 'discord.lua', 'server/*' }

escrow_ignore {
      'config.lua',
      'client/menus.lua',
      'client/cl_utils.lua',
      'server/sv_utils.lua',
      'server/webhook.lua',
      'locales/*',
      'discord.lua'
}

dependencies {
      'ox_lib',
      'LuxuModules',
      '/onesync'
}

dependency '/assetpacks'