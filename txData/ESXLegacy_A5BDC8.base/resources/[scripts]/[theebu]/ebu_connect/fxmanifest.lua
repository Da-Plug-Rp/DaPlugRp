fx_version 'adamant'
game 'gta5'

description 'Connect Trailer Script'
author 'theebu'
lua54 'yes'
version '0.1.3'

client_scripts {
	'client/client.lua',
	'client/utils.lua'
}
server_scripts {
	'server/server.lua'
}
shared_scripts {
	'config.lua',
}
escrow_ignore {
	'config.lua',
	'client/utils.lua'
}
dependency '/assetpacks'