//to debug variables, and also to enable HUD display 

sleep 5;

while {true} do {

	99991 cutRsc ["DEBUG_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "DEBUG_1")};
	
	_display = uiNameSpace getVariable "DEBUG_1";
	_setText = _display displayCtrl 99991;
	_setText ctrlSetStructuredText (parseText format ["Active HC Group: %1 .. VAUS Active Groups: %2", RGG_Grp_Num, VAUS_activeGroups]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];

sleep 0.5;
};