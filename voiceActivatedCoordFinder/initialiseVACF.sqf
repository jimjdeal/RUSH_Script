
// vars and arrays initialisation
VACF_Heading			= [];
VACF_Distance			= [];
VACF_ConfirmedCoords	= [];		
VACF_numericalInputbool	= false; 	
VACF_headingBool		= false;
VACF_distanceBool		= false;
VACF_showCoords			= false;

// key = "numpad 3"
rgg_vacf_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 81)) then {
	
	vamp = true;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_vacf_Activate];
	systemChat 'VACF Activated - Please confirm heading';
	VACF_headingBool = true;
	VACF_numericalInputbool = true; 
	execVM 'voiceActivatedCoordFinder\VACF_keyDowns.sqf'; 
	execVM 'voiceActivatedCoordFinder\VACF_keyDownMonitor.sqf'; 
	
}"];

