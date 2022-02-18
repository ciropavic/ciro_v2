fx_version 'adamant'
game 'gta5'

author 'PandolfoM'
description 'Revive system for ecrp.'

shared_scripts {
  'config.lua'
}

client_script "client.lua"
server_script "server.lua"

exports {
  'GetDeath',
}
