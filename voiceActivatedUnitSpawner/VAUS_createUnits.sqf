// VAUS_createUnits //

// Creates units specified by player 

/*
from: 	
to:		
*/

/*
8 states and arrays: OLD!!!
VAUS_typeBool / VAUS_type
VAUS_controlBool / VAUS_control
VAUS_camoBool / VAUS_camo
VAUS_groupBool / VAUS_group
VAUS_crewedBool / VAUS_crewed
VAUS_vicTypeBool / VAUS_vicType
VAUS_carTypeBool / VAUS_carType
VAUS_heliTypeBool / VAUS_heliType
*/

/*
Notes:
use switch here maybe?
*/


// ------------------------------------------------------------------ //

// execVM 'voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf';

// _controlType 	= _this select 0;
// _groupType 		= _this select 1;
// _camoType 		= _this select 2;

// // DC Group Creation 
// if (_controlType == 1) then {

// 	if (_groupType == 1) then {
// 		for "_i" from 1 to 4 do { 
// 		"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
// 		sleep 0.2;
// 		};
// 	};
// 	if (_groupType == 2) then {
// 		for "_i" from 1 to 20 do { 
// 		"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
// 		sleep 0.2;
// 		};
// 	};
// 	if (_groupType == 3) then {
// 		for "_i" from 1 to 5 do { 
// 		"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
// 		sleep 0.2;
// 		};
// 	};
// 	if (_groupType == 4) then {
// 		for "_i" from 1 to 5 do { 
// 		"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
// 		sleep 0.2;
// 		};
// 	};
// 	if (_groupType == 5) then {
// 		for "_i" from 1 to 5 do { 
// 		"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
// 		sleep 0.2;
// 		};
// 	};
// 	if (_groupType == 6) then {
// 		for "_i" from 1 to 5 do { 
// 		"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
// 		sleep 0.2;
// 		};
// 	};
// 	if (_groupType == 7) then {
// 		for "_i" from 1 to 5 do { 
// 		"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
// 		sleep 0.2;
// 		};
// 	};
// 	if (_groupType == 8) then {
// 		for "_i" from 1 to 5 do { 
// 		"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
// 		sleep 0.2;
// 		};
// 	};
	
// };

// HC Group Creation 

// if (_controlType == 2) then {

// 	if (VAUS_activeGroups == 4) then {
// 		for "_i" from 1 to 10 do { 
// 			"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu5]; 
// 			sleep 0.2;
// 		};
// 	};
// 	if (VAUS_activeGroups == 3) then {
// 		for "_i" from 1 to 10 do { 
// 			"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu4]; 
// 			sleep 0.2;
// 		};
// 	};
// 	if (VAUS_activeGroups == 2) then {
// 		for "_i" from 1 to 10 do { 
// 			"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu3]; 
// 			sleep 0.2;
// 		};
// 	};
// 	if (VAUS_activeGroups == 1) then {
// 		for "_i" from 1 to 10 do { 
// 			"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu2]; 
// 			sleep 0.2;
// 		};
// 	};
// 	if (VAUS_activeGroups == 0) then {
// 		for "_i" from 1 to 10 do { 
// 			"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu1]; 
// 			sleep 0.2;
// 		};
// 	};

// };

// 8 cutRsc ["VAUS_THANKS","PLAIN"];
// waitUntil {!isNull (uiNameSpace getVariable "VAUS_THANKS")};
// _display = uiNameSpace getVariable "VAUS_THANKS";
// _setText = _display displayCtrl 10008;
// _setText ctrlSetStructuredText (parseText format ["THANK YOU FOR USING VOICE ACTIVATED UNIT SPAWNER"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];

// sleep 2;

// 8 cutRsc ["default","PLAIN"];


execVM "voiceActivatedUnitSpawner\initialiseVAAS.sqf";



