-- ESX Start
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)

        Citizen.Wait(0)
    end
end)

RegisterNetEvent('ecrp-garage:Main', function()
    TriggerEvent('nh-context:createMenu', {{
        header = "<B>Parking</B>"
    }, {
        header = "Retrieve",
        context = "<span style='color: grey;'>Take owned vehicle from garage</span>",
        event = "ecrp-garage:openGarage",
        subMenu = true,
    }, {
        header = "Store",
        context = "<span style='color: grey;'>Store vehicle to the parking garage</span>",
        event = "ecrp-garage:storeVehicle",
        subMenu = true,
    }})
end)

local vehMenu = {{
    header = "<B><< Go Back</B>",
    context = "",
    event = "ecrp-garage:Main"
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
RegisterNetEvent('ecrp-garage:storeVehicle')
AddEventHandler('ecrp-garage:storeVehicle', function()
    local playerPed = PlayerPedId()
    local playerVeh = GetVehiclePedIsIn(playerPed)
    if GetPedInVehicleSeat(playerVeh, -1) == playerPed then
        ESX.TriggerServerCallback('ecrp-garage:validCar', function(cb)
            if cb then
                local vehProps = ESX.Game.GetVehicleProperties(playerVeh)
                ESX.TriggerServerCallback('ecrp-garage:saveVehicle', function(cb)
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
RegisterNetEvent('ecrp-garage:openGarage')
AddEventHandler('ecrp-garage:openGarage', function()
    ESX.TriggerServerCallback('ecrp-garage:getVehicleList', function(cb)
        if cb ~= "notCars" then

            PreloadAllVehicles(cb)

            -- Menu display
            for k, v in pairs(cb) do
                local vehName = GetLabelText(GetDisplayNameFromVehicleModel(v.vehicle.model))

                if v.stored == 1 then
                    table.insert(vehMenu, {
                        header = vehName,
                        context = '<span style="color: green;">Stored</span>',
                        event = "ecrp:personalVehSpawn",
                        id = "4",
                        args = {v.vehicle.model, v.vehicle.plate, v.vehicle}
                    })
                else
                    table.insert(vehMenu, {
                        header = vehName,
                        context = '<span style="color: red;">Out</span>'
                    })
                end
            end
            TriggerEvent('nh-context:createMenu', vehMenu)

        else
            print('no vehicles?')
        end
    end)
end)

RegisterNetEvent("ecrp-garage:removeSimilarVehicle")
AddEventHandler("ecrp-garage:removeSimilarVehicle", function(plate)
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

-- Vehicle preloading
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    ESX.TriggerServerCallback('ecrp-garage:getVehicleList', function(cb)
        if cb ~= "notCars" then
            PreloadAllVehicles(cb)
        end
    end)
end)
