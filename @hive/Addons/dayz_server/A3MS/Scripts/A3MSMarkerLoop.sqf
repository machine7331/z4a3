/*
	Marker Resetter by Vampire
	Marker Resetter checks if a Mission is running and resets the marker for JIPs
*/
private["_run","_nul","_nil"];

diag_log text format ["[A3MS]: Mission Marker Loop for JIPs Starting!"];

//Lets define these
if (isNil "A3MSMajCoords")then{A3MSMajCoords = [0,0,0];};
if (isNil "A3MSMinCoords")then{A3MSMinCoords = [0,0,0];};

//Lets start the timer
_run = true;
while {_run} do
{
    [25,5] call A3MSSleep; // sleep 25 seconds
	//If the marker exists (meaning the mission is active) lets delete it and re-add it
	if (!(getMarkerColor "A3MSMajMarker" == "")) then {
		deleteMarker "A3MSMajMarker";
		deleteMarker "A3MSMajDot";
		//Re-Add the markers
		_nul = createMarker ["A3MSMajMarker", A3MSMajCoords];
		"A3MSMajMarker" setMarkerColor "ColorRed";
		"A3MSMajMarker" setMarkerShape "ELLIPSE";
		"A3MSMajMarker" setMarkerBrush "Grid";
		"A3MSMajMarker" setMarkerSize [175,175];
		_zap = createMarker ["A3MSMajDot", A3MSMajCoords];
		"A3MSMajDot" setMarkerColor "ColorBlack";
		"A3MSMajDot" setMarkerType "Vehicle";
		"A3MSMajDot" setMarkerText A3MSMajName;
	};
	//Lets do the same for the minor mission
	if (!(getMarkerColor "A3MSMinMarker" == "")) then {
		deleteMarker "A3MSMinMarker";
		deleteMarker "A3MSMinDot";
		//Re-Add the markers
		_nil = createMarker ["A3MSMinMarker", A3MSMinCoords];
		"A3MSMinMarker" setMarkerColor "ColorRed";
		"A3MSMinMarker" setMarkerShape "ELLIPSE";
		"A3MSMinMarker" setMarkerBrush "Grid";
		"A3MSMinMarker" setMarkerSize [150,150];
		_zip = createMarker ["A3MSMinDot", A3MSMinCoords];
		"A3MSMinDot" setMarkerColor "ColorBlack";
		"A3MSMinDot" setMarkerType "Vehicle";
		"A3MSMinDot" setMarkerText A3MSMinName;
	};
	//Now we wait another 25 seconds
};