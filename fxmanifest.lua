fx_version 'cerulean'
game 'gta5'

author 'scarfind'
description 'Pesos'
version '1.0.0'
lua54 'yes'

shared_script {
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    'server.lua',
}

escrow_ignore {
    'config.lua'
} 

client_scripts {
    'client.lua',
}

