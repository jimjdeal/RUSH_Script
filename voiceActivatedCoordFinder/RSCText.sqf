//  disableSerialization;

1 cutRsc ["VACF","PLAIN"];

_name=name player;
_time=time;

waitUntil {!isNull (uiNameSpace getVariable "VACF")};
	_display = uiNameSpace getVariable "VACF";
		_setText = _display displayCtrl 1001;
			_setText ctrlSetStructuredText (parseText format ["Welcome %1.",_name]);
			_setText ctrlSetBackgroundColor [0,1,1,0.5];
			