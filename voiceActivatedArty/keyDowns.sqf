
// something to test - does this need to be bool-driven? Or would these operate just as well by activating and then removing the EH?

if (numericalInputBool) then {

	rgg_cnl = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 181) then {
		
		systemChat 'Call Aborted';
		execVM 'voiceActivatedArty\clearKeyDowns.sqf'; 
		_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',rgg_cnl];
		numericalInputBool = false;
		systemChat 'in-flight / abort clearDowns done .. check can re-open';
		execVM 'voiceActivatedArty\VAA_Init.sqf';

	}"];

	rgg_kd0 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 82) then {
			
		systemChat '0';

		if (latCoordInputBool) then {
			splashCoordsLat pushback 0;
		};

		if (lonCoordInputBool) then {
			splashCoordsLon pushback 0;
		};

		if (roundsInputBool) then {
			splashRounds pushback 0;
		};

		if (radiusInputBool) then {
			splashRadius pushback 0;
		};

		if (confirmActionBool) then {
			systemChat 'FIRE MISSION ABORTED!!!';
			splashConfirm pushback 0;
		};



	}"];

	rgg_kd1 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 79) then {

		systemChat '1';

		if (artyTypeBool) then {
			splashArtyTypeHE pushback 1;
			systemChat 'HE Selected';
		};

		if (ordColourBool) then {
			splashOrdColour pushback 1;
			systemChat 'white';
		};

		if (latCoordInputBool) then {
			splashCoordsLat pushback 1;
		};

		if (lonCoordInputBool) then {
			splashCoordsLon pushback 1;
		};

		if (roundsInputBool) then {
			splashRounds pushback 1;
		};

		if (radiusInputBool) then {
			splashRadius pushback 1;
		};

		if (confirmActionBool) then {
			systemChat 'FIRE MISSION CONFIRMED';
			splashConfirm pushback 1;
		};
		
	}"];

	rgg_kd2 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 80) then {
			
		systemChat '2';

		if (artyTypeBool) then {
			splashArtyTypeSU pushback 1;
			systemChat 'Surgical Selected';
		};

		if (ordColourBool) then {
			splashOrdColour pushback 2;
			systemChat 'red selected';
		};

		if (latCoordInputBool) then {
			splashCoordsLat pushback 2;
		};

		if (lonCoordInputBool) then {
			splashCoordsLon pushback 2;
		};

		if (roundsInputBool) then {
			splashRounds pushback 2;
		};

		if (radiusInputBool) then {
			splashRadius pushback 2;
		};

	}"];

	rgg_kd3 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 81) then {
			
		systemChat '3';
		
		if (ArtyTypeBool) then {
			splashArtyTypeSM pushback 1;
			systemChat 'smoke selected';
		};

		if (ordColourBool) then {
			splashordColour pushback 3;
			systemChat 'green selected';
		};

		if (latCoordInputBool) then {
			splashCoordsLat pushback 3;
		};

		if (lonCoordInputBool) then {
			splashCoordsLon pushback 3;
		};

		if (roundsInputBool) then {
			splashRounds pushback 3;
		};

		if (radiusInputBool) then {
			splashRadius pushback 3;
		};

	}"];

	rgg_kd4 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 75) then {
		
		systemChat '4';
		
		if (artyTypeBool) then {
			splashArtyTypeFL pushback 4;
			systemChat 'flares selected';
		};

		if (ordColourBool) then {
			splashOrdColour pushback 4;
			systemChat 'blue selected';
		};

		if (latCoordInputBool) then {
			splashCoordsLat pushback 4;
		};

		if (lonCoordInputBool) then {
			splashCoordsLon pushback 4;
		};

		if (roundsInputBool) then {
			splashRounds pushback 4;
		};

		if (radiusInputBool) then {
			splashRadius pushback 4;
		};

	}"];

	rgg_kd5 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 76) then {
			
		systemChat '5';

		if (ordColourBool) then {
			splashOrdColour pushback 5;
			systemChat 'oranges selected';
		};
		
		if (latCoordInputBool) then {
			splashCoordsLat pushback 5;
		};

		if (lonCoordInputBool) then {
			splashCoordsLon pushback 5;
		};

		if (roundsInputBool) then {
			splashRounds pushback 5;
		};

		if (radiusInputBool) then {
			splashRadius pushback 5;
		};
		
	}"];

	rgg_kd6 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 77) then {
			
		systemChat '6';

		if (ordColourBool) then {
			splashOrdColour pushback 6;
			systemChat 'purple selected';
		};
		
		if (latCoordInputBool) then {
			splashCoordsLat pushback 6;
		};

		if (lonCoordInputBool) then {
			splashCoordsLon pushback 6;
		};

		if (roundsInputBool) then {
			splashRounds pushback 6;
		};

		if (radiusInputBool) then {
			splashRadius pushback 6;
		};

	}"];

	rgg_kd7 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 71) then {
			
		systemChat '7';

		if (ordColourBool) then {
			splashCrdColour pushback 7;
			systemChat 'yellow selected';
		};
		
		if (latCoordInputBool) then {
			splashCoordsLat pushback 7;
		};

		if (lonCoordInputBool) then {
			splashCoordsLon pushback 7;
		};

		if (roundsInputBool) then {
			splashRounds pushback 7;
		};

		if (radiusInputBool) then {
			splashRadius pushback 7;
		};
		
	}"];

	rgg_kd8 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 72) then {
			
		systemChat '8';

		if (ordColourBool) then {
			splashOrdColour pushback 8;
			systemChat 'IR Selected';
		};
		
		if (latCoordInputBool) then {
			splashCoordsLat pushback 8;
		};

		if (lonCoordInputBool) then {
			splashCoordsLon pushback 8;
		};

		if (roundsInputBool) then {
			splashRounds pushback 8;
		};

		if (radiusInputBool) then {
			splashRadius pushback 8;
		};
		
	}"];

	rgg_kd9 = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 73) then {
			
		systemChat '9';

		if (latCoordInputBool) then {
			splashCoordsLat pushback 9;
		};

		if (lonCoordInputBool) then {
			splashCoordsLon pushback 9;
		};

		if (roundsInputBool) then {
			splashRounds pushback 9;
		};

		if (radiusInputBool) then {
			splashRadius pushback 9;
		};

	}"];
};
		

