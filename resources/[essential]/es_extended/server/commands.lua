TriggerEvent('es:addGroupCommand', 'tp', 'admin', function(source, args, user)
	local x = tonumber(args[1])
	local y = tonumber(args[2])
	local z = tonumber(args[3])
	
	if x and y and z then
		TriggerClientEvent('esx:teleport', source, {
			x = x,
			y = y,
			z = z
		})
	else
		TriggerClientEvent('chatMessage', source, "ERREUR", {255, 0, 0}, "Coordonées invalides!")
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = "Se téléporter sur les coordonées", params = {{name = "x", help = "Position X"}, {name = "y", help = "Position Y "}, {name = "z", help = "Position Z"}}})

TriggerEvent('es:addGroupCommand', 'setjob', 'jobmaster', function(source, args, user)
	if tonumber(args[1]) and args[2] and tonumber(args[3]) then
		local xPlayer = ESX.GetPlayerFromId(args[1])

		if xPlayer then
			if ESX.DoesJobExist(args[2], args[3]) then
				xPlayer.setJob(args[2], args[3])
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'Ce job n\'éxiste pas.' } })
			end

		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'Joueur hors-ligne.' } })
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'Utilisation incorrecte.' } })
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('setjob'), params = {{name = "id", help = _U('id_param')}, {name = "job", help = _U('setjob_param2')}, {name = "grade_id", help = _U('setjob_param3')}}})

---SecondJob Included
TriggerEvent('es:addGroupCommand', 'setjob2', 'jobmaster', function(source, args, user)
	if tonumber(args[1]) and args[2] and tonumber(args[3]) then
		local xPlayer = ESX.GetPlayerFromId(args[1])

		if xPlayer then
			xPlayer.setJob2(args[2], tonumber(args[3]))
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'Joueur hors-ligne.' } })
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'Utilisation incorrecte.' } })
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('setjob'), params = {{name = "id", help = _U('id_param')}, {name = "job", help = _U('setjob_param2')}, {name = "grade_id", help = _U('setjob_param3')}}})

TriggerEvent('es:addGroupCommand', 'loadipl', 'superadmin', function(source, args, user)
	TriggerClientEvent('esx:loadIPL', -1, args[1])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('load_ipl')})

TriggerEvent('es:addGroupCommand', 'unloadipl', 'superadmin', function(source, args, user)
	TriggerClientEvent('esx:unloadIPL', -1, args[1])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('unload_ipl')})

TriggerEvent('es:addGroupCommand', 'playanim', 'superadmin', function(source, args, user)
	TriggerClientEvent('esx:playAnim', -1, args[1], args[3])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('play_anim')})

TriggerEvent('es:addGroupCommand', 'playemote', 'superadmin', function(source, args, user)
	TriggerClientEvent('esx:playEmote', -1, args[1])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('play_emote')})

TriggerEvent('es:addGroupCommand', 'car', 'admin', function(source, args, user)
	TriggerClientEvent('esx:spawnVehicle', source, args[1])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('spawn_car'), params = {{name = "car", help = _U('spawn_car_param')}}})

TriggerEvent('es:addGroupCommand', 'cardel', 'mod', function(source, args, user)
	TriggerClientEvent('esx:deleteVehicle1', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('delete_vehicle')})

TriggerEvent('es:addGroupCommand', 'dv', 'mod', function(source, args, user)
	TriggerClientEvent('esx:deleteVehicle', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('delete_vehicle')})

TriggerEvent('es:addGroupCommand', 'spawnped', 'superadmin', function(source, args, user)
	TriggerClientEvent('esx:spawnPed', source, args[1])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('spawn_ped'), params = {{name = "name", help = _U('spawn_ped_param')}}})

TriggerEvent('es:addGroupCommand', 'spawnobject', 'superadmin', function(source, args, user)
	TriggerClientEvent('esx:spawnObject', source, args[1])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('spawn_object'), params = {{name = "name"}}})

TriggerEvent('es:addGroupCommand', 'setmoney', 'superadmin', function(source, args, user)
	local _source = source
	local target = tonumber(args[1])
	local money_type = args[2]
	local money_amount = tonumber(args[3])
	
	local xPlayer = ESX.GetPlayerFromId(target)

	if target and money_type and money_amount and xPlayer ~= nil then
		if money_type == 'cash' then
			xPlayer.setMoney(money_amount)
		elseif money_type == 'bank' then
			xPlayer.setAccountMoney('bank', money_amount)
		elseif money_type == 'fivecoin' then
			xPlayer.setAccountMoney('fivecoin', money_amount)
		elseif money_type == 'black' then
			xPlayer.setAccountMoney('black_money', money_amount)
		else
			TriggerClientEvent('chatMessage', _source, "^1ERREUR", {255, 0, 0}, "^2" .. money_type .. " ^0 n'est pas pas un type de monnaie valide!")
			return
		end
	else
		TriggerClientEvent('chatMessage', _source, "^1ERREUR", {255, 0, 0}, "Arguments non valides.")
		return
	end
	
	print('es_extended: ' .. GetPlayerName(source) .. ' a donné $' .. money_amount .. ' (' .. money_type .. ') à ' .. xPlayer.name)
	
	if xPlayer.source ~= _source then
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('money_set', money_amount, money_type))
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('setmoney'), params = {{name = "id", help = _U('id_param')}, {name = "money type", help = _U('money_type')}, {name = "amount", help = _U('money_amount')}}})

TriggerEvent('es:addGroupCommand', 'giveaccountmoney', 'superadmin', function(source, args, user)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(args[1])
	local account = args[2]
	local amount  = tonumber(args[3])

	if amount ~= nil then
		if xPlayer.getAccount(account) ~= nil then
			xPlayer.addAccountMoney(account, amount)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('invalid_account'))
		end
	else
		TriggerClientEvent('esx:showNotification', _source, _U('amount_invalid'))
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('giveaccountmoney'), params = {{name = "id", help = _U('id_param')}, {name = "account", help = _U('account')}, {name = "amount", help = _U('money_amount')}}})

TriggerEvent('es:addGroupCommand', 'giveitem', 'superadmin', function(source, args, user)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(args[1])
	local item    = args[2]
	local count   = (args[3] == nil and 1 or tonumber(args[3]))

	if count ~= nil then
		if xPlayer.getInventoryItem(item) ~= nil then
			xPlayer.addInventoryItem(item, count)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('invalid_item'))
		end
	else
		TriggerClientEvent('esx:showNotification', _source, _U('invalid_amount'))
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('giveitem'), params = {{name = "id", help = _U('id_param')}, {name = "item", help = _U('item')}, {name = "amount", help = _U('amount')}}})

TriggerEvent('es:addGroupCommand', 'giveweapon', 'superadmin', function(source, args, user)
	local xPlayer    = ESX.GetPlayerFromId(args[1])
	local weaponName = string.upper(args[2])

	xPlayer.addWeapon(weaponName, tonumber(args[3]))
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('giveweapon'), params = {{name = "id", help = _U('id_param')}, {name = "weapon", help = _U('weapon')}, {name = "ammo", help = _U('amountammo')}}})

TriggerEvent('es:addGroupCommand', 'disc', 'admin', function(source, args, user)
	DropPlayer(source, 'Vous avez été déconnecté!')
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end)

TriggerEvent('es:addGroupCommand', 'disconnect', 'admin', function(source, args, user)
	DropPlayer(source, 'Vous avez été déconnecté!')
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('disconnect')})

TriggerEvent('es:addGroupCommand', 'clear', 'user', function(source, args, user)
	TriggerClientEvent('chat:clear', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('chat_clear')})

TriggerEvent('es:addGroupCommand', 'repair', 'user', function(source, args, user)
	TriggerClientEvent('chat:repair', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('repair')})


--------- NOUVELLE TRADUCTION COMMANDE --------
TriggerEvent('es:addGroupCommand', '911', 'user', function(source, args, user)
	TriggerClientEvent('chat:911', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('911')})

TriggerEvent('es:addGroupCommand', 'givecarkey', 'user', function(source, args, user)
	TriggerClientEvent('chat:givecarkey', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('givecarkey')})


TriggerEvent('es:addGroupCommand', '911a', 'user', function(source, args, user)
	TriggerClientEvent('chat:911a', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('911a')})

TriggerEvent('es:addGroupCommand', 'me', 'user', function(source, args, user)
	TriggerClientEvent('chat:me', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('me')})

TriggerEvent('es:addGroupCommand', 'ooc', 'user', function(source, args, user)
	TriggerClientEvent('chat:ooc', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('ooc')})

TriggerEvent('es:addGroupCommand', 'news', 'user', function(source, args, user)
	TriggerClientEvent('chat:news', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('news')})

TriggerEvent('es:addGroupCommand', 'speedoskin', 'user', function(source, args, user)
	TriggerClientEvent('chat:speedoskin', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('speedoskin')})

TriggerEvent('es:addGroupCommand', 'speedoskins', 'user', function(source, args, user)
	TriggerClientEvent('chat:speedoskins', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('speedoskins')})


TriggerEvent('es:addGroupCommand', 'ano', 'user', function(source, args, user)
	TriggerClientEvent('chat:ano', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('ano')})

TriggerEvent('es:addGroupCommand', 'twt', 'user', function(source, args, user)
	TriggerClientEvent('chat:twt', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('twt')})

TriggerEvent('es:addGroupCommand', 'lspd', 'user', function(source, args, user)
	TriggerClientEvent('chat:lspd', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('lspd')})

TriggerEvent('es:addGroupCommand', 'coords', 'superadmin', function(source, args, user)
	TriggerClientEvent('chat:coords', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('coords')})

TriggerEvent('es:addGroupCommand', 'heading', 'superadmin', function(source, args, user)
	TriggerClientEvent('chat:heading', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('heading')})

TriggerEvent('es:addGroupCommand', 'evening', 'admin', function(source, args, user)
	TriggerClientEvent('chat:evening', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('evening')})

TriggerEvent('es:addGroupCommand', 'takehostage', 'user', function(source, args, user)
	TriggerClientEvent('chat:takehostage', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('takehostage')})

TriggerEvent('es:addGroupCommand', 'th', 'user', function(source, args, user)
	TriggerClientEvent('chat:th', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('th')})

TriggerEvent('es:addGroupCommand', 'togglespeedo', 'user', function(source, args, user)
	TriggerClientEvent('chat:togglespeedo', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('togglespeedo')})

TriggerEvent('es:addGroupCommand', 'time', 'superadmin', function(source, args, user)
	TriggerClientEvent('chat:time', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('time')})

TriggerEvent('es:addGroupCommand', 'piggyback', 'user', function(source, args, user)
	TriggerClientEvent('chat:piggyback', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('piggyback')})

TriggerEvent('es:addGroupCommand', 'carry', 'user', function(source, args, user)
	TriggerClientEvent('chat:carry', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('carry')})

TriggerEvent('es:addGroupCommand', 'bodybag', 'user', function(source, args, user)
	TriggerClientEvent('chat:bodybag', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('bodybag')})

TriggerEvent('es:addGroupCommand', 'shield', 'user', function(source, args, user)
	TriggerClientEvent('chat:shield', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('shield')})

TriggerEvent('es:addGroupCommand', 'setgroup', 'superadmin', function(source, args, user)
	TriggerClientEvent('chat:setgroup', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('setgroup')})

TriggerEvent('es:addGroupCommand', 'do', 'user', function(source, args, user)
	TriggerClientEvent('chat:do', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('do')})

	TriggerEvent('es:addGroupCommand', 'freezetime', 'superadmin', function(source, args, user)
		TriggerClientEvent('chat:freezetime', source)
	end, function(source, args, user)
		TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
	end, {help = _U('freezetime')})

		TriggerEvent('es:addGroupCommand', 'freezeweather', 'superadmin', function(source, args, user)
			TriggerClientEvent('chat:freezeweather', source)
		end, function(source, args, user)
			TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
		end, {help = _U('freezeweather')})
		
		TriggerEvent('es:addGroupCommand', 'morning', 'superadmin', function(source, args, user)
			TriggerClientEvent('chat:morning', source)
		end, function(source, args, user)
			TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
		end, {help = _U('morning')})

		TriggerEvent('es:addGroupCommand', 'weather', 'superadmin', function(source, args, user)
			TriggerClientEvent('chat:weather', source)
		end, function(source, args, user)
			TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
		end, {help = _U('weather')})

		TriggerEvent('es:addGroupCommand', 'blackout', 'superadmin', function(source, args, user)
			TriggerClientEvent('chat:blackout', source)
		end, function(source, args, user)
			TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
		end, {help = _U('blackout')})

		TriggerEvent('es:addGroupCommand', 'night', 'superadmin', function(source, args, user)
			TriggerClientEvent('chat:night', source)
		end, function(source, args, user)
			TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
		end, {help = _U('night')})

		TriggerEvent('es:addGroupCommand', 'noon', 'superadmin', function(source, args, user)
			TriggerClientEvent('chat:noon', source)
		end, function(source, args, user)
			TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
		end, {help = _U('noon')})


-------------------------- commande give point boutique ----------------

TriggerEvent('es:addGroupCommand', 'givedonate', 'admin', function(source, args, user)
	TriggerClientEvent('chat:givedonate', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('givedonate')})


		-------------- COMMANDE AVERTISSEMENT BAN BWH... ------------

		TriggerEvent('es:addGroupCommand', 'bwh', 'admin', function(source, args, user)
			TriggerClientEvent('chat:bwh', source)
		end, function(source, args, user)
			TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
		end, {help = _U('bwh')})



	---------------- assistance BWH ADMIN --------------------------

	TriggerEvent('es:addGroupCommand', 'accassist', 'admin', function(source, args, user)
		TriggerClientEvent('chat:accassist', source)
	end, function(source, args, user)
		TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
	end, {help = _U('accassist')})

	TriggerEvent('es:addGroupCommand', 'decassist', 'admin', function(source, args, user)
		TriggerClientEvent('chat:decassist', source)
	end, function(source, args, user)
		TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
	end, {help = _U('decassist')})

	TriggerEvent('es:addGroupCommand', 'finassist', 'admin', function(source, args, user)
		TriggerClientEvent('chat:finassist', source)
	end, function(source, args, user)
		TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
	end, {help = _U('finassist')})


	----------- demande assistance utilisateur BWH -------------------
	TriggerEvent('es:addGroupCommand', 'assist', 'user', function(source, args, user)
		TriggerClientEvent('chat:assist', source)
	end, function(source, args, user)
		TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
	end, {help = _U('assist')})

	TriggerEvent('es:addGroupCommand', 'cassist', 'user', function(source, args, user)
		TriggerClientEvent('chat:cassist', source)
	end, function(source, args, user)
		TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
	end, {help = _U('cassist')})



		-------------- COMMANDE ANNONCE JOB -------------------------


		TriggerEvent('es:addGroupCommand', 'meca', 'user', function(source, args, user)
			TriggerClientEvent('chat:meca', source)
		end, function(source, args, user)
			TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
		end, {help = _U('meca')})

	
		TriggerEvent('es:addGroupCommand', 'imob', 'user', function(source, args, user)
			TriggerClientEvent('chat:imob', source)
		end, function(source, args, user)
			TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
		end, {help = _U('imob')})

		TriggerEvent('es:addGroupCommand', 'conc', 'user', function(source, args, user)
			TriggerClientEvent('chat:conc', source)
		end, function(source, args, user)
			TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
		end, {help = _U('conc')})

		TriggerEvent('es:addGroupCommand', 'ems', 'user', function(source, args, user)
			TriggerClientEvent('chat:ems', source)
		end, function(source, args, user)
			TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
		end, {help = _U('ems')})

		TriggerEvent('es:addGroupCommand', 'bsco', 'user', function(source, args, user)
			TriggerClientEvent('chat:bsco', source)
		end, function(source, args, user)
			TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
		end, {help = _U('bsco')})
-------------------------------------------------------

TriggerEvent('es:addGroupCommand', 'cls', 'user', function(source, args, user)
	TriggerClientEvent('chat:clear', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end)

TriggerEvent('es:addGroupCommand', 'clsall', 'admin', function(source, args, user)
	TriggerClientEvent('chat:clear', -1)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end)

TriggerEvent('es:addGroupCommand', 'clearall', 'admin', function(source, args, user)
	TriggerClientEvent('chat:clear', -1)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('chat_clear_all')})

TriggerEvent('es:addGroupCommand', 'clearinventory', 'admin', function(source, args, user)
	local xPlayer

	if args[1] then
		xPlayer = ESX.GetPlayerFromId(args[1])
	else
		xPlayer = ESX.GetPlayerFromId(source)
	end

	if not xPlayer then
		TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'Joueur hors-ligne.' } })
		return
	end

	for i=1, #xPlayer.inventory, 1 do
		if xPlayer.inventory[i].count > 0 then
			xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('command_clearinventory'), params = {{name = "playerId", help = _U('command_playerid_param')}}})

TriggerEvent('es:addGroupCommand', 'clearloadout', 'admin', function(source, args, user)
	local xPlayer

	if args[1] then
		xPlayer = ESX.GetPlayerFromId(args[1])
	else
		xPlayer = ESX.GetPlayerFromId(source)
	end

	if not xPlayer then
		TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'Joueur hors-ligne.' } })
		return
	end

	for i=#xPlayer.loadout, 1, -1 do
		xPlayer.removeWeapon(xPlayer.loadout[i].name)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1ERREUR', 'permissions insuffisantes.' } })
end, {help = _U('command_clearloadout'), params = {{name = "playerId", help = _U('command_playerid_param')}}})
