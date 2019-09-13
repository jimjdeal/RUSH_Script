/*

Q1 – infi, vic, air or mixed
Q2 – small medium large xl conflict
Q3 – only if vics – what class of weight, light medium, heavy, random
Q4 – area – small med large xl
Q5 – placement – clustered or everywhere
Q6 – intel – show once, show periodically, never
Q7 – faction
Q8 – type of RF – none, light, medium twice, heavy three times
Q9 – mission type – you attack, they attack, you escape, they escape?

Create AO
Q4 – area – small med large xl

Classes
Q7 – faction
Q1 – infi, vic, air or mixed
Q2 – small medium large xl conflict
Q3 – only if vics – what class of weight, light medium, heavy, random

Placement
Q5 – placement – clustered or everywhere

Triggers
Q6 – intel – show once, show periodically, never
Q8 – type of RF – none, light, medium twice, heavy three times

Game-states
Q9 – mission type – you attack, they attack, you escape, they escape?


groupRed1 = createGroup east;
groupRed2 = createGroup east;
groupRed3 = createGroup east;
for "_i" from 1 to 4 do { 
	"O_V_Soldier_TL_ghex_F" createUnit [getMarkerPos "opRightWP", groupRed1]; 
};
for "_i" from 1 to 4 do { 
	"O_V_Soldier_TL_ghex_F" createUnit [getMarkerPos "opCenterWP", groupRed2]; 
};
for "_i" from 1 to 4 do { 
	"O_V_Soldier_TL_ghex_F" createUnit [getMarkerPos "opLeftWP", groupRed3]; 
};



also note - need to create movement in units created...
*/


private ["_num"];

generateOpfor = {
	systemChat "generateOpfor called";
	// this function generates relevant enemies as per mission request 
	_opforFactionCSAT = [O_V_Soldier_TL_ghex_F, O_V_Soldier_TL_ghex_F, O_V_Soldier_TL_ghex_F];
	// more arrays to go here, to maintain different faction classes
	_groupRed1 = createGroup east;
	_groupRed2 = createGroup east;
	_groupRed3 = createGroup east;
	_groupRed4 = createGroup east;
	_groupRed5 = createGroup east;
	// these 5 groups are reserved for enemy allocations 
	_spawnPointOPFOR = _this select 0;
	// the above value uses the parsed opfor spawnpoint 
	_genType = VAMG_conflictType select 0; // infi, vic, air or mixed
	_genSize = VAMG_conflictSize select 0; // indicates number of units to create
	// infi only
	if (_genType == 1) then {
		_genNumber = 10;
		if (_genSize == 1) then {
			for "_i" from 1 to _genNumber do {
				"O_V_Soldier_TL_ghex_F" createUnit [_spawnPointOPFOR, _groupRed1]; 
				sleep 1;
			};
			_randomDir = random 360;
			_randomDist = selectRandom [20, 40, 60, 80, 100];
			_endPoint1 = _spawnPointOPFOR getPos [_randomDist,_randomDir];
			_groupRed1 Move _endPoint1;
		};
		if (_genSize == 2) then {
			for "_i" from 1 to _genNumber do {
				"O_V_Soldier_TL_ghex_F" createUnit [_spawnPointOPFOR, _groupRed1]; 
			};
			for "_i" from 1 to _genNumber do {
				"O_V_Soldier_TL_ghex_F" createUnit [_spawnPointOPFOR, _groupRed2]; 
			};
			_randomDir = random 360;
			_randomDist = selectRandom [20, 40, 60, 80, 100];
			_endPoint1 = _spawnPointOPFOR getPos [_randomDist,_randomDir];
			_groupRed1 Move _endPoint1;
			_randomDir = random 360;
			_randomDist = selectRandom [20, 40, 60, 80, 100];
			_endPoint1 = _spawnPointOPFOR getPos [_randomDist,_randomDir];
			_groupRed2 Move _endPoint1;
		};
		if (_genSize == 3) then {
			for "_i" from 1 to _genNumber do {
				"O_V_Soldier_TL_ghex_F" createUnit [_spawnPointOPFOR, _groupRed1]; 
			};
			for "_i" from 1 to _genNumber do {
				"O_V_Soldier_TL_ghex_F" createUnit [_spawnPointOPFOR, _groupRed2]; 
			};
			for "_i" from 1 to _genNumber do {
				"O_V_Soldier_TL_ghex_F" createUnit [_spawnPointOPFOR, _groupRed3]; 
			};
			_randomDir = random 360;
			_randomDist = selectRandom [20, 40, 60, 80, 100];
			_endPoint1 = _spawnPointOPFOR getPos [_randomDist,_randomDir];
			_groupRed1 Move _endPoint1;
			_randomDir = random 360;
			_randomDist = selectRandom [20, 40, 60, 80, 100];
			_endPoint1 = _spawnPointOPFOR getPos [_randomDist,_randomDir];
			_groupRed2 Move _endPoint1;
			_randomDir = random 360;
			_randomDist = selectRandom [20, 40, 60, 80, 100];
			_endPoint1 = _spawnPointOPFOR getPos [_randomDist,_randomDir];
			_groupRed3 Move _endPoint1;
		};
		if (_genSize == 4) then {
			for "_i" from 1 to _genNumber do {
				"O_V_Soldier_TL_ghex_F" createUnit [_spawnPointOPFOR, _groupRed1]; 
			};
			for "_i" from 1 to _genNumber do {
				"O_V_Soldier_TL_ghex_F" createUnit [_spawnPointOPFOR, _groupRed2]; 
			};
			for "_i" from 1 to _genNumber do {
				"O_V_Soldier_TL_ghex_F" createUnit [_spawnPointOPFOR, _groupRed3]; 
			};
			for "_i" from 1 to _genNumber do {
				"O_V_Soldier_TL_ghex_F" createUnit [_spawnPointOPFOR, _groupRed4]; 
			};
			_randomDir = random 360;
			_randomDist = selectRandom [20, 40, 60, 80, 100];
			_endPoint1 = _spawnPointOPFOR getPos [_randomDist,_randomDir];
			_groupRed1 Move _endPoint1;
			_randomDir = random 360;
			_randomDist = selectRandom [20, 40, 60, 80, 100];
			_endPoint1 = _spawnPointOPFOR getPos [_randomDist,_randomDir];
			_groupRed2 Move _endPoint1;
			_randomDir = random 360;
			_randomDist = selectRandom [20, 40, 60, 80, 100];
			_endPoint1 = _spawnPointOPFOR getPos [_randomDist,_randomDir];
			_groupRed3 Move _endPoint1;
			_randomDir = random 360;
			_randomDist = selectRandom [20, 40, 60, 80, 100];
			_endPoint1 = _spawnPointOPFOR getPos [_randomDist,_randomDir];
			_groupRed4 Move _endPoint1;
		};

	};
	// vics only 
	if (_genType == 2) then {
		if (_genSize == 1) then {
			_genNumber = 10;
		};
		if (_genSize == 2) then {
			_genNumber = 20;
		};
		if (_genSize == 3) then {
			_genNumber = 35;
		};
		if (_genSize == 4) then {
			_genNumber = 50;
		};
		for "_i" from 1 to _genNumber do {
			"O_V_Soldier_TL_ghex_F" createUnit [_spawnPointOPFOR, _groupRed1]; 
		};
	};
	// airbourne only 
	if (_genType == 3) then {
		if (_genSize == 1) then {
			_genNumber = 10;
		};
		if (_genSize == 2) then {
			_genNumber = 20;
		};
		if (_genSize == 3) then {
			_genNumber = 35;
		};
		if (_genSize == 4) then {
			_genNumber = 50;
		};
		for "_i" from 1 to _genNumber do {
			"O_V_Soldier_TL_ghex_F" createUnit [_spawnPointOPFOR, _groupRed1]; 
		};
	};
	// mixed elements 
	if (_genType == 4) then {
		if (_genSize == 1) then {
			_genNumber = 10;
		};
		if (_genSize == 2) then {
			_genNumber = 20;
		};
		if (_genSize == 3) then {
			_genNumber = 35;
		};
		if (_genSize == 4) then {
			_genNumber = 50;
		};
		for "_i" from 1 to _genNumber do {
			"O_V_Soldier_TL_ghex_F" createUnit [_spawnPointOPFOR, _groupRed1]; 
		};
	};
	// note, right now, all numbers are the same regardless of infi, vic, air or mixed ... MVP yo!
	MISSION_ATTACK = true;
	call fightNow;
};

fightNow = {
		systemChat "fightNow called";

	// what is the mission order? Make necessary controls and instructions happen now
	// activate RF listener 
	/*
	MISSION_ATTACK = false;
	MISSION_DEFEND = false;
	MISSION_HUNT = false;
	MISSION_RUN = false;
	*/
	// _gameType = VAMG_conflictObj select 0;
	// give UI instructions
	// give initial direction of enemy
	while {MISSION_ATTACK} do {
		_units = allUnits inAreaArray "BattleArea";
		_opforCount1 = 0;
		_blueforCount1 = 0;
		// _unitCount1 = count _units;
		{
			switch ((side _x)) do {
				case EAST: {_opforCount1 = _opforCount1 + 1};
				case WEST: {_blueforCount1 = _blueforCount1 + 1};
			};
		} forEach _units;
		if ((_opforCount1) <= 2)  then {
			// check here for RF settings 
			systemChat "MISSION COMPLETE .. !!!";
			MISSION_ATTACK = false;
			execVM "voiceActivatedMissionGenerator\VAMG_init.sqf";
			execVM "voiceActivatedMissionGenerator\VAMG_clearKeyDowns.sqf";
		};
		sleep 10;
	};
	if (MISSION_DEFEND) then {
	// move enemy to player pos
	// give UI instructions
	};
	if (MISSION_HUNT) then {
	// move enemy to player pos on cycle
	// create safezone 
	// give UI instructions
	};
	if (MISSION_RUN) then {
	// create enemy safezone 
	// move enemy to enemy safezone 
	// give UI instructions
	};
};

// area gen 
// this FNC generates an area around the player 
// this is the AO for which all other calcs are based on
generateAO = {
	systemChat "generateMarkers called";

	// configs start
	_area = VAMG_areaSize select 0;
	_startPosition = position player;
	// configs end 
	// AO Marker Start
	if (_area == 1) then {
		_num = 1000;
	};
	if (_area == 2) then {
		_num = 2000;
	};
	if (_area == 3) then {
		_num = 3500;
	};
	if (_area == 4) then {
		_num = 5000;
	};
	deleteMarkerlocal "BattleArea"; 
	_battleArea = createMarkerLocal ["BattleArea", _startPosition];
	_battleArea setMarkerShapeLocal "ELLIPSE";
	_battleArea setMarkerColorLocal "ColorBlack";
	_battleArea setMarkerSizeLocal [_num, _num];
	_battleArea setMarkerAlphaLocal 0.5;
	// AO Marker End
	// Spawn Marker Start
	_placement = VAMG_enemyPlacement select 0;
	if (_placement == 1) then {
		_spawnPointOPFOR = [_startPosition, 500, 700] call BIS_fnc_findSafePos; 
			deleteMarkerlocal "SpawnArea"; 
			_spawnArea = createMarkerLocal ["SpawnArea", _spawnPointOPFOR];
			_spawnArea setMarkerShapeLocal "ELLIPSE";
			_spawnArea setMarkerColorLocal "ColorBlack";
			_spawnArea setMarkerSizeLocal [_num, _num];
			_spawnArea setMarkerAlphaLocal 0.9;
		[_spawnPointOPFOR] spawn generateOpfor;
	} else {
		// _randomDir = selectRandom 360;
		// _randomDist = selectRandom [300, 350, 400, 450, 500];
		// some randomisation is needed here
		[] spawn generateOpfor;
	};
	// Spawn Marker End
}; call generateAO;
