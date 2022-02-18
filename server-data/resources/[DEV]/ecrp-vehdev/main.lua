local idontknowwhatimdoing

RegisterNetEvent("vehdebug:toggle")
AddEventHandler("vehdebug:toggle",function()
	idontknowwhatimdoing = not idontknowwhatimdoing
    if idontknowwhatimdoing then
        print("Vehicle Debug Enabled")
    else
		print("Vehicle Debug Disabled")
    end
end)

RegisterCommand("vehdebug", function(source, args, rawCommand)
	TriggerEvent("vehdebug:toggle")
  TriggerEvent('worldDensity')
end, false)

RegisterNetEvent('worldDensity')
AddEventHandler('worldDensity', function ()
  Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetTrafficDensity(0)
        SetPedDensity(0)
        for i=0,20 do
            EnableDispatchService(i, not true)
        end
        
    end
  end)
end)

function SetTrafficDensity(density)
  SetParkedVehicleDensityMultiplierThisFrame(density)
  SetVehicleDensityMultiplierThisFrame(density)
  SetRandomVehicleDensityMultiplierThisFrame(density)
end

function SetPedDensity(density)
  SetPedDensityMultiplierThisFrame(density)
  SetScenarioPedDensityMultiplierThisFrame(density, density)
end

local topSpeed = 0
local countdown0 = 0
local countdown1 = 0
local countdown2 = 0
local count0 = true
local count1 = true
local count2 = true
local ihatemphbuteveryoneusesit = 0

if Config.Speed == "KMH" then ihatemphbuteveryoneusesit = 3.6 else ihatemphbuteveryoneusesit = 2.236936 end

Citizen.CreateThread(function()
	while true do 	
		Citizen.Wait(1)
		if idontknowwhatimdoing then
			if IsPedInAnyVehicle(PlayerPedId(), false) then
				ped = PlayerPedId()
				veh = GetVehiclePedIsIn(ped, false)
				veh2 = GetVehiclePedIsIn(ped, true)
        playerCoords = GetEntityCoords(ped)
        playerHeading = GetEntityHeading(ped)
				vehModel = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
				vehModel2 = GetDisplayNameFromVehicleModel(GetEntityModel(veh2))
			
				drawTxt(0.8, 0.52, 0.4,0.4,0.30, "Model: " .. vehModel, 245, 217, 39, 255)
				drawTxt(0.8, 0.54, 0.4,0.4,0.30, "Speed: " .. (GetEntitySpeed(veh)*ihatemphbuteveryoneusesit), 245, 217, 39, 255)
				
				if GetVehicleCurrentGear(veh) == 0 then currGear = "R" else currGear = GetVehicleCurrentGear(veh) end
				drawTxt(0.8, 0.56, 0.4,0.4,0.30, "Gear: " .. currGear .. "/" .. GetVehicleHighGear(veh), 245, 217, 39, 255)
				
				if (GetVehicleCurrentRpm(veh)*6000) < 1201 then currRPM = 0 else currRPM = (GetVehicleCurrentRpm(veh)*6000) end
				drawTxt(0.8, 0.58, 0.4,0.4,0.30, "RPM: " .. currRPM, 245, 217, 39, 255)

				if topSpeed < (GetEntitySpeed(veh)*ihatemphbuteveryoneusesit) then
					topSpeed = (GetEntitySpeed(veh)*ihatemphbuteveryoneusesit)
					drawTxt(0.8, 0.62, 0.4,0.4,0.30, "Top Speed: " .. topSpeed, 245, 217, 39, 255)
				elseif topSpeed > (GetEntitySpeed(veh)*ihatemphbuteveryoneusesit) then
					drawTxt(0.8, 0.62, 0.4,0.4,0.30, "Top Speed: " .. topSpeed, 39, 245, 58, 255)
				else 
					topSpeed = 0
					drawTxt(0.8, 0.62, 0.4,0.4,0.30, "Top Speed: " .. topSpeed, 245, 217, 39, 255)
				end

				if count0 then
					drawTxt(0.8, 0.64, 0.4,0.4,0.30, "0-45: " .. countdown0 .. "s", 245, 217, 39, 255)
				elseif not count0 then
					drawTxt(0.8, 0.64, 0.4,0.4,0.30, "0-45: " .. countdown0 .. "s", 39, 245, 58, 255)
				end

				if count1 then
					drawTxt(0.8, 0.66, 0.4,0.4,0.30, "0-60: " .. countdown1 .. "s", 245, 217, 39, 255)
				elseif not count1 then
					drawTxt(0.8, 0.66, 0.4,0.4,0.30, "0-60: " .. countdown1 .. "s", 39, 245, 58, 255)
				end

				if count2 then
					drawTxt(0.8, 0.68, 0.4,0.4,0.30, "0-100: " .. countdown2 .. "s", 245, 217, 39, 255)
				elseif not count2 then
					drawTxt(0.8, 0.68, 0.4,0.4,0.30, "0-100: " .. countdown2 .. "s", 39, 245, 58, 255)
				end

				drawTxt(0.5, 0.52, 0.4,0.4,0.30, "Engine: " .. GetVehicleEngineHealth(veh), 0, 152, 255, 255)
				drawTxt(0.5, 0.54, 0.4,0.4,0.30, "Body: " .. GetVehicleBodyHealth(veh), 0, 152, 255, 255)
				drawTxt(0.5, 0.56, 0.4,0.4,0.30, "Tank: " .. GetVehiclePetrolTankHealth(veh), 0, 152, 255, 255)

				if Config.FixVehicleLabel ~= "nil" then 
					drawTxt(0.5, 0.60, 0.4,0.4,0.30, "["..Config.FixVehicleLabel.."] Fix Vehicle", 255, 214, 129, 255)
				end

				if Config.ResetLabel ~= "nil" then 
					drawTxt(0.5, 0.62, 0.4,0.4,0.30, "["..Config.ResetLabel.."] Reset Numbers", 255, 214, 129, 255)
				end

				if Config.UseTeleport then 
					drawTxt(0.5, 0.64, 0.4,0.4,0.30, "["..Config.TeleportToCoordsLabel.."] Teleport " ..Config.TeleportToCoordsName, 255, 214, 129, 255)
				end

				if Config.UseTeleport2 then 
					drawTxt(0.5, 0.66, 0.4,0.4,0.30, "["..Config.TeleportToCoordsLabel2.."] Teleport " ..Config.TeleportToCoordsName2, 255, 214, 129, 255)
				end

				if Config.UseDeleteVehicle then 
					drawTxt(0.5, 0.68, 0.4,0.4,0.30, "["..Config.DeleteVehicleKeyLabel.."] Delete Vehicle", 255, 214, 129, 255)
				end

				if Config.UseRestart then 
					drawTxt(0.5, 0.70, 0.4,0.4,0.30, "["..Config.RestartKeyLabel.."] Restart Vehicles", 255, 214, 129, 255)
				end
			end
			if (IsControlJustReleased(1, Config.Reset)) then
				if (GetEntitySpeed(veh)*ihatemphbuteveryoneusesit) > 1 then
					if Config.Notif ~= "MYTHIC" then 
						print("Numbers reset, but you are still driving")
					else
						exports['mythic_notify']:DoHudText("Inform", "Numbers reset, but you are still driving", 3000)
					end
				else
					if Config.Notif ~= "MYTHIC" then
						print("Numbers reset")
					else
						exports['mythic_notify']:DoHudText("Inform", "Numbers reset", 3000)
					end
				end
				topSpeed = 0
				countdown0 = 0
				countdown1 = 0
				countdown2 = 0
				count0 = true
				count1 = true
				count2 = true
			end
			if (IsControlJustReleased(1, Config.FixVehicle)) then
				SetVehicleBodyHealth(veh, 1000)
				SetVehiclePetrolTankHealth(veh, 1000)
				SetVehicleBodyHealth(veh, 1000)
				SetVehicleFixed(veh)
				SetVehicleDirtLevel(veh, 0)

				if Config.Notif ~= "MYTHIC" then 
					print("Fixed vehicle")
				else
					exports['mythic_notify']:DoHudText("Inform", "Fixed vehicle", 3000)
				end
			end 
			if Config.UseTeleport then
				if (IsControlJustReleased(1, Config.TeleportToCoordsKey)) then
					SetEntityCoordsNoOffset(veh, Config.TeleportToCoords, false, false, false, false)
					SetEntityHeading(veh, Config.TeleportToCoordsHeading)

					if Config.Notif ~= "MYTHIC" then 
						print("Teleported to Coords")
					else
						exports['mythic_notify']:DoHudText("Inform", "Teleported to Coords", 3000)
					end
				end
			end
			if Config.UseTeleport2 then
				if (IsControlJustReleased(1, Config.TeleportToCoordsKey2)) then
					SetEntityCoordsNoOffset(veh, Config.TeleportToCoords2, false, false, false, false)
					SetEntityHeading(veh, Config.TeleportToCoordsHeading2)

					if Config.Notif ~= "MYTHIC" then 
						print("Teleported to Coords")
					else
						exports['mythic_notify']:DoHudText("Inform", "Teleported to Coords", 3000)
					end
				end
			end
			if Config.UseDeleteVehicle then
				if (IsControlJustReleased(1, Config.DeleteVehicleKey)) then
					DeleteEntity(veh)
				end
			end
			if Config.UseRestart then
				if (IsControlJustReleased(1, Config.Restartkey)) then
          local vehicle = 0
					DeleteEntity(veh)
          Citizen.Wait(500)
          ExecuteCommand('refresh')
          Citizen.Wait(1000)
          ExecuteCommand('restart '..Config.RestartResource)
          Citizen.Wait(1000)

          if not IsModelInCdimage(vehModel2) then return end
          RequestModel(vehModel2)

          while not HasModelLoaded(vehModel2) do
            Citizen.Wait(10)
          end
          vehicle = CreateVehicle(vehModel2, playerCoords, playerHeading, true, false)
          local plate = GetVehicleNumberPlateText(vehicle)
          exports["onyxLocksystem"]:givePlayerKeys(plate)
          -- Vehicle Mods
          SetVehicleModKit(vehicle, 0)
          SetVehicleMod(vehicle, 11, 4, true) -- engine
          SetVehicleMod(vehicle, 12, 2, true) -- brakes
          SetVehicleMod(vehicle, 13, 3, true) -- transmission
          SetVehicleMod(vehicle, 15, 3, true) -- suspension
          ToggleVehicleMod(vehicle, 22, true) -- xenon
          SetVehicleXenonLightsColor(vehicle, 0, true) -- xenon color
          ToggleVehicleMod(vehicle, 18, true) -- turbo
          SetVehicleNumberPlateTextIndex(vehicle, 0) -- plate
          SetPedIntoVehicle(ped, vehicle, -1)
          SetVehicleDirtLevel(vehicle, 0.0)
          SetVehicleFuelLevel(vehicle, 200.0)
				end
			end
		else
			Citizen.Wait(5000)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		if idontknowwhatimdoing then
			if (GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))*ihatemphbuteveryoneusesit) > 1 and count1 then
				if (GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))*ihatemphbuteveryoneusesit) < 45 then
					countdown0 = (countdown0 + 0.1)
				end

				if (GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))*ihatemphbuteveryoneusesit) >= 45 then
					count0 = false
				end
			end

			if (GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))*ihatemphbuteveryoneusesit) > 1 and count1 then
				if (GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))*ihatemphbuteveryoneusesit) < 60 then
					countdown1 = (countdown1 + 0.1)
				end

				if (GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))*ihatemphbuteveryoneusesit) >= 60 then
					count1 = false
				end
			end

			if (GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))*ihatemphbuteveryoneusesit) > 1 and count2 then
				if (GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))*ihatemphbuteveryoneusesit) < 100 then
					countdown2 = (countdown2 + 0.1)
				end

				if (GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))*ihatemphbuteveryoneusesit) >= 100 then
					count2 = false
				end
			end
		else
			Citizen.Wait(5000)
		end
	end
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.25, 0.25)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
