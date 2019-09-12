/*
from:		voiceactivatedPlanningSystem\initialiseVAPS.sqf 
to:			voiceactivatedPlanningSystem\VAPS_createObjectives.sqf
to:			voiceActivatedVehicleSpawner\VAPS_clearKeyDowns.sqf
to: 		voiceActivatedVehicleSpawner\initialiseVAPS.sqf

purpose:
loop-listener that validates user input, and changes state at correct times 
Enables: setting of objective points, staging points, and route creation

notes:

states:
VAPS_Order_Type_Bool		
VAPS_Obj_Type_Bool	  	// removed		
VAPS_Lat_Bool			// removed 		
VAPS_Lon_Bool			// removed		
VAPS_Confirm_Bool	
^^ not complete!

inputs:
TBC
*/

while {VAPS_numericalInputbool} do {

	// counts / validates the correct numbers are held in each array
	// exp - using locals for the validation 

	_val_VAPS_Order_Type	= count VAPS_Order_Type; 	// holds 1 // 1 = set primary, 2 = set secondary, // TBD >> 3 = set waypoints. 4 = set battle plan 
	_val_VAPS_Route_Type	= count VAPS_RouteSelect;	// holds 1 // 1 = red, 2 = green, 3 = blue, 4 = yellow, 5 = white
	_val_VAPS_Lat			= count VAPS_Lat; 			// holds 5
	_val_VAPS_Lon			= count VAPS_Lon; 			// holds 5
	_val_VAPS_Confirm		= count VAPS_Confirm; 		// holds 1 // 1 = confirm, 2 = cancel 

// VAPS_Order_Type 1 = set primary objective, 2 = set secondary objective -------------------------------------------------------------------------------------------------------------
	if (VAPS_Order_Type_Bool) then {
	
		if (_val_VAPS_Order_Type == 1) then {

			_content = VAPS_Order_Type select 0; // 1 = set primary, 2 = set secondary, 3 = stage stage 1, 4 = stage 2 // TBD >> 5 = create route, 6 = set battle plan 

			if (_content == 1) then {
				systemChat "you are setting the Primary Objective";
				// UI goes here
				VAPS_Order_Type_Bool 	= false;
				VAPS_mapClick 			= true;
			};

			if (_content == 2) then {
				systemChat "you are setting the Secondary Objective";
				// UI goes here
				VAPS_Order_Type_Bool 	= false;
				VAPS_mapClick 			= true;
			};
			if (_content == 3) then {
				systemChat "you are setting the Main Staging Zone";
				// UI goes here
				VAPS_Order_Type_Bool 	= false;
				VAPS_mapClick 			= true;
			};

			if (_content == 4) then {
				systemChat "you are setting the Secondary Staging Zone";
				// UI goes here
				VAPS_Order_Type_Bool 	= false;
				VAPS_mapClick 			= true;
			};

			if (_content == 5) then {
				systemChat "you are creating a route";
				systemChat "which colour? Red, Green, Blue, Orange or white?";
				// UI goes here
				VAPS_Order_Type_Bool 	= false;
				VAPS_RouteSelect_Bool 	= true;
			};

			// state progress
			// VAPS_Order_Type_Bool = false;
			// VAPS_Lat_Bool = true;
			// VAPS_mapClick = true;
			// systemChat "Please Enter Latitude (4 digits)";
		};
	};

	if (VAPS_RouteSelect_Bool) then {

		if (_val_VAPS_Route_Type == 1) then {

			_content = VAPS_RouteSelect select 0; // 1 = red, 2 = green, 3 = blue, 4 = yellow, 5 = white

			if (_content == 1) then {
				systemChat "you are creating the Red Route";
				// UI goes here
			};

			if (_content == 2) then {
				systemChat "you are creating the Green Route";
				// UI goes here
			};

			if (_content == 3) then {
				systemChat "you are creating the Blue Route";
				// UI goes here
			};

			if (_content == 4) then {
				systemChat "you are creating the Yellow Route";
				// UI goes here
			};

			if (_content == 5) then {
				systemChat "you are creating the White Route";
				// UI goes here
			};
				
			VAPS_RouteSelect_Bool 	= false;
			VAPS_mapClick 			= true;
		};
	};


	if (VAPS_mapClick) then {
		// systemChat "mapClick on";
		_content = VAPS_Order_Type select 0; // 1 = set primary, 2 = set secondary, 3 = stage stage 1, 4 = stage 2, 5 = set route // TBD >>  6 = set battle plan 
		if (_content == 1) then {
			onMapSingleClick {
				deleteMarker "primaryObj";
				_marker1 = createMarker ["primaryObj", _pos];
				_marker1 setMarkerShapeLocal "ELLIPSE";
				_marker1 setMarkerColorLocal "ColorRed";
				_marker1 setMarkerSizeLocal [100, 100];
				_marker1 setMarkerAlphaLocal 0.9;

				VAPS_mapClick = false;
				VAPS_numericalInputbool = false;
				execVM "voiceActivatedPlanningSystem\VAPS_clearKeyDowns.sqf";
				execVM "voiceActivatedPlanningSystem\initialiseVAPS.sqf";
			};
		};

		if (_content == 2) then {
			onMapSingleClick {
				deleteMarker "secondaryObj";
				_marker1 = createMarker ["secondaryObj", _pos];
				_marker1 setMarkerShapeLocal "ELLIPSE";
				_marker1 setMarkerColorLocal "ColorRed";
				_marker1 setMarkerSizeLocal [70, 70];
				_marker1 setMarkerAlphaLocal 0.9;

				VAPS_mapClick = false;
				VAPS_numericalInputbool = false;
				execVM "voiceActivatedPlanningSystem\VAPS_clearKeyDowns.sqf";
				execVM "voiceActivatedPlanningSystem\initialiseVAPS.sqf";
			};
		};

		if (_content == 3) then {
			onMapSingleClick {
				deleteMarker "primaryStage";
				_marker1 = createMarker ["primaryStage", _pos];
				_marker1 setMarkerShapeLocal "ELLIPSE";
				_marker1 setMarkerColorLocal "ColorBlue";
				_marker1 setMarkerSizeLocal [50, 50];
				_marker1 setMarkerAlphaLocal 0.9;

				VAPS_mapClick = false;
				VAPS_numericalInputbool = false;
				execVM "voiceActivatedPlanningSystem\VAPS_clearKeyDowns.sqf";
				execVM "voiceActivatedPlanningSystem\initialiseVAPS.sqf";
			};
		};

		if (_content == 4) then {
			onMapSingleClick {
				deleteMarker "secondaryStage";
				_marker1 = createMarker ["secondaryStage", _pos];
				_marker1 setMarkerShapeLocal "ELLIPSE";
				_marker1 setMarkerColorLocal "ColorGreen";
				_marker1 setMarkerSizeLocal [50, 50];
				_marker1 setMarkerAlphaLocal 0.9;
				VAPS_mapClick = false;
				VAPS_numericalInputbool = false;
				execVM "voiceActivatedPlanningSystem\VAPS_clearKeyDowns.sqf";
				execVM "voiceActivatedPlanningSystem\initialiseVAPS.sqf";
			};
		};

		if (_content == 5) then {

			_route = VAPS_RouteSelect select 0; // 1 = red, 2 = green, 3 = blue, 4 = yellow, 5 = white

			if (_route == 1) then {
				systemChat "you are now setting the Red Route";

				onMapSingleClick {
					_marker = "Markername" + (str _pos);
					createMarker [_marker,_pos];
					/*
					createMarker [str _pos, _pos];
					*/
					// deleteMarker "tempRed";
					_marker1 = createMarker ["_marker", _pos];
					_marker1 setMarkerShapeLocal "ELLIPSE";
					_marker1 setMarkerColorLocal "ColorRed";
					_marker1 setMarkerSizeLocal [10, 10];
					_marker1 setMarkerAlphaLocal 0.7;
					VAPS_RedWP pushback _pos;

					// I am hoping that the map clicks can continue, and when done, pressing 1 will close the system
					VAPS_Confirm_Bool = true;

				// VAPS_mapClick = false;
				// VAPS_numericalInputbool = false;
				// execVM "voiceActivatedPlanningSystem\VAPS_clearKeyDowns.sqf";
				// execVM "voiceActivatedPlanningSystem\initialiseVAPS.sqf";
				};
				// UI goes here
			};

			if (_route == 2) then {
				systemChat "you are setting the Green Route";
				// UI goes here
			};

			if (_route == 3) then {
				systemChat "you are setting the Blue Route";
				// UI goes here
			};

			if (_route == 4) then {
				systemChat "you are setting the Yellow Route";
				// UI goes here
			};

			if (_route == 5) then {
				systemChat "you are creating the White Route";
				// UI goes here
			};

			VAPS_Confirm_Bool = true;

		};

	}; // end of state phase 









	if (VAPS_Confirm_Bool) then {
	
		if (_val_VAPS_Confirm == 1) then {

			_content = VAPS_Confirm select 0; // 1 = confirm, 2 = cancel

			if (_content == 1) then {

				_content2 = VAPS_Order_Type select 0; // 1 = confirm primary, 2 = confirm secondary, 3 = set waypoints // TBD >> 4 = set battle plan 

				if (_content2 == 1) then {
					systemChat "you have set your Primary Objective";
					execVM "voiceActivatedPlanningSystem\VAPS_createObjectives.sqf";
					// UI goes here
				};

				if (_content2 == 2) then {
					systemChat "you have set your Secondary Objective";
					execVM "voiceActivatedPlanningSystem\VAPS_createObjectives.sqf";
					// UI goes here
				};

				if (_content2 == 3) then {
					systemChat "you have set your Primary Staging Zone";
					execVM "voiceActivatedPlanningSystem\VAPS_createObjectives.sqf";
					// UI goes here
				};

				if (_content2 == 4) then {
					systemChat "you have set your Secondary Staging Zone";
					execVM "voiceActivatedPlanningSystem\VAPS_createObjectives.sqf";
					// UI goes here
				};

				if (_content2 == 5) then {
					systemChat "you have set your Route";
					VAPS_mapClick = false;
					// UI goes here
				};

				// state progression completed
				VAPS_Confirm_Bool = false;
				VAPS_numericalInputbool = false;
				// create the payload 
				execVM "voiceActivatedPlanningSystem\VAPS_clearKeyDowns.sqf";
				execVM "voiceActivatedPlanningSystem\initialiseVAPS.sqf";
			} else {
				// state progression completed
				VAPS_Confirm_Bool = false;
				VAPS_numericalInputbool = false;

				// clean up and reset 
				execVM "voiceActivatedPlanningSystem\VAPS_clearKeyDowns.sqf";
				execVM "voiceActivatedPlanningSystem\initialiseVAPS.sqf";
			};
		};
	};

	sleep 0.1;
};


// --------------------------------------------------------------------------------------------------------
/* 

I removed using lats and longs, but here is the state code if I ever need it again:

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
	};