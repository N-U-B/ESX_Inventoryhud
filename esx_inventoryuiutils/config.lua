local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["-"] = 84,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

Config = {}

Config.CheckOwnership = false -- If true, Only owner of vehicle can store items in trunk.
Config.AllowPolice = false -- If true, police will be able to search players' trunks.

Config.Locale = "en"

Config.OpenKey = Keys["-"]

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 10

Config.localWeight = {

	bread = 100,
	water = 150,
	black_money = 1000000,
    casino_chip = 1000000,
	stone = 2880,
	washed_stone = 2880,
	copper = 90,
	diamond = 720,
	gold = 240,
	iron = 120,
	medikit = 50,
	weed = 1008,
	weed_pooch = 201.6,
	coke = 1008,
	coke_pooch = 201.6,
	meth = 1008,
	meth_pooch = 201.6,
	opium = 1008,
	opium_pooch = 201.6,
	alive_chicken = 5,
	grapes = 60,
	slaughtered_chicken = 5,
	packaged_chicken = 5,
	fish = 5,
	wood = 576,
	cutted_wood = 576,
	packaged_plank = 576,
	petrol = 120,
	petrol_raffin = 120,
	essence = 120,
	clothe = 1440,
	fabric = 1440,
	whool = 1440,
	benzoquinone = 7000,
	methanol = 7000,
	palladium = 7000,
	distilled_water = 7000,
    mdma_1g = 5000,
	mdma_2kg = 5000,
	mdma_4kg = 5000,
	mdma_6kg = 5000,
	druggasoline = 7000,
	drugfilter = 7000,
	solvent = 7000,
	cocaleaves = 7000,
    cocaine_1g = 5000,
	cocaine_2kg = 5000,
	cocaine_4kg = 5000,
	cocaine_6kg = 5000,
	cannabis = 700,
	drugscissors = 7000,
	dryingagent = 7000,
	drugpackaging = 3500,
    weed_1g = 5000,
	weed_2kg = 5000,
	weed_4kg = 5000,
	weed_6kg = 5000,


	WEAPON_KNIFE = 2000, WEAPON_KNUCKLE = 3000, WEAPON_NIGHTSTICK = 9999999, WEAPON_HAMMER = 5000, WEAPON_BAT = 7500, WEAPON_GOLFCLUB = 8000, WEAPON_CROWBAR = 7500, WEAPON_BOTTLE = 2500, WEAPON_DAGGER = 2500, WEAPON_HATCHET = 7500, WEAPON_MACHETE = 7500, WEAPON_FLASHLIGHT = 1500, WEAPON_SWITCHBLADE = 5000, WEAPON_PROXMINE = 9999999, WEAPON_BZGAS = 9999999, WEAPON_SMOKEGRENADE = 9999999, WEAPON_MOLOTOV = 9999999, WEAPON_FIREEXTINGUISHER = 9999999, WEAPON_PETROLCAN = 5000, WEAPON_SNOWBALL = 1000, WEAPON_FLARE = 9999999, WEAPON_BALL = 1000, WEAPON_REVOLVER = 22500, WEAPON_POOLCUE = 2500, WEAPON_PIPEWRENCH = 2500, WEAPON_PISTOL = 7500, WEAPON_PISTOL_MK2 = 10000, WEAPON_COMBATPISTOL = 9999999, WEAPON_APPISTOL = 20000, WEAPON_PISTOL50 = 15000, WEAPON_SNSPISTOL = 5000, WEAPON_HEAVYPISTOL = 11000, WEAPON_VINTAGEPISTOL = 9000, WEAPON_STUNGUN = 9999999, WEAPON_FLAREGUN = 9999999, WEAPON_MARKSMANPISTOL = 10000, WEAPON_MICROSMG = 15000, WEAPON_SMG = 22500, WEAPON_SMG_MK2 = 20000, WEAPON_ASSAULTSMG = 22500, WEAPON_MG = 9999999, WEAPON_COMBATMG = 9999999, WEAPON_COMBATMG_MK2 = 9999999, WEAPON_COMBATPDW = 9999999, WEAPON_GUSENBERG = 22500, WEAPON_MACHINEPISTOL = 15000, WEAPON_ASSAULTRIFLE = 22500, WEAPON_ASSAULTRIFLE_MK2 = 25000, WEAPON_CARBINERIFLE = 30000, WEAPON_CARBINERIFLE_MK2 = 25000, WEAPON_ADVANCEDRIFLE = 27500, WEAPON_SPECIALCARBINE = 31000, WEAPON_BULLPUPRIFLE = 30000, WEAPON_COMPACTRIFLE = 17500, WEAPON_PUMPSHOTGUN = 9999999, WEAPON_SWEEPERSHOTGUN = 12500,WEAPON_SAWNOFFSHOTGUN = 20000, WEAPON_BULLPUPSHOTGUN = 9999999, WEAPON_ASSAULTSHOTGUN = 32500, WEAPON_MUSKET = 35000, WEAPON_HEAVYSHOTGUN = 32500, WEAPON_DBSHOTGUN = 35000, WEAPON_SNIPERRIFLE = 9999999, WEAPON_HEAVYSNIPER = 9999999, WEAPON_HEAVYSNIPER_MK2 = 9999999, WEAPON_MARKSMANRIFLE = 35000, WEAPON_GRENADELAUNCHER = 9999999, WEAPON_GRENADELAUNCHER_SMOKE = 9999999, WEAPON_RPG = 9999999, WEAPON_MINIGUN = 9999999, WEAPON_FIREWORK = 9999999, WEAPON_RAILGUN = 9999999, WEAPON_HOMINGLAUNCHER = 9999999, WEAPON_GRENADE = 9999999, WEAPON_STICKYBOMB = 9999999, WEAPON_COMPACTLAUNCHER = 9999999, WEAPON_SNSPISTOL_MK2 = 10000, WEAPON_REVOLVER_MK2 = 10000, WEAPON_DOUBLEACTION = 10000, WEAPON_SPECIALCARBINE_MK2 = 10000, WEAPON_BULLPUPRIFLE_MK2 = 10000, WEAPON_PUMPSHOTGUN_MK2 = 10000, WEAPON_MARKSMANRIFLE_MK2 = 10000,

}

Config.VehicleLimit = {
			[0] = 20160, --Compact
			[1] = 50400, --Sedan
			[2] = 50400, --SUV
			[3] = 50400, --Coupes
			[4] = 50400, --Muscle
			[5] = 10080, --Sports Classics
			[6] = 20160, --Sports
			[7] = 20160, --Super
			[8] = 10080, --Motorcycles
			[9] = 50400, --Offroad
			[10] = 181440, --Industrial
			[11] = 80640, --Utility
			[12] = 80640, --Vans
			[13] = 0, --Cycles
			[14] = 10080, --Boats
			[15] = 50400, --Helicopters
			[16] = 50400, --Planes
			[17] = 20160, --Service
			[18] = 20160, --Emergency
			[19] = 0, --Military
			[20] = 50400, --Commercial
			[21] = 0, --Trains
}

Config.VehiclePlate = {
    taxi = "TAXI",
    cop = "LSPD",
    ambulance = "EMS0",
    mecano = "MECA"
}
