ESX               = nil
local playerCars = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

--Menu Mes clés
RegisterNetEvent('esx_menu:key')
AddEventHandler('esx_menu:key', function()
ESX.TriggerServerCallback('esx_vehiclelock:allkey', function(mykey)
	local elements = {}
		for i=1, #mykey, 1 do
			if mykey[i].got == 'true' then 
				if 	mykey[i].NB == 1 then									
						table.insert(elements, {label = 'Clés : '.. ' [' .. mykey[i].plate .. ']', value = mykey[i].plate})
					elseif mykey[i].NB == 2 then
						table.insert(elements, {label = '[DOUBLE] Véhicule : '.. ' [' .. mykey[i].plate .. ']', value = nil})
					end
				end
			end

ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'mykey',
	{
		title = 'Mes clés',
		align = 'top-left',
		elements = elements
	  },
        function(data2, menu2) --Submit Cb
 
        if data2.current.value ~= nil then
        ESX.UI.Menu.CloseAll()
  			ESX.UI.Menu.Open(
				'default', GetCurrentResourceName(), 'mykey',
				{
				title = 'Voulez vous ?',
				align = 'top-left',
				elements = {
						{label = 'Donner', value = 'donnerkey'}, -- Donné les clés
						{label = 'Préter', value = 'preterkey'}, -- Donné les clés
			  		},
	  			},
        		function(data3, menu3) --Submit Cb
 					local player, distance = ESX.Game.GetClosestPlayer()
 					local playerPed = GetPlayerPed(-1)
					local coords    = GetEntityCoords(playerPed, true)
 					local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 71)
 					local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)

       				 if data3.current.value == 'donnerkey' then
       					 ESX.UI.Menu.CloseAll()
       					if distance ~= -1 and distance <= 3.0 then
       					  TriggerServerEvent('esx_vehiclelock:donnerkey', GetPlayerServerId(player), data2.current.value)
       					  TriggerServerEvent('esx_vehiclelock:deletekey', data2.current.value)
       					  print("avant changement owner")
       					  TriggerServerEvent('esx_vehiclelock:changeowner', GetPlayerServerId(player), vehicleProps)
       					  print("après changement owner")
       					end
      				 end
      				 if data3.current.value == 'preterkey' then
       					 ESX.UI.Menu.CloseAll()
       					if distance ~= -1 and distance <= 3.0 then 
       					  TriggerServerEvent('esx_vehiclelock:preterkey', GetPlayerServerId(player), data2.current.value)
       					end
      				 end
       			 end,
       			 function(data3, menu3) --Cancel Cb
           		     menu3.close()
       			 end,
       			 function(data3, menu3) --Change Cb
         
        		 end
   			 )
        end
        end,
        
        function(data2, men2) --Cancel Cb
                men2.close()
        end,
        function(dat2, men2) --Change Cb
        end
      )
  end)
end)

--Menu Mes clés
--
RegisterNetEvent('esx_menu:key')
AddEventHandler('esx_menu:key', function()
ESX.TriggerServerCallback('esx_vehiclelock:allkey', function(mykey)
	local elements = {}
		for i=1, #mykey, 1 do
			if mykey[i].got == 'true' then 
				if 	mykey[i].NB == 1 then									
						table.insert(elements, {label = 'Clés : '.. ' [' .. mykey[i].plate .. ']', value = mykey[i].plate})
					elseif mykey[i].NB == 2 then
						table.insert(elements, {label = '[DOUBLE] Véhicule : '.. ' [' .. mykey[i].plate .. ']', value = nil})
					end
				end
			end

ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'mykey',
	{
		title = 'Mes clés',
		align = 'top-left',
		elements = elements
	  },
        function(data2, menu2) --Submit Cb
 
        if data2.current.value ~= nil then
        ESX.UI.Menu.CloseAll()
  			ESX.UI.Menu.Open(
				'default', GetCurrentResourceName(), 'mykey',
				{
				title = 'Voulez vous ?',
				align = 'top-left',
				elements = {
						{label = 'Préter', value = data2.current.value}, -- Donné les clés
			  		},
	  			},
        		function(data3, menu3) --Submit Cb
 					local player, distance = ESX.Game.GetClosestPlayer()

       				 if data3.current.value ~= nil then
       					 ESX.UI.Menu.CloseAll()
       					if distance ~= -1 and distance <= 3.0 then
       					  TriggerServerEvent('esx_vehiclelock:givekey', GetPlayerServerId(player), data2.current.value)
       					end
      				 end
       			 end,
       			 function(data3, menu3) --Cancel Cb
           		     menu3.close()
       			 end,
       			 function(data3, menu3) --Change Cb
         
        		 end
   			 )
        end
        end,
        
        function(data2, men2) --Cancel Cb
                men2.close()
        end,
        function(dat2, men2) --Change Cb
        end
      )
  end)
end)

--
AddEventHandler('esx_vehiclelock:hasEnteredMarker', function(zone)

	CurrentAction     = 'Serrurier'
	CurrentActionMsg  = 'Serrurier'
	CurrentActionData = {zone = zone}

end)

AddEventHandler('esx_vehiclelock:hasExitedMarker', function(zone)

	CurrentAction = nil
	ESX.UI.Menu.CloseAll()

end)


Citizen.CreateThread(function()
	local dict = "anim@mp_player_intmenu@key_fob@"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(0)
	end
	
	while true do
	  Citizen.Wait(0)
	  if (IsControlJustPressed(1, 303)) then
		  local coords = GetEntityCoords(GetPlayerPed(-1))
		  local hasAlreadyLocked = false
		  cars = ESX.Game.GetVehiclesInArea(coords, 30)
		  local carstrie = {}
		  local cars_dist = {}		
		  notowned = 0
		  if #cars == 0 then
			  ESX.ShowNotification("Il n'y a pas de véhicule vous appartenant à proximité.")
		  else
			  for j=1, #cars, 1 do
				  local coordscar = GetEntityCoords(cars[j])
				  local distance = Vdist(coordscar.x, coordscar.y, coordscar.z, coords.x, coords.y, coords.z)
				  table.insert(cars_dist, {cars[j], distance})
			  end
			  for k=1, #cars_dist, 1 do
				  local z = -1
				  local distance, car = 999
				  for l=1, #cars_dist, 1 do
					  if cars_dist[l][2] < distance then
						  distance = cars_dist[l][2]
						  car = cars_dist[l][1]
						  z = l
					  end
				  end
				  if z ~= -1 then
					  table.remove(cars_dist, z)
					  table.insert(carstrie, car)
				  end
			  end
			  for i=1, #carstrie, 1 do
				  local plate = ESX.Math.Trim(GetVehicleNumberPlateText(carstrie[i]))
				  ESX.TriggerServerCallback('carlock:isVehicleOwner', function(owner)
					  if owner and hasAlreadyLocked ~= true then
						  local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(carstrie[i]))
						  vehicleLabel = GetLabelText(vehicleLabel)
						  local lock = GetVehicleDoorLockStatus(carstrie[i])
						  if lock == 1 or lock == 0 then
							  SetVehicleDoorShut(carstrie[i], 0, false)
							  SetVehicleDoorShut(carstrie[i], 1, false)
							  SetVehicleDoorShut(carstrie[i], 2, false)
							  SetVehicleDoorShut(carstrie[i], 3, false)
							  SetVehicleDoorsLocked(carstrie[i], 2)
							  PlayVehicleDoorCloseSound(carstrie[i], 1)
							  ESX.ShowNotification('Vous avez ~r~verrouillé~s~ votre ~y~'..vehicleLabel..'~s~.')
							  if not IsPedInAnyVehicle(PlayerPedId(), true) then
								  TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
							  end
							  SetVehicleLights(carstrie[i], 2)
							  Citizen.Wait(150)
							  SetVehicleLights(carstrie[i], 0)
							  Citizen.Wait(150)
							  SetVehicleLights(carstrie[i], 2)
							  Citizen.Wait(150)
							  SetVehicleLights(carstrie[i], 0)
							  hasAlreadyLocked = true
						  elseif lock == 2 then
							  SetVehicleDoorsLocked(carstrie[i], 1)
							  PlayVehicleDoorOpenSound(carstrie[i], 0)
							  ESX.ShowNotification('Vous avez ~g~déverrouillé~s~ votre ~y~'..vehicleLabel..'~s~.')
							  if not IsPedInAnyVehicle(PlayerPedId(), true) then
								  TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
							  end
							  SetVehicleLights(carstrie[i], 2)
							  Citizen.Wait(150)
							  SetVehicleLights(carstrie[i], 0)
							  Citizen.Wait(150)
							  SetVehicleLights(carstrie[i], 2)
							  Citizen.Wait(150)
							  SetVehicleLights(carstrie[i], 0)
							  hasAlreadyLocked = true
						  end
					  else
						  notowned = notowned + 1
					  end
					  if notowned == #carstrie then
						  ESX.ShowNotification("Il n'y a pas de véhicule vous appartenant à proximité.")
					  end	
				  end, plate)
			  end			
		  end
	  end
	end
  end)

------------------------------------------------------------------------
-----------------------------Vendeur de voiture --------------------------------

RegisterNetEvent('esx_menu:keycardealer')
AddEventHandler('esx_menu:keycardealer', function()
ESX.TriggerServerCallback('esx_vehiclelock:allkey', function(mykey)
	local elements = {}
		for i=1, #mykey, 1 do
			if mykey[i].got == 'true' then 
				if 	mykey[i].NB == 3 then									
						table.insert(elements, {label = '[PRO] Clés : '.. ' [' .. mykey[i].plate .. ']', value = mykey[i].plate})
					end
				end
			end

ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'mykey',
	{
		title = 'Clé Pro',
		align = 'top-left',
		elements = elements
	  },
        function(data2, menu2) --Submit Cb
 
        if data2.current.value ~= nil then
        ESX.UI.Menu.CloseAll()
  			ESX.UI.Menu.Open(
				'default', GetCurrentResourceName(), 'mykey',
				{
				title = 'Voulez vous ?',
				align = 'top-left',
				elements = {{label = 'Donner', value = data2.current.value}, -- Donné un double
			  		},
	  			},
        		function(data3, menu3) --Submit Cb
 					local player, distance = ESX.Game.GetClosestPlayer()

       				 if data3.current.value ~= nil then
       					 ESX.UI.Menu.CloseAll()
       					if distance ~= -1 and distance <= 3.0 then
       					  TriggerServerEvent('esx_vehiclelock:givekeycardealer', GetPlayerServerId(player), data2.current.value)
       					  TriggerServerEvent('esx_vehiclelock:deletekeycardealer', GetPlayerServerId(player), data2.current.value)
       					end
      				 end
       			 end,
        
       			 function(data3, menu3) --Cancel Cb
           		     menu3.close()
       			 end,
       			 function(data3, menu3) --Change Cb
         
        		 end
   			 )
        end
        end,
        function(data2, men2) --Cancel Cb
                men2.close()
        end,
        function(dat2, men2) --Change Cb
        end
      )
  end)
end)





--Menu Serrurier

function OpenSerrurierMenu()
	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'GetKey',
	{
		title = 'Que voulez vous ? ',
		align = 'top-left',
		elements = {
			{label = ('Enregistrer une nouvelle clé'),              value = 'registerkey'},
	}
	  },
        function(data, menu) --Submit Cb

        if data.current.value == 'registerkey' then
					ESX.TriggerServerCallback('esx_vehiclelock:getVehiclesnokey', function(Vehicles2)
						local elements = {}

						if Vehicles2 == nil then
							table.insert(elements, {label = 'Aucun véhicule sans clés ', value = nil})
						else
							for i=1, #Vehicles2, 1 do
								model = Vehicles2[i].model
								modelname = GetDisplayNameFromVehicleModel(model)
								Vehicles2[i].model = GetLabelText(modelname)
							end

							for i=1, #Vehicles2, 1 do
								table.insert(elements, {label = Vehicles2[i].model .. ' [' .. Vehicles2[i].plate .. ']', value = Vehicles2[i].plate})					
							end

							ESX.UI.Menu.Open(
							'default', GetCurrentResourceName(), 'backey',
							{
							title    = '300 $ Pour de nouvelle clés.',
							align    = 'top-left',
							elements = elements
							},
							function(data2, menu2)
									menu2.close()	
									TriggerServerEvent('esx_vehiclelock:registerkey', data2.current.value, 'no')
							end,
							function(data2, menu2)
								menu2.close()
							end
							)
						end
					end)
			end
        end,   
        function(data, menu) --Cancel Cb
                menu.close()
        end,
        function(data, menu) --Change Cb
        end
      )
end


-- gestion des blips
Citizen.CreateThread(function()
		local blip = AddBlipForCoord(Config.Zones.place.Pos.x, Config.Zones.place.Pos.y, Config.Zones.place.Pos.z)
		SetBlipSprite (blip, 134)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		SetBlipColour (blip, 3)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Serrurier')
		EndTextCommandSetBlipName(blip)
end)

-- gestion markers
Citizen.CreateThread(function()
	while true do

		Wait(0)

			local coords = GetEntityCoords(GetPlayerPed(-1))

			for k,v in pairs(Config.Zones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do

		Wait(0)
			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('esx_vehiclelock:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_vehiclelock:hasExitedMarker', LastZone)
			end

		end
end)

-- Touche de controle
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString('Appuyez sur ~INPUT_CONTEXT~ pour faire une paire de clé')
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlJustReleased(0, 38) then

        if CurrentAction == 'Serrurier' then
          OpenSerrurierMenu(CurrentActionData.zone)
        end

        CurrentAction = nil

      end

    end
  end
end)

-- Edité par @BeloumiixGaming