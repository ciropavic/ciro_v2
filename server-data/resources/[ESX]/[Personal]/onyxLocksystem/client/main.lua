ESX = nil

local vehicles = {}
local searchedVehicles = {}
local pickedVehicle = nil
local hasCheckedOwnedVehs = false
local lockDisable = false

CustomMinigame = function()
  local game = exports["taskbarskill"]:taskBar(1200,7)
  if game == 100 then
      return true  
  else
      return false  
  end
end

Citizen.CreateThread(function()
  while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
  end

  while ESX.GetPlayerData() == nil do
      Citizen.Wait(10)
  end

  PlayerData = ESX.GetPlayerData()
end)

function givePlayerKeys(plate)
    local vehPlate = plate
    table.insert(vehicles, vehPlate)
end

function hasToggledLock()
    lockDisable = true
    Wait(100)
    lockDisable = false
end

function playLockAnim(vehicle)
    local dict = "anim@mp_player_intmenu@key_fob@"
    RequestAnimDict(dict)

    local veh = vehicle

    while not HasAnimDictLoaded do
        Citizen.Wait(0)
    end

    if not IsPedInAnyVehicle(PlayerPedId(), true) then
        TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
    end
end

function toggleLock(vehicle)
    local veh = vehicle

    local plate = GetVehicleNumberPlateText(veh)
    local lockStatus = GetVehicleDoorLockStatus(veh)
    if hasKeys(plate) and not lockDisable then
        if lockStatus == 1 then
            SetVehicleDoorsLocked(veh, 2)
            SetVehicleDoorsLockedForAllPlayers(veh, true)
            exports['mythic_notify']:DoHudText('error', 'Vehicle Locked')
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3, 'lock', 1.0)
            playLockAnim()
            hasToggledLock()
        elseif lockStatus == 2 then
            SetVehicleDoorsLocked(veh, 1)
            SetVehicleDoorsLockedForAllPlayers(veh, false)
            exports['mythic_notify']:DoHudText('success', 'Vehicle Unlocked')
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 3, "unlock", 0.1)
            playLockAnim(veh)
            hasToggledLock()
        else
            SetVehicleDoorsLocked(veh, 2)
            SetVehicleDoorsLockedForAllPlayers(veh, true)
            exports['mythic_notify']:DoHudText('error', 'Vehicle Locked')
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3, 'lock', 1.0)
            playLockAnim()
            hasToggledLock()
        end
        if not IsPedInAnyVehicle(PlayerPedId(), true) then
            Wait(500)
            local flickers = 0
            while flickers < 2 do
                SetVehicleLights(veh, 2)
                Wait(170)
                SetVehicleLights(veh, 0)
                flickers = flickers + 1
                Wait(170)
            end
        end
    end
end

RegisterNetEvent('onyx:pickDoor')
AddEventHandler('onyx:pickDoor', function()
    local IsAlredyContract = exports["ps-boosting"]:IsAlredyContract()
    if IsAlredyContract then
        TriggerEvent('boosting:lockpick')
        return
    else
        local Player = PlayerPedId()
        local pos = GetEntityCoords(Player)
        local entityWorld = GetOffsetFromEntityInWorldCoords(Player, 0.0, 20.0, 0.0)
        local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10,
            Player, 0)
        local a, b, c, d, vehicleHandle = GetRaycastResult(rayHandle)
        if vehicleHandle ~= nil and vehicleHandle ~= 0 then
            RequestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
            while not HasAnimDictLoaded('anim@amb@clubhouse@tutorial@bkr_tut_ig3@') do
                Citizen.Wait(0)
            end
            TaskPlayAnim(Player, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 8.0, -8.0,
                -1, 1, 0, false, false, false)
            if CustomMinigame() == true then
                ClearPedTasksImmediately(Player)
                SetVehicleDoorsLocked(vehicleHandle, 0)
                pickedVehicle = GetVehicleNumberPlateText(vehicleHandle)
                exports['mythic_notify']:DoHudText('inform', 'Lockpicked')
            else
                ClearPedTasksImmediately(Player)
                exports['mythic_notify']:DoHudText('inform', 'Lockpick failed!')
            end
        end
    end
end)

-- Locking vehicles
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
        local NewPickVeh = exports["ps-boosting"]:NewPickVeh()
        local pos = GetEntityCoords(PlayerPedId())
        if IsControlJustReleased(0, 182) then
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                toggleLock(veh)
            else
                local veh = GetClosestVehicle(pos.x, pos.y, pos.z, 3.0, 0, 70)
                if DoesEntityExist(veh) then
                    toggleLock(veh)
                end
            end
        end

        -- TODO: Unable to gain access to vehicles without a lockpick or keys
        local enteringVeh = GetVehiclePedIsTryingToEnter(PlayerPedId())
        local enteringPlate = GetVehicleNumberPlateText(enteringVeh)

        -- if not pickedVehicle or not pickedVehicle == enteringPlate then
        --     SetVehicleDoorsLocked(enteringVeh, 2) --locked
        -- end

        if pickedVehicle == enteringPlate or NewPickVeh == enteringPlate then
          SetVehicleDoorsLocked(enteringVeh, 0) --unlocked
        end
    end
end)

local isSearching = false
local isHotwiring = false

-- Has entered vehicle without keys
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local veh = GetVehiclePedIsIn(ped)
            local driver = GetPedInVehicleSeat(veh, -1)
            local plate = GetVehicleNumberPlateText(veh)
            if driver == ped then
                if not hasKeys(plate) and not isHotwiring and not isSearching then
                    SetVehicleEngineOn(veh, false, true, true)
                end
            end
        end
    end
end)

RegisterNetEvent('onyx:checkForKeys')
AddEventHandler('onyx:checkForKeys', function ()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local veh = GetVehiclePedIsIn(ped)
        local driver = GetPedInVehicleSeat(veh, -1)
        local plate = GetVehicleNumberPlateText(veh)
        if driver == ped then
            if not hasKeys(plate) and not isHotwiring and not isSearching then
                SetVehicleEngineOn(veh, false, true, true)
                TriggerServerEvent('onyx:reqHotwiring', plate)
            end
        end
    end
end)

RegisterNetEvent('onyx:slimjim')
AddEventHandler('onyx:slimjim', function ()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local veh = GetVehiclePedIsIn(ped)
        local driver = GetPedInVehicleSeat(veh, -1)
        local plate = GetVehicleNumberPlateText(veh)
        if driver == ped then
            if not hasKeys(plate) and not isHotwiring and not isSearching then
                SetVehicleEngineOn(veh, false, true, true)
                TriggerServerEvent('onyx:slimjim', plate)
            end
        end
    end
end)

RegisterCommand('slimjim', function ()
  TriggerEvent('onyx:slimjim')
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isHotwiring then
            DisableControlAction(0, 75, true) -- Disable exit vehicle
            DisableControlAction(0, 74, true) -- Lights
        end
    end
end)

RegisterNetEvent('onyx:updatePlates')
AddEventHandler('onyx:updatePlates', function(plate)
    table.insert(vehicles, plate)
end)

RegisterNetEvent('onyx:beginHotwire')
AddEventHandler('onyx:beginHotwire', function(plate)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    RequestAnimDict("veh@std@ds@base")

    while not HasAnimDictLoaded("veh@std@ds@base") do
        Citizen.Wait(100)
    end

    local vehPlate = plate
    isHotwiring = true

    SetVehicleEngineOn(veh, false, true, true)
    SetVehicleLights(veh, 0)

    if Config.HotwireAlarmEnabled then
        local alarmChance = math.random(1, Config.HotwireAlarmChance)

        if alarmChance == 1 then
            SetVehicleAlarm(veh, true)
            StartVehicleAlarm(veh)
        end
    end

    if CustomMinigame() == true then
      isHotwiring = false
      ClearPedSecondaryTask(playerPed)
      table.insert(vehicles, vehPlate)
      StopAnimTask(PlayerPedId(), 'veh@std@ds@base', 'hotwire', 1.0)
      SetVehicleEngineOn(veh, true, true, false)
    else
      isHotwiring = false
      return false  
    end
end)


local isRobbing = false
local canRob = false
local prevPed = false
local prevCar = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local foundEnt, aimingEnt = GetEntityPlayerIsFreeAimingAt(PlayerId())
        local entPos = GetEntityCoords(aimingEnt)
        local pos = GetEntityCoords(PlayerPedId())
        local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, entPos.x, entPos.y, entPos.z, true)

        if foundEnt and prevPed ~= aimingEnt and IsPedInAnyVehicle(aimingEnt, false) and IsPedArmed(PlayerPedId(), 7) and
            dist < 20.0 and not IsPedInAnyVehicle(PlayerPedId()) then
            if not IsPedAPlayer(aimingEnt) then
                prevPed = aimingEnt
                Wait(math.random(300, 700))
                local dict = "random@mugging3"
                RequestAnimDict(dict)
                while not HasAnimDictLoaded(dict) do
                    Citizen.Wait(0)
                end
                local rand = math.random(1, 10)

                if rand > 4 then
                    prevCar = GetVehiclePedIsIn(aimingEnt, false)
                    TaskLeaveVehicle(aimingEnt, prevCar)
                    SetVehicleEngineOn(prevCar, false, false, false)
                    while IsPedInAnyVehicle(aimingEnt, false) do
                        Citizen.Wait(0)
                    end
                    SetBlockingOfNonTemporaryEvents(aimingEnt, true)
                    ClearPedTasksImmediately(aimingEnt)
                    TaskPlayAnim(aimingEnt, dict, "handsup_standing_base", 8.0, -8.0, 0.01, 49, 0, 0, 0, 0)
                    ResetPedLastVehicle(aimingEnt)
                    TaskWanderInArea(aimingEnt, 0, 0, 0, 20, 100, 100)
                    canRob = true
                    beginRobTimer(aimingEnt)
                end
            end
        end
    end
end)

local canTakeKeys = true

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if canRob and not IsEntityDead(prevPed) and IsPlayerFreeAiming(PlayerId()) then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local entPos = GetEntityCoords(prevPed)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, entPos.x, entPos.y, entPos.z, false) < 3.5 then
                DrawText3Ds(entPos.x, entPos.y, entPos.z, 'Press ~y~[E]~w~ to rob')
                if IsControlJustReleased(0, 38) then
                    local rand = math.random(1, 10)
                    if rand == 1 then
                        Wait(400)
                        exports['mythic_notify']:DoHudText('inform', 'They do not hand over the keys')
                    else
                        local plate = GetVehicleNumberPlateText(prevCar)
                        exports['progressBars']:startUI(3600, "Taking Keys")
                        Wait(3600)
                        givePlayerKeys(plate)
                        exports['mythic_notify']:DoHudText('inform', 'You rob the keys')
                    end
                    SetBlockingOfNonTemporaryEvents(prevPed, false)
                    canRob = false
                end
            end
        end
    end
end)

function beginRobTimer(entity)
    local timer = 18

    while canRob do
        timer = timer - 1
        if timer == 0 then
            canRob = false
            SetBlockingOfNonTemporaryEvents(entity, false)
        end
        Wait(1000)
    end
end

function isNpc(ped)
    if IsPedAPlayer(ped) then
        return false
    else
        return true
    end
end

RegisterNetEvent('onyx:returnSearchedVehTable')
AddEventHandler('onyx:returnSearchedVehTable', function(plate)
    local vehPlate = plate
    table.insert(searchedVehicles, vehPlate)
end)

RegisterNetEvent('onyx:returnPickedVehTable')
AddEventHandler('onyx:returnPickedVehTable', function(plate)
    local vehPlate = plate
    table.insert(pickedVehicle, vehPlate)
end)

function hasKeys(plate)
    local vehPlate = plate
    for k, v in ipairs(vehicles) do
        if v == vehPlate or v == vehPlate .. ' ' then
            return true
        end
    end
    return false
end

function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local factor = #text / 460
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.3, 0.3)
    SetTextFont(6)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 160)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    DrawRect(_x, _y + 0.0115, 0.02 + factor, 0.027, 28, 28, 28, 95)
end

RegisterCommand("givekeys", function(source, args, rawCommand)
  -- Wait for next frame just to be safe
  Citizen.Wait(0)
  local player = PlayerPedId()
  local curVeh = GetVehiclePedIsIn(player, false)
  local plate = GetVehicleNumberPlateText(curVeh)
  local player, distance = ESX.Game.GetClosestPlayer()

  if distance ~= -1 and distance <= 3.0 then
    givePlayerKeys(plate)GetPlayerServerId(PlayerId())GetPlayerServerId(player)
  else
    exports['mythic_notify']:DoHudText('error', 'No player nearby')
  end
end, false)
