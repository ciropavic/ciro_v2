fx_version 'cerulean'
game 'gta5'

files {
  'audioconfig/*.dat151',
  'audioconfig/*.dat151.nametable',
  'audioconfig/*.dat151.rel',
  'audioconfig/*.dat10.nametable',
  'audioconfig/*.dat10.rel',
  'audioconfig/*.dat10',  
  'audioconfig/*.dat54.nametable',
  'audioconfig/*.dat54.rel',
  'audioconfig/*.dat54',
  'audioconfig/*.dat',
  'sfx/**/*.awc'
}

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayouts.meta'
data_file 'AUDIO_GAMEDATA' 'audioconfig/argento_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/argento_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_argento'
data_file 'AUDIO_GAMEDATA' 'audioconfig/cvpiv8_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/cvpiv8_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_cvpiv8'
data_file 'AUDIO_GAMEDATA' 'audioconfig/ecoboostv6_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/ecoboostv6_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_ecoboostv6'
data_file 'AUDIO_GAMEDATA' 'audioconfig/demonv8_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/demonv8_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_demonv8'

client_script 'data/vehicle_names.lua'

files {
    'data/*.meta'
}