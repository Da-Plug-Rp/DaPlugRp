fx_version 'adamant'
games { 'gta5' }

mod 'ap-court'
version '1.2'

lua54 'yes'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/assets/css/*.css',
	'html/assets/js/*.js',
	'html/assets/fonts/roboto/*.woff',
	'html/assets/fonts/roboto/*.woff2',
	'html/assets/fonts/justsignature/JustSignature.woff',
	'html/assets/images/*.png'
}

shared_scripts {
  --'@ox_lib/init.lua', -- UNCOMMENT THIS IF YOUR USING OX LIBS
  'config.lua',
  'language.lua'
}

client_scripts {
  '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua',
  'client/main.lua',
  'client/target.lua'
}

exports {
  'usingCriminalRecord',
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server/main.lua',
  'server/esx.lua',
  'server/webhook.lua'
}

dependencies {
  'es_extended',
  'PolyZone'
}

escrow_ignore {
	'language.lua',
	'config.lua',
	'client/target.lua',
  'server/webhook.lua'
}
dependency '/assetpacks'