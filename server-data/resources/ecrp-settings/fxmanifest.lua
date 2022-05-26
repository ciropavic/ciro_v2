fx_version 'bodacious'
lua54 'yes'
game 'gta5'

version '1.1'

client_scripts{
    'config.lua',
    'client/*'
} 

server_scripts {
  'server/*'
}

shared_script '@ox_lib/init.lua'