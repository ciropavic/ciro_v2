local cameras = {}
local vehicle = nil
local activeCam = 'general'
vehicleProps = {}

local GetVehicleDoorAngleRatio = GetVehicleDoorAngleRatio
local SetVehicleDoorOpen = SetVehicleDoorOpen
local SendNUIMessage = SendNUIMessage
local GetModTextLabel = GetModTextLabel
local GetLabelText = GetLabelText
local GetNumVehicleMods = GetNumVehicleMods
local GetVehiclePedIsIn = GetVehiclePedIsIn
local PlayerPedId = PlayerPedId
local SetVehicleMod = SetVehicleMod

function setupCameras()
	local vehicle = GetVehiclePedIsIn(PlayerPedId())
	for index,v in pairs(Config.cameras) do
		local camobj <const> = Config.cameras[index]
		cameras[index] = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, camobj.fov, false, 0)
		AttachCamToEntity(cameras[index], vehicle, camobj.x, camobj.y, camobj.z, true)
		SetCamRot(cameras[index], camobj.rotX, camobj.rotY, GetEntityHeading(vehicle) - camobj.rotZ, 2)
	end
	activeCam = 'general'
	SetCamActive(cameras['general'], true)
	RenderScriptCams(true, true, 500, true, true)
end

function destroyCameras()
	for k,v in pairs(cameras) do
		SetCamActive(cameras[k], false)
		DestroyCam(cameras[k], false)
	end    
end

local nuiOpen = false

function toggleUI()
	nuiOpen = not nuiOpen
	setUiState(nuiOpen)
end

function setUiState (state)
	nuiOpen = state
	if Config.toggleMinimap then
		DisplayRadar(not nuiOpen)
	end
	SetNuiFocus(nuiOpen, nuiOpen)
	func['UpdateCash'][FRAMEWORK]()
	vehicle = GetVehiclePedIsIn(PlayerPedId())
	local vehicle <const> = vehicle
	if(nuiOpen) then
	  	SendNUIMessage({type = "START_LOADING"})
	  	local vehiclePrice = func['GetVehiclePrice'][FRAMEWORK](vehicle)
		local startTime = GetGameTimer()
	    setupCameras()
	    SetVehicleModKit(vehicle, 0)
	    local newMenu = ShallowClone(MenusTemplate)

	    local menusToBuilt = 0
	    local builtMenusNum = 0

	    local wheelsType = GetVehicleWheelType(vehicle)

	    CreateThread(function()
			for i = 0, 12 do
				menusToBuilt = menusToBuilt + 1
				SetVehicleWheelType(vehicle, i)
				local modList = {}
				local amountOfMods <const> = GetNumVehicleMods(vehicle, 23)

				if amountOfMods > 0 then
					table.insert(modList, {
						modId = 23,
						id = -1,
						label = "STOCK",
						type = "upgrade",
						price = 0,
					})
				end

				for j = 0, amountOfMods - 1 do
					local modName = "wheels_" .. j
					if Config.customLabels["wheels"] ~= nil and Config.customLabels["wheels"][j] ~= nil then
						modName = Config.customLabels["wheels"][j]
					else
						modName = GetLabelText(GetModTextLabel(vehicle, 23, j))
					end
					if modName == "NULL" then
						modName = "UNKNOWN_WHEELS_" .. j
					end
					table.insert(modList, {
						modId = 23,
						id = j,
						label = modName,
						type = "upgrade",
						price = func['GetModPrice'][FRAMEWORK](vehiclePrice, 23, j),
						icon = "wheels"
					})
				end

				local parentMenu = Config.wheeltypesections[i]
				
				newMenu["wheels_" .. i] = {
					list = modList,
					activeElement = 0,
					parentMenu = parentMenu
				}
				builtMenusNum = builtMenusNum + 1
			end
		end)

		for category,v in pairs(Config.mods) do
			for i = 1, #v do
				menusToBuilt = menusToBuilt + 1
				CreateThread(function()
					local modList = {}
					local amountOfMods <const> = GetNumVehicleMods(vehicle, v[i].id)

					if amountOfMods > 0 then
						table.insert(modList, {
							modId = v[i].id,
							id = -1,
							label = "STOCK",
							type = "upgrade",
							price = 0
						})
					end

					for j = 0, amountOfMods - 1 do
						local modName = string.upper(v[i].name) .. "_" .. j
						if Config.customLabels[v[i].name] ~= nil and Config.customLabels[v[i].name][j] ~= nil then
							modName = Config.customLabels[v[i].name][j]
						else
							modName = GetLabelText(GetModTextLabel(vehicle, v[i].id, j))
						end
						if modName == "NULL" then
							modName = "UNKNOWN_" .. string.upper(v[i].name) .. "_" .. j
						end
						table.insert(modList, {
							modId = v[i].id,
							id = j,
							label = modName,
							type = "upgrade",
							price = func['GetModPrice'][FRAMEWORK](vehiclePrice, v[i].id, j),
						})
					end

					local parentMenu = category
					if v[i].parentMenu ~= nil then
						parentMenu = v[i].parentMenu
					end
					
					newMenu[string.lower(v[i].name)] = {
						list = modList,
						activeElement = 0,
						currentMod = GetVehicleMod(vehicle, v[i].id),
						parentMenu = parentMenu
					}
					builtMenusNum = builtMenusNum + 1
				end)
			end
		end
		local isTurbo = "no"
		if IsToggleModOn(vehicle, 18) then
			isTurbo = "yes"
		end
		newMenu['turbo'] = {
			list = {
				{
					modId = 18,
					id = "no",
					label = "NO TURBO",
					type = "upgrade",
					price = 0,
				},
				{
					modId = 18,
					id = "yes",
					label = "STREET",
					type = "upgrade",
					price = func['GetModPrice'][FRAMEWORK](vehiclePrice, 18, 0),
				},
			},
			activeElement = 0,
			currentMod = isTurbo,
			parentMenu = "performance"
		}
		newMenu['plates'] = {
			list = {
				{
					modId = "plates",
					id = 0,
					label = "Blue/White",
					type = "upgrade",
					price = 0,
				},
				{
					modId = "plates",
					id = 1,
					label = "Yellow/Black",
					type = "upgrade",
					price = func['GetModPrice'][FRAMEWORK](vehiclePrice, "plates", 0),
				},
				{
					modId = "plates",
					id = 2,
					label = "Yellow/Blue",
					type = "upgrade",
					price = func['GetModPrice'][FRAMEWORK](vehiclePrice, "plates", 0),
				},
				{
					modId = "plates",
					id = 3,
					label = "Blue/White2",
					type = "upgrade",
					price = func['GetModPrice'][FRAMEWORK](vehiclePrice, "plates", 0),
				},
				{
					modId = "plates",
					id = 4,
					label = "Blue/White3",
					type = "upgrade",
					price = func['GetModPrice'][FRAMEWORK](vehiclePrice, "plates", 0),
				},
				{
					modId = "plates",
					id = 5,
					label = "Yankton ",
					type = "upgrade",
					price = func['GetModPrice'][FRAMEWORK](vehiclePrice, "plates", 0),
				},
				
			},
			activeElement = 0,
			currentMod = GetVehicleNumberPlateTextIndex(vehicle),
			parentMenu = "misc"
		}

		SetVehicleWheelType(vehicle, wheelsType)
		vehicleProps = func['GetVehicleProperties'][FRAMEWORK](vehicle)

		if Config.stance.enable then			
			local stockStance = exports['d-stance']:GetDefaultWheelPreset(vehicle)
			local stance = {
				frontwidth = {
					min = stockStance.frontWidth - Config.stance.range.frontWidth,
					current = vehicleProps.stance.frontWidth,
					max = stockStance.frontWidth + Config.stance.range.frontWidth,
				},
				frontcamber = {
					min = stockStance.frontCamber - Config.stance.range.frontCamber,
					current = vehicleProps.stance.frontCamber,
					max = stockStance.frontCamber + Config.stance.range.frontCamber,
				},
				rearwidth = {
					min = stockStance.rearWidth - Config.stance.range.rearWidth,
					current = vehicleProps.stance.rearWidth,
					max = stockStance.rearWidth + Config.stance.range.rearWidth,
				},
				rearcamber = {
					min = stockStance.rearCamber - Config.stance.range.rearCamber,
					current = vehicleProps.stance.rearCamber,
					max = stockStance.rearCamber + Config.stance.range.rearCamber,
				},
			}
			
			CreateThread(function()
				exports['d-stance']:SetFrontTrackWidth(vehicle, vehicleProps.stance.frontWidth)
				exports['d-stance']:SetFrontCamber(vehicle, vehicleProps.stance.frontCamber)
				exports['d-stance']:SetRearTrackWidth(vehicle, vehicleProps.stance.rearWidth)
				exports['d-stance']:SetRearCamber(vehicle, vehicleProps.stance.rearCamber)
			end)
			SendNUIMessage({type = "UPDATE_STANCE", payload = stance})
		end

		while builtMenusNum < menusToBuilt do Citizen.Wait(5) end
	    SendNUIMessage({type = "UPDATE_MENUS", payload = newMenu})
	else 
	    SetCamActive(activeCam, false)
	    RenderScriptCams(false, true, 500, true, true)
	    destroyCameras()
	end
	SendNUIMessage({type = "SHOW", payload = nuiOpen})
end

function ShallowClone(toClone)
	local cloned = {}
	for k,v in pairs(toClone) do
		cloned[k] = v
	end
	return cloned 
end

RegisterNUICallback('closeUI', function(data, cb)
	setUiState(false)
	func['SetVehicleProperties'][FRAMEWORK](vehicle, vehicleProps)
	cb('ok')
end)

RegisterNUICallback('applyMod', function(data, cb)
	local vehicle = GetVehiclePedIsIn(PlayerPedId())
	if data.modId == "primary" then
		ClearVehicleCustomPrimaryColour(vehicle)
		ClearVehicleCustomSecondaryColour(vehicle)
		local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
	    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
	    SetVehicleColours(vehicle, tonumber(data.id), colorSecondary)
	elseif data.modId == "secondary" then
		ClearVehicleCustomPrimaryColour(vehicle)
		ClearVehicleCustomSecondaryColour(vehicle)
		local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
	    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
	    SetVehicleColours(vehicle, colorPrimary, tonumber(data.id))
	elseif data.modId == "wheels" then
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
	    SetVehicleExtraColours(vehicle, pearlescentColor, tonumber(data.id))
	elseif data.modId == "pearlescent" then
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
	    SetVehicleExtraColours(vehicle, tonumber(data.id), wheelColor)
	elseif data.modId == "effects" then
	  	ToggleVehicleMod(vehicle, 20, true)
	  	if data.id ~= nil then
			ToggleVehicleMod(vehicle, 20, true)
			SetVehicleTyreSmokeColor(vehicle, data.id.r, data.id.g, data.id.b)
		else
			ToggleVehicleMod(vehicle, 20, false)
			SetVehicleTyreSmokeColor(vehicle, 255, 255, 255)
		end
	elseif data.modId == "windowtint" then
		SetVehicleWindowTint(vehicle, tonumber(data.id))
	elseif data.modId == "plates" then
		SetVehicleNumberPlateTextIndex(vehicle, tonumber(data.id))
	elseif data.modId == "stance" then
		if data.id == "frontcamber" then
			exports['d-stance']:SetFrontCamber(vehicle, tonumber(data.value))
		elseif data.id == "rearcamber" then
			exports['d-stance']:SetRearCamber(vehicle, tonumber(data.value))
		elseif data.id == "frontwidth" then
			exports['d-stance']:SetFrontTrackWidth(vehicle, tonumber(data.value))
		elseif data.id == "rearwidth" then
			exports['d-stance']:SetRearTrackWidth(vehicle, tonumber(data.value))
		end
		
		
		
		
		---exports['vstancer']:SetWheelPreset(vehicle, stance[1], stance[2], stance[3], stance[4])
	else
		if data.modId == 18 then
			ToggleVehicleMod(vehicle, 18, data.id == "yes")
		elseif data.modId == 48 then
			SetVehicleMod(vehicle, data.modId, data.id, false)
			SetVehicleLivery(vehicle, tonumber(data.id))
		elseif data.modId == "neon" then
			if data.id ~= nil then
				SetVehicleNeonLightsColour(vehicle, data.id.r, data.id.g, data.id.b)
				SetVehicleNeonLightEnabled(vehicle, 0, true)
				SetVehicleNeonLightEnabled(vehicle, 1, true)
				SetVehicleNeonLightEnabled(vehicle, 2, true)
				SetVehicleNeonLightEnabled(vehicle, 3, true)
			else
				SetVehicleNeonLightsColour(vehicle, 0, 0, 0)
				SetVehicleNeonLightEnabled(vehicle, 0, false)
				SetVehicleNeonLightEnabled(vehicle, 1, false)
				SetVehicleNeonLightEnabled(vehicle, 2, false)
				SetVehicleNeonLightEnabled(vehicle, 3, false)
			end
		else
			SetVehicleMod(vehicle, data.modId, data.id, false)
		end
	end
end)

RegisterNUICallback('installMod', function(data, cb)
	local vehicle = GetVehiclePedIsIn(PlayerPedId())
	props = func['GetVehicleProperties'][FRAMEWORK](vehicle)
	local status = func['PayForModInstall'][FRAMEWORK](vehicle, data.modId, data.id)
	Wait(500)
	func['UpdateCash'][FRAMEWORK]()
	if status == "success" then
		vehicleProps = props
	end
	cb(status)
end)

RegisterNUICallback('enteredMenu', function(data, cb)
	local vehicle = GetVehiclePedIsIn(PlayerPedId())
	func['SetVehicleProperties'][FRAMEWORK](vehicle, vehicleProps)
	local camTo = 'general'
	if cameras[data.menuName] ~= nil then
		camTo = data.menuName
	else
		camTo = "general"
	end

	for i = 1, #Config.doorsOpen do
		local doorsMeta = Config.doorsOpen[i]
		local requiredToOpen = false
		for j = 1, #doorsMeta.menus do
			if data.menuName == doorsMeta.menus[j] then
				requiredToOpen = true
				break
			end
		end
		local doorAngle = GetVehicleDoorAngleRatio(vehicle, doorsMeta.id)
		if requiredToOpen then
			if doorAngle == 0.0 then
				SetVehicleDoorOpen(vehicle, doorsMeta.id, false, false)
			end
		else
			if doorAngle ~= 0.0 then
				SetVehicleDoorShut(vehicle, doorsMeta.id, false)
			end
		end
	end

	if string.match(data.menuName, "wheels_") then
		local wheelsid = data.menuName:gsub("wheels_", "")
		SetVehicleWheelType(vehicle, tonumber(wheelsid))
	end
	if camTo == activeCam then return cb('ok') end
	SetCamActiveWithInterp(cameras[camTo], cameras[activeCam], 1000, 30, 30)
	activeCam = camTo
	cb('ok')
end)

CreateThread(function()
	if Config.stance.enable then
		table.insert(MenusTemplate.general.list, { label = "STANCE", name = "stance", childMenu = "stance", icon = "locked" })
	end
end)

CreateThread(function()
	while not scriptLoaded do Wait(100) end
	while true do
		local playerPed <const> = PlayerPedId()
		local coords = GetEntityCoords(playerPed, false)
		local isInShop = false
		local wait = 300
		local shopIndex = -1
		local vehicle <const> = GetVehiclePedIsIn(playerPed)
		if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == playerPed then
			for i = 1, #Config.shops do
				local dist = #(Config.shops[i].coords - coords)
				if Config.marker.enable and dist < Config.marker.range then
					wait = 3
					DrawMarker(Config.marker.type, Config.shops[i].coords + vector3(0, 0, Config.marker.zOffset), 0, 0, 0, 0, 0, 0, Config.shops[i].range * 2, Config.shops[i].range * 2, Config.shops[i].range * 2, Config.marker.color.r, Config.marker.color.g, Config.marker.color.b, Config.marker.alpha, 0, 0, 0, 0)
					if dist < Config.shops[i].range then
						shopIndex = i
						isInShop = true
						break
					end
					break
				end
			end
		end
		if isInShop then
			wait = 3
			if not nuiOpen then
				if DisplayPrompt ~= nil then
					DisplayPrompt()
				else
					func['DisplayPrompt'][FRAMEWORK]()
				end
			end
			EnableControlAction(2, 71, true)
			if IsControlJustPressed(0, 38) and not nuiOpen then
				if func['IsWhitelisted'][FRAMEWORK](shopIndex) then
					setUiState(true)
					StartVehicleChecker()
				end
			end
		end
		Wait(wait)
	end
end)

function StartVehicleChecker()
	CreateThread(function()
		local GetVehiclePedIsIn = GetVehiclePedIsIn
		local PlayerPedId = PlayerPedId
		FreezeEntityPosition(vehicle, true)
		while nuiOpen == true do
			local vehicle <const> = GetVehiclePedIsIn(PlayerPedId())
			
			if vehicle == 0 then
				func['SetVehicleProperties'][FRAMEWORK](vehicle, vehicleProps)
				setUiState(false)
				isInShop = false
			end
			Wait(50)
		end
		FreezeEntityPosition(vehicle, false)
	end)
end

RegisterNetEvent('d-lscustom:openShop', function()
	setUiState(true)
	StartVehicleChecker()
end)

if Config.DEBUG then
	CreateThread(function()
		local oldTimer = GetGameTimer()
		while true do
			local playerPed <const> = PlayerPedId()
			local coords = GetEntityCoords(playerPed, false)
			local vehicle <const> = GetVehiclePedIsIn(playerPed)
			
			for i = 1, #Config.shops do
				local dist = #(Config.shops[i].coords - coords)
				if GetGameTimer() - oldTimer > 1000 then
					print('[DEBUG] Shop', i, "is in distance of [" .. dist .. "m]")
				end
				if dist < 50.0 then
					DrawMarker(1, Config.shops[i].coords, 0, 0, 0, 0, 0, 0, 6.0, 6.0, 6.0, 255, 255, 255, 150, 0, 0, 0, 0)
				end
			end
			if GetGameTimer() - oldTimer > 1000 then
				oldTimer = GetGameTimer()
			end
			Wait(1)
		end
	end)
end

CreateThread(function()
	for i = 1, #Config.shops do
		if Config.shops[i].blip then
			local blip = AddBlipForCoord(Config.shops[i].coords.x, Config.shops[i].coords.y, Config.shops[i].coords.z)

			SetBlipSprite(blip, Config.shops[i].blip.sprite)
			SetBlipColour(blip, Config.shops[i].blip.colour)
			SetBlipScale(blip, 0.8)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(Config.shops[i].name)
			EndTextCommandSetBlipName(blip)
		end
	end
end)