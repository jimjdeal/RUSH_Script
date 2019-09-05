/*
from:	voiceActivatedArty\initialiseVAA.sqf
to:		voiceActivatedArty\clearKeyDowns.sqf
to:		voiceActivatedArty\initialiseVAA.sqf	 
to: 	voiceActivatedArty\execute\confirmExecute.sqf	/ makes booms

purpose:
loop-listener that validates user input, and changes state at correct times 

notes:
unsure if the return loop back to initialiseVAA is correct .. should this go further back?
*/

while {numericalInputbool} do {

	// counts entry of inputted values
	confirmedTypeHE	= count splashArtyTypeHE;
	confirmedTypeSU	= count splashArtyTypeSU;
	confirmedTypeSM	= count splashArtyTypeSM;
	confirmedTypeFL	= count splashArtyTypeFL;

	// this checks for 'any colour', but does not extract the type of colour (the number value)
	confirmedColour	= count splashOrdColour;

	// this checks for the number of digits held in the lat/lon arrays (4 or 5)
	confirmedLatDigits = count splashCoordsLat;
	confirmedLonDigits = count splashCoordsLon;

	// this checks when Rounds has three numbers
	confirmedRounds	= count splashRounds;

	// this checks when Radius has three numbers
	confirmedRadius	= count splashRadius;

	// this checks whether the call has has a 'final confirmation', and triggers action if yes
	confirmedExecute = count splashConfirm;


	// TYPE
	if (artyTypeBool) then {

		if (confirmedTypeHE == 1) then {
			systemChat "High Explosive Barrage confirmed";
			systemChat "Confirm latitude";
			// playSound "dangerClose2";
			artyTypeBool = false;
			latCoordInputBool = true;
		};

		if (confirmedTypeSU == 1) then {
			systemChat "GBU Surgical Strike confirmed";
			systemChat "Confirm latitude";
			artyTypeBool = false;
			latCoordInputBool = true;
		};

		if (confirmedTypeSM == 1)  then {
			systemChat "Smoke confirmed";
			systemChat "Confirm colour";
			systemChat '1 = white, 2 = red, 3 = green, 4 = blue';
			systemChat '5 = orange, 6 = purple, 7 = yellow, 8 = IR';
			artyTypeBool = false;
			ordColourBool = true;
		};

		if (confirmedTypeFL == 1)  then {
			systemChat "Flares confirmed";
			systemChat "Confirm colour";
			systemChat '1 = white, 2 = red, 3 = green, 4 = blue';
			systemChat '5 = orange, 6 = purple, 7 = yellow, 8 = IR';
			artyTypeBool = false;
			ordColourBool = true;
		};
	};

	// COLOUR
	if (ordColourBool) then {

		if (confirmedColour == 1) then {

			_colour = splashOrdColour select 0;

			if (_colour == 1) then {
			systemChat "white selected";

			};
			if (_colour == 2) then {
			systemChat "red selected";

			};
			if (_colour == 3) then {
			systemChat "green selected";

			};
			if (_colour == 4) then {
			systemChat "blue selected";

			};
			if (_colour == 5) then {
			systemChat "orange selected";

			};
			if (_colour == 6) then {
			systemChat "purple selected";

			};
			if (_colour == 7) then {
			systemChat "yellow selected";

			};
			if (_colour == 8) then {
			systemChat "IR selected";

			};

			systemChat "now enter latitude";

			ordColourBool = false;
			latCoordInputBool = true;
		};
	};

	// LAT
	if (latCoordInputBool) then {

		if (confirmedTypeSU == 1) then {

			if (confirmedLatDigits == 5) then {
				systemChat "5 digit latitude received...";
				systemChat str splashCoordsLat;
				systemChat "now enter longitude";
				
				latCoordInputBool = false;
				lonCoordInputBool = true;
			};

		} else {

			if (confirmedLatDigits == 4) then {

				splashCoordsLat pushback 0;
				systemChat "4 digit latitude received...";
				systemChat str splashCoordsLat;
				// playSound "dangerClose3";
				systemChat "now enter longitude";
				latCoordInputBool = false;
				lonCoordInputBool = true;
			};
		};
	};
	
	// LON
	if (lonCoordInputBool) then {

		if (confirmedTypeSU == 1) then {

			if (confirmedLonDigits == 5) then {
				systemChat "5 digit longitude received...";
				systemChat str splashCoordsLat;
				// next question we should ask here - confirm fire mission or adjust fire 
				// adjustFireBool 
				// if false, then confirmActionBool = true 
				// if true, then adjustingFireBool = true 
				// if adjustingFireBool = true, then inputs are..
				// "left .2 0", or "left .8 5".
				// this adds this amount to the heading value 
				// incomplete - this is wrong ^^

				systemChat "final confirmation needed";
				lonCoordInputBool = false;
				confirmActionBool = true;
			};
			
		} else {

			if (confirmedLonDigits == 4) then {

				splashCoordsLon pushback 0;
				systemChat "4 digit longitude received...";
				systemChat str splashCoordsLat;
				systemChat "now confirm number of rounds";
				// playSound "dangerClose4";
				lonCoordInputBool = false;
				roundsInputBool = true;
			};
		};
	};

	// ROUNDS
	if (roundsInputBool) then {

		if (confirmedRounds == 3) then {

			systemChat "rounds received...";
			systemChat str splashRounds;
			systemChat "now enter radius";
			// playSound "dangerClose5";
			roundsInputBool = false;
			radiusInputBool = true;
		};
	};

	// RADIUS
	if (radiusInputBool) then {

			if (confirmedRadius == 3) then {

			systemChat "radius confirmed...";
			systemChat str splashRadius;
			systemChat "press 1 to confirm fire mission";
			// playSound "dangerClose6";
			systemChat "press 0 to ABORT";
			confirmActionBool = true;
			radiusInputBool = false;
		};
	};

	// EXECUTE
	// if (confirmActionBool) then {
	// 		execVM "voiceActivatedArty\confirmExecute.sqf";
	// 		confirmActionBool = false;
	// 	};

	if (confirmActionBool) then {

		if (confirmedExecute == 1) then {

			_goodToGo = splashConfirm select 0;
			
			if (_goodToGo == 1) then {

				if (confirmedTypeHE == 1) then {
					execVM "voiceActivatedArty\execute\confirmExecute.sqf";
					// playSound "dangerClose7";
					confirmActionBool = false;
				};

				if (confirmedTypeSU == 1) then {
					execVM "voiceActivatedArty\execute\confirmExecute.sqf";
					confirmActionBool = false;
				};

				if (confirmedTypeSM == 1)  then {
					execVM "voiceActivatedArty\execute\confirmExecute.sqf";
					confirmActionBool = false;
				};

				if (confirmedTypeFL == 1)  then {
					execVM "voiceActivatedArty\execute\confirmExecute.sqf";
					confirmActionBool = false;
				};
			// ^^ that .. yeah I know .. i know..
			// I may use diff scripts at some point, but I know  
			};

			if (_goodToGo == 0) then {

				execVM 'voiceActivatedArty\clearKeyDowns.sqf';
				systemChat "MISSION ABORT"
				execVM "voiceActivatedArty\initialiseVAA.sqf";
			};
		};
	};

	sleep 0.1;
};	
	