ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local InCarWash = false
local veh = GetVehiclePedIsIn(PlayerPedId(), false)
local dirtLevel = GetVehicleDirtLevel(veh)
local displayPrice = math.floor(dirtLevel * 5)

local innocence = BoxZone:Create(vector3(20.86, -1392.0, 29.33), 24.2, 6.4, {
  name="innocence",
  heading=90,
  --debugPoly=true,
  minZ=28.33,
  maxZ=32.33
})

local vespucci = BoxZone:Create(vector3(-699.96, -933.24, 19.01), 11.8, 5.2, {
  name="vespucci",
  heading=0,
  --debugPoly=true,
  minZ=18.01,
  maxZ=22.01
})

local carWash = ComboZone:Create({innocence, vespucci}, {
  -- debugPoly = true
})

carWash:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
  local inVeh = IsPedInVehicle(PlayerPedId(), veh, false)
  local driver = GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId()
  if isPointInside then
    if inVeh and driver then
      TriggerEvent('cd_drawtextui:ShowUI', 'show', '<B>[E] Car Wash $' .. displayPrice ..'</B>', 'blue', 'blue')
      InCarWash = true
    end
  else
    TriggerEvent('cd_drawtextui:HideUI')
    InCarWash = false
  end
end)

Citizen.CreateThread(function ()
  local player = GetPlayerServerId(PlayerId())
  while true do
    Citizen.Wait(0)
    if InCarWash then
      if IsControlJustReleased(0, 38) then
        TriggerEvent('cd_drawtextui:HideUI')
        TriggerServerEvent('ecrp:checkmoney', player, displayPrice)
      end
    end
  end
end)

-- Registering net events
RegisterNetEvent('ecrp:cleancar')
AddEventHandler('ecrp:cleancar', function()
  print('here')
    local time = math.floor(dirtLevel * 2000)

    if dirtLevel >= 1 then
      exports.ox_inventory:Progress({
        duration = time,
        label = 'Washing Car',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true,
            mouse = false
        },
      }, function(cancel)
          if not cancel then
            SetVehicleDirtLevel(vehicle, 0.0)
            exports['mythic_notify']:DoHudText('success', 'Car has been cleaned $' .. displayPrice)
          end
      end)
    else
      exports['mythic_notify']:DoHudText('error', 'Car is already clean')
    end
end)
