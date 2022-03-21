local menuperms = false
local vehGod = false
local vehCleanOn = false
local devMode = false
local invisOn = false
local VehDirtLevelAmt = 0.0

_menuPool = NativeUI.CreatePool()

function has_hash_value (tab, val)
    for index, value in ipairs(tab) do
		if GetHashKey(value) == val then
			return true
        end
    end
    return false
end

---- Creating Menus
function LiveryMenu(menu)
    local liveryMenu = _menuPool:AddSubMenu(menu, "Vehicle Liveries", "Edit vehicle liveries", true, true, true)
    local livery_count = GetVehicleLiveryCount(vehicle)
    local livery_list = {}
    local fetched_liveries = false

    for liveryID = 1, livery_count do
        livery_list[liveryID] = liveryID
        fetched_liveries = true
    end

    local liveryItem = NativeUI.CreateListItem("Vehicle Liveries", livery_list, GetVehicleLivery(vehicle))
    liveryMenu:AddItem(liveryItem)

    liveryMenu.OnListChange = function(sender, item, index)
        if item == liveryItem then
            SetVehicleLivery(vehicle, item:IndexToItem(index))
        end
    end
end


function ExtrasMenu(menu)
    local extrasMenu = _menuPool:AddSubMenu(menu, "Vehicle Extras", "Edit vehicle extras", true, true)

    local veh_extras = {
        ['vehicleExtras'] = {}
    }
    local items = {
        ['vehicle'] = {}
    }
    local fetched_extras = false

    for extraID = 0, 20 do
        if DoesExtraExist(vehicle, extraID) then
            veh_extras.vehicleExtras[extraID] = (IsVehicleExtraTurnedOn(vehicle, extraID) == 1)
            fetched_extras = true
        end
    end

    if fetched_extras then
        for k, v in pairs(veh_extras.vehicleExtras) do
            local extraItem = NativeUI.CreateCheckboxItem('Vehicle Extras' .. k, veh_extras.vehicleExtras[k],
                "Toggle for Extra " .. k)
            extrasMenu:AddItem(extraItem)
            items.vehicle[k] = extraItem
        end

        extrasMenu.OnCheckboxChange = function(sender, item, checked)
            for k, v in pairs(items.vehicle) do
                if item == v then
                    veh_extras.vehicleExtras[k] = checked
                    if veh_extras.vehicleExtras[k] then
                        SetVehicleExtra(vehicle, k, 0)
                    else
                        SetVehicleExtra(vehicle, k, 1)
                    end
                end
            end
        end
    end
end

function PlayerMenu(menu)
  local plyMenu = _menuPool:AddSubMenu(menu, "Player Options", '', 1445, 0)
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

function VehicleMenu(menu)
  local vehMenu = _menuPool:AddSubMenu(menu, "Vehicle Menu", "", 1445, 0)
  
  VehicleSpawner(vehMenu)
  VehicleBennys(vehMenu)
end

function VehicleBennys(menu)
  local dirtLvl = {
    0.0,
    1.0,
    2.0,
    3.0,
    4.0,
    5.0,
    6.0,
    7.0,
    8.0,
    9.0,
    10.0,
    11.0,
    12.0,
    13.0,
    14.0,
    15.0,
  }
  local vehBennys = _menuPool:AddSubMenu(menu, "Vehicle Options", "", 1445, 0)
  local vehGodMode = NativeUI.CreateCheckboxItem("God Mode", vehGod, "")
  local vehKeepWash = NativeUI.CreateCheckboxItem("Keep Vehicle Clean", vehCleanOn, "")
  local vehDirtLevel = NativeUI.CreateListItem("Set Dirt Level", dirtLvl, 1)
  local vehRepair = NativeUI.CreateItem("Repair Vehicle", '')
  local vehWash = NativeUI.CreateItem("Wash Vehicle", '')
  local vehDelete = NativeUI.CreateItem("~r~Delete Vehicle", '')
  vehBennys:AddItem(vehGodMode)
  vehBennys:AddItem(vehRepair)
  vehBennys:AddItem(vehKeepWash)
  vehBennys:AddItem(vehWash)
  vehBennys:AddItem(vehDirtLevel)

  LiveryMenu(vehBennys)
	ExtrasMenu(vehBennys)
  vehBennys:AddItem(vehDelete)
  vehBennys.OnCheckboxChange = function(sender, item, checked_)
    if item == vehGodMode then
      vehGod = checked_
    elseif item == vehKeepWash then
      vehCleanOn = checked_
    end
  end
  vehBennys.OnListChange = function (sender, item, index)
    if item == vehDirtLevel then
      VehDirtLevelAmt = item:IndexToItem(index)
      SetVehicleDirtLevel(vehicle, VehDirtLevelAmt)
    end
  end
  vehBennys.OnItemSelect = function (sender, item, index)
    if item == vehRepair then
      SetVehicleFixed(vehicle)
      SetVehicleDirtLevel(vehicle, vehicleDirt)
    elseif item == vehDelete then
      DeleteEntity(vehicle)
    elseif item == vehWash then
      SetVehicleDirtLevel(vehicle, 0.0)
    end
  end
end

function VehicleSpawner(menu)
  local spawnName = NativeUI.CreateItem("Spawn Vehicle By Name", "")
  local vehSpawner = _menuPool:AddSubMenu(menu, "Vehicle Spawner", "", 1445, 0)
  local addonVeh = _menuPool:AddSubMenu(vehSpawner, "Addon", '', 1445, 0)
  local emerVeh = _menuPool:AddSubMenu(vehSpawner, "Emergency", '', 1445, 0)
  vehSpawner:AddItem(spawnName)
  vehSpawner.OnItemSelect = function (sender, item, index)
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
    local AddVehMenu = NativeUI.CreateItem(VehNameText, "")
    AddVehMenu.Activated = function (ParentMenu, SelectedItem)
      TriggerEvent('ecrp:menu:spawnveh', VehName)
    end
    addonVeh:AddItem(AddVehMenu)
  end
  for i = 1, #emergencyVehicles do
    local EmVehName = GetDisplayNameFromVehicleModel(emergencyVehicles[i])
    local EmVehNameText = GetLabelText(EmVehName)
    local EmVehMenu = NativeUI.CreateItem(EmVehNameText, "")
    EmVehMenu.Activated = function (ParentMenu, SelectedItem)
      TriggerEvent('ecrp:menu:spawnveh', EmVehName)
    end
    emerVeh:AddItem(EmVehMenu)
  end
end

function openDynamicMenu()
	_menuPool:Remove()
	if mainMenu ~= nil and mainMenu:Visible() then
		mainMenu:Visible(false)
		return
	end
	mainMenu = NativeUI.CreateMenu('ECRP', 'ECRP Dev Menu', 1445, 0) 
	-- mainMenu = NativeUI.CreateMenu('ECRP', 'ECRP Dev Menu', 1445, 0, "shopui_title_ie_modgarage","shopui_title_ie_modgarage") 
	_menuPool:Add(mainMenu)
  -- Main Menu
  PlayerMenu(mainMenu)
  VehicleMenu(mainMenu)
	
	_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled (false);
	_menuPool:MouseEdgeEnabled (false);
	_menuPool:ControlDisablingEnabled(false);
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		_menuPool:ProcessMenus()
		
		local ped = GetPlayerPed(-1)
    local player = GetPlayerServerId(PlayerId())
		vehicle = GetVehiclePedIsIn(ped, false)
    vehicleDirt = GetVehicleDirtLevel(vehicle)
		
		if IsControlJustReleased(1, 244) then
      TriggerServerEvent('ecrp:menu:checkperms', player)
      Citizen.Wait(75)
      if menuperms == true then
				collectgarbage()
				openDynamicMenu()
				mainMenu:Visible(not mainMenu:Visible())
        end
			end
    end
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(100)
      if vehGod == true then
        SetVehicleFixed(vehicle)
      end
      if vehCleanOn == true then
        SetVehicleDirtLevel(vehicle, 0.0)
      end
    end
end)


Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(0)
    vehicles = {
      'gtam', 
      'db11', 
      'a4',
      'etrongt',
      'r8',
      'r8h',
      'rs322',
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
      'charger21',
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
    emergencyVehicles = {
      'npolvic',
      'npolexp',
      'npolchar',
      'npolchal',
      'npolvette',
      'npolstang',
      'npolmm',
      'npolretinue',
      'npolblazer',
      'ucwashington',
      'ucbanshee',
      'ucrancher',
      'ucprimo',
      'uccoquette',
      'ucbuffalo',
      'ucballer',
      'uccomet',
      'bcat',
      'emsnspeedo',
      'polas350',
      'emsaw139',
    }
  end
end)

-- Events

RegisterNetEvent('ecrp:menu:spawnveh')
AddEventHandler('ecrp:menu:spawnveh', function (model)
  if not IsModelInCdimage(model) then return end

  RequestModel(model)

  while not HasModelLoaded(model) do
    Citizen.Wait(10)
  end

  local ped = PlayerPedId()
  local createVeh = CreateVehicle(model, GetEntityCoords(ped), GetEntityHeading(ped), true, false)

  SetVehicleDirtLevel(createVeh, 0.0)
  SetVehicleFuelLevel(createVeh, 200.0)
  SetEntityAsMissionEntity(createVeh)
  SetPedIntoVehicle(ped, createVeh, -1)
  local plate = GetVehicleNumberPlateText(createVeh)
  exports["onyxLocksystem"]:givePlayerKeys(plate)
  SetModelAsNoLongerNeeded(model)
end)

RegisterNetEvent('returnIsAllowed')
AddEventHandler('returnIsAllowed', function ()
  menuperms = true
end)