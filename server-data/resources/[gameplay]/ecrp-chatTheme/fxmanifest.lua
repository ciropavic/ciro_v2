fx_version 'adamant'
name 'ECRP Chat Theme'
description 'Chat Theme for ECRP'
author 'PandolfoM'
game 'gta5'

version '1.0'

file "ecrp.css"

chat_theme 'transparent_chat' {
    styleSheet = 'ecrp.css'
}

client_script 'client.lua'
server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server.lua'
}

dependency 'chat'
