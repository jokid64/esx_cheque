ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem(Config.Item, function(source)
	TriggerClientEvent('esx_cheque:paying', source)
end)

RegisterServerEvent("esx_cheque:removeItem")
AddEventHandler("esx_cheque:removeItem", function(item, amount)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem(Config.Item, amount)
	
end)