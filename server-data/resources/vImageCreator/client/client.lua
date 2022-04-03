
local screenshot = false
local cam = nil
Citizen.CreateThread(function()
    Wait(500)

    exports('GetModelImage', function(model)
        if not tonumber(model) then
            model = GetHashKey(model)
        end
        model = tostring(model)
        return GlobalState.VehicleImages[model] or 'https://i.imgur.com/NHB74QX.png'
    end)
    local c = 0
    while not LocalPlayer.state.screenshotperms do c = c + 1 Wait(1000) if c >= 30 then break end end
    if LocalPlayer.state.screenshotperms then
        print("PERMS")
        LocalPlayer.state.screenshotnum = GetResourceKvpInt('screenshotnum') and GetResourceKvpInt('screenshotnum') or 1
        RegisterCommand('resetscreenshot', function(source, args, rawCommand)
            LocalPlayer.state.screenshotnum = 1
            SetResourceKvpInt('screenshotnum',LocalPlayer.state.screenshotnum)
        end)

        RegisterCommand('startscreenshot', function(source, args, rawCommand)
            if not screenshot then
                StartScreenShoting()
            end
            screenshot = not screenshot
        end)

        RegisterCommand('getmodelimage', function(source, args, rawCommand)
            print(exports.vImageCreator:GetModelImage(args[1]))
        end)

        RegisterCommand('destroyphone', function (source, args, rawCommand)
          DestroyMobilePhone()
          CellCamActivate(false, false)
        end)

        function inShowRoom(bool)
            Citizen.CreateThread(function()
                if bool then
                    inshell = true
                    while inshell do
                        Citizen.Wait(0)
                        -- NetworkOverrideClockTime(22, 00, 00)
                    end
                else
                    inshell = false
                end
            end)
        end

        function classlist(class)
            if class == '0' then
                name = 40.0
            elseif class == '1' then
                name = 40.0
            elseif class == '2' then
                name = 45.0
            elseif class == '3' then
                name = 40.0
            elseif class == '4' then
                name = 40.0
            elseif class == '5' then
                name = 40.0
            elseif class == '6' then
                name = 40.0
            elseif class == '7' then
                name = 41.0
            elseif class == '8' then
                name = 30.0
            elseif class == '9' then
                name = 45.0
            elseif class == '10' then
                name = 45.0
            elseif class == '11' then
                name = 45.0
            elseif class == '12' then
                name = 45.0
            elseif class == '13' then
                name = 30.0
            elseif class == '14' then
                name = 40.0
            elseif class == '15' then
                name = 48.0
            elseif class == '16' then
                name = 60.0
            elseif class == '17' then
                name = 45.0
            elseif class == '18' then
                name = 44.0
            elseif class == '19' then
                name = 44.0
            elseif class == '20' then
                name = 45.0
            elseif class == '21' then
                name = 70.0
            else
                name = 40.0
            end
            return name
        end

        function StartScreenShoting()
            inShowRoom(true)
            local returncoord = GetEntityCoords(PlayerPedId())
            screenshot = true
            FreezeEntityPosition(PlayerPedId(),true)
            CreateLocation()
            while not IsIplActive("np_showroom_milo_") do Wait(0) end

            RequestCollisionAtCoord(-37.47, -1054.39, -43.53)
            vec = vector3(-37.47, -1054.39, -43.53)
            cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -35.311832427979, -1050.4459228516, -42.5, 0.00, 0.00, 0.00, 60.00, false, 0)
            PointCamAtCoord(cam, -37.2, -1054.39, -43.53)
            SetCamActive(cam, true)
            RenderScriptCams(true, true, 1, true, true)
            SetFocusPosAndVel(-37.47, -1054.39, -43.53, 0.0, 0.0, 0.0)
            DisplayHud(false)
            DisplayRadar(false)
            Citizen.CreateThread(function()
                local coord = vector3(-37.47, -1054.39, -43.53)
                while screenshot do
                    Citizen.Wait(0)
                    DrawLightWithRange(coord.x-4.0, coord.y-3.0, coord.z+ 0.3, 255,255,255, 40.0, 15.0)
                    DrawSpotLight(coord.x-4.0, coord.y+5.0, coord.z, coord, 255, 255, 255, 20.0, 1.0, 1.0, 20.0, 0.95)
                end
            end)
            Wait(2000)
            print(#GlobalState.VehiclesFromDB,'total vehicles')
            for i = LocalPlayer.state.screenshotnum, #GlobalState.VehiclesFromDB do
                if not screenshot then break end
                LocalPlayer.state.screenshotnum = LocalPlayer.state.screenshotnum + 1
                SetResourceKvpInt('screenshotnum',LocalPlayer.state.screenshotnum)
                local v = GlobalState.VehiclesFromDB[i]
                local hashmodel = GetHashKey(v.model)
                print(v.model,'model')
                if IsModelInCdimage(hashmodel) and not GlobalState.VehicleImages[tostring(hashmodel)] then
                    CreateMobilePhone(1)
                    CellCamActivate(true, true)
                    Citizen.Wait(100)
                    SpawnVehicleLocal(v.model)
                    local wait = promise.new()

                    -- save file --
                    exports['screenshot-basic']:requestScreenshot(function(data)
                      local image = json.decode(data)
                      DestroyMobilePhone()
                      CellCamActivate(false, false)
                      local data = {
                          model = v.model,
                      }
                      TriggerServerEvent('ecrp:takess', data)
                      Wait(500)
                      wait:resolve(image)
                    end)

                    -- save to discord --
                    -- exports['screenshot-basic']:requestScreenshotUpload(Config.DiscordWebHook, 'files', function(data)
                    --   local image = json.decode(data)
                    --   -- print(image)
                    --   DestroyMobilePhone()
                    --   CellCamActivate(false, false)
                    --   -- print(image.attachments[1].proxy_url)
                    --   -- if image.attachments[1].proxy_url == nil then
                    --   --     print("HOST UPLOAD ERROR")
                    --   --     screenshot = false
                    --   -- end
                    --   local data = {
                    --       model = v.model,
                    --       -- img = image.attachments[1].proxy_url
                    --   }
                    --   TriggerServerEvent('renzu_vehthumb:save',data)
                    --   print("Vehicle Image Save")
                    --   Wait(500)
                    --   wait:resolve(image)
                    --   --cb(json.encode({ url = image.attachments[1].proxy_url }))
                    -- end)
                    Citizen.Await(wait)
                else
                    print(v.model,' already exist')
                end
            end
            while screenshot do
                Citizen.Wait(111)
            end
            RenderScriptCams(false)
            DestroyAllCams(true)
            ClearFocus()
            SetCamActive(cam, false)
            CellCamActivate(false, false)
            inShowRoom(false)
            SetEntityCoords(PlayerPedId(),returncoord)
            Wait(200)
            FreezeEntityPosition(PlayerPedId(),false)
        end

        local arenacoord = vector4(-37.47, -1054.39, -43.53,280.27)
        function CreateLocation()
            local ped = PlayerPedId()
            LoadArena()
            SetCoords(ped, arenacoord, 82.0, true)
        end

        function SetCoords(ped, x, y, z, h, freeze)
            RequestCollisionAtCoord(x, y, z)
            while not HasCollisionLoadedAroundEntity(ped) do
                RequestCollisionAtCoord(x, y, z)
                Citizen.Wait(1)
            end
            DoScreenFadeOut(950)
            Wait(1000)                            
            SetEntityCoords(ped, x+5.0, y-5.0, z)
            SetEntityHeading(ped, h)
            DoScreenFadeIn(3000)
        end

        function UnloadArena()
          RemoveIpl('np_showroom_milo_')
        end

        function LoadArena()
          RequestIpl("np_showroom_milo_")
        end

        local loading = false
        LastVehicleFromGarage = nil
        function SpawnVehicleLocal(model)
            if loading or GetNumberOfStreamingRequests() > 0 then return end
            local ped = PlayerPedId()
            if LastVehicleFromGarage ~= nil then
                ReqAndDelete(LastVehicleFromGarage)
            end
            for i = 1, 2 do
                local nearveh = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 2.000, 0, 70)
                if DoesEntityExist(nearveh) then
                    ReqAndDelete(nearveh)
                end
                while DoesEntityExist((nearveh)) do ReqAndDelete(nearveh) Wait(100) end
            end
            vec = vector3(-37.47, -1054.39, -43.53)
            dist = #(vec - GetEntityCoords(ped))
            local hash = GetHashKey(model)
            if not HasModelLoaded(hash) then
                RequestModel(hash)
                while not HasModelLoaded(hash) do
                    Citizen.Wait(0)
                end
                loading = true
            end
            loading = false
            vec = vector3(-37.47, -1054.39, -43.53)
            LastVehicleFromGarage = CreateVehicle(hash, vec, 280.27, 0, 1)
            while not DoesEntityExist(LastVehicleFromGarage) do Wait(0) end

            -- SetVehicleEngineOn(LastVehicleFromGarage, true, true, false)
            -- SetVehicleBrakeLights(LastVehicleFromGarage, true)
            SetEntityHeading(LastVehicleFromGarage, 280.27)
            FreezeEntityPosition(LastVehicleFromGarage, true)
            SetEntityCollision(LastVehicleFromGarage,false)
            SetVehicleDirtLevel(LastVehicleFromGarage, 0.0)
            currentcar = LastVehicleFromGarage
            if currentcar ~= LastVehicleFromGarage then
                ReqAndDelete(LastVehicleFromGarage)
                SetModelAsNoLongerNeeded(hash)
            end
            SetModelAsNoLongerNeeded(hash)
            Wait(500)
        end

        function ReqAndDelete(object, detach)
            if DoesEntityExist(object) then
                NetworkRequestControlOfEntity(object)
                local attempt = 0
                while not NetworkHasControlOfEntity(object) and attempt < 100 and DoesEntityExist(object) do
                    NetworkRequestControlOfEntity(object)
                    Citizen.Wait(11)
                    attempt = attempt + 1
                end
                --if detach then
                    DetachEntity(object, 0, false)
                --end
                SetEntityCollision(object, false, false)
                SetEntityAlpha(object, 0.0, true)
                SetEntityAsMissionEntity(object, true, true)
                SetEntityAsNoLongerNeeded(object)
                DeleteEntity(object)
            end
        end
    end
end)