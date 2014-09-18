/*
	Weapon Truck Crash by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
	Edited for ArmA 3 by JediChris816
*/
private ["_missName","_coords","_crash","_crate","_crate1","_crate2"];

//Name of the Mission
_missName = "Opfor Weapons Truck";

//A3MSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call A3MSFindPos;

[nil,nil,rTitleText,"An Opfor weapons truck has crashed! Check your map for the location!", "PLAIN",10] call RE;

//A3MSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM A3MSAddMinMarker;

//Add scenery
_crash = createVehicle ["UralWreck",_coords,[], 0, "CAN_COLLIDE"];

//A3MSProtectObj prevents it from disappearing
[_crash] call A3MSProtectObj;

//Add and fill the boxes
_crate = createVehicle ["Box_East_WpsSpecial_F",[(_coords select 0) + 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"weapons"] ExecVM A3MSBoxSetup;
[_crate] call A3MSProtectObj;

_crate1 = createVehicle ["Box_NATO_WpsLaunch_F",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate1,"weapons"] ExecVM A3MSBoxSetup;
[_crate1] call A3MSProtectObj;

_crate2 = createVehicle ["I_supplyCrate_F",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2,"weapons"] ExecVM A3MSBoxSetup;
[_crate2] call A3MSProtectObj;

//A3MSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[_coords,3,0,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 1;
[_coords,3,0,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 1;
[_coords,3,0,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 1;
[_coords,3,0,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 1;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"A3MSUnitsMinor"] call A3MSWaitMissionComp;

//Let everyone know the mission is over
[nil,nil,rTitleText,"The Ural crash site has been secured!", "PLAIN",6] call RE;
diag_log text format["[A3MS]: Minor SM6 Ural Crash Mission has Ended."];
deleteMarker "A3MSMinMarker";
deleteMarker "A3MSMinDot";

//Let the timer know the mission is over
A3MSMinDone = true;