//to debug variables, and also to enable HUD display 

sleep 2;

while {true} do {

	_PlayerDir =  getDirVisual player;
	_PlayerDir = floor _PlayerDir;

	_target = leader groupBlu1;
	_metersAway = player distance _target;
	_metersAway1 = floor _metersAway;
	_azimuth = player getDir _target;
	_azimuth1 = floor _azimuth;

	_target = leader groupBlu2;
	_metersAway = player distance _target;
	_metersAway2 = floor _metersAway;
	_azimuth = player getDir _target;
	_azimuth2 = floor _azimuth;

	_target = leader groupBlu3;
	_metersAway = player distance _target;
	_metersAway3 = floor _metersAway;
	_azimuth = player getDir _target;
	_azimuth3 = floor _azimuth;

	_target = leader groupBlu4;
	_metersAway = player distance _target;
	_metersAway4 = floor _metersAway;
	_azimuth = player getDir _target;
	_azimuth4 = floor _azimuth;

	_target = leader groupBlu5;
	_metersAway = player distance _target;
	_metersAway5 = floor _metersAway;
	_azimuth = player getDir _target;
	_azimuth5 = floor _azimuth;

	99991 cutRsc ["DEBUG_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "DEBUG_1")};
	
	_display = uiNameSpace getVariable "DEBUG_1";
	_setText = _display displayCtrl 99991;
	_setText ctrlSetStructuredText (parseText format ["HC Group: %1 / distance: %2 / Heading: %3", groupBlu1, _metersAway1, _azimuth1]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];
		if (_azimuth1 == _PlayerDir) then {
		_display = uiNameSpace getVariable "DEBUG_1";
		_setText = _display displayCtrl 99991;
		_setText ctrlSetStructuredText (parseText format ["HC Group: %1 / distance: %2 / Heading: %3", groupBlu1, _metersAway1, _azimuth1]);
		_setText ctrlSetBackgroundColor [0,1,0,0.9];
	};

	99992 cutRsc ["DEBUG_2","PLAIN"];
	_display = uiNameSpace getVariable "DEBUG_2";
	_setText = _display displayCtrl 99992;
	_setText ctrlSetStructuredText (parseText format ["HC Group: %1 / distance: %2 / Heading: %3", groupBlu2, _metersAway2, _azimuth2]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];
	if (_azimuth2 == _PlayerDir) then {
		_display = uiNameSpace getVariable "DEBUG_2";
		_setText = _display displayCtrl 99992;
		_setText ctrlSetStructuredText (parseText format ["HC Group: %1 / distance: %2 / Heading: %3", groupBlu2, _metersAway2, _azimuth2]);
		_setText ctrlSetBackgroundColor [0,1,0,0.9];
	};

	99993 cutRsc ["DEBUG_3","PLAIN"];
	_display = uiNameSpace getVariable "DEBUG_3";
	_setText = _display displayCtrl 99993;
	_setText ctrlSetStructuredText (parseText format ["HC Group: %1 / distance: %2 / Heading: %3", groupBlu3, _metersAway3, _azimuth3]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];
	if (_azimuth3 == _PlayerDir) then {
		_display = uiNameSpace getVariable "DEBUG_3";
		_setText = _display displayCtrl 99993;
		_setText ctrlSetStructuredText (parseText format ["HC Group: %1 / distance: %2 / Heading: %3", groupBlu3, _metersAway3, _azimuth3]);
		_setText ctrlSetBackgroundColor [0,1,0,0.9];
	};

	99994 cutRsc ["DEBUG_4","PLAIN"];
	_display = uiNameSpace getVariable "DEBUG_4";
	_setText = _display displayCtrl 99994;
	_setText ctrlSetStructuredText (parseText format ["HC Group: %1 / distance: %2 / Heading: %3", groupBlu4, _metersAway4, _azimuth4]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];
	if (_azimuth4 == _PlayerDir) then {
		_display = uiNameSpace getVariable "DEBUG_4";
		_setText = _display displayCtrl 99994;
		_setText ctrlSetStructuredText (parseText format ["HC Group: %1 / distance: %2 / Heading: %3", groupBlu4, _metersAway4, _azimuth4]);
		_setText ctrlSetBackgroundColor [0,1,0,0.9];
	};

	99995 cutRsc ["DEBUG_5","PLAIN"];
	_display = uiNameSpace getVariable "DEBUG_5";
	_setText = _display displayCtrl 99995;
	_setText ctrlSetStructuredText (parseText format ["HC Group: %1 / distance: %2 / Heading: %3", groupBlu5, _metersAway5, _azimuth5]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];
	if (_azimuth5 == _PlayerDir) then {
		_display = uiNameSpace getVariable "DEBUG_5";
		_setText = _display displayCtrl 99995;
		_setText ctrlSetStructuredText (parseText format ["HC Group: %1 / distance: %2 / Heading: %3", groupBlu5, _metersAway5, _azimuth5]);
		_setText ctrlSetBackgroundColor [0,1,0,0.9];
	};

	99996 cutRsc ["DEBUG_6","PLAIN"];
	_display = uiNameSpace getVariable "DEBUG_6";
	_setText = _display displayCtrl 99996;
	_setText ctrlSetStructuredText (parseText format ["VAUS Active Groups: %1 / PlayerVis: %2", VAUS_activeGroups, _PlayerDir]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];
	// _setText ctrlSetPosition [0.300, 0.155, 0.400, 0.050];

sleep 0.5;
};