fx_version "cerulean"
lua54 'yes'
games {"gta5"}

ui_page "client/ui/html/index.html"

files {
  "client/ui/html/index.html", 
  "client/ui/html/js/ui.js", 
  "client/ui/html/css/menu.css", 
  "client/ui/html/imgs/logo.png",
}

client_script "@PolyZone/client.lua"

shared_script "_configs/cfg_general.lua"

client_scripts {
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua',
  "client/cl_*.lua",
}

server_scripts {
  "server/sv_*.lua"
}

