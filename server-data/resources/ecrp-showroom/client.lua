Citizen.CreateThread(function ()

  local hash = Config.Vehicles[1]
  local vehicle = 0

  if not IsModelInCdimage(hash) then return end
  
  RequestModel(hash)
  while not HasModelLoaded(hash) do
    Citizen.Wait(10)
  end

  while true do
    Citizen.Wait(100)
    for k, v in pairs(Config.Spawn1) do
      local ped = GetEntityCoords(PlayerPedId())
      local dist = #(v.vehSpawn - ped)
      
      if dist < 51 and vehicleSpawned == false then
        vehicle = CreateVehicle(hash, v.vehSpawn, v.h, true, false)
        SetEntityAsMissionEntity(vehicle, true, true)
        SetVehicleDirtLevel(vehicle, 0.0)
        FreezeEntityPosition(vehicle, true)
        SetVehicleDoorsLocked(vehicle, 2)
        vehicleSpawned = true
      end
      if dist >= 51 then
        if DoesEntityExist(vehicle) then
          SetEntityAsMissionEntity(vehicle, true, true)
          SetEntityAlpha(vehicle, 1, false)
          DeleteVehicle(vehicle)
          vehicle = 0;
        end
        vehicleSpawned = false
      end
    end
  end
end)

Citizen.CreateThread(function ()
  local hash = Config.Vehicles[2]
  local vehicle2 = 0

  if not IsModelInCdimage(hash) then return end
  
  RequestModel(hash)
  while not HasModelLoaded(hash) do
    Citizen.Wait(10)
  end

  while true do
    Citizen.Wait(100)
    for k, v in pairs(Config.Spawn2) do
      local ped = GetEntityCoords(PlayerPedId())
      local dist = #(v.vehSpawn - ped)
      
      if dist < 51 and vehicle2Spawned == false then
        vehicle2 = CreateVehicle(hash, v.vehSpawn, v.h, true, false)
        SetEntityAsMissionEntity(vehicle2, true, true)
        SetVehicleDirtLevel(vehicle2, 0.0)
        FreezeEntityPosition(vehicle2, true)
        SetVehicleDoorsLocked(vehicle2, 2)
        vehicle2Spawned = true
      end
      if dist >= 51 then
        if DoesEntityExist(vehicle2) then
          SetEntityAsMissionEntity(vehicle2, true, true)
          SetEntityAlpha(vehicle2, 1, false)
          DeleteVehicle(vehicle2)
          vehicle2 = 0;
        end
        vehicle2Spawned = false
      end
    end
  end
end)

Citizen.CreateThread(function ()
  local hash = Config.Vehicles[3]
  local vehicle3 = 0

  if not IsModelInCdimage(hash) then return end
  
  RequestModel(hash)
  while not HasModelLoaded(hash) do
    Citizen.Wait(10)
  end

  while true do
    Citizen.Wait(100)
    for k, v in pairs(Config.Spawn3) do
      local ped = GetEntityCoords(PlayerPedId())
      local dist = #(v.vehSpawn - ped)
      
      if dist < 51 and vehicle3Spawned == false then
        vehicle3 = CreateVehicle(hash, v.vehSpawn, v.h, true, false)
        SetEntityAsMissionEntity(vehicle3, true, true)
        SetVehicleDirtLevel(vehicle3, 0.0)
        FreezeEntityPosition(vehicle3, true)
        SetVehicleDoorsLocked(vehicle3, 2)
        vehicle3Spawned = true
      end
      if dist >= 51 then
        if DoesEntityExist(vehicle3) then
          SetEntityAsMissionEntity(vehicle3, true, true)
          SetEntityAlpha(vehicle3, 1, false)
          DeleteVehicle(vehicle3)
          vehicle3 = 0;
        end
        vehicle3Spawned = false
      end
    end
  end
end)

Citizen.CreateThread(function ()
  local hash = Config.Vehicles[4]
  local vehicle4 = 0

  if not IsModelInCdimage(hash) then return end
  
  RequestModel(hash)
  while not HasModelLoaded(hash) do
    Citizen.Wait(10)
  end

  while true do
    Citizen.Wait(100)
    for k, v in pairs(Config.Spawn4) do
      local ped = GetEntityCoords(PlayerPedId())
      local dist = #(v.vehSpawn - ped)
      
      if dist < 51 and vehicle4Spawned == false then
        vehicle4 = CreateVehicle(hash, v.vehSpawn, v.h, true, false)
        SetEntityAsMissionEntity(vehicle4, true, true)
        SetVehicleDirtLevel(vehicle4, 0.0)
        FreezeEntityPosition(vehicle4, true)
        SetVehicleDoorsLocked(vehicle4, 2)
        vehicle4Spawned = true
      end
      if dist >= 51 then
        if DoesEntityExist(vehicle4) then
          SetEntityAsMissionEntity(vehicle4, true, true)
          SetEntityAlpha(vehicle4, 1, false)
          DeleteVehicle(vehicle4)
          vehicle4 = 0;
        end
        vehicle4Spawned = false
      end
    end
  end
end)

Citizen.CreateThread(function ()
  local hash = Config.Vehicles[5]
  local vehicle5 = 0

  if not IsModelInCdimage(hash) then return end
  
  RequestModel(hash)
  while not HasModelLoaded(hash) do
    Citizen.Wait(10)
  end

  while true do
    Citizen.Wait(100)
    for k, v in pairs(Config.Spawn5) do
      local ped = GetEntityCoords(PlayerPedId())
      local dist = #(v.vehSpawn - ped)
      
      if dist < 51 and vehicle5Spawned == false then
        vehicle5 = CreateVehicle(hash, v.vehSpawn, v.h, true, false)
        SetEntityAsMissionEntity(vehicle5, true, true)
        SetVehicleDirtLevel(vehicle5, 0.0)
        FreezeEntityPosition(vehicle5, true)
        SetVehicleDoorsLocked(vehicle5, 2)
        vehicle5Spawned = true
      end
      if dist >= 51 then
        if DoesEntityExist(vehicle5) then
          SetEntityAsMissionEntity(vehicle5, true, true)
          SetEntityAlpha(vehicle5, 1, false)
          DeleteVehicle(vehicle5)
          vehicle5 = 0;
        end
        vehicle5Spawned = false
      end
    end
  end
end)