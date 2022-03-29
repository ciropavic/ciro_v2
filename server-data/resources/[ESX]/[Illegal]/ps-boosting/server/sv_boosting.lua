--BLIPS SYSTEM INFINITY

BoostingBlipsSystem = {
    ActivePlayers = {},
}

function BoostingBlipsSystem:BoostingThread() 
    Citizen.CreateThread(function()
        while true do 
            Citizen.Wait(5000)
            local ped = nil
            for k, v in pairs(self.ActivePlayers) do
                ped = GetPlayerPed(k)
                local veh = GetVehiclePedIsIn(ped)
                self.ActivePlayers[k].coords = GetEntityCoords(veh)
            end
            TriggerClientEvent("boosting:updateBlips", -1, self.ActivePlayers)
        end
    end)
end

function BoostingBlipsSystem:AddSrc(src)
    self.ActivePlayers[src] = {}
end

function BoostingBlipsSystem:RemoveSrc(src)
    self.ActivePlayers[src] = nil
    TriggerClientEvent("boosting:RemoveBlip", -1, src)
end

RegisterCommand("addme", function(source)
    BoostingBlipsSystem:AddSrc(source)
end)
BoostingBlipsSystem:BoostingThread()

RegisterNetEvent("Boosting:AddBlipsSystem")
AddEventHandler("Boosting:AddBlipsSystem" , function()
    BoostingBlipsSystem:AddSrc(source)
end)

RegisterNetEvent("Boosting:RemoveBlipsSystem")
AddEventHandler("Boosting:RemoveBlipsSystem" , function()
    BoostingBlipsSystem:RemoveSrc(source)
end)

RegisterNetEvent("boosting:coop")
AddEventHandler("boosting:coop" , function(src)
    BoostingBlipsSystem:RemoveSrc(src)
end)

AddEventHandler("playerDropped",function(reason)
    BoostingBlipsSystem:RemoveSrc(source)
end)

--BLIPS SYSTEM INFINITY
local isInContract = false

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------FUNCTIONS------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if not Config.OldVersion then
DatabaseQuery = function(query, parameters)
    if Config.Database == 'ghmattimysql' then
        local result = exports.ghmattimysql:executeSync(query, parameters)
        return result
    elseif Config.Database == 'oxmysql' then
        if string.find(query, "SELECT") then
            local result = MySQL.query.await(query, parameters)
            return result
        elseif string.find(query, "INSERT") then
            MySQL.insert(query, parameters)
        else
            MySQL.update(query, parameters)
        end
    end
end
end

function AddContractToDB(data)
    DatabaseQuery('INSERT INTO `boosting` (`identifier`, `vehicle`, `vehicleName`, `type`, `owner`, `expires`, `units`, `coords`) VALUES (@identifier, @vehicle, @vehicleName, @type, @owner, @expires, @units, @coords)', {
        ['@identifier'] = data.identifier,
        ['@vehicle'] = data.vehicle,
        ['@vehicleName'] = data.vehicleName,
        ['@type'] = data.type,
        ['@owner'] = data.owner,
        ['@expires'] = data.expires,
        ['@units'] = data.units,
        ['@coords'] = json.encode({x = data.coords[1], y = data.coords[2], z = data.coords[3]}),
    })
end

function RemoveContractToDB(data)
    DatabaseQuery('DELETE FROM `boosting` WHERE `identifier` = @identifier AND `vehicle` = @vehicle AND `id` = @id' , {
        ['@identifier'] = data.props.identifier,
        ['@vehicle'] = data.props.vehicle,
        ['@id'] = data.props.id
    })
end

function GetContractToDB(identifier)
    local query = DatabaseQuery('SELECT * FROM `boosting` WHERE `identifier` = @identifier', {
        ['@identifier'] = identifier
    })
    return query
end

function GetContractByIDToDB(id)
    local query = DatabaseQuery('SELECT * FROM `boosting` WHERE `id` = @id', {
        ['@id'] = id
    })
    return query[1]
end

function RemoveContractByIDToDB(id)
    DatabaseQuery('DELETE FROM `boosting` WHERE `id` = @id', {
        ['@id'] = id
    })
end

function InitBoostingUser(src)
    local user = GetIdentifier(src)
    local query = DatabaseQuery('SELECT * FROM `boosting_users` WHERE `identifier` = @identifier', {
        ['@identifier'] = user
    })
    if query[1] ~= nil then
        if query[1].identifier == user then
            TriggerClientEvent("boosting:setlevel", src, query[1].level, query[1].gne)
        else
            DatabaseQuery('INSERT INTO `boosting_users` (`identifier`, `level`, `gne`) VALUES (@identifier, @level, @gne)', {
                ['@identifier'] = user,
                ['@level'] = 0,
                ['@gne'] = 0,
                ['@cooldown'] = 0,
            })
            TriggerClientEvent("boosting:setlevel", src, 0)
        end
    else
        DatabaseQuery('INSERT INTO `boosting_users` (`identifier`, `level`, `gne`) VALUES (@identifier, @level, @gne)', {
            ['@identifier'] = user,
            ['@level'] = 0,
            ['@gne'] = 0,
            ['@cooldown'] = 0,
        })
        TriggerClientEvent("boosting:setlevel", src, 0, 0)
    end
end

function GetGNE(identifier)
    local query = DatabaseQuery('SELECT * FROM `boosting_users` WHERE `identifier` = @identifier', {
        ['@identifier'] = identifier
    })
    return query[1]
end

function SetLevel(identifier, newvalue)
    local query = DatabaseQuery('UPDATE boosting_users SET level = @level WHERE identifier = @identifier', {
        ['@identifier'] = identifier,
        ['level'] = newvalue
    })
end

function SetGNE(identifier, newvalue)
    local query = DatabaseQuery('UPDATE boosting_users SET gne = @gne WHERE identifier = @identifier', {
        ['@identifier'] = identifier,
        ['gne'] = newvalue
    })
end

function getlatestID()
    local query = DatabaseQuery('SELECT * FROM boosting WHERE id=(SELECT max(id) FROM boosting)', {})
    return query
end

function PlayerTransferContract(src, props, posible)
    if posible then
        local SendContracInformation2 = {id= props.id, identifier = GetIdentifier(src), vehicle = props.vehicle, type = props.type, owner = props.owner, expires = props.expires, units = props.units, coords = props.coords}
        local msg = {msg = Config.Locale.ReceivedTransferedContract, time = time, app = 'Boosting', img = 'https://imgur.com/FEPqpLc.png'}
        TriggerClientEvent("boosting:CreateContractFromServer", src, SendContracInformation2, msg)
        DatabaseQuery('DELETE FROM `boosting` WHERE `identifier` = @identifier AND `vehicle` = @vehicle AND `id` = @id' , {
            ['@identifier'] = props.identifier,
            ['@vehicle'] = props.vehicle,
            ['@id'] = props.id
        })
        DatabaseQuery('INSERT INTO `boosting` (`identifier`, `vehicle`, `vehicleName`, `type`, `owner`, `expires`, `units`, `coords`) VALUES (@identifier, @vehicle, @vehicleName, @type, @owner, @expires, @units, @coords)', {
            ['@identifier'] = GetIdentifier(src),
            ['@vehicle'] = props.vehicle,
            ['@vehicleName'] = props.vehicleName,
            ['@type'] = props.type,
            ['@owner'] = props.owner,
            ['@expires'] = props.expires,
            ['@units'] = props.units,
            ['@coords'] = json.encode({x = props.coords.x, y = props.coords.y, z = props.coords.z}),
        })
    else
        local SendContracInformation2 = {id= props.id, identifier = GetIdentifier(src), vehicle = props.vehicle, type = props.type, owner = props.owner, expires = props.expires, units = props.units, coords = props.coords}
        local msg = {msg = Config.Locale.NotTransferContract, time = time, app = 'Boosting', img = 'https://imgur.com/FEPqpLc.png'}
        TriggerClientEvent("boosting:CreateContractFromServer", src, SendContracInformation2, msg)
    end
end


function CoolDownFunctions(src)
    local time = DatabaseQuery('SELECT * FROM `boosting_users` WHERE `identifier` = @identifier', {['@identifier'] = GetIdentifier(src)})
    local result = time[1].cooldown
    if (os.time() - result) < Config.VinCoolDown * 60 and result ~= 0 then
        local seconds = Config.VinCoolDown * 60 - (os.time() - result)
        return {CoolDown = false, minutes = math.floor(seconds / 60)}
    else
        DatabaseQuery('UPDATE boosting_users SET cooldown = @cooldown WHERE identifier = @identifier', {
            ['@identifier'] = GetIdentifier(src),
            ['@cooldown'] = os.time()
        })
        return {CoolDown = true, minutes = 0}
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------HANDLERS-------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function filterContract(number)
    local boomer = tonumber(number)
    randomChance = math.random(1, 100)
    if boomer >= 0 and boomer <= 100 then
        return Config.BoostingContracts["D"][math.random(1, Config.NumberOfContracts.D)] 
    elseif boomer >= 100 and boomer <= 200 then
        if randomChance >= 1 and randomChance <= 74 then
            return Config.BoostingContracts["C"][math.random(1, Config.NumberOfContracts.C)]
        elseif randomChance >= 75 and randomChance <= 100 then
            return Config.BoostingContracts["D"][math.random(1, Config.NumberOfContracts.D)]
        end
    elseif boomer >= 200 and boomer <= 300 then
        if randomChance >= 1 and randomChance <= 33 then
            return Config.BoostingContracts["B"][math.random(1, Config.NumberOfContracts.B)]
        elseif randomChance >= 34 and randomChance <= 66 then
            return Config.BoostingContracts["C"][math.random(1, Config.NumberOfContracts.C)]
        elseif randomChance >= 67 and randomChance <= 100 then
            return Config.BoostingContracts["D"][math.random(1, Config.NumberOfContracts.D)]
        end
    elseif boomer >= 200 and boomer <= 400 then
        if randomChance >= 1 and randomChance <= 25 then
            return Config.BoostingContracts["A"][math.random(1, Config.NumberOfContracts.A)]
        elseif randomChance >= 26 and randomChance <= 65 then
            return Config.BoostingContracts["B"][math.random(1, Config.NumberOfContracts.B)]
        elseif randomChance >= 66 and randomChance <= 100 then
            return Config.BoostingContracts["C"][math.random(1, Config.NumberOfContracts.C)]
        end
    elseif boomer >= 200 and boomer <= 500 then
        if randomChance >= 1 and randomChance <= 15 then
            return Config.BoostingContracts["S"][math.random(1, Config.NumberOfContracts.S)]
        elseif randomChance >= 16 and randomChance <= 35 then
            return Config.BoostingContracts["A"][math.random(1, Config.NumberOfContracts.A)]
        elseif randomChance >= 36 and randomChance <= 69 then
            return Config.BoostingContracts["B"][math.random(1, Config.NumberOfContracts.B)]
        elseif randomChance >= 70 and randomChance <= 100 then
            return Config.BoostingContracts["C"][math.random(1, Config.NumberOfContracts.C)]
        end
    else 
        if randomChance >= 1 and randomChance <= 10 then
            return Config.BoostingContracts["S+"][math.random(1, Config.NumberOfContracts.SPLUS)]
        elseif randomChance >= 11 and randomChance <= 25 then
            return Config.BoostingContracts["S"][math.random(1, Config.NumberOfContracts.S)]
        elseif randomChance >= 26 and randomChance <= 69 then
            return Config.BoostingContracts["A"][math.random(1, Config.NumberOfContracts.A)]
        elseif randomChance >= 70 and randomChance <= 100 then
            return Config.BoostingContracts["B"][math.random(1, Config.NumberOfContracts.B)]
        end
    end
end

RegisterNetEvent("boosting:IsInContract")
AddEventHandler("boosting:IsInContract" , function(Bool)
 isInContract = Bool
end)

RegisterNetEvent("boosting:CreateContract")
AddEventHandler("boosting:CreateContract" , function(time)
    local src = source
    local identifier = GetIdentifier(src)
    local contracts = filterContract(GetGNE(identifier).level)
    local ContractsCoords = Config.BoostinSpawnLocations[math.random(1, Config.NumberBoostingLocations)]
    local SendContracInformation = {identifier = GetIdentifier(src), vehicle = contracts.vehicle, vehicleName = contracts.vehicleName, type = contracts.type, owner = contracts.owner, expires = contracts.expires, units = contracts.units, coords = ContractsCoords.coords}
    AddContractToDB(SendContracInformation)
    Citizen.Wait(1000)
    local id = getlatestID()[1]
    local SendContracInformation2 = {id= id.id,identifier = GetIdentifier(src), vehicle = contracts.vehicle, vehicleName = contracts.vehicleName, type = contracts.type, owner = contracts.owner, expires = contracts.expires, units = contracts.units, coords = ContractsCoords.coords}
    local msg = {msg = Config.Locale.ReceivedContract, time = time, app = 'Boosting', img = 'https://imgur.com/FEPqpLc.png'}
    TriggerClientEvent("boosting:CreateContractFromServer", src, SendContracInformation2, msg)
end)


RegisterNetEvent("boosting:CancelContract")
AddEventHandler("boosting:CancelContract" , function(data)
    RemoveContractToDB(data)
end)

RegisterNetEvent("boosting:completeNormalContract")
AddEventHandler("boosting:completeNormalContract" , function(id)
    local src = source
    local identifier = GetIdentifier(src)
    local query = GetContractByIDToDB(id)
    local gnes = GetGNE(identifier)
    local level = gnes.level
    local newgnes = gnes.gne + query.units
    Citizen.Wait(1000)
    SetGNE(identifier, newgnes)
    SetLevel(identifier, level + Config.XpGain)
    TriggerClientEvent("boosting:setlevel", src, level + Config.XpGain, newgnes)
    RemoveContractByIDToDB(id)
end)

RegisterNetEvent("boosting:completeVinContract")
AddEventHandler("boosting:completeVinContract" , function(id, plate, prop)
    local src = source
    local identifier = GetIdentifier(src)
    local query = GetContractByIDToDB(id)
    local gnes = GetGNE(identifier)
    local toRemove = query.units + Config.ExtraVinGne
    Citizen.Wait(1000)
    AddVehicleToGarage(src, query.vehicle, plate, prop)
    local newgnes = gnes.gne - toRemove
    SetGNE(identifier, newgnes)
    SetLevel(identifier, gnes.level + Config.XpGain)
    TriggerClientEvent("boosting:setlevel", src, gnes.level, newgnes)
    RemoveContractByIDToDB(id)
end)

RegisterNetEvent("boosting:TransferContract")
AddEventHandler("boosting:TransferContract" , function(data)
    -- print(json.encode(data))
    local props = data.props
    local TransferID = data.imputValue
    GetTransferSource(source, props, TransferID)
end)

RegisterNetEvent("boosting:playerSpawned")
AddEventHandler("boosting:playerSpawned" , function()
    local src = source
    local query = GetContractToDB(GetIdentifier(src))
    InitBoostingUser(src)
    for k, v in pairs(query) do
        if v.id ~= nil and v.identifier ~= nil and v.vehicle ~= nil then
            local coords = json.decode(v.coords) or {x = 0, y = 0, z = 0}
            local SendContracInformation = {id = v.id, identifier = v.identifier, vehicle = v.vehicle, vehicleName = v.vehicleName, type = v.type, owner = v.owner, expires = v.expires, units = v.units, coords = vector3(coords.x, coords.y, coords.z)}
            local msg = {msg = Config.Locale.ReceivedContract, time = time}
            TriggerClientEvent("boosting:CreateContractFromServer2", src, SendContracInformation, msg)
        end
    end
end)

RegisterNetEvent("boostingQB:playerSpawned")
AddEventHandler("boostingQB:playerSpawned" , function(source)
    local src = source
    local query = GetContractToDB(GetIdentifier(src))
    TriggerClientEvent("boosting:qbSpawn", src)
    InitBoostingUser(src)
    for k, v in pairs(query) do
        if v.id ~= nil and v.identifier ~= nil and v.vehicle ~= nil then
            local coords = json.decode(v.coords) or {x = 0, y = 0, z = 0}
            local SendContracInformation = {id = v.id, identifier = v.identifier, vehicle = v.vehicle, vehicleName = v.vehicleName, type = v.type, owner = v.owner, expires = v.expires, units = v.units, coords = vector3(coords.x, coords.y, coords.z)}
            local msg = {msg = Config.Locale.ReceivedContract, time = time}
            TriggerClientEvent("boosting:CreateContractFromServer2", src, SendContracInformation, msg)
        end
    end
end)

RegisterNetEvent("update:boostings")
AddEventHandler("update:boostings" , function()
    local src = source
    if src ~= nil then
        local rows = DatabaseQuery('SELECT * FROM boosting WHERE `identifier` = @identifier', {
            ['@identifier'] = GetIdentifier(src)
        })
        for k, v in pairs(rows) do
            TriggerClientEvent("boosting:updateTime", src, v.id, v.expires)
        end
    end
end)



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------DEBUG----------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

if Config.Debug then

end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------THREADS----------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Citizen.CreateThread(function()
--    while true do
--        Citizen.Wait(60*1000)
--        local rows = DatabaseQuery('SELECT * FROM boosting', {})
--        for _,v in pairs(rows)do
--            if tonumber(v.expires) >= 1 then
--              DatabaseQuery('UPDATE boosting SET expires = @expires', {['@expires'] = v.expires -1})
--            else
--              DatabaseQuery('DELETE FROM `boosting` WHERE `expires` = @expires', {
--                  ['@expires'] = 0
--              })
--            end
--        end
--    end
--end)