1 cutRsc ["VACF_n1","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VACF_n1")};
_n1 = VACF_Heading;
_n2 = VACF_Distance;

_display = uiNameSpace getVariable "VACF_n1";
_setText = _display displayCtrl 9900;
_setText ctrlSetStructuredText (parseText format ["HEADING: %1 DISTANCE: %2", _n1, _n2]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];