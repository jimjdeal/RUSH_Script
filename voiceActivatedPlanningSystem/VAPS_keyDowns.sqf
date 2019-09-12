/*
from:		voiceactivatedhighcommand\initialiseVAHCO	
to:			voiceactivatedhighcommand\TBC 		

purpose:
listens to numpad keypresses, and sends respective values (numpad nums) into arrays 
the array the data is pushed into is dependent on the current state (bool) - this is managed by the monitor 

notes:
need to add a cancel to this!

03 September:
consider having an action based on keypress and mouse pos ... would be easier but still use voice...??

VAPS_Order_Type				= []; 		// 1 = set primary, 2 = set secondary, 3 = staging 1, 4 = staging 2 // 5 = set waypoints. 6 = set battle plan 
VAPS_Order_Type_Bool		= false;

VAPS_Obj_Type				= [];		// manages both primary and secondary objectives // 1 = primary, 2 = secondary, 
VAPS_Obj_Type_Bool			= false;

VAPS_Lat					= [];		// generic location system // expects 5 digits
VAPS_Lat_Bool				= false;

VAPS_Lon					= [];		// generic location system // expects 5 digits
VAPS_Lon_Bool				= false;

VAPS_Confirm				= [];		// generic confirm system // 1 = confirm, 2 = cancel
VAPS_Confirm_Bool			= false;

10 sept:

Now has cancel - untested 

Removed rgg_vaps_kd0, as not in use - test for breaks 

added route functionality - test 

removed lat and lon as not in use - test 

*/

if (VAPS_numericalInputbool) then {

	rgg_vaps_cnl = (findDisplay 12) displayAddEventHandler ["KeyDown", "if (_this select 1 == 181) then {
		
		systemChat 'VAPS SYSTEM ABORTED';
		execVM 'voiceActivatedPlanningSystem\VAPS_clearKeyDowns.sqf'; 
		_ehRemove1 = (findDisplay 12) displayRemoveEventHandler ['keyDown', rgg_vaps_cnl];
		VAPS_numericalInputbool = false;
		execVM 'voiceActivatedPlanningSystem\VAPS_Init.sqf';

	}"];

/*
expermiment - instead of calling a new title script for the UI, I am going to try to just include it here - this only runs once, so should work
*/

	// 1 cutRsc ["C_L1_1","PLAIN"];
	// waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
	// _n1 = "...";
	// _display = uiNameSpace getVariable "C_L1_1";
	// _setText = _display displayCtrl 19001;
	// _setText ctrlSetStructuredText (parseText format ["VAHC: %1", _n1]);
	// _setText ctrlSetBackgroundColor [0,0,0,0.5];

	// rgg_vaps_kd0 = (findDisplay 12) displayAddEventHandler ["KeyDown", "if (_this select 1 == 82) then {
			
	// 	systemChat 'VAPS - 0';

	// 	if (VAPS_Lat_Bool) then {
	// 		VAPS_Lat pushback 0;
	// 	};

	// 	if (VAPS_Lon_Bool) then {
	// 		VAPS_Lon pushback 0;
	// 	};

	// }"];

	rgg_vaps_kd1 = (findDisplay 12) displayAddEventHandler ["KeyDown", "if (_this select 1 == 79) then {

		systemChat 'VAPS - 1';

		if (VAPS_Order_Type_Bool) then {
			VAPS_Order_Type pushback 1;
		};

		if (VAPS_RouteSelect_Bool) then {
			VAPS_RouteSelect pushback 1;
		};

		if (VAPS_Confirm_Bool) then {
			VAPS_Confirm pushback 1;
		};
		
	}"];

	rgg_vaps_kd2 = (findDisplay 12) displayAddEventHandler ["KeyDown", "if (_this select 1 == 80) then {
			
		systemChat 'VAPS - 2';

		if (VAPS_Order_Type_Bool) then {
			VAPS_Order_Type pushback 2;
		};

		if (VAPS_RouteSelect_Bool) then {
			VAPS_RouteSelect pushback 2;
		};

		if (VAPS_Lat_Bool) then {
			VAPS_Lat pushback 2;
		};

		if (VAPS_Lon_Bool) then {
			VAPS_Lon pushback 2;
		};

		if (VAPS_Confirm_Bool) then {
			VAPS_Confirm pushback 2;
		};

	}"];

	rgg_vaps_kd3 = (findDisplay 12) displayAddEventHandler ["KeyDown", "if (_this select 1 == 81) then {
			
		systemChat 'VAPS - 3';
		
		if (VAPS_Order_Type_Bool) then {
			VAPS_Order_Type pushback 3;
		};

		if (VAPS_RouteSelect_Bool) then {
			VAPS_RouteSelect pushback 3;
		};

		if (VAPS_Lat_Bool) then {
			VAPS_Lat pushback 3;
		};

		if (VAPS_Lon_Bool) then {
			VAPS_Lon pushback 3;
		};

	}"];

	rgg_vaps_kd4 = (findDisplay 12) displayAddEventHandler ["KeyDown", "if (_this select 1 == 75) then {
		
		systemChat 'VAPS - 4';
		
		if (VAPS_Order_Type_Bool) then {
			VAPS_Order_Type pushback 4;
		};

		if (VAPS_RouteSelect_Bool) then {
			VAPS_RouteSelect pushback 4;
		};

		if (VAPS_Lat_Bool) then {
			VAPS_Lat pushback 4;
		};

		if (VAPS_Lon_Bool) then {
			VAPS_Lon pushback 4;
		};

	}"];

	rgg_vaps_kd5 = (findDisplay 12) displayAddEventHandler ["KeyDown", "if (_this select 1 == 76) then {
			
		systemChat 'VAPS - 5';

		if (VAPS_Order_Type_Bool) then {
			VAPS_Order_Type pushback 5;
		};

		if (VAPS_RouteSelect_Bool) then {
			VAPS_RouteSelect pushback 5;
		};

		if (VAPS_Lat_Bool) then {
			VAPS_Lat pushback 5;
		};

		if (VAPS_Lon_Bool) then {
			VAPS_Lon pushback 5;
		};
		
	}"];

	rgg_vaps_kd6 = (findDisplay 12) displayAddEventHandler ["KeyDown", "if (_this select 1 == 77) then {
			
		systemChat 'VAPS - 6';

		if (VAPS_Order_Type_Bool) then {
			VAPS_Order_Type pushback 6;
		};

		if (VAPS_Lat_Bool) then {
			VAPS_Lat pushback 6;
		};

		if (VAPS_Lon_Bool) then {
			VAPS_Lon pushback 6;
		};

	}"];

	rgg_vaps_kd7 = (findDisplay 12) displayAddEventHandler ["KeyDown", "if (_this select 1 == 71) then {
			
		systemChat 'VAPS - 7';

		if (VAPS_Order_Type_Bool) then {
			VAPS_Order_Type pushback 7;
		};

		if (VAPS_Lat_Bool) then {
			VAPS_Lat pushback 7;
		};

		if (VAPS_Lon_Bool) then {
			VAPS_Lon pushback 7;
		};
		
	}"];

	rgg_vaps_kd8 = (findDisplay 12) displayAddEventHandler ["KeyDown", "if (_this select 1 == 72) then {
			
		systemChat 'VAPS - 8';

		if (VAPS_Order_Type_Bool) then {
			VAPS_Order_Type pushback 8;
		};

		if (VAPS_Lat_Bool) then {
			VAPS_Lat pushback 8;
		};

		if (VAPS_Lon_Bool) then {
			VAPS_Lon pushback 8;
		};
		
	}"];

	rgg_vaps_kd9 = (findDisplay 12) displayAddEventHandler ["KeyDown", "if (_this select 1 == 73) then {
			
		systemChat 'VAPS - 9';

		if (VAPS_Order_Type_Bool) then {
			VAPS_Order_Type pushback 9;
		};

		if (VAPS_Lat_Bool) then {
			VAPS_Lat pushback 9;
		};

		if (VAPS_Lon_Bool) then {
			VAPS_Lon pushback 9;
		};

	}"];
};
		

