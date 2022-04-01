RegisterCommand('stuck', function()
    local ped = GetPlayerPed(-1)
    SetEntityInvincible(ped, false)
    SetEntityVisible(ped, true, false)
    ClearPedTasksImmediately(ped)
    exports['mythic_notify']:DoHudText('inform', 'Your Welcome. -Thoomin')
end)

RegisterCommand('noclip', function ()
  local player = GetPlayerServerId(PlayerId())
  TriggerServerEvent('ecrp:togglenoclip:sv', player)
end)

RegisterNetEvent('ecrp:togglenoclip:cl')
AddEventHandler('ecrp:togglenoclip:cl', function ()
  exports.noclip.toggleNoclip()
end)

RegisterCommand('evidence', function ()
  exports.ox_inventory:openInventory('policeevidence')
end)

RegisterCommand('tpshowroom', function ()
  SetEntityCoords(PlayerPedId(), -37.64443, -1054.396, -40.00031, 0, 0, 0, false)
end)

RegisterKeyMapping('noclip', '(Dev) Noclip','keyboard', '')