1 cutRsc ["VAUS_DATA","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VAUS_DATA")};

_n1 = VAUS_control;
_n2 = VAUS_group;
_n3 = VAUS_camo;

_display = uiNameSpace getVariable "VAUS_DATA";
_setText = _display displayCtrl 9900;
_setText ctrlSetStructuredText (parseText format ["CONTROL TYPE: %1 / GROUP TYPE: %2 / CAMO TYPE %3", _n1, _n2, _n3]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];