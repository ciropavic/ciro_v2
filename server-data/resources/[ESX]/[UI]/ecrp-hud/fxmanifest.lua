fx_version 'cerulean'
name 'ecrp-hud'
ui_page 'html/ui.html'
game 'gta5'

files {
    'html/ui.html',
    'html/script.js',
    'html/style.css',
    'html/loading-bar.js',
	  'html/buckle.ogg',
    'html/unbuckle.ogg',
    'html/seatBelt_off.png'
}


client_scripts {
    'client/client.lua',
    'config.lua',
	  'client/stress.lua',
    'client/cruisecontrol.lua',
    'client/seatbelt.lua'
}

server_scripts {
    'config.lua',
    'server/server.lua'
}

dependencies {
	-- 'ecrp-radio',
  'ecrp-fuel',
}
