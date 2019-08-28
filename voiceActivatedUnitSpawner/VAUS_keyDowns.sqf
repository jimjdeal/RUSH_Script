/*
from:	voiceActivatedUnitSpawner\initialiseVAUS.sqf
to:		voiceActivatedUnitSpawner\VAUS_initDisplay.sqf 			

purpose:
listens to numpad keypresses, and sends respective values (numpad nums) into arrays 
the array the data is pushed into is dependent on the current state (bool) - this is managed by the monitor 
also kicks off the display UI

Notes:
Build cancel button!
*/

// ------------------------------------------------------------------ //

if (VAUS_numericalInputbool) then {

	// rgg_vaus_cnl = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 181) then {
	
	// 	systemChat 'VAUS ABORTED';
	// 	execVM 'voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf'; 
	// 	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown', rgg_vaus_cnl];
	// 	VAUS_numericalInputbool = false;
	// 	execVM 'voiceActivatedUnitSpawner\VAUS_Init.sqf';

	// }"];

	execVM 'voiceActivatedUnitSpawner\VAUS_initDisplay.sqf';

	rgg_vaus_kd0 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 82) then {

		systemChat 'VAUS 0';

		if (VAUS_groupBool) then {
			VAUS_group pushback 0;
		};
		if (VAUS_camoBool) then {
			VAUS_camo pushback 0;
		};

	}"];
	
	rgg_vaus_kd1 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 79) then {

		systemChat 'VAUS 1';

		if (VAUS_controlBool) then {
			VAUS_control pushback 1;
		};
		if (VAUS_groupBool) then {
			VAUS_group pushback 1;
		};
		if (VAUS_camoBool) then {
			VAUS_camo pushback 1;
		};
		if (VAUS_confirmBool) then {
			VAUS_confirm pushback 1;
		};
	}"];

	rgg_vaus_kd2 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 80) then {
			
		if (VAUS_controlBool) then {
			VAUS_control pushback 2;
		};
		if (VAUS_groupBool) then {
			VAUS_group pushback 2;
		};
		if (VAUS_camoBool) then {
			VAUS_camo pushback 2;
		};
		if (VAUS_confirmBool) then {
			VAUS_confirm pushback 2;
		};
	}"];

	rgg_vaus_kd3 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 81) then {
			
		if (VAUS_groupBool) then {
			VAUS_group pushback 3;
		};
		if (VAUS_camoBool) then {
			VAUS_camo pushback 3;
		};
	}"];

	rgg_vaus_kd4 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 75) then {
		
		if (VAUS_groupBool) then {
			VAUS_group pushback 4;
		};
		if (VAUS_camoBool) then {
			VAUS_camo pushback 4;
		};
	}"];

	rgg_vaus_kd5 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 76) then {
			
		if (VAUS_groupBool) then {
			VAUS_group pushback 5;
		};
		if (VAUS_camoBool) then {
			VAUS_camo pushback 5;
		};
	}"];

	rgg_vaus_kd6 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 77) then {
			
		if (VAUS_groupBool) then {
			VAUS_group pushback 6;
		};
		if (VAUS_camoBool) then {
			VAUS_camo pushback 6;
		};
	}"];

	rgg_vaus_kd7 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 71) then {
			
		if (VAUS_groupBool) then {
			VAUS_group pushback 7;
		};
		if (VAUS_camoBool) then {
			VAUS_camo pushback 7;
		};
	}"];

	rgg_vaus_kd8 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 72) then {
			
		if (VAUS_groupBool) then {
			VAUS_group pushback 8;
		};
		if (VAUS_camoBool) then {
			VAUS_camo pushback 8;
		};
	}"];

	rgg_vaus_kd9 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 73) then {
			
		if (VAUS_groupBool) then {
			VAUS_group pushback 9;
		};
		if (VAUS_camoBool) then {
			VAUS_camo pushback 9;
		};
	}"];
};
		
// ------------------------------------------------------------------ //
