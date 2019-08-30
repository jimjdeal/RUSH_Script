/*
from:	voiceActivatedVehicleSpawner\initialiseVAVS.sqf
to:		voiceActivatedVehicleSpawner\VAVS??
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
VAVS_vicType 			1 = car, 2 = heli
VAVS_carType 			1 = IFV, 2 = MRAP, 3 = LSV, 4 = MTB, 5 = HEMTT, 6 = Other, 7 = RHS, 8 = Custom
VAVS_IFV_Type 			1 = Panther, 2 = Cheetah, 3 = Bobcat, 4 = Marshall, 5 = Gorgon
VAVS_MRAP_Type 			1 = Hunter, 2 = Hunter GMG, 3 = Hunter HMG 
VAVS_LSV_Type 			1 = Prowler, 2 = Prowler Light, 3 = Prowler HMG, 4 = Prowler AT 
VAVS_MBT_Type 			1 = Slammer, 2 = Slammer UP, 3 = Scorcher, 4 = Sandstorm 
VAVS_HEMTT_Type			1 = Basic, 2 = Box Transport, 3 = Trans Covered, 4 = Trans Open, 5 = Repair, 6 = Ammo, 7 = Fuel, 8 = Medical
VAVS_Other_Type			1 = Quad Bike, 2 = Offroad HMG, 3 = Offroad AT, 4 = Offroad Repair, 5 = Offroad
VAVS_Basic_Camo			1 = Altis, 2 = Tanoa 
VAVS_Ext_Camo 			1 = Altis, 2 = Tanoa, 3 = Altis Black, 4 = Tanoa Black, 5 = Altis Olive, 6 = Tanoa Olive, 7 = Altis Sand, 8 = Tanoa Sand, 9 = CRTG
VAVS_No_Of_Units 		1 = 1, 2 = 2, 3 = 3, 4 = 4, 5 = 5
VAVS_confirm 			1 = yes, 2 = no
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

	// VAVS_confirmedControl	= count VAUS_control; 	// should hold 1 value, specifying whether direct control or HC 
	// VAVS_confirmedGroup		= count VAUS_group; 	// should hold 1 value, specifying type of team wanted 
	// VAVS_confirmedCamo 		= count VAUS_camo; 		// should hold 1 value, specifying which colour camo is wanted 
	// VAVS_confirmedConfirm	= count VAUS_confirm;	// should hold 1 value, spacifying whether player wants to create or cancel instruction

	// VAVS_vicType 1 = car, 2 = heli
	if (VAVS_vicTypeBool) then {

		if (val_VAVS_vicType == 1) then {

			_content = VAVS_vicType select 0;

			if (_content == 1) then {
				systemChat "you selected ground vehicles";
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

	if (VAVS_carTypeBool) then {

		if (val_VAVS_carType == 1) then {

			_content = VAVS_carType select 0;

			if (_content == 1) then {
				systemChat "you selected IFV";
				VAVS_carTypeBool = false;
				VAVS_IFV_TypeBool = true;
			};
			if (_content == 2) then {
				systemChat "you selected MRAP";
				VAVS_carTypeBool = false;
				VAVS_MRAP_Type_Bool = true;
			};
			if (_content == 3) then {
				systemChat "you selected LSV";
				VAVS_carTypeBool = false;
				VAVS_LSV_Type_Bool = true;
			};
			if (_content == 4) then {
				systemChat "you selected MBT";
				VAVS_carTypeBool = false;
				VAVS_MBT_Type_Bool = true;
			};
			if (_content == 5) then {
				systemChat "you selected HEMTT";
				VAVS_carTypeBool = false;
				VAVS_HEMTT_Type_Bool = true;
			};
			if (_content == 6) then {
				systemChat "you selected Other";
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

			VAVS_IFV_TypeBool = false;
			VAVS_Ext_Camo_Bool = true;
		};
	};

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

			VAVS_MRAP_Type_Bool = false;
			VAVS_Basic_Camo_Bool = true;
		};
	};

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

			VAVS_LSV_Type_Bool = false;
			VAVS_Ext_Camo_Bool = true;
		};
	};

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

			VAVS_MBT_Type_Bool = false;
			VAVS_Basic_Camo_Bool = true;
		};
	};

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

			VAVS_HEMTT_Type_Bool = false;
			VAVS_Basic_Camo_Bool = true;
		};
	};

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

			VAVS_Other_Type_Bool = false;
			VAVS_Basic_Camo_Bool = true;

		};
	};

	if (VAVS_Basic_Camo_Bool) then {

		if (val_VAVS_Basic_Camo == 1) then {

			_content = VAVS_Basic_Camo select 0;

			if (_content == 1) then {
				systemChat "you selected Altis Camo";
			};
			if (_content == 2) then {
				systemChat "you selected Tanoa Camo";
			};

			VAVS_Basic_Camo_Bool = false;
			VAVS_No_Of_Units_Bool = true;
		};
	};

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

			VAVS_Ext_Camo_Bool = false;
			VAVS_No_Of_Units_Bool = true;
		};
	};

	if (VAVS_No_Of_Units_Bool) then {

		if (val_VAVS_No_Of_Units == 1) then {

			_content = VAVS_Ext_Camo select 0;

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

			VAVS_No_Of_Units_Bool = false;
			VAVS_confirmBool = true;
		};
	};

// stopped here












};


	// control type / DC or HC 
	if (VAUS_controlBool) then {

		if (VAUS_confirmedControl == 1) then {

			_controlType = VAUS_control select 0;

			if (_controlType == 1) then {
				// systemChat "you selected to have them under your direct control";
				// sleep 0.2;
				// systemChat "question 2 - what type of group do you want?";
				// systemChat "1 = fire team x 4, 	2 = full platoon x 20, 	3 = sniper team x 2";
				// systemChat "4 = at team x 3, 	5 = aa team x 3, 		6 = eng team x 2";
				// systemChat "7 = demo team x 2, 	8 = medic team x 4";
				50 cutRsc ["B18_L3_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L3_1")};
				_display = uiNameSpace getVariable "B18_L3_1";
				_setText = _display displayCtrl 18005;
				_setText ctrlSetStructuredText (parseText format ["DIRECT COMMAND"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];
				
				VAUS_controlBool = false;
				VAUS_groupBool = true;
			};

			if (_controlType == 2) then {
				// systemChat "you selected to have them as HC units";
				// sleep 0.2;
				// systemChat "question 2 - what type of group do you want?";
				// systemChat "1 = fire team x 4, 	2 = full platoon x 20, 	3 = sniper team x 2";
				// systemChat "4 = at team x 3, 	5 = aa team x 3, 		6 = eng team x 2";
				// systemChat "7 = demo team x 2, 	8 = medic team x 4";
			
				60 cutRsc ["B18_L4_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L4_1")};
				_display = uiNameSpace getVariable "B18_L4_1";
				_setText = _display displayCtrl 18011;
				_setText ctrlSetStructuredText (parseText format ["HIGH COMMAND"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];

				VAUS_controlBool = false;
				VAUS_groupBool = true;

				// does it cause an error if we are counting a non existant array, like it has not yet been created?
				// do we need a better way to register HC groups?
				// for now we remove group number validation, and just focus on getting the groups created!
				// _groupBlu1Count = count units group groupBlu1;
				// _groupBlu2Count = count units group groupBlu2;
				// _groupBlu3Count = count units group groupBlu3;
				// _groupBlu4Count = count units group groupBlu4;
				// _groupBlu5Count = count units group groupBlu5;
				// VAUS_activeGroups = _groupBlu1Count + _groupBlu2Count + _groupBlu3Count + _groupBlu4Count + _groupBlu5Count;

				// _allowHC = VAUS_activeGroups select 0;

				// if (_allowHC == 5) then {
				// 	systemChat "you have reached max groups, no more allowed";
				// 	sleep 1;
				// 	systemChat "closing spawner -- no HC for you";

					// 8 cutRsc ["VAUS_CONFIRMCANCEL","PLAIN"];
					// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONFIRMCANCEL")};
					// _display = uiNameSpace getVariable "VAUS_CONFIRMCANCEL";
					// _setText = _display displayCtrl 10007;
					// _setText ctrlSetStructuredText (parseText format ["CANCELLED"]);
					// _setText ctrlSetBackgroundColor [0,0,0,0.5];

					// execVM "voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf";
					// execVM "voiceActivatedUnitSpawner\initialiseVAUS.sqf";
				// };
			};
		};
	};

	// group type / DC or HC 
	if (VAUS_groupBool) then {

		// second prompt 
		210 cutRsc ["default","PLAIN"]; // remove first prompt
		211 cutRsc ["B18_BottomLine2","PLAIN"]; // second prompt 
		_display = uiNameSpace getVariable "B18_BottomLine2";
		_setText = _display displayCtrl 18023;
		_setText ctrlSetBackgroundColor [0,1,0,0.8];
		// _setText ctrlSetTextColor [0, 1, 0, 1];

		if (VAUS_confirmedGroup == 1) then {

			_groupType = VAUS_group select 0;

			if (_groupType == 1) then {
				// systemChat "you selected fire team";

				70 cutRsc ["B18_L3_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L3_2")};
				_display = uiNameSpace getVariable "B18_L3_2";
				_setText = _display displayCtrl 18006;
				_setText ctrlSetStructuredText (parseText format ["FIRE TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];
			};

			if (_groupType == 2) then {
				// systemChat "you selected full platoon";

				90 cutRsc ["B18_L3_3","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L3_3")};
				_display = uiNameSpace getVariable "B18_L3_3";
				_setText = _display displayCtrl 18007;
				_setText ctrlSetStructuredText (parseText format ["PLATOON"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
								_setText ctrlSetTextColor [0, 1, 0, 1];
			};

			if (_groupType == 3) then {
				// systemChat "you selected sniper team";

				110 cutRsc ["B18_L3_4","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L3_4")};
				_display = uiNameSpace getVariable "B18_L3_4";
				_setText = _display displayCtrl 18008;
				_setText ctrlSetStructuredText (parseText format ["SNIPER TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
								_setText ctrlSetTextColor [0, 1, 0, 1];
			};

			if (_groupType == 4) then {
				// systemChat "you selected AT team";

				130 cutRsc ["B18_L3_5","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L3_5")};
				_display = uiNameSpace getVariable "B18_L3_5";
				_setText = _display displayCtrl 18009;
				_setText ctrlSetStructuredText (parseText format ["AT TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
								_setText ctrlSetTextColor [0, 1, 0, 1];
			};

			if (_groupType == 5) then {
				// systemChat "you selected AA team";

				80 cutRsc ["B18_L4_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L4_2")};
				_display = uiNameSpace getVariable "B18_L4_2";
				_setText = _display displayCtrl 18012;
				_setText ctrlSetStructuredText (parseText format ["AA TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
								_setText ctrlSetTextColor [0, 1, 0, 1];
			};

			if (_groupType == 6) then {
				// systemChat "you selected eng team";

				100 cutRsc ["B18_L4_3","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L4_3")};
				_display = uiNameSpace getVariable "B18_L4_3";
				_setText = _display displayCtrl 18013;
				_setText ctrlSetStructuredText (parseText format ["ENG TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
								_setText ctrlSetTextColor [0, 1, 0, 1];
			};

			if (_groupType == 7) then {
				// systemChat "you selected demo team";

				120 cutRsc ["B18_L4_4","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L4_4")};
				_display = uiNameSpace getVariable "B18_L4_4";
				_setText = _display displayCtrl 18014;
				_setText ctrlSetStructuredText (parseText format ["DEMO TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
								_setText ctrlSetTextColor [0, 1, 0, 1];
			};

			if (_groupType == 8) then {
				// systemChat "you selected medic team";

				140 cutRsc ["B18_L4_5","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L4_5")};
				_display = uiNameSpace getVariable "B18_L4_5";
				_setText = _display displayCtrl 18015;
				_setText ctrlSetStructuredText (parseText format ["MEDIC TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];
			};
			
			sleep 0.2;

			// systemChat "question 3 - what camo is required?";
			// systemChat "1 = RHS Desert, 3 = Livonia Woodland";

			// here i put the 'progression bools' outside of the ifthens, but i also put them in each ifthen .. i wonder if it actually matters?
			// because if not, just use them once at the end.. DRY!
			VAUS_groupBool = false;
			VAUS_camoBool = true;
		};
	};
	
	// camo type / vanilla altis / rhs desert / livonian woodland
	if (VAUS_camoBool) then {

		// third prompt 
		211 cutRsc ["default","PLAIN"]; // remove second prompt
		212 cutRsc ["B18_BottomLine3","PLAIN"]; // third prompt 
		_display = uiNameSpace getVariable "B18_BottomLine3";
		_setText = _display displayCtrl 18024;
		_setText ctrlSetBackgroundColor [0,1,0,0.8];
		// _setText ctrlSetTextColor [0, 1, 0, 1];

		if (VAUS_confirmedCamo == 1) then {

			_camoType = VAUS_camo select 0;
			// if i rename Camo to, say, Specialism, it makes it easier to have camo act as a category 
			// and if I can make it so the user can define easily the names of the camo/specialism, as well as the number and configuration of the groups..
			// you give the player a load of customisation options, which would be useful..
			if (_camoType == 1) then {
				// systemChat "you selected vanilla camo";

				150 cutRsc ["B18_L3_6","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L3_6")};
				_display = uiNameSpace getVariable "B18_L3_6";
				_setText = _display displayCtrl 18010;
				_setText ctrlSetStructuredText (parseText format ["WOODLAND"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];

				VAUS_camoBool = false;
				VAUS_confirmBool = true;
			};

			if (_camoType == 2) then {
				// systemChat "you selected RHS Desert";

				160 cutRsc ["B18_L4_6","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L4_6")};
				_display = uiNameSpace getVariable "B18_L4_6";
				_setText = _display displayCtrl 18016;
				_setText ctrlSetStructuredText (parseText format ["DESERT"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];

				VAUS_camoBool = false;
				VAUS_confirmBool = true;
			};

			// if (_camoType == 3) then {
			// 	systemChat "you selected Livonian Woodland";
			// 	7 cutRsc ["VAUS_CONTENT_n3","PLAIN"];
			// 	waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n3")};
			// 	_display = uiNameSpace getVariable "VAUS_CONTENT_n3";
			// 	_setText = _display displayCtrl 10006;
			// 	_setText ctrlSetStructuredText (parseText format ["WOODLAND"]);
			// 	_setText ctrlSetBackgroundColor [0,0,0,0.5];
			// 	VAUS_camoBool = false;
			// 	VAUS_confirmBool = true;
			// };

			sleep 0.2;

			// systemChat "review your selection and confirm / cancel";
			// systemChat "1 = confirm, 2 = cancel";

		};
	};
//
	// confirm choice
	if (VAUS_confirmBool) then {

		212 cutRsc ["default","PLAIN"]; // remove third prompt
		213 cutRsc ["B18_BottomLine4","PLAIN"]; // third prompt 
		_display = uiNameSpace getVariable "B18_BottomLine4";
		_setText = _display displayCtrl 18025;
		_setText ctrlSetBackgroundColor [0,1,0,0.8];
		// _setText ctrlSetTextColor [0, 1, 0, 1];

		if (VAUS_confirmedConfirm == 1) then {

			// 8 cutRsc ["VAUS_CONFIRMCANCEL","PLAIN"];
			// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONFIRMCANCEL")};
			// _display = uiNameSpace getVariable "VAUS_CONFIRMCANCEL";
			// _setText = _display displayCtrl 10007;
			// _setText ctrlSetStructuredText (parseText format ["CONFIRM / CANCEL"]);
			// _setText ctrlSetBackgroundColor [0,0,0,0.5];

			_testConfirmType = VAUS_confirm select 0; // rename if this works!!!

			if (_testConfirmType == 1) then {
				// systemChat "selection has been completed - thank you";

				170 cutRsc ["B18_L5_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L5_1")};
				_display = uiNameSpace getVariable "B18_L5_1";
				_setText = _display displayCtrl 18017;
				_setText ctrlSetStructuredText (parseText format ["CONFIRM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];

				sleep 0.5;
				VAUS_confirmBool = false;
				[VAUS_control, VAUS_group, VAUS_camo] execVM "voiceActivatedUnitSpawner\VAUS_createUnits.sqf";
			};

			if (_testConfirmType == 2) then {
				// systemChat "selection has been cancelled - standing down";

				180 cutRsc ["B18_L5_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "B18_L5_2")};
				_display = uiNameSpace getVariable "B18_L5_2";
				_setText = _display displayCtrl 18018;
				_setText ctrlSetStructuredText (parseText format ["CANCEL"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
				_setText ctrlSetTextColor [0, 1, 0, 1];

				sleep 0.5;
				VAUS_confirmBool = false;
				execVM "voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf";
				execVM "voiceActivatedUnitSpawner\initialiseVAUS.sqf";
			};
		};
	};

	sleep 0.1;
	// systemChat "cycle monitor";
};
