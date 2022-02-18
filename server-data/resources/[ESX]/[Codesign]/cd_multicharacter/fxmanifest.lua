fx_version 'cerulean'
game 'gta5'
author 'Codesign#2715'
description 'Multi-Character Selection'
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
    'server/server.lua',
    'server/version_check.lua'
}

ui_page {
    'html/index.html',
}
files {
    'configs/config_ui.js',
    'html/index.html',
    'html/css/*.css',
    'html/js/*.js'
}

export 'GetSkinScript'

dependency '/server:4752' -- ⚠️PLEASE READ⚠️; Requires at least server build 4752.

escrow_ignore {
    'client/functions.lua',
    'configs/*.lua',
    'dependencies/**/*.lua',
    'server/version_check.lua'
}