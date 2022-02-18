fx_version 'bodacious'
games { 'gta5' }

shared_scripts {
    'lua/shared/sh_*.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'esx/cl_esx.lua',
    'lua/client/cl_ui.lua',
    'lua/client/cl_bank.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'esx/sv_esx.lua',
    'lua/server/*.lua',
}

ui_page 'html/index.html'

files {
	'html/index.html',
    'html/app.js',
    'html/img/*.png',
    'html/img/*.jpg',
    'html/css/*.css'
}
