/*
from:	VAVS_init.sqf 
to:		voiceActivatedVehicleSpawner\VAVS_keyDowns.sqf
to:		voiceActivatedVehicleSpawner\VAVS_keyDownMonitor.sqf
to: 	voiceActivatedVehicleSpawner\VAVS_RSCnums\VAVS_initDisplay.sqf

purpose:	
declares arrays and states for the module 
creates initial keydownEH to trigger the module, then removes this initial trigger after being actioned
starts off the module-specific listener that determines what happens on each key press 
also starts off the monitor to loop-listen for changes and move states at key points in the data entry flow
also kicks off the display script (UI) 
vamp is a universal bool that is used to ensure that only one module can be run at any one time  
*/

// systemChat "initialise vavs";

// ------------------------------------------------------------------ //

// voice spawner initiated  
VAVS_numericalInputbool		= false; 	

// choose type of vehicle - heli or car
VAVS_vicType 				= []; // 1 = car, 2 = heli
VAVS_vicTypeBool 			= false;

// choose type of car  
VAVS_carType 				= []; // 1 = IFV, 2 = MRAP, 3 = LSV, 4 = MTB, 5 = HEMTT, 6 = Other, 7 = RHS, 8 = Custom
VAVS_carTypeBool 			= false;

VAVS_IFV_Type				= []; // 1 = Panther, 2 = Cheetah, 3 = Bobcat, 4 = Marshall, 5 = Gorgon
VAVS_IFV_TypeBool			= false;

VAVS_MRAP_Type				= []; // 1 = Hunter, 2 = Hunter GMG, 3 = Hunter HMG 
VAVS_MRAP_Type_Bool			= false;

VAVS_LSV_Type				= []; // 1 = Prowler, 2 = Prowler Light, 3 = Prowler HMG, 4 = Prowler AT 
VAVS_LSV_Type_Bool			= false;

VAVS_MBT_Type				= []; // 1 = Slammer, 2 = Slammer UP, 3 = Scorcher, 4 = Sandstorm 
VAVS_MBT_Type_Bool			= false;

VAVS_HEMTT_Type				= []; // 1 = Basic, 2 = Box Transport, 3 = Trans Covered, 4 = Trans Open, 5 = Repair, 6 = Ammo, 7 = Fuel, 8 = Medical
VAVS_HEMTT_Type_Bool		= false;

VAVS_Other_Type				= []; // 1 = Quad Bike, 2 = Offroad HMG, 3 = Offroad AT, 4 = Offroad Repair, 5 = Offroad
VAVS_Other_Type_Bool		= false;

// choose camo type 
VAVS_Basic_Camo				= []; // 1 = Altis, 2 = Tanoa 
VAVS_Basic_Camo_Bool		= false;

VAVS_Ext_Camo				= []; // 1 = Altis, 2 = Tanoa, 3 = Altis Black, 4 = Tanoa Black, 5 = Altis Olive, 6 = Tanoa Olive, 7 = Altis Sand, 8 = Tanoa Sand, 9 = CRTG
VAVS_Ext_Camo_Bool			= false;

/*
TO BE DONE!

// choose type of heli
VAVS_heliType 				= []; // 1 = MH6, 2 = AH6, 3 = Blackhawk, 4 = Chinook etc
VAVS_heliTypeBool 			= false;

*/

// Confirm number of units requested
VAVS_No_Of_Units			= []; // 1 = 1, 2 = 2, 3 = 3, 4 = 4, 5 = 5
VAVS_No_Of_Units_Bool		= false;

// final confirmation 
VAVS_confirm 				= []; // 1 = yes, 2 = no
VAVS_confirmBool			= false;

// ------------------------------------------------------------------ //

// key = "numpad 2 = ??"
RGG_VAVS_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == ??) then {
	
	vamp = true;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',RGG_VAVS_Activate];
	VAVS_numericalInputbool = true; 
	VAVS_vicTypeBool = true;
	execVM 'voiceActivatedVehicleSpawner\VAVS_keyDowns.sqf'; 
	execVM 'voiceActivatedVehicleSpawner\VAUS_keyDownMonitor.sqf'; 

	systemChat 'please select 1 to generate a car, or select 2 for a heli';
	
}"];

// ------------------------------------------------------------------ //
