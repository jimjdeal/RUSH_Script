/*
from:	voiceActivatedVehicleSpawner\initialiseVAVS.sqf
to:		voiceActivatedVehicleSpawner\VAVS_initDisplay.sqf 			

purpose:
listens to numpad keypresses, and sends respective values (numpad nums) into arrays 
the array the data is pushed into is dependent on the current state (bool) - this is managed by the monitor 
also kicks off the display UI

Notes:
Build cancel button!
*/

// ------------------------------------------------------------------ //
// BG 
09 cutRsc ["B18_BG","PLAIN"]; // bg 
_display = uiNameSpace getVariable "B18_BG";
_setText = _display displayCtrl 18020;
_setText ctrlSetBackgroundColor [0,0,0,0.6]; 

10 cutRsc ["D_L1_1","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "D_L1_1")};
_display = uiNameSpace getVariable "D_L1_1";
_setText = _display displayCtrl 20000;
_setText ctrlSetStructuredText (parseText format ["VOICE ACTIVATED VEHICLE SPAWNER"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 1];
sleep .5;
20 cutRsc ["D_L2_1","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "D_L2_1")};
_display = uiNameSpace getVariable "D_L2_1";
_setText = _display displayCtrl 20010;
_setText ctrlSetStructuredText (parseText format ["CONTROL TYPE"]);
// _setText ctrlSetStructuredText (parseText format ["IFV  MRAP  LSV  MTB  HEMTT  Other"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 1];
sleep .5;

//
if (VAVS_numericalInputbool) then {

	// rgg_vaus_cnl = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 181) then {
	
	// 	systemChat 'VAUS ABORTED';
	// 	execVM 'voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf'; 
	// 	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown', rgg_vaus_cnl];
	// 	VAUS_numericalInputbool = false;
	// 	execVM 'voiceActivatedUnitSpawner\VAUS_Init.sqf';

	// }"];

	execVM 'voiceActivatedVehicleSpawner\VAVS_initDisplay.sqf';

	rgg_vavs_kd0 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 82) then {

		systemChat 'you pressed tha zeroooo';
		
	}"];
	
	rgg_vavs_kd1 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 79) then {

		if (VAVS_vicTypeBool) then {
			VAVS_vicType pushback 1;
		};

		if (VAVS_HC_Group_Bool) then {
			VAVS_HC_Group pushback 1;
		};

		if (VAVS_carTypeBool) then {
			VAVS_carType pushback 1;
		};

		if (VAVS_IFV_TypeBool) then {
			VAVS_IFV_Type pushback 1;
		};

		if (VAVS_MRAP_Type_Bool) then {
			VAVS_MRAP_Type pushback 1;
		};

		if (VAVS_LSV_Type_Bool) then {
			VAVS_LSV_Type pushback 1;
		};

		if (VAVS_MBT_Type_Bool) then {
			VAVS_MBT_Type pushback 1;
		};

		if (VAVS_HEMTT_Type_Bool) then {
			VAVS_HEMTT_Type pushback 1;
		};

		if (VAVS_Other_Type_Bool) then {
			VAVS_Other_Type pushback 1;
		};

		if (VAVS_Basic_Camo_Bool) then {
			VAVS_Basic_Camo pushback 1;
		};

		if (VAVS_Ext_Camo_Bool) then {
			VAVS_Ext_Camo pushback 1;
		};

		if (VAVS_No_Of_Units_Bool) then {
			VAVS_No_Of_Units pushback 1;
		};

		if (VAVS_confirmBool) then {
			VAVS_confirm pushback 1;
		};

	}"];

	rgg_vavs_kd2 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 80) then {

		if (VAVS_vicTypeBool) then {
			VAVS_vicType pushback 2;
		};

		if (VAVS_HC_Group_Bool) then {
			VAVS_HC_Group pushback 2;
		};

		if (VAVS_carTypeBool) then {
			VAVS_carType pushback 2;
		};

		if (VAVS_IFV_TypeBool) then {
			VAVS_IFV_Type pushback 2;
		};

		if (VAVS_MRAP_Type_Bool) then {
			VAVS_MRAP_Type pushback 2;
		};

		if (VAVS_LSV_Type_Bool) then {
			VAVS_LSV_Type pushback 2;
		};

		if (VAVS_MBT_Type_Bool) then {
			VAVS_MBT_Type pushback 2;
		};

		if (VAVS_HEMTT_Type_Bool) then {
			VAVS_HEMTT_Type pushback 2;
		};

		if (VAVS_Other_Type_Bool) then {
			VAVS_Other_Type pushback 2;
		};

		if (VAVS_Basic_Camo_Bool) then {
			VAVS_Basic_Camo pushback 2;
		};

		if (VAVS_Ext_Camo_Bool) then {
			VAVS_Ext_Camo pushback 2;
		};

		if (VAVS_No_Of_Units_Bool) then {
			VAVS_No_Of_Units pushback 2;
		};

		if (VAVS_confirmBool) then {
			VAVS_confirm pushback 2;
		};
	}"];

	rgg_vavs_kd3 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 81) then {

		if (VAVS_carTypeBool) then {
			VAVS_carType pushback 3;
		};

		if (VAVS_HC_Group_Bool) then {
			VAVS_HC_Group pushback 3;
		};

		if (VAVS_IFV_TypeBool) then {
			VAVS_IFV_Type pushback 3;
		};

		if (VAVS_MRAP_Type_Bool) then {
			VAVS_MRAP_Type pushback 3;
		};

		if (VAVS_LSV_Type_Bool) then {
			VAVS_LSV_Type pushback 3;
		};

		if (VAVS_MBT_Type_Bool) then {
			VAVS_MBT_Type pushback 3;
		};

		if (VAVS_HEMTT_Type_Bool) then {
			VAVS_HEMTT_Type pushback 3;
		};

		if (VAVS_Other_Type_Bool) then {
			VAVS_Other_Type pushback 3;
		};

		if (VAVS_Ext_Camo_Bool) then {
			VAVS_Ext_Camo pushback 3;
		};

		if (VAVS_No_Of_Units_Bool) then {
			VAVS_No_Of_Units pushback 3;
		};
	}"];

	rgg_vavs_kd4 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 75) then {

		if (VAVS_carTypeBool) then {
			VAVS_carType pushback 4;
		};

		if (VAVS_IFV_TypeBool) then {
			VAVS_IFV_Type pushback 4;
		};

		if (VAVS_HC_Group_Bool) then {
			VAVS_HC_Group pushback 4;
		};

		if (VAVS_LSV_Type_Bool) then {
			VAVS_LSV_Type pushback 4;
		};

		if (VAVS_MBT_Type_Bool) then {
			VAVS_MBT_Type pushback 4;
		};

		if (VAVS_HEMTT_Type_Bool) then {
			VAVS_HEMTT_Type pushback 4;
		};

		if (VAVS_Other_Type_Bool) then {
			VAVS_Other_Type pushback 4;
		};

		if (VAVS_Ext_Camo_Bool) then {
			VAVS_Ext_Camo pushback 4;
		};

		if (VAVS_No_Of_Units_Bool) then {
			VAVS_No_Of_Units pushback 4;
		};
	}"];

	rgg_vavs_kd5 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 76) then {

		if (VAVS_carTypeBool) then {
			VAVS_carType pushback 5;
		};

		if (VAVS_HC_Group_Bool) then {
			VAVS_HC_Group pushback 5;
		};

		if (VAVS_IFV_TypeBool) then {
			VAVS_IFV_Type pushback 5;
		};

		if (VAVS_HEMTT_Type_Bool) then {
			VAVS_HEMTT_Type pushback 5;
		};

		if (VAVS_Other_Type_Bool) then {
			VAVS_Other_Type pushback 5;
		};

		if (VAVS_Ext_Camo_Bool) then {
			VAVS_Ext_Camo pushback 5;
		};

		if (VAVS_No_Of_Units_Bool) then {
			VAVS_No_Of_Units pushback 5;
		};
	}"];

	rgg_vavs_kd6 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 77) then {

		if (VAVS_carTypeBool) then {
			VAVS_carType pushback 6;
		};

		if (VAVS_HEMTT_Type_Bool) then {
			VAVS_HEMTT_Type pushback 6;
		};

		if (VAVS_Ext_Camo_Bool) then {
			VAVS_Ext_Camo pushback 6;
		};
	}"];

	rgg_vavs_kd7 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 71) then {
			
		if (VAVS_HEMTT_Type_Bool) then {
			VAVS_HEMTT_Type pushback 7;
		};

		if (VAVS_Ext_Camo_Bool) then {
			VAVS_Ext_Camo pushback 7;
		};
	}"];

	rgg_vavs_kd8 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 72) then {
			
		if (VAVS_HEMTT_Type_Bool) then {
			VAVS_HEMTT_Type pushback 8;
		};

		if (VAVS_Ext_Camo_Bool) then {
			VAVS_Ext_Camo pushback 8;
		};
	}"];

	rgg_vavs_kd9 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 73) then {
			
		if (VAVS_Ext_Camo_Bool) then {
			VAVS_Ext_Camo pushback 9;
		};
	}"];
};

// ------------------------------------------------------------------ //
