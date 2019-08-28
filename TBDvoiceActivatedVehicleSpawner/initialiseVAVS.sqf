
systemChat "initialise vavs";

// VAVS - Voice Activated Vehicle Spawner //

/*
from:	VAVS_init.sqf 
to:		voiceActivatedVehicleSpawner\VAVS_keyDowns.sqf
to:		voiceActivatedVehicleSpawner\VAVS_keyDownMonitor.sqf
to: 	voiceActivatedVehicleSpawner\VAVS_RSCnums\VAVS_initDisplay.sqf
*/


// ------------------------------------------------------------------ //

// voice spawner initiated  
VAVS_numericalInputbool		= false; 	

// choose type of vehicle - heli or car
VAVS_vicType 				= []; // 1 = car, 2 = heli
VAVS_vicTypeBool 			= false;

// choose type of car  
VAVS_carType 				= []; // 1 = HEMMT, 2 = Hunter, 3 = tank etc
VAVS_carTypeBool 			= false;

// choose type of heli
VAVS_heliType 				= []; // 1 = MH6, 2 = AH6, 3 = Blackhawk, 4 = Chinook etc
VAVS_heliTypeBool 			= false;

// choose colour
VAVS_colour 				= []; // 1 = MH6, 2 = AH6, 3 = Blackhawk, 4 = Chinook etc
VAVS_colourBool 			= false;

// final confirmation 
VAVS_confirm 				= []; // 1 = yes, 2 = no
VAVS_confirmBool			= false;

// ------------------------------------------------------------------ //

// key = "numpad 2 = ??"
RGG_VAVS_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == ??) then {
	
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',RGG_VAVS_Activate];
	systemChat 'VAVS Activated';
	systemChat 'Question 1 - please select 1 to generate a car, or select 2 for a heli';
	VAVS_numericalInputbool = true; 
	VAVS_vicTypeBool = true;
	systemChat 'VAVS_keyDowns running';
	execVM 'voiceActivatedVehicleSpawner\VAVS_keyDowns.sqf'; 
	systemChat 'VAVS_keyDownMonitor running';
	execVM 'voiceActivatedVehicleSpawner\VAUS_keyDownMonitor.sqf'; 
	
}"];

// ------------------------------------------------------------------ //
