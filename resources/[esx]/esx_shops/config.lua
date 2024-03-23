Config              = {}
Config.DrawDistance = 100
Config.Size         = {x = 1.5, y = 1.5, z = 0.5}
Config.Color        = {r = 0, g = 128, b = 255}
Config.Type         = 2
Config.Locale       = 'fr'

Config.Map = {
  {name="Tequil-La La",color=27, id=93, x=-565.906, y=276.093, z=100.176},
  {name="Bahamas",color=27, id=93,x =-1388.409, y =-585.624, z =100.319},
  {name="Stripclub",color=27, id=121,x =132.17, y =-1304.42, z =100.319},
  {name="Yellow Jack",color=27, id=93,x =1992.69, y =3058.57, z =100.319},
  {name="Galaxy",color=27, id=93,x =5.00, y =220.24, z =107.72}, -- Wainting for the nightclub id blip
  {name="Boutique",color=2, id=52,x =373.875, y =325.896, z =100.319},
  {name="Boutique",color=2, id=52,x =2557.458, y =382.282, z =100.319},
  {name="Boutique",color=2, id=52,x =-3038.939, y =585.954, z =6.908},
  --{name="Boutique",color=2, id=52,x =-3241.927, y =1001.462, z =11.830},
  --{name="Boutique",color=2, id=52,x =547.431, y =2671.710, z =41.156},
  {name="Boutique",color=2, id=52,x =1961.464, y =3740.672, z =31.343},
  {name="Boutique",color=2, id=52,x =2678.916, y =3280.671, z =54.241},
  {name="Boutique",color=2, id=52,x =1729.216, y =6414.131, z =34.037},
  {name="Boutique",color=2, id=52,x =1135.808, y =-982.281, z =45.415},
  --{name="Boutique",color=2, id=52,x =-1222.915, y =-906.983, z =11.326},
  {name="Boutique",color=2, id=52,x =-1487.553, y =-379.107, z =39.163},
  --{name="Boutique",color=2, id=52,x =-2968.243, y =390.910, z =14.043},
  {name="Boutique",color=2, id=52,x =1166.024, y =2708.930, z =37.157},
  --{name="Boutique",color=2, id=52,x =1392.562, y =3604.648, z =33.980},
  --{name="Boutique",color=2, id=52,x =-48.519, y =-1757.514, z =28.421},
  --{name="Boutique",color=2, id=52,x =1163.373, y =-323.801, z =68.205},
  {name="Boutique",color=2, id=52,x =-707.501, y =-914.260, z =18.215},
  {name="Boutique",color=2, id=52,x =-1820.523, y =792.518, z =137.118},
  {name="Boutique",color=2, id=52,x =1698.388, y =4924.404, z =41.063},
  --{name="Shop LifeInVader",color=5, id=606,x = -1082.04, y = -247.758, z = 37.763}, --shoplifeinvader
 -- {name="Boutique",color=2, id=52,x = 190.6607, y = -889.611, z = 30.713}
  --{name="Marché Noir",color=47, id=52,x =1718.8658,  y = 4791.7822,  z = 41.9765}
  --{name="Vendeur munitions",color=47, id=52,x =1718.8658,  y = 4791.7822,  z = 41.9765}
  
}

Config.Zones = {

    TwentyFourSeven = {
        Items = {bread, chocolate, sandwich, hamburge, cupcake, water, cocacola, icetea, coffe, milk, cigarett, lighter, phone, jumelles, opona},
        Pos = {
            {x = 373.875,   y = 325.896,  z = 103.166},
            {x = 2557.458,  y = 382.282,  z = 108.122},
            {x = -3038.939, y = 585.954,  z = 7.408},
            --{x = -3241.927, y = 1001.462, z = 11.830},
            --{x = 547.431,   y = 2671.710, z = 41.156},
            {x = 1961.464,  y = 3740.672, z = 31.843},
            {x = 2678.916,  y = 3280.671, z = 54.741},
            {x = 1729.216,  y = 6414.131, z = 34.537},
            --{x = 190.6607, y = -889.611, z = 30.313}
        }
    },


    ShopLifeInVader = {
        Items = {bread, chocolate, sandwich, hamburge, cupcake, water, cocacola, icetea, coffe, milk, cigarett, lighter, phone, sim, opona},
        Pos = {
            --{x = -1082.04, y = -247.758, z = 37.763}, --shop lifeinvader
           -- {x = 2557.458,  y = 382.282,  z = 108.122},
           -- {x = -3038.939, y = 585.954,  z = 7.408},
            --{x = -3241.927, y = 1001.462, z = 11.830},
            --{x = 547.431,   y = 2671.710, z = 41.156},
           -- {x = 1961.464,  y = 3740.672, z = 31.843},
           -- {x = 2678.916,  y = 3280.671, z = 54.741},
            --{x = 1729.216,  y = 6414.131, z = 34.537},
            --{x = 190.6607, y = -889.611, z = 30.313}
        }
    },


    RobsLiquor = {
        Items = {bread, chocolate, sandwich, hamburge, cupcake, water, cocacola, icetea, coffe, milk, cigarett, lighter, phone, jumelles, opona},
        Pos = {
            {x = 1135.808,  y = -982.281,  z = 45.815},
            --{x = -1222.915, y = -906.983,  z = 11.326},
            {x = -1487.553, y = -379.107,  z = 39.663},
            --{x = -2968.243, y = 390.910,   z = 14.043},
            {x = 1166.024,  y = 2708.930,  z = 37.657},
            --{x = 1392.562,  y = 3604.684,  z = 33.980}
        }
    },

    MarcheNoir = {
        Items = {clip, piluleoubli, radardetector, opona, lockpick},
        Pos = {
            --{x = 1135.808,  y = -982.281,  z = 45.415},
            --{x = -1222.915, y = -906.983,  z = 11.326},
            --{x = -1487.553, y = -379.107,  z = 39.163},
            --{x = -2968.243, y = 390.910,   z = 14.043},
            --{x = 1718.236, y = 4792.256, z = 41.982},  -- marché noir
            --{x = 1392.562,  y = 3604.684,  z = 33.980}
        }
    },

    VendeurMunitions = {
        Items = {clip, suppressor, flashlight},
        Pos = {
            --{x = 1135.808,  y = -982.281,  z = 45.415},
            --{x = -1222.915, y = -906.983,  z = 11.326},
            --{x = -1487.553, y = -379.107,  z = 39.163},
            --{x = -2968.243, y = 390.910,   z = 14.043},
            {x = 1696.183, y = 3758.826, z = 34.305},
            {x = -327.590, y = 6082.856, z = 31.0}
        }
    },

    LTDgasoline = {
        Items = {bread, chocolate, sandwich, hamburge, cupcake, water, cocacola, icetea, coffe, milk, cigarett, lighter, phone, jumelles, opona},
        Pos = {
            --{x = -48.519,   y = -1757.514, z = 28.421},
            --{x = 1163.373,  y = -323.801,  z = 68.205},
            {x = -707.501,  y = -914.260,  z = 18.815},
            {x = -1820.523, y = 792.518,   z = 137.618},
            {x = 1698.388,  y = 4924.404,  z = 41.563}
        }
    },

    Bar = {
        Items = {beer, wine, vodka, tequila, whisky, cigarett, lighter},
        Pos = {
            {x = 127.830,   y = -1284.796, z = 28.780}, --StripClub
            --{x = -1393.409, y = -606.624,  z = 29.819}, --Bahamamas
            {x = -559.906,  y = 287.093,   z = 81.676}, --Tequila la
            {x = 1986.18,   y = 3054.31,   z = 46.532}
        }
    },
	
    Disco = {
        Items = {beer, wine, vodka, tequila, whisky, cigarett, lighter},
        Pos = {
            {x = -1586.922,   y = -3012.860, z = -76.504}, --Upstairs
			{x = -1578.204,   y = -3014.460, z = -79.505}  --Downstairs
        }
    }
}


