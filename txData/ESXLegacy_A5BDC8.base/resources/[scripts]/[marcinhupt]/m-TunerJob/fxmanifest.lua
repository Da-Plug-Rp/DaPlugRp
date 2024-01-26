fx_version 'cerulean'
game 'gta5'

shared_script {
  '@ox_lib/init.lua',
  '@es_extended/imports.lua', -- Uncomment if you use new ESX
  'configs/**.lua',
}

author 'marcinhu#0001'
version '2.0'

client_scripts {
  '@es_extended/locale.lua',
	'client/**.lua',
}

server_scripts {
  '@es_extended/locale.lua',
	'@oxmysql/lib/MySQL.lua',
	'server/**.lua'
}

escrow_ignore {
  "server/s_itens.lua",
  "client/c_shop.lua",
  "[Dependencies]/**",
  "client/c_targets.lua",
  "client/c_editable.lua",
  "server/s_editable.lua",
  "configs/**.lua",
  "README.lua",
  "images/**",
  "Install-OX-Inventory.md",
  "Install-QS-Inventory.md",
  "SQL_OX-Inventory.sql",
  "SQL_QS-Inventory.sql",
}


lua54 "yes"
dependency '/assetpacks'