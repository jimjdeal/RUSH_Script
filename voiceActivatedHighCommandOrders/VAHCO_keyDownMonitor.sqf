/*
from:		voiceActivatedHighCommandOrders\initialiseVAHCO.sqf 
to:			voiceActivatedHighCommandOrders\VAHCO_OscarMike.sqf

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
			
			if (RGG_Grp_Num == 1) then {
				systemChat "DEBUG - GROUP 1 SELECTED";
				systemChat "you addressed group:";
				systemChat str VAHCO_groupSelect;
				sleep 2;
				systemChat "What orders sir?";
				systemChat "1=Move (more to come)";
				VAHCO_groupSelectBool = false;
				VAHCO_orderSelectBool = true;
			};
			if (RGG_Grp_Num == 2) then {
				systemChat "DEBUG - GROUP 2 SELECTED";
				systemChat "you addressed group:";
				systemChat str VAHCO_groupSelect;
				sleep 2;
				systemChat "What orders sir?";
				systemChat "1=Move (more to come)";
				VAHCO_groupSelectBool = false;
				VAHCO_orderSelectBool = true;
			};
		};
	};

	// confirm type of order to issue (currently only one type - move)
	if (VAHCO_orderSelectBool) then {
		if (VAHCO_Validate_Orders == 1) then {
			systemChat "DEBUG ORDERS CONFIRMED";
			systemChat "Move command received";
			systemChat "Please confirm distance and heading Sir";
			systemChat "Distance first";
			// systemChat str VAHCO_groupSelect;
			VAHCO_orderSelectBool = false;
			VAHCO_distanceBool = true;
		};
	};

	// confirm distance to move
	if (VAHCO_distanceBool) then {
		if (VAHCO_Validate_distance == 4) then {
			systemChat "Distance Confirmed, please confirm direction";
			// systemChat str VAHCO_groupSelect;
			VAHCO_distanceBool = false;
			VAHCO_headingBool = true;
		};
	};

	// confirm distance to move
	if (VAHCO_headingBool) then {
		if (VAHCO_Validate_heading == 3) then {
			systemChat "Heading Confirmed, we are oscar mike...";
			// systemChat str VAHCO_groupSelect;
			VAHCO_headingBool = false;
			VAHCO_OscarMikeBool = true;
		};
	};

	// Oscar Mike
	if (VAHCO_OscarMikeBool) then {
		execVM "voiceActivatedHighCommandOrders\VAHCO_OscarMike.sqf";
		// systemChat "DEBUG CALLING OSCARMIKE.SFQ";
	};
		
	sleep 0.1;
};	
	