local lastSelectedVehicleEntity
local startCountDown
local testDriveEntity
local lastPlayerCoords

local inTheShop = false

ESX                           = nil

Citizen.CreateThread(function ()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


local rgbColorSelected = {
    255,255,255,
}

local rgbSecondaryColorSelected = {
    255,255,255,
}

local vehicleshopCoords = {
    vector3(-56.49, -1096.58, 26.42),
}

RegisterNetEvent('vehicleshop.sussessbuy')
AddEventHandler('vehicleshop.sussessbuy', function(vehicleName,vehiclePlate,value)    
    SendNUIMessage(
        {
            type = "sussess-buy",
            vehicleName = vehicleName,
            vehiclePlate = vehiclePlate,
            value = value
        }
    )       
    CloseNui()
end)

RegisterNetEvent('vehicleshop.notify')
AddEventHandler('vehicleshop.notify', function(type, message)    
    SendNUIMessage(
        {
            type = "notify",
            typenotify = type,
            message = message,
        }
    ) 
end)

local vehiclesTable = {}

local provisoryObject = {}

RegisterNetEvent('vehicleshop.vehiclesInfos')
AddEventHandler('vehicleshop.vehiclesInfos', function(tableVehicles)      

    for _,value in pairs(tableVehicles) do
        vehiclesTable[value.category] = {}
    end

    for _,value in pairs(tableVehicles) do

        local vehicleModel = GetHashKey(value.model)
        local brandName

        if Config.Build2060 then
            brandName = GetLabelText(Citizen.InvokeNative(0xF7AF4F159FF99F97, vehicleModel, Citizen.ResultAsString()))    
        else
            brandName = nil
        end

        if brandName == nil then
            brandName = 'Custom'
        end    

        local vehicleName   

        if GetLabelText(value.model) == "NULL" then
            vehicleName = value.model:gsub("^%l", string.upper)
        else 
            vehicleName = GetLabelText(value.model)
        end

        provisoryObject = 
        {
            brand = brandName,
            name = vehicleName,
            price = value.price,
            model = value.model,
            qtd = value.stock
        }
        table.insert(vehiclesTable[value.category], provisoryObject)
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k, v in pairs(Config.Spawn) do
			local npcSpawnped = GetEntityCoords(PlayerPedId())	
			local dist = #(v.npcSpawn - npcSpawnped)
			
			if dist < 31 and pedspawneado == false then
				TriggerEvent('dealership:npc',v.npcSpawn,v.h)
				pedspawneado = true
			end
			if dist >= 30  then
				pedspawneado = false
        SetEntityAlpha(tunpc, 1, false)
				DeletePed(tunpc)

			end
		end
	end
end)

RegisterNetEvent('dealership:npc')
AddEventHandler('dealership:npc',function(coords,heading)
	local hash = GetHashKey(Config.npc)  --- change the npc to your liking
	if not HasModelLoaded(hash) then
		RequestModel(hash)
		Wait(10)
	end
	while not HasModelLoaded(hash) do 
		Wait(10)
	end

    pedspawneado = true
	tunpc = CreatePed(5, hash, coords, heading, false, false)
	FreezeEntityPosition(tunpc, true)
  SetEntityInvincible(tunpc, true)
    SetBlockingOfNonTemporaryEvents(tunpc, true)
	loadAnimDict("amb@world_human_seat_wall_tablet@female@base")  ---- change the npc animation
	while not TaskPlayAnim(tunpc, "amb@world_human_seat_wall_tablet@female@base", "base", 8.0, 1.0, -1, 17, 0, 0, 0, 0) do
	Wait(1000)
	end

    if ipad == nil then
        ipad = CreateObject(GetHashKey("prop_cs_tablet"), 0, 0, 0, true, true, true) -- creates object
    end			
    AttachEntityToEntity(ipad, tunpc, GetPedBoneIndex(tunpc, 28422), 0.0, 0.0, 0.03, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1) -- object is attached to right hand    

end)

RegisterNetEvent('dealership:open')
AddEventHandler('dealership:open', function()
    OpenVehicleShop()
end)

function OpenVehicleShop()
    inTheShop = true
    local ped = PlayerPedId()

    TriggerServerEvent("vehicleshop.requestInfo")

    Citizen.Wait(1000)

    SendNUIMessage(
        {
            data = vehiclesTable,
            type = "display",
            testDrive = Config.TestDrive
        }
    )

    SetNuiFocus(true, true)

    RequestCollisionAtCoord(x, y, z)

    --SetEntityVisible(ped, false, 0)
    --SetEntityCoords(ped, 404.90, -949.58, -99.71, 0, 0, 0, false)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -954.49, -3537.35, 15.00, 317.16, 0.00, 0.00, 60.00, false, 0)
    PointCamAtCoord(cam, -949.51440429688, -3532.888671875, 13.883902549744)

    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1, true, true)
        
    SetFocusPosAndVel(-953.04, -3538.72, 14.62, 329.41, 0.0, 0.0, 0.0)

    DisplayHud(false)
    DisplayRadar(false)

    while inTheShop do
        Citizen.Wait(0)        
   --    DrawLightWithRange(404.99, -949.60, -98.98, 255, 255, 255, 20.000, 100.000)
    end

    if lastSelectedVehicleEntity ~= nil then
        DeleteEntity(lastSelectedVehicleEntity)
    end

end

function updateSelectedVehicle(model)
    local hash = GetHashKey(model)

    if not HasModelLoaded(hash) then
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Citizen.Wait(10)
        end
    end

    if lastSelectedVehicleEntity ~= nil then
        DeleteEntity(lastSelectedVehicleEntity)
    end
  --  lastSelectedVehicleEntity = CreateVehicle(hash, 404.99, -949.60, -99.98, 50.117, 0, 1)
    
  lastSelectedVehicleEntity = CreateVehicle(hash, -949.51440429688, -3532.888671875, 13.883902549744, 89.5, 0, 1)


    local vehicleData = {}

    
    vehicleData.traction = GetVehicleMaxTraction(lastSelectedVehicleEntity)


    vehicleData.breaking = GetVehicleMaxBraking(lastSelectedVehicleEntity) * 0.9650553    
    if vehicleData.breaking >= 1.0 then
        vehicleData.breaking = 1.0
    end

    vehicleData.maxSpeed = GetVehicleEstimatedMaxSpeed(lastSelectedVehicleEntity) * 0.9650553
    if vehicleData.maxSpeed >= 50.0 then
        vehicleData.maxSpeed = 50.0
    end

    vehicleData.acceleration = GetVehicleAcceleration(lastSelectedVehicleEntity) * 2.6
    if  vehicleData.acceleration >= 1.0 then
        vehicleData.acceleration = 1.0
    end


    SendNUIMessage(
        {
            data = vehicleData,
            type = "updateVehicleInfos",        
        }
    )

    SetVehicleCustomPrimaryColour(lastSelectedVehicleEntity,  math.ceil(rgbColorSelected[1]), math.ceil(rgbColorSelected[2]), math.ceil(rgbColorSelected[3]))
    SetVehicleCustomSecondaryColour(lastSelectedVehicleEntity,  math.ceil(rgbSecondaryColorSelected[1]), math.ceil(rgbSecondaryColorSelected[2]), math.ceil(rgbSecondaryColorSelected[3]))

    SetEntityHeading(lastSelectedVehicleEntity, 89.5)
end


function rotation(dir)
    local entityRot = GetEntityHeading(lastSelectedVehicleEntity) + dir
    SetEntityHeading(lastSelectedVehicleEntity, entityRot % 360)
end

function loadAnimDict( dict )
  while ( not HasAnimDictLoaded( dict ) ) do
      RequestAnimDict( dict )
      Citizen.Wait( 5 )
  end
end

RegisterNUICallback(
    "rotate",
    function(data, cb)
        if (data["key"] == "left") then
            rotation(2)
        else
            rotation(-2)
        end
        cb("ok")
    end
)


RegisterNUICallback(
    "SpawnVehicle",
    function(data, cb)
        updateSelectedVehicle(data.modelcar)
    end
)



RegisterNUICallback(
    "RGBVehicle",
    function(data, cb)
        if data.primary then
            rgbColorSelected = data.color
            SetVehicleCustomPrimaryColour(lastSelectedVehicleEntity, math.ceil(data.color[1]), math.ceil(data.color[2]), math.ceil(data.color[3]) )
        else
            rgbSecondaryColorSelected = data.color
            SetVehicleCustomSecondaryColour(lastSelectedVehicleEntity, math.ceil(data.color[1]), math.ceil(data.color[2]), math.ceil(data.color[3]))
        end
    end
)

RegisterNUICallback(
    "Buy",
    function(data, cb)

        local newPlate     = GeneratePlate()
        local vehicleProps = ESX.Game.GetVehicleProperties(lastSelectedVehicleEntity)
        vehicleProps.plate = newPlate

        TriggerServerEvent('vehicleshop.CheckMoneyForVeh',data.modelcar, data.sale, data.name, vehicleProps)

        Wait(1500)        
        -- SendNUIMessage(
        --     {
        --         type = "updateMoney",
        --         playerMoney = profileMoney
        --     }
        -- )
    end
)


RegisterNetEvent('vehicleshop.spawnVehicle')
AddEventHandler('vehicleshop.spawnVehicle', function(model, plate)    
    local hash = GetHashKey(model)

    lastPlayerCoords = GetEntityCoords(PlayerPedId())
    
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Citizen.Wait(10)
        end
    end
    
    local vehicleBuy = CreateVehicle(hash, -11.87, -1080.87, 25.71, 132.0, 1, 1)
    SetPedIntoVehicle(PlayerPedId(), vehicleBuy, -1)
    
    SetVehicleNumberPlateText(vehicleBuy, plate)
    
    SetVehicleCustomPrimaryColour(vehicleBuy,  math.ceil(rgbColorSelected[1]), math.ceil(rgbColorSelected[2]), math.ceil(rgbColorSelected[3]))
    SetVehicleCustomSecondaryColour(vehicleBuy,  math.ceil(rgbSecondaryColorSelected[1]), math.ceil(rgbSecondaryColorSelected[2]), math.ceil(rgbSecondaryColorSelected[3]))
end)


RegisterNUICallback(
    "TestDrive",
    function(data, cb)        
        if Config.TestDrive then
            startCountDown = true

            local hash = GetHashKey(data.vehicleModel)

            lastPlayerCoords = GetEntityCoords(PlayerPedId())

            if not HasModelLoaded(hash) then
                RequestModel(hash)
                while not HasModelLoaded(hash) do
                    Citizen.Wait(10)
                end
            end
        
            if testDriveEntity ~= nil then
                DeleteEntity(testDriveEntity)
            end
        
            testDriveEntity = CreateVehicle(hash, -11.87, -1080.87, 25.71, 132.0, 1, 1)
            SetPedIntoVehicle(PlayerPedId(), testDriveEntity, -1)
            local timeGG = GetGameTimer()

            
            SetVehicleCustomPrimaryColour(testDriveEntity,  math.ceil(rgbColorSelected[1]), math.ceil(rgbColorSelected[2]), math.ceil(rgbColorSelected[3]))
            SetVehicleCustomSecondaryColour(testDriveEntity,  math.ceil(rgbSecondaryColorSelected[1]), math.ceil(rgbSecondaryColorSelected[2]), math.ceil(rgbSecondaryColorSelected[3]))

            
            CloseNui()

            while startCountDown do
                local countTime
                Citizen.Wait(1)
                if GetGameTimer() < timeGG+tonumber(1000*Config.TestDriveTime) then
                    local secondsLeft = GetGameTimer() - timeGG
                    drawTxt(_U('testdrive') .. math.ceil(Config.TestDriveTime - secondsLeft/1000),4,0.5,0.93,0.50,255,255,255,180)
                    SetVehicleDoorsLocked(testDriveEntity, 2)
                    DisableControlAction(1, 75)
                else
                    DeleteEntity(testDriveEntity)
                    SetEntityCoords(PlayerPedId(), lastPlayerCoords)
                    startCountDown = false
                end
            end        
        end
    end
)


RegisterNUICallback(
    "menuSelected",
    function(data, cb)
        local categoryVehicles

        local playerIdx = GetPlayerFromServerId(source)
        local ped = GetPlayerPed(playerIdx)
        
        if data.menuId ~= 'all' then
            categoryVehicles = vehiclesTable[data.menuId]
        else
            SendNUIMessage(
                {
                    data = vehiclesTable,
                    type = "display"
                }
            )
            return
        end

        SendNUIMessage(
            {
                data = categoryVehicles,
                type = "menu"
            }
        )
    end
)


RegisterNUICallback(
    "Close",
    function(data, cb)
        CloseNui()       
    end
)

function CloseNui()
    SendNUIMessage(
        {
            type = "hide"
        }
    )
    SetNuiFocus(false, false)
    if inTheShop then
        if lastSelectedVehicleEntity ~= nil then
            DeleteVehicle(lastSelectedVehicleEntity)
        end
        RenderScriptCams(false)
        DestroyAllCams(true)
        SetFocusEntity(GetPlayerPed(PlayerId())) 
        ClearFocus()
        DisplayHud(true)
        DisplayRadar(true)
    end
    vehiclesTable = {}
    provisoryObject = {}
    inTheShop = false
end



function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end


local blip 

-- Create Blips
Citizen.CreateThread(function ()

    for i = 1, #vehicleshopCoords do    
        local actualShop = vehicleshopCoords[i]
        blip = AddBlipForCoord(actualShop.x, actualShop.y, actualShop.z)

        SetBlipSprite (blip, 326)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.8)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(_U('car_dealer'))
        EndTextCommandSetBlipName(blip)
    end
end)

AddEventHandler(
    "onResourceStop",
    function(resourceName)
        if resourceName == GetCurrentResourceName() then
            CloseNui()
            RemoveBlip(blip)
        end
    end
)
