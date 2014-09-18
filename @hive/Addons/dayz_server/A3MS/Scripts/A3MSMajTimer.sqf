/*
	DayZ Mission System Timer by Vampire
	Based on fnc_hTime by TAW_Tonic and SMFinder by Craig
	This function is launched by the Init and runs continuously.
*/
private["_run","_timeDiff","_timeVar","_wait","_cntMis","_ranMis","_varName"];

//Let's get our time Min and Max
_timeDiff = A3MSMajorMax - A3MSMajorMin;
_timeVar = _timeDiff + A3MSMajorMin;

diag_log text format ["[A3MS]: Major Mission Clock Starting!"];

//Lets get the loop going
_run = true;
while {_run} do
{
	//Lets wait the random time
	_wait  = round(random _timeVar);
    [_wait,5] call A3MSSleep;
	
	//Let's check that there are missions in the array.
	//If there are none, lets end the timer.
	_cntMis = count A3MSMajorArray;
	if (_cntMis == 0) then { _run = false; };
	
	//Lets pick a mission
	_ranMis = floor (random _cntMis);
	_varName = A3MSMajorArray select _ranMis;
    
    // clean up all the existing units before starting a new one
    {if (alive _x) then {_x call A3MSPurgeObject;};} forEach A3MSUnitsMajor;
    
    // rebuild the array for the next mission
    A3MSUnitsMajor = [];
    
	//Let's Run the Mission
	[] execVM format ["\z\addons\invasion_server\A3MS\Missions\Major\%1.sqf",_varName];
	diag_log text format ["[A3MS]: Running Major Mission %1.",_varName];
	
	//Let's wait for it to finish or timeout
	waitUntil {A3MSMajDone};
	A3MSMajDone = nil;
};