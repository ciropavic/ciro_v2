SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier,
    Config.minDamage);
local seatbelt = false
local ped = nil
local uiactive = false

Citizen.CreateThread(function()
    while true do
        ped = PlayerPedId()
        Citizen.Wait(500)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if IsPedInAnyVehicle(ped, false) then
            if seatbelt then
                if Config.fixedWhileBuckled then
                    DisableControlAction(0, 75, true) -- Disable exit vehicle when stop
                    DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
                end
                toggleUI(false)
            else
                toggleUI(true)
            end
        else
            if seatbelt then
                seatbelt = false
                toggleSeatbelt(false)
            end
            toggleUI(false)
            Citizen.Wait(1000)
        end
    end
end)

function toggleSeatbelt(toggle)
    if toggle == nil then
        if seatbelt then
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 1, 'seatbeltoff', 1.0)
            SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier,
                Config.minDamage)
        else
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 1, 'seatbelt', 1.0)
            -- SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0);
            SetFlyThroughWindscreenParams(15.6464, 2.2352, 0.0, 0.0);
            SetPedConfigFlag(PlayerPedId(), 32, true);
        end
        seatbelt = not seatbelt
    else
        if toggle then
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 1, 'seatbelt', 1.0)
            -- SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0);
            SetFlyThroughWindscreenParams(15.6464, 2.2352, 0.0, 0.0);
            SetPedConfigFlag(PlayerPedId(), 32, true);
        else
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 1, 'seatbeltoff', 1.0)
            SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier,
                Config.minDamage)
        end
        seatbelt = toggle
    end
end

function toggleUI(status)
    if Config.showUnbuckledIndicator then
        if uiactive ~= status then
            uiactive = status
            if status then
                SendNUIMessage({
                    type = "showindicator"
                })
            else
                SendNUIMessage({
                    type = "hideindicator"
                })
            end
        end
    end
end

RegisterCommand('toggleseatbelt', function(source, args, rawCommand)
    if IsPedInAnyVehicle(ped, false) then
        local class = GetVehicleClass(GetVehiclePedIsIn(ped))
        if class ~= 8 and class ~= 13 and class ~= 14 then
          if seatbelt == true then
            toggleSeatbelt(false)
          elseif seatbelt == false then
            toggleSeatbelt(true)
          end
        end
    end
end, false)

exports("status", function()
    return seatbelt
end)

RegisterKeyMapping('toggleseatbelt', 'Toggle Seatbelt', 'keyboard', 'B')
