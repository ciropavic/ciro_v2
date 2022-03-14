local menuperms = false
local devMode = false
local invisOn = false
local vehicles = {
  'gtam', 
  'db11', 
  'etrongt',
  'r8',
  'r8h',
  'rs5',
  'audirs6tk',
  'bdragon',
  'contss',
  'm5e60',
  'e36',
  'e46',
  'm3e46',
  'm4',
  'bolide',
  'esv',
  'exor',
  'c7',
  'demon',
  '488misha',
  'focusrs',
  'gt17',
  'f150',
  'rudiharley',
  'fk8',
  'srt8b',
  'zx10',
  'lp700',
  'aventador',
  'huracan',
  'lc500',
  'rcf',
  'granlb',
  'na6',
  '675ltsp',
  '720s',
  'senna',
  '22g63',
  'gt63',
  'gtrc',
  'c63',
  'evo9',
  'cp9a',
  'r35',
  'lwgtr',
  'gtr',
  'skyline',
  'bc',
  'por930',
  'gt3',
  'gt3rs',
  'turbos',
  'panamera',
  'subwrx',
  'sultanrsv8',
  'gt86',
  'supraiv',
  'supra20',
  'golfp',
  'r1'
}

local _menuPool = NativeUI.CreatePool()
local mainMenu = NativeUI.CreateMenu("ECRP", "ECRP Dev Menu")
_menuPool:Add(mainMenu)

function VehicleMenu(menu)
    local vehMenu = _menuPool:AddSubMenu(menu, "Vehicle Menu")
    local spawnVeh = _menuPool:AddSubMenu(vehMenu, "Vehicle Spawner")
    local addonVeh = _menuPool:AddSubMenu(spawnVeh, "Addon Vehicles")
    local spawnName = NativeUI.CreateItem("Spawn Vehicle By Name", "")
    spawnVeh:AddItem(spawnName)
    spawnVeh.OnItemSelect = function (sender, item, index)
      if item == spawnName then
        local keyboard = exports["nh-keyboard"]:KeyboardInput({
          header = "", 
          rows = {
              {
                  id = 0, 
                  txt = "Spawn Name"
              }
          }
        })
        if keyboard ~= nil then
            if keyboard[1].input == nil then return end
            TriggerEvent('ecrp:menu:spawnveh', keyboard[1].input)
        end  
      end
    end
    for i = 1, #vehicles do
      local VehName = GetDisplayNameFromVehicleModel(vehicles[i])
      local VehNameText = GetLabelText(VehName)
      local vehMenu = NativeUI.CreateItem(VehNameText, "")
      vehMenu.Activated = function (ParentMenu, SelectedItem)
        TriggerEvent('ecrp:menu:spawnveh', VehName)
      end
      addonVeh:AddItem(vehMenu)
    end
end

function PlayerMenu(menu)
  local plyMenu = _menuPool:AddSubMenu(menu, "Player Options")
  local godmode = NativeUI.CreateCheckboxItem('God Mode', devMode, '')
  local invisible = NativeUI.CreateCheckboxItem('Invisible', invisOn, '')

  plyMenu:AddItem(godmode)
  plyMenu:AddItem(invisible)
  
  plyMenu.OnCheckboxChange = function(sender, item, checked_)
    if item == godmode then
      devMode = checked_
      if devMode == false then
        TriggerEvent('cl:toggleDev', false)
      else 
        TriggerEvent('cl:toggleDev', true)
      end
    elseif item == invisible then
      invisOn = checked_
      if invisOn == false then
        SetEntityVisible(PlayerPedId(), true, 0)
      else
        SetEntityVisible(PlayerPedId(), false, 0)
      end
    end
  end
end

PlayerMenu(mainMenu)
VehicleMenu(mainMenu)
_menuPool:RefreshIndex()

-- Events

RegisterNetEvent('ecrp:menu:spawnveh')
AddEventHandler('ecrp:menu:spawnveh', function (model)
  if not IsModelInCdimage(model) then return end

  RequestModel(model)

  while not HasModelLoaded(model) do
    Citizen.Wait(10)
  end

  local ped = PlayerPedId()
  local vehicle = CreateVehicle(model, GetEntityCoords(ped), GetEntityHeading(ped), true, false)

  SetVehicleDirtLevel(vehicle, 0.0)
  SetVehicleFuelLevel(vehicle, 200.0)
  SetPedIntoVehicle(ped, vehicle, -1)
  local plate = GetVehicleNumberPlateText(vehicle)
  exports["onyxLocksystem"]:givePlayerKeys(plate)
  SetModelAsNoLongerNeeded(model)
end)

Citizen.CreateThread(function()
  local player = GetPlayerServerId(PlayerId())
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, 244) then
          TriggerServerEvent('ecrp:menu:checkperms', player)
          Citizen.Wait(75)
          if menuperms == true then
            mainMenu:Visible(not mainMenu:Visible())
          end
        end
    end
end)

RegisterNetEvent('returnIsAllowed')
AddEventHandler('returnIsAllowed', function ()
  menuperms = true
end)