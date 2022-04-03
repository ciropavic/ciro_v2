---
Config = {}
Config.DiscordWebHook = 'https://discord.com/api/webhooks/959838833938169926/pqydUe0l6quZ8uTvSydUV1yV_G7Su77-tkiSZ9CK3CzEDLZJqB7NWyklOA_wvFuA0mcI'
Config.save = 'json' -- kvp, json
Config.vehicle_table = 'vehicles' -- vehicle table must have model column (name not hash)
Config.useSQLvehicle = true -- use mysql async to fetch vehicle table else SqlVehicleTable will use
Config.SqlVehicleTable = QBCore and QBCore.Shared and QBCore.Shared.Vehicles and QBCore.Shared.Vehicles or {} -- example qbcore shared vehicle

-- Custom Category
Config.Category = 'all' -- select a custom category | set this to 'all' if you want to Screenshot all vehicle categories

-- Permission
Config.owners = {
    ['license:bcc034583a72131888309a8685517ba79552f2e4'] = true,
    --add more here
}