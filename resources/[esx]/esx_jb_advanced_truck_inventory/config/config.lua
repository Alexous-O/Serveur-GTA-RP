--Truck
Config	=	{}

 -- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 0



-- If true, ignore rest of file
Config.WeightSqlBased = false

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:

Config.localWeight = {

    beer = 10,
    bread = 10,
    chocolat = 10,
    cigarett = 10,
    cocacola = 10,
    coffe = 10,
    cupcake = 10,
    hamburger = 10,
    icetea = 10,
    lighter = 10,
    milk = 10,
    sandwich = 10,
    tequila = 15,
    vodka = 15,
    water = 15,
    whisky = 15,
    wine = 15,
    alive_chicken = 200,
    slaughtered_chicken = 200,
    packaged_chicken = 200,
    fish = 150,
    stone = 500,
    washed_stone = 600,
    copper = 400,
    iron = 800,
    gold = 800,
    diamond = 700,
    wood = 1200,
    cutted_wood = 1200,
    packaged_plank = 1300,
    petrol = 1500,
    petrol_raffin = 2000,
    essence = 500,
    wool = 200,
    fabric = 200,
    clothe = 200,
    weed = 100,
    weed_pooch = 100,
    coke = 100,
    coke_pooch = 100,
    meth = 100,
    meth_pooch = 100,
    opium = 100,
    opium_pooch = 100,
    bandage = 250,
    medikit = 250,
    gazbottl = 1000,
    fixtool = 200,
    carotool = 200,
    blowpipe = 100,
    fixkit0 = 200,
    carokit = 150,
    tabacblond = 30,
    tabacbrun = 30,
    tabacblondsec = 30,
    tabacbrunsec = 30,
    malbora = 30,
    gitanes = 30,
    raisin = 80,
    jus_raisin = 100,
    grand_cru = 80,
    vine = 80,
    WEAPON_PISTOL = 800,
    WEAPON_FLASHLIGHT = 200,
    WEAPON_MACHETE = 400,
    WEAPON_NIGHTSTICK = 400,
    WEAPON_BAT = 500,
    WEAPON_STUNGUN = 100,
    WEAPON_MICROSMG = 1200,
    WEAPON_PUMPSHOTGUN = 1500,
    WEAPON_ASSAULTRIFLE = 2000,
    WEAPON_SPECIALCARBINE = 2200,
    WEAPON_SNIPERRIFLE = 5200,
    WEAPON_FIREWORK = 4000,
    WEAPON_GRENADE = 500,
    WEAPON_BZGAS = 500,
    WEAPON_FIREEXTINGUISHER = 500,
    WEAPON_BALL = 100,
    WEAPON_SMOKEGRENADE = 200,
    WEAPON_APPISTOL = 800,
    WEAPON_HEAVYSNIPER = 300,
    WEAPON_MINIGUN = 10000,
    WEAPON_RAILGUN = 5000,
    WEAPON_STICKYBOMB = 3000,
    WEAPON_PISTOL_AMMO = 1000,
    
}

Config.VehicleLimit = {
    [0] = 30000, --Compact
    [1] = 40000, --Sedan
    [2] = 70000, --SUV
    [3] = 25000, --Coupes
    [4] = 30000, --Muscle
    [5] = 10000, --Sports Classics
    [6] = 5000, --Sports
    [7] = 5000, --Super
    [8] = 5000, --Motorcycles
    [9] = 180000, --Off-road
    [10] = 300000, --Industrial
    [11] = 300000, --Utility
    [12] = 300000, --Vans
    [13] = 0, --Cycles
    [14] = 100000, --Boats
    [15] = 20000, --Helicopters
    [16] = 0, --Planes
    [17] = 300000, --Service
    [18] = 300000, --Emergency
    [19] = 0, --Military
    [20] = 300000, --Commercial
    [21] = 0, --Trains
}