
execVM "missionParams.sqf";

if (is3DEN) exitwith {};
if (isDedicated) exitWith {};
waituntil {!isNull findDisplay 46}; 
/*
from:		n/a
to:			voiceActivatedArty\VAA_Init.sqf
to:			voiceActivatedCoordFinder\VACF_init.sqf
to:			voiceactivatedhighcommand\VAHCO_init.sqf
to:			voiceActivatedUnitSpawner\VAUS_init.sqf

purpose:
trigger relevant modules 

notes:
link all of these into one script, so just call one thing from here...
need to trigger config params from here too dont forget
understand how to better use preprocessFileLineNumbers across whole script!
*/

		M1MISSION = false;
		M2MISSION = false;
		M3MISSION = false;
		M4MISSION = false;


call compile preprocessFileLineNumbers "voiceActivatedArty\VAA_Init.sqf";
execVM "voiceActivatedCoordFinder\VACF_init.sqf";
execVM "voiceactivatedhighcommand\VAHCO_init.sqf";
execVM "voiceActivatedUnitSpawner\VAUS_init.sqf";
execVM "voiceActivatedVehicleSpawner\VAVS_init.sqf";
execVM "voiceActivatedPlanningSystem\VAPS_init.sqf";
execVM "voiceActivatedMissionGenerator\VAMG_init.sqf";
execVM "InfoDisplay.sqf";
execVM "alt.sqf";

//

sleep 5;


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



