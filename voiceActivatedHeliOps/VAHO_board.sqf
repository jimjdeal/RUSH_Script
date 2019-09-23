_myHeli = vehicle player;

waitUntil {
	((HELI1ATL3) < 10)
};

systemChat "working?";
_extractLocation = position player;
_extractMarker = createMarkerLocal ["extract", _extractLocation];
_extractMarker setMarkerShapeLocal "ELLIPSE";
_extractMarker setMarkerColorLocal "ColorGreen";
_extractMarker setMarkerSizeLocal [50, 50];

_units = allUnits inAreaArray "extract";
{
	_x assignAsCargo _myHeli;
	sleep 0.2;
} forEach _units;	
_units orderGetIn true;

// GETOUT = true;

// while {GETOUT} do {

// 	_extractMarker setMarkerAlphaLocal 0.8;
// 	sleep 2;
// 	_extractMarker setMarkerAlphaLocal 0.6;
// 	sleep 0.1;
// 	_extractMarker setMarkerAlphaLocal 0.4;
// 	sleep 0.1;
// 	_extractMarker setMarkerAlphaLocal 0.6;
// 	sleep 0.1;

// 	if ((HELI1ATL3) > 3) then {
// 		deleteMarkerLocal "extract";
// 		GETOUT = false;
// 		execVM "signalGetInHeli1.sqf";
// 	};

// };
