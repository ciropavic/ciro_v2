ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- Server restart
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        MySQL.update("UPDATE owned_vehicles SET owned_vehicles.stored=1 WHERE 1", {}, function(result)
            if result == 1 then
                print("All vehicles were sent to garage!")
            end
        end)
    end
end)

-- check if a vehicle is from the player.
ESX.RegisterServerCallback("ecrp-garage:validCar", function(source, cb)
    local src = source
    local playerPed = GetPlayerPed(src)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    local plate = ltrim(GetVehicleNumberPlateText(playerVeh))
    local xPlayerIdentifier = ESX.GetPlayerFromId(src).getIdentifier()

    MySQL.scalar('SELECT COUNT(owner) FROM owned_vehicles WHERE owner=@identifier AND plate=@plate', {
        ['@identifier'] = xPlayerIdentifier,
        ["@plate"] = plate
    }, function(result)
        if result == 1 then
            cb(true)
        else
            cb(false)
        end
    end)
end)

-- save the player vehicle.
ESX.RegisterServerCallback("ecrp-garage:saveVehicle", function(source, cb, vehprop)
    local src = source
    local playerPed = GetPlayerPed(src)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    local plate = ltrim(GetVehicleNumberPlateText(playerVeh))
    local xPlayerIdentifier = ESX.GetPlayerFromId(src).getIdentifier()

    local vehJson = json.encode(vehprop)

    MySQL.update(
        "UPDATE owned_vehicles SET vehicle=@vehdata, owned_vehicles.stored=1 WHERE owner=@identifier AND plate=@plate",
        {
            ['@vehdata'] = vehJson,
            ['@identifier'] = xPlayerIdentifier,
            ['@plate'] = plate
        }, function(result)
            if result == 1 then
                cb(true)
            else
                cb(false)
            end
        end)
end)

-- get player vehicles
ESX.RegisterServerCallback("ecrp-garage:getVehicleList", function(source, cb)
    local src = source
    local xPlayerIdentifier = ESX.GetPlayerFromId(src).getIdentifier()
    local toReturn = {}

    MySQL.query("SELECT vehicle, owned_vehicles.stored FROM owned_vehicles WHERE owner = @identifier", {
        ['@identifier'] = xPlayerIdentifier
    }, function(result)
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
ESX.RegisterServerCallback("ecrp-garage:changeStatus", function(source, cb, plate)
  local src = source
  local xPlayerIdentifier = ESX.GetPlayerFromId(src).getIdentifier()

  MySQL.update("UPDATE owned_vehicles SET owned_vehicles.stored=0 WHERE plate=@plate AND owner=@identifier", {
      ["@plate"] = plate,
      ["@identifier"] = xPlayerIdentifier
  }, function(result)
      if result then
          TriggerClientEvent("ecrp-garage:removeSimilarVehicle", src, plate)
          cb(true)
      else
          cb(false)
      end
  end)
end)

function ltrim(s)
  return s:match'^%s*(.*)'
end