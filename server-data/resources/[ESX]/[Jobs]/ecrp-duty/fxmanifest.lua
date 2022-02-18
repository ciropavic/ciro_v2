fx_version "cerulean"
game "gta5"

name "esx_upgraded_duty"

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'locale/*.lua',
  'config.lua',
  'server/main.lua',
  'server/jobgenetor.lua',
}

client_scripts {
  'locale/*.lua',
  'config.lua',
  'client/main.lua',
}

