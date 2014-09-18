/*
	Adds a marker for Major Missions. Only runs once.
	A3MSMarkerLoop.sqf keeps this marker updated.
	Usage: [coordinates,missionname]
*/
private["_nul","_nil"];
A3MSMinCoords = _this select 0;
A3MSMinName = _this select 1;

_nul = createMarker ["A3MSMinMarker", A3MSMinCoords];
"A3MSMinMarker" setMarkerColor "ColorRed";
"A3MSMinMarker" setMarkerShape "ELLIPSE";
"A3MSMinMarker" setMarkerBrush "Grid";
"A3MSMinMarker" setMarkerSize [150,150];
_nil = createMarker ["A3MSMinDot", A3MSMinCoords];
"A3MSMinDot" setMarkerColor "ColorBlack";
"A3MSMinDot" setMarkerType "Vehicle";
"A3MSMinDot" setMarkerText A3MSMinName;