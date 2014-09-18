/*
	DayZ Mission System Config by Vampire
	A3MS: https://github.com/SMVampire/A3MS-DayZMissionSystem
*/

///////////////////////////////////////////////////////////////////////
// Do you want your players to gain humanity from killing mission AI?
A3MSMissHumanity = false;

// How Much Humanity?
A3MSCntHumanity = 25;

// Do You Want AI to use NVGs?
//(They are deleted on death)
A3MSUseNVG = No;

// Do you want AI to use RPG7V's?
//(Only one unit per group spawn will have one)
A3MSUseRPG = false;

// Do you want AI kills to count as bandit kills?
A3MSCntBanditKls = true;

// Do you want AI to disappear instantly when killed?
A3MSCleanDeath = false;

// Do you want AI that players run over to not have gear?
// (If A3MSCleanDeath is true, this doesn't matter)
A3MSRunGear = false;

// How long before bodies disappear? (in seconds) (default = 2400)
A3MSBodyTime = 2400;

// Percentage of AI that must be dead before mission completes (default = 0)
//( 0 is 0% of AI / 0.50 is 50% / 1 is 100% )
A3MSRequiredKillPercent = 0.50;

// How long in seconds before mission scenery disappears (default = 1800 / 0 = disabled)
A3MSSceneryDespawnTimer = 1800;

// Should crates despawn with scenery? (default = false)
A3MSSceneryDespawnLoot = false;

//////////////////////////////////////////////////////////////////////////////////////////
// You can adjust the weapons that spawn in weapon crates inside A3MSWeaponCrateList.sqf
// You can adjust the AI's gear inside A3MSAIConfig.sqf in the ExtConfig folder also.
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
// Do you want to use static coords for missions?
// Leave this false unless you know what you are doing.
A3MSStaticPlc = false;

// Array of static locations. X,Y,Z
A3MSStatLocs = [
[0,0,0],
[0,0,0]
];

///////////////////////////////////////////////////////////////////////////////////////////////////////////
// Do you want vehicles from missions to save to the Database? (this means they will stay after a restart)
// If False, vehicles will disappear on restart. It will warn a player who gets inside of a vehicle.
// This is experimental, and off by default in this version.
A3MSSaveVehicles = true;

/////////////////////////////////////////////////////////////////////////////////////////////
// These are arrays of vehicle classnames for the missions.
// Adjust to your liking.

//Armed Choppers (Huey)
A3MSChoppers = ["UH1H_A3","Mi17_A3"];

//Small Vehicles (Humvees)
A3MSSmallVic = ["hilux1_civil_3_open_EP1","SUV_TK_CIV_EP1","HMMWV_A3","UAZ_Unarmed_UN_EP1","HMMWV_Armored","LandRover_CZ_EP1","hilux1_civil_3_open"];

//Large Vehicles (Urals)
A3MSLargeVic = ["Ural_TK_CIV_EP1","Ural_INS","UralRefuel_CDF","UralOpen_INS","Ural_CDF_A3"];

/*///////////////////////////////////////////////////////////////////////////////////////////
There are two types of missions that run simultaneously on a the server.
The two types are Major and Minor missions.

Major missions have a higher AI count, but also have more crates to loot.
Minor missions have less AI than Major missions, but have crates that reflect that.

Below is the array of mission file names and the minimum and maximum times they run.
Do not edit the Arrays unless you know what you are doing.
*/
A3MSMajorArray = ["SM1","SM2","SM3","SM4","SM5","SM6"];
A3MSMinorArray = ["SM1","SM2","SM3","SM4","SM5","SM6"];

/////////////////////////////////////////////////////////////////////////////////////////////
// The Minumum time in seconds before a major mission will run.
// At least this much time will pass between major missions. Default = 650 (10.8 Minutes)
A3MSMajorMin = 650;

// Maximum time in seconds before a major mission will run.
// A major mission will always run before this much time has passed. Default = 2000 (33.33 Minutes)
A3MSMajorMax = 2000;

// Time in seconds before a minor mission will run.
// At least this much time will pass between minor missions. Default = 600 (10 Minutes)
A3MSMinorMin = 600;

// Maximum time in seconds before a minor mission will run.
// A minor mission will always run before this much time has passed. Default = 990 (16.5 Minutes)
A3MSMinorMax = 990;

// Blacklist Zone Array -- missions will not spawn in these areas
// format: [[x,y,z],radius]
// Ex: [[06325,07807,0],300] //Starry Sobor
A3MSBlacklistZones = [
	[[0,0,0],50]
];

/*=============================================================================================*/
// Do Not Edit Below This Line
/*=============================================================================================*/
A3MSVersion = "RC1.1";
