FRAMEWORK = GetResourceMetadata(GetCurrentResourceName(), "framework")
QBCore = {}
ESX = {}
-- print('Defined framework: ', FRAMEWORK)
CreateThread(function()
	DetectFramework()
end)

local func = {
	['UpdateVehicleProps'] = {
		['qb-core'] = function(vehicleProps)
			if vehicleProps.plate == nil then return end
		
			exports.oxmysql:execute('UPDATE player_vehicles SET `mods` = @mods WHERE plate = @plate', {
				['@plate'] = vehicleProps.plate,
				['@mods'] = json.encode(vehicleProps)
			})
		end,
		['esx'] = function(vehicleProps)
			if vehicleProps.plate == nil then return end
		
			MySQL.Async.execute('UPDATE owned_vehicles SET `vehicle` = @vehicle WHERE plate = @plate', {
				['@stored'] = state,
				['@plate'] = vehicleProps.plate,
				['@vehicle'] = json.encode(vehicleProps)
			})
		end 
	},
	['GetVehiclePrice'] = {
		['qb-core'] = function(modelName)
			local startTime = os.nanotime()
			for k,v in pairs(QBCore.Shared.Vehicles) do
				if v.hash == modelName then
					--print('took', (os.nanotime() - startTime) / 1000, "ms to fetch vehicle price")
					return v.price
				end
			end
			
			return 0
		end,
		['esx'] = function(modelName)
			local startTime = os.nanotime()
			local p = promise.new()
		
			MySQL.Async.fetchAll('SELECT * FROM vehicles', {
				['@vehicle'] = modelName
			}, function(result)
				---print("checking ", #result, "results")
				for i = 1, #result do
					if GetHashKey(result[i].model) == modelName then
						---print('took', (os.nanotime() - startTime) / 1000, "ms to fetch vehicle price")
						return p:resolve(math.ceil(tonumber(result[i].price)))
					end
				end
				
				return p:resolve(0)
			end)
			
			return Citizen.Await(p)
		end 
	},
	['GetPlayerJob'] = {
		['qb-core'] = function(source)
			local Player = QBCore.Functions.GetPlayer(source)
			return Player.PlayerData.job.name
		end,
		['esx'] = function(source)
			local Player = ESX.GetPlayerFromId(source)
			return Player.job.name
		end 
	}
} 

local callbacks = {
	['qb-core'] = {
		function()
			QBCore.Functions.CreateCallback('d-lscustom:server:getVehiclePrice', function(source, cb, modelName)
				cb(func['GetVehiclePrice'][FRAMEWORK](modelName) * GetShopPriceRatio(source, GetClosestShop(source)))
			end)
		end,
		function()
			QBCore.Functions.CreateCallback('d-lscustom:server:purchaseMod', function(source, cb, modelName, vehicleProps, modId, id)
				local Player = QBCore.Functions.GetPlayer(source)
				local modPrice
				if modId == "stance" then
					
				else
					local vehiclePrice = func['GetVehiclePrice'][FRAMEWORK](modelName) * GetShopPriceRatio(source, GetClosestShop(source))
					local modPriceRatio = 0.01
					if Config.priceRatios[modId] ~= nil then
						if type(Config.priceRatios[modId]) == "table" then
							modPriceRatio = Config.priceRatios[modId][id]
						else
							modPriceRatio = Config.priceRatios[modId]
						end
					end
					modPrice = math.ceil(vehiclePrice * modPriceRatio)
				end
			
				if modPrice then
					if Config.society.enable then
						local societyBalance = exports['qb-bossmenu']:GetAccount('mechanic')
						if societyBalance >= modPrice then
							TriggerEvent('qb-bossmenu:server:removeAccountMoney', 'mechanic', tonumber(modPrice))
							func['UpdateVehicleProps'][FRAMEWORK](vehicleProps)
							if Config.society.enableSavings then
								TriggerEvent("qb-bossmenu:server:addAccountMoney", "mechanic", tonumber(modPrice) * (Config.society.ratio or 1.0))
							end
							cb('success')
						else
							TriggerClientEvent('QBCore:Notify', source, 'Not enough cash in society account', 'error', 5000)
							cb('error')
						end
					else
						if Player.Functions.GetMoney('cash') >= modPrice then
							Player.Functions.RemoveMoney('cash', tonumber(modPrice), 'lscustoms')
							func['UpdateVehicleProps'][FRAMEWORK](vehicleProps)
							if Config.society.enableSavings then
								TriggerEvent("qb-bossmenu:server:addAccountMoney", "mechanic", tonumber(modPrice) * (Config.society.ratio or 1.0))
							end
							cb('success')
						else
							TriggerClientEvent('QBCore:Notify', source, 'Not enough cash in the wallet', 'error', 5000)
							cb('error')
						end
					end
				else
					func['UpdateVehicleProps'][FRAMEWORK](vehicleProps)
					cb('success')
				end
			end)
		end
	},
	['esx'] = {
		function()
			ESX.RegisterServerCallback('d-lscustom:server:purchaseMod', function(source, cb, modelName, vehicleProps, modId, id)
				local xPlayer = ESX.GetPlayerFromId(source)
				local vehiclePrice = func['GetVehiclePrice'][FRAMEWORK](modelName) * GetShopPriceRatio(source, GetClosestShop(source))
				local modPrice

				if modId == "stance" then

				else
					local modPriceRatio = 0.01
					if Config.priceRatios[modId] ~= nil then
						if type(Config.priceRatios[modId]) == "table" then
							modPriceRatio = Config.priceRatios[modId][id]
						else
							modPriceRatio = Config.priceRatios[modId]
						end
					end
					modPrice = math.ceil(vehiclePrice * modPriceRatio)
				end

				if modPrice then
					if Config.society.enable then
						local societyAccount = promise:new()
						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
							promise:resolve(account)
						end)
						Citizen.Await(societyAccount)
						if societyAccount.money >= modPrice then
							societyAccount.removeMoney(tonumber(modPrice))
							---TriggerEvent('qb-bossmenu:server:removeAccountMoney', 'mechanic', tonumber(modPrice))
							func['UpdateVehicleProps'][FRAMEWORK](vehicleProps)
							if Config.society.enableSavings then
								societyAccount.addMoney(tonumber(modPrice) * (Config.society.ratio or 1.0))
							end
							cb('success')
						else
							TriggerClientEvent('esx:showNotification', source, 'Not enough cash in the wallet')
							cb('error')
						end
					else
						if xPlayer.getMoney() >= modPrice then
							xPlayer.removeMoney(tonumber(modPrice))
							func['UpdateVehicleProps'][FRAMEWORK](vehicleProps)

							if Config.society.enableSavings then
								TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
									account.addMoney(tonumber(modPrice) * (Config.society.ratio or 1.0))
								end)
							end
							
							cb('success')
						else
							TriggerClientEvent('esx:showNotification', source, 'Not enough cash in the wallet')
							cb('error')
						end
					end
				else
					func['UpdateVehicleProps'][FRAMEWORK](vehicleProps)
					cb('success')
				end
			end)
		end,
		function()
			ESX.RegisterServerCallback('d-lscustom:server:getVehiclePrice', function(source, cb, modelName)
				cb(func['GetVehiclePrice'][FRAMEWORK](modelName) * GetShopPriceRatio(source, GetClosestShop(source)))
			end)
		end
	}
}

function GetClosestShop(player)
	local playerPed = GetPlayerPed(player)
	local coords = GetEntityCoords(playerPed)
	local closest = 1
	for i = 1, #Config.shops do
		if #(coords - Config.shops[i].coords) < #(coords - Config.shops[closest].coords) then
			closest = i
		end
	end
	return closest
end

function GetShopPriceRatio(player, index)
	local job = func['GetPlayerJob'][FRAMEWORK](player)
	if Config.shops[index].jobPrices[job] ~= nil then
		return Config.shops[index].jobPrices[job]
	end
	return Config.shops[index].jobPrices['default']
end


function DetectFramework()
	Wait(1000)
	if FRAMEWORK == 'qb-core' then
		QBCore = exports['qb-core']:GetCoreObject()
	elseif FRAMEWORK == 'esx' then
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	end

	for i = 1, #callbacks[FRAMEWORK] do
		callbacks[FRAMEWORK][i]()
	end
end