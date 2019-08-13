
_lan = _this select 0;
_lon = _this select 1;
_stringTestLan	= [_lan] joinString "";
_countTestLan = count _stringTestLan;
_stringTestLon	= [_lon] joinString "";
_countTestLon = count _stringTestLon;

if (_countTestLan == 4) then {
	systemChat "Lat";
	_fiveNum = "0" + _stringTestLan;
	_stringTestLan = _fiveNum;
}; 

if (_countTestLan == 3) then {
	systemChat "Lat";
	_fiveNum = "00" + _stringTestLan;
	_stringTestLan = _fiveNum;
}; 

if (_countTestLon == 4) then {
	_fiveNum = "0" + _stringTestLon;
	_stringTestLon = _fiveNum;
};
 
if (_countTestLon == 3) then {
	_fiveNum = "00" + _stringTestLon;
	_stringTestLon = _fiveNum;
}; 

[_stringTestLan, _stringTestLon]execVM "voiceActivatedCoordFinder\RSCText.sqf"









// for "_i" from 1 to 5 do { 

// 	if (_countTestLan == 4) then {
// 		systemChat "Lan";
// 		_fiveNum = "0" + _stringTestLan;
// 		systemChat str _fiveNum;
// 	} else {
// 		systemChat "Lan";
// 		systemChat str _stringTestLan;
// 	};

// 	if (_countTestLon == 4) then {
// 		systemChat "Lon";
// 		_fiveNum = "0" + _stringTestLon;
// 		systemChat str _fiveNum;
// 	} else {
// 		systemChat "Lon";
// 		systemChat str _stringTestLon;
// 	};

// 	sleep 12; 
// };

// execVM "voiceActivatedCoordFinder\RSCText.sqf"



	// if (_countTestLan == 4) then {
	// 	systemChat "Lat";
	// 	_fiveNum = "0" + _stringTestLan;
	// 	_stringTestLan = _fiveNum;
	// 	// systemChat str _stringTestLan;
	// } else {
	// 	// systemChat "Lat";
	// 	// systemChat str _stringTestLan;
	// };

	// if (_countTestLon == 4) then {
	// 	// systemChat "Lon";
	// 	_fiveNum = "0" + _stringTestLon;
	// 	_stringTestLon = _fiveNum;
	// 	// systemChat str _stringTestLon;
	// } else {
	// 	// systemChat "Lon";
	// 	// systemChat str _stringTestLon;
	// };
















// _cnt = count units group player; // returns number of units in player group