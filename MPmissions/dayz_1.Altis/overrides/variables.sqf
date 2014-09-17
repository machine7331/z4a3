disableSerialization;

//Model Variables
Bandit1_DZ = 	"Bandit1_DZ";
BanditW1_DZ = 	"BanditW1_DZ";
Survivor1_DZ = 	"Survivor2_DZ";
Survivor2_DZ = 	"Survivor2_DZ";
Survivor3_DZ = "Survivor3_DZ";
Sniper1_DZ = 	"Sniper1_DZ";
Camo1_DZ = 		"Camo1_DZ";
Soldier1_DZ = 	"Soldier1_DZ";
Rocket_DZ = 	"Rocket_DZ";

AllPlayers_A3 = ["Bandit1_DZ","BanditW1_DZ","Survivor2_DZ","SurvivorW2_DZ","Sniper1_DZ","Camo1_DZ","Rocket_DZ","Survivor3_DZ","Bandit2_DZ","Survivor4_DZ"];
AllPlayers = ["Survivor3_DZ","Sniper1_DZ","Camo1_DZ","Soldier1_DZ","Rocket_DZ"];
AllPlayersVehicles = ["Survivor3_DZ","Sniper1_DZ","Camo1_DZ","Soldier1_DZ","Rocket_DZ","AllVehicles"];
SafeObjects = ["Land_Fire_DZ", "TentStorage", "Wire_cat1", "Sandbag1_DZ", "Hedgehog_DZ", "StashSmall", "StashMedium", "BearTrap_DZ", "DomeTentStorage", "CamoNet_DZ", "Trap_Cans", "TrapTripwireFlare", "TrapBearTrapSmoke", "TrapTripwireGrenade", "TrapTripwireSmoke", "TrapBearTrapFlare"];
MeleeWeapons = ["MeleeHatchet","MeleeCrowbar","MeleeMachete","MeleeBaseball","MeleeBaseBallBat","MeleeBaseBallBatBarbed","MeleeBaseBallBatNails","MeleeFishingPole"];
MeleeMagazines = ["hatchet_swing","crowbar_swing","Machete_swing","Bat_Swing","BatBarbed_Swing","BatNails_Swing","Fishing_Swing"];
Dayz_fishingItems = ["MeleeFishingPole"];

//Cooking
meatraw = [
    "FoodSteakRaw",
    "FoodmeatRaw",
    "FoodbeefRaw",
    "FoodmuttonRaw",
    "FoodchickenRaw",
    "FoodrabbitRaw",
    "FoodbaconRaw",
    "FoodgoatRaw",
	"FishRawTrout",
	"FishRawSeaBass",
	"FishRawTuna"
];
meatcooked = [
    "FoodSteakCooked",
    "FoodmeatCooked",
    "FoodbeefCooked",
    "FoodmuttonCooked",
    "FoodchickenCooked",
    "FoodrabbitCooked",
    "FoodbaconCooked",
	"FoodgoatCooked",
	"FishCookedTrout",
	"FishCookedSeaBass",
	"FishCookedTuna"
];

//Eating
no_output_food = [
	"FoodMRE",
	"FoodPistachio",
	"FoodNutmix",
	"FoodCandyAnders",
	"FoodCandyLegacys",
	"FoodCandyMintception"
]+meatcooked+meatraw;

food_with_output=[
    "FoodCanBakedBeans",
    "FoodCanSardines",
    "FoodCanFrankBeans",
    "FoodCanPasta",
	"FoodCanGriff",
	"FoodCanBadguy",
	"FoodCanBoneboy",
	"FoodCanCorn",
	"FoodCanCurgon",
	"FoodCanDemon",
	"FoodCanFraggleos",
	"FoodCanHerpy",
	"FoodCanDerpy",
	"FoodCanOrlok",
	"FoodCanPowell",
	"FoodCanTylers",
	"FoodCanUnlabeled",
	"FoodCanRusUnlabeled",
	"FoodCanRusPork",
	"FoodCanRusPeas",
	"FoodCanRusMilk",
	"FoodCanRusCorn",
	"FoodCanRusStew",
	"FoodChipsSulahoops",
	"FoodChipsMysticales"
];

food_output = [
    "TrashTinCan",
    "TrashTinCan",
    "TrashTinCan",
    "TrashTinCan",
	"FoodCanGriffEmpty",
	"FoodCanBadguyEmpty",
	"FoodCanBoneboyEmpty",
	"FoodCanCornEmpty",
	"FoodCanCurgonEmpty",
	"FoodCanDemonEmpty",
	"FoodCanFraggleosEmpty",
	"FoodCanHerpyEmpty",
	"FoodCanDerpyEmpty",
	"FoodCanOrlokEmpty",
	"FoodCanPowellEmpty",
	"FoodCanTylersEmpty",
	"FoodCanUnlabeledEmpty",
	"FoodCanRusUnlabeledEmpty",
	"FoodCanRusPorkEmpty",
	"FoodCanRusPeasEmpty",
	"FoodCanRusMilkEmpty",
	"FoodCanRusCornEmpty",
	"FoodCanRusStewEmpty",
	"FoodChipsSulahoopsEmpty",
	"FoodChipsMysticalesEmpty"
];
//Drinking
no_output_drink = ["ItemWaterbottle", "ItemWaterbottleBoiled"];

drink_with_output = [
    "ItemSoda",  //just to define item for ItemSodaEmpty
    "ItemSodaCoke",
    "ItemSodaPepsi",
    "ItemSodaMdew",
    "ItemSodaMtngreen",
    "ItemSodaR4z0r",
    "ItemSodaClays",
    "ItemSodaSmasht",
    "ItemSodaDrwaste",
    "ItemSodaLemonade",
    "ItemSodaLvg",
    "ItemSodaMzly",
    "ItemSodaRabbit"
];
drink_output = [
    "ItemSodaEmpty",
    "ItemSodaCokeEmpty",
    "ItemSodaPepsiEmpty",
    "ItemSodaMdewEmpty",
    "ItemSodaMtngreenEmpty",
    "ItemSodaR4z0rEmpty",
    "ItemSodaClaysEmpty",
    "ItemSodaSmashtEmpty",
    "ItemSodaDrwasteEmpty",
    "ItemSodaLemonadeEmpty",
    "ItemSodaLvgEmpty",
    "ItemSodaMzlyEmpty",
    "ItemSodaRabbitEmpty"
];
boil_tin_cans = [
    "TrashTinCan",
	"FoodCanGriffEmpty",
	"FoodCanBadguyEmpty",
	"FoodCanBoneboyEmpty",
	"FoodCanCornEmpty",
	"FoodCanCurgonEmpty",
	"FoodCanDemonEmpty",
	"FoodCanFraggleosEmpty",
	"FoodCanHerpyEmpty",
	"FoodCanDerpyEmpty",
	"FoodCanOrlokEmpty",
	"FoodCanPowellEmpty",
	"FoodCanTylersEmpty",
	"FoodCanUnlabeledEmpty",
	"FoodCanRusUnlabeledEmpty",
	"FoodCanRusStewEmpty",
	"FoodCanRusPorkEmpty",
	"FoodCanRusPeasEmpty",
	"FoodCanRusMilkEmpty",
	"FoodCanRusCornEmpty",
    "ItemSodaEmpty",
    "ItemSodaCokeEmpty",
    "ItemSodaPepsiEmpty",
    "ItemSodaMdewEmpty",
    "ItemSodaMtngreenEmpty",
    "ItemSodaR4z0rEmpty",
    "ItemSodaClaysEmpty",
    "ItemSodaSmashtEmpty",
    "ItemSodaDrwasteEmpty",
    "ItemSodaLemonadeEmpty",
    "ItemSodaLvgEmpty",
    "ItemSodaMzlyEmpty",
    "ItemSodaRabbitEmpty"
];

dayz_combatLog = "";
canRoll = true;


//Hunting Variables
dayZ_partClasses = [
	"PartFueltank",
	"PartWheel",
	//"PartGeneric",	//No need to add, it is default for everything
	"PartEngine"
];
dayZ_explosiveParts = [
	"palivo",
	"motor"
];
//Survival Variables
SleepFood =				2660; //minutes (48 hours)
SleepWater =			2000; //minutes (24 hours)
SleepTemperatur	= 		90 / 100;	//Firs Value = Minutes untill Player reaches the coldest Point at night (without other effects! night factor expected to be -1)			//TeeChange

//Server Variables
allowConnection = 		false;
isSinglePlayer =		false;
dayz_serverObjectMonitor = [];

//Streaming Variables (player only)
dayz_Locations = [];
dayz_locationsActive = [];

//GUI
Dayz_GUI_R = 0.38; // 0.7
Dayz_GUI_G = 0.63; // -0.63
Dayz_GUI_B = 0.26; // -0.26

//Player self-action handles
dayz_resetSelfActions = {
	s_player_fire =			-1;
	s_player_cook =			-1;
	s_player_boil =			-1;
	s_player_fireout =		-1;
	s_player_butcher =		-1;
	s_player_stealclothes =	-1;
	s_player_packtent = 	-1;
	s_player_packatent = 	-1;
	s_player_fillwater =	-1;
	s_player_fillwater2 = 	-1;
	s_player_fillfuel = 	-1;
	s_player_lisradio = 	-1;
	s_player_dropflare =    -1; 
	s_player_grabflare = 	-1;
	s_player_grabflare2 = 	-1;
	s_player_grabflare3 = 	-1;
	s_player_grabflare4 = 	-1;
	s_player_removeflare = 	-1;
	s_player_removeflare2 = 	-1;
	s_player_removeflare3 = 	-1;
	s_player_removeflare4 = 	-1;
	s_player_painkiller =	-1;
	s_player_studybody = 	-1;
	s_build_Sandbag1_DZ = 	-1;
	s_build_Hedgehog_DZ =	-1;
	s_build_Wire_cat1 =		-1;
	s_player_deleteBuild =	-1;
	s_player_moveBuild =	-1;
	s_player_forceSave = 	-1;
	s_player_flipveh = 		-1;
	s_player_getout = 		-1;
	s_player_getin1 = 		-1;
	s_player_getin2 = 		-1;
	s_shackbuild = 		    -1;
	s_player_getin3 = 		-1;
	s_player_stats =		-1;
	s_player_sleep =		-1;
	s_player_movedog =		-1;
	s_player_speeddog =		-1;
	s_player_calldog = 		-1;
	s_player_feeddog = 		-1;
	s_player_waterdog = 	-1;
	s_player_staydog = 		-1;
	s_player_trackdog = 	-1;
	s_player_barkdog = 		-1;
	s_player_warndog = 		-1;
	s_player_followdog = 	-1;
	s_player_bandageA3 = 	-1;
    s_player_chopA3 =       -1;
    s_player_makefireA3 =   -1;
	s_player_morphineA3 =	-1;
	s_player_heatpackA3 =	-1;
	s_player_painkillerA3 =	-1;
	s_player_antibioticA3 = -1;
    s_player_survivalpackA3 = -1;
	s_getAlive =			-1;
	s_doSand =              -1;
	s_doWire =              -1;
	s_doTTrap =             -1;
	s_doBTrap =             -1;
	s_getFood = 			-1;
	s_getDrink =			-1;
	s_doTent = 				-1;
	s_doATent = 				-1;
	s_doClothes1 = 				-1;
	s_doClothes2 = 				-1;
	s_doClothes3 = 				-1;
    s_player_adren =            -1;
	dayz_hunger2 = 				-1;
	dayz_thirst2 = 				-1;
	dayz_hunger3 =              -1;
	dayz_mre =				    -1;
	dayz_mre2 =				    -1;
	s_player_fishing =          -1;
	s_player_fishing_veh =      -1;
	s_player_fillfuel20 = -1;
	s_player_fillfuel5 = -1;
	s_player_siphonfuel = -1;
	s_player_repair_crtl = -1;
};
call dayz_resetSelfActions;

//Engineering variables
s_player_lastTarget = objNull;
s_player_repairActions = [];

//Initialize Medical Variables
r_interrupt = 			false;
r_doLoop = 				false;
r_self = 				false;
r_self_actions = 		[];
r_drag_sqf = 			false;
r_action = 				false;
r_action_unload = 		false;
r_player_handler = 		false;
r_player_handler1 = 	false;
r_player_dead = 		false;
r_player_unconscious = 	false;
r_player_infected =		false;
r_player_injured = 		false;
r_player_inpain = 		false;
r_player_loaded = 		false;
r_player_cardiac = 		false;
r_fracture_legs =		false;
r_player_dead =         false;
r_fracture_arms =		false;
r_player_vehicle =		player;
r_player_currentCar =	player;
r_player_blood = 		12000;
r_player_lowblood = 	false;
r_player_tranq =        false; 
r_player_onVehicleC =   false;
r_player_adren =        false;
r_player_timeout =		0;
r_player_bloodTotal = 	r_player_blood;
r_public_blood =		r_player_blood;
r_player_bloodDanger =	r_player_bloodTotal * 0.2;
r_player_actions = 		[];
r_handlerCount = 		0;
r_action_repair = 		false;
r_action_targets = 		[];
r_pitchWhine = 			false;
r_isBandit =			false;

//ammo routine
r_player_actions2 = [];
r_action2 = false;
r_player_lastVehicle = objNull;
r_player_lastSeat = [];
r_player_removeActions2 = {
	if (!isNull r_player_lastVehicle) then {
		{
			r_player_lastVehicle removeAction _x;
		} forEach r_player_actions2;
		r_player_actions2 = [];
		r_action2 = false;
	};
};

USEC_woundHit 	= [
	"",
	"body",
	"hands",
	"legs",
	"head_hit"
];
DAYZ_woundHit 	= [
	[
		"body",
		"hands",
		"legs",
		"head_hit"
	],
	[ 0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,2,2,3]
];
DAYZ_woundHit_ok = [
	[
		"body",
		"hands",
		"legs"
	],
	[0,0,0,0,0,1,1,1,2,2]
];
DAYZ_woundHit_dog = [
	[
		"body",
		"hands",
		"legs"
	],
	[0,0,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2]
];
USEC_MinorWounds 	= [
	"hands",
	"legs"
];
USEC_woundPoint	= [
	["Pelvis","aimpoint"],
	["aimpoint"], //,"RightShoulder","LeftShoulder"
	["lelbow","relbow"],
	["RightFoot","LeftFoot"],
	["neck","pilot"]
];
USEC_typeOfWounds = [
	"Pelvis",
	"aimpoint",
	"lelbow","relbow",
	"RightFoot","LeftFoot",
	"neck","pilot"
];

//Initialize Zombie Variables
dayz_zombieTargetList = [
	["SoldierWB",50],
	["Air",500],
	["LandVehicle",200]
];
dayzHit = [];
dayzPublishObj = [];		//used for eventhandler to spawn a mirror of players tent
dayzPublishObj2 = [];
dayzHideBody = objNull;

//deadnation settings
dayz_dawn = 6;
dayz_dusk = 18;
dayz_maxAnimals = 10;
DAYZ_agentnumber = 0;
dayz_animalDistance = 800;
dayz_zSpawnDistance = 1000;
dayz_maxGlobalZombies = 60;
dayz_maxZeds = 500;
dayz_spawnPos = getPosATL player;
//Current local
dayz_swarmSpawnZombies = 0;
//Max local
	dayz_maxLocalZombies = 30; // max quantity of Z controlled by local gameclient, used by player_spawnCheck. Below this limit we can spawn Z
//Current NearBy
	dayz_CurrentNearByZombies = 0;
//Max NearBy
	dayz_maxNearByZombies = 60; // max quantity of Z controlled by local gameclient, used by player_spawnCheck. Below this limit we can spawn Z
//Current total
	dayz_currentGlobalZombies = 0;
//Max global zeds.
	dayz_maxGlobalZeds = 3000;
//Animals
	dayz_currentGlobalAnimals =	0;
	dayz_maxGlobalAnimals =		100;
//Plnats	
	dayz_currentGlobalPlants = 0;
	dayz_maxGlobalPlants = 100;
dayz_maxMaxModels = 80; // max quantity of Man models (player or Z, dead or alive) around players. Below this limit we can spawn Z // max quantity of loot piles around players. Below this limit we can spawn some loot
dayz_spawnArea = 200; // radius around player where we can spawn loot & Z
dayz_cantseeDist = 150; // distance from which we can spawn a Z in front of any player without ray-tracing and angle checks
dayz_cantseefov = 70; // half player field-of-view. Visible Z won't be spawned in front of any near players
dayz_canDelete = 300; // Z, further than this distance from its "owner", will be deleted
dayz_localswarmSpawned = 10;  // how many zeds will spawn around you during a combat scenario. (NOT USED)
dayz_wildzeds = 0 //Enable(1) - disable(0) wild spawning zeds.	
//init global arrays for Loot Chances
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\loot_init.sqf";

if(isServer) then {
	dayz_players = [];
	dead_bodyCleanup = [];
	needUpdate_objects = [];
};

if(!isDedicated) then {
	//Establish Location Streaming
	_funcGetLocation = 
	{
		for "_i" from 0 to ((count _this) - 1) do 
		{
			private ["_location","_config","_locHdr","_position","_size","_type"];
			//Get Location Data from config
			_config = 	(_this select _i);
			_locHdr = 	configName _config;
			_position = getArray	(_config >> "position");
			_size = 	getNumber	(_config >> "size");
			_type = 	getText		(_config >> "type");
			
			//Find the Location
			_location = nearestLocation [_position, _type];
			
			//Record details
			dayz_Locations set [count dayz_Locations, [_location,_locHdr,_size]]; 
		};
	};
	_cfgLocation = configFile >> "CfgTownGenerator";
	_cfgLocation call _funcGetLocation;
	
	dayz_buildingMonitor = [];	//Buildings to check
	dayz_bodyMonitor = [];
	dayz_flyMonitor = [];		//used for monitor flies
	
	dayz_baseTypes = 		getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
	
	//temperature variables
	dayz_temperatur 		= 	36;		//TeeChange
	dayz_temperaturnormal 	= 	36;		//TeeChange
	dayz_temperaturmax 		= 	42;		//TeeChange
	dayz_temperaturmin 		= 	27;		//TeeChange
	
	//player special variables
	dayz_spawnselection =   1;
	dayZ_lastPlayerUpdate = 0;
	dayZ_everyonesTents =	[];
	dayz_hunger	=			0;
	dayz_thirst = 			0;
	dayz_combat =			0;
	dayz_preloadFinished = 	false;
	dayz_statusArray =		[1,1];
	dayz_disAudial =		0;
	dayz_disVisual =		0;
	dayz_firedCooldown = 	0;
	dayz_DeathActioned =	false;
	dayz_canDisconnect = 	true;
	dayz_damageCounter =	time;
	dayz_lastSave =			time;
	dayz_isSwimming	=		true;
	dayz_currentDay = 		0;
	dayz_hasLight = 		false;
	dayz_surfaceNoise =		0;
	dayz_surfaceType =		"None";
	dayz_noPenalty = 		[];
	dayz_heavenCooldown =	0;
	deathHandled = 			false;
	dayz_lastHumanity =		0;
	dayz_guiHumanity =		-90000;
	dayz_firstGroup = 		group player;
	dayz_originalPlayer = 	player;
	dayz_playerName =		"Unknown";
	dayz_sourceBleeding =	objNull;
	dayz_clientPreload = 	false;
	dayz_panicCooldown = 	0;
	dayz_areaAffect =		2;
    dayz_group =            grpNull;
	dayz_heartBeat = 		false;
	dayzClickTime =			0;
	dayz_spawnDelay =		120;
	dayz_spawnWait =		-120;
	dayz_lootDelay =		30;
	dayz_lootWait =			-120;
	dayz_spawnZombies =		0;
    dayz_lightOn =          true;
	//used to count global zeds around players
	dayz_CurrentZombies = 0;
	//Used to limit overall zed counts
	dayz_maxCurrentZeds = 0;
	dayz_inVehicle =		false;
	dayz_Magazines = 		[];
	dayzGearSave = 			false;
	dayz_unsaved =			false;
	dayz_scaleLight = 		0;
	dayzDebug = false;
	dayzState = -1;
    dayz_pendingInvite =    "";
	dayz_fishingInprogress = false;
	//uiNamespace setVariable ['DAYZ_GUI_display',displayNull];
	//if (uiNamespace getVariable ['DZ_displayUI', 0] == 2) then {
	//	dayzDebug = true;
	//};
};
