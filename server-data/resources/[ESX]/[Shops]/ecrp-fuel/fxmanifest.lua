fx_version 'adamant'

game 'gta5'

version '1.0.0'


server_scripts {
	'server/server.lua'
}

client_scripts {
	'@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua',
	'client/client.lua',
	'client/functions.lua',
}

shared_scripts {
  'config.lua'
}

exports {
	'GetFuel',
	'SetFuel'
}

dependency 'qtarget'
