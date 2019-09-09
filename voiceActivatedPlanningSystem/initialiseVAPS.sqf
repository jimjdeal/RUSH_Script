/*
from:		voiceactivatedPlanningSystem\VAPS_init.sqf
to:			voiceactivatedPlanningSystem\VAPS_keyDowns.sqf
to: 		voiceactivatedPlanningSystem\VAPS_keyDownMonitor.sqf

purpose:
declares arrays and states for the module 
creates initial keydownEH to trigger the module, then removes this initial trigger after being actioned
starts off the module-specific listener that determines what happens on each key press 
also starts off the monitor to loop-listen for changes and move states at key points in the data entry flow
vamp is a universal bool that is used to ensure that only one module can be run at any one time  

notes:
*/
//
sleep 1; 
// systemChat "VAHCO ACTIVATED!!";

// vars and arrays initialisation
VAPS_numericalInputbool		= false; 

VAPS_Order_Type				= []; 		// 1 = set primary, 2 = set secondary, 3 = set route, 4 = set battle plan 
VAPS_Order_Type_Bool		= false;

// VAPS_Obj_Type				= [];		// manages both primary and secondary objectives  
// VAPS_Obj_Type_Bool			= false;

VAPS_mapClick				= false;	// exp mapclick solution

VAPS_Lat					= [];		// generic location system
VAPS_Lat_Bool				= false;

VAPS_Lon					= [];		// generic location system
VAPS_Lon_Bool				= false;

VAPS_Confirm				= [];		// generic confirm system
VAPS_Confirm_Bool			= false;

// key = "numpad 2"
rgg_vaps_Activate = (findDisplay 12) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 80)) then {

	vamp = true;
	_ehRemove1 = (findDisplay 12) displayRemoveEventHandler ['keyDown',rgg_vaps_Activate];
	systemChat 'VAPS ACTIVATED';
	systemChat 'Select Obj Type';
	systemChat 'press 1 for Primary, 2 for Secondary';
	VAPS_numericalInputbool = true; 
	VAPS_Order_Type_Bool = true;
	execVM 'voiceactivatedPlanningSystem\VAPS_keyDowns.sqf'; 
	execVM 'voiceactivatedPlanningSystem\VAPS_keyDownMonitor.sqf'; 

}"];

