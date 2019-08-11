
if (VACF_numericalInputbool) then {

	// rgg_vacf_cnl = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 181) then {
		
	// 	systemChat 'VACF SYSTEM ABORTED';
	// 	execVM 'voiceActivatedCoordFinder\VACF_clearKeyDowns.sqf'; 
	// 	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown', rgg_vacf_cnl];
	// 	VACF_numericalInputbool = false;
	// 	systemChat 'in-flight / vacf abort clearDowns done .. check can re-open';
	// 	execVM 'voiceActivatedCoordFinder\VACF_Init.sqf';

	// }"];

	rgg_vacf_kd0 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 82) then {
			
		systemChat 'VACF - 0';

		if (VACF_headingBool) then {
			VACF_Heading pushback 0;
		};

		if (VACF_distanceBool) then {
			VACF_Distance pushback 0;
		};

	}"];

	rgg_vacf_kd1 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 79) then {

		systemChat 'VACF - 1';

		if (VACF_headingBool) then {
			VACF_Heading pushback 1;
		};

		if (VACF_distanceBool) then {
			VACF_Distance pushback 1;
		};
		
	}"];

	rgg_vacf_kd2 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 80) then {
			
		systemChat 'VACF - 2';

		if (VACF_headingBool) then {
			VACF_Heading pushback 2;
		};

		if (VACF_distanceBool) then {
			VACF_Distance pushback 2;
		};

	}"];

	rgg_vacf_kd3 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 81) then {
			
		systemChat 'VACF - 3';
		
		if (VACF_headingBool) then {
			VACF_Heading pushback 3;
		};

		if (VACF_distanceBool) then {
			VACF_Distance pushback 3;
		};

	}"];

	rgg_vacf_kd4 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 75) then {
		
		systemChat 'VACF - 4';
		
		if (VACF_headingBool) then {
			VACF_Heading pushback 4;
		};

		if (VACF_distanceBool) then {
			VACF_Distance pushback 4;
		};

	}"];

	rgg_vacf_kd5 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 76) then {
			
		systemChat 'VACF - 5';

		if (VACF_headingBool) then {
			VACF_Heading pushback 5;
		};

		if (VACF_distanceBool) then {
			VACF_Distance pushback 5;
		};
		
	}"];

	rgg_vacf_kd6 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 77) then {
			
		systemChat 'VACF - 6';

		if (VACF_headingBool) then {
			VACF_Heading pushback 6;
		};

		if (VACF_distanceBool) then {
			VACF_Distance pushback 6;
		};

	}"];

	rgg_vacf_kd7 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 71) then {
			
		systemChat 'VACF - 7';

		if (VACF_headingBool) then {
			VACF_Heading pushback 7;
		};

		if (VACF_distanceBool) then {
			VACF_Distance pushback 7;
		};
		
	}"];

	rgg_vacf_kd8 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 72) then {
			
		systemChat 'VACF - 8';

		if (VACF_headingBool) then {
			VACF_Heading pushback 8;
		};

		if (VACF_distanceBool) then {
			VACF_Distance pushback 8;
		};
		
	}"];

	rgg_vacf_kd9 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 73) then {
			
		systemChat 'VACF - 9';

		if (VACF_headingBool) then {
			VACF_Heading pushback 9;
		};

		if (VACF_distanceBool) then {
			VACF_Distance pushback 9;
		};

	}"];
};
		

