/*
from: 	VAUS_keyDownMonitor.sqf
to:		voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf
to:		voiceActivatedUnitSpawner\initialiseVAUS.sqf

purpose:
this script actually does the 'creating' of units 
if you want to add your own group configs (arrays of units), this is the place.

notes:
use switch here maybe?
another idea - have vanilla as hardcoded, have RHS as included also, but can be changed, 
and then have another slot for user-config.
for now, just have everything to suit your own self
AAAND 
get lookDir so units are spawned near to player, but in direction youre looking 
find old appear out of smoke script?
create 15m circle around player?
use findSafePos...
?

03 Sept: if I put clearKeyDowns at the beginning, the UI won't wait on screen while units are spawner, which is nicer - test this!

04 sept: thinking that camo 2 could be user prefs?
we also need to store a library of classNames here somewhere
change demo to hazmat?
or do I have a complete liviona section?
I really need to re-do the UI here
*/


// ------------------------------------------------------------------ //

// execVM 'voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf';
// could this happen now, or better to do later?
// ... I think later, but leaving this question here for now, cos I'm not sure 

// this manages the parsing of arrays from previous script into this script 
_controlType 	= _this select 0;
_groupType 		= _this select 1;
_camoType 		= _this select 2;

// this manages the extraction of values from the above arrays 
_control 		= _controlType select 0;
_group 			= _groupType select 0;
_camo 			= _camoType select 0;

// I realise this is probably a shit way to do it, but hey, it works!

// DC - Direct Control - Group Creation 
if (_control == 1) then {

	execVM "voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf";
	execVM "voiceActivatedUnitSpawner\initialiseVAUS.sqf";
//
	if (_group == 1) then {
		// FIRE TEAM (x4)
		if (_camo == 1) then {
			"B_W_Soldier_TL_F" createUnit [position player, group player]; 
			sleep 0.2;
			"B_W_Soldier_F" createUnit [position player, group player]; 
			sleep 0.2;
			"B_W_Soldier_M_F" createUnit [position player, group player]; 
			sleep 0.2;
			"B_W_Soldier_AR_F" createUnit [position player, group player]; 
			sleep 0.2;
		};

		if (_camo == 2) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};		
	};

	if (_group == 2) then {
		// FULL PLATOON (x23)
		if (_camo == 1) then {
			for "_i" from 1 to 1 do { 
				"B_W_Soldier_TL_F" createUnit [position player, group player]; 
				sleep 0.2;
			};
			for "_i" from 1 to 4 do { 
				"B_W_Soldier_F" createUnit [position player, group player]; 
				sleep 0.2;
			};
			for "_i" from 1 to 2 do { 
				"B_W_Soldier_M_F" createUnit [position player, group player]; 
				sleep 0.2;
			};
			for "_i" from 1 to 4 do { 
				"B_W_Soldier_AR_F" createUnit [position player, group player]; 
				sleep 0.2;
			};
			for "_i" from 1 to 2 do { 
				"B_W_Soldier_GL_F" createUnit [position player, group player]; 
				sleep 0.2;
			};
			for "_i" from 1 to 4 do { 
				"B_W_MEDIC_F" createUnit [position player, group player]; 
				sleep 0.2;
			};
			for "_i" from 1 to 4 do { 
				"B_W_Soldier_AT_F" createUnit [position player, group player]; 
				sleep 0.2;
			};
			for "_i" from 1 to 2 do { 
				"B_W_Soldier_AA_F" createUnit [position player, group player]; 
				sleep 0.2;
			};
		};

		if (_camo == 2) then {
			// to be done!
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};		
	};

	if (_group == 3) then {
		// SNIPER TEAM
		if (_camo == 1) then {
			// to be done!
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};
			// to be done!
		if (_camo == 2) then {
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};		
	};

	if (_group == 4) then {
		// AT TEAM
		if (_camo == 1) then {
			for "_i" from 1 to 3 do { 
			"B_W_Soldier_AT_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};

		if (_camo == 2) then {
			// to be done
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};		
	};

	if (_group == 5) then {
		// AA TEAM
		if (_camo == 1) then {
			for "_i" from 1 to 3 do { 
			"B_W_Soldier_AA_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};

		if (_camo == 2) then {
			// to be done
			for "_i" from 1 to 4 do { 
			"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};		
	};

	if (_group == 6) then {
		// ENG TEAM - to be done
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
	};

	if (_group == 7) then {
		// DEMO TEAM - to be done
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
	};

	if (_group == 8) then {
		// MEDIC TEAM
		if (_camo == 1) then {
			for "_i" from 1 to 4 do { 
			"B_W_MEDIC_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};

		if (_camo == 2) then {
			// to be done
			for "_i" from 1 to 4 do { 
			"B_W_MEDIC_F" createUnit [position player, group player]; 
			sleep 0.2;
			};
		};		
	};
};

// HC - High Command - Group Creation 

if (_control == 2) then {

	// _activeGroups = count VAUS_activeGroups; 
	// this keeps groups to 5 max
	if (VAUS_activeGroups < 5) then {

		if (VAUS_activeGroups == 0) then {
			hc_grp = groupBlu1;
		};
		if (VAUS_activeGroups == 1) then {
			hc_grp = groupBlu2;
		};
		if (VAUS_activeGroups == 2) then {
			hc_grp = groupBlu3;
		};
		if (VAUS_activeGroups == 3) then {
			hc_grp = groupBlu4;
		};
		if (VAUS_activeGroups == 4) then {
			hc_grp = groupBlu5;
		};

		if (_group == 1) then {

			if (_camo == 1) then {
				for "_i" from 1 to 4 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, hc_grp]; 
				sleep 0.2;
				};
			};
			if (_camo == 2) then {
				for "_i" from 1 to 4 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, hc_grp]; 
				sleep 0.2;
				};
			};		

			// VAUS_activeGroups = VAUS_activeGroups +1;
		};

		if (_group == 2) then {

			if (_camo == 1) then {
				for "_i" from 1 to 1 do { 
					"B_W_Soldier_TL_F" createUnit [position player, hc_grp]; 
					sleep 0.2;
				};
				for "_i" from 1 to 8 do { 
					"B_W_Soldier_F" createUnit [position player, hc_grp]; 
					sleep 0.2;
				};
				for "_i" from 1 to 2 do { 
					"B_W_Soldier_M_F" createUnit [position player, hc_grp]; 
					sleep 0.2;
				};
				for "_i" from 1 to 4 do { 
					"B_W_Soldier_AR_F" createUnit [position player, hc_grp]; 
					sleep 0.2;
				};
				for "_i" from 1 to 2 do { 
					"B_W_Soldier_GL_F" createUnit [position player, hc_grp]; 
					sleep 0.2;
				};
				for "_i" from 1 to 4 do { 
					"B_W_MEDIC_F" createUnit [position player, hc_grp]; 
					sleep 0.2;
				};
				for "_i" from 1 to 4 do { 
					"B_W_Soldier_AT_F" createUnit [position player, hc_grp]; 
					sleep 0.2;
				};
				for "_i" from 1 to 2 do { 
					"B_W_Soldier_AA_F" createUnit [position player, hc_grp]; 
					sleep 0.2;
				};
			};
			if (_camo == 2) then {
				for "_i" from 1 to 4 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, hc_grp]; 
				sleep 0.2;
				};
			};		

			// VAUS_activeGroups = VAUS_activeGroups +1;
		};

		if (_group == 3) then {

			if (_camo == 1) then {
				for "_i" from 1 to 4 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, hc_grp]; 
				sleep 0.2;
				};
			};
			if (_camo == 2) then {
				for "_i" from 1 to 4 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, hc_grp]; 
				sleep 0.2;
				};
			};		

			// VAUS_activeGroups = VAUS_activeGroups +1;
		};

		if (_group == 4) then {

			if (_camo == 1) then {
				for "_i" from 1 to 4 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, hc_grp]; 
				sleep 0.2;
				};
			};
			if (_camo == 2) then {
				for "_i" from 1 to 4 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, hc_grp]; 
				sleep 0.2;
				};
			};		

			// VAUS_activeGroups = VAUS_activeGroups +1;
		};

		if (_group == 5) then {
		
			if (_camo == 1) then {
				for "_i" from 1 to 4 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, hc_grp]; 
				sleep 0.2;
				};
			};
			if (_camo == 2) then {
				for "_i" from 1 to 4 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, hc_grp]; 
				sleep 0.2;
				};
			};		

			// VAUS_activeGroups = VAUS_activeGroups +1;
		};

		if (_group == 6) then {
		
			if (_camo == 1) then {
				for "_i" from 1 to 4 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, hc_grp]; 
				sleep 0.2;
				};
			};
			if (_camo == 2) then {
				for "_i" from 1 to 4 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, hc_grp]; 
				sleep 0.2;
				};
			};		
			
			// VAUS_activeGroups = VAUS_activeGroups +1;
		};

		if (_group == 7) then {
			
			if (_camo == 1) then {
				for "_i" from 1 to 4 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, hc_grp]; 
				sleep 0.2;
				};
			};
			if (_camo == 2) then {
				for "_i" from 1 to 4 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, hc_grp]; 
				sleep 0.2;
				};
			};

			// VAUS_activeGroups = VAUS_activeGroups +1;
		};

		if (_group == 8) then {

			if (_camo == 1) then {
				for "_i" from 1 to 4 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, hc_grp]; 
				sleep 0.2;
				};
			};
			if (_camo == 2) then {
				for "_i" from 1 to 4 do { 
				"B_W_Soldier_CBRN_F" createUnit [position player, hc_grp]; 
				sleep 0.2;
				};
			};	

			// VAUS_activeGroups = VAUS_activeGroups +1;
		};

		// 02 Sept, trying to run this addition ONCE!! See if this works
		VAUS_activeGroups = VAUS_activeGroups +1;	

	} else {

		// i.e. there are 6 or more HC groups - so replace this with exitWith?
		if (VAUS_activeGroups == 5) then {
			hint "no more allowed - 5 max!!";

		};
	};

	// execVM "voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf";
	// execVM "voiceActivatedUnitSpawner\initialiseVAUS.sqf";

};
