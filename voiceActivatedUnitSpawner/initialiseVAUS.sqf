/*
from:	VAUS_init.sqf 
to:		voiceActivatedUnitSpawner\VAUS_keyDowns.sqf
to:		voiceActivatedUnitSpawner\VAUS_keyDownMonitor.sqf

purpose:	
declares arrays and states for the module 
creates initial keydownEH to trigger the module, then removes this initial trigger after being actioned
starts off the module-specific listener that determines what happens on each key press 
also starts off the monitor to loop-listen for changes and move states at key points in the data entry flow
also kicks off the display script (UI) 
vamp is a universal bool that is used to ensure that only one module can be run at any one time  
*/


// ------------------------------------------------------------------ //

// voice spawner initiated  
VAUS_numericalInputbool		= false; 	

// choose direct control or high command 
VAUS_control 				= []; // 1 = direct (player) control, 2 = high command (non-direct control)
VAUS_controlBool 			= false;

// choose camo - vanilla, desert or woodland 
VAUS_camo 					= []; // 1 = standard vanilla, 2 = rhs desert, 3 = livonian woodland 
VAUS_camoBool 				= false;
// note ^^ this should be removed and replaced with 'user-defined' classes - why should 'I' code in camo types?? let the user decide!

// choose type of squad 
VAUS_group 					= []; // 1 = fire team, 2 = full platoon, 3 = sniper team, 4 = AA team, 5 = AT team, 6 = ENG team, 7 = Demo team, 8 = Medic team
VAUS_groupBool 				= false;
// again, these need to be user-defined, but I will set up a default grouping of vanilla assets instead of Livonian squaddies 

// final confirmation 
VAUS_confirm 				= []; // 1 = yes, 2 = no
VAUS_confirmBool			= false;


// ------------------------------------------------------------------ //

// key = "numpad 1 = 79"
RGG_VAUS_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 79)) then {

	vamp = true;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',RGG_VAUS_Activate];
	VAUS_numericalInputbool = true; 
	VAUS_controlBool = true;
	execVM 'voiceActivatedUnitSpawner\VAUS_keyDowns.sqf'; 
	execVM 'voiceActivatedUnitSpawner\VAUS_keyDownMonitor.sqf'; 	

}"];

// ------------------------------------------------------------------ //
