
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
				systemChat "you selected to have them under your direct control";
				sleep 0.2;
				systemChat "question 2 - what type of group do you want?";
				systemChat "1 = fire team x 4, 	2 = full platoon x 20, 	3 = sniper team x 2";
				systemChat "4 = at team x 3, 	5 = aa team x 3, 		6 = eng team x 2";
				systemChat "7 = demo team x 2, 	8 = medic team x 4";
				// 5 cutRsc ["VAUS_CONTENT_n1","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n1")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n1";
				// _setText = _display displayCtrl 10004;
				// _setText ctrlSetStructuredText (parseText format ["DIRECT COMMAND"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				VAUS_controlBool = false;
				VAUS_groupBool = true;
			};

			if (_controlType == 2) then {
				systemChat "you selected to have them as HC units";
				sleep 0.2;
				systemChat "question 2 - what type of group do you want?";
				systemChat "1 = fire team x 4, 	2 = full platoon x 20, 	3 = sniper team x 2";
				systemChat "4 = at team x 3, 	5 = aa team x 3, 		6 = eng team x 2";
				systemChat "7 = demo team x 2, 	8 = medic team x 4";
				// 5 cutRsc ["VAUS_CONTENT_n1","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n1")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n1";
				// _setText = _display displayCtrl 10004;
				// _setText ctrlSetStructuredText (parseText format ["HIGH COMMAND"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];

				_groupBlu1Count = count units group groupBlu1;
				_groupBlu2Count = count units group groupBlu2;
				_groupBlu3Count = count units group groupBlu3;
				_groupBlu4Count = count units group groupBlu4;
				_groupBlu5Count = count units group groupBlu5;
				VAUS_activeGroups = _groupBlu1Count + _groupBlu2Count + _groupBlu3Count + _groupBlu4Count + _groupBlu5Count;

				_allowHC = VAUS_activeGroups select 0;

				if (_allowHC == 5) then {
					systemChat "you have reached max groups, no more allowed";
					sleep 1;
					systemChat "closing spawner -- no HC for you";

					// 8 cutRsc ["VAUS_CONFIRMCANCEL","PLAIN"];
					// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONFIRMCANCEL")};
					// _display = uiNameSpace getVariable "VAUS_CONFIRMCANCEL";
					// _setText = _display displayCtrl 10007;
					// _setText ctrlSetStructuredText (parseText format ["CANCELLED"]);
					// _setText ctrlSetBackgroundColor [0,0,0,0.5];

					execVM "voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf";
					execVM "voiceActivatedUnitSpawner\initialiseVAUS.sqf";
				};

				VAUS_controlBool = false;
				VAUS_groupBool = true;
			};
		};
	};

	// group type / DC or HC 
	if (VAUS_groupBool) then {

		if (VAUS_confirmedGroup == 1) then {

			_groupType = VAUS_group select 0;

			if (_groupType == 1) then {
				systemChat "you selected fire team";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["FIRE TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};

			if (_groupType == 2) then {
				systemChat "you selected full platoon";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["PLATOON"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};

			if (_groupType == 3) then {
				systemChat "you selected sniper team";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["SNIPER TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};

			if (_groupType == 4) then {
				systemChat "you selected AT team";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["AT TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};

			if (_groupType == 5) then {
				systemChat "you selected AA team";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["AA TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};

			if (_groupType == 6) then {
				systemChat "you selected eng team";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["ENGINEERING TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};

			if (_groupType == 7) then {
				systemChat "you selected demo team";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["DEMOLITION TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};

			if (_groupType == 8) then {
				systemChat "you selected medic team";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["MEDICAL TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};
			
			sleep 0.2;

			systemChat "question 3 - what camo is required?";
			systemChat "1 = vanilla camo, 2 = RHS Desert, 3 = Livonia Woodland";

			VAUS_groupBool = false;
			VAUS_camoBool = true;
		};
	};
	
	// camo type / vanilla altis / rhs desert / livonian woodland
	if (VAUS_camoBool) then {

		if (VAUS_confirmedCamo == 1) then {

			_camoType = VAUS_camo select 0;

			if (_camoType == 1) then {
				systemChat "you selected vanilla camo";
				// 7 cutRsc ["VAUS_CONTENT_n3","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n3")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n3";
				// _setText = _display displayCtrl 10006;
				// _setText ctrlSetStructuredText (parseText format ["ALTIS"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};
			if (_camoType == 2) then {
				systemChat "you selected RHS Desert";
				// 7 cutRsc ["VAUS_CONTENT_n3","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n3")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n3";
				// _setText = _display displayCtrl 10006;
				// _setText ctrlSetStructuredText (parseText format ["DESERT"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};
			if (_camoType == 3) then {
				systemChat "you selected Livonian Woodland";
				// 7 cutRsc ["VAUS_CONTENT_n3","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n3")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n3";
				// _setText = _display displayCtrl 10006;
				// _setText ctrlSetStructuredText (parseText format ["WOODLAND"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};

			sleep 0.2;

			systemChat "review your selection and confirm / cancel";
			systemChat "1 = confirm, 2 = cancel";

			VAUS_camoBool = false;
			VAUS_confirmBool = true;
		};
	};

	// confirm choice
	if (VAUS_confirmBool) then {

		// 8 cutRsc ["VAUS_CONFIRMCANCEL","PLAIN"];
		// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONFIRMCANCEL")};
		// _display = uiNameSpace getVariable "VAUS_CONFIRMCANCEL";
		// _setText = _display displayCtrl 10007;
		// _setText ctrlSetStructuredText (parseText format ["CONFIRM / CANCEL"]);
		// _setText ctrlSetBackgroundColor [0,0,0,0.5];

		_confirmType = VAUS_confirmedConfirm select 0;

		if (_confirmType == 1) then {
			// 8 cutRsc ["VAUS_CONFIRMCANCEL","PLAIN"];
			// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONFIRMCANCEL")};
			// _display = uiNameSpace getVariable "VAUS_CONFIRMCANCEL";
			// _setText = _display displayCtrl 10007;
			// _setText ctrlSetStructuredText (parseText format ["CONFIRMED"]);
			// _setText ctrlSetBackgroundColor [0,0,0,0.5];

			// [VAUS_control, VAUS_group, VAUS_camo] execVM voiceActivatedUnitSpawner\VAUS_createUnits.sqf;
		};

		if (_confirmType == 2) then {
			systemChat "selection has been cancelled - standing down";

			// 8 cutRsc ["VAUS_CONFIRMCANCEL","PLAIN"];
			// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONFIRMCANCEL")};
			// _display = uiNameSpace getVariable "VAUS_CONFIRMCANCEL";
			// _setText = _display displayCtrl 10007;
			// _setText ctrlSetStructuredText (parseText format ["CANCELLED"]);
			// _setText ctrlSetBackgroundColor [0,0,0,0.5];

			execVM "voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf";
			execVM "voiceActivatedUnitSpawner\initialiseVAUS.sqf";
		};
	};

	sleep 0.1;
	// systemChat "cycle";
};
