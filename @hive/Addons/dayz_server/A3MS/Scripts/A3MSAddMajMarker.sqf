/*
	Adds a marker for Major Missions. Only runs once.
	A3MSMarkerLoop.sqf keeps this marker updated.
	Usage: [coordinates,missionname]
*/
private["_nul","_nil"];
A3MSMajCoords = _this select 0;
A3MSMajName = _this select 1;

_nul = createMarker ["A3MSMajMarker", A3MSMajCoords];
"A3MSMajMarker" setMarkerColor "ColorRed";
"A3MSMajMarker" setMarkerShape "ELLIPSE";
"A3MSMajMarker" setMarkerBrush "Grid";
"A3MSMajMarker" setMarkerSize [175,175];
_nil = createMarker ["A3MSMajDot", A3MSMajCoords];
"A3MSMajDot" setMarkerColor "ColorBlack";
"A3MSMajDot" setMarkerType "Vehicle";
"A3MSMajDot" setMarkerText A3MSMajName;