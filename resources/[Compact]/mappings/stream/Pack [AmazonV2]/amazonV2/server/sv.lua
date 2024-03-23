ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--base

	
RegisterServerEvent('amazonjob:cash')
AddEventHandler('amazonjob:cash', function(currentJobPay)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addMoney(currentJobPay)
		
	TriggerClientEvent('esx:showNotification', _source, ' Vous avez gagné ' .. currentJobPay)
end)	