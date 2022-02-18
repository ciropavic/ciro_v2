ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
    end
end)

function GetPlayerFromPed(ped)
    for _, player in ipairs(GetActivePlayers()) do
        if GetPlayerPed(player) == ped then
            return player
        end
    end
    return -1
end
-- Functions

RegisterCommand('cuff', function()
    local player = PlayerId()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

    while true do
        Citizen.Wait(0)
        if closestDistance ~= -1 and closestDistance <= 1.5 then
            TriggerServerEvent('cu:togglecuffentity', GetPlayerServerId(closestPlayer), GetPlayerServerId(player))
            return
        else
            exports['mythic_notify']:DoHudText('error', 'No player nearby')
            return
        end
    end
end)

RegisterCommand('softcuff', function()
    local player = PlayerId()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

    while true do
        Citizen.Wait(0)
        if closestDistance ~= -1 and closestDistance <= 1.5 then
            TriggerServerEvent('cu:togglesoftcuffentity', GetPlayerServerId(closestPlayer), GetPlayerServerId(player))
            return
        else
            exports['mythic_notify']:DoHudText('error', 'No player nearby')
            return
        end
    end
end)

RegisterKeyMapping('cuff', '[Police] Cuff player', 'keyboard', '')
RegisterKeyMapping('softcuff', '[Police] Softcuff player', 'keyboard', '')
RegisterKeyMapping('drag', '[Police] Drag player', 'keyboard', '')

RegisterNetEvent('cu:cuffanim')
AddEventHandler('cu:cuffanim', function()
    local cuffdict = 'mp_arrest_paired'
    local cuffanim = 'cop_p2_back_right'

    ClearPedTasksImmediately(GetPlayerPed(-1))
    RequestAnimDict(cuffdict)
    while not HasAnimDictLoaded(cuffdict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(GetPlayerPed(-1), cuffdict, cuffanim, 8.0, -8, 3500, 16, 0, 0, 0, 0)
    Citizen.Wait(3500)
    ClearPedTasks(GetPlayerPed(-1))
end)

RegisterNetEvent('cu:crimanim')
AddEventHandler('cu:crimanim', function()
    local cuffdict = 'mp_arrest_paired'
    local cuffanim = 'crook_p2_back_left'

    ClearPedTasksImmediately(GetPlayerPed(-1))
    RequestAnimDict(cuffdict)
    while not HasAnimDictLoaded(cuffdict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(GetPlayerPed(-1), cuffdict, cuffanim, 8.0, -8.0, 5500, 33, 0, false, false, false)
    Citizen.Wait(3500)
    ClearPedTasks(GetPlayerPed(-1))
end)

RegisterNetEvent('cu:uncuffanim')
AddEventHandler('cu:uncuffanim', function()
    local uncuffdict = 'mp_arresting'
    local uncuffanim = 'a_uncuff'

    ClearPedTasksImmediately(GetPlayerPed(-1))
    RequestAnimDict(uncuffdict)
    while not HasAnimDictLoaded(uncuffdict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(GetPlayerPed(-1), uncuffdict, uncuffanim, 8.0, -8, -1, 2, 0, 0, 0, 0)
    Citizen.Wait(2200)
    ClearPedTasksImmediately(GetPlayerPed(-1))
end)
