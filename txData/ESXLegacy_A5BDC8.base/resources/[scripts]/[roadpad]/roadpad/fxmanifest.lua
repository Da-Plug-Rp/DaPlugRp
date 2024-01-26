fx_version 'bodacious'

game 'gta5'

author 'RoadShop | https://fivem.roadshop.org'
description 'RoadPad FiveM Tablet'
version '1.3.0'

lua54 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/prop/ipad.ytyp'

ui_page 'public/index.html'

files {
    'public/index.html',
    'public/assets/*.*',
    'public/img/*.*',
    'public/img/**/*.*',
    'public/img/**/**/*.*',
    'public/static/sounds/*.ogg',
    'public/static/sounds/*.mp3',
    'public/static/config/config.json'
}

shared_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'locales/*.lua',
    'addons/**/config.lua'
}

client_scripts {
    'client/client.lua',
    'client/clientAPI.lua',
    'client/animation.lua',
    'client/music.lua',
    'client/camera.lua',
    'client/twitter.lua',
    'client/airdrop.lua',
    'client/valet.lua',
    'client/mail.lua',
    'client/notes.lua',
    'client/vehicle_names.lua',
    'client/billing.lua',
    'client/marketplace.lua',
    'client/messages.lua',
    'addons/**/client/*.lua'
}


server_scripts {
    --'@oxmysql/lib/MySQL.lua',
    '@mysql-async/lib/MySQL.lua',
    'API.lua',
    'server/server.lua',
    'server/serverAPI/serverAPI.lua',
    'server/music.lua',
    'server/twitter_app.lua',
    'server/serverAPI/valet.lua',
    'server/mail_app.lua',
    'server/airdrop.lua',
    'server/versioncheck.lua',
    'server/business.lua',
    'server/billing.lua',
    'server/notes.lua',
    'server/bank.lua',
    'server/crypto.lua',
    'server/marketplace.lua',
    'addons/**/server/*.lua'
}

escrow_ignore {
    'config.lua',
    'API.lua',
    'locales/*.lua',
    'client/clientAPI.lua',
    'client/vehicle_names.lua',
    'client/camera.lua',
    'server/serverAPI/*.lua',
    'addons/**/config.lua'
}

dependencies {
    '/server:6683',
    '/onesync',
    'es_extended',
    'xsound'
}

server_exports {
    'addBankTransfer',
    'sendAirdrop',
    'addcrypto',
    'removecrypto',
    'checkcryptoamount',
}

exports {
    'isTabletOpen',
    'closeTablet',
    'toggleTablet',
    'getRoadPad',
    'isFlashlight',
    'sendMail',
    'sendMailOffline'
}
dependency '/assetpacks'