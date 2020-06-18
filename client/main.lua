ESX = nil
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(10)
  end
end)

RegisterNetEvent('esx_cheque:paying')
AddEventHandler('esx_cheque:paying', function(source)
			ESX.UI.Menu.Open(
			  'dialog', GetCurrentResourceName(), 'paiement_cheque',
			  {
				title = _U('cheque_amount')
			  },function(data, menu)
			  local amount = tonumber(data.value)
			  if amount ~= nil then 
			  menu.close()
					local player, distance = ESX.Game.GetClosestPlayer()
					if distance ~= -1 and distance <= 3.0 then
						startAnim("mp_common", "givetake1_a")
				TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(player), 'item_account', 'bank', amount)
				TriggerServerEvent('esx_cheque:removeItem', Config.Item, 1)	
					else
						menu.close()
						ESX.ShowNotification(_U('no_nearby'))							
					end
				else
					ESX.ShowNotification(_U('invalid_amount'))
						ClearPedTasks(PlayerPedId())	
				end	
				menu.close()
			end)
end)

function startAnim(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
	end)
end

