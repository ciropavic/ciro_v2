fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

client_scripts {
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua',
  'client/cl_casino.lua',
  'client/cl_init.lua',
  'client/cl_elevator.lua',
}

shared_script '@ox_lib/init.lua'

dependencies {'ox_lib'}
