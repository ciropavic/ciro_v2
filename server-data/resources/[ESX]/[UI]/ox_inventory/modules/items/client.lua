local Items = items()

local function GetItem(item)
	if item then
		item = string.lower(item)
		if item:find('weapon_') then item = string.upper(item) end
		return Items[item]
	end
	return Items
end

local function Item(name, cb)
	local item = Items[name]
	if item then
		if not item.client?.export and not item.client?.event then
			item.effect = cb
		end
	end
end

local ox_inventory = exports[shared.resource]
-----------------------------------------------------------------------------------------------
-- Clientside item use functions
-----------------------------------------------------------------------------------------------

function loadAnimDict(dict)
  while (not HasAnimDictLoaded(dict)) do
      RequestAnimDict(dict)
      Citizen.Wait(5)
  end
end

Item('firstaid', function(data, slot)
	local maxHealth = 200
	local health = GetEntityHealth(PlayerData.ped)
	-- if health < maxHealth then
		ox_inventory:useItem(data, function(data)
			if data then
				SetEntityHealth(PlayerData.ped, math.min(maxHealth, math.floor(health + maxHealth / 10)))
				-- ox_inventory:notify({text = 'You feel better already'})
			end
		end)
	-- end
end)

Item('pdchestarmor', function(data, slot)
	if GetPedArmour(PlayerData.ped) < 100 then
		ox_inventory:useItem(data, function(data)
			if data then
				SetPlayerMaxArmour(PlayerData.id, 100)
				SetPedArmour(PlayerData.ped, 100)
			end
		end)
	end
end)

Item('chestarmor', function(data, slot)
	if GetPedArmour(PlayerData.ped) < 100 then
		ox_inventory:useItem(data, function(data)
			if data then
				SetPlayerMaxArmour(PlayerData.id, 100)
				SetPedArmour(PlayerData.ped, GetPedArmour(PlayerData.ped) + 50)
			end
		end)
	end
end)

client.parachute = false
Item('parachute', function(data, slot)
	if not client.parachute then
		ox_inventory:useItem(data, function(data)
			if data then
				local chute = `GADGET_PARACHUTE`
				SetPlayerParachuteTintIndex(PlayerData.id, -1)
				GiveWeaponToPed(PlayerData.ped, chute, 0, true, false)
				SetPedGadget(PlayerData.ped, chute, true)
				lib.requestModel(1269906701)
				client.parachute = CreateParachuteBagObject(PlayerData.ped, true, true)
				if slot.metadata.type then
					SetPlayerParachuteTintIndex(PlayerData.id, slot.metadata.type)
				end
			end
		end)
	end
end)

Item('phone', function(data, slot)
	exports.npwd:setPhoneVisible(not exports.npwd:isPhoneVisible())
end)

local Megaphone = false
local megaObj = nil
Item('megaphone', function (data, slot)
  local animDict = "anim@mp_player_intselfiethumbs_up"
  local animation = "idle_a"
  ox_inventory:useItem(data, function(data)
    if data then
      if Megaphone == false then
        Megaphone = true
        exports['pma-voice']:overrideProximityRange(500.0, true)
        if megaObj == nil then
          megaObj = CreateObject(GetHashKey("prop_megaphone_01"), 0, 0, 0, true, true, true)
        end

        AttachEntityToEntity(megaObj, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.10, 0.03, 0, 90, 150, 100, true, true, false, true, 0, true)
        
        if IsPedArmed(ped, 7) then
          SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        loadAnimDict(animDict)
        TaskPlayAnim(PlayerPedId(), animDict, animation, 1.0, 4.0, -1, 49, 0, 0, 0, 0)
      else
        Megaphone = false
        ClearPedTasks(PlayerPedId())
        if megaObj ~= nil then
          DeleteEntity(megaObj)
          megaObj = nil
        end	
        exports['pma-voice']:clearProximityOverride()
      end
    end
  end)
end)


Item('lockpick', function(data, slot)
  local veh = IsPedInAnyVehicle(PlayerPedId(), false)
  if veh then
    ox_inventory:useItem(data, function(data)
      if data then
        TriggerEvent('onyx:checkForKeys')
      end
    end)
  else
    TriggerEvent('onyx:pickDoor')
  end
end)

AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  DeleteEntity(megaObj)
end)
-----------------------------------------------------------------------------------------------

exports('Items', GetItem)
exports('ItemList', GetItem)
client.items = Items
