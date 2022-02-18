local Bones = {
    Vehicle = {
        'chassis',
        'windscreen',
        'seat_pside_r',
        'seat_dside_r',
        'bodyshell',
        'suspension_lm',
        'suspension_lr',
        'platelight',
        'attach_female',
        'attach_male',
        'bonnet',
        'boot',
        'chassis_dummy',
        'chassis_Control',
        'door_dside_f',
        'door_dside_r',
        'door_pside_f',
        'door_pside_r',
        'Gun_GripR',
        'windscreen_f',
        'VFX_Emitter',
        'window_lf',
        'window_lr',
        'window_rf',
        'window_rr',
        'engine',
        'gun_ammo',
        'ROPE_ATTATCH',
        'wheel_lf',
        'wheel_lr',
        'wheel_rf',
        'wheel_rr',
        'exhaust',
        'overheat',
        'misc_e',
        'seat_dside_f',
        'seat_pside_f',
        'Gun_Nuzzle'
    }
}

local function ToggleDoor(vehicle, door)
	if GetVehicleDoorLockStatus(vehicle) ~= 2 then 
		if GetVehicleDoorAngleRatio(vehicle, door) > 0.0 then
			SetVehicleDoorShut(vehicle, door, false)
		else
			SetVehicleDoorOpen(vehicle, door, false)
		end
	end
end

function flipVehicle(vehicle)
    exports.ox_inventory:Progress({
        duration = 30000,
        label = 'Flipping Vehicle',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = false,
            car = true,
            combat = true,
            mouse = false
        },
        anim = {
            dict = 'missfinale_c2ig_11',
            clip = 'pushcar_offcliff_f'
        }
    }, function(cancel)
        if not cancel then
            SetVehicleOnGroundProperly(vehicle)
        end
    end)
end


Bones['platelight'] = {
	options = {
		{
			icon = "fas fa-car-alt",
			label = "Run Plate",
			canInteract = function(entity)
				return GetEntityBoneIndexByName(entity, 'platelight') ~= -1
			end,
			action = function(entity)
        TriggerEvent('chat:localmsg', GetVehicleNumberPlateText(entity))
			end
		},
    {
      icon = "fas fa-redo-alt",
			label = "Flip Vehicle",
			canInteract = function(entity)
        if not IsVehicleOnAllWheels(entity) then
          return GetEntityBoneIndexByName(entity, 'door_dside_f') ~= -1
        end
			end,
			action = function(entity)
				flipVehicle(entity)
			end
		},
	},
	distance = 1.2
}

Bones['boot'] = {
	options = {
		{
			icon = "fas fa-car-alt",
			label = "Get In Trunk",
			canInteract = function(entity)
				return GetEntityBoneIndexByName(entity, 'boot') ~= -1
			end,
			action = function(entity)
				ExecuteCommand("trunkgetin")
			end
		},
		{
			icon = "fas fa-door-open",
			label = "Toggle Trunk",
			canInteract = function(entity)
				return GetEntityBoneIndexByName(entity, 'boot') ~= -1
			end,
			action = function(entity)
				ToggleDoor(entity, 5)
			end
		},
	},
	distance = 1.2
}

Bones['seat_dside_f'] = {
	options = {
		{
			icon = "fas fa-door-open",
			label = "Toggle front Door",
			canInteract = function(entity)
        if GetVehicleDoorLockStatus(entity) == 1 then 
				  return GetEntityBoneIndexByName(entity, 'door_dside_f') ~= -1
        end
			end,
			action = function(entity)
				ToggleDoor(entity, 0)
			end
		},
		{
      icon = "fas fa-redo-alt",
			label = "Flip Vehicle",
			canInteract = function(entity)
        if not IsVehicleOnAllWheels(entity) then
          return GetEntityBoneIndexByName(entity, 'door_dside_f') ~= -1
        end
			end,
			action = function(entity)
				flipVehicle(entity)
			end
		},
	},
	distance = 1.2
}

Bones['seat_pside_f'] = {
	options = {
		{
			icon = "fas fa-door-open",
			label = "Toggle Front Door",
			canInteract = function(entity)
        if GetVehicleDoorLockStatus(entity) == 1 then 
				  return GetEntityBoneIndexByName(entity, 'door_pside_f') ~= -1
        end
			end,
			action = function(entity)
				ToggleDoor(entity, 1)
			end
		},
    {
      icon = "fas fa-redo-alt",
			label = "Flip Vehicle",
			canInteract = function(entity)
        if not IsVehicleOnAllWheels(entity) then
          return GetEntityBoneIndexByName(entity, 'door_dside_f') ~= -1
        end
			end,
			action = function(entity)
				flipVehicle(entity)
			end
		},
	},
	distance = 1.2
}

Bones['seat_dside_r'] = {
	options = {
		{
			icon = "fas fa-door-open",
			label = "Toggle Rear Door",
			canInteract = function(entity)
        if GetVehicleDoorLockStatus(entity) == 1 then 
				  return GetEntityBoneIndexByName(entity, 'door_dside_r') ~= -1
        end
			end,
			action = function(entity)
				ToggleDoor(entity, 2)
			end
		},
    {
      icon = "fas fa-redo-alt",
			label = "Flip Vehicle",
			canInteract = function(entity)
        if not IsVehicleOnAllWheels(entity) then
          return GetEntityBoneIndexByName(entity, 'door_dside_f') ~= -1
        end
			end,
			action = function(entity)
				flipVehicle(entity)
			end
		},
	},
	distance = 1.2
}

Bones['seat_pside_r'] = {
	options = {
		{
			icon = "fas fa-door-open",
			label = "Toggle Rear Door",
			canInteract = function(entity)
        if GetVehicleDoorLockStatus(entity) == 1 then 
				  return GetEntityBoneIndexByName(entity, 'door_pside_r') ~= -1
        end
			end,
			action = function(entity)
				ToggleDoor(entity, 3)
			end
		},
    {
      icon = "fas fa-redo-alt",
			label = "Flip Vehicle",
			canInteract = function(entity)
        if not IsVehicleOnAllWheels(entity) then
          return GetEntityBoneIndexByName(entity, 'door_dside_f') ~= -1
        end
			end,
			action = function(entity)
				flipVehicle(entity)
			end
		},
	},
	distance = 1.2
}

Bones['bonnet'] = {
	options = {
		{
			icon = "fa-duotone fa-engine",
			label = "Toggle Hood",
      canInteract = function (entity)
        if GetVehicleDoorLockStatus(entity) == 1 then 
          return GetEntityBoneIndexByName(entity, 'bonnet') ~= -1
        end
      end,
			action = function(entity)
				ToggleDoor(entity, 4)
			end
		},
	},
	distance = 0.9
}

return Bones