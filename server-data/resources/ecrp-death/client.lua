local isDead = false
local cfg = {}
local secondsRemaining = 5

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- Feel free to edit these coordinates or remove/add locations. The last number in the vector4 is the heading you want the player to spawn facing.
cfg.hospitals = {
    ["Sandy Shores Medical Center"] = {vector4(1838.9154052734, 3673.1560058594, 34.276821136475, 210.66963195801)},
    ["Paleto Bay Medical Center"] = {vector4(-247.02732849121, 6330.1938476563, 32.426025390625, 223.34436035156)},
    ["Pillbox Hill Medical Center"] = {vector4(298.85388183594, -584.68536376953, 43.260837554932, 63.688076019287)},
    ["Mount Zonah Medical Center"] = {vector4(-497.10861206055, -336.21859741211, 34.50171661377, 263.93426513672)},
    ["Portola Trinity Medical Center"] = {vector4(-875.32073974609, -309.48980712891, 39.532726287842, 336.37774658203)},
    ["Central Los Santos Medical Center"] = {vector4(342.40704345703, -1397.7272949219, 32.50923538208, 49.160144805908)},
    ["St. Fiacre Medical Center"] = {vector4(1151.0070800781, -1530.1062011719, 35.374580383301, 334.71020507813)}
}

function drawTxt(x, y, width, height, scale, text, r, g, b, a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if (outline) then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width / 2, y - height / 2 + 0.005)
end

function loadAnimDict(dict)
    RequestAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        Citizen.Wait(1)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if secondsRemaining > 0 and isDead == true then
            secondsRemaining = secondsRemaining - 1
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local health = GetEntityHealth(PlayerPedId())
        if health == 0 then
            isDead = true
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local player = GetPlayerPed(-1)
        Citizen.Wait(1)
        if isDead == true then
            if secondsRemaining > 1 then
                drawTxt(0.85, 1.4, 1.0, 1.0, 0.4, "~w~Dead: ~r~" .. secondsRemaining .. "~w~ seconds remaining", 255,
                    255, 255, 255)
            end
            if secondsRemaining < 1 then
                drawTxt(0.85, 1.4, 1.0, 1.0, 0.4, "HOLD ~r~E~w~ (~r~5~w~) TO ~r~REVIVE", 255, 255, 255, 255)
            end
            SetEntityHealth(player, 200)
            loadAnimDict("dead")
            TaskPlayAnim(GetPlayerPed(-1), "dead", "dead_a", 1.0, 1.0, -1, 1, 0, 0, 0, 0)
        end
    end
end)

Citizen.CreateThread(function(src)
  while true do
      Citizen.Wait(0)
      local timer = 0
      while IsControlPressed(1, 38) and secondsRemaining < 1 and isDead == true do
          Citizen.Wait(0)
          timer = timer + 1

          if timer > 60 then
              pressed = true
              TriggerEvent('ReviveSystem:RespawnTarget', src)
              isDead = false
              break
          end
      end
  end
end)

local function GetHospitalForRespawn(pCurrPos)
    local dist = 99999.9
    local closest = nil

    for k, v in pairs(cfg.hospitals) do
        local currDist = #(pCurrPos - vector3(v[1].x, v[1].y, v[1].z))
        if currDist < dist then
            dist = currDist
            closest = k
        end
    end

    -- Returns name of closest hospital and coords for closest hospital spawn location.
    return closest, cfg.hospitals[closest][1]
end

RegisterNetEvent("ReviveSystem:checkJob")
AddEventHandler("ReviveSystem:checkJob", function(pSource, pMessage)
    local PlayerData = ESX.GetPlayerData()
    if PlayerData.job.name == "police" or PlayerData.job.name == "bcso" or PlayerData.job.name == "ambulance" then
        TriggerEvent("ReviveSystem:ReviveTarget", pSource, pMessage)
    end
end)

RegisterNetEvent("ReviveSystem:ReviveTarget")
AddEventHandler("ReviveSystem:ReviveTarget", function(pSource, pMessage)
    if isDead then
        local ped_l = PlayerPedId()
        NetworkResurrectLocalPlayer(GetEntityCoords(ped_l, true), true, true, false)
        SetPlayerInvincible(ped_l, false)
        ClearPedBloodDamage(ped_l)
        secondsRemaining = 5
        isDead = false
    end
end)

RegisterNetEvent("ReviveSystem:AdminRevive")
AddEventHandler("ReviveSystem:AdminRevive", function(pMessage)
    if isDead then
        local ped_l = PlayerPedId()
        NetworkResurrectLocalPlayer(GetEntityCoords(ped_l, true), true, true, false)
        SetPlayerInvincible(ped_l, false)
        ClearPedBloodDamage(ped_l)
        isDead = false
        secondsRemaining = 5
        exports['mythic_notify']:DoHudText('inform', 'You have been resurrected by the gods')
    end
end)

RegisterNetEvent("ReviveSystem:Heal")
AddEventHandler("ReviveSystem:Heal", function(pMessage)
    if not isDead then
        local ped_l = PlayerPedId()
        ClearPedBloodDamage(ped_l)
        SetEntityHealth(ped_l, 200)
        TriggerEvent('esx_status:set', 'hunger', 1000000)
        TriggerEvent('esx_status:set', 'thirst', 1000000)
        TriggerEvent('esx_status:set', 'stress', 0)
        exports['mythic_notify']:DoHudText('inform', 'You have been healed by the gods')
    end
end)

RegisterNetEvent("ReviveSystem:RespawnTarget")
AddEventHandler("ReviveSystem:RespawnTarget", function()
    if isDead and secondsRemaining <= 0 then
        DoScreenFadeOut(500)
        Wait(500)
        local ped_l = PlayerPedId()
        local hospital, coords = GetHospitalForRespawn(GetEntityCoords(ped_l))
        SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
        NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, coords.w, true, false)
        SetPlayerInvincible(ped_l, false)
        ClearPedBloodDamage(ped_l)
        ClearPedTasks(ped_l)
        Wait(500)
        DoScreenFadeIn(500)
        Wait(500)
        exports['mythic_notify']:DoHudText('inform', 'SKIP!')
        secondsRemaining = 5
        isDead = false
    else
        exports['mythic_notify']:DoHudText('error', 'Time remaining: ' .. secondsRemaining)
    end
end)

function GetDeath()
    if isDead then
        return true
    elseif not isDead then
        return false
    end
end

RegisterCommand("kill", function(source, args, rawCommand)
    isDead = true
end)
