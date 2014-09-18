/*
	A3MSInit.sqf by Vampire
	This is the file that every other file branches off from.
	It checks that it is safe to run, sets relations, and starts mission timers.
	Edited for Arma 3 by JediChris816
*/
private["_modVariant"];

//waitUntil{initialized};

// Lets let the heavier scripts run first
sleep 60;

// Error Check
if (!isServer) exitWith { diag_log text format ["[A3MS]: <ERROR> A3MS is Installed Incorrectly! A3MS is not Running!"]; };
if (!isnil("A3MSInstalled")) exitWith { diag_log text format ["[A3MS]: <ERROR> A3MS is Installed Twice or Installed Incorrectly!"]; };

// Global for other scripts to check if A3MS is installed.
A3MSInstalled = true;

diag_log text format ["[A3MS]: Starting A3stan Mission System."];

// Let's see if we need to set relationships
// Checking for DayZAI, SargeAI, and WickedAI (Three AI Systems that already set relations)
// I would rather the user set their relations in the respective mod instead of overwrite them here.
if ( (isnil("A3AI_isActive")) && (isnil("SAR_version")) && (isnil("WAIconfigloaded")) ) then
{

	// They weren't found, so let's set relationships
	diag_log text format ["[A3MS]: Relations not found! Using A3MS Relations."];
	
	// Create the groups if they aren't created already
	createCenter east;
	// Make AI Hostile to Survivors
	WEST setFriend [EAST,0];
	EAST setFriend [WEST,0];
	// Make AI Hostile to Zeds
	EAST setFriend [CIVILIAN,0];
	CIVILIAN setFriend [EAST,0];
	
} else {

	// Let's inform the user which relations we are using
	// This could be made better in a future version
	A3MSRelations = 0; //Set our counter variable
	if (!isnil("A3AI_isActive")) then {
		diag_log text format ["[A3MS]: A3AI Found! Using A3AI's Relations!"];
		A3MSRelations = A3MSRelations + 1;
	};
	if (!isnil("SAR_version")) then {
		diag_log text format ["[A3MS]: SargeAI Found! Using SargeAI's Relations!"];
		A3MSRelations = A3MSRelations + 1;
	};
	if (!isnil("WAIconfigloaded")) then {
		diag_log text format ["[A3MS]: WickedAI Found! Using WickedAI's Relations!"];
		A3MSRelations = A3MSRelations + 1;
	};
	// If we have multiple relations running, lets warn the user
	if (A3MSRelations > 1) then {
		diag_log text format ["[A3MS]: Multiple Relations Detected! Unwanted AI Behaviour May Occur!"];
		diag_log text format ["[A3MS]: If Issues Arise, Decide on a Single AI System! (DayZAI, SargeAI, or WickedAI)"];
	};
	A3MSRelations = nil; //Destroy the Global Var
	
};

// Let's Load the Mission Configuration
call compile preprocessFileLineNumbers "\z\addons\invasion_server\A3MS\A3MSConfig.sqf";

// These are Extended configuration files the user can adjust if wanted
call compile preprocessFileLineNumbers "\z\addons\invasion_server\A3MS\ExtConfig\A3MSWeaponCrateList.sqf";
call compile preprocessFileLineNumbers "\z\addons\invasion_server\A3MS\ExtConfig\A3MSAIConfig.sqf";

// Report the version
diag_log text format ["[A3MS]: Currently Running Version: %1", A3MSVersion];

// Lets check for a copy-pasted config file
if (A3MSVersion != "RC1.1") then {
	diag_log text format ["[A3MS]: Outdated Configuration Detected! Please Update A3MS!"];
	diag_log text format ["[A3MS]: Old Versions are not supported by the Mod Author!"];
};

diag_log text format ["[A3MS]: Mission and Extended Configuration Loaded!"];

// Lets get the map name for mission location purposes
A3MSWorldName = toLower format ["%1", worldName];
diag_log text format["[A3MS]: %1 Detected. Map Specific Settings Adjusted!", A3MSWorldName];

// We need to detect Epoch to change the hive call for vehicle saving
// Epoch doesn't have hive 999 calls and uses 308 publish instead
_modVariant = toLower( getText (configFile >> "CfgMods" >> "DayZ" >> "dir"));
if (_modVariant == "@dayz_epoch") then {A3MSEpoch = true;} else {A3MSEpoch = false;};
if ((!(A3MSEpoch)) AND (!(isNil "PVA3E_serverObjectMonitor"))) then {A3MSEpoch = true;};

if (A3MSEpoch) then {
	diag_log text format ["[A3MS]: DayZ Epoch Detected! Some Scripts Adjusted!"];
};

// Lets load our functions
call compile preprocessFileLineNumbers "\z\addons\invasion_server\A3MS\A3MSFunctions.sqf";

// these arrays are used to hold units for each mission type
A3MSUnitsMinor = [];
A3MSUnitsMajor = [];

// Let's get the clocks running!
[] ExecVM A3MSMajTimer;
[] ExecVM A3MSMinTimer;

// Let's get the Marker Re-setter running for JIPs to stay updated
[] ExecVM A3MSMarkerLoop;
