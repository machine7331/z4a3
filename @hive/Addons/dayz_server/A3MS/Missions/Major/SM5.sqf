/*
	Medical Ural Attack by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to New Format by Vampire
	Edited for ArmA 3 by JediChris816
*/

private ["_missName","_coords","_crash","_body","_body1","_body2","_body3","_veh1","_vehicle","_vehicle1","_crate","_crate2"];

//Name of the Mission
_missName = "Ural Ambush";

//A3MSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call A3MSFindPos;

[nil,nil,rTitleText,"Terrorists have ambushed a Ural carrying supplies!", "PLAIN",10] call RE;

//A3MSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM A3MSAddMajMarker;

//We create the scenery
_crash = createVehicle ["UralWreck",_coords,[], 0, "CAN_COLLIDE"];
_crash setDir 149.64919;
[_crash] call A3MSProtectObj;

_body = createVehicle ["Body",[(_coords select 0) - 2.2905,(_coords select 1) - 3.3438,0],[], 0, "CAN_COLLIDE"];
_body setDir 61.798588;
[_body] call A3MSProtectObj;

_body1 = createVehicle ["Body",[(_coords select 0) - 2.8511,(_coords select 1) - 2.4346,0],[], 0, "CAN_COLLIDE"];
_body1 setDir 52.402905;
[_body1] call A3MSProtectObj;

_body2 = createVehicle ["Body",[(_coords select 0) - 3.435,(_coords select 1) - 1.4297,0],[], 0, "CAN_COLLIDE"];
_body2 setDir -117.27345;
[_body2] call A3MSProtectObj;

_body3 = createVehicle ["Body2",[(_coords select 0) - 4.0337,(_coords select 1) + 0.5,0],[], 0, "CAN_COLLIDE"];
_body3 setDir 23.664057;
[_body3] call A3MSProtectObj;

//We create the vehicles like normal
_veh1 = ["small"] call A3MSGetVeh;
_vehicle = createVehicle [_veh1,[(_coords select 0) + 5.7534, (_coords select 1) - 9.2149,0],[], 0, "CAN_COLLIDE"];

//A3MSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call A3MSSetupVehicle;

//A3MSBoxFill fills the box, A3MSProtectObj prevents it from disappearing
_crate = createVehicle ["Box_NATO_Wps_F",[(_coords select 0) + 2.6778,(_coords select 1) - 3.0889,0],[], 0, "CAN_COLLIDE"];
[_crate,"medical"] ExecVM A3MSBoxSetup;
[_crate] call A3MSProtectObj;
_crate setDir -28.85478;

_crate2 = createVehicle ["Box_NATO_Ammo_F",[(_coords select 0) + 1.4805,(_coords select 1) - 3.7432,0],[], 0, "CAN_COLLIDE"];
[_crate2,"medical"] ExecVM A3MSBoxSetup;
[_crate2] call A3MSProtectObj;
_crate2 setDir 62.744293;

_crate3 = createVehicle ["B_supplyCrate_F",[(_coords select 0) + 2.5405,(_coords select 1) - 4.1612,0],[], 0, "CAN_COLLIDE"];
[_crate3,"weapons"] ExecVM A3MSBoxSetup;
[_crate3] call A3MSProtectObj;
_crate3 setDir -27.93351;

//A3MSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) - 6.9458,(_coords select 1) - 3.5352, 0],6,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;
[[(_coords select 0) + 4.4614,(_coords select 1) + 2.5898, 0],6,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;
[[(_coords select 0) + 4.4614,(_coords select 1) + 2.5898, 0],4,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"A3MSUnitsMajor"] call A3MSWaitMissionComp;

//Call A3MSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
[_vehicle] ExecVM A3MSSaveVeh;

[nil,nil,rTitleText,"The Ural supplies have been secured!", "PLAIN",6] call RE;
diag_log text format["[A3MS]: Major SM5 Ural Ambush Mission has Ended."];
deleteMarker "A3MSMajMarker";
deleteMarker "A3MSMajDot";

//Let the timer know the mission is over
A3MSMajDone = true;