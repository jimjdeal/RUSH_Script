
// SM Execute 
execVM "voiceActivatedArty\clearKeyDowns.sqf";

_lat = _this select 0;
_lon = _this select 1;
_rnd = _this select 2;
_radi = _this select 3;
_pos = [_lat, _lon];

// colour mgmt 
_colourType = splashOrdColour select 0;

if (_colourType == 1) then {
	rggshellColour = "G_40mm_smoke";
};
if (_colourType == 2) then {
	rggshellColour = "G_40mm_smokeRed";
};
if (_colourType == 3) then {
	rggshellColour = "G_40mm_smokeGreen";
};
if (_colourType == 4) then {
	rggshellColour = "G_40mm_SmokeBlue";
};
if (_colourType == 5) then {
	rggshellColour = "G_40mm_smokeOrange";
};
if (_colourType == 6) then {
	rggshellColour = "G_40mm_smokePurple";
};
if (_colourType == 7) then {
	rggshellColour = "G_40mm_smokeYellow";
};
if (_colourType == 8) then {
	rggshellColour = "G_40mm_smokeOrange";
};


// createMarker
deleteMarker "gun1";
_marker1 = createMarker ["gun1", _pos];
_marker1 setMarkerShapeLocal "ELLIPSE";
_marker1 setMarkerColorLocal "ColorRed";
_marker1 setMarkerSizeLocal [100, 100];
_marker1 setMarkerAlphaLocal 0.9;

// function
RGG_callArty1 = {
	
	numericalInput = false;
	// sleep 15;
	// systemChat "HE x 25 inbound, splash in 60 ...";
	// sleep 30;
	// // inform user through display or .ogg, but for now just use sysChat 
	// systemChat "HE x 25, splash in 30 ...";
	// sleep 15;
	// systemChat "splash in 15 ...";
	// sleep 10;
	systemChat ".. 5 ..";
	sleep 1;
	systemChat ".. 4 ..";
	sleep 1;
	systemChat ".. 3 ..";
	sleep 1;
	systemChat ".. 2 ..";
	sleep 2;
	
	params ["_shell", "_origin", "_radius", "_count"];

	while {_count = _count - 1; _count >= 0} do {

		private _int = selectRandom [1, 2, 4, 8];
		private _dir = random 360;
		private _rad = random _radius;
		private _prj = _shell createVehicle (_origin getPos [_rad, _dir]);		
		sleep _int;
	};

	systemChat 'Call Completed';
	deleteMarker "gun1";
	numericalInputBool = false;


	execVM 'voiceActivatedArty\clearKeyDowns.sqf'; 
	
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_cnl];
	numericalInputBool = false;
	execVM "voiceActivatedArty\initialiseVAA.sqf";
};

// ["G_40mm_smokeOrange", _pos, _radi, _rnd] call RGG_callArty1;	

[rggshellColour, _pos, _radi, _rnd] call RGG_callArty1;	

