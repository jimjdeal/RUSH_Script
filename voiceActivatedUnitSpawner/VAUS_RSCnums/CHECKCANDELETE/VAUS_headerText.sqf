
// use this for header, and subs, and footers 

1 cutRsc ["VAUS_MAINTITLE","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VAUS_MAINTITLE")};
_n1 = "PLEASE CONFIRM - DIRECT COMMAND OR HIGH COMMAND";

_display = uiNameSpace getVariable "VAUS_MAINTITLE";
_setText = _display displayCtrl 9901;
// _setText ctrlSetStructuredText (parseText format ["VAUS: %1", _n1]);
_setText ctrlSetStructuredText (parseText format ["VA Unit Spawner<br/>Enter Selections Below"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

