/*
	Bandit Supply Heli Crash by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	New Mission Format by Vampire
	Edited for ArmA 3 by JediChris816
*/

private ["_missName","_coords","_ranChopper","_chopper","_truck","_trash","_trash2","_crate","_crate2"];

//Name of the Mission
_missName = "Helicopter Landing";

//A3MSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call A3MSFindPos;

[nil,nil,rTitleText,"A Supply Helicopter has been Forced to Land!\nStop the terrorists from A3ng Control of it!", "PLAIN",10] call RE;

//A3MSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM A3MSAddMajMarker;

//We create the vehicles like normal
_ranChopper = ["B_Heli_Transport_01_camo_F"] call A3MSGetVeh;
_chopper = createVehicle [_ranChopper,_coords,[], 0, "NONE"];

//A3MSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_chopper] call A3MSSetupVehicle;
_chopper setDir -36.279881;

_truck = createVehicle ["C_Offroad_01_F",[(_coords select 0) - 8.7802,(_coords select 1) + 6.874,0],[], 0, "CAN_COLLIDE"];
[_truck] call A3MSSetupVehicle;

//Lets add the scenery
_trash = createVehicle ["Land_GarbageContainer_open_F",[(_coords select 0) - 3.0185,(_coords select 1) - 0.084,0],[], 0, "CAN_COLLIDE"];
_trash2 = createVehicle ["Land_GarbageContainer_open_F",[(_coords select 0) + 1.9248,(_coords select 1) + 2.1201,0],[], 0, "CAN_COLLIDE"];
[_trash] call A3MSProtectObj;
[_trash2] call A3MSProtectObj;

//A3MSBoxFill fills the box, A3MSProtectObj prevents it from disappearing
_crate = createVehicle ["Box_East_Wps_F",[(_coords select 0) - 6.1718,(_coords select 1) + 0.6426,0],[], 0, "CAN_COLLIDE"];
[_crate,"weapons"] ExecVM A3MSBoxSetup;
[_crate] call A3MSProtectObj;

_crate2 = createVehicle ["Box_East_Ammo_F",[(_coords select 0) - 7.1718,(_coords select 1) + 1.6426,0],[], 0, "CAN_COLLIDE"];
[_crate2,"weapons"] ExecVM A3MSBoxSetup;
[_crate2] call A3MSProtectObj;

//A3MSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) - 8.4614,(_coords select 1) - 5.0527,0],6,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;
[[(_coords select 0) - 8.4614,(_coords select 1) - 5.0527,0],4,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;
[[(_coords select 0) + 7.5337,(_coords select 1) + 4.2656,0],4,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;
[[(_coords select 0) + 7.5337,(_coords select 1) + 4.2656,0],4,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"A3MSUnitsMajor"] call A3MSWaitMissionComp;

//Call A3MSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
[_chopper] ExecVM A3MSSaveVeh;
[_truck] ExecVM A3MSSaveVeh;

//Let everyone know the mission is over
[nil,nil,rTitleText,"The helicopter has been taken!", "PLAIN",6] call RE;
diag_log text format["[A3MS]: Major SM4 Helicopter Landing Mission has Ended."];
deleteMarker "A3MSMajMarker";
deleteMarker "A3MSMajDot";

//Let the timer know the mission is over
A3MSMajDone = true;