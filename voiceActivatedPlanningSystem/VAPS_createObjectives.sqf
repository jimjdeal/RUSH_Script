/*
from:
to:			voiceActivatedPlanningSystem\VAPS_clearKeyDowns.sqf
execVM 		voiceActivatedPlanningSystem\initialiseVAPS.sqf

purpose:
to render the different markers for the player 
large red = primary objective 
smaller red = secondary objective 
blue = staging zone 1
green = staging zone 2

notes:
*/

_orderType 	= VAPS_Order_Type select 0; // 1 = set primary, 2 = set secondary, 3 = stage1, 4 = stage 2  // TBD >> 3 = set waypoints. 4 = set battle plan 
// _lat		= VAPS_Lat select 0;
// _lon		= VAPS_Lon select 0;

// join the strings
_parsed1Lat = VAPS_Lat joinString "";
_parsed1Lon = VAPS_Lon joinString "";

// convert strings to nums 
_parsedLat = parseNumber _parsed1Lat;
_parsedLon = parseNumber _parsed1Lon;

// convert nums to location array
_pos = [_parsedLat, _parsedLon];

// createMarker
if (_orderType == 1) then {
	deleteMarker "primaryObj";
	_marker1 = createMarker ["primaryObj", _pos];
	_marker1 setMarkerShapeLocal "ELLIPSE";
	_marker1 setMarkerColorLocal "ColorRed";
	_marker1 setMarkerSizeLocal [100, 100];
	_marker1 setMarkerAlphaLocal 0.9;
};
if (_orderType == 2) then {
	deleteMarker "secondaryObj";
	_marker1 = createMarker ["secondaryObj", _pos];
	_marker1 setMarkerShapeLocal "ELLIPSE";
	_marker1 setMarkerColorLocal "ColorRed";
	_marker1 setMarkerSizeLocal [70, 70];
	_marker1 setMarkerAlphaLocal 0.9;
};
if (_orderType == 3) then {
	deleteMarker "primaryStage";
	_marker1 = createMarker ["primaryStage", _pos];
	_marker1 setMarkerShapeLocal "ELLIPSE";
	_marker1 setMarkerColorLocal "ColorBlue";
	_marker1 setMarkerSizeLocal [50, 50];
	_marker1 setMarkerAlphaLocal 0.9;
};
if (_orderType == 4) then {
	deleteMarker "secondaryStage";
	_marker1 = createMarker ["secondaryStage", _pos];
	_marker1 setMarkerShapeLocal "ELLIPSE";
	_marker1 setMarkerColorLocal "ColorGreen";
	_marker1 setMarkerSizeLocal [50, 50];
	_marker1 setMarkerAlphaLocal 0.9;
};

// clean up and reset 
execVM "voiceActivatedPlanningSystem\VAPS_clearKeyDowns.sqf";
execVM "voiceActivatedPlanningSystem\initialiseVAPS.sqf";