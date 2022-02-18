--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


ESX = nil
if Config.UseESX then
    TriggerEvent(Config.FrameworkTriggers.main, function(obj) ESX = obj end)
end

RegisterServerEvent('cd_identity:PlayerSpawned')
AddEventHandler('cd_identity:PlayerSpawned', function()
    local _source = source
    local Result = GetCharacterData(_source)
    if not Result or (not Result.firstname and not Result.lastname) or (#Result.firstname == 0 or #Result.lastname == 0) then
        TriggerClientEvent('cd_identity:OpenIdentityUI', _source)
    else
        TriggerClientEvent('cd_spawnselect:OpenUI', _source)
        SetCharacterName(_source, Result)
        ------------------------------------------------------------------------------------------------------
        --Add any additional trigger events here.

        ------------------------------------------------------------------------------------------------------
    end
end)

function GetIdentifier(source)
    if Config.UseESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.identifier
    else
        --return your identifier here (string).
    end
end

function GetCharacterData(source)
    if Config.UseESX then
        local Result = DatabaseQuery('SELECT firstname, lastname, dateofbirth, sex, cd_identity FROM users WHERE identifier="'..GetIdentifier(source)..'"')
        if Result or Result[1] then
            return Result[1]
        else
            return nil
        end
    else
        --return your characters info here (table).
    end
end

function SetCharacterName(source, data) --With this you can call "xPlayer.getName()" to return the players character name instead of the unoptimised way by fetching from the database ever time you need to use it.
    if Config.UseESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.setName(('%s %s'):format(data.firstname, data.lastname))
        xPlayer.set('firstName', data.firstname)
        xPlayer.set('lastName', data.lastname)
    else
        --Add your non esx code here if you need to. This is optional tho as most likely you wont need to use this for non esx servers.
    end
end


--██████╗ ███████╗ ██████╗ ██╗███████╗████████╗███████╗██████╗      ██████╗██╗  ██╗ █████╗ ██████╗  █████╗  ██████╗████████╗███████╗██████╗ 
--██╔══██╗██╔════╝██╔════╝ ██║██╔════╝╚══██╔══╝██╔════╝██╔══██╗    ██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗
--██████╔╝█████╗  ██║  ███╗██║███████╗   ██║   █████╗  ██████╔╝    ██║     ███████║███████║██████╔╝███████║██║        ██║   █████╗  ██████╔╝
--██╔══██╗██╔══╝  ██║   ██║██║╚════██║   ██║   ██╔══╝  ██╔══██╗    ██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║        ██║   ██╔══╝  ██╔══██╗
--██║  ██║███████╗╚██████╔╝██║███████║   ██║   ███████╗██║  ██║    ╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║╚██████╗   ██║   ███████╗██║  ██║
--╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝


function RegisterCharacter(source, data)
    local identifier = GetIdentifier(source)
    if Config.UseESX then
        DatabaseQuery('UPDATE users SET firstname=@firstname, lastname=@lastname, dateofbirth=@dateofbirth, sex=@sex, cd_identity=@cd_identity WHERE identifier=@identifier', {
            ['@identifier'] = identifier,
            ['@firstname'] = data.firstname,
            ['@lastname'] = data.lastname,
            ['@dateofbirth'] = data.dateofbirth,
            ['@sex'] = data.sex,
            ['@cd_identity'] = json.encode({nationality = data.nationality, placeofbirth = data.placeofbirth, dateofissue = data.dateofissue, dateofexpiry = data.dateofexpiry}),
        })
        CacheIdentityData(source, data)
    else
        --Add your non esx code here to update your database with the newly created character info.
    end

    ------------------------------------------------------------------------------------------------------
    --Add any additional trigger events here.

    ------------------------------------------------------------------------------------------------------
end


--██╗██████╗ ███████╗███╗   ██╗████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗     ██████╗ █████╗ ██████╗ ██████╗ 
--██║██╔══██╗██╔════╝████╗  ██║╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔════╝██╔══██╗██╔══██╗██╔══██╗
--██║██║  ██║█████╗  ██╔██╗ ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║    ██║     ███████║██████╔╝██║  ██║
--██║██║  ██║██╔══╝  ██║╚██╗██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║    ██║     ██╔══██║██╔══██╗██║  ██║
--██║██████╔╝███████╗██║ ╚████║   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║    ╚██████╗██║  ██║██║  ██║██████╔╝
--╚═╝╚═════╝ ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ 


if Config.IDcard.ENABLE and Config.IDcard.Usage.item then
    if Config.UseESX then
        ESX.RegisterUsableItem(Config.IDcard.Usage.item_name, function(source)
            local _source = source
            TriggerClientEvent('cd_identity:ShowIDCard_1', _source)
        end)

    else
        --Add your non esx useable item code here.
    end
end

function CheckItemCount(source)
    if Config.UseESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        local count = xPlayer.getInventoryItem(Config.IDcard.Usage.item_name).count
        if count > 0 then
            return true
        else
            return false
        end

    else
        --Add your non esx item check code here. (boolean)
    end
end

function GetLicenses(source)
    if Config.UseESX then
        local t = {}
        local Result = DatabaseQuery('SELECT type FROM user_licenses WHERE owner="'..GetIdentifier(source)..'"')
        if Result and Result[1] then
            for c, d in pairs(Result) do
                table.insert(t, GetESXLicenseLabel(d.type))
            end
            return t
        end
    else
        --Add your non esx code to get a player's licenses here. (table)
    end
end

function GetESXLicenseLabel(name)
    if Config.IDcard.ESX_LicenseLabels[name] ~= nil then
        return Config.IDcard.ESX_LicenseLabels[name]
    else
        return name
    end
end


--███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║ ╚████║╚██████╔╝   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


function Notification(source, notif_type, message)
    if source and notif_type and message then
        if Config.NotificationType.client == 'esx' then
            TriggerClientEvent('esx:showNotification', source, message)
        
        elseif Config.NotificationType.client == 'mythic_old' then
            if notif_type == 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert:custom', source, { type = 'success', text = message, length = 10000})
            elseif notif_type == 2 then
                TriggerClientEvent('mythic_notify:client:SendAlert:custom', source, { type = 'inform', text = message, length = 10000})
            elseif notif_type == 3 then
                TriggerClientEvent('mythic_notify:client:SendAlert:custom', source, { type = 'error', text = message, length = 10000})
            end

        elseif Config.NotificationType.client == 'mythic_new' then
            if notif_type == 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = message, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
            elseif notif_type == 2 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = message, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
            elseif notif_type == 3 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = message, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
            end

        elseif Config.NotificationType.client == 'chat' then
                TriggerClientEvent('chatMessage', source, message)

        elseif Config.NotificationType.client == 'other' then
            --add your own notification.

        end
    end
end