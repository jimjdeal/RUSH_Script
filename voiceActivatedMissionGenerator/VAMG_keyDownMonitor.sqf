/*
from:	voiceActivatedMissionGenerator\??.sqf
to:		voiceActivatedMissionGenerator\??.sqf
to:		voiceActivatedMissionGenerator\??.sqf
to: 	voiceActivatedMissionGenerator\??.sqf

purpose:
loop-listener that validates user input, and changes state at correct times 
when all entries have been made, the script will either progress to spawner, or cancel / reboot 

notes:
VAMG_conflictType 		= [];		// 4 options - infi, vic, air, mixed
VAMG_conflictTypeBool	= false;

VAMG_conflictSize		= [];		// 4 options -  S M L XL
VAMG_conflictSizeBool	= false;

VAMG_vicTypes			= []; 		// 5 options - confirmes types of spawned enemy vehicles
VAMG_vicTypesBool		= false;

VAMG_areaSize			= [];		// 4 options - immediate area, 1km 5km 10km
VAMG_areaSizeBool		= false;

VAMG_enemyPlacement		= []; 		// 2 options - clustered, distributed 
VAMG_enemyPlacementBool	= false;

VAMG_intel				= [];		// 4 options - how much assistance player has in finding the enemy
VAMG_intelBool			= false;

VAMG_enemyFaction		= [];		// 9 options - CSAT, VANILLA REBELS, RHS, PROJECT OPFOR
VAMG_enemyFactionBool	= false;

VAMG_enemyRF			= []; 		// 4 options - none, light once only, medium repeated twice, heavy repeated three times
VAMG_enemyRFBool		= false;

VAMG_conflictObj		= [];		// 2 options - Defend, attack, (observe & destroy, seek and destroy), get to the border 
VAMG_conflictObjBool	= false;

VAMG_confirm			= [];		// 2 options - create or cancel
VAMG_confirmBool		= false;
*/

// mission states 
MISSION_ATTACK = false;
MISSION_DEFEND = false;
MISSION_HUNT = false;
MISSION_RUN = false;


while {VAMG_numericalInputbool} do {

	_VAMG_val_conflictType 		= count VAMG_conflictType; 		
	_VAMG_val_conflictSize 		= count VAMG_conflictSize;		
	_VAMG_val_vicTypes 			= count VAMG_vicTypes;	
	_VAMG_val_areaSize 			= count VAMG_areaSize;		
	_VAMG_val_enemyPlacement 	= count VAMG_enemyPlacement;	
	_VAMG_val_intel 			= count VAMG_intel;			
	_VAMG_val_enemyFaction 		= count VAMG_enemyFaction;	
	_VAMG_val_enemyRF 			= count VAMG_enemyRF;	
	_VAMG_val_conflictObj 		= count VAMG_conflictObj;
	_VAMG_val_confirm 			= count VAMG_confirm;		

	if (VAMG_conflictTypeBool) then {
		if (_VAMG_val_conflictType == 1) then {
			_VAMG_data = VAMG_conflictType select 0;
			if (_VAMG_data == 1) then {
				systemChat "you selected infantry-based conflict";
				systemChat "now confirm size of conflict";
				systemChat "1 = Small, 2 = Medium, 3 = Large, 4 = X Large";
				VAMG_conflictTypeBool = false;
				VAMG_conflictSizeBool = true;
			};
			if (_VAMG_data == 2) then {
				systemChat "you selected vehicle-based conflict";
				systemChat "now confirm types of vehicles";
				systemChat "1 = Light Vehicles, 2 = Medium Vehicles, 3 = Heavy Vehicles, 4 = Random";
				VAMG_conflictTypeBool = false;
				VAMG_vicTypesBool = true;
			};
			if (_VAMG_data == 3) then {
				systemChat "you selected air-based conflict (TBD)";
				systemChat "now confirm size of conflict";
				systemChat "1 = Small, 2 = Medium, 3 = Large, 4 = X Large";
				VAMG_conflictTypeBool = false;
				VAMG_conflictSizeBool = true;
			};
			if (_VAMG_data == 4) then {
				systemChat "you selected mixed-element conflict (air TBD)";
				systemChat "now confirm size of conflict";
				systemChat "1 = Small, 2 = Medium, 3 = Large, 4 = X Large";
				VAMG_conflictTypeBool = false;
				VAMG_conflictSizeBool = true;
			};
		};
	};

	if (VAMG_vicTypesBool) then {
		if (_VAMG_val_vicTypes == 1) then {
			_VAMG_data = VAMG_vicTypes select 0;
			if (_VAMG_data == 1) then {
				systemChat "you selected light-vehicles such as LSVs and Technicals";

			};
			if (_VAMG_data == 2) then {
				systemChat "you selected medium-vehicles such as MRAPS and IFVs";

			};
			if (_VAMG_data == 3) then {
				systemChat "you selected heavy-vehicles such as MBTs";

			};
			if (_VAMG_data == 4) then {
				systemChat "you selected all types (randomised)";

			};
			systemChat "now confirm size of conflict";
			systemChat "1 = Small, 2 = Medium, 3 = Large, 4 = X Large";
			VAMG_vicTypesBool = false;
			VAMG_conflictSizeBool = true;
		};
	};

	if (VAMG_conflictSizeBool) then {
		if (_VAMG_val_conflictSize == 1) then {
			_VAMG_data = VAMG_conflictSize select 0;
			if (_VAMG_data == 1) then {
				systemChat "you selected small-scale conflict";

			};
			if (_VAMG_data == 2) then {
				systemChat "you selected medium-scale conflict";

			};
			if (_VAMG_data == 3) then {
				systemChat "you selected large-scale conflict";

			};
			if (_VAMG_data == 4) then {
				systemChat "you selected epic-scale conflict";

			};
			systemChat "now confirm size of AO";
			systemChat "1 = Small, 2 = Medium, 3 = Large, 4 = Extensive";
			VAMG_conflictTypeBool = false;
			VAMG_areaSizeBool = true;
		};
	};

	if (VAMG_areaSizeBool) then {
		if (_VAMG_val_areaSize == 1) then {
			_VAMG_data = VAMG_areaSize select 0;
			if (_VAMG_data == 1) then {
				systemChat "you selected Small Area (500m radius)";

			};
			if (_VAMG_data == 2) then {
				systemChat "you selected Medium Area (1500m radius)";

			};
			if (_VAMG_data == 3) then {
				systemChat "you selected Large Area (3000m radius)";

			};
			if (_VAMG_data == 4) then {
				systemChat "you selected Extensive Area (5000m radius)";

			};
			systemChat "now confirm where to place the enemy";
			systemChat "1 = cluster, 2 = everywhere";
			VAMG_areaSizeBool = false;
			VAMG_enemyPlacementBool = true;
		};
	};

	if (VAMG_enemyPlacementBool) then {
		if (_VAMG_val_enemyPlacement == 1) then {
			_VAMG_data = VAMG_enemyPlacement select 0;
			if (_VAMG_data == 1) then {
				systemChat "you selected to cluster the enemy in one area";

			};
			if (_VAMG_data == 2) then {
				systemChat "you selected to place the enemy randomly, across the battle area";

			};
			systemChat "now confirm how to receive intel";
			systemChat "1 = once, 2 = periodic, 3 = never";
			VAMG_areaSizeBool = false;
			VAMG_enemyPlacementBool = true;	
		};
	};

	// only works for placed / clustered enemy groups - random will skip
	if (VAMG_intelBool) then {
		if (_VAMG_val_intel == 1) then {
			_VAMG_data = VAMG_intel select 0;
			if (_VAMG_data == 1) then {
				systemChat "you selected to receive one initial notification of enemy location";

			};
			if (_VAMG_data == 2) then {
				systemChat "you selected to receive periodic notifications of enemy location";

			};
			if (_VAMG_data == 3) then {
				systemChat "you selected to receive no notifications of enemy location";

			};
			systemChat "now confirm enemy faction";
			systemChat "1 = CSAT, 2 = IDF, 3 = RHS GREF";
			systemChat "4 = tbc, 5 = tbc, 6 = tbc";
			systemChat "7 = tbc, 8 = tbc,";
			VAMG_intelBool = false;
			VAMG_enemyFaction = true;	
		};
	};

	if (VAMG_enemyFaction) then {
		if (_VAMG_val_enemyFaction == 1) then {
			_VAMG_data = VAMG_enemyFaction select 0;
			if (_VAMG_data == 1) then {
				systemChat "you selected CSAT";
			};
			if (_VAMG_data == 2) then {
				systemChat "you selected CSAT";

			};
			if (_VAMG_data == 3) then {
				systemChat "you selected CSAT";

			};
			if (_VAMG_data == 4) then {
				systemChat "you selected CSAT";

			};
			if (_VAMG_data == 5) then {
				systemChat "you selected CSAT";

			};
			if (_VAMG_data == 6) then {
				systemChat "you selected CSAT";

			};
			if (_VAMG_data == 7) then {
				systemChat "you selected CSAT";

			};
			if (_VAMG_data == 8) then {
				systemChat "you selected CSAT";

			};
			systemChat "now confirm levels of enemy reinforcements";
			systemChat "1 = no RF, 2 = single once, 3 = medium twice, 4 = heavy three times";
			VAMG_enemyFaction = false;
			VAMG_enemyRFBool = true;	
		};
	};

	if (VAMG_enemyRFBool) then {
		if (_VAMG_val_enemyRF == 1) then {
			_VAMG_data = VAMG_enemyRF select 0;
			if (_VAMG_data == 1) then {
				systemChat "you selected no enemy reinforcements";

			};
			if (_VAMG_data == 2) then {
				systemChat "you selected single light enemy reinforcements";

			};
			if (_VAMG_data == 3) then {
				systemChat "you selected two medium enemy reinforcements";

			};
			if (_VAMG_data == 4) then {
				systemChat "you selected three heavy enemy reinforcements";

			};
			systemChat "now select mission type";
			systemChat "1 = you attack them, 2 = they attack you, 3 = you escape, 4 = they escape";
			VAMG_enemyRFBool = false;
			VAMG_conflictObjBool = true;	
		};
	};

	if (VAMG_conflictObjBool) then {
		if (_VAMG_val_conflictObj == 1) then {
			_VAMG_data = VAMG_conflictObj select 0;
			if (_VAMG_data == 1) then {
				systemChat "you chose to attack the enemy";
				MISSION_ATTACK = true;
			};
			if (_VAMG_data == 2) then {
				systemChat "you chose to defend your position";
				MISSION_DEFEND = true;

			};
			if (_VAMG_data == 3) then {
				systemChat "you chose the 'Get to the border - you escape they hunt' game type";
				MISSION_HUNT = true;

			};
			if (_VAMG_data == 4) then {
				systemChat "you chose the 'Get to the border - they escape you hunt' game type";
				MISSION_RUN = true;
			};
			systemChat "confirm or cancel";
			VAMG_conflictObjBool = false;
			VAMG_confirmBool = true;
		};
	};

	if (VAMG_confirmBool) then {
		if (_VAMG_val_confirm == 1) then {
			_VAMG_data = VAMG_confirm select 0;
			if (_VAMG_data == 1) then {
				systemChat "Confirmed! - Have Fun";
				execVM "voiceActivatedMissionGenerator\combatGen.sqf";
			};
			if (_VAMG_data == 2) then {
				systemChat "Cancelled";
				execVM "voiceActivatedMissionGenerator\VAMG_init.sqf";
				execVM "voiceActivatedMissionGenerator\VAMG_clearKeyDowns.sqf";
			};
		};
	};
};
















// below is copied 

while {VAUS_numericalInputbool} do {

	VAUS_confirmedControl	= count VAUS_control; 	// should hold 1 value, specifying whether direct control or HC 
	VAUS_confirmedGroup		= count VAUS_group; 	// should hold 1 value, specifying type of team wanted 
	VAUS_confirmedCamo 		= count VAUS_camo; 		// should hold 1 value, specifying which colour camo is wanted 
	VAUS_confirmedConfirm	= count VAUS_confirm;	// should hold 1 value, spacifying whether player wants to create or cancel instruction

	// control type / DC or HC 
	if (VAUS_controlBool) then {

		if (VAUS_confirmedControl == 1) then {

			_controlType = VAUS_control select 0;

			if (_controlType == 1) then {
				// systemChat "you selected to have them under your direct control";
				// sleep 0.2;
				// systemChat "question 2 - what type of group do you want?";
				// systemChat "1 = fire team x 4, 	2 = full platoon x 20, 	3 = sniper team x 2";
				// systemChat "4 = at team x 3, 	5 = aa team x 3, 		6 = eng team x 2";
				// systemChat "7 = demo team x 2, 	8 = medic team x 4";
				50 cutRsc ["B18_L3_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L3_1")};
				_display = uiNameSpace getVariable "B18_L3_1";
				_setText = _display displayCtrl 18005;
				_setText ctrlSetStructuredText (parseText format ["DIRECT COMMAND"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];
				
				VAUS_controlBool = false;
				VAUS_groupBool = true;
			};

			if (_controlType == 2) then {
				// systemChat "you selected to have them as HC units";
				// sleep 0.2;
				// systemChat "question 2 - what type of group do you want?";
				// systemChat "1 = fire team x 4, 	2 = full platoon x 20, 	3 = sniper team x 2";
				// systemChat "4 = at team x 3, 	5 = aa team x 3, 		6 = eng team x 2";
				// systemChat "7 = demo team x 2, 	8 = medic team x 4";
			
				60 cutRsc ["B18_L4_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L4_1")};
				_display = uiNameSpace getVariable "B18_L4_1";
				_setText = _display displayCtrl 18011;
				_setText ctrlSetStructuredText (parseText format ["HIGH COMMAND"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];

				VAUS_controlBool = false;
				VAUS_groupBool = true;

				// does it cause an error if we are counting a non existant array, like it has not yet been created?
				// do we need a better way to register HC groups?
				// for now we remove group number validation, and just focus on getting the groups created!
				// _groupBlu1Count = count units group groupBlu1;
				// _groupBlu2Count = count units group groupBlu2;
				// _groupBlu3Count = count units group groupBlu3;
				// _groupBlu4Count = count units group groupBlu4;
				// _groupBlu5Count = count units group groupBlu5;
				// VAUS_activeGroups = _groupBlu1Count + _groupBlu2Count + _groupBlu3Count + _groupBlu4Count + _groupBlu5Count;

				// _allowHC = VAUS_activeGroups select 0;

				// if (_allowHC == 5) then {
				// 	systemChat "you have reached max groups, no more allowed";
				// 	sleep 1;
				// 	systemChat "closing spawner -- no HC for you";

					// 8 cutRsc ["VAUS_CONFIRMCANCEL","PLAIN"];
					// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONFIRMCANCEL")};
					// _display = uiNameSpace getVariable "VAUS_CONFIRMCANCEL";
					// _setText = _display displayCtrl 10007;
					// _setText ctrlSetStructuredText (parseText format ["CANCELLED"]);
					// _setText ctrlSetBackgroundColor [0,0,0,0.5];

					// execVM "voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf";
					// execVM "voiceActivatedUnitSpawner\initialiseVAUS.sqf";
				// };
			};
		};
	};

	// group type / DC or HC 
	if (VAUS_groupBool) then {

		// second prompt 
		210 cutRsc ["default","PLAIN"]; // remove first prompt
		211 cutRsc ["B18_BottomLine2","PLAIN"]; // second prompt 
		_display = uiNameSpace getVariable "B18_BottomLine2";
		_setText = _display displayCtrl 18023;
		_setText ctrlSetBackgroundColor [0,1,0,0.8];
		// _setText ctrlSetTextColor [0, 1, 0, 1];

		if (VAUS_confirmedGroup == 1) then {

			_groupType = VAUS_group select 0;

			if (_groupType == 1) then {
				// systemChat "you selected fire team";

				70 cutRsc ["B18_L3_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L3_2")};
				_display = uiNameSpace getVariable "B18_L3_2";
				_setText = _display displayCtrl 18006;
				_setText ctrlSetStructuredText (parseText format ["FIRE TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];
			};

			if (_groupType == 2) then {
				// systemChat "you selected full platoon";

				90 cutRsc ["B18_L3_3","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L3_3")};
				_display = uiNameSpace getVariable "B18_L3_3";
				_setText = _display displayCtrl 18007;
				_setText ctrlSetStructuredText (parseText format ["PLATOON"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
								_setText ctrlSetTextColor [0, 1, 0, 1];
			};

			if (_groupType == 3) then {
				// systemChat "you selected sniper team";

				110 cutRsc ["B18_L3_4","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L3_4")};
				_display = uiNameSpace getVariable "B18_L3_4";
				_setText = _display displayCtrl 18008;
				_setText ctrlSetStructuredText (parseText format ["SNIPER TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
								_setText ctrlSetTextColor [0, 1, 0, 1];
			};

			if (_groupType == 4) then {
				// systemChat "you selected AT team";

				130 cutRsc ["B18_L3_5","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L3_5")};
				_display = uiNameSpace getVariable "B18_L3_5";
				_setText = _display displayCtrl 18009;
				_setText ctrlSetStructuredText (parseText format ["AT TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
								_setText ctrlSetTextColor [0, 1, 0, 1];
			};

			if (_groupType == 5) then {
				// systemChat "you selected AA team";

				80 cutRsc ["B18_L4_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L4_2")};
				_display = uiNameSpace getVariable "B18_L4_2";
				_setText = _display displayCtrl 18012;
				_setText ctrlSetStructuredText (parseText format ["AA TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
								_setText ctrlSetTextColor [0, 1, 0, 1];
			};

			if (_groupType == 6) then {
				// systemChat "you selected eng team";

				100 cutRsc ["B18_L4_3","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L4_3")};
				_display = uiNameSpace getVariable "B18_L4_3";
				_setText = _display displayCtrl 18013;
				_setText ctrlSetStructuredText (parseText format ["ENG TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
								_setText ctrlSetTextColor [0, 1, 0, 1];
			};

			if (_groupType == 7) then {
				// systemChat "you selected demo team";

				120 cutRsc ["B18_L4_4","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L4_4")};
				_display = uiNameSpace getVariable "B18_L4_4";
				_setText = _display displayCtrl 18014;
				_setText ctrlSetStructuredText (parseText format ["DEMO TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
								_setText ctrlSetTextColor [0, 1, 0, 1];
			};

			if (_groupType == 8) then {
				// systemChat "you selected medic team";

				140 cutRsc ["B18_L4_5","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L4_5")};
				_display = uiNameSpace getVariable "B18_L4_5";
				_setText = _display displayCtrl 18015;
				_setText ctrlSetStructuredText (parseText format ["MEDIC TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];
			};
			
			sleep 0.2;

			// systemChat "question 3 - what camo is required?";
			// systemChat "1 = RHS Desert, 3 = Livonia Woodland";

			// here i put the 'progression bools' outside of the ifthens, but i also put them in each ifthen .. i wonder if it actually matters?
			// because if not, just use them once at the end.. DRY!
			VAUS_groupBool = false;
			VAUS_camoBool = true;
		};
	};
	
	// camo type / vanilla altis / rhs desert / livonian woodland
	if (VAUS_camoBool) then {

		// third prompt 
		211 cutRsc ["default","PLAIN"]; // remove second prompt
		212 cutRsc ["B18_BottomLine3","PLAIN"]; // third prompt 
		_display = uiNameSpace getVariable "B18_BottomLine3";
		_setText = _display displayCtrl 18024;
		_setText ctrlSetBackgroundColor [0,1,0,0.8];
		// _setText ctrlSetTextColor [0, 1, 0, 1];

		if (VAUS_confirmedCamo == 1) then {

			_camoType = VAUS_camo select 0;
			// if i rename Camo to, say, Specialism, it makes it easier to have camo act as a category 
			// and if I can make it so the user can define easily the names of the camo/specialism, as well as the number and configuration of the groups..
			// you give the player a load of customisation options, which would be useful..
			if (_camoType == 1) then {
				// systemChat "you selected vanilla camo";

				150 cutRsc ["B18_L3_6","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L3_6")};
				_display = uiNameSpace getVariable "B18_L3_6";
				_setText = _display displayCtrl 18010;
				_setText ctrlSetStructuredText (parseText format ["WOODLAND"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];

				VAUS_camoBool = false;
				VAUS_confirmBool = true;
			};

			if (_camoType == 2) then {
				// systemChat "you selected RHS Desert";

				160 cutRsc ["B18_L4_6","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L4_6")};
				_display = uiNameSpace getVariable "B18_L4_6";
				_setText = _display displayCtrl 18016;
				_setText ctrlSetStructuredText (parseText format ["DESERT"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];

				VAUS_camoBool = false;
				VAUS_confirmBool = true;
			};

			// if (_camoType == 3) then {
			// 	systemChat "you selected Livonian Woodland";
			// 	7 cutRsc ["VAUS_CONTENT_n3","PLAIN"];
			// 	waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n3")};
			// 	_display = uiNameSpace getVariable "VAUS_CONTENT_n3";
			// 	_setText = _display displayCtrl 10006;
			// 	_setText ctrlSetStructuredText (parseText format ["WOODLAND"]);
			// 	_setText ctrlSetBackgroundColor [0,0,0,0.5];
			// 	VAUS_camoBool = false;
			// 	VAUS_confirmBool = true;
			// };

			sleep 0.2;

			// systemChat "review your selection and confirm / cancel";
			// systemChat "1 = confirm, 2 = cancel";

		};
	};
//
	// confirm choice
	if (VAUS_confirmBool) then {

		212 cutRsc ["default","PLAIN"]; // remove third prompt
		213 cutRsc ["B18_BottomLine4","PLAIN"]; // third prompt 
		_display = uiNameSpace getVariable "B18_BottomLine4";
		_setText = _display displayCtrl 18025;
		_setText ctrlSetBackgroundColor [0,1,0,0.8];
		// _setText ctrlSetTextColor [0, 1, 0, 1];

		if (VAUS_confirmedConfirm == 1) then {

			// 8 cutRsc ["VAUS_CONFIRMCANCEL","PLAIN"];
			// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONFIRMCANCEL")};
			// _display = uiNameSpace getVariable "VAUS_CONFIRMCANCEL";
			// _setText = _display displayCtrl 10007;
			// _setText ctrlSetStructuredText (parseText format ["CONFIRM / CANCEL"]);
			// _setText ctrlSetBackgroundColor [0,0,0,0.5];

			_testConfirmType = VAUS_confirm select 0; // rename if this works!!!

			if (_testConfirmType == 1) then {
				// systemChat "selection has been completed - thank you";

				170 cutRsc ["B18_L5_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L5_1")};
				_display = uiNameSpace getVariable "B18_L5_1";
				_setText = _display displayCtrl 18017;
				_setText ctrlSetStructuredText (parseText format ["CONFIRM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];

				sleep 0.5;
				VAUS_confirmBool = false;
				[VAUS_control, VAUS_group, VAUS_camo] execVM "voiceActivatedUnitSpawner\VAUS_createUnits.sqf";
			};

			if (_testConfirmType == 2) then {
				// systemChat "selection has been cancelled - standing down";

				180 cutRsc ["B18_L5_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L5_2")};
				_display = uiNameSpace getVariable "B18_L5_2";
				_setText = _display displayCtrl 18018;
				_setText ctrlSetStructuredText (parseText format ["CANCEL"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];

				sleep 0.5;
				VAUS_confirmBool = false;
				execVM "voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf";
				execVM "voiceActivatedUnitSpawner\initialiseVAUS.sqf";
			};
		};
	};

	sleep 0.1;
	// systemChat "cycle monitor";
};
