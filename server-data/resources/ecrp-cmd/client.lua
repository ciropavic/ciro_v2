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

RegisterKeyMapping('noclip', '(Dev) Noclip','keyboard', '')