ESX = nil
local _wheel = nil
local npc = 0
local npcModel = 0
local enabled = false
local enabledText = "Disabled"

local casinoprops = {}

local _isRolling = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while not ESX.IsPlayerLoaded() do 
        Citizen.Wait(500)
    end

    if ESX.IsPlayerLoaded() then
        local model = GetHashKey('vw_prop_vw_luckywheel_02a')

        Citizen.CreateThread(function()
            RequestModel(model)
            while not HasModelLoaded(model) do
                Citizen.Wait(0)
            end

            _wheel = CreateObject(model, 990.2761, 42.83932, 70.55, false, false, true)
            SetEntityHeading(_wheel, -30.9754)
            SetModelAsNoLongerNeeded(model)
            table.insert(casinoprops, _wheel)
        end)
    end
end)

RegisterNetEvent("ecrp-luckywheel:doRoll")
AddEventHandler("ecrp-luckywheel:doRoll", function(_priceIndex)
    _isRolling = true
    -- SetEntityHeading(_wheel, -30.9754)
    Citizen.CreateThread(function()
        local speedIntCnt = 1
        local rollspeed = 1.0
        -- local _priceIndex = math.random(1, 20)
        local _winAngle = (_priceIndex - 1) * 18
        local _rollAngle = _winAngle + (360 * 8)
        local _midLength = (_rollAngle / 2)
        local intCnt = 0
        while speedIntCnt > 0 do
            local retval = GetEntityRotation(_wheel, 1)
            if _rollAngle > _midLength then
                speedIntCnt = speedIntCnt + 1
            else
                speedIntCnt = speedIntCnt - 1
                if speedIntCnt < 0 then
                    speedIntCnt = 0
                    
                end
            end
            intCnt = intCnt + 1
            rollspeed = speedIntCnt / 10
            local _y = retval.y - rollspeed
            _rollAngle = _rollAngle - rollspeed
            -- if _rollAngle < 5.0 then
            --     if _y > _winAngle then
            --         _y = _winAngle
            --     end
            -- end
            SetEntityHeading(_wheel, -30.9754)
            SetEntityRotation(_wheel, 0.0, _y, -30.9754, 2, false)
            Citizen.Wait(0)
        end
    end)
end)

RegisterNetEvent("ecrp-luckywheel:pressedRoll")
RegisterNetEvent("ecrp-luckywheel:pressedRoll", function()
    if not _isRolling then
        if enabled == true then
            _isRolling = true
            TriggerServerEvent("ecrp-luckywheel:getLucky")
        else
            exports['mythic_notify']:DoHudText('error', 'Wheel is Disabled')
        end
    else
        exports['mythic_notify']:DoHudText('error', 'Wheel is in use')
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local npcSpawnped = GetEntityCoords(PlayerPedId())
        local dist = (vector3(988.47, 43.29, 70.26) - npcSpawnped)
        TriggerEvent('ecrp-luckywheel:npc', vector3(988.47, 43.29, 70.26), 191.70)
        pedspawneado = true
        return
        -- if dist < 31 and pedspawneado == false then
        --     TriggerEvent('casinoWheel:npc', v.npcSpawn, v.h)
        --     pedspawneado = true
        -- end
        -- if dist >= 30 then
        --     pedspawneado = false
        --     SetEntityAlpha(npc, 1, false)
        --     DeletePed(npc)
        -- end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if pedspawneado == true then
          if enabled == false then
            exports.qtarget:AddTargetModel({npcModel}, {
                options = {{
                    event = "ecrp-luckywheel:toggleWheel",
                    icon = "fa-solid fa-circle",
                    label = "Toggle Wheel (" .. enabledText .. ")",
                    job = "casino"
                }, {
                    event = "ecrp-luckywheel:pressedRoll",
                    icon = "fa-solid fa-dollar-sign",
                    label = "Spin Wheel! ($500)"
                }},
                distance = 2
            })
          end
            
        end
    end
end)

RegisterNetEvent('ecrp-luckywheel:toggleWheel')
AddEventHandler('ecrp-luckywheel:toggleWheel', function()
    if enabled == true then
        enabled = false
        enabledText = "Disabled"
        exports['mythic_notify']:DoHudText('inform', 'Disabled')
    elseif enabled == false then
        enabled = true
        enabledText = "Enabled"
        exports['mythic_notify']:DoHudText('inform', 'Enabled')
    end
end)

RegisterNetEvent('ecrp-luckywheel:npc')
AddEventHandler('ecrp-luckywheel:npc', function(coords, heading)
    local hash = GetHashKey('s_m_y_casino_01')
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Wait(10)
    end
    while not HasModelLoaded(hash) do
        Wait(10)
    end

    pedspawneado = true
    npc = CreatePed(1, hash, coords, heading, false, false)
    npcModel = GetEntityModel(npc)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    loadAnimDict("amb@world_human_leaning@male@wall@back@hands_together@base")
    while not TaskPlayAnim(npc, "amb@world_human_leaning@male@wall@back@hands_together@base", "base", 8.0, 1.0, -1, 17,
        0, 0, 0, 0) do
        Wait(1000)
    end
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

RegisterNetEvent("ecrp-luckywheel:rollFinished")
AddEventHandler("ecrp-luckywheel:rollFinished", function()
    _isRolling = false
end)


function doRoll()
    if not _isRolling then
        _isRolling = true
        TriggerServerEvent("ecrp-luckywheel:getLucky")
    end
end


AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for _,wheel in pairs(casinoprops) do
            DeleteEntity(_wheel)
            DeletePed(npc)
        end
	end
end)