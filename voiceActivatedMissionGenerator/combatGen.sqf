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

systemChat "combatGen activated";

private ["_num"];




generateOpfor = {
	// This function generates relevant enemies as per mission request 
	// CSAT - Standard:
	_opforCSAT = [O_Soldier_F, O_officer_F, O_Soldier_lite_F, O_Soldier_GL_F, O_Soldier_AR_F, O_Soldier_SL_F, O_Soldier_TL_F, O_soldier_M_F, O_Soldier_LAT_F, O_medic_F, O_soldier_repair_F, O_soldier_exp_F, O_Soldier_A_F, O_Soldier_AT_F, O_Soldier_AA_F, O_engineer_F, O_Soldier_AAR_F, O_Soldier_AAT_F, O_Soldier_AAA_F, O_support_MG_F, O_support_GMG_F, O_support_Mort_F, O_Sharpshooter_F, O_HeavyGunner_F];
	// CSAT - Pacific:
	_opforCSATpacific = [O_T_Soldier_A_F, O_T_Soldier_AAR_F, O_T_Support_AMG_F, O_T_Support_AMort_F, O_T_Soldier_AAA_F, O_T_Soldier_AAT_F, O_T_Soldier_AR_F, O_T_Medic_F, O_T_Crew_F, O_T_Engineer_F, O_T_Soldier_Exp_F, O_T_Soldier_GL_F, O_T_Support_GMG_F, O_T_Support_MG_F, O_T_Support_Mort_F, O_T_Soldier_M_F, O_T_Soldier_AA_F, O_T_Soldier_AT_F, O_T_Officer_F, O_T_Soldier_Repair_F, O_T_Soldier_F, O_T_Soldier_LAT_F, O_T_Soldier_SL_F,  O_T_Soldier_TL_F];
	// CSAT - Urban:
	_opforCSATurban	= [O_soldierU_F, O_soldierU_AR_F, O_soldierU_AAR_F, O_soldierU_LAT_F, O_soldierU_AT_F, O_soldierU_AAT_F, O_soldierU_AA_F, O_soldierU_AAA_F, O_soldierU_TL_F, O_SoldierU_SL_F, O_soldierU_medic_F, O_soldierU_repair_F, O_soldierU_exp_F, O_engineer_U_F, O_soldierU_M_F, O_soldierU_A_F, O_SoldierU_GL_F];
	// CSAT - Recon:
	_opforCSATrecon	= [O_recon_F, O_recon_M_F, O_recon_LAT_F, O_recon_medic_F, O_recon_exp_F, O_recon_JTAC_F, O_recon_TL_F, O_ghillie_lsh_F, O_ghillie_sard_F, O_ghillie_ard_F, O_Pathfinder_F];
	// CSAT - Pacific Recon:
	_opforCSATpacificRecon = [O_T_Recon_Exp_F, O_T_Recon_JTAC_F, O_T_Recon_M_F, O_T_Recon_Medic_F, O_T_Recon_F, O_T_Recon_LAT_F, O_T_Recon_TL_F, O_T_Sniper_F, O_T_Spotter_F, O_T_ghillie_tna_F];
	// CSAT - Viper:
	_opforCSATviper	= [O_V_Soldier_hex_F, O_V_Soldier_TL_hex_F, O_V_Soldier_Exp_hex_F, O_V_Soldier_Medic_hex_F, O_V_Soldier_M_hex_F, O_V_Soldier_LAT_hex_F, O_V_Soldier_JTAC_hex_F];
	// CSAT - Viper Pacific:
	_opforCSATviper	= [O_V_Soldier_TL_ghex_F, O_V_Soldier_ghex_F, O_V_Soldier_Exp_ghex_F, O_V_Soldier_Medic_ghex_F, O_V_Soldier_M_ghex_F, O_V_Soldier_LAT_ghex_F, O_V_Soldier_JTAC_ghex_F];
	// FIA:
	_opforFactionFIA = [O_G_Soldier_F, O_G_Soldier_lite_F, O_G_Soldier_SL_F, O_G_Soldier_AR_F, O_G_medic_F,O_G_engineer_F, O_G_Soldier_exp_F, O_G_Soldier_GL_F, O_G_Soldier_M_F, O_G_Soldier_LAT_F, O_G_Soldier_A_F, O_G_Sharpshooter_F];
	
	// hard-coded opfor groupings:
	_groupRed1 = createGroup east;
	_groupRed2 = createGroup east;
	_groupRed3 = createGroup east;
	_groupRed4 = createGroup east;
	_groupRed5 = createGroup east;
	
	// spawn (uses the parsed opfor spawnpoint):
	_spawnPointOPFOR = _this select 0;
	
	// gen-config:
	_genType = VAMG_conflictType select 0; // infi, vic, air or mixed
	_genSize = VAMG_conflictSize select 0; // indicates number of units to create - as a category, not a pure integer 
	
	// genType == infi only:
	if (_genType == 1) then {
		_genNumber = 10; // hardcoded integer for number of units per group - 10 is simple 
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
	// genType == vics only: 
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
	// genType == airbourne only:  
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
	// genType == mixed elements 
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
	
	_gameType = VAMG_conflictObj select 0;

	// you attack them
	if (_gameType == 1) then {
		MISSION_ATTACK = true;
		call fightNow;
	};
	// they attack you
	if (_gameType == 2) then {
		systemChat "checking mission defend - true now";
		MISSION_DEFEND = true;
		
		// if (side _x == east) then {
		// 	_x doMove (position player);
		// } forEach allUnits;

	_units = allUnits inAreaArray "BattleArea";
	_unitCount = count _units;
	{
		switch ((side _x)) do
		{
			case EAST: {	_x doMove (position player)};
			case WEST: {};
		};
	} forEach _units;


		call fightNow;
	};
	// you hunt them
	if (_gameType == 3) then {
		MISSION_HUNT = true;
		call fightNow;
	};
	// they hunt you
	if (_gameType == 4) then {
		MISSION_RUN = true;
		call fightNow;
	};
};

fightNow = {
	systemChat "fightNow called";
	execVM "voiceActivatedMissionGenerator\VAMG_init.sqf";
	execVM "voiceActivatedMissionGenerator\VAMG_clearKeyDowns.sqf";
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
		};
		sleep 10;
	};

	while {MISSION_DEFEND} do {
	// move enemy to player pos
	// give UI instructions
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
			MISSION_DEFEND = false;
		};
		sleep 10;
	};
	while {MISSION_HUNT} do {
	// move enemy to player pos on cycle
	// create safezone 
	// give UI instructions
		sleep 10;
	};
	while {MISSION_RUN} do {
	// create enemy safezone 
	// move enemy to enemy safezone 
	// give UI instructions
		sleep 10;
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