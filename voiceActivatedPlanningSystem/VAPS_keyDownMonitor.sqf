/*
from:		voiceactivatedPlanningSystem\initialiseVAPS.sqf 
to:			voiceactivatedPlanningSystem\VAPS_createObjectives.sqf
to:			voiceActivatedVehicleSpawner\VAPS_clearKeyDowns.sqf
to: 		voiceActivatedVehicleSpawner\initialiseVAPS.sqf

purpose:
loop-listener that validates user input, and changes state at correct times 

notes:

states:
VAPS_Order_Type_Bool		
VAPS_Obj_Type_Bool	  // removed		
VAPS_Lat_Bool				
VAPS_Lon_Bool				
VAPS_Confirm_Bool	

inputs:
TBC
*/

while {VAPS_numericalInputbool} do {

	// counts / validates the correct numbers are held in each array
	// exp - using locals for the validation 

	_val_VAPS_Order_Type	= count VAPS_Order_Type; 	// holds 1 // 1 = set primary, 2 = set secondary, // TBD >> 3 = set waypoints. 4 = set battle plan 
	_val_VAPS_Lat			= count VAPS_Lat; 			// holds 5
	_val_VAPS_Lon			= count VAPS_Lon; 			// holds 5
	_val_VAPS_Confirm		= count VAPS_Confirm; 		// holds 1 // 1 = confirm, 2 = cancel 

// VAPS_Order_Type 1 = set primary objective, 2 = set secondary objective -------------------------------------------------------------------------------------------------------------
	if (VAPS_Order_Type_Bool) then {
	
		if (_val_VAPS_Order_Type == 1) then {

			_content = VAPS_Order_Type select 0; // 1 = set primary, 2 = set secondary, 3 = stage stage 1, 4 = stage 2 // TBD >> 5 = set waypoints. 6 = set battle plan 

			if (_content == 1) then {
				systemChat "you are setting the Primary Objective";
				// UI goes here
			};

			if (_content == 2) then {
				systemChat "you are setting the Secondary Objective";
				// UI goes here
			};
			if (_content == 3) then {
				systemChat "you are setting the Main Staging Zone";
				// UI goes here
			};

			if (_content == 4) then {
				systemChat "you are setting the Secondary Staging Zone";
				// UI goes here
			};

			// state progress
			VAPS_Order_Type_Bool = false;
			VAPS_Lat_Bool = true;
			systemChat "Please Enter Latitude (4 digits)";

		};
	};

	if (VAPS_Lat_Bool) then {
	
		if (_val_VAPS_Lat == 5) then {

			systemChat "Latitude reveived, now confirm Longitude";

			// state progress
			VAPS_Lat_Bool = false;
			VAPS_Lon_Bool = true;

		};
	};

	if (VAPS_Lon_Bool) then {
	
		if (_val_VAPS_Lon == 5) then {

			systemChat "Longiture reveived";
			systemChat "confirm or cancel ojb setting";

			// state progress
			VAPS_Lon_Bool = false;
			VAPS_Confirm_Bool = true;

		};
	};//

	if (VAPS_Confirm_Bool) then {
	
		if (_val_VAPS_Confirm == 1) then {

			_content = VAPS_Confirm select 0; // 1 = confirm, 2 = cancel

			if (_content == 1) then {

				_content2 = VAPS_Order_Type select 0; // 1 = confirm primary, 2 = confirm secondary, // TBD >> 3 = set waypoints. 4 = set battle plan 

				if (_content2 == 1) then {
					systemChat "you have set your Primary Objective";
					// UI goes here
				};

				if (_content2 == 2) then {
					systemChat "you have set your Secondary Objective";
					// UI goes here
				};

				if (_content2 == 3) then {
					systemChat "you have set your Primary Staging Zone";
					// UI goes here
				};

				if (_content2 == 4) then {
					systemChat "you have set your Secondary Staging Zone";
					// UI goes here
				};

				// state progression completed
				VAPS_Confirm_Bool = false;

				// create the payload 
				execVM "voiceActivatedPlanningSystem\VAPS_createObjectives.sqf";
			} else {
				// state progression completed
				VAPS_Confirm_Bool = false;

				// clean up and reset 
				execVM "voiceActivatedPlanningSystem\VAPS_clearKeyDowns.sqf";
				execVM "voiceActivatedPlanningSystem\initialiseVAPS.sqf";
			};
		};
	};

	sleep 0.1;

};
