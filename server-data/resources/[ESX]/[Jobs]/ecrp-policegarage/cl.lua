ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

local playerPed = PlayerPedId()

local spawner = {
  -- MRPD
  {
    x = 445.77926635742, y = -986.0849609375, z = 25.21488571167, h = 89.921913146973
  }, 
  {
    x = 445.75634765625, y = -988.81298828125, z = 25.214918136597, h = 91.435066223145
  },
  {
    x = 445.84930419922, y = -991.44573974609, z = 25.2154712677, h = 89.520484924316
  },
  {
    x = 445.69128417969, y = -994.27526855469, z = 25.215492248535, h = 88.296989440918
  },
  {
    x = 445.87805175781, y = -996.82269287109, z = 25.215503692627, h = 90.531730651855
  },
  {
    x = 437.26571655273, y = -986.04364013672, z = 25.002786636353, h = 268.10079956055
  },
  {
    x = 437.45458984375, y = -988.85803222656, z = 25.00221824646, h = 269.11514282227
  },
  {
    x = 437.36361694336, y = -991.5361328125, z = 25.001493453979, h = 268.29406738281
  },
  {
    x = 437.36370849609, y = -994.13677978516, z = 25.002367019653, h = 270.61553955078
  },
  {
    x = 437.25180053711, y = -996.88177490234, z = 25.001153945923, h = 265.74172973633
  },
  -- PBSO
  {
    x = -469.0227355957, y = 6038.4477539063, z = 30.642526626587, h = 42.198711395264
  },
  {
    x = -472.27160644531, y = 6035.4458007813, z = 30.642082214355, h = 42.370056152344
  },
  {
    x = -476.07940673828, y = 6031.8671875, z = 30.642375946045, h = 47.073719024658
  },
  {
    x = -479.38180541992, y = 6028.3823242188, z = 30.642276763916, h = 44.768142700195
  },
  {
    x = -483.04626464844, y = 6024.6669921875, z = 30.6418800354, h = 44.687259674072
  },
  -- PBSO Front
  {
    x = -432.5703125, y = 6028.0659179688, z = 30.642503738403, h = 227.94903564453
  },
  {
    x = -434.92993164063, y = 6025.7939453125, z = 30.642524719238, h = 229.28349304199
  },
  {
    x = -437.45520019531, y = 6023.3759765625, z = 30.643001556396, h = 228.85317993164
  },
  -- Sandy Sheriff Office
  {
    x = 1847.2551269531, y = 3672.3464355469, z = 33.009578704834, h = 29.539262771606
  },
  {
    x = 1850.3159179688, y = 3674.3615722656, z = 33.06819152832, h = 31.949659347534
  },
  {
    x = 1853.7175292969, y = 3676.0043945313, z = 33.05313873291, h = 30.272062301636
  }
}

local parking1MRPD = BoxZone:Create(vector3(445.41, -991.57, 25.7), 13.6, 4.8, {
    name = "parking1MRPD",
    heading = 0,
    -- debugPoly=true,
    minZ = 24.7,
    maxZ = 28.3
})

local parking2MRPD = BoxZone:Create(vector3(437.46, -991.57, 25.7), 13.6, 4.2, {
  name="parking2MRPD",
  heading=0,
  --debugPoly=true,
  minZ=24.7,
  maxZ=28.7
})

local parkingPBSO = BoxZone:Create(vector3(-475.68, 6032.22, 31.34), 5.8, 24.2, {
  name="parkingPBSO",
  heading=45,
  --debugPoly=true,
  minZ=30.34,
  maxZ=34.34
})

local parking2PBSO = BoxZone:Create(vector3(-434.66, 6025.36, 31.34), 10.2, 5.4, {
  name="parking2PBSO",
  heading=315,
  --debugPoly=true,
  minZ=30.34,
  maxZ=34.34
})

local parkingSSO = BoxZone:Create(vector3(1850.27, 3674.65, 33.78), 4.8, 11.4, {
  name="parkingSSO",
  heading=30,
  --debugPoly=true,
  minZ=32.78,
  maxZ=36.78
})

local policeSpawn = ComboZone:Create({parking1MRPD, parking2MRPD, parkingPBSO, parking2PBSO, parkingSSO}, {
    -- debugPoly = true
})

local insideGarage = false
policeSpawn:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if isPointInside then
        TriggerEvent('cd_drawtextui:ShowUI', 'show', '<B>Parking</B>', 'blue', 'blue')
        insideGarage = true
    else
        TriggerEvent('cd_drawtextui:HideUI')
        insideGarage = false
    end
end)

RegisterNetEvent("nh-context:policeGarage", function()
    TriggerEvent("nh-context:createMenu", 
    {
      {
        header = "Spawn Vehicle",
        context = "Spawn a PD vehicle",
        event = "nh-context:policeCars",
        subMenu = true,
      }, 
      {
          header = "Store Vehicle",
          context = "Store vehicle back in share pool",
          event = "policeCars:delete"
      }
    }
  )
end)

RegisterNetEvent('nh-context:policeCars', function()
    TriggerEvent('nh-context:createMenu', {{
        header = "Select a Vehicle"
    }, {
        header = "Crown Victoria",
        event = "policeCars:spawn",
        image = "https://i.imgur.com/ltmXe7I.jpeg",
        args = {"NPOLVIC"}
    }, {
        header = "Charger",
        event = "policeCars:spawn",
        image = "https://i.imgur.com/nh3rily.jpeg",
        args = {"NPOLCHAR"}
    }, {
        header = "Corvette",
        event = "policeCars:spawn",
        image = "https://i.imgur.com/Kyijdot.jpeg",
        args = {"NPOLVETTE"}
    }, {
        header = "Challenger",
        event = "policeCars:spawn",
        image = "https://i.imgur.com/BGCBMJC.jpeg",
        args = {"NPOLCHAL"}
    }, {
        header = "Mustang",
        event = "policeCars:spawn",
        image = "https://i.imgur.com/rAkeHHM.jpeg",
        args = {"NPOLSTANG"}
    }, {
        header = "Explorer",
        event = "policeCars:spawn",
        image = "https://i.imgur.com/VAr7Ce8.jpeg",
        args = {"NPOLEXP"}
    },
  })
end)

-- Spawn police vehicles
RegisterNetEvent('policeCars:spawn')
AddEventHandler('policeCars:spawn', function(model)
    for k in pairs(spawner) do
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, spawner[k].x, spawner[k].y, spawner[k].z)

        if dist <= 2.0 then
            ESX.Game.SpawnVehicle(model, vector3(spawner[k].x, spawner[k].y, spawner[k].z), spawner[k].h, function(vehicle)
                local plate = GetVehicleNumberPlateText(vehicle)
                exports["onyxLocksystem"]:givePlayerKeys(plate)
                TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                SetVehicleDirtLevel(vehicle, 0.0)
                -- exports['LegacyFuel']:SetFuel(vehicle, 100)
            end)
            return
        end
    end
end)

-- Store vehicle if police vehicle
RegisterNetEvent('policeCars:delete')
AddEventHandler('policeCars:delete', function()
  local vehicle = GetVehiclePedIsIn(playerPed, false)
    if IsPedInVehicle(playerPed, vehicle) then
      ExecuteCommand('dv')
      exports['mythic_notify']:DoHudText('success', 'Stored vehicle')
      return
    else 
      exports['mythic_notify']:DoHudText('error', 'Cannot store vehicle')
      return
    end
end)

function InGarage()
    if insideGarage then
        return true
    elseif not insideGarage then
        return false
    end
end
