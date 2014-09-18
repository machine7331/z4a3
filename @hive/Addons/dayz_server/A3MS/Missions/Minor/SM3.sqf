/*
	Bandit Stash House by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
	Edited for ArmA 3 by JediChris816
*/
private ["_missName","_coords","_base","_base1","_base2","_veh1","_veh2","_vehicle","_vehicle1","_crate"];

//Name of the Mission
_missName = "Terrorist Campsite";

//A3MSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call A3MSFindPos;

[nil,nil,rTitleText,"A group of terrorists have set up a remote campground! Check your map for the location!", "PLAIN",10] call RE;

//A3MSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM A3MSAddMinMarker;

//We create the scenery
_base = createVehicle ["Land_TentDome_F",[(_coords select 0) +2, (_coords select 1) +5,-0.3],[], 0, "CAN_COLLIDE"];
_base1 = createVehicle ["Land_TentA_F",[(_coords select 0) - 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_base2 = createVehicle ["Land_PartyTent_01_F",[(_coords select 0) - 7, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

//A3MSProtectObj prevents it from disappearing
[_base] call A3MSProtectObj;
[_base1] call A3MSProtectObj;
[_base2] call A3MSProtectObj;

//We create the vehicles
_veh1 = ["small"] call A3MSGetVeh;
_veh2 =["small"] call A3MSGetVeh;
_vehicle = createVehicle [_veh1,[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_vehicle1 = createVehicle [_veh2,[(_coords select 0) - 25, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

//A3MSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call A3MSSetupVehicle;
[_vehicle1] call A3MSSetupVehicle;

//We create and fill the crate
_crate = createVehicle ["Box_East_WpsSpecial_F",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"weapons"] ExecVM A3MSBoxSetup;
[_crate] call A3MSProtectObj;

//A3MSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) - 20, (_coords select 1) - 15,0],6,0,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 3;
[[(_coords select 0) + 20, (_coords select 1) + 15,0],6,0,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 3;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"A3MSUnitsMinor"] call A3MSWaitMissionComp;

//Call A3MSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
[_vehicle] ExecVM A3MSSaveVeh;
[_vehicle1] ExecVM A3MSSaveVeh;

//Let everyone know the mission is over
[nil,nil,rTitleText,"The campsite has been cleared and taken over!", "PLAIN",6] call RE;
diag_log text format["[A3MS]: Minor SM3 Terrorist Campsite Mission has Ended."];
deleteMarker "A3MSMinMarker";
deleteMarker "A3MSMinDot";

//Let the timer know the mission is over
A3MSMinDone = true;