/*
	Hummer Wreck by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
	Edited for ArmA 3 by JediChris816
*/
private ["_missName","_coords","_crash","_crate"];

//Name of the Mission
_missName = "Terrorist Vehicle Crash";

//A3MSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call A3MSFindPos;

[nil,nil,rTitleText,"A terrorist ground transport has crashed! Check your map for the location!", "PLAIN",10] call RE;

//A3MSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM A3MSAddMinMarker;

//Add the scenery
_crash = createVehicle ["HMMWVWreck",_coords,[], 0, "CAN_COLLIDE"];

//A3MSProtectObj prevents it from disappearing
[_crash] call A3MSProtectObj;

//Add and fill the crate
_crate = createVehicle ["Box_IND_WpsSpecial_F",[(_coords select 0) - 14, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"weapons"] ExecVM A3MSBoxSetup;
[_crate] call A3MSProtectObj;

//A3MSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[_coords,3,1,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 1;
[_coords,3,1,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 1;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"A3MSUnitsMinor"] call A3MSWaitMissionComp;

//Let everyone know the mission is over
[nil,nil,rTitleText,"The vehicle crash site has been secured!", "PLAIN",6] call RE;
diag_log text format["[A3MS]: Minor SM5 Humvee Crash Mission has Ended."];
deleteMarker "A3MSMinMarker";
deleteMarker "A3MSMinDot";

//Let the timer know the mission is over
A3MSMinDone = true;