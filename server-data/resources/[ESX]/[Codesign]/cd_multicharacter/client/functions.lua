function GetSkinScript()
    return Config.SkinScript
end

function ResetPlayerState()
    local ped = PlayerPedId()
    local ped_id = PlayerId()
    SetFocusEntity(GetPlayerPed(ped_id))
    SetPedAoBlobRendering(ped, true)
    ResetEntityAlpha(ped)
    for c, d in pairs(GetActivePlayers()) do if PlayerId() ~= d then NetworkConcealPlayer(d, false, false) end end
    RenderScriptCams(false, true, 500, true, true)
    DoScreenFadeIn(3000)
    DisplayHud(true)
    DisplayRadar(true)
    FreezeEntityPosition(ped, false)
    SetEntityVisible(ped, true, 0)
    SetPlayerInvisibleLocally(ped, false)
    SetPlayerInvincible(ped, false)
end

function SetCoords(coords)
    local ped = PlayerPedId()
    RequestCollisionAtCoord(coords.x, coords.y, coords.z) while not HasCollisionLoadedAroundEntity(ped) do RequestCollisionAtCoord(coords.x, coords.y, coords.z) Citizen.Wait(0) end
    SetEntityCoords(ped, coords.x, coords.y, coords.z)
    SetEntityHeading(ped, coords.h)
end

RegisterNetEvent('cd_multicharacter:ToggleNUIFocus')
AddEventHandler('cd_multicharacter:ToggleNUIFocus', function()
    NUI_status = true
    while NUI_status ~= false do
        SetNuiFocus(NUI_status, NUI_status)
        Citizen.Wait(5)
    end
    SetNuiFocus(false, false)
end)

function HandleCam(action, ped)
    if action == 'main' then
        SetFocusArea(Config.Cam.posX, Config.Cam.posY, Config.Cam.posZ, 0.0, 0.0, 0.0)
        if Config.CameraType == 'FIXED' then
            cam = CreateCamWithParams(Config.Cam.camName, Config.Cam.posX, Config.Cam.posY, Config.Cam.posZ, Config.Cam.rotX, Config.Cam.rotY, Config.Cam.rotZ, Config.Cam.fov, Config.Cam.p8, Config.Cam.p9)
            SetCamActive(cam, true)
            RenderScriptCams(true, false, 1, true, true)
        elseif Config.CameraType == 'FOCUS' then
            cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
            SetCamActive(cam, true)
            RenderScriptCams(true, false, 0, true, true)
        end
    elseif action == 'focus' then
        SetCamCoord(cam, Config.Cam.posX, Config.Cam.posY, Config.Cam.posZ)
        PointCamAtEntity(cam, ped)
    end
end

function GetPedModel(model)
    if type(model) == 'number' then
        if model == 0 then
            return `mp_m_freemode_01`
        elseif model == 1 or Config.SkinScript == 'cui_character' then
            return `mp_f_freemode_01`
        elseif model > 1 then
            if SkinchangePedlist and SkinchangePedlist[model-1] then
                return CheckModel(GetHashKey(SkinchangePedlist[model-1]))
            else
                return `mp_m_freemode_01`
            end
        end
    elseif type(model) == 'string' then
        if Config.SkinScript == 'betrayed_clothing_1' or Config.SkinScript == 'betrayed_clothing_2' then
            return CheckModel(tonumber(model))
        end
    end
    return `mp_m_freemode_01`
end

function CheckModel(model)
    if IsModelInCdimage(model) and IsModelValid(model) then
        return model
    else
        return `mp_m_freemode_01`
    end
end

function CreatePeds(model, coords)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    return CreatePed(4, model, coords.x, coords.y, coords.z, coords.h, false, true)
end

function PedNatives(ped, coords, sex)
    RequestCollisionAtCoord(coords.x, coords.y, coords.z)
    while not HasCollisionLoadedAroundEntity(ped) do
        RequestCollisionAtCoord(coords.x, coords.y, coords.z)
        Citizen.Wait(1)
    end
    SetEntityAsMissionEntity(ped)
    FreezeEntityPosition(ped, true)
    SetPedSeeingRange(ped, 0.0)
    SetPedHearingRange(ped, 0.0)
    SetPedAlertness(ped, 0)
    if type(sex) == 'number' and sex > 1 then
        SetPedDefaultComponentVariation(ped)
    end
end

function ScreenFade(state)
    if state == 1 then
        DoScreenFadeOut(0)
    elseif state == 2 then
        DoScreenFadeIn(20000)
    elseif state == 3 then
        DoScreenFadeIn(1000)
    elseif state == 4 then
        DoScreenFadeOut(4000)
    elseif state == 5 then
        DoScreenFadeOut(2000)
    end
end

function PlayAnimation(ped, anim_dict, anim_name, duration)
    RequestAnimDict(anim_dict)
    while not HasAnimDictLoaded(anim_dict) do Citizen.Wait(0) end
    TaskPlayAnim(ped, anim_dict, anim_name, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(anim_dict)
end


RegisterNetEvent('cd_multicharacter:SwitchCharacterChecks')
AddEventHandler('cd_multicharacter:SwitchCharacterChecks', function()
    while not Authorised do Wait(1000) end
    if not hasChosen then
        if Config.SwitchCharacter.Command.distance_check then
            local Data = SwitchCharacter_DistanceCheck()
            if Data.InDistance then
                SwitchCharacter()
            else
                Notif(3, 'distance_check')
            end
        else
            SwitchCharacter()
        end
    end
end)


if Config.SwitchCharacter.ENABLE and Config.SwitchCharacter.KeyPress.ENABLE then
    local pausemenuopen = false
    Citizen.CreateThread(function()
        while not Authorised do Wait(1000) end
        local alreadyEnteredZone = false
        local GlobalText = nil
        while true do
            wait = 5
            local inZone = false
            local Data = SwitchCharacter_DistanceCheck()
            if Data.InDistance then
                wait = 5
                inZone = true
                GlobalText = Data.Name
                if not hasChosen then
                    if IsControlJustReleased(0, Config.SwitchCharacter.KeyPress.key) then
                        SwitchCharacter()
                        Wait(5000)
                    end
                end
                if not pausemenuopen and IsPauseMenuActive() then
                    pausemenuopen = true
                    TriggerEvent('cd_drawtextui:HideUI')
                elseif pausemenuopen and not IsPauseMenuActive() then
                    pausemenuopen = false
                    TriggerEvent('cd_drawtextui:ShowUI', 'show', GlobalText)
                end
            else
                wait = 1000
            end
            if not pausemenuopen then
                if inZone and not alreadyEnteredZone then
                    alreadyEnteredZone = true
                    TriggerEvent('cd_drawtextui:ShowUI', 'show', GlobalText)
                end
                if not inZone and alreadyEnteredZone then
                    alreadyEnteredZone = false
                    TriggerEvent('cd_drawtextui:HideUI')
                end
                GlobalText_last = GlobalText
            end
            Citizen.Wait(wait)
        end
    end)
end

function SwitchCharacter_DistanceCheck()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local inZone = false
    for cd = 1, #Config.SwitchCharacter.Locations do
        local dist = #(coords-vector3(Config.SwitchCharacter.Locations[cd].x, Config.SwitchCharacter.Locations[cd].y, Config.SwitchCharacter.Locations[cd].z))
        if dist <= Config.SwitchCharacter.Locations[cd].Dist then
            return {InDistance = true, Name = Config.SwitchCharacter.Locations[cd].Name}
        end
    end
    return {InDistance = false}
end

if Config.SwitchCharacter.ENABLE and (Config.SwitchCharacter.KeyPress.ENABLE or (Config.SwitchCharacter.Command.ENABLE and Config.SwitchCharacter.Command.distance_check)) then
    Citizen.CreateThread(function()
        while not Authorised do Wait(1000) end
        for c, d in pairs (Config.SwitchCharacter.Locations) do
            if d.EnableBlip then
                local blip = AddBlipForCoord(d.x, d.y, d.z)
                SetBlipSprite(blip, Config.SwitchCharacter.Blip.sprite)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, Config.SwitchCharacter.Blip.scale)
                SetBlipColour(blip, Config.SwitchCharacter.Blip.colour)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentSubstringPlayerName(Config.SwitchCharacter.Blip.name)
                EndTextCommandSetBlipName(blip)
            end
        end
    end)
end
