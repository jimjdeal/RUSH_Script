/*
from:	voiceActivatedVehicleSpawner\initialiseVAVS.sqf
to:		voiceActivatedVehicleSpawner\VAVS_createVics.sqf
to:		voiceActivatedVehicleSpawner\VAVS_clearKeyDowns.sqf
to: 	voiceActivatedVehicleSpawner\initialiseVAVS.sqf

purpose:
loop-listener that validates user input, and changes state at correct times 
when all entries have been made, the script will either progress to spawner, or cancel / reboot 

notes:
01 Sept: 	
this is definately the most complex logic script, as it has a few layers, and also renders the UI step by step, which is a new thing for me. 
03 Sept: 	
I am tempted to remove all of the camo options for LSVs, and just use altis / tanoan .. for simplicity.
I will try to manage the repeated code blocks using functions, starting with camo. 
if this works, I will also apply to the choice of 6 classes at the beginning of the flow, as this is repeated, and so should be addressed.
6 camo UI blocks under the IFV thread have been replaced with functions.
Test: does IFV camo appear and work as before? If yes, successful.
04 sept:
Camo UI function seems to work, so i will try to apply to more elements here 


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
VAVS_No_Of_Units_Bool - removed
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
VAVS_confirm 			1 = yes, 		2 = no
*/

sleep 1.5;

// attempt to manage repeat renders via function 
/*
lines: 
panther selection 
cheetah selection 
bobcat selection
marshall selection  
gorgon Selection  
*/


// --------------------------------------------------------------------------------------------------
// UI functions 
// --------------------------------------------------------------------------------------------------

VAVS_show_HC_Groups = {
	// section header
	20 cutRsc ["D_L2_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L2_1")};
	_display = uiNameSpace getVariable "D_L2_1";
	_setText = _display displayCtrl 20010;
	_setText ctrlSetStructuredText (parseText format ["ALLOCATE HC GROUP"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 1
	30 cutRsc ["D_L3_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
	_display = uiNameSpace getVariable "D_L3_1";
	_setText = _display displayCtrl 20020;
	_setText ctrlSetStructuredText (parseText format ["BRAVO 1"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	40 cutRsc ["D_L3_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
	_display = uiNameSpace getVariable "D_L3_2";
	_setText = _display displayCtrl 20030;
	_setText ctrlSetStructuredText (parseText format ["BRAVO 2"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 2
	50 cutRsc ["D_L4_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L4_1")};
	_display = uiNameSpace getVariable "D_L4_1";
	_setText = _display displayCtrl 20040;
	_setText ctrlSetStructuredText (parseText format ["BRAVO 3"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	60 cutRsc ["D_L4_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L4_2")};
	_display = uiNameSpace getVariable "D_L4_2";
	_setText = _display displayCtrl 20050;
	_setText ctrlSetStructuredText (parseText format ["BRAVO 4"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 3
	70 cutRsc ["D_L5_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L5_1")};
	_display = uiNameSpace getVariable "D_L5_1";
	_setText = _display displayCtrl 20060;
	_setText ctrlSetStructuredText (parseText format ["BRAVO 5"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];	
};

VAVS_showCamo = {
	// section header 
	20 cutRsc ["D_L2_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L2_1")};
	_display = uiNameSpace getVariable "D_L2_1";
	_setText = _display displayCtrl 20010;
	_setText ctrlSetStructuredText (parseText format ["CAMO TYPE"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 1
	30 cutRsc ["D_L3_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
	_display = uiNameSpace getVariable "D_L3_1";
	_setText = _display displayCtrl 20020;
	_setText ctrlSetStructuredText (parseText format ["ALTIS"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	40 cutRsc ["D_L3_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
	_display = uiNameSpace getVariable "D_L3_2";
	_setText = _display displayCtrl 20030;
	_setText ctrlSetStructuredText (parseText format ["TANOAN"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];
};

VAVS_show_Vic_Classes = {
	// section header
	20 cutRsc ["D_L2_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L2_1")};
	_display = uiNameSpace getVariable "D_L2_1";
	_setText = _display displayCtrl 20010;
	_setText ctrlSetStructuredText (parseText format ["VEHICLE TYPE"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 1
	30 cutRsc ["D_L3_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
	_display = uiNameSpace getVariable "D_L3_1";
	_setText = _display displayCtrl 20020;
	_setText ctrlSetStructuredText (parseText format ["IFV"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	40 cutRsc ["D_L3_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
	_display = uiNameSpace getVariable "D_L3_2";
	_setText = _display displayCtrl 20030;
	_setText ctrlSetStructuredText (parseText format ["MRAP"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 2
	50 cutRsc ["D_L4_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L4_1")};
	_display = uiNameSpace getVariable "D_L4_1";
	_setText = _display displayCtrl 20040;
	_setText ctrlSetStructuredText (parseText format ["LSV"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	60 cutRsc ["D_L4_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L4_2")};
	_display = uiNameSpace getVariable "D_L4_2";
	_setText = _display displayCtrl 20050;
	_setText ctrlSetStructuredText (parseText format ["MBT"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 3
	70 cutRsc ["D_L5_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L5_1")};
	_display = uiNameSpace getVariable "D_L5_1";
	_setText = _display displayCtrl 20060;
	_setText ctrlSetStructuredText (parseText format ["HEMTT"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	80 cutRsc ["D_L5_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L5_2")};
	_display = uiNameSpace getVariable "D_L5_2";
	_setText = _display displayCtrl 20070;
	_setText ctrlSetStructuredText (parseText format ["Other"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];
};

VAVS_show_IFV_Classes = {
	// section header
	20 cutRsc ["D_L2_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L2_1")};
	_display = uiNameSpace getVariable "D_L2_1";
	_setText = _display displayCtrl 20010;
	_setText ctrlSetStructuredText (parseText format ["IFV VARIANT"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 1
	30 cutRsc ["D_L3_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
	_display = uiNameSpace getVariable "D_L3_1";
	_setText = _display displayCtrl 20020;
	_setText ctrlSetStructuredText (parseText format ["PANTHER"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	40 cutRsc ["D_L3_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
	_display = uiNameSpace getVariable "D_L3_2";
	_setText = _display displayCtrl 20030;
	_setText ctrlSetStructuredText (parseText format ["CHEETAH"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 2
	50 cutRsc ["D_L4_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L4_1")};
	_display = uiNameSpace getVariable "D_L4_1";
	_setText = _display displayCtrl 20040;
	_setText ctrlSetStructuredText (parseText format ["BOBCAT"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	60 cutRsc ["D_L4_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L4_2")};
	_display = uiNameSpace getVariable "D_L4_2";
	_setText = _display displayCtrl 20050;
	_setText ctrlSetStructuredText (parseText format ["MARSHALL"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 3
	70 cutRsc ["D_L5_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L5_1")};
	_display = uiNameSpace getVariable "D_L5_1";
	_setText = _display displayCtrl 20060;
	_setText ctrlSetStructuredText (parseText format ["GORGON"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];
};

VAVS_Show_MRAP_Classes = {
	// section header
	20 cutRsc ["D_L2_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L2_1")};
	_display = uiNameSpace getVariable "D_L2_1";
	_setText = _display displayCtrl 20010;
	_setText ctrlSetStructuredText (parseText format ["MRAP VARIANT"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 1
	30 cutRsc ["D_L3_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
	_display = uiNameSpace getVariable "D_L3_1";
	_setText = _display displayCtrl 20020;
	_setText ctrlSetStructuredText (parseText format ["HUNTER"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	40 cutRsc ["D_L3_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
	_display = uiNameSpace getVariable "D_L3_2";
	_setText = _display displayCtrl 20030;
	_setText ctrlSetStructuredText (parseText format ["HUNTER GMG"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 2
	50 cutRsc ["D_L4_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L4_1")};
	_display = uiNameSpace getVariable "D_L4_1";
	_setText = _display displayCtrl 20040;
	_setText ctrlSetStructuredText (parseText format ["HUNTER HMG"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];	
};

VAVS_Show_LSV_Classes = {
	// section header
	20 cutRsc ["D_L2_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L2_1")};
	_display = uiNameSpace getVariable "D_L2_1";
	_setText = _display displayCtrl 20010;
	_setText ctrlSetStructuredText (parseText format ["LSV VARIANT"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 1
	30 cutRsc ["D_L3_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
	_display = uiNameSpace getVariable "D_L3_1";
	_setText = _display displayCtrl 20020;
	_setText ctrlSetStructuredText (parseText format ["PROWLER"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	40 cutRsc ["D_L3_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
	_display = uiNameSpace getVariable "D_L3_2";
	_setText = _display displayCtrl 20030;
	_setText ctrlSetStructuredText (parseText format ["PROWLER HMG"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 2
	50 cutRsc ["D_L4_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L4_1")};
	_display = uiNameSpace getVariable "D_L4_1";
	_setText = _display displayCtrl 20040;
	_setText ctrlSetStructuredText (parseText format ["PROWLER AT"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	60 cutRsc ["D_L4_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L4_2")};
	_display = uiNameSpace getVariable "D_L4_2";
	_setText = _display displayCtrl 20020;
	_setText ctrlSetStructuredText (parseText format ["PROWLER LIGHT"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];
};

VAVS_Show_MBT_Classes = {
	// section header
	20 cutRsc ["D_L2_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L2_1")};
	_display = uiNameSpace getVariable "D_L2_1";
	_setText = _display displayCtrl 20010;
	_setText ctrlSetStructuredText (parseText format ["MBT VARIANT"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 1
	30 cutRsc ["D_L3_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
	_display = uiNameSpace getVariable "D_L3_1";
	_setText = _display displayCtrl 20020;
	_setText ctrlSetStructuredText (parseText format ["SLAMMER"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	40 cutRsc ["D_L3_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
	_display = uiNameSpace getVariable "D_L3_2";
	_setText = _display displayCtrl 20030;
	_setText ctrlSetStructuredText (parseText format ["SLAMMER UP"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 2
	50 cutRsc ["D_L4_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L4_1")};
	_display = uiNameSpace getVariable "D_L4_1";
	_setText = _display displayCtrl 20040;
	_setText ctrlSetStructuredText (parseText format ["SCORCHER"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	60 cutRsc ["D_L4_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L4_2")};
	_display = uiNameSpace getVariable "D_L4_2";
	_setText = _display displayCtrl 20050;
	_setText ctrlSetStructuredText (parseText format ["SANDSTORM"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];
};

VAVS_Show_HEMTT_Type = {
	// section header
	20 cutRsc ["D_L2_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L2_1")};
	_display = uiNameSpace getVariable "D_L2_1";
	_setText = _display displayCtrl 20010;
	_setText ctrlSetStructuredText (parseText format ["HEMTT VARIANT"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 1
	30 cutRsc ["D_L3_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
	_display = uiNameSpace getVariable "D_L3_1";
	_setText = _display displayCtrl 20020;
	_setText ctrlSetStructuredText (parseText format ["BASIC TRANSPORT"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	40 cutRsc ["D_L3_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
	_display = uiNameSpace getVariable "D_L3_2";
	_setText = _display displayCtrl 20030;
	_setText ctrlSetStructuredText (parseText format ["BOX TRANSPORT"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 2
	50 cutRsc ["D_L4_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L4_1")};
	_display = uiNameSpace getVariable "D_L4_1";
	_setText = _display displayCtrl 20040;
	_setText ctrlSetStructuredText (parseText format ["COVERED TRANSPORT"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	60 cutRsc ["D_L4_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L4_2")};
	_display = uiNameSpace getVariable "D_L4_2";
	_setText = _display displayCtrl 20050;
	_setText ctrlSetStructuredText (parseText format ["OPEN TRANSPORT"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];	

	// line 3
	70 cutRsc ["D_L5_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L5_1")};
	_display = uiNameSpace getVariable "D_L5_1";
	_setText = _display displayCtrl 20060;
	_setText ctrlSetStructuredText (parseText format ["REPAIR TRUCK"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];	

	80 cutRsc ["D_L5_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L5_2")};
	_display = uiNameSpace getVariable "D_L5_2";
	_setText = _display displayCtrl 20070;
	_setText ctrlSetStructuredText (parseText format ["AMMO TRUCK"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];	

	// line 4
	90 cutRsc ["D_L6_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L6_1")};
	_display = uiNameSpace getVariable "D_L6_1";
	_setText = _display displayCtrl 20080;
	_setText ctrlSetStructuredText (parseText format ["FUEL TRUCK"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];		

	100 cutRsc ["D_L6_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L6_2")};
	_display = uiNameSpace getVariable "D_L6_2";
	_setText = _display displayCtrl 20090;
	_setText ctrlSetStructuredText (parseText format ["MEDICAL TRUCK"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];	
};

VAVS_Show_Other_Type = {

	// section header
	20 cutRsc ["D_L2_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L2_1")};
	_display = uiNameSpace getVariable "D_L2_1";
	_setText = _display displayCtrl 20010;
	_setText ctrlSetStructuredText (parseText format ["OTHER VARIANTS"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 1
	30 cutRsc ["D_L3_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
	_display = uiNameSpace getVariable "D_L3_1";
	_setText = _display displayCtrl 20020;
	_setText ctrlSetStructuredText (parseText format ["QUAD BIKE"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	40 cutRsc ["D_L3_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
	_display = uiNameSpace getVariable "D_L3_2";
	_setText = _display displayCtrl 20030;
	_setText ctrlSetStructuredText (parseText format ["OFFROAD HMG"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	// line 2
	50 cutRsc ["D_L4_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L4_1")};
	_display = uiNameSpace getVariable "D_L4_1";
	_setText = _display displayCtrl 20040;
	_setText ctrlSetStructuredText (parseText format ["OFFROAD AT"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];

	60 cutRsc ["D_L4_2","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L4_2")};
	_display = uiNameSpace getVariable "D_L4_2";
	_setText = _display displayCtrl 20050;
	_setText ctrlSetStructuredText (parseText format ["OFFROAD REPAIR"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];	

	// line 3
	70 cutRsc ["D_L5_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "D_L5_1")};
	_display = uiNameSpace getVariable "D_L5_1";
	_setText = _display displayCtrl 20060;
	_setText ctrlSetStructuredText (parseText format ["OFFROAD"]);
	_setText ctrlSetTextColor [0, 1, 0, 1];	
};

// --------------------------------------------------------------------------------------------------
// end of functions 
// --------------------------------------------------------------------------------------------------


// --------------------------------------------------------------------------------------------------
// questions flow
// --------------------------------------------------------------------------------------------------


// initial question...
// option A
30 cutRsc ["D_L3_1","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
_display = uiNameSpace getVariable "D_L3_1";
_setText = _display displayCtrl 20020;
_setText ctrlSetStructuredText (parseText format ["DIRECT COMMAND"]);
_setText ctrlSetTextColor [0, 1, 0, 1];

// option B
40 cutRsc ["D_L3_2","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
_display = uiNameSpace getVariable "D_L3_2";
_setText = _display displayCtrl 20030;
_setText ctrlSetStructuredText (parseText format ["HIGH COMMAND"]);
_setText ctrlSetTextColor [0, 1, 0, 1];


while {VAVS_numericalInputbool} do {

	val_VAVS_vicType		= count VAVS_vicType;
	val_VAVS_HC_Group		= count VAVS_HC_Group;
	val_VAVS_carType		= count VAVS_carType;
	val_VAVS_IFV_Type		= count VAVS_IFV_Type;
	val_VAVS_MRAP_Type		= count VAVS_MRAP_Type;
	val_VAVS_LSV_Type		= count VAVS_LSV_Type;
	val_VAVS_MBT_Type		= count VAVS_MBT_Type;
	val_VAVS_HEMTT_Type		= count VAVS_HEMTT_Type;
	val_VAVS_Other_Type		= count VAVS_Other_Type;
	val_VAVS_Basic_Camo		= count VAVS_Basic_Camo;
	val_VAVS_Ext_Camo		= count VAVS_Ext_Camo;
	val_VAVS_No_Of_Units	= count VAVS_No_Of_Units; // this can be  removed, but check for breakages!
	val_VAVS_confirm 		= count VAVS_confirm;


	// VAVS_vicType 1 = Direct Control, 2 = High Command -------------------------------------------------------------------------------------------------------------
	if (VAVS_vicTypeBool) then {

		if (val_VAVS_vicType == 1) then {

			_content = VAVS_vicType select 0; // DC or HC 

			if (_content == 1) then {
				// systemChat "you selected DIRECT COMMAND";
				// systemChat "Select: 1 = IFV, 2 = MRAP, 3 = LSV, 4 = MTB, 5 = HEMTT, 6 = Other";

				// highlight selection briefly
				30 cutRsc ["D_L3_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
				_display = uiNameSpace getVariable "D_L3_1";
				_setText = _display displayCtrl 20020;
				_setText ctrlSetStructuredText (parseText format ["DIRECT COMMAND"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];

				sleep .2;

				[] call VAVS_show_Vic_Classes;

				VAVS_vicTypeBool = false;
				VAVS_carTypeBool = true;
			};

			if (_content == 2) then {
				// systemChat "you selected HIGH COMMAND";

				// highlight selection briefly
				40 cutRsc ["D_L3_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
				_display = uiNameSpace getVariable "D_L3_2";
				_setText = _display displayCtrl 20030;
				_setText ctrlSetStructuredText (parseText format ["HIGH COMMAND"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];

				sleep .2;

				[] call VAVS_show_HC_Groups; 

				VAVS_vicTypeBool = false;
				VAVS_HC_Group_Bool = true;
			};
		};
	};

// new 

	if (VAVS_HC_Group_Bool) then {

		if (val_VAVS_HC_Group == 1) then {

			_content = VAVS_HC_Group select 0;

			if (_content == 1) then {
				// systemChat "you selected HC Group 1 - Bravo 1";

				30 cutRsc ["D_L3_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
				_display = uiNameSpace getVariable "D_L3_1";
				_setText = _display displayCtrl 20020;
				_setText ctrlSetStructuredText (parseText format ["BRAVO 1"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
			};
			if (_content == 2) then {
				systemChat "you selected HC Group 1 - Bravo 1";

				40 cutRsc ["D_L3_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
				_display = uiNameSpace getVariable "D_L3_2";
				_setText = _display displayCtrl 20030;
				_setText ctrlSetStructuredText (parseText format ["BRAVO 2"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
			};
			if (_content == 3) then {
				systemChat "you selected HC Group 1 - Bravo 1";

				50 cutRsc ["D_L4_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L4_1")};
				_display = uiNameSpace getVariable "D_L4_1";
				_setText = _display displayCtrl 20040;
				_setText ctrlSetStructuredText (parseText format ["BRAVO 3"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
			};
			if (_content == 4) then {
				systemChat "you selected HC Group 1 - Bravo 1";

				60 cutRsc ["D_L4_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L4_2")};
				_display = uiNameSpace getVariable "D_L4_2";
				_setText = _display displayCtrl 20050;
				_setText ctrlSetStructuredText (parseText format ["BRAVO 4"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
			};
			if (_content == 5) then {
				systemChat "you selected HC Group 1 - Bravo 1";

				70 cutRsc ["D_L5_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L5_1")};
				_display = uiNameSpace getVariable "D_L5_1";
				_setText = _display displayCtrl 20060;
				_setText ctrlSetStructuredText (parseText format ["BRAVO 5"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];	
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
			};

			sleep .2;

			[] call VAVS_show_Vic_Classes;

			VAVS_HC_Group_Bool = false;
			VAVS_carTypeBool = true;
		};
	};

// new

	// VAVS_carType 1 = IFV, 2 = MRAP, 3 = LSV, 4 = MTB, 5 = HEMTT, 6 = Other, 	7 = RHS, 8 = Custom ----------------------------------------------
	if (VAVS_carTypeBool) then {

		if (val_VAVS_carType == 1) then {

			_content = VAVS_carType select 0;

			if (_content == 1) then {
				// systemChat "you selected IFV";
				// systemChat "Select: 1 = Panther, 2 = Cheetah, 3 = Bobcat, 4 = Marshall, 5 = Gorgon";

				// highlight selection briefly
				30 cutRsc ["D_L3_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
				_display = uiNameSpace getVariable "D_L3_1";
				_setText = _display displayCtrl 20020;
				_setText ctrlSetStructuredText (parseText format ["IFV"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];

				[] call VAVS_show_IFV_Classes;

				VAVS_carTypeBool = false;
				VAVS_IFV_TypeBool = true;
			};

			if (_content == 2) then {
				// systemChat "you selected MRAP";
				// systemChat "VAVS_MSelect:RAP_Type 1 = Hunter, 2 = Hunter GMG, 3 = Hunter HMG ";

				// highlight selection briefly
				40 cutRsc ["D_L3_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
				_display = uiNameSpace getVariable "D_L3_2";
				_setText = _display displayCtrl 20030;
				_setText ctrlSetStructuredText (parseText format ["MRAP"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];

				[] call VAVS_Show_MRAP_Classes;

				VAVS_carTypeBool = false;
				VAVS_MRAP_Type_Bool = true;
			};

			if (_content == 3) then {
				// systemChat "you selected LSV";
				// systemChat "Select: 1 = Prowler, 2 = Prowler HMG, 3 = Prowler AT, 4 = Prowler Light";

				// highlight selection briefly
				50 cutRsc ["D_L4_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L4_1")};
				_display = uiNameSpace getVariable "D_L4_1";
				_setText = _display displayCtrl 20040;
				_setText ctrlSetStructuredText (parseText format ["LSV"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];

				call VAVS_Show_LSV_Classes;

				VAVS_carTypeBool = false;
				VAVS_LSV_Type_Bool = true;
			};

			if (_content == 4) then {
				// systemChat "you selected MBT";
				// systemChat "Select: 1 = Slammer, 2 = Slammer UP, 3 = Scorcher, 4 = Sandstorm ";

				// highlight selection briefly
				60 cutRsc ["D_L4_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L4_2")};
				_display = uiNameSpace getVariable "D_L4_2";
				_setText = _display displayCtrl 20050;
				_setText ctrlSetStructuredText (parseText format ["MBT"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];

				[] call VAVS_Show_MBT_Classes;

				VAVS_carTypeBool = false;
				VAVS_MBT_Type_Bool = true;
			};

			if (_content == 5) then {
				// systemChat "you selected HEMTT";
				// systemChat "Select: 1 = Basic, 2 = Box Transport, 3 = Trans Covered, 4 = Trans Open, 5 = Repair, 6 = Ammo, 7 = Fuel, 8 = Medical";
				
				// highlight selection briefly
				70 cutRsc ["D_L5_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L5_1")};
				_display = uiNameSpace getVariable "D_L5_1";
				_setText = _display displayCtrl 20060;
				_setText ctrlSetStructuredText (parseText format ["HEMTT"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];
				
				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];

				call VAVS_Show_HEMTT_Type;

				VAVS_carTypeBool = false;
				VAVS_HEMTT_Type_Bool = true;
			};

			if (_content == 6) then {
				// systemChat "you selected Other";
				// systemChat "Select:	1 = Quad Bike, 2 = Offroad HMG, 3 = Offroad AT, 4 = Offroad Repair, 5 = Offroad";
				
				// highlight selection briefly
				80 cutRsc ["D_L5_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L5_2")};
				_display = uiNameSpace getVariable "D_L5_2";
				_setText = _display displayCtrl 20070;
				_setText ctrlSetStructuredText (parseText format ["OTHER"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];

				// state progress
				VAVS_carTypeBool = false;
				VAVS_Other_Type_Bool = true;
			};
			// if (_content == 7) then {
			// 	systemChat "you selected RHS";
			// 	VAVS_carTypeBool = false;
			// 	// needs to be completed!
			// };
			// if (_content == 8) then {
			// 	systemChat "you selected Custom";
			// 	VAVS_carTypeBool = false;
			// 	// needs to be completed!
			// };
		};
	};
	// -----------------------------------------------------------------------------------------------------------------------
	// END OF LAYER 1
	// -----------------------------------------------------------------------------------------------------------------------




	// -----------------------------------------------------------------------------------------------------------------------
	// START OF LAYER 2
	// -----------------------------------------------------------------------------------------------------------------------

	// VAVS_IFV_Type 1 = Panther, 2 = Cheetah, 3 = Bobcat, 4 = Marshall, 5 = Gorgon ------------------------------------------
	if (VAVS_IFV_TypeBool) then {

		if (val_VAVS_IFV_Type == 1) then {

			_content = VAVS_IFV_Type select 0;

			if (_content == 1) then {
				// systemChat "you selected Panther";

				// highlight selection briefly
				30 cutRsc ["D_L3_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
				_display = uiNameSpace getVariable "D_L3_1";
				_setText = _display displayCtrl 20020;
				_setText ctrlSetStructuredText (parseText format ["PANTHER"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;
			};

			if (_content == 2) then {
				// systemChat "you selected Cheetah";

				// highlight selection briefly
				40 cutRsc ["D_L3_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
				_display = uiNameSpace getVariable "D_L3_2";
				_setText = _display displayCtrl 20030;
				_setText ctrlSetStructuredText (parseText format ["CHEETAH"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;
			};

			if (_content == 3) then {
				systemChat "you selected Bobcat";

				// highlight selection briefly
				50 cutRsc ["D_L4_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L4_1")};
				_display = uiNameSpace getVariable "D_L4_1";
				_setText = _display displayCtrl 20040;
				_setText ctrlSetStructuredText (parseText format ["BOBCAT"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;
			};

			if (_content == 4) then {
				// systemChat "you selected Marshall";

				// highlight selection briefly
				60 cutRsc ["D_L4_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L4_2")};
				_display = uiNameSpace getVariable "D_L4_2";
				_setText = _display displayCtrl 20050;
				_setText ctrlSetStructuredText (parseText format ["MARSHALL"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;
			};

			if (_content == 5) then {
				// systemChat "you selected Gorgon";

				// highlight selection briefly
				70 cutRsc ["D_L5_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L5_1")};
				_display = uiNameSpace getVariable "D_L5_1";
				_setText = _display displayCtrl 20060;
				_setText ctrlSetStructuredText (parseText format ["GORGON"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;
			};

			// systemChat "Select:	1 = Altis, 2 = Tanoa";

			// state progression
			VAVS_IFV_TypeBool = false;
			VAVS_Basic_Camo_Bool = true;
		};
	};

	// VAVS_MRAP_Type 1 = Hunter, 2 = Hunter GMG, 3 = Hunter HMG ----------------------------------------------------------------------------------------
	if (VAVS_MRAP_Type_Bool) then {

		if (val_VAVS_MRAP_Type == 1) then {

			_content = VAVS_MRAP_Type select 0;
			
			if (_content == 1) then {
				systemChat "you selected Hunter";

				// highlight selection briefly
				30 cutRsc ["D_L3_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
				_display = uiNameSpace getVariable "D_L3_1";
				_setText = _display displayCtrl 20020;
				_setText ctrlSetStructuredText (parseText format ["HUNTER"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 1, 0, 1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;
			};
			if (_content == 2) then {
				systemChat "you selected Hunter GMG";

				// highlight selection briefly
				40 cutRsc ["D_L3_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
				_display = uiNameSpace getVariable "D_L3_2";
				_setText = _display displayCtrl 20030;
				_setText ctrlSetStructuredText (parseText format ["HUNTER GMG"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 1, 0, 1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;

			};
			if (_content == 3) then {
				systemChat "you selected Hunter HMG";

				// highlight selection briefly
				50 cutRsc ["D_L4_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L4_1")};
				_display = uiNameSpace getVariable "D_L4_1";
				_setText = _display displayCtrl 20040;
				_setText ctrlSetStructuredText (parseText format ["HUNTER HMG"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 1, 0, 1];	

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;
			};

			systemChat "Select: 1 = Altis, 2 = Tanoa";

			// state progression
			VAVS_MRAP_Type_Bool = false;
			VAVS_Basic_Camo_Bool = true;
		};
	};

	// VAVS_LSV_Type 1 = Prowler, 2 = Prowler HMG, 3 = Prowler AT, 4 = Prowler Light ---------------------------------------------------------------------------
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

	// VAVS_MBT_Type 1 = Slammer, 2 = Slammer UP, 3 = Scorcher, 4 = Sandstorm ---------------------------------------------------------------------------------
	if (VAVS_MBT_Type_Bool) then {

		if (val_VAVS_MBT_Type == 1) then {

			_content = VAVS_MBT_Type select 0;

			if (_content == 1) then {
				systemChat "you selected Slammer";
				30 cutRsc ["D_L3_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
				_display = uiNameSpace getVariable "D_L3_1";
				_setText = _display displayCtrl 20020;
				_setText ctrlSetStructuredText (parseText format ["SLAMMER"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;

				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;
			};
			if (_content == 2) then {
				systemChat "you selected Slammer UP";
				40 cutRsc ["D_L3_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
				_display = uiNameSpace getVariable "D_L3_2";
				_setText = _display displayCtrl 20030;
				_setText ctrlSetStructuredText (parseText format ["SLAMMER UP"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;

				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;

			};
			if (_content == 3) then {
				systemChat "you selected Scorcher";
				50 cutRsc ["D_L4_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L4_1")};
				_display = uiNameSpace getVariable "D_L4_1";
				_setText = _display displayCtrl 20040;
				_setText ctrlSetStructuredText (parseText format ["SCORCHER"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;

				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;

			};
			if (_content == 4) then {
				systemChat "you selected Sandstorm";
				60 cutRsc ["D_L4_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L4_2")};
				_display = uiNameSpace getVariable "D_L4_2";
				_setText = _display displayCtrl 20050;
				_setText ctrlSetStructuredText (parseText format ["SANDSTORM"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;

				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;

			};

			// systemChat "Select:	1 = Altis, 2 = Tanoa";

			VAVS_MBT_Type_Bool = false;
			VAVS_Basic_Camo_Bool = true;
		};
	};

	// VAVS_HEMTT_Type 1 = Basic, 2 = Box Transport, 3 = Trans Covered, 4 = Trans Open, 5 = Repair, 6 = Ammo, 7 = Fuel, 8 = Medical ---------------------------------
	if (VAVS_HEMTT_Type_Bool) then {

		// 04 sept note - try adding the default plain just once st the end!

		if (val_VAVS_HEMTT_Type == 1) then {

			_content = VAVS_HEMTT_Type select 0;

			if (_content == 1) then {
				systemChat "you selected Basic";
				30 cutRsc ["D_L3_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
				_display = uiNameSpace getVariable "D_L3_1";
				_setText = _display displayCtrl 20020;
				_setText ctrlSetStructuredText (parseText format ["BASIC TRANSPORT"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];
				90 cutRsc ["default","PLAIN"];
				100 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;
				// 04 sept lunch - do i need progression bools in each block or just one at the end?
			};
			if (_content == 2) then {
				systemChat "you selected Box Transport";
				40 cutRsc ["D_L3_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
				_display = uiNameSpace getVariable "D_L3_2";
				_setText = _display displayCtrl 20030;
				_setText ctrlSetStructuredText (parseText format ["BOX TRANSPORT"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];
				90 cutRsc ["default","PLAIN"];
				100 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;
			};
			if (_content == 3) then {
				systemChat "you selected Transort (Covered)";
				50 cutRsc ["D_L4_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L4_1")};
				_display = uiNameSpace getVariable "D_L4_1";
				_setText = _display displayCtrl 20040;
				_setText ctrlSetStructuredText (parseText format ["COVERED TRANSPORT"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];
				90 cutRsc ["default","PLAIN"];
				100 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;
			};
			if (_content == 4) then {
				systemChat "you selected Transport (Open)";
				60 cutRsc ["D_L4_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L4_2")};
				_display = uiNameSpace getVariable "D_L4_2";
				_setText = _display displayCtrl 20050;
				_setText ctrlSetStructuredText (parseText format ["OPEN TRANSPORT"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];	
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];
				90 cutRsc ["default","PLAIN"];
				100 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;
			};
			if (_content == 5) then {
				systemChat "you selected Repair";
				70 cutRsc ["D_L5_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L5_1")};
				_display = uiNameSpace getVariable "D_L5_1";
				_setText = _display displayCtrl 20060;
				_setText ctrlSetStructuredText (parseText format ["REPAIR TRUCK"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];	
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];
				90 cutRsc ["default","PLAIN"];
				100 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;

			};
			if (_content == 6) then {
				systemChat "you selected Ammo";
				80 cutRsc ["D_L5_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L5_2")};
				_display = uiNameSpace getVariable "D_L5_2";
				_setText = _display displayCtrl 20070;
				_setText ctrlSetStructuredText (parseText format ["AMMO TRUCK"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];	
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];
				90 cutRsc ["default","PLAIN"];
				100 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;

			};
			if (_content == 7) then {
				systemChat "you selected Fuel";
				90 cutRsc ["D_L6_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L6_1")};
				_display = uiNameSpace getVariable "D_L6_1";
				_setText = _display displayCtrl 20080;
				_setText ctrlSetStructuredText (parseText format ["FUEL TRUCK"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];		
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];
				90 cutRsc ["default","PLAIN"];
				100 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;
			};
			if (_content == 8) then {
				systemChat "you selected Medical";
				100 cutRsc ["D_L6_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L6_2")};
				_display = uiNameSpace getVariable "D_L6_2";
				_setText = _display displayCtrl 20090;
				_setText ctrlSetStructuredText (parseText format ["MEDICAL TRUCK"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];	
				_setText ctrlSetBackgroundColor [0,1,0,1];

				sleep 0.2;
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];
				90 cutRsc ["default","PLAIN"];
				100 cutRsc ["default","PLAIN"];

				// show camo choice 
				[] call VAVS_showCamo;
			};

			// systemChat "Select:	1 = Altis, 2 = Tanoa";

			VAVS_HEMTT_Type_Bool = false;
			VAVS_Basic_Camo_Bool = true;
		};
	};

	// VAVS_Other_Type	1 = Quad Bike, 2 = Offroad HMG, 3 = Offroad AT, 4 = Offroad Repair, 5 = Offroad ----------------------------------------------------------------
	if (VAVS_Other_Type_Bool) then {

		if (val_VAVS_Other_Type == 1) then {

			_content = VAVS_Other_Type select 0;

			if (_content == 1) then {
				systemChat "you selected Quad Bike";
				30 cutRsc ["D_L3_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
				_display = uiNameSpace getVariable "D_L3_1";
				_setText = _display displayCtrl 20020;
				_setText ctrlSetStructuredText (parseText format ["QUAD BIKE"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];
				_setText ctrlSetBackgroundColor [0,1,0,1];

			};
			if (_content == 2) then {
				systemChat "you selected Offroad HMG";
				40 cutRsc ["D_L3_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
				_display = uiNameSpace getVariable "D_L3_2";
				_setText = _display displayCtrl 20030;
				_setText ctrlSetStructuredText (parseText format ["OFFROAD HMG"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];
				_setText ctrlSetBackgroundColor [0,1,0,1];

			};
			if (_content == 3) then {
				systemChat "you selected Offroad AT";
				50 cutRsc ["D_L4_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L4_1")};
				_display = uiNameSpace getVariable "D_L4_1";
				_setText = _display displayCtrl 20040;
				_setText ctrlSetStructuredText (parseText format ["OFFROAD AT"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];
				_setText ctrlSetBackgroundColor [0,1,0,1];

			};
			if (_content == 4) then {
				systemChat "you selected Offroad Repair";
				60 cutRsc ["D_L4_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L4_2")};
				_display = uiNameSpace getVariable "D_L4_2";
				_setText = _display displayCtrl 20050;
				_setText ctrlSetStructuredText (parseText format ["OFFROAD REPAIR"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];	
				_setText ctrlSetBackgroundColor [0,1,0,1];


			};
			if (_content == 5) then {
				systemChat "you selected Offroad";
				70 cutRsc ["D_L5_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L5_1")};
				_display = uiNameSpace getVariable "D_L5_1";
				_setText = _display displayCtrl 20060;
				_setText ctrlSetStructuredText (parseText format ["OFFROAD"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];	
				_setText ctrlSetBackgroundColor [0,1,0,1];

			};

			sleep 0.2;
			30 cutRsc ["default","PLAIN"];
			40 cutRsc ["default","PLAIN"];
			50 cutRsc ["default","PLAIN"];
			60 cutRsc ["default","PLAIN"];
			70 cutRsc ["default","PLAIN"];

			// show camo choice 
			[] call VAVS_showCamo;

			systemChat "Select:	1 = Altis, 2 = Tanoa";
			// note - here, testing both single bool progression and single default plain
			VAVS_Other_Type_Bool = false;
			VAVS_Basic_Camo_Bool = true;

		};
	};
	// -----------------------------------------------------------------------------------------------------------------------
	// END OF LEVEL 2
	// -----------------------------------------------------------------------------------------------------------------------



	// -----------------------------------------------------------------------------------------------------------------------
	// START OF LEVEL 3
	// -----------------------------------------------------------------------------------------------------------------------

	// VAVS_Basic_Camo	1 = Altis, 2 = Tanoa ---------------------------------------------------------------------------------
	if (VAVS_Basic_Camo_Bool) then {

		if (val_VAVS_Basic_Camo == 1) then {

			_content = VAVS_Basic_Camo select 0;

			if (_content == 1) then {
				systemChat "you selected Altis Camo";

				// highlight selection briefly
				30 cutRsc ["D_L3_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
				_display = uiNameSpace getVariable "D_L3_1";
				_setText = _display displayCtrl 20020;
				_setText ctrlSetStructuredText (parseText format ["ALTIS"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];

				sleep 0.5;

				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];

				// section header 
				20 cutRsc ["D_L2_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L2_1")};
				_display = uiNameSpace getVariable "D_L2_1";
				_setText = _display displayCtrl 20010;
				_setText ctrlSetStructuredText (parseText format ["CONFIRM  /  CANCEL"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];

				// line 1
				30 cutRsc ["D_L3_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
				_display = uiNameSpace getVariable "D_L3_1";
				_setText = _display displayCtrl 20020;
				_setText ctrlSetStructuredText (parseText format ["CONFIRM"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];

				40 cutRsc ["D_L3_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
				_display = uiNameSpace getVariable "D_L3_2";
				_setText = _display displayCtrl 20030;
				_setText ctrlSetStructuredText (parseText format ["CANCEL"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];

			};
			if (_content == 2) then {
				systemChat "you selected Tanoa Camo";

				// highlight selection briefly
				40 cutRsc ["D_L3_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
				_display = uiNameSpace getVariable "D_L3_2";
				_setText = _display displayCtrl 20030;
				_setText ctrlSetStructuredText (parseText format ["TANOAN"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];
				// 30 cutRsc ["default","PLAIN"];

				sleep 0.5;

				30 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];

				// section header
				20 cutRsc ["D_L2_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L2_1")};
				_display = uiNameSpace getVariable "D_L2_1";
				_setText = _display displayCtrl 20010;
				_setText ctrlSetStructuredText (parseText format ["CONFIRM  /  CANCEL"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];

				// line 1
				30 cutRsc ["D_L3_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
				_display = uiNameSpace getVariable "D_L3_1";
				_setText = _display displayCtrl 20020;
				_setText ctrlSetStructuredText (parseText format ["CONFIRM"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];

				40 cutRsc ["D_L3_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
				_display = uiNameSpace getVariable "D_L3_2";
				_setText = _display displayCtrl 20030;
				_setText ctrlSetStructuredText (parseText format ["CANCEL"]);
				_setText ctrlSetTextColor [0, 1, 0, 1];
			};

			// systemChat "select 1 to confirm, or 2 to cancel";

			// state progression
			VAVS_Basic_Camo_Bool = false;
			VAVS_confirmBool = true;
		};
	};

	// VAVS_Ext_Camo 1 = Altis, 2 = Tanoa, 3 = Altis Black, 4 = Tanoa Black, 5 = Altis Olive, 6 = Tanoa Olive, 7 = Altis Sand, 8 = Tanoa Sand, 9 = CRTG -------------------------------------

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

		systemChat "select 1 to confirm, or 2 to cancel";

		// state progression 
		VAVS_Ext_Camo_Bool = false;
		VAVS_confirmBool = true;
		
	};

	// VAVS_No_Of_Units 1 = 1, 2 = 2, 3 = 3, 4 = 4, 5 = 5
	// if (VAVS_No_Of_Units_Bool) then {

	// 	if (val_VAVS_No_Of_Units == 1) then {

	// 		_content = VAVS_No_Of_Units select 0;

	// 		if (_content == 1) then {
	// 			systemChat "you ordered 1 unit";
	// 		};
	// 		if (_content == 2) then {
	// 			systemChat "you ordered 2 unit";
	// 		};
	// 		if (_content == 3) then {
	// 			systemChat "you ordered 3 unit";
	// 		};
	// 		if (_content == 4) then {
	// 			systemChat "you ordered 4 unit";
	// 		};
	// 		if (_content == 5) then {
	// 			systemChat "you ordered 5 unit";
	// 		};

	// 		systemChat "select 1 to confirm, or 2 to cancel";

	// 		VAVS_No_Of_Units_Bool = false;
	// 		VAVS_confirmBool = true;
	// 	};
	// };

	// VAVS_confirm 1 = yes, 2 = no --------------------------------------------------------------------------------------------------------------------------------
	if (VAVS_confirmBool) then {

		if (val_VAVS_confirm == 1) then {

			_content = VAVS_confirm select 0; 

			if (_content == 1) then {
				// systemChat "selection has been completed - thank you";

				// highlight selection briefly
				30 cutRsc ["D_L3_1","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_1")};
				_display = uiNameSpace getVariable "D_L3_1";
				_setText = _display displayCtrl 20020;
				_setText ctrlSetStructuredText (parseText format ["CONFIRM"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];

				sleep 1.2;

				09 cutRsc ["default","PLAIN"];
				10 cutRsc ["default","PLAIN"];
				20 cutRsc ["default","PLAIN"];
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];

				sleep 0.5;

				// state progression completed
				VAVS_confirmBool = false;

				// create the payload 
				[] execVM "voiceActivatedVehicleSpawner\VAVS_createVics.sqf";
			};

			if (_content == 2) then {
				// systemChat "selection has been cancelled - standing down";

				// highlight selection briefly
				40 cutRsc ["D_L3_2","PLAIN"];
				waitUntil {!isNull (uiNameSpace getVariable "D_L3_2")};
				_display = uiNameSpace getVariable "D_L3_2";
				_setText = _display displayCtrl 20030;
				_setText ctrlSetStructuredText (parseText format ["CANCEL"]);
				_setText ctrlSetBackgroundColor [0,1,0,1];
				_setText ctrlSetTextColor [0, 0, 0, 1];

				sleep 1.2;

				09 cutRsc ["default","PLAIN"];
				10 cutRsc ["default","PLAIN"];
				20 cutRsc ["default","PLAIN"];
				30 cutRsc ["default","PLAIN"];
				40 cutRsc ["default","PLAIN"];
				50 cutRsc ["default","PLAIN"];
				60 cutRsc ["default","PLAIN"];
				70 cutRsc ["default","PLAIN"];
				80 cutRsc ["default","PLAIN"];

				// state progression completed
				VAVS_confirmBool = false;

				// clean up and reset 
				execVM "voiceActivatedVehicleSpawner\VAVS_clearKeyDowns.sqf";
				execVM "voiceActivatedVehicleSpawner\initialiseVAVS.sqf";
			};
		};
	};

	sleep 0.1;
};
