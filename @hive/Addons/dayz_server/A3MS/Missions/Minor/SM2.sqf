/*
	Medical Outpost by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/
private ["_missName","_coords","_base","_base1","_base2","_base3","_veh1","_veh2","_vehicle","_vehicle1","_crate","_crate2"];

//Name of the Mission
_missName = "Terrorist Medical Outpost";

//A3MSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call A3MSFindPos;

[nil,nil,rTitleText,"A group of terrorists have taken over a medical outpost! Check your map for the location!", "PLAIN",10] call RE;

//A3MSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM A3MSAddMinMarker;

//We create the scenery
_base = createVehicle ["MASH",[(_coords select 0) +2, (_coords select 1)+5,-0.3],[], 0, "CAN_COLLIDE"];
_base1 = createVehicle ["MASH",[(_coords select 0) - 24, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_base2 = createVehicle ["MASH",[(_coords select 0) - 17, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_base3 = createVehicle ["MASH",[(_coords select 0) - 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

//A3MSProtectObj prevents it from disappearing
[_base] call A3MSProtectObj;
[_base1] call A3MSProtectObj;
[_base2] call A3MSProtectObj;
[_base3] call A3MSProtectObj;

//We create the vehicles
_veh1 = ["small"] call A3MSGetVeh;
_veh2 = ["small"] call A3MSGetVeh;
_vehicle = createVehicle [_veh1,[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_vehicle1 = createVehicle [_veh2,[(_coords select 0) + 15, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

//A3MSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call A3MSSetupVehicle;
[_vehicle1] call A3MSSetupVehicle;

//We create and fill the crates
_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];

//A3MSBoxFill fills the box, A3MSProtectObj prevents it from disappearing
[_crate,"medical"] ExecVM A3MSBoxSetup;
[_crate] call A3MSProtectObj;

_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) - 8, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2,"weapons"] ExecVM A3MSBoxSetup;
[_crate2] call A3MSProtectObj;

//A3MSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) - 20, (_coords select 1) - 15,0],4,0,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 3;
[[(_coords select 0) + 10, (_coords select 1) + 15,0],4,0,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 3;
[[(_coords select 0) - 10, (_coords select 1) - 15,0],4,0,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 3;
[[(_coords select 0) + 20, (_coords select 1) + 15,0],4,0,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 3;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"A3MSUnitsMinor"] call A3MSWaitMissionComp;

//Call A3MSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
[_vehicle] ExecVM A3MSSaveVeh;
[_vehicle1] ExecVM A3MSSaveVeh;

//Let everyone know the mission is over
[nil,nil,rTitleText,"The Medical Outpost is under survivor control!", "PLAIN",6] call RE;
diag_log text format["[A3MS]: Minor SM2 Medical Outpost Mission has Ended."];
deleteMarker "A3MSMinMarker";
deleteMarker "A3MSMinDot";

//Let the timer know the mission is over
A3MSMinDone = true;