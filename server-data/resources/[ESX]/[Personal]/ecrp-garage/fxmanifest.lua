fx_version "cerulean"
game "gta5"
description 'Personal garage system for ECRP'
authors {"PandolfoM"}

client_scripts {
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua',
  'client/main.lua',
  'names.lua'
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/main.lua'
}

exports {
  'InGarage',
  'ShowVehicleMenu'
}