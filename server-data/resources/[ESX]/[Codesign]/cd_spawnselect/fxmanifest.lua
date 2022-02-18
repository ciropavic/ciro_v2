fx_version 'cerulean'
game 'gta5'
author 'Codesign#2715'
description 'Spawn Selector'
version '4.0.1'
lua54 'yes'

shared_scripts {
    'configs/locales.lua',
    'configs/config.lua'
}

client_scripts {
    'configs/client_customise_me.lua',
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'configs/server_customise_me.lua',
    'server/*.lua'
}

ui_page {
    'html/index.html'
}
files {
    'configs/mapdata.js',
    'configs/locales_ui.js',
    'html/index.html',
    'html/css/*.css',
    'html/js/*.js',
    'html/images/*.png',
    'html/images/*.svg',
    'html/images/*.jpg'
}

dependency '/server:4752' -- ⚠️PLEASE READ⚠️; Requires at least server build 4752.

escrow_ignore {
    'client/functions.lua',
    'configs/*.lua',
    'server/version_check.lua'
}