Config = {}

-- FiveM controls
-- https://docs.fivem.net/docs/game-references/controls/

Config.Speed = "MPH" --MPH or KMH
Config.Notif = "MYTHIC" --CONSOLE or MYTHIC

--Fixes/repairs vehicle
Config.FixVehicle = 26 --Currently "C"
Config.FixVehicleLabel = "C" --Only for visuals. Replace with "nil" if you dont want it to show

--Reset the numbers
Config.Reset = 20 --Currently "Z"
Config.ResetLabel = "Z" --Only for visuals. Replace with "nil" if you dont want it to show

--Configure teleport key.
Config.UseTeleport = true --Or false to disable
Config.TeleportToCoords = vector3(-1958.9, 2841.6, 32.4) --Teleport location
Config.TeleportToCoordsHeading = 60.05 --Which way you are looking after being teleported
Config.TeleportToCoordsKey = 189 --Currently "N"
Config.TeleportToCoordsLabel = "Left" -- Only for visuals. Replace with "nil" if you dont want it to show
Config.TeleportToCoordsName = "Military"

--Configure teleport key.
Config.UseTeleport2 = true --Or false to disable
Config.TeleportToCoords2 = vector3(250.6, -852.2, 29.1) --Teleport location
Config.TeleportToCoordsHeading2 = 248.49 --Which way you are looking after being teleported
Config.TeleportToCoordsKey2 = 188 --Currently "N"
Config.TeleportToCoordsLabel2 = "Up" -- Only for visuals. Replace with "nil" if you dont want it to show
Config.TeleportToCoordsName2 = "Legion"

--Delete vehicle
Config.UseDeleteVehicle = true --Or false to disable
Config.DeleteVehicleKey = 137--Currently "N"
Config.DeleteVehicleKeyLabel = "CAPS" -- Only for visuals. Replace with "nil" if you dont want it to show

-- Restart vehicles
Config.UseRestart = true
Config.Restartkey = 208
Config.RestartKeyLabel = "PGUP"
Config.RestartResource = "ecrp-vehicles"