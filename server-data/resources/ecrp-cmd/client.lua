local ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(10)
    end
end)


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


  RegisterCommand('removebarrier', function()
    local PlayerData = ESX.GetPlayerData()
    if PlayerData.job.name == "police" or PlayerData.job.name == "bcso" or PlayerData.job.name == "ambulance" then
      TriggerEvent('barriers:pickup')
    end
  end)

  RegisterCommand('barrier', function()
    local PlayerData = ESX.GetPlayerData()
    if PlayerData.job.name == "police" or PlayerData.job.name == "bcso" or PlayerData.job.name == "ambulance" then
      TriggerEvent('barriers:barrier')
    end
  end)

  RegisterCommand('barrier2', function()
    local PlayerData = ESX.GetPlayerData()
    if PlayerData.job.name == "police" or PlayerData.job.name == "bcso" or PlayerData.job.name == "ambulance" then
      TriggerEvent('barriers:sbarrier')
    end
  end)

  RegisterCommand('cone', function()
    local PlayerData = ESX.GetPlayerData()
    if PlayerData.job.name == "police" or PlayerData.job.name == "bcso" or PlayerData.job.name == "ambulance" then
      TriggerEvent('barriers:cone')
    end
  end)

-- Remove Chat Suggestions
Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(500)
    TriggerEvent("chat:removeSuggestion", "/getcoords")
    TriggerEvent("chat:removeSuggestion", "/+playerTarget")
    TriggerEvent("chat:removeSuggestion", "/+radiotalk")
    TriggerEvent("chat:removeSuggestion", "/+scenecreate")
    TriggerEvent("chat:removeSuggestion", "/+scenedelete")
    TriggerEvent("chat:removeSuggestion", "/+scenehide")
    TriggerEvent("chat:removeSuggestion", "/-playerTarget")
    TriggerEvent("chat:removeSuggestion", "/-radiotalk")
    TriggerEvent("chat:removeSuggestion", "/alert_dead")
    TriggerEvent("chat:removeSuggestion", "/alert_gps")
    TriggerEvent("chat:removeSuggestion", "/cancelprogress")
    TriggerEvent("chat:removeSuggestion", "/fileserver_add")
    TriggerEvent("chat:removeSuggestion", "/fileserver_list")
    TriggerEvent("chat:removeSuggestion", "/fileserver_remove")
    TriggerEvent("chat:removeSuggestion", "/stance:data")
    TriggerEvent("chat:removeSuggestion", "/setvoiceintent")
    TriggerEvent("chat:removeSuggestion", "/dropStopsign")
    TriggerEvent("chat:removeSuggestion", "/datadog:key")
    TriggerEvent("chat:removeSuggestion", "/doorlock")
    TriggerEvent("chat:removeSuggestion", "/radio")
    TriggerEvent("chat:removeSuggestion", "/reload")
    TriggerEvent("chat:removeSuggestion", "/resetFastLock")
    TriggerEvent("chat:removeSuggestion", "/rateLimiter_getinfo_burst")
    TriggerEvent("chat:removeSuggestion", "/rateLimiter_getinfo_rate")
    TriggerEvent("chat:removeSuggestion", "/rateLimiter_http_info_burst")
    TriggerEvent("chat:removeSuggestion", "/rateLimiter_http_info_rate")
    TriggerEvent("chat:removeSuggestion", "/rateLimiter_netCommand_burst")
    TriggerEvent("chat:removeSuggestion", "/rateLimiter_netCommand_rate")
    TriggerEvent("chat:removeSuggestion", "/rateLimiter_netCommandFlood_burst")
    TriggerEvent("chat:removeSuggestion", "/rateLimiter_netCommandFlood_rate")
    TriggerEvent("chat:removeSuggestion", "/rateLimiter_netEvent_burst")
    TriggerEvent("chat:removeSuggestion", "/load_server_icon")
    TriggerEvent("chat:removeSuggestion", "/loadjobs")
    TriggerEvent("chat:removeSuggestion", "/locale")
    TriggerEvent("chat:removeSuggestion", "/cycleproximity")
    TriggerEvent("chat:removeSuggestion", "/-nui")
    TriggerEvent("chat:removeSuggestion", "/-vstr")
    TriggerEvent("chat:removeSuggestion", "/+vstr")
    TriggerEvent("chat:removeSuggestion", "/newdoor")
  end
end)