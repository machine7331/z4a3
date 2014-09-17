CODEINPUT = [];
CODE = [];
DEFUSED = false;
/*	
	INITILIZATION
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	1;					//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
//enableRadio false;
setViewDistance 2000;
setTerrainGrid 10;

//Load in compiled functions
call compile preprocessFileLineNumbers "overrides\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "overrides\compiles.sqf";				//Compile regular functions
progressLoadingScreen 1.0;


if ((!isServer) && (isNull player) ) then
{
waitUntil {!isNull player};
waitUntil {time > 3};
};

if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
  waitUntil {time > 3};
};

if (isServer) then {
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
   
};
waitUntil {time > 0}; 
enableEnvironment false;
[] execVM "scripts\vehicleManager.sqf"; // AgentRev FPS Fix
[] execVM "scripts\cpcnametags.sqf";
[] execVM "addons\R3F_LOG\init.sqf";
[] execVM "addons\proving_Ground\init.sqf";
player_is_admin = player addAction ["Admin Menu", "addons\proving_ground\fnc_show_dialog.sqf",player, 0.5, false, false];