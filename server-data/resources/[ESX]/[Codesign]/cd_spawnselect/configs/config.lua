Config = {}
-- ███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
-- ██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
-- █████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
-- ██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
-- ██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
-- ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝

Config.Database = 'oxmysql' -- [ 'mysql' / 'ghmattimysql' / 'oxmysql' ] Choose your sql database script.
Config.Framework = 'esx' -- [ 'esx' / 'qbcore' / 'vrp' / 'none' / 'other' ] Choose your framework.
Config.Language = 'EN' -- [ 'EN' / 'BG' / 'DE' / 'CZ' / 'ES' / 'FI' / 'FR' / 'NL' / 'SE' / 'SK' ] You can add your own locales to the Locales.lua. But make sure to change the Config.Language to match it.

Config.FrameworkTriggers = { -- You can change the esx/qbcore events (IF NEEDED).
    main = 'esx:getSharedObject', -- ESX = 'esx:getSharedObject'   QBCORE = 'QBCore:GetObject'
    load = 'esx:playerLoaded', -- ESX = 'esx:playerLoaded'      QBCORE = 'QBCore:Client:OnPlayerLoaded'
    job = 'esx:setJob', -- ESX = 'esx:setJob'            QBCORE = 'QBCore:Client:OnJobUpdate'
    resource_name = 'es_extended' -- ESX = 'es_extended'           QBCORE = 'qb-core'
}

Config.NotificationType =
    { -- [ 'esx' / 'qbcore' / 'mythic_old' / 'mythic_new' / 'chat' / 'other' ] Choose your notification script.
        server = 'mythic_old',
        client = 'mythic_old'
    }

-- ██╗███╗   ███╗██████╗  ██████╗ ██████╗ ████████╗ █████╗ ███╗   ██╗████████╗
-- ██║████╗ ████║██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗████╗  ██║╚══██╔══╝
-- ██║██╔████╔██║██████╔╝██║   ██║██████╔╝   ██║   ███████║██╔██╗ ██║   ██║   
-- ██║██║╚██╔╝██║██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║╚██╗██║   ██║   
-- ██║██║ ╚═╝ ██║██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║██║ ╚████║   ██║   
-- ╚═╝╚═╝     ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝

Config.SpawnOptions = {
    last = false, -- Do you want to allow players to spawn in their last saved position 	(this requires either esx, qbcore or you can edit the code and use your own framework).
    job = false, -- Do you want to allow players with defined jobs to spawn at their workplace 	(this requires either esx, qbcore or you can edit the code and use your own framework).
    personal = false, -- Do you want to allow a player to set and choose their own personal spawn location 	(this requires either esx, qbcore or you can edit the code and use your own framework).
    personal_command = 'personalspawn' -- Set the name of the command to show/set/delete your personal spawn location.
}

-- ███╗   ███╗ █████╗ ██╗███╗   ██╗
-- ████╗ ████║██╔══██╗██║████╗  ██║
-- ██╔████╔██║███████║██║██╔██╗ ██║
-- ██║╚██╔╝██║██╔══██║██║██║╚██╗██║
-- ██║ ╚═╝ ██║██║  ██║██║██║ ╚████║
-- ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝

Config.EnableTestCommand = false -- Set to true to enable the test command '/openspawnselect'.
Config.BuggedSpawnCoords = {
    x = 314.86,
    y = -213.28,
    z = 54.09,
    h = 44.56
} -- If there is an error or the database coords are nil, this will be a backup spawn location.
Config.DayHours = {
    [1] = 6,
    [2] = 22
} -- If the game time is between 6am (6) to 10pm (22) then dark mode will be enabled, else lightmode will be enabled (using 24 hour clock).

Config.JobSpawnsCoords =
    { -- If Config.Job_Spawns is enabled then you can customise which jobs are eligable and where they spawn.
        ['ambulance'] = {
            x = 296.09,
            y = -601.04,
            z = 43.35,
            h = 93.08,
            name = 'LSFD'
        },
        ['mechanic'] = {
            x = 949.64,
            y = -986.29,
            z = 39.83,
            h = 110.17,
            name = 'Mechanic'
        },
        ['police'] = {
            x = 435.48,
            y = -975.08,
            z = 30.72,
            h = 83.66,
            name = 'Police'
        },
        ['cardealer'] = {
            x = -815.98,
            y = -194.89,
            z = 37.52,
            h = 115.08,
            name = 'Car Dealer'
        },
        ['taxi'] = {
            x = 907.01,
            y = -164.23,
            z = 74.12,
            h = 162.66,
            name = 'Taxi'
        }
    }

Config.MainSpawns = { -- The names in the mapdata.js must match with the name here to get the correct coordinates.
    ['Apartments'] = {
        x = -268.02,
        y = -958.2,
        z = 31.23,
        h = 203.60
    },
    ['Dashhound Bus Station'] = {
        x = 451.60,
        y = -659.04,
        z = 28.42,
        h = 283.89
    },
    ['Del Perro Pier'] = {
        x = -1838.89,
        y = -1231.19,
        z = 13.02,
        h = 321.66
    },
    ['Sandy Shores LSC'] = {
        x = 1196.85,
        y = 2642.73,
        z = 37.84,
        h = 41.77
    },
    ['Pacific Standard Bank'] = {
        x = 233.91,
        y = 216.35,
        z = 110.28,
        h = 288.66
    },
    ['The Richman Hotel'] = {
        x = -1275.33,
        y = 313.75,
        z = 65.51,
        h = 147.43
    },
    ['Paleto Bay Hen House'] = {
        x = -320.53,
        y = 6231.39,
        z = 31.50,
        h = 271.41
    },
    ['Paleto Bay LSC'] = {
        x = 102.82,
        y = 6608.96,
        z = 31.83,
        h = 264.16
    }
}

-- ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
-- ██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
-- ██║   ██║   ██║   ███████║█████╗  ██████╔╝
-- ██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
-- ╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
-- ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝

function L(l)
    return Locales[Config.Language][l]
end
if Config.Framework == 'vrp' or Config.Framework == 'none' then -- if you use vrp or no framework we will disable last position, job spawns and personal spawns.
    Config.SpawnOptions.last = false
    Config.SpawnOptions.job = false
    Config.SpawnOptions.personal = false
end
