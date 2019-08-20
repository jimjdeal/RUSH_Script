disableSerialization;

_lat = _this select 0;
_lon = _this select 1;

1 cutRsc ["VACF","PLAIN"];

waitUntil {!isNull (uiNameSpace getVariable "VACF")};
	
_display = uiNameSpace getVariable "VACF";
_setText = _display displayCtrl 1001;
_setText ctrlSetStructuredText (parseText format ["Lat: %1 / Lon: %2",_lat, _lon]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

