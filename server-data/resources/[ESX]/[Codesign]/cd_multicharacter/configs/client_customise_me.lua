--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


SkinchangePedlist = nil

Citizen.CreateThread(function()
    ScreenFade(1)
    while true do
        Citizen.Wait(0)
        if NetworkIsSessionStarted() then
            if not IsScreenFadedOut() then ScreenFade(1) end
            ShutdownLoadingScreen()
		    ShutdownLoadingScreenNui()
            while not Authorised do Wait(0) end
            Citizen.Wait(2000)
            TriggerEvent('cd_multicharacter:Start')
            if Config.SkinScript == 'esx_skin' and GetResourceState('skinchanger') == 'started' then
                SkinchangePedlist = exports['skinchanger']:GetPedList()
            end
            if GetResourceState('spawnmanager') == 'started' then
                exports.spawnmanager:setAutoSpawn(false)
                exports.spawnmanager:forceRespawn()
            end
            break
        end
    end
end)

ESX, PlayerLoaded = nil, false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.FrameworkTriggers.main, function(obj) ESX = obj end)
        Citizen.Wait(100)
    end

    RegisterNetEvent(Config.FrameworkTriggers.load)
    AddEventHandler(Config.FrameworkTriggers.load, function(xPlayer)
        ESX.PlayerData = xPlayer
        PlayerLoaded = true
    end)

    RegisterNetEvent(Config.FrameworkTriggers.job)
    AddEventHandler(Config.FrameworkTriggers.job, function(job)
        ESX.PlayerData.job = job
    end)
end)

function InitializeESX(charid_1, charid_2)
    if Config.ESX_version == '1.1' then
        TriggerServerEvent('es:firstJoinProper', charid_1)
        TriggerEvent('es:allowedToSpawn', charid_1)
    elseif Config.ESX_version == '1.2' then
        TriggerServerEvent('esx:playerJoined', charid_1)
    elseif Config.ESX_version == '1.final' or Config.ESX_version == 'exm' then
        TriggerServerEvent('esx:onPlayerJoined', charid_1)
    elseif Config.ESX_version == 'legacy' then
        if Config.UseAdvancedMultiCharMethod then
            TriggerServerEvent('esx:onPlayerJoined', charid_1)
        else
            TriggerServerEvent('esx:onPlayerJoined')
        end
    end
end


-- ██████╗██╗  ██╗ █████╗ ██████╗  █████╗  ██████╗████████╗███████╗██████╗     ███████╗██╗  ██╗██╗███╗   ██╗
--██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗    ██╔════╝██║ ██╔╝██║████╗  ██║
--██║     ███████║███████║██████╔╝███████║██║        ██║   █████╗  ██████╔╝    ███████╗█████╔╝ ██║██╔██╗ ██║
--██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║        ██║   ██╔══╝  ██╔══██╗    ╚════██║██╔═██╗ ██║██║╚██╗██║
--╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║╚██████╗   ██║   ███████╗██║  ██║    ███████║██║  ██╗██║██║ ╚████║
-- ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝


function SpawnPeds(CharInfo, MaxChars, CharSkins)
    local self = {}

    if Config.SkinScript == 'esx_skin' or Config.SkinScript == 'cui_character' then
        for cd = 1, MaxChars do
            local model = GetPedModel(CharSkins[cd].sex)
            local coords = Config.PedSpawnCoords[cd]
            local ped = CreatePeds(model, coords)
            PedNatives(ped, coords, CharSkins[cd].sex)
            self[cd] = {}
            self[cd].ped = ped
            self[cd].CharInfo = CharInfo[cd]
            self[cd].CharSkins = CharSkins[cd]
            SetModelAsNoLongerNeeded(model)
            if CharSkins[cd] ~= 'Empty' then
                SetMultiPedSkin(ped, CharSkins[cd])
            end
        end
        return self

    elseif Config.SkinScript == 'betrayed_clothing_1' or Config.SkinScript == 'betrayed_clothing_2' then
        for cd = 1, MaxChars do
            local model = GetPedModel(CharSkins[cd]['skin'].model)
            local coords = Config.PedSpawnCoords[cd]
            local ped = CreatePeds(model, coords)
            PedNatives(ped, coords)
            self[cd] = {}
            self[cd].ped = ped
            self[cd].CharInfo = CharInfo[cd]
            self[cd].CharSkins = CharSkins[cd]
            SetModelAsNoLongerNeeded(model)
            if CharSkins[cd]['skin'].model ~= 'Empty' then
                SetMultiPedSkin(ped, CharSkins[cd])
            end
        end
        return self

    elseif Config.SkinScript == 'other' then
        --Add your own code here.

    end
end

function SetMultiPedSkin(ped, skin)
    if Config.SkinScript == 'esx_skin' then
        TriggerEvent('skinchanger:loadSkin2', ped, skin)

    elseif Config.SkinScript == 'cui_character' then
        TriggerEvent('cui_character:MultiCharSkin', ped, skin)

    elseif Config.SkinScript == 'betrayed_clothing_1' or Config.SkinScript == 'betrayed_clothing_2' then
        TriggerEvent('otherclothing:MultiCharSkin', ped, skin)

    elseif Config.SkinScript == 'other' then
        --Add your own code here.

    end
end


--███████╗██╗  ██╗██╗███████╗████████╗██╗███╗   ██╗ ██████╗      ██████╗██╗  ██╗ █████╗ ██████╗  █████╗  ██████╗████████╗███████╗██████╗ 
--██╔════╝╚██╗██╔╝██║██╔════╝╚══██╔══╝██║████╗  ██║██╔════╝     ██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗
--█████╗   ╚███╔╝ ██║███████╗   ██║   ██║██╔██╗ ██║██║  ███╗    ██║     ███████║███████║██████╔╝███████║██║        ██║   █████╗  ██████╔╝
--██╔══╝   ██╔██╗ ██║╚════██║   ██║   ██║██║╚██╗██║██║   ██║    ██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║        ██║   ██╔══╝  ██╔══██╗
--███████╗██╔╝ ██╗██║███████║   ██║   ██║██║ ╚████║╚██████╔╝    ╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║╚██████╗   ██║   ███████╗██║  ██║
--╚══════╝╚═╝  ╚═╝╚═╝╚══════╝   ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝      ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝


--This function is triggered after you choose an EXISTING character.
function CharacterHasLoaded_EXISTING(charid_1, charid_2, skin)
    InitializeESX(charid_1, charid_2)

    while not PlayerLoaded do Wait(0) end
    ResetPlayerState()

    if GetResourceState('cd_spawnselect') == 'started' then
        ------------------------------------------------------------------------------------------------------
        --Add any additional trigger events here.
        TriggerEvent('cd_spawnselect:OpenUI')

        ------------------------------------------------------------------------------------------------------
    end

    if Config.SkinScript == 'esx_skin' or Config.SkinScript == 'cui_character' then
        if skin ~= 'Empty' then
            if Config.SkinScript == 'esx_skin' then
                TriggerEvent('skinchanger:loadSkin', skin)
            elseif Config.SkinScript == 'cui_character' then
                TriggerEvent('cui_character:SetPedClothes_multi', false, skin)
            end
        else
            print('skin nil')
        end

    elseif Config.SkinScript == 'betrayed_clothing_1' or Config.SkinScript == 'betrayed_clothing_2' then
        -- TriggerServerEvent('clothing:get_character_current')
        TriggerServerEvent('clothing:checkIfNew') --You may need to try each of these. Not sure which will work for your skin script version.

    elseif Config.SkinScript == 'other' then
        --Add your own code here.

    end
    ------------------------------------------------------------------------------------------------------
    --Add any additional trigger events here.

    ------------------------------------------------------------------------------------------------------
end


--███╗   ██╗███████╗██╗    ██╗     ██████╗██╗  ██╗ █████╗ ██████╗  █████╗  ██████╗████████╗███████╗██████╗ 
--████╗  ██║██╔════╝██║    ██║    ██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗
--██╔██╗ ██║█████╗  ██║ █╗ ██║    ██║     ███████║███████║██████╔╝███████║██║        ██║   █████╗  ██████╔╝
--██║╚██╗██║██╔══╝  ██║███╗██║    ██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║        ██║   ██╔══╝  ██╔══██╗
--██║ ╚████║███████╗╚███╔███╔╝    ╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║╚██████╗   ██║   ███████╗██║  ██║
--╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝      ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝


--This function is triggered after you create a NEW character.
function CharacterHasLoaded_NEW(charid_1, charid_2)
    InitializeESX(charid_1, charid_2)

    while not PlayerLoaded do Wait(0) end
    ResetPlayerState()
    SetCoords(Config.DefaultSpawn)

    if GetResourceState('cd_identity') == 'started' then
        TriggerEvent('cd_identity:OpenIdentityUI', charid_1)
    else
        if Config.SkinScript == 'esx_skin' then
            TriggerEvent('skinchanger:ResetPlayerSkin')
            TriggerEvent('esx_skin:openSaveableMenu')

        elseif Config.SkinScript == 'cui_character' then
            TriggerEvent('cui_character:SetPedClothes_multi', true)

        elseif Config.SkinScript == 'betrayed_clothing_1' or Config.SkinScript == 'betrayed_clothing_2' then
            TriggerServerEvent('clothing:checkIfNew')
            --TriggerServerEvent('clothing:checkIfNew') --You may need to try each of these. Not sure which will work for your skin script version.

        elseif Config.SkinScript == 'other' then
            --Add your own code here.

        end
    end
    ------------------------------------------------------------------------------------------------------
    --Add any additional trigger events here.
      local player = GetPlayerServerId(PlayerId())
      TriggerServerEvent('giveStarterItems', player)
    ------------------------------------------------------------------------------------------------------
end


--███████╗██╗    ██╗██╗████████╗ ██████╗██╗  ██╗     ██████╗██╗  ██╗ █████╗ ██████╗  █████╗  ██████╗████████╗███████╗██████╗ 
--██╔════╝██║    ██║██║╚══██╔══╝██╔════╝██║  ██║    ██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗
--███████╗██║ █╗ ██║██║   ██║   ██║     ███████║    ██║     ███████║███████║██████╔╝███████║██║        ██║   █████╗  ██████╔╝
--╚════██║██║███╗██║██║   ██║   ██║     ██╔══██║    ██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║        ██║   ██╔══╝  ██╔══██╗
--███████║╚███╔███╔╝██║   ██║   ╚██████╗██║  ██║    ╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║╚██████╗   ██║   ███████╗██║  ██║
--╚══════╝ ╚══╝╚══╝ ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝


function SwitchCharacter()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local coords = {x = ESX.Math.Round(coords.x, 1), y = ESX.Math.Round(coords.y, 1), z = ESX.Math.Round(coords.z, 1), heading = ESX.Math.Round(GetEntityHeading(ped))}
    ScreenFade(1)
    ESX.UI.HUD.SetDisplay(0.0)
    PlayerLoaded = false
    DisplayHud(false)
    DisplayRadar(false)
    if Config.ESX_version == '1.1' or Config.ESX_version == 'exm' then
        TriggerServerEvent('es:updatePositions', coords.x, coords.y, coords.z)
    else
       TriggerServerEvent('esx:updateCoords', coords)
    end
    TriggerServerEvent('esx:cd_multicharacter:SwitchCharacter')
    Wait(1000)
    TriggerEvent('cd_multicharacter:Start')
end


-- ██████╗██╗  ██╗ █████╗ ████████╗     ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██╔════╝██║  ██║██╔══██╗╚══██╔══╝    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--██║     ███████║███████║   ██║       ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██║     ██╔══██║██╔══██║   ██║       ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--╚██████╗██║  ██║██║  ██║   ██║       ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
-- ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝        ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


Citizen.CreateThread(function()
    if Config.CharacterSlotCommand.ENABLE then
        TriggerEvent('chat:addSuggestion', '/'..Config.CharacterSlotCommand.chat_command, L('staff_command_1'), {{ name=L('action_1'), help=L('action_2')}, { name=L('identifier_1'), help=L('identifier_2')}})
    end
    if Config.SwitchCharacter.ENABLE and Config.SwitchCharacter.Command.ENABLE then
        TriggerEvent('chat:addSuggestion', '/'..Config.SwitchCharacter.Command.chat_command, L('switch_char_title'))
        RegisterCommand(Config.SwitchCharacter.Command.chat_command, function()
            TriggerEvent('cd_multicharacter:SwitchCharacterChecks')
        end)
    end
end)


--███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║ ╚████║╚██████╔╝   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


function Notification(notif_type, message)
    if notif_type and message then
        if Config.NotificationType.client == 'esx' then
            ESX.ShowNotification(message)

        elseif Config.NotificationType.client == 'mythic_old' then
            if notif_type == 1 then
                exports['mythic_notify']:DoCustomHudText('success', message, 10000)
            elseif notif_type == 2 then
                exports['mythic_notify']:DoCustomHudText('inform', message, 10000)
            elseif notif_type == 3 then
                exports['mythic_notify']:DoCustomHudText('error', message, 10000)
            end

        elseif Config.NotificationType.client == 'mythic_new' then
            if notif_type == 1 then
                exports['mythic_notify']:SendAlert('success', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            elseif notif_type == 2 then
                exports['mythic_notify']:SendAlert('inform', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            elseif notif_type == 3 then
                exports['mythic_notify']:SendAlert('error', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            end

        elseif Config.NotificationType.client == 'chat' then
            TriggerEvent('chatMessage', message)
            
        elseif Config.NotificationType.client == 'other' then
            --add your own notification.
            
        end
    end
end