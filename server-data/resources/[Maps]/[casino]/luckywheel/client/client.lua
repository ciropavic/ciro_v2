ESX = nil
local _wheel = nil
local _lambo = nil
local npc = 0
local enabled = false
local enabledText = "Disabled"
local _isShowCar = false
local _wheelPos = vector3(978.15, 50.59, 75.40)
local _baseWheelPos = vector3(978.01, 50.35, 73.68)
local _podiumModel = vector3(963.42, 47.85, 74.32)

local casinoprops = {}

local Keys = {
    ["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}
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
        local baseWheelModel = GetHashKey('vw_prop_vw_luckywheel_01a')
        local podiumModel = GetHashKey('vw_prop_vw_casino_podium_01a')

        Citizen.CreateThread(function()
            RequestModel(baseWheelModel)
            while not HasModelLoaded(baseWheelModel) do
                Citizen.Wait(0)
            end

            _basewheel = CreateObject(baseWheelModel, _baseWheelPos.x, _baseWheelPos.y, _baseWheelPos.z, false, false, true)
            SetEntityHeading(_basewheel, 328.0)
            SetModelAsNoLongerNeeded(baseWheelModel)
            RequestModel(model)
            while not HasModelLoaded(model) do
                Citizen.Wait(0)
            end

            _wheel = CreateObject(model, 978.02, 50.38, 73.94, false, false, true)
            SetEntityHeading(_wheel, 328.0)
            SetModelAsNoLongerNeeded(model)
            spawnveh()
            table.insert(casinoprops, _wheel)
            table.insert(casinoprops, _basewheel)

            RequestModel(podiumModel)
            while not HasModelLoaded(podiumModel) do
              Citizen.Wait(0)
            end
            _podiumModel = CreateObject(podiumModel, _podiumModel.x, _podiumModel.y, _podiumModel.z, false, false, true)
            SetEntityHeading(_podiumModel, 0.0)
            SetModelAsNoLongerNeeded(podiumModel)
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
        if _lambo ~= nil then
            local _heading = GetEntityHeading(_lambo)
            local _z = _heading - 0.07
            SetEntityHeading(_lambo, _z)
        end
        Citizen.Wait(5)
    end
end)

Citizen.CreateThread(function() 
  while true do
      if _podiumModel ~= nil then
          local _heading = GetEntityHeading(_podiumModel)
          local _z = _heading - 0.07
          SetEntityHeading(_podiumModel, _z)
      end
      Citizen.Wait(5)
  end
end)

RegisterNetEvent("ecrp:doRoll")
AddEventHandler("ecrp:doRoll", function(_priceIndex)
    _isRolling = true
    SetEntityHeading(_wheel, 328.0)
    Citizen.CreateThread(function()
        local speedIntCnt = 1
        local rollspeed = 1.0
        local _winAngle = (_priceIndex - 1) * 18
        local _rollAngle = _winAngle + (360 * 25)
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
			      SetEntityHeading(_wheel, 328.0)
            SetEntityRotation(_wheel, 0.0, _y, 328.0, 2, true)
            Citizen.Wait(5)
        end
    end)
end)

RegisterNetEvent("ecrp:rollFinished")
AddEventHandler("ecrp:rollFinished", function()
    _isRolling = false
end)


RegisterNetEvent("ecrp:pressedRoll")
RegisterNetEvent("ecrp:pressedRoll", function ()
  if not _isRolling then
    if enabled == true then
      _isRolling = true
      TriggerServerEvent("ecrp:getLucky")
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
		for k, v in pairs(Config.Spawn) do
			local npcSpawnped = GetEntityCoords(PlayerPedId())	
			local dist = #(v.npcSpawn - npcSpawnped)
			
			if dist < 31 and pedspawneado == false then
				TriggerEvent('casinoWheel:npc',v.npcSpawn,v.h)
				pedspawneado = true
			end
			if dist >= 30  then
				pedspawneado = false
        SetEntityAlpha(npc, 1, false)
				DeletePed(npc)
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if pedspawneado == true then
            exports.qtarget:AddBoxZone("casinoSpin", vector3(976.32, 50.83, 74.68), 0.5, 0.6, {
                name = "casinoSpin",
                heading = 359,
                -- debugPoly=true,
                minZ = 73.48,
                maxZ = 75.48
            }, {
              options = {{
                  event = "ecrp:toggleWheel",
                  icon = "fa-solid fa-circle",
                  label = "Toggle Wheel (" .. enabledText .. ")",
                  job = "casino",
              }, {
                  event = "ecrp:pressedRoll",
                  icon = "fa-solid fa-dollar-sign",
                  label = "Spin Wheel! ($500)"
              }},
              distance = 2
            })
        end
    end
end)


RegisterNetEvent('ecrp:toggleWheel')
AddEventHandler('ecrp:toggleWheel', function ()
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

RegisterNetEvent('casinoWheel:npc')
AddEventHandler('casinoWheel:npc', function(coords, heading)
    local hash = GetHashKey(Config.npc)
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Wait(10)
    end
    while not HasModelLoaded(hash) do
        Wait(10)
    end

    pedspawneado = true
    npc = CreatePed(1, hash, coords, heading, false, false)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    loadAnimDict("amb@world_human_leaning@male@wall@back@hands_together@base")
    while not TaskPlayAnim(npc, "amb@world_human_leaning@male@wall@back@hands_together@base", "base", 8.0, 1.0, -1, 17, 0, 0, 0, 0) do
        Wait(1000)
    end
end)

function loadAnimDict( dict )
  while ( not HasAnimDictLoaded( dict ) ) do
      RequestAnimDict( dict )
      Citizen.Wait( 5 )
  end
end

function spawnveh()
    Zones = {
        VehicleSpawnPoint = {
            Pos   = {x = 963.48461914063, y = 47.688411712646, z = 75.568359375},
            Heading = 16.226079940796
        }
    }

    local carmodel = GetHashKey('gt3')
    RequestModel(carmodel)
    while not HasModelLoaded(carmodel) do
        Citizen.Wait(0)
    end

    ESX.Game.SpawnLocalVehicle(carmodel,  Zones.VehicleSpawnPoint.Pos, Zones.VehicleSpawnPoint.Heading, function(vehicle)
        Citizen.Wait(10)
        SetEntityAsMissionEntity(vehicle, true, true)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        SetVehicleOnGroundProperly(vehicle)
        Citizen.Wait(10)
        FreezeEntityPosition(vehicle, true)
        SetEntityInvincible(vehicle, true)
        SetVehicleDoorsLocked(vehicle, 2)
        SetVehicleModKit(vehicle, 0)
        SetVehicleMod(vehicle, 23, 51, false) -- wheels
        SetVehicleMod(vehicle, 1, 0, false) -- front bumper
        SetVehicleMod(vehicle, 2, 4, false) -- rear bumper
        SetVehicleMod(vehicle, 8, 1, false) -- left wing
        SetVehicleMod(vehicle, 9, 1, false) -- right wing

        SetVehicleColours(vehicle, 70, 150)
        SetVehicleDashboardColor(vehicle, 0)
        SetVehicleInteriorColor(vehicle, 150)
        SetVehicleExtraColours(vehicle, 0, 70)
        
        SetVehicleDirtLevel(vehicle, 0.0)
        _lambo = vehicle
        table.insert(casinoprops, _lambo)
    end)
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for _,wheel in pairs(casinoprops) do
            DeleteEntity(_wheel)
            DeleteEntity(_basewheel)
            DeleteEntity(_lambo)
        end
	end
end)
