/*
	Medical C-130 Crash by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Modified to new format by Vampire
	Edited for Arma 3 by JediChris816
*/

private ["_missName","_coords","_wreck","_trash","_trash1","_trash2","_trash3","_trash4","_trash5","_veh1","_veh2","_vehicle","_vehicle1","_crate","_crate1"];

//Name of the Mission
_missName = "C130 Crash";

//A3MSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call A3MSFindPos;

[nil,nil,rTitleText,"A C130 Carrying Supplies has Crashed!\nBandits are Securing the Cargo!", "PLAIN",10] call RE;

//A3MSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM A3MSAddMajMarker;

//We create the mission scenery
_wreck = createVehicle ["C130J",[(_coords select 0) - 8.8681, (_coords select 1) + 15.3554,0],[], 0, "NONE"];
_wreck setDir -30.165445;
[_wreck] call A3MSProtectObj;

//Lets open it up
_wreck animate ["ramp_top",1];
_wreck animate ["ramp_bottom",1];

//And lets keep people out
_wreck setHit ["motor", 1];
_wreck setVariable ["R3F_LOG_disabled",true,true];
_wreck setVariable ["BTC_Cannot_Lift",true,true];
_wreck removeAllEventHandlers "Killed";
_wreck removeAllEventHandlers "HandleDamage";
_wreck setVehicleLock "LOCKED";
_wreck removeAllEventHandlers "GetIn";
_wreck addEventHandler ["GetIn",{
	if (isPlayer (_this select 2)) then {
		(_this select 2) action ["getOut",(_this select 0)]; 
		(_this select 0) setVehicleLock "LOCKED";
		(_this select 0) removeAllEventHandlers "GetIn";
	};
}];

_trash = createVehicle ["Barrels",[(_coords select 0) - 7.4511, (_coords select 1) + 3.8544,0],[], 0, "NONE"];
_trash setDir 61.911976;
[_trash] call A3MSProtectObj;

_trash1 = createVehicle ["Misc_palletsfoiled",[(_coords select 0) + 4.062, (_coords select 1) + 4.7216,0],[], 0, "NONE"];
_trash1 setDir -29.273479;
[_trash1] call A3MSProtectObj;

_trash2 = createVehicle ["Paleta2",[(_coords select 0) - 3.4033, (_coords select 1) - 2.2256,0],[], 0, "NONE"];
[_trash2] call A3MSProtectObj;

_trash3 = createVehicle ["Land_Pneu",[(_coords select 0) + 1.17, (_coords select 1) + 1.249,0],[], 0, "NONE"];
[_trash3] call A3MSProtectObj;

_trash4 = createVehicle ["Land_transport_crates_EP1",[(_coords select 0) + 3.9029, (_coords select 1) - 1.8477,0],[], 0, "NONE"];
_trash4 setDir -70.372086;
[_trash4] call A3MSProtectObj;

_trash5 = createVehicle ["Fort_Crate_wood",[(_coords select 0) - 2.1181, (_coords select 1) + 5.9765,0],[], 0, "NONE"];
_trash5 setDir -28.122475;
[_trash5] call A3MSProtectObj;

//We create the mission vehicles
_veh1 = ["small"] call A3MSGetVeh;
_veh2 = ["small"] call A3MSGetVeh;
_vehicle = createVehicle [_veh1,[(_coords select 0) + 14.1426, (_coords select 1) - 0.6202,0],[], 0, "CAN_COLLIDE"];
_vehicle1 = createVehicle [_veh2,[(_coords select 0) - 6.541, (_coords select 1) - 11.5557,0],[], 0, "CAN_COLLIDE"];

//A3MSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call A3MSSetupVehicle;
[_vehicle1] call A3MSSetupVehicle;

//A3MSBoxFill fills the box, A3MSProtectObj prevents it from disappearing
_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 1.5547,(_coords select 1) + 2.3486,0],[], 0, "CAN_COLLIDE"];
[_crate,"supply"] ExecVM A3MSBoxSetup;
[_crate] call A3MSProtectObj;

_crate1 = createVehicle ["USLaunchersBox",[(_coords select 0) + 0.3428,(_coords select 1) - 1.8985,0],[], 0, "CAN_COLLIDE"];
[_crate1,"supply"] ExecVM A3MSBoxSetup;
[_crate1] call A3MSProtectObj;

//A3MSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) - 10.5005,(_coords select 1) - 2.6465,0],6,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;
[[(_coords select 0) + 4.7027,(_coords select 1) + 12.2138,0],6,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;
[[(_coords select 0) + 2.918,(_coords select 1) - 9.0342,0],4,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;
[[(_coords select 0) + 2.918,(_coords select 1) - 9.0342,0],4,1,"A3MSUnitsMajor"] call A3MSAISpawn;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"A3MSUnitsMajor"] call A3MSWaitMissionComp;

//Call A3MSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
[_vehicle] ExecVM A3MSSaveVeh;
[_vehicle1] ExecVM A3MSSaveVeh;

//Let everyone know the mission is over
[nil,nil,rTitleText,"The Crash Site has been Secured by Survivors!", "PLAIN",6] call RE;
diag_log text format["[A3MS]: Major EM1 C130 Mission has Ended."];
deleteMarker "A3MSMajMarker";
deleteMarker "A3MSMajDot";

//Let the timer know the mission is over
A3MSMajDone = true;