Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 3
Config.MarkerSize                 = { x = 1.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 255, g = 0, b = 0 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.bloodStations = {

  blood = {

    Blip = {
      Pos     = { x = 335.13, y = -2041.12, z = 21.07},
      Sprite  = -1,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_KNIFE',      price = 8000 },
      { name = 'WEAPON_BAT',      price = 8000 },
      { name = 'WEAPON_SNSPISTOL',      price = 50000 },
      },

	  AuthorizedVehicles = {
		  { name = 'blazer4',    label = 'Quad' },
		  { name = 'chino2',  label = 'Caisse Gueto' },
		  { name = 'bf400',     label = 'BF400' },
      { name = 'buffalo2',     label = 'Buffalo' },
      { name = 'bmx',     label = 'Bmx' },
	  },


    Cloakrooms = {
      { x = -1166.06, y = -1235.57, z = -5}, -- Vestiaire
    },


    Armories = {
      { x = -1163.61, y = -1243.06, z = 6.78}, -- Armurerie
    },

    Vehicles = {
      {
        Spawner    = { x = -1152.45, y = -1227.19, z = 6.82 }, -- Menu véhicules
        SpawnPoint = { x = -1155.61, y = -1230.12, z = 6.69 }, -- Point d'apparitions
        Heading    = 200.15, -- Angle d'apparation
      }
    },

    VehicleDeleters = {
      { x = -1155.61, y = -1230.1, z = 6.69 }, -- Ranger véhicule
    },

    BossActions = {
      { x = -1167.76, y = -1233.69, z = 6.79 }, -- Actions Patron
    },

  },

}