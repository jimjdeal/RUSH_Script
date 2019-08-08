// systemChat "counter running";
while {true} do {
	_aliveEast = {alive _x && side _x == east} count allUnits;
	systemChat "Enemy:";
	systemChat str _aliveEast;
	sleep .8;

	_aliveWest = {alive _x && side _x == west} count allUnits;
	systemChat "Friendly:";
	systemChat str _aliveWest;
	sleep .8;

	if (_aliveEast == 0) then {
		execVM "markers.sqf";
		systemChat "Here we go again ...";
	};
	sleep 30;
};

















































_parsedGroupBlu1 = _this select 0;
// _parsedGroupBlu2 = _this select 1;



// systemChat str _parsedGroupBlu2;

// // _myUnitCount = count units group player;
// // systemChat "Player Group:";
// // systemChat str group player;
// // systemChat str _myunitCount;
// // sleep 0.5;

// // _groupBlu1 = count units group _parsedGroupBlu1;
// // systemChat "Left Flank:";
// // systemChat str _parsedGroupBlu1;
// // systemChat str _groupBlu1;
// sleep 0.5;

// // _groupBlu2 = count units group _parsedGroupBlu2;
// // systemChat "Right Flank:";
// // systemChat str _groupBlu2;