local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PlayerData              = {}

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
	
	CreateBlip()	
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
    CreateBlip()	
	Citizen.Wait(5000)
end)

--------------------------------------

local currentJob = {}
local restockObject = {}
local restockObjectLocation = {}
local onJob = false 
local amazonjobVehicle = nil
local currentJobPay = 0
local PackageObject = nil
local currentPackages = 0
local locations = {
	["Grapeseed"] = {
		['Max'] = 22,
		
		[1] = {368.16363525391,-1896.3388671875,25.178524017334},
		[2] = {386.06393432617,-1882.2854003906,25.753662109375},
		[3] = {423.23193359375,-1889.3465576172,26.356967926025},
		[4] = {450.87603759766,-1863.0277099609,27.782205581665},
		[5] = {519.70648193359,-1734.3770751953,30.69149017334},
		[6] = {489.69815063477,-1714.0168457031,29.70499420166}, 
		[7] = {479.06811523438,-1735.5731201172,29.151023864746},
		[8] = {500.52743530273,-1697.3674316406,29.789077758789},
		[9] = {129.01600646973,-1299.5438232422,29.227657318115},
		[10] = {88.393829345703,-1294.6129150391,29.204940795898},
		[11] = {51.042266845703,-1317.5983886719,29.287221908569}, 
		[12] = {26.69465637207,-1299.5808105469,29.33890914917},
		[13] = {-85.359825134277,-1307.9666748047,29.301900863647},
		[14] = {-205.29296875,-1309.5544433594,31.289251327515},
		[15] = {-286.67495727539,-1060.6193847656,27.205381393433},
		[16] = {-268.80130004883,-962.38604736328,31.22313117981}, 
		[17] = {-196.4027557373,-831.45495605469,30.76300239563},
		[18] = {-48.234363555908,-588.37878417969,37.953029632568},
		[19] = {-191.51377868652,-369.03540039062,32.321071624756},
		[20] = {-171.15093994141,-346.89141845703,34.582206726074},
		[21] = {-162.81590270996,-302.93646240234,39.733276367188}, 
		[22] = {-138.53498840332,-257.44766235352,43.594982147217},
	},

	["Sandy Shores"] = {
		['Max'] = 33,
		[1] = {-139.80253601074,-251.94331359863,43.731384277344},
		[2] = {-41.036712646484,-215.38041687012,45.801174163818},
		[3] = {88.649742126465,-222.15467834473,54.636734008789},
		[4] = {109.83052825928,-152.36108398438,54.849727630615},
		[5] = {125.51042938232,-224.37223815918,54.557823181152},
		[6] = {388.40292358398,-74.618995666504,68.180465698242}, 
		[7] = {231.44114685059,214.84809875488,106.2801361084},
		[8] = {100.45342254639,209.49087524414,107.99588012695},
		[9] = {80.996047973633,275.22143554688,110.21015167236},
		[10] = {-83.959564208984,234.80665588379,100.56349182129},
		[11] = {-285.65521240234,280.71728515625,89.888114929199}, 
		[12] = {-564.69305419922,275.30355834961,83.019622802734},
		[13] = {-847.47741699219,103.97256469727,53.278072357178},
		[14] = {-1032.6862792969,-421.35092163086,39.615646362305},
		[15] = {-1566.2330322266,-606.45483398438,31.299802780151}, 
		[16] = {-1539.4085693359,-606.98870849609,31.299030303955},
		[17] = {-1340.4504394531,-1264.3898925781,4.8951907157898},
		[18] = {-1311.9112548828,-1336.6556396484,4.6406917572021},
		[19] = {-1304.0887451172,-1363.6694335938,4.5217695236206},
		[20] = {-1273.3666992188,-1382.013671875,4.3206386566162}, 
		[21] = {-1192.0584716797,-1197.3723144531,7.6259336471558},
		[22] = {-1226.9948730469,-1183.4000244141,7.7245173454285},
		[23] = {-1204.2260742188,-1146.6508789062,7.6992774009705},
		[24] = {-38.243396759033,-1108.9298095703,26.437433242798},
		[25] = {18.768604278564,-1108.8665771484,29.797004699707}, 
		[26] = {90.340835571289,-1099.7193603516,29.31342124939},
		[27] = {127.49921417236,-1028.7540283203,29.446001052856},
		[28] = {349.93673706055,-1027.4151611328,29.330717086792},
		[29] = {370.21301269531,-1027.4163818359,29.333492279053},
		[30] = {386.77133178711,-993.94085693359,29.417943954468},
		[31] = {433.81842041016,-981.82275390625,30.710470199585},
		[32] = {392.37396240234,-919.40441894531,29.418657302856},
		[33] = {382.76806640625,-875.46264648438,29.292028427124},
	},

	["Paleto Bay"] = {
		['Max'] = 29,
		[1] = {339.22158813477,-777.30773925781,29.26650428772},
		[2] = {307.4807434082,-727.58135986328,29.316781997681},
		[3] = {355.53994750977,-596.02105712891,28.774154663086},
		[4] = {299.04989624023,-584.52569580078,43.260833740234},
		[5] = {201.85899353027,-239.06575012207,53.96715927124},
		[6] = {125.71855163574,-223.67503356934,54.557823181152}, 
		[7] = {-1116.9931640625,303.79556274414,66.520851135254},
		[8] = {-1383.720703125,267.98382568359,61.238479614258},
		[9] = {-1578.9201660156,185.03388977051,58.858943939209},
		[10] = {-1637.0855712891,180.52000427246,61.757266998291},
		[11] = {-1629.9104003906,36.377426147461,62.936126708984}, 
		[12] = {-1471.0728759766,-135.6332244873,51.08984375},
		[13] = {-1533.310546875,-275.54693603516,49.737731933594},
		[14] = {-1597.1920166016,-352.17510986328,45.976406097412},
		[15] = {-1602.7062988281,-432.63012695312,40.417053222656},
		[16] = {-1667.5438232422,-441.20281982422,40.356479644775}, 
		[17] = {-1661.4406738281,-533.20599365234,36.028400421143},
		[18] = {-1545.2222900391,-530.03021240234,36.148574829102},
		[19] = {-1388.4404296875,-586.99743652344,30.218870162964},
		[20] = {-1285.5983886719,-566.97692871094,31.712396621704},
		[21] = {368.16363525391,-1896.3388671875,25.178524017334}, 
		[22] = {386.06393432617,-1882.2854003906,25.753662109375},
		[23] = {-191.51377868652,-369.03540039062,32.321071624756},
		[24] = {-171.15093994141,-346.89141845703,34.582206726074},
		[25] = {88.649742126465,-222.15467834473,54.636734008789},
		[26] = {109.83052825928,-152.36108398438,54.849727630615},
		[27] = {231.44114685059,214.84809875488,106.2801361084},
		[28] = {-196.4027557373,-831.45495605469,30.76300239563},
		[29] = {-171.15093994141,-346.89141845703,34.582206726074},
	}
}

local restockLocations = {

 [1] = {1223.3898925781, -3242.9838867188, 5.5034790039062},
 [2] = {1225.64453125, -3243.423828125, 5.5034790039062},
 [3] = {1227.5404052734, -3243.4616699219, 5.5034790039062},
 [4] = {1223.4837646484, -3251.8522949219, 5.5034818649292},
 [5] = {1225.1817626953, -3252.1291503906, 5.5034804344177},
 [6] = {1225.6707763672, -3250.7744140625, 5.5034804344177},
 [7] = {1223.2222900391, -3250.412109375, 5.5034804344177},
 [8] = {1221.6765136719, -3250.6728515625, 5.5034804344177}
}

local vehicleSpawnLocations = {
 {x = 1227.59, y = -3230.33, z = 5.9327, h = 359.55},
 {x = 1224.06, y = -3230.65, z = 5.92, h = 0.71}
 --{x = -406.0371, y = 6168.61914, z = 31.394813, h = 353.80203},
 --{x = -408.9385, y = 6171.53271, z = 31.380252, h = 353.44647},
 --{x = -411.9129, y = 6174.58349, z = 31.379669, h = 353.77667}
}



function CreateBlip()
    if PlayerData.job ~= nil and PlayerData.job.name == 'amazonjob' then

		if BlipCloakRoom == nil then
			BlipCloakRoom = AddBlipForCoord(1213.59, -3248.96, 5.5034)
			SetBlipSprite(BlipCloakRoom, 76)
			SetBlipColour(BlipCloakRoom, 0)
			SetBlipAsShortRange(BlipCloakRoom, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Amazon')
			EndTextCommandSetBlipName(BlipCloakRoom)
	  end	
	else

        if BlipCloakRoom ~= nil then
            RemoveBlip(BlipCloakRoom)
            BlipCloakRoom = nil
        end
	end
 end


Citizen.CreateThread(function()
 while true do
  Citizen.Wait(5)
  if PlayerData.job ~= nil and PlayerData.job.name == 'amazonjob' then
   if(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1213.59, -3248.96, 5.5034, true) < 15) then
	DrawMarker(23, 1213.59, -3248.96, 5.4034-0.9, 0, 0, 0, 0.0, 0, 0, 3.0, 3.0, 0.5001, 255, 255, 255, 255, 0, 0, 0, 0)
   	if(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1213.59, -3248.96, 5.5034, true) < 1.5) then
   	 if DoesEntityExist(amazonjobVehicle) then DrawText3d(1213.59, -3248.96, 5.5034+1.2, "~w~Appuyez sur ~r~[E]~w~ pour arrêter le travail", 200) else DrawText3d(1213.59, -3248.96, 5.5034+1.2, "~w~Appuyez sur ~r~[E]~w~ pour commencer à travailler.", 200) end	
   	 if IsControlJustPressed(0, 38) then 
   	  if DoesEntityExist(amazonjobVehicle) then 
   	   onJob = false
	   DeleteVehicle(amazonjobVehicle)
	   RemoveJobBlip()
   	  else
   	   local freespot, v = getParkingPosition(vehicleSpawnLocations)
		if freespot then Spawnamazonjob(v.x, v.y, v.z, v.h) end
		TriggerEvent("pNotify:SendNotification", {text= "<font color='yellow'>Votre véhicule est à l'extérieur récupérer le est rentré dans l'entrepôt."})  
      end
     end
	end
   end
   if(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1226.09, -3248.23, 5.5034, true) < 40) and IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("burrito2")) and DoesEntityExist(amazonjobVehicle) then
   	DrawMarker(23, 1226.09, -3248.23, 5.5034-0.95, 0, 0, 0, 0.0, 0, 0, 3.0, 3.0, 0.5001, 255, 255, 255, 255, 0, 0, 0, 0)
	if(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1226.09, -3248.23, 5.5034, true) < 4) then
	 if not onJob then 
	  DrawText3d(1226.09, -3248.23, 5.5034+1.2, "~w~Appuyez sur ~r~[E]~w~ pour remplir votre camion", 200)
	  
	  
	  
	  
	  if IsControlJustPressed(0, 38) then
	   restockVan()
	  end
     end
    end
   end
   if(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), currentJob[1], currentJob[2], currentJob[3], true) < 20) and onJob then
   	DrawMarker(1, currentJob[1], currentJob[2], currentJob[3], 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 112, 100,210, true, true, 0,0)
	if(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), currentJob[1], currentJob[2], currentJob[3], true) < 1.5) then
	 drawTxt('~w~Appuyez sur ~r~[E]~w~ pour livrer le colis')
	 if IsControlJustPressed(0, 38) then
	  DeleteObject(PackageObject)
	  ClearPedTasks(GetPlayerPed(-1))
	  PackageObject = nil 
	  TriggerServerEvent('amazonjob:cash', currentJobPay)
	  
	  newShift()
	 end
    end
   end
   if onJob and not IsPedInAnyVehicle(GetPlayerPed(-1)) and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), currentJob[1], currentJob[2], currentJob[3], true) < 20 then 
    local bootPos = GetEntityCoords(amazonjobVehicle)
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), bootPos.x, bootPos.y, bootPos.z, true) < 2.5 and PackageObject == nil then 
     drawTxt('~w~Appuyez sur ~r~[E]~w~ Pour prendre le paquet')
	 
     if IsControlJustPressed(0, 38) then
	  LoadModel("prop_cs_cardbox_01")
	  local pos = GetEntityCoords(GetPlayerPed(-1), false)
	  PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), pos.x, pos.y, pos.z, true, true, true)
      AttachEntityToEntity(PackageObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
      LoadAnim("anim@heists@box_carry@")
      TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
     end
    end 
   end
  end
 end
end)


function restockVan()
 local restockPackages = 8
 local restockVan = true
 local carryingPackage = {status = false, id = nil}
 for id,v in pairs(restockLocations) do 
  restockObject[id] = CreateObject(GetHashKey("prop_cs_cardbox_01"), v[1],v[2],v[3]-0.95, true, true, true)
  restockObjectLocation[id] = v 
  PlaceObjectOnGroundProperly(restockObject[id])
 end
 while restockVan do 
  Wait(1)
  for id,v in pairs(restockObjectLocation) do 
   DrawMarker(2, v[1],v[2],v[3], 0,0,0,0,0,0,0.5,0.5,0.5,255,255,0,165,0,0,0,0)
   if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v[1],v[2],v[3], true) < 1.0 then
    drawTxt('~w~Appuyez sur ~r~[E]~w~ Pour prendre le paquet')
    if IsControlJustPressed(0, 38) then 
     AttachEntityToEntity(restockObject[id], PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
     LoadAnim("anim@heists@box_carry@")
     TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
     carryingPackage.status = true
     carryingPackage.id = id
    end
   end
  end
  if carryingPackage.status then 
   local bootPos = GetEntityCoords(amazonjobVehicle)
   if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), bootPos.x, bootPos.y, bootPos.z, true) < 2.6 then 
    drawTxt('~w~Appuyez sur ~r~[E]~w~ Pour mettre le colis dans le camion')
    if IsControlJustPressed(0, 38) then 
     DeleteObject(restockObject[carryingPackage.id])
     ClearPedTasks(GetPlayerPed(-1))
     carryingPackage.status = false
     restockObjectLocation[carryingPackage.id] = {}
     restockObject[carryingPackage.id] = nil
     restockPackages = restockPackages-1
     if restockPackages == 0 then 
      restockVan = false
      newShift()
      onJob = true
      exports.pNotify:SendNotification({text = "Votre camion est complet, Vous pouvez commencer la livraison."})
     end
    end
   end
  end
 end
end

function newShift()
 local id = math.random(1,3)
 if id == 1 then 
  local jobLocation = locations['Grapeseed'][math.random(1, locations['Grapeseed']['Max'])] 
  SetJobBlip(jobLocation[1],jobLocation[2],jobLocation[3])
  currentJob = jobLocation
 elseif id == 2 then 
  local jobLocation = locations['Sandy Shores'][math.random(1, locations['Sandy Shores']['Max'])]
  SetJobBlip(jobLocation[1],jobLocation[2],jobLocation[3])
  currentJob = jobLocation
 elseif id == 3 then 
  local jobLocation = locations['Paleto Bay'][math.random(1, locations['Paleto Bay']['Max'])]
  SetJobBlip(jobLocation[1],jobLocation[2],jobLocation[3])
  currentJob = jobLocation
 end
 currentJobPay = CalculateTravelDistanceBetweenPoints(GetEntityCoords(GetPlayerPed(-1)), currentJob[1],currentJob[2],currentJob[3])/2/4
 if currentJobPay > 60 then 
  currentJobPay = math.random(100, 250)
 end
end

function Spawnamazonjob(x,y,z,h)
 local vehicleHash = GetHashKey('burrito2')
 RequestModel(vehicleHash)
 while not HasModelLoaded(vehicleHash) do
  Citizen.Wait(0)
 end

 amazonjobVehicle = CreateVehicle(vehicleHash, x, y, z, h, true, false)
 local id = NetworkGetNetworkIdFromEntity(amazonjobVehicle)
 SetNetworkIdCanMigrate(id, true)
 SetNetworkIdExistsOnAllMachines(id, true)
 SetVehicleDirtLevel(amazonjobVehicle, 0)
 SetVehicleHasBeenOwnedByPlayer(amazonjobVehicle, true)
 SetEntityAsMissionEntity(amazonjobVehicle, true, true)
 SetVehicleEngineOn(amazonjobVehicle, true)
end