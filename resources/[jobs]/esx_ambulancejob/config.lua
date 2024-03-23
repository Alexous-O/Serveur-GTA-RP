Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 21, x = 1.0, y = 1.0, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = true }

Config.ReviveReward               = 700  -- prix a payer pour le respawn
Config.AntiCombatLog              = true -- activer/desactiver respawn automatique si altF4?
Config.LoadIpl                    = false -- DESACTIVER SI UTILISATION D'UN SCRIPT IPL

Config.Locale                     = 'fr'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 5 * minute  -- temps jusqu'a la demande de possibilité de respawn
Config.BleedoutTimer              = 10 * minute -- temps avant respawn definitif

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = false
Config.RemoveCashAfterRPDeath     = false
Config.RemoveItemsAfterRPDeath    = false

-- Laisser le joueur respawn si il en a les moyens true/false + prix.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 10000

Config.RespawnPoint = { coords = vector3(299.7186, -578.979, 43.260), heading = 103.81 }

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(300.3836, -589.385, 43.284),
			sprite = 61,
			scale  = 0.75,
			color  = 2
		},

		AmbulanceActions = {
			vector3(301.6819, -598.695, 43.284)
		},

		Pharmacies = {
			vector3(309.6830, -562.096, 43.284)
		},

		Vehicles = {
			{
				Spawner = vector3(339.9509, -571.996, 28.796),
				InsideShop = vector3(364.2244, -592.440, 28.683),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(318.4791, -574.207, 28.528), heading = 249.02, radius = 4.0 },
					{ coords = vector3(319.9314, -569.756, 28.528), heading = 250.64, radius = 4.0 },
					{ coords = vector3(316.7087, -578.614, 28.527), heading = 248.92, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(343.5996, -595.501, 74.165),
				InsideShop = vector3(351.6677, -587.905, 74.165),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 102, g = 0, b = 102, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(351.6677, -587.905, 74.165), heading = 142.7, radius = 10.0 },
					{ coords = vector3(351.6677, -587.905, 74.165), heading = 142.7, radius = 10.0 }
				}
			}
		},

		FastTravels = {
			{
				From = vector3(331.6513, -595.394, 43.284),
				To = { coords = vector3(338.9307, -589.611, 73.161), heading = 0.0 },
				Marker = { type = 21, x = 1.0, y = 1.0, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = true }
			},

			{
				From = vector3(329.7325, -601.144, 43.284),
				To = { coords = vector3(339.6806, -584.577, 27.796), heading = 64.69 },
				Marker = { type = 21, x = 1.0, y = 1.0, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = true }
			}

			--[[{
				From = vector3(247.3, -1371.5, 23.5),
				To = { coords = vector3(333.1, -1434.9, 45.5), heading = 138.6 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = { coords = vector3(249.1, -1369.6, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = { coords = vector3(320.9, -1478.6, 28.8), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = { coords = vector3(238.6, -1368.4, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			}]]
		},

		FastTravelsPrompt = {
			{
				From = vector3(340.7036, -580.658, 27.796),
				To = { coords =vector3(326.9284, -603.445, 43.284), heading = 196.05 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			---- heliport vers assenceurs
			{
				From = vector3(339.5589, -584.389, 73.161),
				To = { coords =vector3(327.0531, -603.354, 43.284), heading = 339.2 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = { coords = vector3(326.9284, -603.445, 42.284), heading = 340.76 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'ambulance', label = 'Ambulance', price = 0}
	},

	doctor = {
		{ model = 'ambulance', label = 'Ambulance', price = 0}
	
	},
	

	chief_doctor = {
		{ model = 'ambulance', label = 'Ambulance', price = 0}

	},
	

	boss = {
		{ model = 'ambulance', label = 'Ambulance', price = 0}

	
	}

}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {
		{ model = 'supervolito', label = 'Helico EMS', price = 0 },
		{ model = 'polmav', label = 'Helico EMS', price = 0 }
	},

	chief_doctor = {
		{ model = 'supervolito', label = 'Helico EMS', price = 0 },
		{ model = 'polmav', label = 'Helico EMS', price = 0 }
		
	},

	boss = {
		{ model = 'supervolito', label = 'Helico EMS', price = 0 },
		{ model = 'polmav', label = 'Helico EMS', price = 0 }
		
	}

}
