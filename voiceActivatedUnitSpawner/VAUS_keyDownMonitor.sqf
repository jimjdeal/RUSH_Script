
while {VAUS_numericalInputbool} do {

	
	VAUS_confirmedControl	= count VAUS_control; 	// should hold 1 value, specifying whether direct control or HC 
	VAUS_confirmedGroup		= count VAUS_group; 	// should hold 1 value, specifying type of team wanted 
	VAUS_confirmedCamo 		= count VAUS_camo; 		// should hold 1 value, specifying which colour camo is wanted 
	VAUS_confirmedConfirm	= count VAUS_confirm;	// should hold 1 value, spacifying whether player wants to create or cancel instruction

	if (VAUS_controlBool) then {

		if (VAUS_confirmedControl == 1) then {

			if (VAUS_control == 1) then {
				systemChat "you selected to have them under your direct control";

				VAUS_controlBool = false;
				VAUS_groupBool = true;
				
			systemChat "question 2 - what type of group do you want?";
			systemChat "1 = fire team x 4, 	2 = full platoon x 20, 	3 = sniper team x 2";
			systemChat "4 = at team x 3, 	5 = aa team x 3, 		6 = eng team x 2";
			systemChat "7 = demo team x 2, 	8 = medic team x 4";

			};

			if (VAUS_control == 2) then {
				systemChat "you selected to have them as HC units";

				VAUS_controlBool = false;
				VAUS_groupBool = true;
				
			systemChat "question 2 - what type of group do you want?";
			systemChat "1 = fire team x 4, 	2 = full platoon x 20, 	3 = sniper team x 2";
			systemChat "4 = at team x 3, 	5 = aa team x 3, 		6 = eng team x 2";
			systemChat "7 = demo team x 2, 	8 = medic team x 4";

			};



		};
	};


	if (VAUS_groupBool) then {

		if (VAUS_confirmedGroup == 1) then {

			if (VAUS_group == 1) then {
				systemChat "you selected fire team";
			};
			if (VAUS_group == 2) then {
				systemChat "you selected full platoon";
			};
			if (VAUS_group == 3) then {
				systemChat "you selected sniper team";
			};
			if (VAUS_group == 4) then {
				systemChat "you selected AT team";
			};
			if (VAUS_group == 5) then {
				systemChat "you selected AA team";
			};
			if (VAUS_group == 6) then {
				systemChat "you selected eng team";
			};
			if (VAUS_group == 7) then {
				systemChat "you selected demo team";
			};
			if (VAUS_group == 8) then {
				systemChat "you selected medic team";
			};
			
			systemChat "question 3 - what camo is required?";
			systemChat "1 = vanilla camo, 2 = RHS Desert, 3 = Livonia Woodland";

			VAUS_groupBool = false;
			VAUS_camoBool = true;

		};
	};
	
	if (VAUS_camoBool) then {

		if (VAUS_confirmedCamo == 1) then {

			if (VAUS_camo == 1) then {
				systemChat "you selected vanilla camo";
			};
			if (VAUS_camo == 2) then {
				systemChat "you selected RHS Desert";
			};
			if (VAUS_camo == 3) then {
				systemChat "you selected Livonian Woodland";
			};

			sleep 1;

			VAUS_camoBool = false;
			VAUS_confirmBool = true;

			systemChat "review your selection and confirm / cancel";
			systemChat "1 = confirm, 2 = cancel";

		};
	};


	if (VAUS_confirmBool) then {

		if (VAUS_confirmedConfirm == 1) then {
			systemChat "test";
		};

		if (VAUS_confirmedConfirm == 2) then {
			systemChat "selection has been cancelled - standing down";
			execVM "voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf";
			execVM "voiceActivatedUnitSpawner\initialiseVAUS.sqf";
		};

	};

	sleep 1;
	systemChat "cyclke";
};
