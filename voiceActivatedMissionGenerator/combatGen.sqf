/*

Q1 – infi, vic, air or mixed
Q2 – small medium large xl conflict
Q3 – only if vics – what class of weight, light medium, heavy, random
Q4 – area – small med large xl
Q5 – placement – clustered or everywhere
Q6 – intel – show once, show periodically, never
Q7 – faction
Q8 - facion class
Q9 – type of RF – none, light, medium twice, heavy three times
Q10 – mission type – you attack, they attack, you escape, they escape?
Q11 - confirm or cancel

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

	// _genType = VAMG_conflictType select 0; // infi, vic, air or mixed
	// _genSize = VAMG_conflictSize select 0; // indicates number of units to create - as a category (1-5), not a pure integer 
	// _genFaction = VAMG_enemyFaction select 0; // indicates faction of enemy, like CSAT
	// _genFactionClass = VAMG_enemyClass select 0; // indicates class-type, like Pacific, or Urban

	// if (_genFaction == 1) then {
	// 	switch (_genFactionClass) do {
	// 		case 1: { _facClass = _opforCSAT };
	// 		case 2: { _facClass = _opforCSATpacific };
	// 		case 3: { _facClass = _opforCSATurban };
	// 		case 4: { _facClass = _opforCSATrecon };
	// 		case 5: { _facClass = _opforCSATpacificRecon };
	// 		case 6: { _facClass = _opforCSATviper };
	// 		case 7: { _facClass = _opforCSATviperPacific };
	// 		default { hint "default" };
	// 	};
	// };
	// if (_genFaction == 2) then {
	// 	switch (_genFactionClass) do {
	// 		case 1: { _facClass = _opforFactionFIA };
	// 		default { hint "default" };
	// 	};
	// };


// systemChat "combatGen activated";
private ["_num", "_facClass", "_safeExtent", "_safeExtentMin", "_safeExtentMax", "_mpos1", "_mpos2"];

// This function generates relevant enemies as per mission request
generateOpfor = {
	private ["_num", "_facClass", "_safeExtent"];
	// CSAT - Standard:
	_opforCSAT = ["O_Soldier_F", "O_officer_F", "O_Soldier_lite_F", "O_Soldier_GL_F", "O_Soldier_AR_F", "O_Soldier_SL_F", "O_Soldier_TL_F", "O_soldier_M_F", "O_Soldier_LAT_F", "O_medic_F", "O_soldier_repair_F", "O_soldier_exp_F", "O_Soldier_A_F", "O_Soldier_AT_F", "O_Soldier_AA_F", "O_engineer_F", "O_Soldier_AAR_F", "O_Soldier_AAT_F", "O_Soldier_AAA_F", "O_support_MG_F", "O_support_GMG_F", "O_support_Mort_F", "O_Sharpshooter_F", "O_HeavyGunner_F"];
	// CSAT - Pacific:
	_opforCSATpacific = ["O_T_Soldier_A_F", "O_T_Soldier_AAR_F", "O_T_Support_AMG_F", "O_T_Support_AMort_F", "O_T_Soldier_AAA_F", "O_T_Soldier_AAT_F", "O_T_Soldier_AR_F", "O_T_Medic_F", "O_T_Crew_F", "O_T_Engineer_F", "O_T_Soldier_Exp_F", "O_T_Soldier_GL_F", "O_T_Support_GMG_F", "O_T_Support_MG_F", "O_T_Support_Mort_F", "O_T_Soldier_M_F", "O_T_Soldier_AA_F", "O_T_Soldier_AT_F", "O_T_Officer_F", "O_T_Soldier_Repair_F", "O_T_Soldier_F", "O_T_Soldier_LAT_F", "O_T_Soldier_SL_F",  "O_T_Soldier_TL_F"];
	// CSAT - Urban:
	_opforCSATurban = ["O_soldierU_F", "O_soldierU_AR_F", "O_soldierU_AAR_F", "O_soldierU_LAT_F", "O_soldierU_AT_F", "O_soldierU_AAT_F", "O_soldierU_AA_F", "O_soldierU_AAA_F", "O_soldierU_TL_F", "O_SoldierU_SL_F", "O_soldierU_medic_F", "O_soldierU_repair_F", "O_soldierU_exp_F", "O_engineer_U_F", "O_soldierU_M_F", "O_soldierU_A_F", "O_SoldierU_GL_F"];
	// CSAT - Recon:
	_opforCSATrecon	= ["O_recon_F", "O_recon_M_F", "O_recon_LAT_F", "O_recon_medic_F", "O_recon_exp_F", "O_recon_JTAC_F", "O_recon_TL_F", "O_ghillie_lsh_F", "O_ghillie_sard_F", "O_ghillie_ard_F", "O_Pathfinder_F"];
	// CSAT - Pacific Recon:
	_opforCSATpacificRecon = ["O_T_Recon_Exp_F", "O_T_Recon_JTAC_F", "O_T_Recon_M_F", "O_T_Recon_Medic_F", "O_T_Recon_F", "O_T_Recon_LAT_F", "O_T_Recon_TL_F", "O_T_Sniper_F", "O_T_Spotter_F", "O_T_ghillie_tna_F"];
	// CSAT - Viper:
	_opforCSATviper	= ["O_V_Soldier_hex_F", "O_V_Soldier_TL_hex_F", "O_V_Soldier_Exp_hex_F", "O_V_Soldier_Medic_hex_F", "O_V_Soldier_M_hex_F", "O_V_Soldier_LAT_hex_F", "O_V_Soldier_JTAC_hex_F"];
	// CSAT - Viper Pacific:
	_opforCSATviperPacific = ["O_V_Soldier_TL_ghex_F", "O_V_Soldier_ghex_F", "O_V_Soldier_Exp_ghex_F", "O_V_Soldier_Medic_ghex_F", "O_V_Soldier_M_ghex_F", "O_V_Soldier_LAT_ghex_F", "O_V_Soldier_JTAC_ghex_F"];
	// FIA - Standard:
	_opforFactionFIA = ["O_G_Soldier_F", "O_G_Soldier_lite_F", "O_G_Soldier_SL_F", "O_G_Soldier_AR_F", "O_G_medic_F", "O_G_engineer_F", "O_G_Soldier_exp_F", "O_G_Soldier_GL_F", "O_G_Soldier_M_F", "O_G_Soldier_LAT_F", "O_G_Soldier_A_F", "O_G_Sharpshooter_F"];
	
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
	_genSize = VAMG_conflictSize select 0; // indicates number of units to create - as a category (1-5), not a pure integer 
	_genFaction = VAMG_enemyFaction select 0; // indicates faction of enemy, like CSAT
	_genFactionClass = VAMG_enemyClass select 0; // indicates class-type, like Pacific, or Urban
	
	if (_genFaction == 1) then {
		if (_genFactionClass == 1) then {
			_facClass = _opforCSAT;
		};
		if (_genFactionClass == 2) then {
			_facClass = _opforCSATpacific;
		};
		if (_genFactionClass == 3) then {
			_facClass = _opforCSATurban;
		};
		if (_genFactionClass == 4) then {
			_facClass = _opforCSATrecon;
		};
		if (_genFactionClass == 5) then {
			_facClass = _opforCSATpacificRecon;
		};
		if (_genFactionClass == 6) then {
			_facClass = _opforCSATviper;
		};
		if (_genFactionClass == 7) then {
			_facClass = _opforCSATviperPacific;
		};
	};

	// assign local var to determine which faction class should be used
	// if (_genFaction == 1) then {
	// 	switch (_genFactionClass) do {
	// 		case 1: { _facClass = _opforCSAT };
	// 		case 2: { _facClass = _opforCSATpacific };
	// 		case 3: { _facClass = _opforCSATurban };
	// 		case 4: { _facClass = _opforCSATrecon };
	// 		case 5: { _facClass = _opforCSATpacificRecon };
	// 		case 6: { _facClass = _opforCSATviper };
	// 		case 7: { _facClass = _opforCSATviperPacific };
	// 		default { hint "default" };
	// 	};
	// };
	// if (_genFaction == 2) then {
	// 	switch (_genFactionClass) do {
	// 		case 1: { _facClass = _opforFactionFIA };
	// 		default { hint "default" };
	// 	};
	// };

	
		
	

	// genType 1 == infi only:
	if (_genType == 1) then {
		_mPos1 = getMarkerPos "spawnpoint1";
		_mPos2 = getMarkerPos "spawnpoint2";
		_mPos3 = getMarkerPos "spawnpoint3";
		_mPos4 = getMarkerPos "spawnpoint4";
		_genNumber = 10; // hardcoded integer for number of units per group - 10 is simple 

		if (_genSize == 1) then {
			for "_i" from 1 to _genNumber do {
				// _mPos1 = getMarkerPos "spawnpoint1";
				_unit = selectRandom _facClass; 
				_unit createUnit [_mPos1, _groupRed1]; 
				sleep 1;
			};
			_randomDir = random 360;
			_randomDist = selectRandom [50, 100, 150, 200];
			_endPoint1 = _mPos1 getPos [_randomDist, _randomDir];
			_groupRed1 move _endPoint1;
		};

		if (_genSize == 2) then {
			for "_i" from 1 to 10 do {
				_unit = selectRandom _facClass; 
				_unit createUnit [_mPos1 , _groupRed1]; 
				systemChat "opfor red 1";
				sleep 1;
			};
			for "_i" from 1 to 10 do {
				_unit = selectRandom _facClass; 
				_unit createUnit [_mPos2, _groupRed2]; 
				sleep 1;
			};
			_randomDir = random 360;
			_randomDist = selectRandom [50, 100, 150, 200];
			_endPoint1 = _mPos1 getPos [_randomDist, _randomDir];
			_groupRed1 move _endPoint1;

			_randomDir = random 360;
			_randomDist = selectRandom [50, 100, 150, 200];
			_endPoint2 = _mPos2 getPos [_randomDist, _randomDir];
			_groupRed2 move _endPoint2;
		};

		if (_genSize == 3) then {
			for "_i" from 1 to _genNumber do {
				_unit = selectRandom _facClass; 
				_unit createUnit [_mPos1, _groupRed1]; 
				sleep 1;
			};
			for "_i" from 1 to _genNumber do {
				_unit = selectRandom _facClass; 
				_unit createUnit [_mPos2, _groupRed2]; 
				sleep 1;
			};
			for "_i" from 1 to _genNumber do {
				_unit = selectRandom _facClass; 
				_unit createUnit [_mPos3, _groupRed3]; 
				sleep 1;
			};
			_randomDir = random 360;
			_randomDist = selectRandom [50, 100, 150, 200];
			_endPoint1 = _mPos1 getPos [_randomDist,_randomDir];
			_groupRed1 move _endPoint1;

			_randomDir = random 360;
			_randomDist = selectRandom [50, 100, 150, 200];
			_endPoint2 = _mPos2 getPos [_randomDist,_randomDir];
			_groupRed2 move _endPoint2;

			_randomDir = random 360;
			_randomDist = selectRandom [50, 100, 150, 200];
			_endPoint3 = _mPos3 getPos [_randomDist,_randomDir];
			_groupRed3 move _endPoint3;

		};

		if (_genSize == 4) then {

			for "_i" from 1 to _genNumber do {
				_unit = selectRandom _facClass; 
				_unit createUnit [_mPos1, _groupRed1]; 
				sleep 1;
			};
			for "_i" from 1 to _genNumber do {
				_unit = selectRandom _facClass; 
				_unit createUnit [_mPos2, _groupRed2]; 
				sleep 1;
			};
			for "_i" from 1 to _genNumber do {
				_unit = selectRandom _facClass; 
				_unit createUnit [_mPos3, _groupRed3]; 
				sleep 1;
			};
			for "_i" from 1 to _genNumber do {
				_unit = selectRandom _facClass; 
				_unit createUnit [_mPos4, _groupRed4]; 
				sleep 1;
			};
			_randomDir = random 360;
			_randomDist = selectRandom [50, 100, 150, 200];
			_endPoint1 = _mPos1 getPos [_randomDist,_randomDir];
			_groupRed1 move _endPoint1;

			_randomDir = random 360;
			_randomDist = selectRandom [50, 100, 150, 200];
			_endPoint2 = _mPos2 getPos [_randomDist,_randomDir];
			_groupRed2 move _endPoint2;

			_randomDir = random 360;
			_randomDist = selectRandom [50, 100, 150, 200];
			_endPoint3 = _mPos3 getPos [_randomDist,_randomDir];
			_groupRed3 move _endPoint3;

			_randomDir = random 360;
			_randomDist = selectRandom [50, 100, 150, 200];
			_endPoint4 = _mPos4 getPos [_randomDist,_randomDir];
			_groupRed4 move _endPoint4;

			// this method below could be an 'intercept' mission 
			// _randomDir = random 360;
			// _randomDist = selectRandom [20, 40, 60, 80, 100];
			// _endPoint1 = _spawnPointOPFOR getPos [_randomDist,_randomDir];
			// // _groupRed1 Move _endPoint1;
			// _mPos1 = getMarkerPos "spawnpoint1";
			// _groupRed1 Move _mPos1;

			// _randomDir = random 360;
			// _randomDist = selectRandom [20, 40, 60, 80, 100];
			// _endPoint1 = _spawnPointOPFOR getPos [_randomDist,_randomDir];
			// // _groupRed2 Move _endPoint1;
			// _mPos2 = getMarkerPos "spawnpoint2";
			// _groupRed2 Move _mPos2;

			// _randomDir = random 360;
			// _randomDist = selectRandom [20, 40, 60, 80, 100];
			// _endPoint1 = _spawnPointOPFOR getPos [_randomDist,_randomDir];
			// // _groupRed3 Move _endPoint1;
			// _mPos3 = getMarkerPos "spawnpoint3";
			// _groupRed3 Move _mPos3;

			// _randomDir = random 360;
			// _randomDist = selectRandom [20, 40, 60, 80, 100];
			// _endPoint1 = _spawnPointOPFOR getPos [_randomDist,_randomDir];
			// // _groupRed4 Move _endPoint1;
			// _mPos4 = getMarkerPos "spawnpoint4";
			// _groupRed4 Move _mPos4;

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
	
	_gameType = VAMG_conflictObj select 0;

	// you attack them
	if (_gameType == 1) then {
		MISSION_ATTACK = true;
		call fightNow;
	};
	// they attack you
	if (_gameType == 2) then {
		// systemChat "checking mission defend - true now";
		MISSION_DEFEND = true;
		
		// if (side _x == east) then {
		// 	_x doMove (position player);
		// } forEach allUnits;

	_units = allUnits inAreaArray "BattleArea";
	_unitCount = count _units;
	{
		switch ((side _x)) do
		{
			case EAST: { _x doMove (position player) };
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

	// i moved this here, as it was triggering before all 40 units could be created (resulting in only partial opfor spawning)
	// i still dont know if this fully works however - to be tested
	execVM "voiceActivatedMissionGenerator\VAMG_init.sqf";

};

fightNow = {
	// systemChat "fightNow called";
	// execVM "voiceActivatedMissionGenerator\VAMG_init.sqf";
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

	if (_genSize == 1) then {
		M1MISSION = true;
	};

	if (_genSize == 2) then {
		M1MISSION = true;
		M2MISSION = true;
	};
	if (_genSize == 3) then {
		M1MISSION = true;
		M2MISSION = true;
		M3MISSION = true;
	};
	if (_genSize == 4) then {
		M1MISSION = true;
		M2MISSION = true;
		M3MISSION = true;
		M4MISSION = true;
	};

	while {MISSION_ATTACK} do {
		_allUnits = allUnits inAreaArray "BattleArea";
		_genSize = VAMG_conflictSize select 0;
		
		_m1Units = allUnits inAreaArray "spawnpoint1";
		_m2Units = allUnits inAreaArray "spawnpoint2";
		_m3Units = allUnits inAreaArray "spawnpoint3";
		_m4Units = allUnits inAreaArray "spawnpoint4";

		if (M1MISSION) then {
			sleep 10;
			_opforCount1 = 0;
			_blueforCount1 = 0;
			{
				switch ((side _x)) do {
					case EAST: {_opforCount1 = _opforCount1 + 1};
					case WEST: {_blueforCount1 = _blueforCount1 + 1};
				};
			} forEach _m1Units;
			if ((_opforCount1) <= 2)  then {
				systemChat "M1 MISSION COMPLETE .. !!!";
				M1MISSION = false;
				deleteMarkerlocal "spawnpoint1"; 
			};
		};

		if (M2MISSION) then {
			sleep 10;
			_opforCount2 = 0;
			_blueforCount2 = 0;
			{
				switch ((side _x)) do {
					case EAST: {_opforCount2 = _opforCount2 + 1};
					case WEST: {_blueforCount2 = _blueforCount2 + 1};
				};
			} forEach _m2Units;
			if ((_opforCount2) <= 2)  then {
				systemChat "M2 MISSION COMPLETE .. !!!";
				M2MISSION = false;
				deleteMarkerlocal "spawnpoint2"; 
			};
		};

		if (M3MISSION) then {
			sleep 10;
			_opforCount3 = 0;
			_blueforCount3 = 0;
			{
				switch ((side _x)) do {
					case EAST: {_opforCount3 = _opforCount3 + 1};
					case WEST: {_blueforCount3 = _blueforCount3 + 1};
				};
			} forEach _m3Units;
			if ((_opforCount3) <= 2)  then {
				// check here for RF settings 
				systemChat "M3 MISSION COMPLETE .. !!!";
				M3MISSION = false;
				deleteMarkerlocal "spawnpoint3"; 
			};
		};

		if (M4MISSION) then {
			sleep 10;
			_opforCount4 = 0;
			_blueforCount4 = 0;
			{
				switch ((side _x)) do {
					case EAST: {_opforCount4 = _opforCount4 + 1};
					case WEST: {_blueforCount4 = _blueforCount4 + 1};
				};
			} forEach _m4Units;
			if ((_opforCount4) <= 2)  then {
				// check here for RF settings 
				systemChat "M4 MISSION COMPLETE .. !!!";
				M4MISSION = false;
				deleteMarkerlocal "spawnpoint4"; 
			};
		};
		// if (_genSize == 1) then {
		// 	sleep 10;
		// 	_opforCount1 = 0;
		// 	_blueforCount1 = 0;
		// 	{
		// 		switch ((side _x)) do {
		// 			case EAST: {_opforCount1 = _opforCount1 + 1};
		// 			case WEST: {_blueforCount1 = _blueforCount1 + 1};
		// 		};
		// 	} forEach _m1Units;
		// 	if ((_opforCount1) <= 2)  then {
		// 		// check here for RF settings 
		// 		systemChat "M1 MISSION COMPLETE .. !!!";
		// 		// MISSION_ATTACK = false;
		// 		deleteMarkerlocal "spawnpoint1"; 
		// 	};
		// };

		// if (_genSize == 2) then {
		// 	sleep 10;
		// 	_opforCount1 = 0;
		// 	_blueforCount1 = 0;
		// 	{
		// 		switch ((side _x)) do {
		// 			case EAST: {_opforCount1 = _opforCount1 + 1};
		// 			case WEST: {_blueforCount1 = _blueforCount1 + 1};
		// 		};
		// 	} forEach _m1Units;
		// 	if ((_opforCount1) <= 2)  then {
		// 		// check here for RF settings 
		// 		systemChat "M1 MISSION COMPLETE .. !!!";
		// 		// MISSION_ATTACK = false;
		// 		deleteMarkerlocal "spawnpoint1"; 
		// 	};

		// 	_opforCount2 = 0;
		// 	_blueforCount2 = 0;
		// 	{
		// 		switch ((side _x)) do {
		// 			case EAST: {_opforCount2 = _opforCount2 + 1};
		// 			case WEST: {_blueforCount2 = _blueforCount2 + 1};
		// 		};
		// 	} forEach _m2Units;
		// 	if ((_opforCount2) <= 2)  then {
		// 		// check here for RF settings 
		// 		systemChat "M2 MISSION COMPLETE .. !!!";
		// 		// MISSION_ATTACK = false;
		// 		deleteMarkerlocal "spawnpoint2"; 
		// 	};
		// };

		// if (_genSize == 3) then {
		// 	sleep 10;
		// 	_opforCount1 = 0;
		// 	_blueforCount1 = 0;
		// 	{
		// 		switch ((side _x)) do {
		// 			case EAST: {_opforCount1 = _opforCount1 + 1};
		// 			case WEST: {_blueforCount1 = _blueforCount1 + 1};
		// 		};
		// 	} forEach _m1Units;
		// 	if ((_opforCount1) <= 2)  then {
		// 		// check here for RF settings 
		// 		systemChat "M1 MISSION COMPLETE .. !!!";
		// 		// MISSION_ATTACK = false;
		// 		deleteMarkerlocal "spawnpoint1"; 
		// 	};

		// 	_opforCount2 = 0;
		// 	_blueforCount2 = 0;
		// 	{
		// 		switch ((side _x)) do {
		// 			case EAST: {_opforCount2 = _opforCount2 + 1};
		// 			case WEST: {_blueforCount2 = _blueforCount2 + 1};
		// 		};
		// 	} forEach _m2Units;
		// 	if ((_opforCount2) <= 2)  then {
		// 		// check here for RF settings 
		// 		systemChat "M2 MISSION COMPLETE .. !!!";
		// 		// MISSION_ATTACK = false;
		// 		deleteMarkerlocal "spawnpoint2"; 
		// 	};

		// 	_opforCount3 = 0;
		// 	_blueforCount3 = 0;
		// 	{
		// 		switch ((side _x)) do {
		// 			case EAST: {_opforCount3 = _opforCount3 + 1};
		// 			case WEST: {_blueforCount3 = _blueforCount3 + 1};
		// 		};
		// 	} forEach _m3Units;
		// 	if ((_opforCount3) <= 2)  then {
		// 		// check here for RF settings 
		// 		systemChat "M3 MISSION COMPLETE .. !!!";
		// 		// MISSION_ATTACK = false;
		// 		deleteMarkerlocal "spawnpoint3"; 
		// 	};
		// };

		// if (_genSize == 4) then {
		// 	sleep 10;
		// 	_opforCount1 = 0;
		// 	_blueforCount1 = 0;
		// 	{
		// 		switch ((side _x)) do {
		// 			case EAST: {_opforCount1 = _opforCount1 + 1};
		// 			case WEST: {_blueforCount1 = _blueforCount1 + 1};
		// 		};
		// 	} forEach _m1Units;
		// 	if ((_opforCount1) <= 2)  then {
		// 		// check here for RF settings 
		// 		systemChat "M1 MISSION COMPLETE .. !!!";
		// 		// MISSION_ATTACK = false;
		// 		deleteMarkerlocal "spawnpoint1"; 
		// 	};

		// 	_opforCount2 = 0;
		// 	_blueforCount2 = 0;
		// 	{
		// 		switch ((side _x)) do {
		// 			case EAST: {_opforCount2 = _opforCount2 + 1};
		// 			case WEST: {_blueforCount2 = _blueforCount2 + 1};
		// 		};
		// 	} forEach _m2Units;
		// 	if ((_opforCount2) <= 2)  then {
		// 		// check here for RF settings 
		// 		systemChat "M2 MISSION COMPLETE .. !!!";
		// 		// MISSION_ATTACK = false;
		// 		deleteMarkerlocal "spawnpoint2"; 
		// 	};

		// 	_opforCount3 = 0;
		// 	_blueforCount3 = 0;
		// 	{
		// 		switch ((side _x)) do {
		// 			case EAST: {_opforCount3 = _opforCount3 + 1};
		// 			case WEST: {_blueforCount3 = _blueforCount3 + 1};
		// 		};
		// 	} forEach _m3Units;
		// 	if ((_opforCount3) <= 2)  then {
		// 		// check here for RF settings 
		// 		systemChat "M3 MISSION COMPLETE .. !!!";
		// 		// MISSION_ATTACK = false;
		// 		deleteMarkerlocal "spawnpoint3"; 
		// 	};

		// 	_opforCount4 = 0;
		// 	_blueforCount4 = 0;
		// 	{
		// 		switch ((side _x)) do {
		// 			case EAST: {_opforCount4 = _opforCount4 + 1};
		// 			case WEST: {_blueforCount4 = _blueforCount4 + 1};
		// 		};
		// 	} forEach _m4Units;
		// 	if ((_opforCount4) <= 2)  then {
		// 		// check here for RF settings 
		// 		systemChat "M4 MISSION COMPLETE .. !!!";
		// 		// MISSION_ATTACK = false;
		// 		deleteMarkerlocal "spawnpoint4"; 
		// 	};
		// };


		_opforCount1 = 0;
		_blueforCount1 = 0;
		// _unitCount1 = count _units;
		{
			switch ((side _x)) do {
				case EAST: {_opforCount1 = _opforCount1 + 1};
				case WEST: {_blueforCount1 = _blueforCount1 + 1};
			};
		} forEach _allUnits;
		if ((_opforCount1) <= 2)  then {
			// check here for RF settings 
			sleep 2;
			systemChat "--------------------------- ALL MISSIONS COMPLETE .. !!!";
			MISSION_ATTACK = false;
		};
		sleep 10;
	};

	while {MISSION_DEFEND} do {
	// move enemy to player pos
	// give UI instructions
		_allUnits = allUnits inAreaArray "BattleArea";
		_opforCount1 = 0;
		_blueforCount1 = 0;
		// _unitCount1 = count _units;
		{
			switch ((side _x)) do {
				case EAST: { _opforCount1 = _opforCount1 + 1 };
				case WEST: { _blueforCount1 = _blueforCount1 + 1 };
			};
		} forEach _allUnits;

		if ((_opforCount1) <= 2)  then {
			// check here for RF settings 
			systemChat "MISSION COMPLETE .. !!!";
			MISSION_DEFEND = false;
		};

		_allUnits = allUnits inAreaArray "BattleArea";
		_unitCount = count _allUnits;
		{
			switch ((side _x)) do
			{
				case EAST: { _x doMove (position player) };
				case WEST: {};
			};
		} forEach _allUnits;

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


// AREA GENERATOR
// this FNC generates an area around the player and is the AO for which all other calcs are based on
generateAO = {
	// systemChat "generateMarkers called";
	// configs start
	_area = VAMG_areaSize select 0;
	_startPosition = position player;
	// configs end 
	// AO Marker Start
	// switch (_area) do {
	// 	case: 1 { _num = 1000 };
	// 	case: 2 { _num = 2000 };
	// 	case: 3 { _num = 3500 };
	// 	case: 4 { _num = 5000 };
	// 	default { systemChat "default" };
	// };
	if (_area == 1) then {
		_num = 1000;
	};
	if (_area == 2) then {
		_num = 2000;
	};
	if (_area == 3) then {
		_num = 3000;
	};
	if (_area == 4) then {
		_num = 4000;
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
	// placement in this context means how many different spawn points  should be created 
	// if only one opfor group, this actually does not matter 
	// however if multi-groups then this setting determines whether all opfor
	// groups spawn roughly in the same area, or whther each group is a random
	// spawner area  
	//
	// this switch helps to determine the outer extend of the enemy safezone
	// switch (_area) do {
	// 	case 1: { _safeExtent = 600 };
	// 	case 2: { _safeExtent = 1200 };
	// 	case 3: { _safeExtent = 1850 };
	// 	case 4: { _safeExtent = 2500 };
	// 	default { systemChat "default" };
	// };
	// //

	if (_area == 1) then {
		_safeExtentMin = 600;
		_safeExtentMax = 1000,
	};
	if (_area == 2) then {
		_safeExtentMin = 800;
		_safeExtentMax = 2000,
	};
	if (_area == 3) then {
		_safeExtentMin = 1000;
		_safeExtentMax = 3000,
	};
	if (_area == 4) then {
		_safeExtentMin = 1200;
		_safeExtentMax = 4000,
	};

	private ["_spawnPointOPFOR"];

	// placement 1 = all opfor elements are clustered together as one badassmass
	if (_placement == 1) then {
		_spawnPointOPFOR = [_startPosition, _safeExtentMin, _safeExtentMax] call BIS_fnc_findSafePos; 
			deleteMarkerlocal "spawnpoint1"; 
			_spawnArea = createMarkerLocal ["spawnpoint1", _spawnPointOPFOR];
			_spawnArea setMarkerShapeLocal "ELLIPSE";
			_spawnArea setMarkerColorLocal "ColorRed";
			_spawnArea setMarkerSizeLocal [300, 300];
			_spawnArea setMarkerAlphaLocal 0.9;
		[_spawnPointOPFOR] spawn generateOpfor;
	} else {
		// here, 'else' means random placement of spawn point per created opfor group
		_genSize = VAMG_conflictSize select 0;
		for "_i" from 1 to _genSize do {
			_spawnPointOPFOR = [_startPosition, _safeExtentMin, _safeExtentMax] call BIS_fnc_findSafePos; 
				_marker = "spawnpoint" + (str _i);
				deleteMarkerlocal _marker; 
				_spawnArea = createMarkerLocal [_marker, _spawnPointOPFOR];
				_spawnArea setMarkerShapeLocal "ELLIPSE";
				_spawnArea setMarkerColorLocal "ColorRed";
				_spawnArea setMarkerSizeLocal [300, 300];
				_spawnArea setMarkerAlphaLocal 0.9;
			// [_spawnPointOPFOR] spawn generateOpfor;
			sleep 3;
			systemChat "spawner cycle";
		};
		[_spawnPointOPFOR] spawn generateOpfor;

	};
	// Spawn Marker End
}; call generateAO;


// _pos = position AAF_HQ;
// _marker = "Markername" + (str _pos);
// createMarker [_marker,_pos];

// _marker setmarkerpos (getpos leader _grp1);
// VAMG_conflictSize