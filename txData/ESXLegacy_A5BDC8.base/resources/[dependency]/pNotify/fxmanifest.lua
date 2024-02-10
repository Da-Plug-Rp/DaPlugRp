fx_version 'cerulean'
game 'gta5'

name 'Simple Notification Script using https://notifyjs.com/'
author 'Simple Notification Script using https://notifyjs.com/'
version '1.0.1'

ui_page "html/index.html"

client_script "cl_notify.lua"

export "SetQueueMax"
export "SendNotification"

files {
    "html/index.html",
    "html/pNotify.js",
    "html/noty.js",
    "html/noty.css",
    "html/themes.css",
}