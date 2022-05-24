lib.locale()
-- These vehicles will be registered as "allowed/valid" tow trucks.
-- Change the x, y and z offset values for the towed vehicles to be attached to the tow truck.
-- x = left/right, y = forwards/backwards, z = up/down
local allowedTowModels = {
    ['flatbed'] = {
        x = 0.0,
        y = -0.85,
        z = 1.0
    } -- default GTA V flatbed
}

local allowTowingBoats = false -- Set to true if you want to be able to tow boats.
local allowTowingPlanes = false -- Set to true if you want to be able to tow planes.
local allowTowingHelicopters = false -- Set to true if you want to be able to tow helicopters.
local allowTowingTrains = false -- Set to true if you want to be able to tow trains.
local allowTowingTrailers = true -- Disables trailers. NOTE: THIS ALSO DISABLES THE AIRTUG, TOWTRUCK, SADLER, AND ANY OTHER VEHICLE THAT IS IN THE UTILITY CLASS.

local currentlyTowedVehicle = nil

function isTargetVehicleATrailer(modelHash)
    if GetVehicleClassFromName(modelHash) == 11 then
        return true
    else
        return false
    end
end

local xoff = 0.0
local yoff = 0.0
local zoff = 0.0

function isVehicleATowTruck(vehicle)
    local isValid = false
    for model, posOffset in pairs(allowedTowModels) do
        if IsVehicleModel(vehicle, model) then
            xoff = posOffset.x
            yoff = posOffset.y
            zoff = posOffset.z
            isValid = true
            break
        end
    end
    return isValid
end

RegisterNetEvent('ecrp-tow:tow')
AddEventHandler('ecrp-tow:tow', function()

    local playerped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerped, true)

    local isVehicleTow = isVehicleATowTruck(vehicle)

    if isVehicleTow then

        local coordA = GetEntityCoords(playerped, 1)
        local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 5.0, 0.0)
        local targetVehicle = getVehicleInDirection(coordA, coordB)

        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)
                isVehicleTow = isVehicleATowTruck(vehicle)
                local roll = GetEntityRoll(GetVehiclePedIsIn(PlayerPedId(), true))
                if IsEntityUpsidedown(GetVehiclePedIsIn(PlayerPedId(), true)) and isVehicleTow or roll > 70.0 or roll <
                    -70.0 then
                    DetachEntity(currentlyTowedVehicle, false, false)
                    currentlyTowedVehicle = nil
                    exports['mythic_notify']:DoHudText('inform', 'Vehicles are too far apart')
                end

            end
        end)

        if currentlyTowedVehicle == nil then
            if targetVehicle ~= 0 then
                local targetVehicleLocation = GetEntityCoords(targetVehicle, true)
                local towTruckVehicleLocation = GetEntityCoords(vehicle, true)
                local distanceBetweenVehicles = GetDistanceBetweenCoords(targetVehicleLocation, towTruckVehicleLocation,
                    false)
                -- print(tostring(distanceBetweenVehicles)) -- debug only
                -- Distance allowed (in meters) between tow truck and the vehicle to be towed			
                if distanceBetweenVehicles > 12.0 then
                    exports['mythic_notify']:DoHudText('inform', 'Vehicles are too far apart')
                else

                    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'towtruck', 0.6)
                    if lib.progressBar({
                        duration = 5000,
                        label = 'Aligning Vehicle',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            combat = true
                        }
                    }) then
                        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'towtruck2', 0.6)
                        if lib.progressBar({
                            duration = 5000,
                            label = 'Loading Vehicle',
                            useWhileDead = false,
                            canCancel = true,
                            disable = {
                                car = true,
                                combat = true
                            }
                        }) then
                            local targetModelHash = GetEntityModel(targetVehicle)
                            if not ((not allowTowingBoats and IsThisModelABoat(targetModelHash)) or
                                (not allowTowingHelicopters and IsThisModelAHeli(targetModelHash)) or
                                (not allowTowingPlanes and IsThisModelAPlane(targetModelHash)) or
                                (not allowTowingTrains and IsThisModelATrain(targetModelHash)) or
                                (not allowTowingTrailers and isTargetVehicleATrailer(targetModelHash))) then
                                if not IsPedInAnyVehicle(playerped, true) then
                                    if vehicle ~= targetVehicle and IsVehicleStopped(vehicle) then
                                        -- TriggerEvent('chatMessage', '', {255,255,255}, xoff .. ' ' .. yoff .. ' ' .. zoff) -- debug line
                                        AttachEntityToEntity(targetVehicle, vehicle,
                                            GetEntityBoneIndexByName(vehicle, 'bodyshell'), 0.0 + xoff, -1.5 + yoff,
                                            0.0 + zoff, 0, 0, 0, 1, 1, 0, 1, 0, 1)
                                        currentlyTowedVehicle = targetVehicle
                                        exports['mythic_notify']:DoHudText('inform', 'Vehicle loaded onto vehicle')
                                    else
                                        exports['mythic_notify']:DoHudText('inform', 'No vehicle on flatbed')
                                    end
                                else
                                    exports['mythic_notify']:DoHudText('inform', 'You need to be outside the vehicle')
                                end
                            else
                                exports['mythic_notify']:DoHudText('inform', 'Vehicle not equipted to tow this vehicle')
                            end
                        end
                    end
                end
            else
                exports['mythic_notify']:DoHudText('inform', 'No towable vehicle')
            end
        elseif IsVehicleStopped(vehicle) then
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'towtruck2', 0.6)
            if lib.progressBar({
                duration = 5000,
                label = 'Unloading Vehicle',
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                    combat = true
                }
            }) then
                DetachEntity(currentlyTowedVehicle, false, false)
                local vehiclesCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -12.0, 0.0)
                SetEntityCoords(currentlyTowedVehicle, vehiclesCoords["x"], vehiclesCoords["y"], vehiclesCoords["z"], 1, 0, 0, 1)
                SetVehicleOnGroundProperly(currentlyTowedVehicle)
                currentlyTowedVehicle = nil
                exports['mythic_notify']:DoHudText('inform', 'Vehicle unloaded')
            end
        end
    else
        exports['mythic_notify']:DoHudText('inform', 'Not a tow truck')
    end
end)

function getVehicleInDirection(coordFrom, coordTo)
    local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10,
        PlayerPedId(), 0)
    local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
    return vehicle
end
