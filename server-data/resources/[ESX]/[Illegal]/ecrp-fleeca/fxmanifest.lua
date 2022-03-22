--[[ FX Information ]]--
fx_version   'adamant'
game         'gta5'

--[[ Manifest ]]--
dependencies {
	'es_extended',
	'PolyZone',
	'qtarget',
	'ox_inventory',
	'hacking'
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
