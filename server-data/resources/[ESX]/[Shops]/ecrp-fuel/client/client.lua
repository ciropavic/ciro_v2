ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local blips = {
	{x = 49.4187, y = 2778.793, z = 58.043},
	{x = 263.894, y = 2606.463, z = 44.983},
	{x = 1207.260, y = 2660.175, z = 37.899},
	{x = 2539.685, y = 2594.192, z = 37.944},
	{x = 2679.858, y = 3263.946, z = 55.240},
	{x = 2005.055, y = 3773.887, z = 32.403},
	{x = 1687.156, y = 4929.392, z = 42.078},
	{x = 1701.314, y = 6416.028, z = 32.763},
	{x = 179.857, y = 6602.839, z = 31.868},
	{x = -94.4619, y = 6419.594, z = 31.489},
	{x = -2554.996, y = 2334.40, z = 33.078},
	{x = -1800.375, y = 803.661, z = 138.651},
	{x = -1437.622, y = -276.747, z = 46.207},
	{x = -2096.243, y = -320.286, z = 13.168},
	{x = -724.619, y = -935.1631, z = 19.213},
	{x = -526.019, y = -1211.003, z = 18.184},
	{x = -70.2148, y = -1761.792, z = 29.534},
	{x = 265.648, y = -1261.309, z = 29.292},
	{x = 819.653, y = -1028.846, z = 26.403},
	{x = 1208.951, y = -1402.567,z = 35.224},
	{x = 1181.381, y = -330.847, z = 69.316},
	{x = 620.843, y = 269.100, z = 103.089},
	{x = 2581.321, y = 362.039, z = 108.468},
	{x = 176.631, y = -1562.025, z = 29.263},
	{x = -319.292, y = -1471.715, z = 30.549},
	{x = 1784.324, y = 3330.55, z = 41.253},
}

local ped = PlayerPedId(-1)

local InGasStation = false
local inBlacklisted = false
local fuelSynced = false

	local CaptialBul = BoxZone:Create(vector3(265.0286, -1260.422, 29.27991), 28.0, 22.0, {
		name="CaptialBul",
		heading=90,
		minz=28.2,
		maxz=33.2,
		-- debugPoly=true,
	})

	local GroveSt = BoxZone:Create(vector3(-70.589, -1761.218, 29.65051), 28.0, 22.0, {
		name="GroveSt",
		heading=70,
		minz=28.2,
		maxz=33.2,
		debugPoly=false,
	})

	local R68W = BoxZone:Create(vector3(49.5033, 2778.818, 58.04248), 15.0, 15.0, {
		name="R68W",
		heading=50,
		minz=57.2,
		maxz=61.2,
		debugPoly=false,
	})

	local R68 = BoxZone:Create(vector3(263.894, 2606.463, 44.983), 10.0, 10.0, {
		name="R68",
		heading=280,
		minz=43.2,
		maxz=47.2,
		debugPoly=false,
	})

	local R682 = BoxZone:Create(vector3(1039.958, 2671.134, 39.550), 15.0, 15.0, {
		name="R682",
		heading=0,
		minz=38.2,
		maxz=43.2,
		debugPoly=false,
	})

	local R681 = BoxZone:Create(vector3(1207.260, 2660.175, 37.899), 10.0, 10.0, {
		name="R681",
		heading=40,
		minz=36.2,
		maxz=41.2,
		debugPoly=false,
	})

	local WindFarm = BoxZone:Create(vector3(2536.259, 2593.622, 37.94067), 10.0, 10.0, {
		name="WindFarm",
		heading=20,
		minz=36.2,
		maxz=41.2,
		debugPoly=false,
	})

	local UTool = BoxZone:Create(vector3(2679.858, 3263.946, 55.240), 15.0, 15.0, {
		name="UTool",
		heading=150,
		minz=54.2,
		maxz=60.2,
		debugPoly=false,
	})

	local Sandy = BoxZone:Create(vector3(2005.055, 3773.887, 32.403), 15.0, 15.0, {
		name="Sandy",
		heading=300,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local Grapeseed = BoxZone:Create(vector3(1687.156, 4929.392, 42.078), 15.0, 15.0, {
		name="Grapeseed",
		heading=320,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local PltHwy = BoxZone:Create(vector3(1701.314, 6416.028, 32.763), 15.0, 15.0, {
		name="PltHwy",
		heading=330,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local Plt = BoxZone:Create(vector3(179.857, 6602.839, 31.868), 25.0, 25.0, {
		name="Plt",
		heading=180,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local Plt2 = BoxZone:Create(vector3(-94.4619, 6419.594, 31.489), 15.0, 15.0, {
		name="Plt2",
		heading=310,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local MilBase = BoxZone:Create(vector3(-2554.996, 2334.40, 33.078), 25.0, 25.0, {
		name="MilBase",
		heading=270,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local NorthRock = BoxZone:Create(vector3(-1800.375, 803.661, 138.651), 25.0, 25.0, {
		name="NorthRock",
		heading=220,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local SouthRock = BoxZone:Create(vector3(-1437.622, -276.747, 46.207), 25.0, 25.0, {
		name="SouthRock",
		heading=220,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local DelPerro = BoxZone:Create(vector3(-2096.243, -320.286, 13.168), 25.0, 25.0, {
		name="DelPerro",
		heading=0,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local LilSeoul = BoxZone:Create(vector3(-724.619, -935.1631, 19.213), 28.0, 28.0, {
		name="LilSeoul",
		heading=0,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local Calais = BoxZone:Create(vector3(-526.019, -1211.003, 18.184), 25.0, 25.0, {
		name="Calais",
		heading=70,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local Popular = BoxZone:Create(vector3(819.653, -1028.846, 26.403), 25.0, 25.0, {
		name="Popular",
		heading=0,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local CapBlv = BoxZone:Create(vector3(1208.951, -1402.567,35.224), 20.0, 20.0, {
		name="CapBlv",
		heading=130,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local MirrorPk = BoxZone:Create(vector3(1181.381, -330.847, 69.316), 25.0, 25.0, {
		name="MirrorPk",
		heading=100,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local Clinton = BoxZone:Create(vector3(620.843, 269.100, 103.089), 28.0, 28.0, {
		name="Clinton",
		heading=0,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local Palomino = BoxZone:Create(vector3(2581.321, 362.039, 108.468), 25.0, 25.0, {
		name="Palomino",
		heading=0,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local Davis = BoxZone:Create(vector3(176.631, -1562.025, 29.263), 20.0, 20.0, {
		name="Davis",
		heading=310,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local Alta = BoxZone:Create(vector3(-319.292, -1471.715, 30.549), 25.0, 25.0, {
		name="Alta",
		heading=30,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})

	local Flywheel = BoxZone:Create(vector3(1785.771, 3330.58, 41.37805), 10.0, 10.0, {
		name="Flywheel",
		heading=30,
		minz=31.2,
		maxz=36.2,
		debugPoly=false,
	})
local gasStations = ComboZone:Create({CaptialBul, GroveSt, R68W, R68, R682, R681, WindFarm, UTool, Sandy, Grapeseed, PltHwy, Plt, Plt2, MilBase, NorthRock, SouthRock, DelPerro, LilSeoul, Calais, Popular, CapBlv, MirrorPk, Clinton, Palomino, Davis, Alta, Flywheel}, {
  -- debugPoly = true
})

gasStations:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if isPointInside then
        InGasStation = true
    else
        InGasStation = false
    end
end)

exports['qtarget']:AddTargetBone({"wheel_lr"}, {
    options = {
        {
            event = "fuel:startfuel",
            icon = "fas fa-gas-pump",
            label = "Fuel Vehicle",
            canInteract = function(entity)
                hasChecked = false
                if InGasStation and not hasChecked then
                    hasChecked = true
                    return true
                end
            end
        },
    },
    distance = 1.0,
})

AddEventHandler('fuel:startfuel', function(data)
	ESX.TriggerServerCallback('ecrp-fuel:checkmoney', function(hasEnough)
		if hasEnough then
			if GetIsVehicleEngineRunning(data.entity) then
				TaskTurnPedToFaceEntity(ped, data.entity, 1000)
				Citizen.Wait(1000)
        exports.ox_inventory:Progress({
          duration = 10000,
          label = 'Fueling',
          useWhileDead = false,
          canCancel = false,
          disable = {
              move = true,
              car = true,
              combat = true,
              mouse = false
          },
          anim = {
            dict = 'timetable@gardener@filling_can',
            clip = 'gar_ig_5_filling_can'
          }
        })
				Citizen.Wait(5000)
				local vehicleCoords = GetEntityCoords(data.entity)
				AddExplosion(vehicleCoords, 5, 50.0, true, false, true)
			else
				StartFuel(data.entity)
			end
		else
			exports['mythic_notify']:DoHudText('error', 'Not Enough Cash!')
		end 
	end)
end)

function StartFuel(vehicle)
  local fuel = GetVehicleFuelLevel(vehicle)
  local fuelTotal = 100 - fuel
  local fuelTime = fuelTotal * 500
  print('Fuel: ' .. fuel)
  print('Fuel Total: ' .. fuelTotal)
  print('Fuel Time: ' .. fuelTime)
  if fuel < 100.0 then
    TaskTurnPedToFaceEntity(ped, vehicle, 1000)
    Citizen.Wait(1000)
    exports.ox_inventory:Progress({
      duration = fuelTime,
      label = 'Fueling',
      useWhileDead = false,
      canCancel = false,
      disable = {
          move = true,
          car = true,
          combat = true,
          mouse = false
      },
      anim = {
          dict = 'timetable@gardener@filling_can',
          clip = 'gar_ig_5_filling_can'
      }
    })
    Citizen.Wait(fuelTime)
    SetFuel(vehicle, 100.0)
    TriggerServerEvent('ecrp-fuel:takemoney', fuelTotal)
  elseif fuel == 100.0 then
    exports['mythic_notify']:DoHudText('error', 'Fuel tank is full')
  end
end

function ManageFuelUsage(vehicle)
	if not DecorExistOn(vehicle, Config.FuelDecor) then
		SetFuel(vehicle, math.random(200, 800) / 10)
	elseif not fuelSynced then
		SetFuel(vehicle, GetFuel(vehicle))

		fuelSynced = true
	end

	if IsVehicleEngineOn(vehicle) then
		SetFuel(vehicle, GetVehicleFuelLevel(vehicle) - Config.FuelUsage[Round(GetVehicleCurrentRpm(vehicle), 1)] * (Config.Classes[GetVehicleClass(vehicle)] or 1.0) / 10)
	end
end

Citizen.CreateThread(function()
	DecorRegister(Config.FuelDecor, 1)

	for index = 1, #Config.Blacklist do
		if type(Config.Blacklist[index]) == 'string' then
			Config.Blacklist[GetHashKey(Config.Blacklist[index])] = true
		else
			Config.Blacklist[Config.Blacklist[index]] = true
		end
	end

	for index = #Config.Blacklist, 1, -1 do
		table.remove(Config.Blacklist, index)
	end

	while true do
		Citizen.Wait(1000)

		local ped = PlayerPedId()

		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsIn(ped)

			if Config.Blacklist[GetEntityModel(vehicle)] then
				inBlacklisted = true
			else
				inBlacklisted = false
			end

			if not inBlacklisted and GetPedInVehicleSeat(vehicle, -1) == ped then
				ManageFuelUsage(vehicle)
			end
		else
			if fuelSynced then
				fuelSynced = false
			end

			if inBlacklisted then
				inBlacklisted = false
			end
		end
	end
end)

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, 361)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.6)
      SetBlipColour(info.blip, 1)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString('Gas Station')
      EndTextCommandSetBlipName(info.blip)
    end
end)