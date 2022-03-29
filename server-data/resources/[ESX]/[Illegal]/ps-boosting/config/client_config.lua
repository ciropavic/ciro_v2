
ESX = exports['es_extended']:getSharedObject()

--local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent("boosting:VehicleQB")
AddEventHandler("boosting:VehicleQB", function(vehicle, plate)
    if Config.Framework == 'esx' then
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped)
        SetVehicleNumberPlateText(veh, plate)
    elseif Config.Framework == 'qbcore' then
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped)
        exports['LegacyFuel']:SetFuel(veh, 100)
        SetVehicleNumberPlateText(veh, plate)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        TriggerServerEvent("qb-vehicletuning:server:SaveVehicleProps", QBCore.Functions.GetVehicleProperties(veh))
    end
end)

function TrimValue(val)
	if not val then return nil end
    return (string.gsub(val, '^%s*(.-)%s*$', '%1'))
end

function GetPlateQB(veh)
if Config.Framework == 'esx' then
    return TrimValue(GetVehicleNumberPlateText(veh))
elseif Config.Framework == 'qbcore' then
    return QBCore.Functions.GetPlate(veh)
end
end

function GetVehiclePropertiesQB(veh)  --PROPERTY IF YOU NEED
if Config.Framework == 'esx' then
    return ESX.Game.GetVehicleProperties(veh)
elseif Config.Framework == 'qbcore' then
    return QBCore.Functions.GetVehicleProperties(veh)
end
end

function IsPoliceAllowed()
    if Config.Framework == 'esx' then
        local job = ESX.GetPlayerData().job.name
        local bool = job == 'police'
        -- print(bool)
        return bool
    elseif Config.Framework == 'qbcore' then
        local job = QBCore.Functions.GetPlayerData().job.name
        local bool = job == 'police'
        return bool
    end
    end

function GeneratePlate()
    local plate = TriggerServerCallback{eventName = 'boosting:getplate', args = {}}
    return plate
end

function InCoolDown() 
    local result = TriggerServerCallback{eventName = 'boosting:CoolDown', args = {}}
    return result.CoolDown, result.minutes
end



function CreateVehicleServer(hash, x, y, z, heading, isNetwork, netMissionEntity)
    local result = TriggerServerCallback{eventName = 'boosting:CreateVehicleServer', args = {hash, x, y, z, heading, isNetwork, netMissionEntity}}
    return result
end
function vehicleUnlock(vehicleHandle)
  --Add you code to unlock vehicles here
  SetVehicleDoorsLocked(vehicleHandle, 0) --Native
  --exports['t1ger_keys']:SetVehicleLocked(vehicleHandle, 0)
end
