fx_version 'adamant'
game 'gta5'
use_fxv2_oal 'yes'
lua54 'yes'

name 'lm-hunting'
author 'Zweetstreep'
version '1.0.0'

client_scripts { 'client/main.lua' }
server_scripts { 'server/main.lua' }
shared_scripts { 'shared/*.lua', '@es_extended/imports.lua', '@ox_lib/init.lua' }
files {
    'data/*.lua',
    'client/utils/**/*.lua', 'client/modules/**/*.lua', 'client/bridge/**/*.lua',
    'server/utils/**/*.lua', 'server/modules/**/*.lua', 'server/bridge/**/*.lua',
}