/*
	AN-2 Bandit Supply Drop by Vampire
	Example Code by Halv
	Edited for ArmA 3 by JediChris816
*/

private ["_missName","_coords","_plane","_aiGrp","_pilot","_wp","_wp_pos","_loop","_half","_newPos","_plane2","_chute","_box","_dropDir","_wp2","_fallCount","_boxFin"];

//Name of the Mission
_missName = "Supply Drop";

//A3MSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call A3MSFindPos;

[nil,nil,rTitleText,"An heli transport with NATO Supplies is flying in!\nGet to the location and capture the package!", "PLAIN",10] call RE;

//A3MSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM A3MSAddMajMarker;

//Lets get the AN2 Flying
_plane = createVehicle ["B_Heli_Transport_01_camo_F", [0,0,500], [], 0, "FLY"];
[_plane] call A3MSProtectObj;
_plane engineOn true;
_plane flyInHeight 150;
_plane forceSpeed 175;

//Empty the plane
clearMagazineCargoGlobal _plane;
clearWeaponCargoGlobal _plane;

//Lets make AI for the plane and get them in it
_aiGrp = creategroup east;

_pilot = _aiGrp createUnit ["B_Pilot_F",getPos _plane,[],0,"FORM"];
_pilot moveindriver _plane;
_pilot assignAsDriver _plane;

_wp = _aiGrp addWaypoint [[(_coords select 0), (_coords select 1),150], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp_pos = waypointPosition [_aiGrp,1];

_pilot addWeapon 'Item_NVGoggles_INDEP';
_pilot addWeapon 'Item_ItemCompass';
_pilot addWeapon 'Item_ItemRadio';
_pilot addWeapon 'Item_ItemMap';
_pilot addWeapon 'Item_ItemGPS';
sleep 5;

//A3MSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[_coords,6,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;
[_coords,6,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;
[_coords,4,1,"A3MSUnitsMajor"] call A3MSAISpawn;
sleep 5;

_loop = true;
_half = false;
while {_loop} do {
	if (!Alive _plane OR !Alive _pilot) then {
		sleep 5;
		
		// We are going to pretend the plane was shot down nearby
		deleteVehicle _plane;
		deleteVehicle _pilot;

		_newPos = [(_coords select 0) + (random(2000)),(_coords select 1) - (random(2000)),0];
		
		if (surfaceIsWater _newPos) then {
			//newPos is water, so lets just drop it on mark
			//This is a temporary fix for needed logic
			_newPos = _coords;
		};
		
		//Create the plane and kill it
		_plane2 = createVehicle ["B_Heli_Transport_01_camo_F", [(_newPos select 0),(_newPos select 1),200], [], 0, "FLY"];
		[_plane2] call A3MSProtectObj;
		_plane2 engineOn true;
		_plane2 flyInHeight 150;
		_plane2 forceSpeed 175;
		sleep 2;
		_plane2 setDamage 1;
		
		//Update the location
		[_coords,"AN2 Wreck"] ExecVM A3MSAddMajMarker;
		[nil,nil,rTitleText,"The transport chopper was shot down by al-Qaeda terrorists!\nGo Find the supplies!", "PLAIN",10] call RE;
		
		_chute = createVehicle ["B_Parachute", [(_newPos select 0),(_newPos select 1),200], [], 0, "FLY"];
		[_chute] call A3MSProtectObj;
		_box = createVehicle ["RH_m4m16ammobox", [(_newPos select 0),(_newPos select 1),200],[], 0, "CAN_COLLIDE"];
		[_box] call A3MSProtectObj;
		_box attachTo [_chute, [0, 0, 1]];
		
		_loop = false;
	};
	
	if ((Alive _plane) AND (Alive _pilot) AND ((_plane distance _wp_pos) <= 1200) AND (!(_half))) then {
		[nil,nil,rTitleText,"The transport chopper is only 1200m out from the drop point!", "PLAIN",10] call RE;
		
		//Keep on truckin'
		_plane forceSpeed 175;
		_plane flyInHeight 135;
		_plane setspeedmode "LIMITED";
		_half = true;
	};
	
	if ((Alive _plane) AND (Alive _pilot) AND ((_plane distance _wp_pos) <= 200)) then {
		//Drop the package
		
		_dropDir = getDir _plane;
		_newPos = [(getPosATL _plane select 0) - 15*sin(_dropDir), (getPosATL _plane select 1) - 15*cos(_dropDir), (getPosATL _plane select 2) - 10];

		[nil,nil,rTitleText,"The transport chopper has reached the location and dropped the cargo!", "PLAIN",10] call RE;
		
		_chute = createVehicle ["B_Parachute", _newPos, [], 0, "FLY"];
		[_chute] call A3MSProtectObj;
		_box = createVehicle ["Box_NATO_AmmoVeh_F", _newPos,[], 0, "CAN_COLLIDE"];
		[_box] call A3MSProtectObj;
		_box attachTo [_chute, [0, 0, 1]];
		
		deleteWaypoint [_aiGrp, 1];
		_wp2 = _aiGrp addWaypoint [[0,0,150], 0];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointBehaviour "CARELESS";
		_plane forceSpeed 350;
		_plane setSpeedmode "FULL";
		
		_loop = false;
	};
};

//The box was dropped, lets get it on the ground.
_fallCount = 0;
while {_fallCount < 45} do {
	if (((getPos _box) select 2) < 1) then {_fallCount = 46};
	sleep 0.1;
	_fallCount = _fallCount + 0.1;
};

detach _box;
_box setpos [(getpos _box select 0), (getpos _box select 1), 0];
_boxFin = createVehicle ["Box_NATO_AmmoVeh_F",[(getpos _box select 0),(getpos _box select 1), 0],[],0,"CAN_COLLIDE"];
deletevehicle _box;
deletevehicle _chute;
[[(getpos _boxFin select 0), (getpos _boxFin select 1), 0],"B_Heli_Transport_01_camo_F"] ExecVM A3MSAddMajMarker;
clearWeaponCargoGlobal _boxFin;
clearMagazineCargoGlobal _boxFin;
clearBackpackCargoGlobal _boxFin;
[_boxFin,"weapons"] ExecVM A3MSBoxSetup;
[_boxFin] call A3MSProtectObj;

//Wait until the player is within 30 meters and also meets the kill req
[position _boxFin,"A3MSUnitsMajor"] call A3MSWaitMissionComp;

//Let everyone know the mission is over
[nil,nil,rTitleText,"The transport chopper has been secured!", "PLAIN",6] call RE;
diag_log text format["[A3MS]: Major SM2 transport chopper Drop Mission has Ended."];
deleteMarker "A3MSMajMarker";
deleteMarker "A3MSMajDot";

//Let the timer know the mission is over
A3MSMajDone = true;