/*																					//
	Weapons Cache Mission by lazyink (Original Full Code by TheSzerdi & TAW_Tonic)
	New Mission Format by Vampire
	Edited for ArmA 3 by JediChris816
*/																					//

private ["_missName","_coords","_net","_veh1","_veh2","_vehicle","_vehicle1","_crate","_crate1","_crate2","_crate3"];

//Name of the Mission
_missName = "NATO Weapons Cache";

//A3MSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call A3MSFindPos;

[nil,nil,rTitleText,"Bandits have Overrun a NATO Weapons Cache!", "PLAIN",10] call RE;

//A3MSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM A3MSAddMajMarker;

//Lets add the scenery
_net = createVehicle ["Land_CamoNetB_NATO_EP1",[(_coords select 0) - 0.0649, (_coords select 1) + 0.6025,0],[], 0, "CAN_COLLIDE"];
[_net] call A3MSProtectObj;

//We create the vehicles like normal
_veh1 = ["small"] call A3MSGetVeh;
_veh2 = ["large"] call A3MSGetVeh;
_vehicle = createVehicle [_veh1,[(_coords select 0) + 10.0303, (_coords select 1) - 12.2979,10],[], 0, "CAN_COLLIDE"];
_vehicle1 = createVehicle [_veh2,[(_coords select 0) - 6.2764, (_coords select 1) - 14.086,10],[], 0, "CAN_COLLIDE"];

//A3MSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call A3MSSetupVehicle;
[_vehicle1] call A3MSSetupVehicle;

_crate = createVehicle ["Box_NATO_Wps_F",_coords,[], 0, "CAN_COLLIDE"];
_crate1 = createVehicle ["Box_NATO_WpsSpecial_F",[(_coords select 0) - 3.7251,(_coords select 1) - 2.3614, 0],[], 0, "CAN_COLLIDE"];
_crate2 = createVehicle ["B_supplyCrate_F",[(_coords select 0) - 3.4346, 0, 0],[], 0, "CAN_COLLIDE"];
_crate3 = createVehicle ["Box_NATO_Support_F",[(_coords select 0) + 4.0996,(_coords select 1) + 3.9072, 0],[], 0, "CAN_COLLIDE"];

//A3MSBoxFill fills the box, A3MSProtectObj prevents it from disappearing
[_crate,"weapons"] ExecVM A3MSBoxSetup;
[_crate] call A3MSProtectObj;
[_crate1] call A3MSProtectObj;
[_crate2] call A3MSProtectObj;
[_crate3] call A3MSProtectObj;

//A3MSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],6,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],6,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],4,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],4,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"A3MSUnitsMajor"] call A3MSWaitMissionComp;

//Call A3MSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
[_vehicle] ExecVM A3MSSaveVeh;
[_vehicle1] ExecVM A3MSSaveVeh;

//Let everyone know the mission is over
[nil,nil,rTitleText,"The Weapons Cache is Under Survivor Control!", "PLAIN",6] call RE;
diag_log text format["[A3MS]: Major SM1 Weapon Cache Mission has Ended."];
deleteMarker "A3MSMajMarker";
deleteMarker "A3MSMajDot";

//Let the timer know the mission is over
A3MSMajDone = true;