/*
Bandit Supply Heli Crash by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
New Mission Format by Vampire
Edited for ArmA 3 by JediChris816
*/

private ["_coords","_ranChopper","_chopper","_crate","_crate2","_crate3"];

//A3MSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call A3MSFindPos;

[nil,nil,rTitleText,"A terrorist supply helicopter has crash landed! Check your map for the location!", "PLAIN",10] call RE;

//A3MSAddMajMarker is a simple script that adds a marker to the location
[_coords] ExecVM A3MSAddMajMarker;

//We create the vehicles like normal
_ranChopper = ["O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F"] call BIS_fnc_selectRandom;
_chopper = createVehicle [_ranChopper,_coords,[], 0, "NONE"];

//A3MSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_chopper] call A3MSSetupVehicle;

_crate = createVehicle ["Box_East_AmmoOrd_F",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];

//A3MSBoxFill fills the box, A3MSProtectObj prevents it from disappearing
[_crate,"weapons"] ExecVM A3MSBoxSetup;
[_crate] call A3MSProtectObj;

_crate2 = createVehicle ["Box_FIA_Wps_F",[(_coords select 0) + 6, _coords select 1,0],[], 90, "CAN_COLLIDE"];
[_crate2,"weapons"] ExecVM A3MSBoxSetup;
[_crate2] call A3MSProtectObj;

_crate3 = createVehicle ["Box_East_WpsLaunch_F",[(_coords select 0) - 14, (_coords select 1) -10,0],[], 0, "CAN_COLLIDE"];
[_crate3,"weapons"] ExecVM A3MSBoxSetup;
[_crate3] call A3MSProtectObj;

//A3MSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[_coords,6,1] ExecVM A3MSAISpawn;
sleep 5;
[_coords,4,1] ExecVM A3MSAISpawn;
sleep 5;
[_coords,4,1] ExecVM A3MSAISpawn;
sleep 5;

//Wait until the player is within 30meters
waitUntil{{isPlayer _x && _x distance _coords <= 30 } count playableunits > 0};

//Call A3MSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
[_chopper] ExecVM A3MSSaveVeh;

//Let everyone know the mission is over
[nil,nil,rTitleText,"The helicopter has been secured!", "PLAIN",6] call RE;
diag_log format["[A3MS]: Major SM4 Helicopter Landing Mission has Ended."];
deleteMarker "A3MSMajMarker";

//Let the timer know the mission is over
A3MSMajDone = true;