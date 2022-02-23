-- Created by @murfasa and t.willy https://forum.cfx.re/u/murfasa
local dict = 'mp_arresting'
local animname = 'idle'
local dict2 = 'mp_arrest_paired'
local cuffed = false
local softcuffed = false
local pID = 0
local ped = 0
local	Dragging = false
local	Dragger = -1
local	Dragged = false

RegisterNetEvent('cu:togglecuff')
AddEventHandler('cu:togglecuff', function(cop)
    pID = PlayerId()
    ped = GetPlayerPed(pID)

    if DoesEntityExist(ped) then
        if cuffed then
            TriggerServerEvent('cu:uncuffanim', cop)
            Citizen.Wait(2000)
            ClearPedSecondaryTask(ped)
            SetEnableHandcuffs(ped, false)
            SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
            cuffed = false
        else
            ClearPedTasksImmediately(ped)
            RequestAnimDict(dict2)
            while not HasAnimDictLoaded(dict2) do
                Citizen.Wait(100)
            end

            TriggerServerEvent('cu:cuffanim', cop)
            TriggerEvent('cu:crimanim', ped)
            cuffed = true

            Citizen.Wait(1000)
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3, 'handcuff', 0.6)
            SetEnableHandcuffs(ped, true)
            SetCurrentPedWeapon(ped, unarmed, true)
            Citizen.Wait(3500)
            TaskPlayAnim(ped, dict, animname, 8.0, -8, -1, 49, 0, 0, 0, 0)
        end
    end
end)

RegisterNetEvent('cu:togglesoftcuff')
AddEventHandler('cu:togglesoftcuff', function(cop)
    pID = PlayerId()
    ped = GetPlayerPed(pID)

    if DoesEntityExist(ped) then
        if softcuffed then
            TriggerServerEvent('cu:uncuffanim', cop)
            Citizen.Wait(2000)
            ClearPedSecondaryTask(ped)
            SetEnableHandcuffs(ped, false)
            SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
            softcuffed = false
        else
            ClearPedTasksImmediately(ped)
            RequestAnimDict(dict2)
            while not HasAnimDictLoaded(dict2) do
                Citizen.Wait(100)
            end

            TriggerServerEvent('cu:cuffanim', cop)
            TriggerEvent('cu:crimanim', ped)
            softcuffed = true

            Citizen.Wait(1000)
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3, 'handcuff', 0.6)
            SetEnableHandcuffs(ped, true)
            SetCurrentPedWeapon(ped, unarmed, true)
            Citizen.Wait(3500)
            TaskPlayAnim(ped, dict, animname, 8.0, -8, -1, 49, 0, 0, 0, 0)
        end
    end
end)

-- Drag --

function GetPlayers()
	local Players = {}
    
	for Index = 0, 255 do
		if NetworkIsPlayerActive(Index) then
			table.insert(Players, Index)
		end
	end

    return Players
end

function GetClosestPlayer()
    local Players = GetPlayers()
    local ClosestDistance = -1
    local ClosestPlayer = -1
    local PlayerPed = PlayerPedId()
    local PlayerPosition = GetEntityCoords(PlayerPed, false)
    
    for Index = 1, #Players do
    	local TargetPed = GetPlayerPed(Players[Index])
    	if PlayerPed ~= TargetPed then
    		local TargetCoords = GetEntityCoords(TargetPed, false)
    		local Distance = #(PlayerPosition - TargetCoords)

    		if ClosestDistance == -1 or ClosestDistance > Distance then
    			ClosestPlayer = Players[Index]
    			ClosestDistance = Distance
    		end
    	end
    end
    
    return ClosestPlayer, ClosestDistance
end

RegisterNetEvent("Drag")
AddEventHandler("Drag", function(IsDragger)
	Dragging = not Dragging
  Dragger = IsDragger
end)

RegisterCommand("drag", function(source, args, fullCommand)
	local Player, Distance = GetClosestPlayer()

	if Distance ~= -1 and Distance < 1.5 then
		TriggerServerEvent("Drag", GetPlayerServerId(Player))
	else
		exports['mythic_notify']:DoHudText('error', 'No player nearby')
	end
end, false)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if NetworkIsSessionStarted() then
			TriggerEvent("chat:addSuggestion", "/drag", "Toggle drag the closest player")
			return
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if Dragging then
			local PlayerPed = PlayerPedId()

			Dragged = true
			AttachEntityToEntity(PlayerPed, GetPlayerPed(GetPlayerFromServerId(Dragger)), 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		else
			if Dragged then
				local PlayerPed = PlayerPedId()

				if not IsPedInParachuteFreeFall(PlayerPed) then
					Dragged = false
					DetachEntity(PlayerPed, true, false)    
				end
			end
		end
	end
end)
-- Drag END --

Citizen.CreateThread(function()
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
    while true do
        if cuffed then
            if not IsEntityPlayingAnim(ped, dict, animname, 3) then
                Citizen.Wait(0)
                if cuffed then
                    TaskPlayAnim(ped, dict, animname, 8.0, -8, -1, 49, 0, 0, 0, 0)
                end
            end
        end

        if softcuffed then
            if not IsEntityPlayingAnim(ped, dict, animname, 3) then
                Citizen.Wait(0)
                if scuffed then
                    TaskPlayAnim(ped, dict, animname, 8.0, -8, -1, 49, 0, 0, 0, 0)
                end
            end
        end

        if cuffed then
            DisablePlayerFiring(pID, true)
            DisableControlAction(0, 30, true) -- move left and right
            DisableControlAction(0, 31, true) -- move up and down

            DisableControlAction(0, 25, true) --aim
            DisableControlAction(0, 24, true) --punch
            DisableControlAction(0, 288, true)
            DisableControlAction(0, 170, true)
            DisableControlAction(0, 166, true)
            DisableControlAction(0, 245, true) --chat
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
            SetPedPathCanUseLadders(GetPlayerPed(PlayerId()), false)
            if IsPedInAnyVehicle(GetPlayerPed(PlayerId()), false) then
                DisableControlAction(0, 59, true)
            end
        end

        if softcuffed then
            DisablePlayerFiring(pID, true)

            DisableControlAction(0, 25, true) --aim
            DisableControlAction(0, 24, true) --punch
            DisableControlAction(0, 288, true)
            DisableControlAction(0, 170, true)
            DisableControlAction(1, 166, true)
            DisableControlAction(0, 245, true) --chat
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
            SetPedPathCanUseLadders(GetPlayerPed(PlayerId()), false)
            if IsPedInAnyVehicle(GetPlayerPed(PlayerId()), false) then
                DisableControlAction(0, 59, true)
            end
        end

        if Dragged then
          DisablePlayerFiring(pID, true)
            DisableControlAction(0, 30, true) -- move left and right
            DisableControlAction(0, 31, true) -- move up and down

            DisableControlAction(0, 25, true) --aim
            DisableControlAction(0, 24, true) --punch
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 288, true)
            DisableControlAction(0, 170, true)
            DisableControlAction(0, 166, true)
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
            SetPedPathCanUseLadders(GetPlayerPed(PlayerId()), false)
            if IsPedInAnyVehicle(GetPlayerPed(PlayerId()), false) then
                DisableControlAction(0, 59, true)
            end
        end
        Citizen.Wait(0)
    end
end)