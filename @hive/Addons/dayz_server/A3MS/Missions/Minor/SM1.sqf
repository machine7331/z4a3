/*
	Bandit Hunting Party by lazyink (Full credit to TheSzerdi & TAW_Tonic for the code)
	Updated to new format by Vampire
	Edited for ArmA 3 by JediChris816
*/
private ["_missName","_coords","_vehicle"];

//Name of the Mission
_missName = "al-Qaeda";

//A3MSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call A3MSFindPos;

[nil,nil,rTitleText,"al-Qaeda soldiers have been spotted!\nStop them from completing their patrol!", "PLAIN",10] call RE;

//A3MSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM A3MSAddMinMarker;

//A3MSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[_coords,2,1,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 5;
[_coords,2,1,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 5;
[_coords,2,1,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 5;
[_coords,2,1,"A3MSUnitsMinor"] call A3MSAISpawn;
sleep 1;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"A3MSUnitsMinor"] call A3MSWaitMissionComp;

//Let everyone know the mission is over
[nil,nil,rTitleText,"al-Qaeda has been Wiped Out!", "PLAIN",6] call RE;
diag_log text format["[A3MS]: Minor SM1 al-Qaeda patrol Mission has Ended."];
deleteMarker "A3MSMinMarker";
deleteMarker "A3MSMinDot";

//Let the timer know the mission is over
A3MSMinDone = true;