// key = "numpad 6 = 77"
RGG_VAHO_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 77)) then {
	
	vamp = true;
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',RGG_VAHO_Activate];
	VAHO_numericalInputbool = true; 
	VAHO_vicTypeBool = true;
	execVM 'voiceActivatedHeliOps\VAHO_keyDowns.sqf'; 
	execVM 'voiceActivatedHeliOps\VAHO_keyDownMonitor.sqf'; 
	systemChat 'please select 1 to instruct nearest units to board, or select 2 to disembark units already on board';
	
}"];

// ------------------------------------------------------------------ //

very unfinished!!!!