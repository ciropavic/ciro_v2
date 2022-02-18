--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


ESX = nil
TriggerEvent(Config.FrameworkTriggers.main, function(obj) ESX = obj end)

RegisterNetEvent('giveStarterItems')
AddEventHandler('giveStarterItems', function (player)
  local ox_inventory = exports.ox_inventory
  -- local identifier = GetIdentifier(source, true)
  -- print(identifier)
  -- local query = DatabaseQuery('SELECT identifier, accounts, job, firstname, lastname, dateofbirth, sex, phone_number FROM users WHERE identifier LIKE "%'..identifier..'%"') 
  -- print(query[1].firstname)

  if ox_inventory:CanCarryItem(player, 'phone', 1) and ox_inventory:CanCarryItem(player, 'water', 5) and ox_inventory:CanCarryItem(player, 'sandwich', 1) and ox_inventory:CanCarryItem(player, 'id', 1) then
      ox_inventory:AddItem(player, 'phone', 1)
      ox_inventory:AddItem(player, 'water', 5)
      ox_inventory:AddItem(player, 'sandwich', 5)
      ox_inventory:AddItem(player, 'id', 1)
  end
end)

function GetIdentifier(source, short)
    if Config.IdentifierType == 'NULL' then
        if Config.ESX_version == '1.1' then
            for c, d in pairs(GetPlayerIdentifiers(source)) do
                if string.match(d, 'steam:') then
                    if short then
                        return d:sub(7)
                    else
                        return d
                    end
                end
            end
        elseif Config.ESX_version == '1.2' or Config.ESX_version == '1.final' or Config.ESX_version == 'exm' or Config.ESX_version == 'legacy' or Config.IdentifierType  == 'license' then
            for c, d in pairs(GetPlayerIdentifiers(source)) do
                if string.match(d, 'license:') then
                    return d:sub(9)
                end
            end
        end
    elseif Config.IdentifierType == 'steamid' then
        for c, d in pairs(GetPlayerIdentifiers(source)) do
            if string.match(d, 'steam:') then
                if short then
                    return d:sub(7)
                else
                    return d
                end
            end
        end
    elseif Config.IdentifierType == 'license' then
        for c, d in pairs(GetPlayerIdentifiers(source)) do
            if string.match(d, 'license:') then
                return d:sub(9)
            end
        end
    end
end

function CheckPerms(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local perms = xPlayer.getGroup()

    for c, d in pairs(Config.CharacterSlotCommand.Perms) do
        if perms == d then
            return true
        end
    end
    return false
end


-- ██████╗██╗  ██╗ █████╗ ██████╗  █████╗  ██████╗████████╗███████╗██████╗     ██████╗  █████╗ ████████╗ █████╗ 
--██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗    ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗
--██║     ███████║███████║██████╔╝███████║██║        ██║   █████╗  ██████╔╝    ██║  ██║███████║   ██║   ███████║
--██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║        ██║   ██╔══╝  ██╔══██╗    ██║  ██║██╔══██║   ██║   ██╔══██║
--╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║╚██████╗   ██║   ███████╗██║  ██║    ██████╔╝██║  ██║   ██║   ██║  ██║
-- ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝


local function GetID(identifier, value)
    for cd = 1, value do
        if string.match(identifier, 'Char'..tostring(cd)) then
            return cd
        end
    end
end

local function SortJobName(job_name)
    if type(job_name) == 'string' then
        if Config.JobLabels[job_name] ~= nil then
            return Config.JobLabels[job_name]
        else
            return job_name:sub(1,1):upper()..job_name:sub(2)
        end
    else
        return 'Unemployed'
    end
end

local function CheckSex(sex)
    if sex then
        local males = {'m', 'male', 'Male', 'M', 'MALE'}
        for c, d in pairs(males) do
            if string.match(sex, d) then
                return 'Male'
            end
        end

        local females = {'f', 'female', 'Female', 'F', 'FEMALE'}
        for c, d in pairs(females) do
            if string.match(sex, d) then
                return 'Female'
            end
        end

        return 'Non-Binary'
    else
        return 'Autosexual'
    end
end

function GetUserInfos(source, MultiChar)
    local identifier = GetIdentifier(source, true)
    if identifier then
        local self, Query, Accounts = {}, nil, nil
        if Config.ESX_version == '1.1' then
            Query = 'SELECT identifier, money, bank, job, firstname, lastname, dateofbirth, sex, phone_number FROM users WHERE identifier LIKE "%s"'
        elseif Config.ESX_version == '1.2' then
            Query = 'SELECT identifier, job, firstname, lastname, dateofbirth, sex, phone_number FROM users WHERE identifier LIKE "%s"'
        elseif Config.ESX_version == '1.final' or Config.ESX_version == 'exm' or Config.ESX_version == 'legacy' then
            Query = 'SELECT identifier, accounts, job, firstname, lastname, dateofbirth, sex, phone_number FROM users WHERE identifier LIKE "%s"'
        end

        local TABLE = DatabaseQuery(string.format(Query, '%'..identifier..'%'))
        if TABLE then
            table.sort(TABLE, function(c, d) return c.identifier < d.identifier end)
            
            for cd = 1, #MultiChar do
                if TABLE[cd] then
                    if TABLE[cd].identifier == MultiChar[cd]..identifier then
                        self[cd] = TABLE[cd]
                    else
                        self[GetID(TABLE[cd].identifier, #MultiChar)] = TABLE[cd]
                        if not self[cd] then
                            self[cd] = {identifier = MultiChar[cd]..identifier, firstname = 'Empty', lastname = 'Slot'} --Don't change the first and last name here.
                        end
                    end
                elseif not self[cd] then
                    self[cd] = {identifier = MultiChar[cd]..identifier, firstname = 'Empty', lastname = 'Slot'} --Don't change the first and last name here.
                end
            end

            local Vehicles = DatabaseQuery('SELECT owner FROM owned_vehicles WHERE owner LIKE "%'..identifier..'%"')
            if Config.ESX_version == '1.2' then
                Accounts = DatabaseQuery('SELECT identifier, name, money FROM user_accounts WHERE identifier LIKE "%'..identifier..'%"')
            end

            for cd = 1, #MultiChar do
                if self[cd].firstname ~= 'Empty' and self[cd].lastname ~= 'Slot' then
                    if Config.ESX_version == '1.2' then
                        if Accounts then
                            for c, d in pairs(Accounts) do
                                if MultiChar[cd]..identifier == d.identifier then
                                    if d.name == 'money' then
                                        self[cd].money = d.money
                                    elseif d.name == 'bank' then
                                        self[cd].bank = d.money
                                    end
                                end
                            end
                        end
                        
                    elseif Config.ESX_version == '1.final' or Config.ESX_version == 'exm' or Config.ESX_version == 'legacy' then
                        if self[cd].accounts then
                            local Accounts = json.decode(self[cd].accounts)
                            self[cd].money, self[cd].bank = Accounts.money, Accounts.bank
                            self[cd].accounts = nil
                        end
                    end

                    if Vehicles then
                        local count = 0
                        for c, d in pairs(Vehicles) do
                            if MultiChar[cd]..identifier == d.owner then
                                count = count+1
                            end
                            self[cd].owned_cars = count
                        end
                    end
                    
                    self[cd].money = self[cd].money or 0
                    self[cd].bank = self[cd].bank or 0
                    self[cd].job = SortJobName(self[cd].job)
                    self[cd].firstname = self[cd].firstname or ''
                    self[cd].lastname = self[cd].lastname or ''
                    self[cd].dateofbirth = self[cd].dateofbirth ~= '' and self[cd].dateofbirth or '2000-01-01'
                    self[cd].sex = CheckSex(self[cd].sex)
                    self[cd].phone_number = self[cd].phone_number or 0
                    self[cd].owned_cars = self[cd].owned_cars or 0
                end
            end
            return self
        end
    end
end


-- ██████╗██╗  ██╗ █████╗ ██████╗  █████╗  ██████╗████████╗███████╗██████╗     ███████╗██╗  ██╗██╗███╗   ██╗
--██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗    ██╔════╝██║ ██╔╝██║████╗  ██║
--██║     ███████║███████║██████╔╝███████║██║        ██║   █████╗  ██████╔╝    ███████╗█████╔╝ ██║██╔██╗ ██║
--██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║        ██║   ██╔══╝  ██╔══██╗    ╚════██║██╔═██╗ ██║██║╚██╗██║
--╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║╚██████╗   ██║   ███████╗██║  ██║    ███████║██║  ██╗██║██║ ╚████║
-- ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝


function GetSkin(source, MultiChar, MaxChars, CharInfo)
    if Config.SkinScript == 'esx_skin' or Config.SkinScript == 'cui_character' then
        GetSkin1(source, MultiChar, MaxChars, CharInfo)

    elseif Config.SkinScript == 'betrayed_clothing_1' then
        GetSkin2(source, MultiChar, MaxChars, CharInfo)

    elseif Config.SkinScript == 'betrayed_clothing_2' then
        GetSkin3(source, MultiChar, MaxChars, CharInfo)

    elseif Config.SkinScript == 'other' then
        GetSkin4(source, MultiChar, MaxChars, CharInfo)

    end
end

function GetSkin1(source, MultiChar, MaxChars, CharInfo)
    local identifier = GetIdentifier(source, true)
    local TABLE = DatabaseQuery('SELECT identifier, skin FROM users WHERE identifier LIKE "%'..identifier..'%"')
    local CharSkins = {}
    if TABLE then
        table.sort(TABLE, function(c, d) return c.identifier < d.identifier end)
        for cd = 1, #MultiChar do
            if TABLE[cd] then
                if TABLE[cd].identifier == MultiChar[cd]..identifier then
                    CharSkins[cd] = json.decode(TABLE[cd].skin) or 'Empty'
                else
                    CharSkins[GetID(TABLE[cd].identifier, #MultiChar)] = json.decode(TABLE[cd].skin) or 'Empty'
                    if not CharSkins[cd] then
                        CharSkins[cd] = 'Empty'
                    end
                end
            elseif not CharSkins[cd] then
                CharSkins[cd] = 'Empty'
            end
        end
    end
    TriggerClientEvent('cd_multicharacter:ShowCharacters', source, CharInfo, MaxChars, CharSkins)
end

function GetSkin2(source, MultiChar, MaxChars, CharInfo)
  local identifier = GetIdentifier(source, true)
  local CharSkins = {}
  for cd = 1, #MultiChar do
      CharSkins[cd] = {}
      CharSkins[cd]['skin'] = {}
      CharSkins[cd]['skin'].model = 'Empty'
      local result = DatabaseQuery('SELECT model, drawables, props, drawtextures, proptextures FROM character_current WHERE steamid="'.. MultiChar[cd]..identifier..'"')
      if result ~= nil and result[1] ~= nil then
          CharSkins[cd]['skin'] = {}
          CharSkins[cd]['skin'].model = result[1].model
          CharSkins[cd]['skin'].drawables = json.decode(result[1].drawables)
          CharSkins[cd]['skin'].props = json.decode(result[1].props)
          CharSkins[cd]['skin'].drawtextures = json.decode(result[1].drawtextures)
          CharSkins[cd]['skin'].proptextures = json.decode(result[1].proptextures)
      end
      local result = DatabaseQuery('SELECT hairColor, headBlend, headOverlay, headStructure FROM character_face WHERE steamid="'.. MultiChar[cd]..identifier..'"')
      if result ~= nil and result[1] ~= nil then
          CharSkins[cd]['face'] = {}
          CharSkins[cd]['face'].hairColor = json.decode(result[1].hairColor)
          CharSkins[cd]['face'].headBlend = json.decode(result[1].headBlend)
          CharSkins[cd]['face'].headOverlay = json.decode(result[1].headOverlay)
          CharSkins[cd]['face'].headStructure = json.decode(result[1].headStructure)
      end
      local result = DatabaseQuery('SELECT tattoos FROM playersTattoos WHERE identifier="'.. MultiChar[cd]..identifier..'"')
      if result ~= nil and result[1] ~= nil then
          CharSkins[cd]['tattoo'] = json.decode(result[1].tattoos)
      end
  end
  TriggerClientEvent('cd_multicharacter:ShowCharacters', source, CharInfo, MaxChars, CharSkins)
end

function GetSkin3(source, MultiChar, MaxChars, CharInfo)
    local identifier = GetIdentifier(source, true)
    local CharSkins = {}
    for cd = 1, #MultiChar do
        CharSkins[cd] = {}
        CharSkins[cd]['skin'] = {}
        CharSkins[cd]['skin'].model = 'Empty'
        local result = DatabaseQuery('SELECT model, drawables, props, drawtextures, proptextures, hairColor, headBlend, headOverlay, headStructure FROM users WHERE identifier="'..MultiChar[cd]..identifier..'"')
        if result and result[1] then
            CharSkins[cd]['skin'] = {}
            CharSkins[cd]['skin'].model = result[1].model
            CharSkins[cd]['skin'].drawables = json.decode(result[1].drawables)
            CharSkins[cd]['skin'].props = json.decode(result[1].props)
            CharSkins[cd]['skin'].drawtextures = json.decode(result[1].drawtextures)
            CharSkins[cd]['skin'].proptextures = json.decode(result[1].proptextures)

            CharSkins[cd]['face'] = {}
            CharSkins[cd]['face'].hairColor = json.decode(result[1].hairColor)
            CharSkins[cd]['face'].headBlend = json.decode(result[1].headBlend)
            CharSkins[cd]['face'].headOverlay = json.decode(result[1].headOverlay)
            CharSkins[cd]['face'].headStructure = json.decode(result[1].headStructure)

        end
        local result = DatabaseQuery('SELECT tattoos FROM playerstattoos WHERE identifier="'..MultiChar[cd]..identifier..'"')
        if result and result[1] then
            CharSkins[cd]['tattoo'] = json.decode(result[1].tattoos)
        end
    end
    TriggerClientEvent('cd_multicharacter:ShowCharacters', source, CharInfo, MaxChars, CharSkins)
end

function GetSkin4(source, MultiChar, MaxChars, CharInfo)
    local identifier = GetIdentifier(source, true)
    local CharSkins = {}
    for cd = 1, #MultiChar do
        --Add your own code here.
    end
    TriggerClientEvent('cd_multicharacter:ShowCharacters', source, CharInfo, MaxChars, CharSkins)
end


-- ██████╗██╗  ██╗ █████╗ ██████╗  █████╗  ██████╗████████╗███████╗██████╗     ███████╗██╗      ██████╗ ████████╗███████╗
--██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗    ██╔════╝██║     ██╔═══██╗╚══██╔══╝██╔════╝
--██║     ███████║███████║██████╔╝███████║██║        ██║   █████╗  ██████╔╝    ███████╗██║     ██║   ██║   ██║   ███████╗
--██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║        ██║   ██╔══╝  ██╔══██╗    ╚════██║██║     ██║   ██║   ██║   ╚════██║
--╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║╚██████╗   ██║   ███████╗██║  ██║    ███████║███████╗╚██████╔╝   ██║   ███████║
-- ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚══════╝╚══════╝ ╚═════╝    ╚═╝   ╚══════╝


if Config.CharacterSlotCommand.ENABLE then
    RegisterCommand(Config.CharacterSlotCommand.chat_command, function(source, args)
        local _source = source
        if CheckPerms(_source) then
            local action = args[1]
            local identifier = args[2]
            if action and identifier then
                if (string.find(identifier, 'steam:') or string.find(identifier, 'license:')) or #identifier > 4 then
                    SqlCallFunction(_source, false, action, identifier)

                else
                    local target_source = tonumber(identifier)
                    if GetPlayerName(target_source) then
                        SqlCallFunction(_source, target_source, action, GetIdentifier(target_source, false))
                    else
                        Notif(_source, 3, 'player_not_online', target_source)
                    end
                end
            else
                Notif(_source, 3, 'command_invalidformat', Config.CharacterSlotCommand.chat_command)
            end
        else
            Notif(_source, 3, 'no_permissions')
        end
    end)

    function SqlCallFunction(source, target, action, identifier)
        local Result = DatabaseQuery('SELECT max_chars FROM user_lastcharacter WHERE steamid="'..identifier..'"')
        if Result and Result[1] and Result[1].max_chars then
            local max_chars = tonumber(Result[1].max_chars)
            if action == 'check' then
                Notif(source, 2, 'charslots_check', max_chars)
            elseif action == 'add' then
                local new = max_chars+1
                DatabaseQuery('UPDATE user_lastcharacter SET max_chars="'..new..'" WHERE steamid="'..identifier..'"')
                Notif(source, 1, 'charslots_added', identifier)
                Notif(target, 1, 'charslots_recieved')
            elseif action == 'remove' then
                local new = max_chars-1
                DatabaseQuery('UPDATE user_lastcharacter SET max_chars="'..new..'" WHERE steamid="'..identifier..'"')
                Notif(source, 1, 'charslots_remove', identifier)
                Notif(target, 1, 'charslots_removed')
            end
        end
    end
end

RegisterCommand('SetAllMaxChars', function(source, args) --This will set all of your players max character amount in the database if you ever need to change them all.
    if not Authorised then return end
    if source == 0 then
        if args[1] then
            local result = tonumber(args[1])
            DatabaseQuery('UPDATE user_lastcharacter SET max_chars="'..result..'" WHERE max_chars>0')
            DatabaseQuery('ALTER TABLE user_lastcharacter ALTER COLUMN max_chars SET DEFAULT "'..result..'"')
            print('Successfully set all players max_chars to ['..result..']')
        else
            print('The 1st argument is nil. Example: SetAllMaxChars 4')--Just replace the '4' with the amount of max characters you want players to be set to.
        end
    end
end)


--██████╗  █████╗ ████████╗ █████╗ ██████╗  █████╗ ███████╗███████╗    ██████╗ ███████╗██╗      █████╗ ████████╗███████╗██████╗ 
--██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝    ██╔══██╗██╔════╝██║     ██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
--██║  ██║███████║   ██║   ███████║██████╔╝███████║███████╗█████╗      ██████╔╝█████╗  ██║     ███████║   ██║   █████╗  ██║  ██║
--██║  ██║██╔══██║   ██║   ██╔══██║██╔══██╗██╔══██║╚════██║██╔══╝      ██╔══██╗██╔══╝  ██║     ██╔══██║   ██║   ██╔══╝  ██║  ██║
--██████╔╝██║  ██║   ██║   ██║  ██║██████╔╝██║  ██║███████║███████╗    ██║  ██║███████╗███████╗██║  ██║   ██║   ███████╗██████╔╝
--╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═════╝ 


--DATABASE CLEANER.
--If you choose to use this, only use it a few times per month. This will clean the unneeded data in your database from old players (this will not wipe players data).
RegisterCommand('DatabaseCleaner', function(source)
    if not Authorised then return end
    if source == 0 then
        DatabaseQuery('DELETE FROM addon_inventory_items WHERE count = 0')
        print('DELETED addon_inventory_items')

        DatabaseQuery('DELETE FROM addon_account_data WHERE money = 0')
        print('DELETED addon_account_data')

        DatabaseQuery('DELETE FROM user_inventory WHERE count = 0')
        print('DELETED user_inventory')

        DatabaseQuery('DELETE FROM user_accounts WHERE money = 0')
        print('DELETED user_accounts')

        DatabaseQuery('DELETE FROM datastore_data WHERE data = "{}"')
        print('DELETED datastore_data')
    end
end)

Citizen.CreateThread(function()
    while not Authorised do Wait(1000) end

    --AUTOMATICALLY SET COLUMN LENGTH. 
    local DatabaseName = DatabaseQuery('SELECT database()')[1]['database()']
    local self = DatabaseQuery('SELECT character_maximum_length, table_name, column_name FROM information_schema.columns WHERE table_schema = "'..DatabaseName..'" AND (column_name = "identifier" OR column_name = "owner")')
    for c, d in pairs(self) do
        if type(d.character_maximum_length)== 'number' and d.character_maximum_length < 50 then
            DatabaseQuery('ALTER TABLE '..d.table_name..' MODIFY COLUMN '..d.column_name..' VARCHAR(50)')
            print(string.format('^2%s^0/^2%s ^3Automatically changing column length ^0Table Name:^2 %s ^0Column Name:^2 %s^0', c, #self, d.table_name, d.column_name))
        end
    end

    --AUTOMATICALLY UPDATE DEFAULT CHARACTER VALUE. 
    local self = DatabaseQuery('SELECT column_default FROM information_schema.columns WHERE table_schema = "'..DatabaseName..'" AND (table_name = "user_lastcharacter" AND column_name = "max_chars")')
    if Config.DefaultCharAmount ~= tonumber(self[1].column_default) then
        DatabaseQuery('ALTER TABLE user_lastcharacter ALTER max_chars SET DEFAULT '..Config.DefaultCharAmount)
        print(string.format('^3Automatically changing [user_lastcharacter.max_chars] default_value to ^2[%s]^0', Config.DefaultCharAmount))
    end
end)

--ADVANCED MULTICHARACTER METHOD INSTALLATION COMMAND.
RegisterCommand('AdvancedMultichar', function(source)
    if not Authorised then return end
    if source == 0 then
        local user_lastcharacter = DatabaseQuery('SELECT steamid, charid FROM user_lastcharacter')
        for c, d in pairs(user_lastcharacter) do
            if d.steamid and d.charid then
                local new_id = GetCharID(d.steamid, d.charid)
                for cc, dd in pairs(Config.DatabaseTables) do
                    if Config.BlacklistedDatabaseTables[dd.table_name] == nil then
                        DatabaseQuery('UPDATE '..dd.table_name..' SET '..dd.column_name..'="'..new_id..'" WHERE '..dd.column_name..'="'..d.steamid..'"')
                        print(string.format('^2%s^0 ^2%s^0/^2%s ^3Automatically updating identifier ^0Table Name: ^2%s^0 Column Name: ^2%s^0', d.steamid, cc, #Config.DatabaseTables, dd.table_name, dd.column_name))
                    end
                end
            end
        end
    end
end)


--███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║ ╚████║╚██████╔╝   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


function Notification(source, notif_type, message)
    if notif_type and message then
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
