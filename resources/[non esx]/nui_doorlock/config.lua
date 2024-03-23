Config = {}
Config.ShowUnlockedText = false
Config.CheckVersion = true
Config.CheckVersionDelay = 60 -- Minutes
Config.KeybingText = 'Interagir avec une serrure de porte'

Config.DoorList = {}


-- 
table.insert(Config.DoorList, {
	objHash = -1844444717,
	locked = true,
	objHeading = 340.00003051758,
	slides = false,
	lockpick = false,
	objCoords = vector3(-29.86917, -148.1571, 57.22648),
	audioRemote = false,
	garage = false,
	maxDistance = 2.0,
	fixText = false,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})


