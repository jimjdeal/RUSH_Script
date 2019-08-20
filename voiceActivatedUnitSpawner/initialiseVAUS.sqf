
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

// key = "numpad ?"
RGG_VAUS_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == ??) then {
	
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',RGG_VAUS_Activate];
	systemChat 'VAUS Activated';
	systemChat 'Question 1 - please select 1 to generate direct control units, or select 2 for HC units';
	VAUS_numericalInputbool = true; 
	VAUS_controlBool = true;
	execVM 'voiceActivatedUnitSpawner\VAUS_keyDowns.sqf'; 
	execVM 'voiceActivatedUnitSpawner\VAUS_keyDownMonitor.sqf'; 
	execVM 'voiceActivatedUnitSpawner\VAUS_RSCnums\VAUS_initDisplay.sqf;

}"];

// ------------------------------------------------------------------ //




























// level Root1 				- choose units or vehicles 
// VAUS_type 					= []; // 1 = units (group) (2A), 2 = vehicles (2B) 
// VAUS_typeBool 				= false;

// // level B2 				- choose empty or crewed 
// VAUS_crewed 				= []; // 1 = empty, 2 = crewed 
// VAUS_crewedBool 			= false;

// // level B3 				- choose type of vehicle - heli or car 
// VAUS_vicType 				= []; // 1 = car, 2 = heli
// VAUS_vicTypeBool 			= false;

// // level BA4 				- choose type of car  
// VAUS_carType 				= []; // 1 = HEMMT, 2 = Hunter, 3 = tank 
// VAUS_carTypeBool 			= false;

// // level BB4 				- choose type of car  
// VAUS_heliType 				= []; // 1 = MH6, 2 = AH6, 3 = Blackhawk, 4 = Chinook
// VAUS_heliTypeBool 			= false;




















/*

cutRsc list options 

create something assigned to me "Create Group Element"
or 
create an HC element "Create High Command Element"
or
create an empty vehicle "Create Empty Vehicle"
or 
create a crewed vehicle "Create Crewed Vehicle"

ammo drops will be first attempt at flying shit in..

LEVEL 1			LEVEL 2	VAUS_Type		LEVEL 3			LEVEL 4			LEVEL 5					LEVEL 6 
Activate VAUS	create group element	direct control	Standard		Fire Team (x4)			CONFIRM
										high command	Woodland		Full Platoon (x20)
														Desert			Sniper Team (x2)  
																		AA Team (x2)
																		AT Team (x3)
																		Engineering Team (x3) 
																		Demolition Team (x3) 
																		Medic Group (x4)

				create vehicle 			empty			hemmt covered 
										crewed			hemmt open 
														blackhawk 
														etc 

disply all bt greyed out first then highlight as selected 
groups		direct control 		woodland	full platoon 	confirm  
			high command		


vehicles 	high command 


if "Create Group Element" then choose 
hand-pick team, or select pre-created group 
cutRSC list options 

if hand-picked group, then 
Keep talking until you have enough in your direct group 

if pre-created group, then 
cutRSC list of group options 




create single unit assigned to me   
create group assigned to me 
create HC group  



*/





// from copy 
// vars and arrays initialisation
VACF_Heading			= [];
VACF_Distance			= [];
VACF_ConfirmedCoords	= [];		
VACF_numericalInputbool	= false; 	
VACF_headingBool		= false;
VACF_distanceBool		= false;
VACF_showCoords			= false;

// key = "numpad *"
rgg_vacf_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 55) then {
	
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_vacf_Activate];
	systemChat 'VACF Activated - Please confirm heading';
	VACF_headingBool = true;
	VACF_numericalInputbool = true; 
	execVM 'voiceActivatedCoordFinder\VACF_keyDowns.sqf'; 
	execVM 'voiceActivatedCoordFinder\VACF_keyDownMonitor.sqf'; 
	
}"];