local StringCharset = {}
local NumberCharset = {}

for i = 48,  57 do NumberCharset[#NumberCharset+1] = string.char(i) end
for i = 65,  90 do StringCharset[#StringCharset+1] = string.char(i) end
for i = 97, 122 do StringCharset[#StringCharset+1] = string.char(i) end

RandomStr = function(length)
    if length <= 0 then return '' end
    return RandomStr(length - 1) .. StringCharset[math.random(1, #StringCharset)]
end

RandomInt = function(length)
    if length <= 0 then return '' end
    return RandomInt(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
end



if Config.OldVersion then
    DatabaseQuery = function(query, parameters)
        if string.find(query, "SELECT") then
            local result = MySQL.Sync.fetchAll(query, parameters)
            return result
        elseif string.find(query, "INSERT") then
            MySQL.Sync.insert(query, parameters)
        else
            MySQL.Sync.execute(query, parameters)
        end
    end
end


ESX = exports['es_extended']:getSharedObject()

-- ESX.RegisterUsableItem('advanced_lockpick', function(src)
-- 	TriggerClientEvent("boosting:lockpick", src)
-- end)

ESX.RegisterUsableItem('hacking_device', function(src)
	TriggerClientEvent("boosting:antiPolice", src)
end)

ESX.RegisterUsableItem('fake_plate', function(src)
	TriggerClientEvent("boosting:ChangePlate", src)
end)

ESX.RegisterUsableItem('racing_usb', function(src)
	TriggerClientEvent("boosting:changeVehicleState", src)
end)

ESX.RegisterUsableItem('laptop', function(src)
	TriggerClientEvent("open:boostingApp", src)
end)

RegisterServerCallback {eventName = 'boosting:getplate', eventCallback = function(source, ...)
    local plate = GeneratePlate()
    return plate
end}

RegisterServerCallback {eventName = 'boosting:CoolDown', eventCallback = function(source, ...)
    return CoolDownFunctions(source)
end}

RegisterServerCallback {eventName = 'boosting:CreateVehicleServer', eventCallback = function(source, ...)
    local veh = CreateVehicle(hash, x, y, z, heading, isNetwork, netMissionEntity)
    return veh
end}

if Config.Framework == 'esx' then
AddEventHandler('esx:playerLoaded', function(player)
    TriggerEvent("boostingQB:playerSpawned", player)
end)
elseif Config.Framework == 'qbcore' then
AddEventHandler('QBCore:Server:PlayerLoaded', function(player)
    local src = player.PlayerData.source
    TriggerEvent("boostingQB:playerSpawned", src)
end)
end

function GeneratePlate()	
    if Config.Framework == "qbcore" then			
        local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
        local result = MySQL.Sync.fetchScalar('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
        if result then
            return plate
        else
            return plate:upper()
        end
    elseif Config.Framework == "esx" then
        local plate = RandomInt(1) .. RandomStr(2) .. RandomInt(3) .. RandomStr(2)
        local result = DatabaseQuery('SELECT plate FROM owned_vehicles WHERE plate = ?', {plate})
        if not result == "[]" then
            return plate
        else
            return plate:upper()
        end
    end
end
RegisterNetEvent("buy:gne")
AddEventHandler("buy:gne",function(GneToAdd)
    local src = source
    local identifier = GetIdentifier(src)
    local gnes = GetGNE(identifier)
    SetGNE(identifier, gnes.gne + GneToAdd)
end)

RegisterNetEvent("boosting:bennysitem")
AddEventHandler("boosting:bennysitem",function(data, pay)
  if Config.Framework == 'esx' then
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local identifier = GetIdentifier(src)
    local gnes = GetGNE(identifier)
    TriggerClientEvent("boosting:setlevel", src, gnes.level, gnes.gne-pay)
    Citizen.Wait(1000)
    SetGNE(identifier, gnes.gne-pay)
    if Player ~= nil then
        for k, v in pairs(data) do
            Player.addInventoryItem(v.item, 1)
        end
    end
  elseif Config.Framework == 'qbcore' then
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local identifier = GetIdentifier(src)
    local gnes = GetGNE(identifier)
    TriggerClientEvent("boosting:setlevel", src, gnes.level, gnes.gne-pay)
    Citizen.Wait(1000)
    SetGNE(identifier, gnes.gne-pay)
    if Player ~= nil then
        for k, v in pairs(data) do
            Player.Functions.AddItem(v.item, 1)
        end
    end
  end
end)

RegisterNetEvent('boosting:alert')
AddEventHandler('boosting:alert', function ()
  local src = source
  local identifier = GetIdentifier(src)
  local gnes = GetGNE(identifier)
  TriggerClientEvent("boosting:alert", src, gnes.level)
end)

function GeneratePlate()
   if Config.Framework == 'esx' then
    local plate = RandomInt(1) .. RandomStr(2) .. RandomInt(3) .. RandomStr(2)
    local result = DatabaseQuery('SELECT plate FROM owned_vehicles WHERE plate = ?', {plate})
    if not result == "[]" then
        return plate
    else
        return plate:upper()
    end
   elseif Config.Framework == 'qbcore' then
    local plate = RandomInt(1) .. RandomStr(2) .. RandomInt(3) .. RandomStr(2)
    local result = DatabaseQuery('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if not result == "[]" then
        return plateW
    else
        return plate:upper()
    end
   end
end

function GetIdentifier(src)
   if Config.Framework == 'esx' then
    local Player = ESX.GetPlayerFromId(src)
    if Player ~= nil then
        return Player.getIdentifier()
    end
   elseif Config.Framework == 'qbcore' then
    local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then
        return Player.PlayerData.citizenid
    end
   end
end

function IsPoliceAllowed(src)
    if Config.Framework == 'esx' then
     local source = tonumber(src)
     local Player = ESX.GetPlayerFromId(src)
     if Player ~= nil then
         if Player.job.name == "police" then
            --  print("true")
             return true
         end
     end
     return false
    elseif Config.Framework == 'qbcore' then
     local source = tonumber(src)
     local Player = QBCore.Functions.GetPlayer(source)
     if Player ~= nil then
         if Player.PlayerData.job.name == "police" then
             return true
         end
     end
     return false
    end
 end

function GetTransferSource(src, props, TransferID)
   if Config.Framework == 'esx' then
    local Player =  ESX.GetPlayerFromId(TransferID)
    if Player ~= nil then					  
        PlayerTransferContract(TransferID, {id= props.id, vehicle = props.vehicle, identifier = props.identifier, type = props.type, owner = props.owner, expires = props.expires, units = props.units, coords = props.coords}, true)
    else
        PlayerTransferContract(src, {id= props.id, vehicle = props.vehicle, identifier = props.identifier, type = props.type, owner = props.owner, expires = props.expires, units = props.units, coords = props.coords}, false)
    end
   elseif Config.Framework == 'qbcore' then
    local Player = QBCore.Functions.GetPlayerByCitizenId(TransferID)
    if Player ~= nil then
        local toSrc = Player.PlayerData.source
        PlayerTransferContract(toSrc, {id= props.id, vehicle = props.vehicle, identifier = props.identifier, type = props.type, owner = props.owner, expires = props.expires, units = props.units, coords = props.coords}, true)
    else
        PlayerTransferContract(src, {id= props.id, vehicle = props.vehicle, identifier = props.identifier, type = props.type, owner = props.owner, expires = props.expires, units = props.units, coords = props.coords}, false)
    end
   end
end
 
function AddVehicleToGarage(src, vehicle, plate, property) --PROPERTY IF YOU NEED
   if Config.Framework == 'esx' then
    local source = tonumber(src)												 
    DatabaseQuery('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (?, ?, ?)', {
        GetIdentifier(source),
        plate,
        json.encode(property),
    })
    TriggerClientEvent('boosting:VehicleQB', source, vehicle, tostring(plate))
   elseif Config.Framework == 'qbcore' then
    local source = tonumber(src)
    local Player = QBCore.Functions.GetPlayer(source)
    DatabaseQuery('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        Player.PlayerData.license,
        Player.PlayerData.citizenid,
        tostring(vehicle),
        GetHashKey(vehicle),
        '{}',
        plate,
        0
    })
    TriggerClientEvent('boosting:VehicleQB', source, vehicle, tostring(plate))
   end
end

--Citizen.CreateThread(function() 
--    DatabaseQuery('DELETE FROM boosting')
--end)

--AddEventHandler('onResourceStart', function(resourceName)
--    if (GetCurrentResourceName() ~= resourceName) then
--      return
--    end
--    DatabaseQuery('DELETE FROM boosting')
--    print('All contracts has been cleaned')
--end)
  