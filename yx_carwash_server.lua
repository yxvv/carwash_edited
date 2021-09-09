
RegisterServerEvent('yxmyjnia:sprawdzkaske')
AddEventHandler('yxmyjnia:sprawdzkaske', function ()
		TriggerEvent('es:getPlayerFromId', source, function (user)
			manejbro = user.getMoney()
			if manejbro >= 25 then
				user.removeMoney(25)
				TriggerClientEvent('yxmyjnia:umyj', source, 25)
			else
				moneyleft = 25 - manejbro
				TriggerClientEvent('yxmyjnia:niemaszkasy', source, moneyleft)
			end
		end)
	
end)


