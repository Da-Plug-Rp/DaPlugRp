fx_version "cerulean"
games { "gta5" }

skipYarn 'true'

author 'Luxu#0001 <luxu@luxu.gg>'
description "Luxu.gg Discord Bot"
version "1.0.7"
lua54 'yes'

ui_page "nui/index.html"
files { 'nui/*' }

shared_scripts { '@ox_lib/init.lua', '@LuxuModules/init.lua', 'locales/*', }

client_script "client/client.lua"
server_scripts { "bot.lua", "config.lua", "server/server.lua", "server/index.js", "server/misc/*",
      "server/commands/*",
      'server/commands/**/*' }


dependencies {
      '/server:6464',
      'yarn',
      'ox_lib',
      'screenshot-basic',
      'LuxuModules',

}
escrow_ignore {
      'locales/*', 'config.lua', 'bot.lua'
}

dependency '/assetpacks'