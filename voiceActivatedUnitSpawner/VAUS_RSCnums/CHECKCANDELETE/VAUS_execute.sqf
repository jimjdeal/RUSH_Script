
_VACF_heading = _this select 0;
_VACF_distance = _this select 1;

execVM "voiceActivatedCoordFinder\VACF_clearKeyDowns.sqf";
systemChat "processing data...";
sleep 1;

RGG_callVACF = {
	_VACF_result = player getPos [_VACF_distance, _VACF_heading];
	systemChat str _VACF_result;
	_lan = _VACF_result select 0;
	_lon = _VACF_result select 1;
	_lan = floor _lan;
	_lon = floor _lon;
	_stringify = [];
	_stringify pushback [_lan, _lon];
	[_lan, _lon] execVM "voiceActivatedCoordFinder\presentation.sqf"

};
[_VACF_heading, _VACF_distance] call RGG_callVACF;
	
execVM "voiceActivatedCoordFinder\initialiseVACF.sqf";

from cc 