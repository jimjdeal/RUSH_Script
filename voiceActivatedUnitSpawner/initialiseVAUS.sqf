
systemChat "initialise vaus";

// VAUS - Voice Activated Unit Spawner //

/*
from:	VAUS_init.sqf 
to:		voiceActivatedUnitSpawner\VAUS_keyDowns.sqf
to:		voiceActivatedUnitSpawner\VAUS_keyDownMonitor.sqf
to: 	voiceActivatedUnitSpawner\VAUS_RSCnums\VAUS_initDisplay.sqf
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

// choose type of squad 
VAUS_group 					= []; // 1 = fire team, 2 = full platoon, 3 = sniper team, 4 = AA team, 5 = AT team, 6 = ENG team, 7 = Demo team, 8 = Medic team
VAUS_groupBool 				= false;

// final confirmation 
VAUS_confirm 				= []; // 1 = yes, 2 = no
VAUS_confirmBool			= false;




// ------------------------------------------------------------------ //

// key = "numpad 1 = 79"
RGG_VAUS_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 79)) then {
	
	vamp = true;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',RGG_VAUS_Activate];
	systemChat 'VAUS Activated';
	systemChat 'Question 1 - please select 1 to generate direct control units, or select 2 for HC units';
	VAUS_numericalInputbool = true; 
	VAUS_controlBool = true;
	systemChat 'VAUS_keyDowns running';
	execVM 'voiceActivatedUnitSpawner\VAUS_keyDowns.sqf'; 
	systemChat 'VAUS_keyDownMonitor running';
	execVM 'voiceActivatedUnitSpawner\VAUS_keyDownMonitor.sqf'; 
	

}"];

// ------------------------------------------------------------------ //
