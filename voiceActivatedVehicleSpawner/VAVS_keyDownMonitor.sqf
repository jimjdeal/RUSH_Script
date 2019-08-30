/*
from:	voiceActivatedVehicleSpawner\initialiseVAVS.sqf
to:		voiceActivatedVehicleSpawner\VAVS_createVics.sqf
to:		voiceActivatedVehicleSpawner\VAVS_clearKeyDowns.sqf
to: 	voiceActivatedVehicleSpawner\initialiseVAVS.sqf

purpose:
loop-listener that validates user input, and changes state at correct times 
when all entries have been made, the script will either progress to spawner, or cancel / reboot 

notes:

States:
VAVS_vicTypeBool
VAVS_carTypeBool
VAVS_IFV_TypeBool
VAVS_MRAP_Type_Bool
VAVS_LSV_Type_Bool
VAVS_MBT_Type_Bool
VAVS_HEMTT_Type_Bool
VAVS_Other_Type_Bool
VAVS_Basic_Camo_Bool
VAVS_Ext_Camo_Bool
VAVS_No_Of_Units_Bool
VAVS_confirmBool

inputs:
VAVS_vicType 			1 = car, 		2 = heli
VAVS_carType 			1 = IFV, 		2 = MRAP, 			3 = LSV, 			4 = MTB, 			5 = HEMTT, 			6 = Other, 			7 = RHS, 			8 = Custom
VAVS_IFV_Type 			1 = Panther, 	2 = Cheetah, 		3 = Bobcat, 		4 = Marshall, 		5 = Gorgon
VAVS_MRAP_Type 			1 = Hunter, 	2 = Hunter GMG, 	3 = Hunter HMG 
VAVS_LSV_Type 			1 = Prowler, 	2 = Prowler Light, 	3 = Prowler HMG, 	4 = Prowler AT 
VAVS_MBT_Type 			1 = Slammer, 	2 = Slammer UP, 	3 = Scorcher, 		4 = Sandstorm 
VAVS_HEMTT_Type			1 = Basic, 		2 = Box Transport, 	3 = Trans Covered, 	4 = Trans Open, 	5 = Repair, 		6 = Ammo, 			7 = Fuel, 			8 = Medical
VAVS_Other_Type			1 = Quad Bike, 	2 = Offroad HMG, 	3 = Offroad AT, 	4 = Offroad Repair, 5 = Offroad
VAVS_Basic_Camo			1 = Altis, 		2 = Tanoa 
VAVS_Ext_Camo 			1 = Altis, 		2 = Tanoa, 			3 = Altis Black, 	4 = Tanoa Black, 	5 = Altis Olive, 	6 = Tanoa Olive, 	7 = Altis Sand, 	8 = Tanoa Sand, 9 = CRTG
VAVS_No_Of_Units 		1 = 1, 			2 = 2, 				3 = 3, 				4 = 4, 				5 = 5
VAVS_confirm 			1 = yes, 		2 = no
*/

while {VAVS_numericalInputbool} do {

	val_VAVS_vicType		= count VAVS_vicType;
	val_VAVS_carType		= count VAVS_carType;
	val_VAVS_IFV_Type		= count VAVS_IFV_Type;
	val_VAVS_MRAP_Type		= count VAVS_MRAP_Type;
	val_VAVS_LSV_Type		= count VAVS_LSV_Type;
	val_VAVS_MBT_Type		= count VAVS_MBT_Type;
	val_VAVS_HEMTT_Type		= count VAVS_HEMTT_Type;
	val_VAVS_Other_Type		= count VAVS_Other_Type;
	val_VAVS_Basic_Camo		= count VAVS_Basic_Camo;
	val_VAVS_Ext_Camo		= count VAVS_Ext_Camo;
	val_VAVS_No_Of_Units	= count VAVS_No_Of_Units;
	val_VAVS_confirm 		= count VAVS_confirm;


	// VAVS_vicType 1 = car, 2 = heli
	if (VAVS_vicTypeBool) then {

		if (val_VAVS_vicType == 1) then {

			_content = VAVS_vicType select 0;

			if (_content == 1) then {
				systemChat "you selected ground vehicles";
				systemChat "Select: 1 = IFV, 2 = MRAP, 3 = LSV, 4 = MTB, 5 = HEMTT, 6 = Other, 7 = RHS TBD, 8 = Custom TBD";
				VAVS_vicTypeBool = false;
				VAVS_carTypeBool = true;
			};

			if (_content == 2) then {
				systemChat "you selected helis";
				VAVS_vicTypeBool = false;
				// need to complete heli paths from here
			};
		};
	};

	// VAVS_carType 1 = IFV, 2 = MRAP, 3 = LSV, 4 = MTB, 5 = HEMTT, 6 = Other, 	7 = RHS, 8 = Custom
	if (VAVS_carTypeBool) then {

		if (val_VAVS_carType == 1) then {

			_content = VAVS_carType select 0;

			if (_content == 1) then {
				systemChat "you selected IFV";
				systemChat "Select: 1 = Panther, 2 = Cheetah, 3 = Bobcat, 4 = Marshall, 5 = Gorgon";
				VAVS_carTypeBool = false;
				VAVS_IFV_TypeBool = true;
			};
			if (_content == 2) then {
				systemChat "you selected MRAP";
				systemChat "VAVS_MSelect:RAP_Type 1 = Hunter, 2 = Hunter GMG, 3 = Hunter HMG ";
				VAVS_carTypeBool = false;
				VAVS_MRAP_Type_Bool = true;
			};
			if (_content == 3) then {
				systemChat "you selected LSV";
				systemChat "Select: 1 = Prowler, 2 = Prowler Light, 3 = Prowler HMG, 4 = Prowler AT ";
				VAVS_carTypeBool = false;
				VAVS_LSV_Type_Bool = true;
			};
			if (_content == 4) then {
				systemChat "you selected MBT";
				systemChat "Select: 1 = Slammer, 2 = Slammer UP, 3 = Scorcher, 4 = Sandstorm ";
				VAVS_carTypeBool = false;
				VAVS_MBT_Type_Bool = true;
			};
			if (_content == 5) then {
				systemChat "you selected HEMTT";
				systemChat "Select: 1 = Basic, 2 = Box Transport, 3 = Trans Covered, 4 = Trans Open, 5 = Repair, 6 = Ammo, 7 = Fuel, 8 = Medical";
				VAVS_carTypeBool = false;
				VAVS_HEMTT_Type_Bool = true;
			};
			if (_content == 6) then {
				systemChat "you selected Other";
				systemChat "Select:	1 = Quad Bike, 2 = Offroad HMG, 3 = Offroad AT, 4 = Offroad Repair, 5 = Offroad";
				VAVS_carTypeBool = false;
				VAVS_Other_Type_Bool = true;
			};
			if (_content == 7) then {
				systemChat "you selected RHS";
				VAVS_carTypeBool = false;
				// needs to be completed!
			};
			if (_content == 8) then {
				systemChat "you selected Custom";
				VAVS_carTypeBool = false;
				// needs to be completed!
			};
		};
	};

	// VAVS_IFV_Type 1 = Panther, 2 = Cheetah, 3 = Bobcat, 4 = Marshall, 5 = Gorgon
	if (VAVS_IFV_TypeBool) then {

		if (val_VAVS_IFV_Type == 1) then {

			_content = VAVS_IFV_Type select 0;

			if (_content == 1) then {
				systemChat "you selected Panther";
			};
			if (_content == 2) then {
				systemChat "you selected Cheetah";
			};
			if (_content == 3) then {
				systemChat "you selected Bobcat";
			};
			if (_content == 4) then {
				systemChat "you selected Marshall";
			};
			if (_content == 5) then {
				systemChat "you selected Gorgon";
			};

			systemChat "Select:	1 = Altis, 2 = Tanoa";

			VAVS_IFV_TypeBool = false;
			VAVS_Ext_Camo_Bool = true;
		};
	};

	// VAVS_MRAP_Type 1 = Hunter, 2 = Hunter GMG, 3 = Hunter HMG 
	if (VAVS_MRAP_Type_Bool) then {

		if (val_VAVS_MRAP_Type == 1) then {

			_content = VAVS_MRAP_Type select 0;
			
			if (_content == 1) then {
				systemChat "you selected Hunter";
				VAVS_carTypeBool = false;
				VAVS_IFV_TypeBool = true;
			};
			if (_content == 2) then {
				systemChat "you selected Hunter GMG";
				VAVS_carTypeBool = false;
				VAVS_MRAP_Type_Bool = true;
			};
			if (_content == 3) then {
				systemChat "you selected Hunter HMG";
				VAVS_carTypeBool = false;
				VAVS_LSV_Type_Bool = true;
			};

			systemChat "Select: 1 = Altis, 2 = Tanoa";

			VAVS_MRAP_Type_Bool = false;
			VAVS_Basic_Camo_Bool = true;
		};
	};

	// VAVS_LSV_Type 1 = Prowler, 2 = Prowler Light, 3 = Prowler HMG, 4 = Prowler AT 
	if (VAVS_LSV_Type_Bool) then {

		if (val_VAVS_LSV_Type == 1) then {

			_content = VAVS_LSV_Type select 0;
			
			if (_content == 1) then {
				systemChat "you selected Prowler";
			};
			if (_content == 2) then {
				systemChat "you selected Prowler Light";
			};
			if (_content == 3) then {
				systemChat "you selected Prowler HMG";
			};
			if (_content == 4) then {
				systemChat "you selected Prowler AT";
			};

			systemChat "Select: 1 = Altis, 2 = Tanoa, 3 = Altis Black, 4 = Tanoa Black, 5 = Altis Olive, 6 = Tanoa Olive, 7 = Altis Sand, 8 = Tanoa Sand, 9 = CRTG";
			VAVS_LSV_Type_Bool = false;
			VAVS_Ext_Camo_Bool = true;
		};
	};

	// VAVS_MBT_Type 1 = Slammer, 2 = Slammer UP, 3 = Scorcher, 4 = Sandstorm 
	if (VAVS_MBT_Type_Bool) then {

		if (val_VAVS_MBT_Type == 1) then {

			_content = VAVS_MBT_Type select 0;


			if (_content == 1) then {
				systemChat "you selected Slammer";
			};
			if (_content == 2) then {
				systemChat "you selected Slammer UP";
			};
			if (_content == 3) then {
				systemChat "you selected Scorcher";
			};
			if (_content == 4) then {
				systemChat "you selected Sandstorm";
			};

			systemChat "Select:	1 = Altis, 2 = Tanoa";

			VAVS_MBT_Type_Bool = false;
			VAVS_Basic_Camo_Bool = true;
		};
	};

	// VAVS_HEMTT_Type 1 = Basic, 2 = Box Transport, 3 = Trans Covered, 4 = Trans Open, 5 = Repair, 6 = Ammo, 7 = Fuel, 8 = Medical
	if (VAVS_HEMTT_Type_Bool) then {

		if (val_VAVS_HEMTT_Type == 1) then {

			_content = VAVS_HEMTT_Type select 0;

			if (_content == 1) then {
				systemChat "you selected Basic";
			};
			if (_content == 2) then {
				systemChat "you selected Box Transport";
			};
			if (_content == 3) then {
				systemChat "you selected Transort (Covered)";
			};
			if (_content == 4) then {
				systemChat "you selected Transport (Open)";
			};
			if (_content == 5) then {
				systemChat "you selected Repair";
			};
			if (_content == 6) then {
				systemChat "you selected Ammo";
			};
			if (_content == 7) then {
				systemChat "you selected Fuel";
			};
			if (_content == 8) then {
				systemChat "you selected Medical";
			};

			systemChat "Select:	1 = Altis, 2 = Tanoa";

			VAVS_HEMTT_Type_Bool = false;
			VAVS_Basic_Camo_Bool = true;
		};
	};

	// VAVS_Other_Type	1 = Quad Bike, 2 = Offroad HMG, 3 = Offroad AT, 4 = Offroad Repair, 5 = Offroad
	if (VAVS_Other_Type_Bool) then {

		if (val_VAVS_Other_Type == 1) then {

			_content = VAVS_Other_Type select 0;

			if (_content == 1) then {
				systemChat "you selected Quad Bike";
			};
			if (_content == 2) then {
				systemChat "you selected Offroad HMG";
			};
			if (_content == 3) then {
				systemChat "you selected Offroad AT";
			};
			if (_content == 4) then {
				systemChat "you selected Offroad Repair";
			};
			if (_content == 5) then {
				systemChat "you selected Offroad";
			};

			systemChat "Select:	1 = Altis, 2 = Tanoa";

			VAVS_Other_Type_Bool = false;
			VAVS_Basic_Camo_Bool = true;

		};
	};

	// VAVS_Basic_Camo	1 = Altis, 2 = Tanoa 
	if (VAVS_Basic_Camo_Bool) then {

		if (val_VAVS_Basic_Camo == 1) then {

			_content = VAVS_Basic_Camo select 0;

			if (_content == 1) then {
				systemChat "you selected Altis Camo";
			};
			if (_content == 2) then {
				systemChat "you selected Tanoa Camo";
			};

			systemChat "Select: 1 -5 for units to create";

			VAVS_Basic_Camo_Bool = false;
			VAVS_No_Of_Units_Bool = true;
		};
	};

	// VAVS_Ext_Camo 1 = Altis, 2 = Tanoa, 3 = Altis Black, 4 = Tanoa Black, 5 = Altis Olive, 6 = Tanoa Olive, 7 = Altis Sand, 8 = Tanoa Sand, 9 = CRTG
	if (VAVS_Ext_Camo_Bool) then {

		if (val_VAVS_Ext_Camo == 1) then {

			_content = VAVS_Ext_Camo select 0;

			if (_content == 1) then {
				systemChat "you selected Altis Camo";
			};
			if (_content == 2) then {
				systemChat "you selected Tanoa Camo";
			};
			if (_content == 3) then {
				systemChat "you selected Altis Black";
			};
			if (_content == 4) then {
				systemChat "you selected Tanoa Black";
			};
			if (_content == 5) then {
				systemChat "you selected Altis Olive";
			};
			if (_content == 6) then {
				systemChat "you selected Tanoa Olive";
			};			
			if (_content == 7) then {
				systemChat "you selected Altis Sand";
			};
			if (_content == 8) then {
				systemChat "you selected Tanoa Sand";
			};
			if (_content == 9) then {
				systemChat "you selected CRTG";
			};

			systemChat "Select: 1 -5 for units to create";

			VAVS_Ext_Camo_Bool = false;
			VAVS_No_Of_Units_Bool = true;
		};
	};

	// VAVS_No_Of_Units 		1 = 1, 			2 = 2, 				3 = 3, 				4 = 4, 				5 = 5
	if (VAVS_No_Of_Units_Bool) then {

		if (val_VAVS_No_Of_Units == 1) then {

			_content = VAVS_No_Of_Units select 0;

			if (_content == 1) then {
				systemChat "you ordered 1 unit";
			};
			if (_content == 2) then {
				systemChat "you ordered 2 unit";
			};
			if (_content == 3) then {
				systemChat "you ordered 3 unit";
			};
			if (_content == 4) then {
				systemChat "you ordered 4 unit";
			};
			if (_content == 5) then {
				systemChat "you ordered 5 unit";
			};

			systemChat "select 1 to confirm, or 2 to cancel";
			
			VAVS_No_Of_Units_Bool = false;
			VAVS_confirmBool = true;
		};
	};

	// VAVS_confirm 			1 = yes, 		2 = no
	if (VAVS_confirmBool) then {

		if (val_VAVS_confirm == 1) then {

			// 8 cutRsc ["VAUS_CONFIRMCANCEL","PLAIN"];
			// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONFIRMCANCEL")};
			// _display = uiNameSpace getVariable "VAUS_CONFIRMCANCEL";
			// _setText = _display displayCtrl 10007;
			// _setText ctrlSetStructuredText (parseText format ["CONFIRM / CANCEL"]);
			// _setText ctrlSetBackgroundColor [0,0,0,0.5];

			_content = VAVS_confirm select 0; 

			if (_content == 1) then {
				systemChat "selection has been completed - thank you";
				sleep 0.5;
				VAVS_confirmBool = false;

				

				[] execVM "voiceActivatedVehicleSpawner\VAVS_createVics.sqf";
			};

			if (_content == 2) then {
				systemChat "selection has been cancelled - standing down";
				sleep 0.5;
				VAUS_confirmBool = false;
				execVM "voiceActivatedVehicleSpawner\VAVS_clearKeyDowns.sqf";
				execVM "voiceActivatedVehicleSpawner\initialiseVAVS.sqf";
			};
		};
	};

	sleep 0.1;
	// systemChat "cycle monitor";
};
