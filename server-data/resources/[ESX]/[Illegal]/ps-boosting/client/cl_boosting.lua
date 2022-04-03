

--BLIPS SYSTEM INFINITY 

BoostingClientBlips = {
  ActivePlayers = {}, 
  distant = {},
}

function BoostingClientBlips:UpdateBlips(playerID, x, y, z)
  local player = nil

  player = GetPlayerFromServerId(playerID)
  if IsPoliceAllowed() then
    if BoostingClientBlips.ActivePlayers[playerID] == nil then
        BoostingClientBlips.ActivePlayers[playerID] = AddBlipForCoord(x, y, z)
        SetBlipScale(BoostingClientBlips.ActivePlayers[playerID], 1.2)
        SetBlipSprite(BoostingClientBlips.ActivePlayers[playerID], 1)
        SetBlipColour(BoostingClientBlips.ActivePlayers[playerID], 1)
    elseif BoostingClientBlips.ActivePlayers[playerID] and x ~= 0.0  then
        SetBlipCoords(BoostingClientBlips.ActivePlayers[playerID], x, y, z)
    end
  end
end

function BoostingClientBlips:remove(playerID)
  if BoostingClientBlips.ActivePlayers[playerID] then
      RemoveBlip(BoostingClientBlips.ActivePlayers[playerID])
      BoostingClientBlips.ActivePlayers[playerID] = nil
  end
end

function BoostingClientBlips:Update(info)
  for k, v in pairs(info) do
      BoostingClientBlips.UpdateBlips(k, k, v.coords.x, v.coords.y, v.coords.z)
  end
end

RegisterNetEvent('boosting:updateBlips')
AddEventHandler('boosting:updateBlips',function(info)
  BoostingClientBlips:Update(info)
end)

RegisterNetEvent('boosting:RemoveBlip')
AddEventHandler('boosting:RemoveBlip',function(playerID)
  BoostingClientBlips:remove(playerID)
end)

--BLIPS SYSTEM INFINITY 

local tabletObject, isInTablet, VehicleStoled = nil, false, nil
local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
local anim = "machinic_loop_mechandplayer"
local flags = 49
local Circle
local placa
local DropZoneBlip
local itemBlip
local IdToRemove
local IsInQueue = false
local isVin = false
local CanChangePlate = false
local AlredyVinScratch = false
local isPoliceBlip = false
local AlredyContract = false
local gne = 100000
local login = false
local pendingDelivery = false
local pickedVehicle = nil
local ACTIVE_EMERGENCY_PERSONNEL = {}
local hacks = {
  number1 = false,
  number2 = false,
  number3 = false,
  number4 = false,
  number5 = false,
  number6 = false,
  number7 = false,
  number8 = false,
  number9 = false,
  number10 = false,
}
Contracts = {}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------FUNCTIONS------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function IsAlredyContract()
  if AlredyContract then
    return true
  else
    return false
  end
end

function HackingStage(number)
  if number == 1 then
    hacks.number1 = true
  elseif number == 2 then
    hacks.number1 = true
    hacks.number2 = true
  elseif number == 3 then
    hacks.number1 = true
    hacks.number2 = true
    hacks.number3 = true
  elseif number == 4 then
    hacks.number1 = true
    hacks.number2 = true
    hacks.number3 = true
    hacks.number4 = true
  elseif number == 5 then
    hacks.number1 = true
    hacks.number2 = true
    hacks.number3 = true
    hacks.number4 = true
    hacks.number5 = true
  elseif number == 6 then
    hacks.number1 = true
    hacks.number2 = true
    hacks.number3 = true
    hacks.number4 = true
    hacks.number5 = true
    hacks.number6 = true
  elseif number == 7 then
    hacks.number1 = true
    hacks.number2 = true
    hacks.number3 = true
    hacks.number4 = true
    hacks.number5 = true
    hacks.number6 = true
    hacks.number7 = true
  elseif number == 8 then
    hacks.number1 = true
    hacks.number2 = true
    hacks.number3 = true
    hacks.number4 = true
    hacks.number5 = true
    hacks.number6 = true
    hacks.number7 = true
    hacks.number8 = true
  elseif number == 9 then
    hacks.number1 = true
    hacks.number2 = true
    hacks.number3 = true
    hacks.number4 = true
    hacks.number5 = true
    hacks.number6 = true
    hacks.number7 = true
    hacks.number8 = true
    hacks.number9 = true
  elseif number == 10 then
    hacks.number1 = true
    hacks.number2 = true
    hacks.number3 = true
    hacks.number4 = true
    hacks.number5 = true
    hacks.number6 = true
    hacks.number7 = true
    hacks.number8 = true
    hacks.number9 = true
    hacks.number10 = true
  end
end

function HackingIsCompleted()
  if hacks.number1 == false and hacks.number2 == false and hacks.number3 == false and hacks.number4 == false and hacks.number5 == false and hacks.number6 == false and hacks.number7 == false and hacks.number8 == false and hacks.number9 == false and hacks.number10 == false then
    return true
  else
    return false
  end
end

function FinishPolice() 
  if isVin then
    exports[GetCurrentResourceName()]:sendAppEvent('BoostingNotification', {notify = {msg = Config.Locale.Step3Vin, time = "3/4" , app = 'Boosting', img = 'https://imgur.com/FEPqpLc.png'}})
    CustomNotification(Config.Locale.Step3Vin)
    isPoliceBlip = false
    RemoveCopBlip()
    TriggerServerEvent("boosting:SendRemovePoliceBlip", VehicleStoled)
  else
    isPoliceBlip = false
    RemoveCopBlip()
    TriggerServerEvent("boosting:SendRemovePoliceBlip", VehicleStoled)
  end
end

function DoHackingStagesCOP()
  if hacks.number1 == true then
    hacks.number1 = false
    if HackingIsCompleted() then
      FinishPolice() 
    end
  elseif hacks.number2 == true then
    hacks.number2 = false
    if HackingIsCompleted() then
      FinishPolice() 
    end
  elseif hacks.number3 == true then
    hacks.number3 = false
    if HackingIsCompleted() then
      FinishPolice() 
    end
  elseif hacks.number4 == true then
    hacks.number4 = false
    if HackingIsCompleted() then
      FinishPolice() 
    end
  elseif hacks.number5 == true then
    hacks.number5 = false
    if HackingIsCompleted() then
      FinishPolice() 
    end
  elseif hacks.number6 == true then
    hacks.number6 = false
    if HackingIsCompleted() then
      FinishPolice() 
    end
  elseif hacks.number7 == true then
    hacks.number7 = false
    if HackingIsCompleted() then
      FinishPolice() 
    end
  elseif hacks.number8 == true then
    hacks.number8 = false
    if HackingIsCompleted() then
      FinishPolice() 
    end
  elseif hacks.number9 == true then
    hacks.number9 = false
    if HackingIsCompleted() then
      FinishPolice() 
    end
  elseif hacks.number10 == true then
    hacks.number10 = false
    if HackingIsCompleted() then
      FinishPolice() 
    end
  end
  return true
end

function DoHackingStages()
  if hacks.number1 == true then
    if CustomMinigameHack() then
      hacks.number1 = false
      CustomNotification(Config.Locale.HackSuccess)
      return true
    else
      CustomNotification(Config.Locale.HackFail)
      return false
    end
  elseif hacks.number2 == true then
    if CustomMinigameHack() then
      hacks.number2 = false
      CustomNotification(Config.Locale.HackSuccess)
      return true
    else
      CustomNotification(Config.Locale.HackFail)
      return false
    end
  elseif hacks.number3 == true then
    if CustomMinigameHack() then
      hacks.number3 = false
      CustomNotification(Config.Locale.HackSuccess)
      return true
    else
      CustomNotification(Config.Locale.HackFail)
      return false
    end
  elseif hacks.number4 == true then
    if CustomMinigameHack() then
      hacks.number4 = false
      CustomNotification(Config.Locale.HackSuccess)
      return true
    else
      CustomNotification(Config.Locale.HackFail)
      return false
    end
  elseif hacks.number5 == true then
    if CustomMinigameHack() then
      hacks.number5 = false
      CustomNotification(Config.Locale.HackSuccess)
      return true
    else
      CustomNotification(Config.Locale.HackFail)
      return false
    end
  elseif hacks.number6 == true then
    if CustomMinigameHack() then
      hacks.number6 = false
      CustomNotification(Config.Locale.HackSuccess)
      return true
    else
      CustomNotification(Config.Locale.HackFail)
      return false
    end
  elseif hacks.number7 == true then
    if CustomMinigameHack() then
      hacks.number7 = false
      CustomNotification(Config.Locale.HackSuccess)
      return true
    else
      CustomNotification(Config.Locale.HackFail)
      return false
    end
  elseif hacks.number8 == true then
    if CustomMinigameHack() then
      hacks.number8 = false
      CustomNotification(Config.Locale.HackSuccess)
      return true
    else
      CustomNotification(Config.Locale.HackFail)
      return false
    end
  elseif hacks.number9 == true then
    if CustomMinigameHack() then
      hacks.number9 = false
      CustomNotification(Config.Locale.HackSuccess)
      return true
    else
      CustomNotification(Config.Locale.HackFail)
      return false
    end
  elseif hacks.number10 == true then
    if CustomMinigameHack() then
      hacks.number10 = false
      CustomNotification(Config.Locale.HackSuccess)
      return true
    else
      CustomNotification(Config.Locale.HackFail)
      return false
    end
  end
  return true
end

function NumberOfContractsByLevel(level)
  if level == "D" then
    return Config.NumberOfHacks.D
  elseif level == "C" then
    return Config.NumberOfHacks.C
  elseif level == "B" then
    return Config.NumberOfHacks.B
  elseif level == "A" then
    return Config.NumberOfHacks.A
  elseif level == "S" then
    return Config.NumberOfHacks.S
  elseif level == "S+" then
    return Config.NumberOfHacks.SPLUS
  end
end

function randomChange(percent)
  local re = percent >= math.random(1, 100)  
  return re
end

function CreateBlip(v)
    Circle = Citizen.InvokeNative(0x46818D79B1F7499A,v.x + math.random(0.0,150.0), v.y + math.random(0.0,80.0), v.z + math.random(0.0,5.0) , 300.0) -- you can use a higher number for a bigger zone
    SetBlipHighDetail(Circle, true)
    SetBlipColour(Circle, 18)
    SetBlipAlpha (Circle, 128)
end

function DeleteCircle()
    if DoesBlipExist(Circle) then
        RemoveBlip(Circle)
    end
end

function DeleteBlip()
	if DoesBlipExist(Circle) then
		RemoveBlip(Circle)
	end
end

function addBlip(coords, sprite, colour, text)
  local blip = AddBlipForCoord(coords)
  SetBlipSprite(blip, sprite)
  SetBlipColour(blip, colour)
  SetBlipScale(blip, 1.0)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(text)
  EndTextCommandSetBlipName(blip)
  return blip
end

-- function CreateCopBlip()
--   TriggerServerEvent("boosting:SendAddPoliceBlip")
-- end

function RemoveCopBlip()
  TriggerServerEvent("boosting:SendRemovePoliceBlip")
end

local function getField(field , vehicle)
  return GetVehicleHandlingFloat(vehicle, 'CHandlingData', field)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function CreateVeh(model , coord, id)
  local Hash = tostring(model)
  if not IsModelInCdimage(Hash) then return end
  RequestModel(Hash)
  while not HasModelLoaded(Hash) do
      Citizen.Wait(10)
  end

  veh = CreateVehicle(Hash, coord.x, coord.y , coord.z, 0.0, true, false)
  --veh = CreateVehicleServer(Hash, coord.x, coord.y , coord.z, 0.0, true, false)
  SetModelAsNoLongerNeeded(Hash) 
  SetVehicleEngineOn(veh, false, false)
  SetVehicleDoorsLocked(veh, 2)

  return veh, GetVehicleNumberPlateText(veh)
end

function doTablet()
  local playerPed = PlayerPedId()
  local dict = "amb@world_human_seat_wall_tablet@female@base"
  RequestAnimDict(dict)
  if tabletObject == nil then
    tabletObject = CreateObject(GetHashKey('prop_cs_tablet'), GetEntityCoords(playerPed), 1, 1, 1)
    AttachEntityToEntity(tabletObject, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.03, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
  end
  while not HasAnimDictLoaded(dict) do Citizen.Wait(100) end
  if not IsEntityPlayingAnim(playerPed, dict, 'base', 3) then
    TaskPlayAnim(playerPed, dict, "base", 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
  end
end

function DoTimer(pisInTablet)
  isInTablet = pisInTablet
  if not isInTablet then
      return
  end
  Citizen.CreateThread( function()
    while isInTablet do
      Citizen.Wait(100)
      local year = GetClockYear()
      local month = GetClockMonth()
      local day = GetClockDayOfMonth()
      local hour = GetClockHours()
      local minute = GetClockMinutes()
      local time = ''..hour..':'..minute..' '..day..'/'..month..'/'..year..''
      exports[GetCurrentResourceName()]:sendAppEvent('BoostingApp', {
        time = time
      })
    end
  end)
end

function getClock()
  local hour = GetClockHours()
  local minute = GetClockMinutes()
  return hour..":"..minute
end

local min = 60000

Citizen.CreateThread(function()
  while true do
    if IsInQueue then
      Citizen.Wait(math.random(Config.QueueTimeMin*min, Config.QueueTimeMax*min))
      if IsInQueue then
        if not AlredyContract then
          TriggerServerEvent("boosting:CreateContract", getClock())
        end
      end
    end
    Citizen.Wait(1000)
  end
end)

RegisterNetEvent("boosting:addsrc")
AddEventHandler("boosting:addsrc", function(src)
    ACTIVE_EMERGENCY_PERSONNEL[src] = src
end)

RegisterNetEvent("boosting:Removesrc")
AddEventHandler("boosting:Removesrc", function(src)
  RemoveAnyExistingEmergencyBlipsById(src)
	ACTIVE_EMERGENCY_PERSONNEL[src] = nil
end)

Citizen.CreateThread(function()
	while true do
    if login then
		  if IsPoliceAllowed() == true then
		  	for src, info in pairs(ACTIVE_EMERGENCY_PERSONNEL) do
		  		local player = GetPlayerFromServerId(src)
		  		local ped = GetPlayerPed(player)
          local veh = GetVehiclePedIsIn(ped)
		  		if ped then
		  			if GetBlipFromEntity(ped) == 0 then
		  				local blip = AddBlipForEntity(ped)
              SetBlipSprite (blip, 161)
              SetBlipDisplay(blip, 4)
              SetBlipScale  (blip, 1.0)
              SetBlipColour (blip, 1)
              SetBlipAsShortRange(blip, true)
		  			end
		  		end
		  	end
      else
        RemoveAnyExistingEmergencyBlips()
		  end
    end
    Wait(3000)
	end
end)


function RemoveAnyExistingEmergencyBlips()
  for src, info in pairs(ACTIVE_EMERGENCY_PERSONNEL) do
      local possible_blip = GetBlipFromEntity(GetPlayerPed(GetPlayerFromServerId(src)))
      if possible_blip ~= 0 then
          RemoveBlip(possible_blip)
          -- ACTIVE_EMERGENCY_PERSONNEL[src] = nil
      end
  end
end

function RemoveAnyExistingEmergencyBlipsById(id)
  local possible_blip = GetBlipFromEntity(GetPlayerPed(GetPlayerFromServerId(id)))
  if possible_blip ~= 0 then
      RemoveBlip(possible_blip)
      -- ACTIVE_EMERGENCY_PERSONNEL[id] = nil
  end
end


function MakeDropZoneThread(IsInWay)
  local setCoords = Config.DropZones[math.random(1, Config.NumberDropZones)].coords
  dropZoneblip = addBlip(setCoords, 225, 2, "Dropzone")
  Citizen.CreateThread(function()
    while IsInWay do
      Citizen.Wait(1000)
      local plped = PlayerPedId()
      local coordA = GetEntityCoords(plped)
      local veh = GetVehiclePedIsIn(plped)
      if(veh ~= 0) then
        if(GetVehicleNumberPlateText(veh) == placa) then
          local aDist = GetDistanceBetweenCoords(setCoords, coordA)
          if aDist < 10.0 and HackingIsCompleted() then
            exports['mythic_notify']:DoHudText('inform', 'In drop zone (Wait 5 seconds)')
            Citizen.Wait(5000)
            DeleteEntity(veh)
            RemoveBlip(dropZoneblip)
            pickedVehicle = nil

            exports[GetCurrentResourceName()]:sendAppEvent('SetDisableButtons', {enableButtons = false})
            exports[GetCurrentResourceName()]:sendAppEvent("RemoveContractInfo", {IdToRemove = IdToRemove})

            TriggerServerEvent("boosting:completeNormalContract", IdToRemove)
            IdToRemove = nil
            AlredyContract = false
            TriggerServerEvent("boosting:IsInContract", false)
            break
          elseif aDist < 10.0 and not HackingIsCompleted() then
            exports['mythic_notify']:DoHudText('error', 'Hack not complete')
            Citizen.Wait(5000)
          end
        end
      end
    end
  end)
end

function MakeDropZoneThreadVin(IsInWay)
  local setCoords = Config.VinDropZones[math.random(1, Config.NumberVinDropZones)].coords
  dropZoneblip = addBlip(setCoords, 225, 2, "Vin Scratch")
  Citizen.CreateThread(function()
    while IsInWay do
      Citizen.Wait(1000)
      local plped = PlayerPedId()
      local coordA = GetEntityCoords(plped)
      local veh = GetVehiclePedIsIn(plped)
        if(veh ~= 0) then
          if(GetVehicleNumberPlateText(veh) == placa) then
            local aDist = GetDistanceBetweenCoords(setCoords, coordA)
            if aDist < 10.0 then
              CanChangePlate = true
            end 
          else if(GetVehicleNumberPlateText(veh) ~= placa) then
            local aDist = GetDistanceBetweenCoords(setCoords, coordA)
            if aDist < 10.0 then
              if AlredyVinScratch and HackingIsCompleted() then
                print('done')
                local plate = GetVehicleNumberPlateText(veh)
                RemoveBlip(dropZoneblip)
                exports[GetCurrentResourceName()]:sendAppEvent('SetDisableButtons', {enableButtons = false})
                exports[GetCurrentResourceName()]:sendAppEvent("RemoveContractInfo", {IdToRemove = IdToRemove})
                TriggerServerEvent("boosting:completeVinContract", IdToRemove, GetPlateQB(veh), GetVehiclePropertiesQB(veh))
                IdToRemove = nil
                AlredyContract = false
                TriggerServerEvent("boosting:IsInContract", false)
                exports[GetCurrentResourceName()]:sendAppEvent('BoostingNotification', {notify = {msg = Config.Locale.Step4Vin, time = "4/4" , app = 'Boosting', img = 'https://imgur.com/FEPqpLc.png'}})
                CustomNotification(Config.Locale.Step4Vin)
                break
              elseif not AlredyVinScratch and HackingIsCompleted() then
                exports['mythic_notify']:DoHudText('error', 'Plate not changed')
                Citizen.Wait(5000)
              end
            end
          end
        end
      end
    end
  end)
end

function DropItemZone(data, pay)
  local setCoords = Config.DropBennysZones[math.random(1, Config.NumberDropBennysZones)].coords
  itemBlip = addBlip(setCoords, 440, 5, "Bennys Drop")
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(1000)
      pendingDelivery = true
      local plped = PlayerPedId()
      local coordA = GetEntityCoords(plped)
      local aDist = GetDistanceBetweenCoords(setCoords, coordA)
      if aDist < 5.0 then
        TriggerServerEvent("boosting:bennysitem", data, pay)
        RemoveBlip(itemBlip)
        pendingDelivery = false
        break
      end
    end
  end)
end

function generateStringNumber(format) 
  local abyte = string.byte("A")
  local zbyte = string.byte("0")

  local number = ""
  for i=1,#format do
    local char = string.sub(format, i,i)
    if char == "D" then number = number..string.char(zbyte+math.random(0,9))
    elseif char == "L" then number = number..string.char(abyte+math.random(0,25))
    else number = number..char end
  end

  return number
end

function filterLevel(number)
  local boomer = tonumber(number)
  if boomer >= 0 and boomer <= 100 then
    return boomer, 'D', 'C'
  elseif boomer >= 100 and boomer <= 200 then
    return boomer -100, 'C', 'B'
  elseif boomer >= 200 and boomer <= 300 then
    return boomer -200, 'B', 'A'
  elseif boomer >= 200 and boomer <= 400 then
    return boomer -300, 'A', 'S'
  elseif boomer >= 200 and boomer <= 500 then
    return boomer -400, 'S', 'S+'
  else 
    return 100, 'S', 'S+'
  end
end



function getNearestPlayer(radius)
  local p = nil
  local players = GetNearestSource(radius)
  local min = radius+10.0
  for k,v in pairs(players) do
    if v < min then
      min = v
      p = k
    end
  end
  return p
end

function GetNearestSource(radius) 
  local r = {}

  local ped = PlayerPedId()
  local pid = PlayerId()
  local px,py,pz = table.unpack(GetEntityCoords(ped))

  for k in pairs(GetActivePlayers()) do
    local player = GetPlayerFromServerId(k)

    if player ~= pid and NetworkIsPlayerConnected(player) then
      local oped = GetPlayerPed(player)
      local x,y,z = table.unpack(GetEntityCoords(oped,true))
      local distance = GetDistanceBetweenCoords(x,y,z,px,py,pz,true)
      if distance <= radius then
        r[GetPlayerServerId(player)] = distance
      end
    end
  end

  return r
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------HANDLERS-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if Config.Framework == "standalone" then
  AddEventHandler("playerSpawned",function()
    TriggerServerEvent("boosting:playerSpawned")
    Citizen.Wait(5000)
    exports[GetCurrentResourceName()]:sendAppEvent('SetConsumableItems', {ConsumableItems = Config.ConsumableItems})
    exports[GetCurrentResourceName()]:sendAppEvent('SetPerformanceObject', {PerformanceObject = Config.PerformanceObject})
    exports[GetCurrentResourceName()]:sendAppEvent('SetCosmeticObject', {CosmeticObject = Config.CosmeticObject})
    exports[GetCurrentResourceName()]:sendAppEvent('SetExtraVin', {ExtraVin = Config.ExtraVinGne})
  end)
end

RegisterNetEvent("boosting:qbSpawn")
AddEventHandler("boosting:qbSpawn", function()
  login = true
  exports[GetCurrentResourceName()]:sendAppEvent('SetConsumableItems', {ConsumableItems = Config.ConsumableItems})
  exports[GetCurrentResourceName()]:sendAppEvent('SetPerformanceObject', {PerformanceObject = Config.PerformanceObject})
  exports[GetCurrentResourceName()]:sendAppEvent('SetCosmeticObject', {CosmeticObject = Config.CosmeticObject})
  exports[GetCurrentResourceName()]:sendAppEvent('SetExtraVin', {ExtraVin = Config.ExtraVinGne})
end)

RegisterNetEvent("boosting:CreateContractFromServer")
AddEventHandler("boosting:CreateContractFromServer", function(contract, extra)
  exports[GetCurrentResourceName()]:sendAppEvent('ContractsBoosting', {contracts = contract})
  exports[GetCurrentResourceName()]:sendAppEvent('BoostingNotification', {notify = extra})
end)

RegisterNetEvent("boosting:CreateContractFromServer2")
AddEventHandler("boosting:CreateContractFromServer2", function(contract, extra)
  exports[GetCurrentResourceName()]:sendAppEvent('ContractsBoosting', {contracts = contract})
end)

RegisterNetEvent("boosting:updateTime")
AddEventHandler("boosting:updateTime", function(id, time)
  exports[GetCurrentResourceName()]:sendAppEvent('UpdateTime', {id = id, expires = time})
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(60*1000)
    TriggerServerEvent("update:boostings")
  end
end)

RegisterNetEvent("boosting:setlevel")
AddEventHandler("boosting:setlevel", function(level, newgne)
  local level, type1, type2 = filterLevel(level)
  gne = tonumber(newgne)
  exports[GetCurrentResourceName()]:sendAppEvent('SetBoostingLevel', {level = level, type1 = type1, type2 = type2, gne = gne})
end)

RegisterNetEvent("boosting:lockpick")
AddEventHandler("boosting:lockpick", function()
  local Player = PlayerPedId()
  local pos = GetEntityCoords(Player)
  local entityWorld = GetOffsetFromEntityInWorldCoords(Player, 0.0, 20.0, 0.0)
  local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, Player, 0)
  local a, b, c, d, vehicleHandle = GetRaycastResult(rayHandle)
  if vehicleHandle ~= nil and vehicleHandle ~= 0 then
    RequestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
    while not HasAnimDictLoaded('anim@amb@clubhouse@tutorial@bkr_tut_ig3@') do
      Citizen.Wait(0)
    end
    TaskPlayAnim(Player, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@' , 'machinic_loop_mechandplayer' ,8.0, -8.0, -1, 1, 0, false, false, false )
    if CustomMinigame() == true then
      ClearPedTasksImmediately(Player)
      SetVehicleDoorsLocked(vehicleHandle, 0)
      pickedVehicle = GetVehicleNumberPlateText(vehicleHandle)
      CustomNotification(Config.Locale.DoorOpen)
      -- print(VehicleStoled, vehicleHandle)
      --if VehicleStoled == vehicleHandle then
      -- print((GetVehicleNumberPlateText(vehicleHandle) == placa))
      if(GetVehicleNumberPlateText(vehicleHandle) == placa)then
        if isVin then
          exports[GetCurrentResourceName()]:sendAppEvent('BoostingNotification', {notify = {msg = Config.Locale.BeforeScratch, time = "2/4" , app = 'Boosting', img = 'https://imgur.com/FEPqpLc.png'}})
          CustomNotification(Config.Locale.BeforeScratch)
          MakeDropZoneThreadVin(true)
          DeleteBlip()
          TriggerServerEvent("Boosting:AddBlipsSystem")
          isPoliceBlip = true

          TriggerEvent('ecrp:vehicleboost')
        else
          exports[GetCurrentResourceName()]:sendAppEvent('BoostingNotification', {notify = {msg = Config.Locale.BeforeDropOff, time = "2/4" , app = 'Boosting', img = 'https://imgur.com/FEPqpLc.png'}})
          CustomNotification(Config.Locale.BeforeDropOff)
          isPoliceBlip = true
          DeleteBlip()
          TriggerServerEvent("Boosting:AddBlipsSystem")
          MakeDropZoneThread(true)
          TriggerEvent('ecrp:vehicleboost')
        end
      end
    else
      ClearPedTasksImmediately(Player)
      CustomNotification(Config.Locale.DoorFail)
    end
  end
end)

-- RegisterCommand('testboost', function ()
--   TriggerEvent('ecrp:vehicleboost')
-- end)

function NewPickVeh()
  if pickedVehicle == nil then
    return
  else
    return pickedVehicle
  end
end

if Config.CustomKeySystem then

  exports("SetOpenedDoors", function()
    if isVin then
      exports[GetCurrentResourceName()]:sendAppEvent('BoostingNotification', {notify = {msg = Config.Locale.Step3Vin, time = "2/4" , app = 'Boosting', img = 'https://imgur.com/FEPqpLc.png'}})
      CustomNotification(Config.Locale.Step3Vin)
      TriggerEvent("setlockpicked:boosting")
      MakeDropZoneThreadVin(true)
      DeleteBlip()
      isPoliceBlip = true
      -- CreateCopBlip()
    else
      isPoliceBlip = true
      -- CreateCopBlip()
      TriggerEvent("setlockpicked:boosting")
      DeleteBlip()
      MakeDropZoneThread(true)
    end
  end)

end

RegisterNetEvent("boosting:antiPolice")
AddEventHandler("boosting:antiPolice", function()
  if isPoliceBlip then
    DoHackingStages()
    if HackingIsCompleted() then
      if isVin then
        exports[GetCurrentResourceName()]:sendAppEvent('BoostingNotification', {notify = {msg = Config.Locale.Step3Vin, time = "3/4" , app = 'Boosting', img = 'https://imgur.com/FEPqpLc.png'}})
        CustomNotification(Config.Locale.Step3Vin)
        isPoliceBlip = false
        TriggerServerEvent("Boosting:RemoveBlipsSystem")
      else
        isPoliceBlip = false
        TriggerServerEvent("Boosting:RemoveBlipsSystem")
      end
    end
  else
    if CustomMinigameHack() then
      TriggerServerEvent("boosting:coop", getNearestPlayer(1))
      CustomNotification(Config.Locale.HackSuccess)
    else
      CustomNotification(Config.Locale.HackFail)
    end
  end
end)


RegisterNetEvent("boosting:ChangePlate")
AddEventHandler("boosting:ChangePlate", function()
  if isVin then
    if CanChangePlate then
      local Player = PlayerPedId()
      local pos = GetEntityCoords(Player)
      local entityWorld = GetOffsetFromEntityInWorldCoords(Player, 0.0, 20.0, 0.0)
      local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, Player, 0)
      local a, b, c, d, vehicleHandle = GetRaycastResult(rayHandle)
      if vehicleHandle ~= nil and vehicleHandle ~= 0 then
        RequestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
        while not HasAnimDictLoaded('anim@amb@clubhouse@tutorial@bkr_tut_ig3@') do
          Citizen.Wait(0)
        end
        TaskPlayAnim(Player, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@' , 'machinic_loop_mechandplayer' ,8.0, -8.0, -1, 1, 0, false, false, false )
        
        if ScratchProgress() == true then
          ClearPedTasksImmediately(Player)
          local placa = GeneratePlate()
          SetVehicleNumberPlateText(vehicleHandle, placa)
          AlredyVinScratch = true
          exports["onyxLocksystem"]:givePlayerKeys(placa)
          exports['mythic_notify']:DoHudText('inform', 'Sit in vehicle')
        else 
          ClearPedTasksImmediately(Player)
          CustomNotification(Config.Locale.PlateFail)
        end
      end
    end
  end
end)

RegisterNetEvent("boosting:copBoosting")
AddEventHandler("boosting:copBoosting", function()
  DoHackingStagesCOP()
end)


RegisterNetEvent("open:boostingApp")
AddEventHandler("open:boostingApp", function()
  openApplication("OpenBoostingApp")
  SetNuiFocus(true, true)
  DoTimer(true)
  doTablet()
end)

RegisterNUICallback("ps-boosting:closeBoostingApp", function(data, cb)
  DoTimer(false)
  SetNuiFocus(false, false)
  DeleteEntity(tabletObject)
  ClearPedTasks(PlayerPedId())
  cb({})
end)


RegisterNUICallback("ps-boosting:startContract", function(data, cb) 
  if not AlredyContract then
    if data.IsVin then
      local units = tonumber(data.props.units)
      if units + Config.ExtraVinGne <= gne then
        local mexico, minutes = InCoolDown()
        if mexico then
          HackingStage(NumberOfContractsByLevel(data.props.type))
          AlredyContract = true
          TriggerServerEvent("boosting:IsInContract", true)
          local vehicle, plate = CreateVeh(data.props.vehicle, data.props.coords)
          placa = plate
          print(plate)
          isVin = data.IsVin
          VehicleStoled = vehicle
          exports[GetCurrentResourceName()]:sendAppEvent('BoostingNotification', {notify = {msg = Config.Locale.StartedContract..plate, time = getClock() , app = 'Boosting', img = 'https://imgur.com/FEPqpLc.png'}})
          IdToRemove = data.props.id
          CreateBlip(data.props.coords)
          exports[GetCurrentResourceName()]:sendAppEvent('SetDisableButtons', {enableButtons = true})
          exports[GetCurrentResourceName()]:sendAppEvent('BoostingNotification', {notify = {msg = Config.Locale.Step1Vin, time = "1/4" , app = 'Boosting', img = 'https://imgur.com/FEPqpLc.png'}})
          cb({Contract = true})
        else
          exports[GetCurrentResourceName()]:sendAppEvent('BoostingNotification', {notify = {msg = "You can't start this contract wait "..minutes.." minutes", time = getClock() , app = 'Boosting', img = 'https://imgur.com/FEPqpLc.png'}})
          cb({Contract = false})
        end
      else
        CustomNotification(Config.Locale.NotGNE)
        AlredyContract = false
        cb({Contract = false})
      end
    else
      HackingStage(NumberOfContractsByLevel(data.props.type))
      AlredyContract = true
      TriggerServerEvent("boosting:IsInContract", true)
      local vehicle, plate = CreateVeh(data.props.vehicle, data.props.coords)
      placa = plate
      VehicleStoled = vehicle
      exports[GetCurrentResourceName()]:sendAppEvent('BoostingNotification', {notify = {msg = Config.Locale.StartedContract..plate, time = getClock() , app = 'Boosting', img = 'https://imgur.com/FEPqpLc.png'}})
      IdToRemove = data.props.id
      CreateBlip(data.props.coords)
      exports[GetCurrentResourceName()]:sendAppEvent('SetDisableButtons', {enableButtons = true})
      cb({Contract = true})
     -- CustomNotification(Config.Locale.NotGNE)
    end
  else
    CustomNotification(Config.Locale.ContractInProgress)
  end
end)

RegisterNUICallback("ps-boosting:transferContract", function(data, cb) 
  exports[GetCurrentResourceName()]:sendAppEvent("RemoveContractInfo", {IdToRemove = data.props.id})
  TriggerServerEvent("boosting:TransferContract", data)
  cb({})
end)

RegisterNUICallback("ps-boosting:DeclineContract", function(data, cb) 
  exports[GetCurrentResourceName()]:sendAppEvent("RemoveContractInfo", {IdToRemove = data.props.id})
  TriggerServerEvent("boosting:CancelContract", data)
  hacks = {
    number1 = false,
    number2 = false,
    number3 = false,
    number4 = false,
    number5 = false,
    number6 = false,
    number7 = false,
    number8 = false,
    number9 = false,
    number10 = false,
  }
  cb({})
end)

RegisterNUICallback("ps-boosting:cancelContract", function(data, cb) 
  exports[GetCurrentResourceName()]:sendAppEvent("RemoveContractInfo", {IdToRemove = data.props.id})
  exports[GetCurrentResourceName()]:sendAppEvent('SetDisableButtons', {enableButtons = false})
  TriggerServerEvent("boosting:CancelContract", data)
  if data.IsInProgress then
    hacks = {
      number1 = false,
      number2 = false,
      number3 = false,
      number4 = false,
      number5 = false,
      number6 = false,
      number7 = false,
      number8 = false,
      number9 = false,
      number10 = false,
    }
    DeleteBlip()
    DeleteEntity(VehicleStoled)
    IdToRemove = nil
    placa = nil
    VehicleStoled = nil
    isVin = false
    AlredyContract = false
    RemoveBlip(dropZoneblip or nil)
    TriggerServerEvent("boosting:IsInContract", false)
    cb({})
  else
    cb({})
  end
end)

RegisterNUICallback("ps-boosting:test", function(data, cb) 
  TriggerServerEvent("boosting:test", data)
  cb({})
end)

RegisterNUICallback("ps-boosting:JoinQueue", function(data, cb) 
  IsInQueue = data.queue
  cb({})
end)

RegisterNUICallback("ps-boosting:BennysItem", function(data, cb) 
  if pendingDelivery == false then
    if data.ToPay <= gne then
      DropItemZone(data.CartItems, data.ToPay)
      exports[GetCurrentResourceName()]:sendAppEvent('BoostingNotification', {notify = {msg = Config.Locale.PurchasedItems..data.ToPay..' GNE', time = getClock() , app = 'Bennys Parts', img = 'https://imgur.com/kGxkXTk.png'}})
      exports[GetCurrentResourceName()]:sendAppEvent('BoostingNotification', {notify = {msg = Config.Locale.PendingItems, time = getClock() , app = 'Shop Delivery', img = 'https://i.imgur.com/vUJDqz7.png'}})
      cb({Continue = true})
    else
      cb({Continue = false})
    end
  else
    cb({Continue = false})
    exports[GetCurrentResourceName()]:sendAppEvent('BoostingNotification', {notify = {msg = Config.Locale.FinishItems, time = getClock() , app = 'Shop Delivery', img = 'https://i.imgur.com/vUJDqz7.png'}})
  end
end)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------DEBUG----------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


if Config.Debug then

  RegisterCommand(Config.AddContractCommand, function()
    TriggerServerEvent("boosting:CreateContract", getClock())
  end)

  RegisterCommand(Config.LockpickCommand, function() 
    local Player = PlayerPedId()
    local pos = GetEntityCoords(Player)
    local entityWorld = GetOffsetFromEntityInWorldCoords(Player, 0.0, 20.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, Player, 0)
    local a, b, c, d, vehicleHandle = GetRaycastResult(rayHandle)
    if vehicleHandle ~= nil and vehicleHandle ~= 0 then
      RequestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
      while not HasAnimDictLoaded('anim@amb@clubhouse@tutorial@bkr_tut_ig3@') do
        Citizen.Wait(0)
      end
      TaskPlayAnim(Player, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@' , 'machinic_loop_mechandplayer' ,8.0, -8.0, -1, 1, 0, false, false, false )
      if CustomMinigame() == true then
        ClearPedTasksImmediately(Player)
        --SetVehicleDoorsLocked(vehicleHandle, 0)
        vehicleUnlock()
        CustomNotification(Config.Locale.DoorOpen)
        -- print(VehicleStoled, vehicleHandle)
        if VehicleStoled == vehicleHandle then
          if isVin then
            MakeDropZoneThreadVin(true)
            DeleteBlip()
            isPoliceBlip = true
            -- CreateCopBlip()
          else
            isPoliceBlip = true
            -- CreateCopBlip()
            DeleteBlip()
            MakeDropZoneThread(true)
          end
        end
      else
        ClearPedTasksImmediately(Player)
        CustomNotification(Config.Locale.DoorFail)
      end
    end
  end)
  
  RegisterCommand(Config.AntiPoliceCommand, function()
    if isPoliceBlip  then
      local var = CustomMinigameHack()
      if var == true then
        isPoliceBlip = false
        RemoveCopBlip()
        CustomNotification(Config.Locale.HackSuccess)
        TriggerServerEvent("boosting:SendRemovePoliceBlip", VehicleStoled)
      else
        isPoliceBlip = true
        -- CreateCopBlip()
        CustomNotification(Config.Locale.HackFail)
      end
    end
  end)

  RegisterCommand(Config.ChangePlateCommand, function()
    if CanChangePlate then
      local Player = PlayerPedId()
      local pos = GetEntityCoords(Player)
      local entityWorld = GetOffsetFromEntityInWorldCoords(Player, 0.0, 20.0, 0.0)
      local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, Player, 0)
      local a, b, c, d, vehicleHandle = GetRaycastResult(rayHandle)
      if vehicleHandle ~= nil and vehicleHandle ~= 0 then
        RequestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
        while not HasAnimDictLoaded('anim@amb@clubhouse@tutorial@bkr_tut_ig3@') do
          Citizen.Wait(0)
        end
        TaskPlayAnim(Player, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@' , 'machinic_loop_mechandplayer' ,8.0, -8.0, -1, 1, 0, false, false, false )
        Citizen.Wait(3000)
        SetVehicleNumberPlateText(vehicleHandle, GeneratePlate())
        AlredyVinScratch = true
        ClearPedTasksImmediately(Player)
      end
    end
  end)

  RegisterCommand(Config.HackerManCommand, function()
    TriggerEvent("boosting:changeVehicleState")
  end)  
end
