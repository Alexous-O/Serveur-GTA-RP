Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 3
Config.MarkerSize                 = { x = 1.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 255, g = 255, b = 0 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.vagosStations = {

  vagos = {

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
      { x = 360.9, y = -2032.3, z = 25.59}, -- Vestiaire
    },


    Armories = {
      { x = 352.52, y = -2032.78, z = 25.59}, -- Armurerie
    },

    Vehicles = {
      {
        Spawner    = { x = 332.34, y = -2030.38, z = 21.23 }, -- Menu véhicules
        SpawnPoint = { x = 327.78, y = -2034.06, z = 20.95 }, -- Point d'apparitions
        Heading    = 38.16, -- Angle d'apparation
      }
    },

    VehicleDeleters = {
      { x = 327.78, y = -2034.06, z = 20.95 }, -- Ranger véhicule
    },

    BossActions = {
      { x = 360.98, y = -2041.19, z = 25.59 }, -- Actions Patron
    },

  },

}