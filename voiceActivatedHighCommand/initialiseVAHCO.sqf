/*
from:
to:			voiceactivatedhighcommand\VAHCO_keyDowns.sqf
to: 		voiceactivatedhighcommand\VAHCO_keyDownMonitor.sqf

purpose:
declares arrays and states for the module 
creates initial keydownEH to trigger the module, then removes this initial trigger after being actioned
starts off the module-specific listener that determines what happens on each key press 
also starts off the monitor to loop-listen for changes and move states at key points in the data entry flow
vamp is a universal bool that is used to ensure that only one module can be run at any one time  

notes:
03 Sept:
added new array and bool - VAHCO_objectiveType/Bool - to enable management of different types of objective-based move orders 
1 = secure obj1, 2 = approach obj1, 3 = secure obj2, 4 = approach obj2, 5 = move to staging area 1, 6 = move to staging area 2
*/

sleep 2; 
// systemChat "VAHCO ACTIVATED!!";

// vars and arrays initialisation
VAHCO_numericalInputbool	= false; 

VAHCO_groupSelectBool		= false;
VAHCO_groupSelect			= [];		// value reflects which group you are addressing 

VAHCO_orderSelectBool		= false;
VAHCO_orderSelect			= [];		// 1 = general move order, 2 = objective-based move order, 3 = set formation

VAHCO_setFormationBool		= false;	
VAHCO_SetFormation			= [];		// 1 = Column, 2 = stag column, 3 = wedge, 4 = ech right, 5 = ech left, 6 = vee, 7 = line, 8 = file, 9 = diamond

VAHCO_objectiveTypeBool		= false;
VAHCO_objectiveType			= [];		// value reflects type of objective selected

VAHCO_distanceBool			= false;
VAHCO_Distance				= [];		// general move order - distance

VAHCO_headingBool			= false;
VAHCO_Heading				= [];		// general move order - heading 

VAHCO_OscarMikeBool			= false;	
VAHCO_OscarMike				= [];		// completion script 



// key = "numpad 2"
rgg_vahco_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 80)) then {

	vamp = true;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_vahco_Activate];
	systemChat 'VAHC ACTIVATED';
	systemChat 'Platoon Channel Open, which team do you need to speak to?';
	systemChat 'press 1 for group 1, 2 for group 2, or 9 for all groups';
	VAHCO_numericalInputbool = true; 
	VAHCO_groupSelectBool = true;
	execVM 'voiceactivatedhighcommand\VAHCO_keyDowns.sqf'; 
	execVM 'voiceactivatedhighcommand\VAHCO_keyDownMonitor.sqf'; 
}"];

