--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


ESX, IdentityLoaded = nil, false

Citizen.CreateThread(function()
    if Config.UseESX then
        while ESX == nil do
            TriggerEvent(Config.FrameworkTriggers.main, function(obj) ESX = obj end)
            Citizen.Wait(100)
        end

        RegisterNetEvent(Config.FrameworkTriggers.load)
        AddEventHandler(Config.FrameworkTriggers.load, function(xPlayer)
            ESX.PlayerData = xPlayer
            if GetResourceState('cd_multicharacter') ~= 'started' then
                Citizen.Wait(2000)
                TriggerServerEvent('cd_identity:PlayerSpawned')
            end
            if Config.IDcard.ENABLE then
                TriggerServerEvent('cd_identity:CacheIdentityData')
            end
        end)

        RegisterNetEvent(Config.FrameworkTriggers.job)
        AddEventHandler(Config.FrameworkTriggers.job, function(job)
            ESX.PlayerData.job = job
        end)

    else
        --Add your framework code here.

    end
end)


--██╗  ██╗███████╗██╗   ██╗███████╗     █████╗ ███╗   ██╗██████╗      ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔════╝    ██╔══██╗████╗  ██║██╔══██╗    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--█████╔╝ █████╗   ╚████╔╝ ███████╗    ███████║██╔██╗ ██║██║  ██║    ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██╔═██╗ ██╔══╝    ╚██╔╝  ╚════██║    ██╔══██║██║╚██╗██║██║  ██║    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--██║  ██╗███████╗   ██║   ███████║    ██║  ██║██║ ╚████║██████╔╝    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
--╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


Citizen.CreateThread(function()
    if Config.IDcard.ENABLE then
        while not Authorised and not IdentityLoaded do Wait(1000) end
        TriggerEvent('chat:addSuggestion', '/'..Config.IDcard.Usage.command_name_1, Config.IDcard.Usage.description_1)
        RegisterCommand(Config.IDcard.Usage.command_name_1, function()
            TriggerServerEvent('cd_identity:ShowIDCard_2', TakeMugshot(), ReturnClosestPlayers(Config.IDcard.Usage.distance_1, false))
        end)
        TriggerEvent('chat:addSuggestion', '/'..Config.IDcard.Usage.command_name_2, Config.IDcard.Usage.description_2)
        RegisterCommand(Config.IDcard.Usage.command_name_2, function()
            TriggerServerEvent('cd_identity:ShowIDCard_2', TakeMugshot(), ReturnClosestPlayers(Config.IDcard.Usage.distance_2, true))
        end)
    end
    if Config.EnableTestCommand then
        RegisterCommand('identitytest', function()
            TriggerEvent('cd_identity:OpenIdentityUI')
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if IDcard_showing then
            if IsControlJustReleased(0, Config.IDcard.close_key) then
                TriggerEvent('cd_identity:HideIDCard') --The event to hide the ID card.
            end
        else
            Wait(500)
        end
    end
end)


-- ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
--██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
--██║   ██║   ██║   ███████║█████╗  ██████╔╝
--██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
--╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
-- ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝


function IdentitySaved() --This function is triggered after the characters identity has been saved in the database, incase you wish to trigger additional events.
    local ped = PlayerPedId()
    SetEntityCoords(ped, Config.SpawnPosition.x, Config.SpawnPosition.y, Config.SpawnPosition.z)
    SetEntityHeading(ped, Config.SpawnPosition.w)
    if GetResourceState('cd_multicharacter') == 'started' then
        local SkinScript = exports['cd_multicharacter']:GetSkinScript()
        if SkinScript == 'esx_skin' then
            TriggerEvent('esx_skin:openSaveableMenu')

        elseif SkinScript == 'cui_character' then
            TriggerEvent('cui_character:SetPedClothes_multi', true)

        elseif SkinScript == 'betrayed_clothing_1' or SkinScript == 'betrayed_clothing_2' then
            -- TriggerServerEvent('clothing:checkIfNew')
            TriggerEvent('betrayed_skins:defaultReset')
        
        elseif SkinScript == 'other' then
            --Add your own code here.
            
        end
    end
    ------------------------------------------------------------------------------------------------------
    --Add any additional trigger events here.

    ------------------------------------------------------------------------------------------------------
end


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