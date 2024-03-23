Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 3
Config.MarkerSize                 = { x = 1.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 162, g = 0, b = 255 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.ballasStations = {

  ballas = {

    Blip = {
      Pos     = { x = 101.70, y = -1937.35, z = 20.80},
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
      { x = 115.49, y = -1968.92, z = 21.33}, -- Vestiaire
    },

    Armories = {
      { x = 106.3972, y = -1981.2757, z = 20.9626}, -- Armurerie
    },

    Vehicles = {
      {
        Spawner    = { x = 102.33, y = -1964.14, z = 20.84 }, -- Menu véhicules
        SpawnPoint = { x = 102.33, y = -1964.14, z = 20.84 }, -- Point d'apparitions
        Heading    = 349.56, -- Angle d'apparation
      }
    },

    VehicleDeleters = {
      { x = 102.33, y = -1964.14, z = 20.84 }, -- Ranger véhicule
    },

    BossActions = {
      { x = 119.87, y = -1968.19, z = 21.33 }, -- Actions Patron
    },

  },

}