fx_version 'cerulean'
game 'gta5'

name 'LS Customs'
description 'LS Customs customization menu based on NFS Heat idea'
author '.resources'

client_scripts {
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua',
	'config.lua',
	'shared/utils.lua',
	'client/compatibility.lua',
	'client/main.lua',
  'client/zones.lua',
}

server_scripts {
	-- esx dependencies
	'@oxmysql/lib/MySQL.lua',

	-------------------------------

	'config.lua',
	'server/compatibility.lua',
	'server/main.lua',
	'shared/utils.lua',
}

-- for older qb-core use this
--[[
shared_scripts { 
	'@qb-core/import.lua',
}]]

lua54 'yes'

ui_page 'nui/build/index.html'

files {
	'nui/build/index.html',
	'nui/build/main.js',
	'nui/build/*.otf',
	'nui/build/*.png',
	'locale.json'
} 

escrow_ignore {
	'config.lua',
	'client/compatibility.lua',
	'client/main.lua',
	'server/compatibility.lua',
}
dependency '/assetpacks'