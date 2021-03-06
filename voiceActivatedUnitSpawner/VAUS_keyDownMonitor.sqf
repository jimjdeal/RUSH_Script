/*
from:	voiceActivatedUnitSpawner\initialiseVAUS.sqf
to:		voiceActivatedUnitSpawner\VAUS_createUnits.sqf
to:		voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf
to: 	voiceActivatedUnitSpawner\initialiseVAUS.sqf

purpose:
loop-listener that validates user input, and changes state at correct times 
when all entries have been made, the script will either progress to spawner, or cancel / reboot 

notes:
*/

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
