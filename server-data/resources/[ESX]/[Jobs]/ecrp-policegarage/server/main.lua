ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- Server restart
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        MySQL.update("UPDATE police_garage SET police_garage.stored=1 WHERE 1", {}, function(result)
            if result == 1 then
                print("All vehicles were sent to garage!")
            end
        end)
    end
end)

-- check if a vehicle is from the player.
ESX.RegisterServerCallback("ecrp-policegarage:validCar", function(source, cb)
    local src = source
    local playerPed = GetPlayerPed(src)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    local plate = ltrim(GetVehicleNumberPlateText(playerVeh))

    MySQL.scalar('SELECT COUNT(plate) FROM police_garage WHERE plate=@plate', {
        ["@plate"] = plate
    }, function(result)
        if result == 1 then
            cb(true)
        else
            cb(false)
        end
    end)
end)

-- save vehicle.
ESX.RegisterServerCallback("ecrp-policegarage:saveVehicle", function(source, cb, vehprop)
    local src = source
    local playerPed = GetPlayerPed(src)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    local plate = ltrim(GetVehicleNumberPlateText(playerVeh))

    local vehJson = json.encode(vehprop)

    MySQL.update("UPDATE police_garage SET vehicle=@vehdata, police_garage.stored=1 WHERE plate=@plate", {
        ['@vehdata'] = vehJson,
        ['@plate'] = plate
    }, function(result)
        if result == 1 then
            cb(true)
        else
            cb(false)
        end
    end)
end)

-- get vehicles
ESX.RegisterServerCallback("ecrp-policegarage:getVehicleList", function(source, cb)
    local toReturn = {}

    MySQL.query("SELECT vehicle, police_garage.stored FROM police_garage", {}, function(result)
        for _, v in pairs(result) do
            local vehicle = json.decode(v.vehicle)

            table.insert(toReturn, {
                vehicle = vehicle,
                stored = v.stored
            })
        end

        cb(toReturn)
    end)
end)

-- set stored vehicle status to false
ESX.RegisterServerCallback("ecrp-policegarage:changeStatus", function(source, cb, plate)
    local src = source

    MySQL.update("UPDATE police_garage SET police_garage.stored=0 WHERE plate=@plate", {
        ["@plate"] = plate
    }, function(result)
        if result then
            TriggerClientEvent("ecrp-policegarage:removeSimilarVehicle", src, plate)
            cb(true)
        else
            cb(false)
        end
    end)
end)

RegisterNetEvent('ecrp-policegarage:addvehtodb')
AddEventHandler('ecrp-policegarage:addvehtodb', function (vehprops, plate)
  local vehiclePropsjson = json.encode(vehprops)
  MySQL.insert('INSERT INTO police_garage (plate, vehicle, stored) VALUES (@plate, @vehicle, @stored)',
  {
      ['@plate']   = plate,
      ['@vehicle'] = vehiclePropsjson,
      ['@stored'] = 1,
  }, function (result)
    if result == 1 then
      print("Stored!")
    end
  end)
end)

RegisterNetEvent('ecrp-policegarage:addPersonalVeh')
AddEventHandler('ecrp-policegarage:addPersonalVeh', function (vehprops, plate)
  local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer == nil then
    return
  end

  local vehiclePropsjson = json.encode(vehprops)
  MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, stored) VALUES (@owner, @plate, @vehicle, @stored)',
  {
      ['@owner']   = xPlayer.identifier,
      ['@plate']   = plate,
      ['@vehicle'] = vehiclePropsjson,
      ['@stored'] = 0,
  }, function (result)
  end)
end)

RegisterNetEvent('ecrp-policegarage:checkmoney')
AddEventHandler('ecrp-policegarage:checkmoney', function (model, price)
  local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer == nil then
    return
  end

  if xPlayer.getAccount('bank').money >= (price) or xPlayer.getAccount('money').money >= (price)then
    xPlayer.removeAccountMoney('bank', (price))
    TriggerClientEvent('ecrp-policegarage:spawnveh', source, model)
  else 
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Not enough money!'})
  end
end)

-- RegisterCommand('setplate', function (source, args)
--   TriggerClientEvent('ecrp-policegarage:changeplate', source, args[1])
-- end)

function ltrim(s)
    return s:match '^%s*(.*)'
end
