/*
from:		voiceactivatedhighcommand\initialiseVAHCO.sqf 
to:			voiceactivatedhighcommand\VAHCO_OscarMike.sqf

purpose:
loop-listener that validates user input, and changes state at correct times 

notes:
*/

while {VAHCO_numericalInputbool} do {

	// counts / validates the correct numbers are held in each array

	VAHCO_Validate_Group 	= count VAHCO_groupSelect; 	// should contain 1 value
	VAHCO_Validate_Orders 	= count VAHCO_orderSelect; 	// should contain 1 value
	VAHCO_Validate_distance = count VAHCO_distance; 	// should contain 4 value;
	VAHCO_Validate_heading	= count VAHCO_heading;		// should contain 3 value;

	// confirm what group you want to talk to 
	if (VAHCO_groupSelectBool) then {
		if (VAHCO_Validate_Group == 1) then {

			RGG_Grp_Num = VAHCO_groupSelect select 0;
			// at the very least, stop repeating your bools in each 'then' statement 
			// and there must be a better way to do this .. so much repeat!!
			if (RGG_Grp_Num == 1) then {

				1 cutRsc ["C_L1_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
				_n1 = "Bravo 1";
				_display = uiNameSpace getVariable "C_L1_1";
				_setText = _display displayCtrl 19001;
				_setText ctrlSetStructuredText (parseText format ["%1 Receiving .. Confirm Distance..", _n1]);
				_setText ctrlSetBackgroundColor [0,0,0,0.5];

				// VAHCO_groupSelectBool = false;
				// VAHCO_orderSelectBool = true;
			};
			if (RGG_Grp_Num == 2) then {
				1 cutRsc ["C_L1_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
				_n1 = "Bravo 2";
				_display = uiNameSpace getVariable "C_L1_1";
				_setText = _display displayCtrl 19001;
				_setText ctrlSetStructuredText (parseText format ["%1 Receiving .. Confirm Distance..", _n1]);
				_setText ctrlSetBackgroundColor [0,0,0,0.5];

				// VAHCO_groupSelectBool = false;
				// VAHCO_orderSelectBool = true;
			};

			if (RGG_Grp_Num == 3) then {
				1 cutRsc ["C_L1_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
				_n1 = "Bravo 3";
				_display = uiNameSpace getVariable "C_L1_1";
				_setText = _display displayCtrl 19001;
				_setText ctrlSetStructuredText (parseText format ["%1 Receiving .. Confirm Distance..", _n1]);
				_setText ctrlSetBackgroundColor [0,0,0,0.5];

				// VAHCO_groupSelectBool = false;
				// VAHCO_orderSelectBool = true;
			};

			if (RGG_Grp_Num == 4) then {
				1 cutRsc ["C_L1_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
				_n1 = "Bravo 4";
				_display = uiNameSpace getVariable "C_L1_1";
				_setText = _display displayCtrl 19001;
				_setText ctrlSetStructuredText (parseText format ["%1 Receiving .. Confirm Distance..", _n1]);
				_setText ctrlSetBackgroundColor [0,0,0,0.5];

				// VAHCO_groupSelectBool = false;
				// VAHCO_orderSelectBool = true;
			};

			if (RGG_Grp_Num == 5) then {
				1 cutRsc ["C_L1_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
				_n1 = "Bravo 5";
				_display = uiNameSpace getVariable "C_L1_1";
				_setText = _display displayCtrl 19001;
				_setText ctrlSetStructuredText (parseText format ["%1 Receiving .. Confirm Distance..", _n1]);
				_setText ctrlSetBackgroundColor [0,0,0,0.5];

				// VAHCO_groupSelectBool = false;
				// VAHCO_orderSelectBool = true;
			};

			VAHCO_groupSelectBool = false;
			VAHCO_orderSelectBool = true;
			// sleep 1;

		};
	};

	// confirm type of order to issue (currently only one type - move)
	if (VAHCO_orderSelectBool) then {

		// movement orders 
		if (VAHCO_Validate_Orders == 1) then {

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_n1 = "Distance";
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["Ready to move - Confirm %1", _n1]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];

			// sleep 1;
			VAHCO_orderSelectBool = false;
			VAHCO_distanceBool = true;
		};
	};

	// confirm distance to move
	if (VAHCO_distanceBool) then {

		if (VAHCO_Validate_distance == 4) then {

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_n1 = "Heading";
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["Distance Confirmed, what %1 ?", _n1]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];

			VAHCO_distanceBool = false;
			VAHCO_headingBool = true;
		};
	};

	// confirm distance to move
	if (VAHCO_headingBool) then {

		if (VAHCO_Validate_heading == 3) then {

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_n1 = "Oscar Mike";
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["Orders Confirmed, we are %1", _n1]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];

			VAHCO_headingBool = false;
			VAHCO_OscarMikeBool = true;
		};
	};

	// Oscar Mike
	if (VAHCO_OscarMikeBool) then {

		execVM "voiceactivatedhighcommand\VAHCO_OscarMike.sqf";
	};
		
	sleep 0.1;
};	
	