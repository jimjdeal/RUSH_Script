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
another idea - have vanilla as hardcoded, have RHS as included also, but can be changed, 
and then have another slot for user-config.
for now, just have everything to suit your own self
AAAND 
get lookDir so units are spawned near to player, but in direction youre looking 
find old appear out of smoke script?
*/


// ------------------------------------------------------------------ //

// execVM 'voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf';
// could this happen now, or better to do later?

// this manages the parsing of arrays from previous script into this script 
_controlType 	= _this select 0;
_groupType 		= _this select 1;
_camoType 		= _this select 2;

// this manages the extraction of values from the above arrays 
_control 		= _controlType select 0;
_group 			= _groupType select 0;
_camo 			= _camoType select 0;

// DC Group Creation 
if (_control == 1) then {

	if (_group == 1) then {

		if (_camo == 1) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};

		if (_camo == 2) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};		

		if (_camo == 3) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};	
	};

	if (_group == 2) then {

		if (_camo == 1) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};

		if (_camo == 2) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};		

		if (_camo == 3) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};	
	};

	if (_group == 3) then {

		if (_camo == 1) then {

			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};

		if (_camo == 2) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};		

		if (_camo == 3) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};	
	};

	if (_group == 4) then {

		if (_camo == 1) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};

		if (_camo == 2) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};		

		if (_camo == 3) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};	
	};

	if (_group == 5) then {

		if (_camo == 1) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};

		if (_camo == 2) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};		

		if (_camo == 3) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};	
	};

	if (_group == 6) then {

		if (_camo == 1) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};

		if (_camo == 2) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};		

		if (_camo == 3) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};	
	};

	if (_group == 7) then {

		if (_camo == 1) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};

		if (_camo == 2) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};		

		if (_camo == 3) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};	
	};

	if (_group == 8) then {

		if (_camo == 1) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};

		if (_camo == 2) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};		

		if (_camo == 3) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};	
	};
};

// HC Group Creation 

if (_control == 2) then {

	// _activeGroups = count VAUS_activeGroups; 

	if (VAUS_activeGroups < 6) then {

		if (_camo == 1) then {
			for "_i" from 1 to 10 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu5]; 
				sleep 0.2;
			};
			VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		if (_camo == 2) then {
			for "_i" from 1 to 10 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu5]; 
				sleep 0.2;
			};
			VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		if (_camo == 3) then {
			for "_i" from 1 to 10 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu5]; 
				sleep 0.2;
			};
			VAUS_activeGroups = VAUS_activeGroups + 1;
		};
	};

	if (_activeGroups == 3) then {

		if (_camo == 1) then {
			for "_i" from 1 to 10 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu4]; 
				sleep 0.2;
			};
			VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		if (_camo == 2) then {
			for "_i" from 1 to 10 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu4]; 
				sleep 0.2;
			};
			VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		if (_camo == 3) then {
			for "_i" from 1 to 10 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu4]; 
				sleep 0.2;
			};
			VAUS_activeGroups = VAUS_activeGroups + 1;
		};
	};

	if (_activeGroups == 2) then {
		if (_camo == 1) then {
			for "_i" from 1 to 10 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu3]; 
				sleep 0.2;
			};
			VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		if (_camo == 2) then {
			for "_i" from 1 to 10 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu3]; 
				sleep 0.2;
			};
			VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		if (_camo == 3) then {
			for "_i" from 1 to 10 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu3]; 
				sleep 0.2;
			};
			VAUS_activeGroups = VAUS_activeGroups + 1;
		};
	};

	if (_activeGroups == 1) then {
		if (_camo == 1) then {
			for "_i" from 1 to 10 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu2]; 
				sleep 0.2;
			};
			VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		if (_camo == 2) then {
			for "_i" from 1 to 10 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu2]; 
				sleep 0.2;
			};
			VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		if (_camo == 3) then {
			for "_i" from 1 to 10 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu2]; 
				sleep 0.2;
			};
			VAUS_activeGroups = VAUS_activeGroups + 1;
		};
	};

	if (_activeGroups == 0) then {

		if (_camo == 1) then {
			for "_i" from 1 to 10 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu1]; 
				sleep 0.2;
			};
			VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		if (_camo == 2) then {
			for "_i" from 1 to 10 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu1]; 
				sleep 0.2;
			};
			VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		if (_camo == 3) then {
			for "_i" from 1 to 10 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, groupBlu1]; 
				sleep 0.2;
			};
			VAUS_activeGroups = VAUS_activeGroups + 1;
		};
	};
};

systemChat "all done!!!";
8 cutRsc ["VAUS_THANKS","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VAUS_THANKS")};
_display = uiNameSpace getVariable "VAUS_THANKS";
_setText = _display displayCtrl 10008;
_setText ctrlSetStructuredText (parseText format ["THANK YOU FOR USING VOICE ACTIVATED UNIT SPAWNER"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

sleep 2.5;

8 cutRsc ["default","PLAIN"];
execVM "voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf";
execVM "voiceActivatedUnitSpawner\initialiseVAUS.sqf";
