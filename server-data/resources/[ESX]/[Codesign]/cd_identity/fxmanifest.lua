fx_version 'cerulean'
game 'gta5'
author 'Codesign#2715'
description 'Identity'
version '4.0.0'
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
    'server/server.lua',
    'server/version_check.lua'
}

ui_page 'html/index.html'

files {
    'configs/locale_ui.js',
    'html/index.html',
    'html/css/*.css',
    'html/js/*.js',
    'html/images/id-card/*.png',
    'html/images/*.png',
    'html/images/*.jpg',
    'html/fonts/CristhynaSignature.ttf'
}

dependency '/server:4752' -- ⚠️PLEASE READ⚠️; Requires at least server build 4752.

escrow_ignore {
    'client/functions.lua',
    'configs/*.lua',
    'server/version_check.lua'
}