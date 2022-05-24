fx_version "cerulean"
game "gta5"
lua54 'yes'
description 'Personal garage system for ECRP'
authors {"PandolfoM"}

client_scripts {
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua',
  'client/main.lua',
  'client/zones.lua',
  'client/sell.lua',
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/main.lua',
  'server/sell.lua',
}

shared_script '@ox_lib/init.lua'

exports {
  'InGarage',
  'ShowVehicleMenu'
}

dependencies {'ox_lib'}
