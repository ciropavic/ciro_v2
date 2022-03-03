--[[ FX Information ]]--
fx_version   'adamant'
game         'gta5'

version      '1.0.0'
description  'Fleeca Robberies'

--[[ Manifest ]]--
dependencies {
	'es_extended',
	'PolyZone',
	'qtarget',
	'ox_inventory',
	'laptop_hack'
}

shared_scripts {
	'@es_extended/imports.lua',
	'shared/*.lua',
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}
