ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)

        Citizen.Wait(0)
    end
end)

RegisterNetEvent('ecrp-policegarage:Main', function()
    TriggerEvent('nh-context:createMenu', {{
        header = "Police Shared Lot"
    }, {
        header = "Retrieve",
        context = "Take vehicle from share pool",
        event = "ecrp-policegarage:openGarage",
        subMenu = true,
    }, {
        header = "Store",
        context = "Store vehicle in the share lot",
        event = "ecrp-policegarage:storeVehicle",
        subMenu = true,
    }})
end)

local vehMenu = {{
    header = "<< Go Back",
    context = "",
    event = "ecrp-policegarage:Main"
}}

-- checks for dupe vehicls in vehMenu
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if vehMenu[2] then
            table.remove(vehMenu)
        end
    end
end)

-- store vehicles
RegisterNetEvent('ecrp-policegarage:storeVehicle')
AddEventHandler('ecrp-policegarage:storeVehicle', function()
    local playerPed = PlayerPedId()
    local playerVeh = GetVehiclePedIsIn(playerPed)
    if GetPedInVehicleSeat(playerVeh, -1) == playerPed then
        ESX.TriggerServerCallback('ecrp-policegarage:validCar', function(cb)
            if cb then
                local vehProps = ESX.Game.GetVehicleProperties(playerVeh)
                ESX.TriggerServerCallback('ecrp-policegarage:saveVehicle', function(cb)
                    if cb then
                        ESX.Game.DeleteVehicle(playerVeh)
                        exports['mythic_notify']:DoHudText('inform', 'Your vehicle was stored')
                    else
                        exports['mythic_notify']:DoHudText('error',
                            'An error ocurred, try again. If this persist contact with an admin')
                    end
                end, vehProps)
            else
              exports['mythic_notify']:DoHudText('error', 'This is not your vehicle')
            end
        end)
    end
end)

-- take out vehicles
RegisterNetEvent('ecrp-policegarage:openGarage')
AddEventHandler('ecrp-policegarage:openGarage', function()
    ESX.TriggerServerCallback('ecrp-policegarage:getVehicleList', function(cb)
        if cb ~= "notCars" then

            PreloadAllVehicles(cb)

            -- Menu display
            for k, v in pairs(cb) do
                local vehName = GetLabelText(GetDisplayNameFromVehicleModel(v.vehicle.model))
                local vehPlate = v.vehicle.plate

                if v.stored == 1 then
                    table.insert(vehMenu, {
                        header = vehName,
                        context = "Plate: " .. vehPlate,
                        footer = '<span style="color: green;">Stored</span>',
                        event = "ecrp-policegarage:VehSpawn",
                        id = "4",
                        args = {v.vehicle.model, v.vehicle.plate, v.vehicle}
                    })
                else
                    table.insert(vehMenu, {
                        header = vehName,
                        context = "Plate: " .. vehPlate,
                        footer = '<span style="color: red;">Out</span>'
                    })
                end
            end
            TriggerEvent('nh-context:createMenu', vehMenu)

        else
            print('no vehicles?')
        end
    end)
end)

RegisterNetEvent("ecrp-policegarage:removeSimilarVehicle")
AddEventHandler("ecrp-policegarage:removeSimilarVehicle", function(plate)
    local vehicles = ESX.Game.GetVehicles()
    local attempts = 0
    if #plate == 7 then
        plate = plate .. " "
    end

    for i = 1, #vehicles, 1 do
        if GetVehicleNumberPlateText(vehicles[i]) == plate then
            while DoesEntityExist(vehicles[i]) do
                Citizen.Wait(500)
                attempts = attempts + 1

                if attempts > 15 then -- 15 attempts to delete, if not, just give up.
                    break
                end
                SetEntityAsMissionEntity(vehicles[i], true, true)
                DeleteVehicle(vehicles[i])
            end
        end
    end
end)

function PreloadAllVehicles(vehicles)
    for k, v in pairs(vehicles) do
        if not HasModelLoaded(v.vehicle.model) then
            RequestModel(v.vehicle.model)

            while not HasModelLoaded(v.vehicle.model) do
                Citizen.Wait(0)
            end
        end
    end
end

-- RegisterCommand('insertpolice', function ()
--   local veh = GetVehiclePedIsIn(PlayerPedId(), false)
--   local vehicleProps = ESX.Game.GetVehicleProperties(veh)
--   TriggerServerEvent('ecrp-policegarage:addvehtodb', vehicleProps, vehicleProps.plate)
-- end)

RegisterNetEvent('ecrp-policegarage:changeplate')
AddEventHandler('ecrp-policegarage:changeplate', function (plate)
  local playerPed = PlayerPedId()
  local vehicle = GetVehiclePedIsIn(playerPed)
  SetVehicleNumberPlateText(vehicle, plate)
  SetVehicleNumberPlateTextIndex(vehicle, 4)
end)


-- Vehicle preloading
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    ESX.TriggerServerCallback('ecrp-policegarage:getVehicleList', function(cb)
        if cb ~= "notCars" then
            PreloadAllVehicles(cb)
        end
    end)
end)
