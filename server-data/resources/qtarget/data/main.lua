---------------------------------------------------------------------------------- PDM
Citizen.CreateThread(function()
  exports.qtarget:AddBoxZone("pdmCatalog1", vector3(-40.26, -1094.47, 27.27), 0.4, 0.85, {
    name="pdmCatalog1",
    heading=295,
    -- debugPoly=true,
    minZ=27.22,
    maxZ=27.82
    }, {
      options = {
        {
          event = "dealership:open",
          icon = "far fa-clipboard",
          label = "Browse Catalog"
        },
      },
      distance = 2.0
  })
  exports.qtarget:AddBoxZone("pdmCatalog2", vector3(-38.96, -1100.29, 27.27), 0.4, 0.85, {
    name="pdmCatalog2",
    heading=293,
    --debugPoly=true,
    minZ=27.17,
    maxZ=27.77
    }, {
      options = {
        {
          event = "dealership:open",
          icon = "far fa-clipboard",
          label = "Browse Catalog"
        },
      },
      distance = 2.0
  })
  exports.qtarget:AddBoxZone("pdmCatalog3", vector3(-46.95, -1095.38, 27.27), 0.4, 0.85, {
    name="pdmCatalog3",
    heading=11,
    --debugPoly=true,
    minZ=27.17,
    maxZ=27.77
    }, {
      options = {
        {
          event = "dealership:open",
          icon = "far fa-clipboard",
          label = "Browse Catalog"
        },
      },
      distance = 2.0
  })
  exports.qtarget:AddBoxZone("pdmCatalog4", vector3(-51.78, -1095.1, 27.27), 0.4, 0.85, {
    name="pdmCatalog4",
    heading=300,
    --debugPoly=true,
    minZ=27.17,
    maxZ=27.77
    }, {
      options = {
        {
          event = "dealership:open",
          icon = "far fa-clipboard",
          label = "Browse Catalog"
        },
      },
      distance = 2.0
  })
  exports.qtarget:AddBoxZone("pdmCatalog5", vector3(-51.08, -1086.91, 27.3), 0.4, 0.85, {
    name="pdmCatalog5",
    heading=338,
    --debugPoly=true,
    minZ=27.1,
    maxZ=27.9
    }, {
      options = {
        {
          event = "dealership:open",
          icon = "far fa-clipboard",
          label = "Browse Catalog"
        },
      },
      distance = 2.0
  })
end)
---------------------------------------------------------------------------------- ATM
local atms = {
  -1126237515,
  506770882,
  -1364697528,
  -870868698,
}

Citizen.CreateThread(function()
  exports.qtarget:AddTargetModel(atms, {
      options = {{
          event = "openATM",
          icon = "fas fa-money-bill",
          label = "ATM"
      }},
      distance = 2.0
  })
end)

---------------------------------------------------------------------------------- Burgershot Trays

Citizen.CreateThread(function()
  -- Right Tray
      exports.qtarget:AddBoxZone("BurgershotTray1", vector3(-1195.32, -892.33, 14.02), 0.50, 0.35, {
          name = "BurgershotTray1",
          heading = "35.0",
          -- debugPoly = true,
          minZ = 14.0,
          maxZ = 14.1,
      }, {
          options = {{
              event = 'openBSTray1',
              icon = 'fas fa-hamburger',
              label = "Open Tray"
          }},
          distance = 2.0
      })

  -- Left Tray
      exports.qtarget:AddBoxZone("BurgershotTray2", vector3(-1194.03, -894.24, -894.24), 0.50, 0.35, {
        name = "BurgershotTray2",
        heading = "35.0",
        -- debugPoly = true,
        minZ = 14.0,
        maxZ = 14.1,
    }, {
        options = {{
            event = 'openBSTray2',
            icon = 'fas fa-hamburger',
            label = "Open Tray"
        }},
        distance = 2.0
    })
  end)


---------------------------------------------------------------------------------- Casino Elevator
-- Lobby
Citizen.CreateThread(function()
    exports.qtarget:AddBoxZone("casinoEl", vector3(947.72, 49.87, 75.12), 0.4, 0.4, {
      name="casinoEl",
      heading=11,
      -- debugPoly=true,
      minZ=74.92,
      maxZ=75.92
    }, {
      options = {{
          event = 'casinoElevator',
          icon = 'fa-solid fa-elevator',
          label = "Elevator",
      }},
      distance = 2.0
  })
end)

-- Rooftop
Citizen.CreateThread(function()
    exports.qtarget:AddBoxZone("casinoElRoof", vector3(964.48, 57.5, 112.55), 0.4, 0.2, {
      name="casinoElRoof",
      heading=330,
      --debugPoly=true,
      minZ=112.2,
      maxZ=113.0
    }, {
      options = {{
          event = 'casinoElevatorRoof',
          icon = 'fa-solid fa-elevator',
          label = "Call Elevator",
      }},
      distance = 2.0
  })
end)

---------------------------------------------------------------------------------- Pillbox Elevator
-- Upper Lobby
Citizen.CreateThread(function()
    exports.qtarget:AddBoxZone("casinoElRoof", vector3(330.4, -602.86, 43.28), 0.4, 1, {
      name="pollboxUpper",
      heading=340,
      --debugPoly=true,
      minZ=43.28,
      maxZ=43.98
    }, {
      options = {{
          event = 'pillboxElevatorUpper',
          icon = 'fa-solid fa-elevator',
          label = "Call Elevator",
      }},
      distance = 2.0
  })
end)

-- Lower Lobby Right
Citizen.CreateThread(function()
    exports.qtarget:AddBoxZone("pollboxLower", vector3(346.12, -581.0, 28.8), 0.4, 0.2, {
      name="pollboxLower",
      heading=340,
      --debugPoly=true,
      minZ=28.8,
      maxZ=29.6
    }, {
      options = {{
          event = 'pillboxElevatorLower',
          icon = 'fa-solid fa-elevator',
          label = "Elevator",
      }},
      distance = 2.0
  })
end)

-- Lower Lobby Left
Citizen.CreateThread(function()
    exports.qtarget:AddBoxZone("pollboxLowerLeft", vector3(344.31, -584.54, 28.8), 0.4, 1, {
      name="pollboxLowerLeft",
      heading=340,
      --debugPoly=true,
      minZ=28.8,
      maxZ=29.5
    }, {
      options = {{
          event = 'pillboxElevatorLower',
          icon = 'fa-solid fa-elevator',
          label = "Elevator",
      }},
      distance = 2.0
  })
end)

---------------------------------------------------------------------------------- Events
---------------------------------------- Elevator
RegisterNetEvent("casinoElevator", function()
  TriggerEvent("nh-context:createMenu", {
      {
          header = "Rooftop",
          context = "Rooftop pleasures",
          event = "useElevator",
          args = {964.64, 58.84, 112.55, 57.95}
      },
      {
          header = "Lobby",
          context = "Gamba time",
          event = "useElevator",
          disabled = true,
          args = {947.86, 50.70, 75.11, 283.68}
      },
  })
end)

RegisterNetEvent("casinoElevatorRoof", function()
  TriggerEvent("nh-context:createMenu", {
      {
          header = "Rooftop",
          context = "Rooftop pleasures",
          event = "useElevator",
          disabled = true,
          args = {964.64, 58.84, 112.55, 57.95}
      },
      {
          header = "Lobby",
          context = "Gamba time",
          event = "useElevator",
          args = {947.86, 50.70, 75.11, 283.68}
      },
  })
end)

RegisterNetEvent("pillboxElevatorLower", function()
  TriggerEvent("nh-context:createMenu", {
      {
          header = "Upper Pillbox",
          context = "Elgin Ave Entrance",
          event = "useElevator",
          args = {330.27, -601.10, 43.28, 68.33}
      },
      {
          header = "Lower Pillbox",
          context = "Strawberry Ave Entrance",
          event = "useElevator",
          disabled = true,
          args = {345.74, -582.77, 28.79, 245.87}
      },
  })
end)

RegisterNetEvent("pillboxElevatorUpper", function()
  TriggerEvent("nh-context:createMenu", {
      {
          header = "Upper Pillbox",
          context = "Elgin Ave Entrance",
          event = "useElevator",
          disabled = true,
          args = {330.27, -601.10, 43.28, 68.33}
      },
      {
          header = "Lower Pillbox",
          context = "Strawberry Ave Entrance",
          event = "useElevator",
          args = {345.74, -582.77, 28.79, 245.87}
      },
  })
end)

RegisterNetEvent('useElevator')
AddEventHandler('useElevator', function(x, y, z, heading)
    exports.ox_inventory:Progress({
      duration = 10000,
      label = 'Calling Elevator',
      useWhileDead = false,
      canCancel = true,
      disable = {
          move = false,
          car = true,
          combat = true,
          mouse = false
      },
    }, function(cancel)
        if not cancel then
          DoScreenFadeOut(500)
          Wait(500)
          NetworkFadeOutEntity(PlayerPedId(), true, true)
          Wait(300)
          SetPedCoordsKeepVehicle(PlayerPedId(), x, y, z)
          SetEntityHeading(PlayerPedId(), heading)
          ClearPedTasksImmediately(PlayerPedId())
          SetGameplayCamRelativeHeading(0.0)
          NetworkFadeInEntity(PlayerPedId(), true)
          Wait(500)
          DoScreenFadeIn(500)
        end
    end)
end)

---------------------------------------- Elevator END

RegisterNetEvent('openBSTray1')
AddEventHandler('openBSTray1', function()
    TriggerEvent('ox_inventory:openInventory', 'stash', 'burgerShotTray1')
end)

RegisterNetEvent('openBSTray2')
AddEventHandler('openBSTray2', function()
    TriggerEvent('ox_inventory:openInventory', 'stash', 'burgerShotTray2')
end)
