/*
from:	VAA_init.sqf
to:		voiceActivatedArty\keyDowns.sqf
to:		voiceActivatedArty\keyDownMonitor.sqf

purpose:
declares arrays and states for the module 
creates initial keydownEH to trigger the module, then removes this initial trigger after being actioned
starts off the module-specific listener that determines what happens on each key press 
also starts off the monitor to loop-listen for changes and move states at key points in the data entry flow
vamp is a universal bool that is used to ensure that only one module can be run at any one time  

notes:
*/

// vars and arrays initialisation
splashArtyTypeHE		= [];
splashArtyTypeSU		= [];
splashArtyTypeSM		= [];
splashArtyTypeFL		= [];
splashOrdColour			= [];
splashCoordsLat		 	= [];
splashCoordsLon 		= [];
splashRounds 			= [];
splashRadius 			= [];
splashConfirm			= [];		// entry in this array indicates good to fire
numericalInputBool 		= false; 	// this is a general bool to handle keyDown EHs
artyTypeBool 			= false;	// first entry to confirm type
ordColourBool 			= false;
latCoordInputBool 		= false; 		  
lonCoordInputBool 		= false; 		  
roundsInputBool 		= false; 		 
radiusInputBool 		= false; 		 
confirmActionBool 		= false; 

// key = "4"
rgg_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 75)) then {

	vamp = true;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_Activate];
	systemChat 'VAA Activated - Please confirm type';
	systemChat '1 = HE, 2 = SURGICAL, 3 = SMOKE, 4 = FLARES';
	playSound 'dangerClose1';
	artyTypeBool = true;
	numericalInputbool = true; 
	execVM 'voiceActivatedArty\keyDowns.sqf'; 
	execVM 'voiceActivatedArty\keyDownMonitor.sqf'; 

}"];

