local purchasePromise = nil
FRAMEWORK = ""
QBCore = {}
ESX = {}
scriptLoaded = false

CreateThread(function()
	Wait(1000)
	if GetResourceState("qb-core") == "started" then
		FRAMEWORK = "qb-core"
		QBCore = exports['qb-core']:GetCoreObject()
	elseif GetResourceState("es_extended") == "started" then
		FRAMEWORK = "esx"
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	end
	scriptLoaded = true
end)


func = {
	['DisplayPrompt'] = {
		['qb-core'] = function()
			exports['qb-core']:DrawText("[E] Open customs", 'left')
		end,
		['esx'] = function()
			CreateThread(function()
				while displayingPrompt do
					Wait(1)
					ESX.ShowHelpNotification(Locale['prompt'])
				end
			end)
		end
	},
	['DisplayPromptEnd'] = {
		['qb-core'] = function()
			exports['qb-core']:HideText()
		end,
		['esx'] = function()

		end
	},
	['GetVehicleProperties'] = {
		['qb-core'] = function(vehicle)
			return QBCore.Functions.GetVehicleProperties(vehicle)
		end,
		['esx'] = function(vehicle)
			return ESX.Game.GetVehicleProperties(vehicle)
		end
	},
	['SetVehicleProperties'] = {
		['qb-core'] = function (vehicle, vehicleProps)
			return QBCore.Functions.SetVehicleProperties(vehicle, vehicleProps)
		end,
		['esx'] = function (vehicle, vehicleProps)
			return ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
		end
	},
	['GetVehiclePrice'] = {
		['qb-core'] = function(vehicle)
			local modelHash = GetEntityModel(vehicle)
		
			local p = promise.new()
		
			QBCore.Functions.TriggerCallback('d-lscustom:server:getVehiclePrice', function(response)
				p:resolve(response)
			end, modelHash)
		
			return Citizen.Await(p)
		end,
		['esx'] = function(vehicle)
			local modelHash = GetEntityModel(vehicle)
			local modelName = string.lower(GetDisplayNameFromVehicleModel(modelHash))
		
			local p = promise.new()
		
			ESX.TriggerServerCallback('d-lscustom:server:getVehiclePrice', function(resp)
				p:resolve(resp)
			end, modelHash)
		
			return Citizen.Await(p)
		end
	},
	['IsWhitelisted'] = {
		['qb-core'] = function(shopIndex)
			if(not Config.whitelistedJob) then return true end
		
			local playerJob = QBCore.Functions.GetPlayerData().job.name
			for i = 1, #Config.shops[shopIndex].whitelistedJobs do
				if Config.shops[shopIndex].whitelistedJobs[i] == playerJob then
					return true
				end
			end
			return false
		end,
		['esx'] = function(shopIndex)
			if(not Config.whitelistedJob) then return true end
		
			local playerJob = ESX.GetPlayerData().job.name
			for i = 1, #Config.shops[shopIndex].whitelistedJobs do
				if Config.shops[shopIndex].whitelistedJobs[i] == playerJob then
					return true
				end
			end
			return false
		end,
	},
	['GetModPrice'] = {
		['qb-core'] = function(vehiclePrice, modId, id)
			local modPriceRatio = 0.01
			if Config.priceRatios[modId] ~= nil then
				if type(Config.priceRatios[modId]) == "table" then
					modPriceRatio = Config.priceRatios[modId][id]
				else
					if Config.priceRatios[modId] > 10.0 then
						return math.ceil(Config.priceRatios[modId])
					end
					modPriceRatio = Config.priceRatios[modId]
				end
			end
			return math.ceil(vehiclePrice * modPriceRatio)
		end,
		['esx'] = function(vehiclePrice, modId, id)
			local modPriceRatio = 0.01
			if Config.priceRatios[modId] ~= nil then
				if type(Config.priceRatios[modId]) == "table" then
					modPriceRatio = Config.priceRatios[modId][id]
				else
			if Config.priceRatios[modId] > 10.0 then
				return math.ceil(Config.priceRatios[modId])
			end
					modPriceRatio = Config.priceRatios[modId]
				end
			end
			return math.ceil(vehiclePrice * modPriceRatio)
		end
	},
	['PayForModInstall'] = {
		['qb-core'] = function(vehicle, modId, id)
			local modelHash = GetEntityModel(vehicle)
			local modelName = string.lower(GetDisplayNameFromVehicleModel(modelHash))
			local vehicleProps = func['GetVehicleProperties'][FRAMEWORK](vehicle)
		
			purchasePromise = promise.new()
		
			QBCore.Functions.TriggerCallback('d-lscustom:server:purchaseMod', function(response)
				purchasePromise:resolve(response)
			end, modelHash, vehicleProps, modId, id)
		
			return Citizen.Await(purchasePromise)
		end,
		['esx'] = function(vehicle, modId, id)
			local modelHash = GetEntityModel(vehicle)
			local modelName = string.lower(GetDisplayNameFromVehicleModel(modelHash))
			local vehicleProps = func['GetVehicleProperties'][FRAMEWORK](vehicle)
		
			purchasePromise = promise.new()
		
			ESX.TriggerServerCallback('d-lscustom:server:purchaseMod', function(response)
				purchasePromise:resolve(response)
			end, modelHash, vehicleProps, modId, id)
		
			return Citizen.Await(purchasePromise)
		end
	},
	['UpdateCash'] = {
		['qb-core'] = function()
			if Config.society.enable then
				QBCore.Functions.TriggerCallback('qb-bossmenu:server:GetAccount', function(response)
					SendNUIMessage({type = "UPDATE_CASH", payload = response })
				end, Config.shops[currentShop].societyName)
			else
				local data = QBCore.Functions.GetPlayerData()
				SendNUIMessage({type = "UPDATE_CASH", payload = data.money['cash'] })
			end	
		end,
		['esx'] = function()
			if Config.society.enable then
				
				ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(response)
					SendNUIMessage({type = "UPDATE_CASH", payload = response })
				end, Config.shops[currentShop].societyName)
			else
				-- for latest ESX versions
				for k,v in ipairs(ESX.GetPlayerData().accounts) do
					if v.name == "money" then
						SendNUIMessage({type = "UPDATE_CASH", payload = v.money })
						break
					end
				end

				--- for older ESX versions
				-- SendNUIMessage({type = "UPDATE_CASH", payload = ESX.PlayerData.money })
			end
		
			
		end
	},
}