/*
from:	voiceActivated??\??.sqf
to:		voiceActivated??\??.sqf 			

purpose:
listens to numpad keypresses, and sends respective values (numpad nums) into arrays 
the array the data is pushed into is dependent on the current state (bool) - this is managed by the monitor 
also kicks off the display UI

notes:
VAMG_numericalInputBool	= false;

VAMG_conflictType 		= [];		// 4 options - infi, vic, air, mixed
VAMG_conflictTypeBool	= false;

VAMG_conflictSize		= [];		// 4 options -  S M L XL
VAMG_conflictSizeBool	= false;

VAMG_vicTypes			= []; 		// 5 options - confirmes types of spawned enemy vehicles
VAMG_vicTypesBool		= false;

VAMG_areaSize			= [];		// 4 options - immediate area, 1km 5km 10km
VAMG_areaSizeBool		= false;

VAMG_enemyPlacement		= []; 		// 2 options - clustered, distributed 
VAMG_enemyPlacementBool	= false;

VAMG_intel				= [];		// 4 options - how much assistance player has in finding the enemy
VAMG_intelBool			= false;

VAMG_enemyFaction		= [];		// 9 options - CSAT, VANILLA REBELS, RHS, PROJECT OPFOR
VAMG_enemyFactionBool	= false;

VAMG_enemyRF			= []; 		// 4 options - none, light once only, medium repeated twice, heavy repeated three times
VAMG_enemyRFBool		= false;

VAMG_conflictObj		= [];		// 2 options - Defend, attack, (observe & destroy, seek and destroy), get to the border 
VAMG_conflictObjBool	= false;

VAMG_confirm			= [];		// 2 options - create or cancel
VAMG_confirmBool		= false;
*/

// ------------------------------------------------------------------ //

if (VAMG_numericalInputbool) then {

	rgg_vamg_cnl = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 181) then {
	
		systemChat 'VAMG ABORTED';
		execVM 'voiceActivatedMissionGenerator\VAMG_clearKeyDowns.sqf'; 
		_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown', rgg_vamg_cnl];
		VAMG_numericalInputbool = false;
		execVM 'voiceActivatedMissionGenerator\VAMG_Init.sqf';
	}"];

	// execVM 'voiceActivatedUnitSpawner\VAUS_initDisplay.sqf';

	rgg_vamg_kd0 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 82) then {

		if (VAUS_camoBool) then {
			VAUS_camo pushback 0;
		};
	}"];
	
	rgg_vamg_kd1 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 79) then {

		if (VAMG_conflictTypeBool) then {
			VAMG_conflictType pushback 1;
		};
		if (VAMG_conflictSizeBool) then {
			VAMG_conflictSize pushback 1;
		};
		if (VAMG_vicTypesBool) then {
			VAMG_vicTypes pushback 1;
		};
		if (VAMG_areaSizeBool) then {
			VAMG_areaSize pushback 1;
		};
		if (VAMG_enemyPlacementBool) then {
			VAMG_enemyPlacement pushback 1;
		};
		if (VAMG_intelBool) then {
			VAMG_intel pushback 1;
		};
		if (VAMG_enemyFactionBool) then {
			VAMG_enemyFaction pushback 1;
		};
		if (VAMG_enemyClassBool) then {
			VAMG_enemyClass pushback 1;
		};
		if (VAMG_enemyRFBool) then {
			VAMG_enemyRF pushback 1;
		};
		if (VAMG_conflictObjBool) then {
			VAMG_conflictObj pushback 1;
		};
		if (VAMG_confirmBool) then {
			VAMG_confirm pushback 1;
		};
	}"];

	rgg_vamg_kd2 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 80) then {
			
		if (VAMG_conflictTypeBool) then {
			VAMG_conflictType pushback 2;
		};
		if (VAMG_conflictSizeBool) then {
			VAMG_conflictSize pushback 2;
		};
		if (VAMG_vicTypesBool) then {
			VAMG_vicTypes pushback 2;
		};
		if (VAMG_areaSizeBool) then {
			VAMG_areaSize pushback 2;
		};
		if (VAMG_enemyPlacementBool) then {
			VAMG_enemyPlacement pushback 2;
		};
		if (VAMG_intelBool) then {
			VAMG_intel pushback 2;
		};
		if (VAMG_enemyFactionBool) then {
			VAMG_enemyFaction pushback 2;
		};
		if (VAMG_enemyClassBool) then {
			VAMG_enemyClass pushback 2;
		};
		if (VAMG_enemyRFBool) then {
			VAMG_enemyRF pushback 2;
		};
		if (VAMG_conflictObjBool) then {
			VAMG_conflictObj pushback 2;
		};
		if (VAMG_confirmBool) then {
			VAMG_confirm pushback 1;
		};
	}"];

	rgg_vamg_kd3 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 81) then {
			
		if (VAMG_conflictTypeBool) then {
			VAMG_conflictType pushback 3;
		};
		if (VAMG_conflictSizeBool) then {
			VAMG_conflictSize pushback 3;
		};
		if (VAMG_vicTypesBool) then {
			VAMG_vicTypes pushback 3;
		};
		if (VAMG_areaSizeBool) then {
			VAMG_areaSize pushback 3;
		};
		if (VAMG_intelBool) then {
			VAMG_intel pushback 3;
		};
		if (VAMG_enemyFactionBool) then {
			VAMG_enemyFaction pushback 3;
		};
		if (VAMG_enemyClassBool) then {
			VAMG_enemyClass pushback 3;
		};
		if (VAMG_enemyRFBool) then {
			VAMG_enemyRF pushback 3;
		};
	}"];

	rgg_vamg_kd4 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 75) then {
		
		if (VAMG_conflictTypeBool) then {
			VAMG_conflictType pushback 4;
		};
		if (VAMG_conflictSizeBool) then {
			VAMG_conflictSize pushback 4;
		};
		if (VAMG_vicTypesBool) then {
			VAMG_vicTypes pushback 4;
		};
		if (VAMG_areaSizeBool) then {
			VAMG_areaSize pushback 4;
		};
		if (VAMG_intelBool) then {
			VAMG_intel pushback 4;
		};
		if (VAMG_enemyFactionBool) then {
			VAMG_enemyFaction pushback 4;
		};
		if (VAMG_enemyClassBool) then {
			VAMG_enemyClass pushback 4;
		};
		if (VAMG_enemyRFBool) then {
			VAMG_enemyRF pushback 4;
		};
	}"];

	rgg_vamg_kd5 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 76) then {
			
		if (VAMG_vicTypesBool) then {
			VAMG_vicTypes pushback 5;
		};
		if (VAMG_enemyFactionBool) then {
			VAMG_enemyFaction pushback 5;
		};
		if (VAMG_enemyClassBool) then {
			VAMG_enemyClass pushback 5;
		};
	}"];

	rgg_vamg_kd6 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 77) then {
			
		if (VAMG_enemyFactionBool) then {
			VAMG_enemyFaction pushback 6;
		};
		if (VAMG_enemyClassBool) then {
			VAMG_enemyClass pushback 6;
		};
	}"];

	rgg_vamg_kd7 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 71) then {
			
		if (VAMG_enemyFactionBool) then {
			VAMG_enemyFaction pushback 7;
		};
		if (VAMG_enemyClassBool) then {
			VAMG_enemyClass pushback 7;
		};
	}"];

	rgg_vamg_kd8 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 72) then {
			
		if (VAMG_enemyFactionBool) then {
			VAMG_enemyFaction pushback 8;
		};
		if (VAMG_enemyClassBool) then {
			VAMG_enemyClass pushback 8;
		};
	}"];

	rgg_vamg_kd9 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 73) then {
			
		if (VAMG_enemyFactionBool) then {
			VAMG_enemyFaction pushback 9;
		};
		if (VAMG_enemyClassBool) then {
			VAMG_enemyClass pushback 9;
		};
	}"];
};

// ------------------------------------------------------------------ //
