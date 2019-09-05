/*
from:		voiceactivatedhighcommand\VAHCO_keyDownMonitor.sqf
to:			voiceactivatedhighcommand\VAHCO_clearKeyDowns.sqf
to:			voiceactivatedhighcommand\initialiseVAHCO.sqf

purpose:
data parsing to enable the script to understand and implement move orders 
calls one function currently, to implement move orders to the relevant group

notes:
so many ideas 
for move, urgently need a halt order, and also ability to address all units, and also - fall back to my position !!
28th aug - added three more groups in function - test this all works ok!

Also, can we get rid of dees globals man??

check controls for UI here!


03 Sept:
Need to split instructions based on order type, 1 or 2 (general move, or objective driven)
Adding split functions for each order type

Also added move orders to secure and approach primary and secondary objectives

*/

HINT "OSCAR MIKE RUNNING";

_parsed_VAHCO_GroupSelect	= VAHCO_groupSelect joinString "";
_parsed_VAHCO_OrderType		= VAHCO_orderSelect joinString "";
_parsed_VAHCO_MoveDistance	= VAHCO_distance joinString "";
_parsed_VAHCO_MoveDirection	= VAHCO_heading joinString "";

parsed_VAHCO_GroupSelect2 	= parseNumber _parsed_VAHCO_GroupSelect;
parsed_VAHCO_OrderType2		= parseNumber _parsed_VAHCO_OrderType;
parsed_VAHCO_MoveDistance2	= parseNumber _parsed_VAHCO_MoveDistance;
parsed_VAHCO_MoveDirection2	= parseNumber _parsed_VAHCO_MoveDirection;

execVM "voiceactivatedhighcommand\VAHCO_clearKeyDowns.sqf";

RGG_callVAHCO_MOVE_ORDERS = {

	// _RGG_GRP_Num = RGG_GRP_Num select 0;

	if (RGG_Grp_Num == 1) then {

		// systemChat "Bravo 1 on the move..";
		_destination = leader groupBlu1 getPos [parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2];
		groupBlu1 move _destination;

		1 cutRsc ["C_L1_1","PLAIN"];
		waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
		_display = uiNameSpace getVariable "C_L1_1";
		_setText = _display displayCtrl 19001;
		_setText ctrlSetStructuredText (parseText format ["BRAVO 1 moving to: %1, (%2m at %3)", _destination, parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
	};

	if (RGG_Grp_Num == 2) then {

		// systemChat "Bravo 2 on the move..";
		_destination = leader groupBlu2 getPos [parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2];
		groupBlu2 move _destination;

		1 cutRsc ["C_L1_1","PLAIN"];
		waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
		_display = uiNameSpace getVariable "C_L1_1";
		_setText = _display displayCtrl 19001;
		_setText ctrlSetStructuredText (parseText format ["BRAVO 2 moving to: %1, (%2m at %3)", _destination, parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
	};

	if (RGG_Grp_Num == 3) then {

		// systemChat "Bravo 3 on the move..";
		_destination = leader groupBlu3 getPos [parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2];
		groupBlu3 move _destination;

		1 cutRsc ["C_L1_1","PLAIN"];
		waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
		_display = uiNameSpace getVariable "C_L1_1";
		_setText = _display displayCtrl 19001;
		_setText ctrlSetStructuredText (parseText format ["BRAVO 3 moving to: %1, (%2m at %3)", _destination, parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
	};

	if (RGG_Grp_Num == 4) then {

		// systemChat "Bravo 4 on the move..";
		_destination = leader groupBlu4 getPos [parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2];
		groupBlu4 move _destination;

		1 cutRsc ["C_L1_1","PLAIN"];
		waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
		_display = uiNameSpace getVariable "C_L1_1";
		_setText = _display displayCtrl 19001;
		_setText ctrlSetStructuredText (parseText format ["BRAVO 4 moving to: %1, (%2m at %3)", _destination, parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
	};

	if (RGG_Grp_Num == 5) then {

		// systemChat "Bravo 5 on the move..";
		_destination = leader groupBlu5 getPos [parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2];
		groupBlu5 move _destination;

		1 cutRsc ["C_L1_1","PLAIN"];
		waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
		_display = uiNameSpace getVariable "C_L1_1";
		_setText = _display displayCtrl 19001;
		_setText ctrlSetStructuredText (parseText format ["BRAVO 5 moving to: %1, (%2m at %3)", _destination, parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
	};
};


RGG_callVAHCO_OBJECTIVE_ORDERS = {

	// Group 1 
	if (RGG_Grp_Num == 1) then {

		_contentB = VAHCO_objectiveType select 0;

		if (_contentB == 1) then {

			_destination = getMarkerPos "primaryObj";
			groupBlu1 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 1 SECURING PRIMARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 2) then {

			_destination = getMarkerPos "primaryObj";
			_relDir = leader groupBlu1 getRelDir _destination;
			_distance = leader groupBlu1 distance _destination;
			_approachDist = _distance - 100;
			_approachPos = leader groupBlu1 getRelPos [_approachDist, _relDir];
			groupBlu1 move _approachPos;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 1 APPROACHING PRIMARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 3) then {

			_destination = getMarkerPos "secondaryObj";
			groupBlu1 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 1 SECURING SECONDARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 4) then {

			_destination = getMarkerPos "primaryObj";
			_relDir = leader groupBlu1 getRelDir _destination;
			_distance = leader groupBlu1 distance _destination;
			_approachDist = _distance - 100;
			_approachPos = leader groupBlu1 getRelPos [_approachDist, _relDir];
			groupBlu1 move _approachPos;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 1 APPROACHING SECONDARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 5) then {

			_destination = getMarkerPos "primaryStage";
			groupBlu1 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 1 MOVING TO PRIMARY STAGING POINT: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 6) then {

			_destination = getMarkerPos "secondaryStage";
			groupBlu1 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 1 MOVING TO SECONDARY STAGING POINT: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
	};

	// group 2
	if (RGG_Grp_Num == 2) then {

		_contentB = VAHCO_objectiveType select 0;

		if (_contentB == 1) then {

			_destination = getMarkerPos "primaryObj";
			groupBlu2 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 2 SECURING PRIMARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 2) then {

			_destination = getMarkerPos "primaryObj";
			_relDir = leader groupBlu2 getRelDir _destination;
			_distance = leader groupBlu2 distance _destination;
			_approachDist = _distance - 100;
			_approachPos = leader groupBlu2 getRelPos [_approachDist, _relDir];
			groupBlu2 move _approachPos;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 2 APPROACHING PRIMARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 3) then {

			_destination = getMarkerPos "secondaryObj";
			groupBlu2 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 2 SECURING SECONDARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 4) then {

			_destination = getMarkerPos "primaryObj";
			_relDir = leader groupBlu2 getRelDir _destination;
			_distance = leader groupBlu2 distance _destination;
			_approachDist = _distance - 100;
			_approachPos = leader groupBlu2 getRelPos [_approachDist, _relDir];
			groupBlu2 move _approachPos;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 2 APPROACHING SECONDARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 5) then {

			_destination = getMarkerPos "primaryStage";
			groupBlu2 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 2 MOVING TO PRIMARY STAGING POINT: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 6) then {

			_destination = getMarkerPos "secondaryStage";
			groupBlu2 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 2 MOVING TO SECONDARY STAGING POINT: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
	};

	// group 3
	if (RGG_Grp_Num == 3) then {
		
		_contentB = VAHCO_objectiveType select 0;

		if (_contentB == 1) then {

			_destination = getMarkerPos "primaryObj";
			groupBlu3 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 3 SECURING PRIMARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 2) then {

			_destination = getMarkerPos "primaryObj";
			_relDir = leader groupBlu3 getRelDir _destination;
			_distance = leader groupBlu3 distance _destination;
			_approachDist = _distance - 100;
			_approachPos = leader groupBlu3 getRelPos [_approachDist, _relDir];
			groupBlu3 move _approachPos;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 3 APPROACHING PRIMARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 3) then {

			_destination = getMarkerPos "secondaryObj";
			groupBlu3 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 3 SECURING SECONDARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 4) then {

			_destination = getMarkerPos "primaryObj";
			_relDir = leader groupBlu3 getRelDir _destination;
			_distance = leader groupBlu3 distance _destination;
			_approachDist = _distance - 100;
			_approachPos = leader groupBlu3 getRelPos [_approachDist, _relDir];
			groupBlu3 move _approachPos;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 3 APPROACHING SECONDARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 5) then {

			_destination = getMarkerPos "primaryStage";
			groupBlu3 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 3 MOVING TO PRIMARY STAGING POINT: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 6) then {

			_destination = getMarkerPos "secondaryStage";
			groupBlu3 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 3 MOVING TO SECONDARY STAGING POINT: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
	};

	// group 4
	if (RGG_Grp_Num == 4) then {

		_contentB = VAHCO_objectiveType select 0;

		if (_contentB == 1) then {

			_destination = getMarkerPos "primaryObj";
			groupBlu4 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 4 SECURING PRIMARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 2) then {

			_destination = getMarkerPos "primaryObj";
			_relDir = leader groupBlu4 getRelDir _destination;
			_distance = leader groupBlu4 distance _destination;
			_approachDist = _distance - 100;
			_approachPos = leader groupBlu4 getRelPos [_approachDist, _relDir];
			groupBlu4 move _approachPos;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 4 APPROACHING PRIMARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 3) then {

			_destination = getMarkerPos "secondaryObj";
			groupBlu4 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 4 SECURING SECONDARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 4) then {

			_destination = getMarkerPos "primaryObj";
			_relDir = leader groupBlu4 getRelDir _destination;
			_distance = leader groupBlu4 distance _destination;
			_approachDist = _distance - 100;
			_approachPos = leader groupBlu4 getRelPos [_approachDist, _relDir];
			groupBlu4 move _approachPos;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 4 APPROACHING SECONDARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 5) then {

			_destination = getMarkerPos "primaryStage";
			groupBlu4 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 4 MOVING TO PRIMARY STAGING POINT: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 6) then {

			_destination = getMarkerPos "secondaryStage";
			groupBlu4 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 4 MOVING TO SECONDARY STAGING POINT: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
	};

	// group 5
	if (RGG_Grp_Num == 5) then {

		_contentB = VAHCO_objectiveType select 0;

		if (_contentB == 1) then {

			_destination = getMarkerPos "primaryObj";
			groupBlu5 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 5 SECURING PRIMARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 2) then {

			_destination = getMarkerPos "primaryObj";
			_relDir = leader groupBlu5 getRelDir _destination;
			_distance = leader groupBlu5 distance _destination;
			_approachDist = _distance - 100;
			_approachPos = leader groupBlu5 getRelPos [_approachDist, _relDir];
			groupBlu5 move _approachPos;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 5 APPROACHING PRIMARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 3) then {

			_destination = getMarkerPos "secondaryObj";
			groupBlu5 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 5 SECURING SECONDARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 4) then {

			_destination = getMarkerPos "primaryObj";
			_relDir = leader groupBlu5 getRelDir _destination;
			_distance = leader groupBlu5 distance _destination;
			_approachDist = _distance - 100;
			_approachPos = leader groupBlu5 getRelPos [_approachDist, _relDir];
			groupBlu5 move _approachPos;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 5 APPROACHING SECONDARY OBJECTIVE 1: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 5) then {

			_destination = getMarkerPos "primaryStage";
			groupBlu5 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 5 MOVING TO PRIMARY STAGING POINT: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
		if (_contentB == 6) then {

			_destination = getMarkerPos "secondaryStage";
			groupBlu5 move _destination;

			1 cutRsc ["C_L1_1","PLAIN"];
			waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
			_display = uiNameSpace getVariable "C_L1_1";
			_setText = _display displayCtrl 19001;
			_setText ctrlSetStructuredText (parseText format ["BRAVO 5 MOVING TO SECONDARY STAGING POINT: %1", _destination]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};
	};
};


// --------------------------------------------------------------------------------------------------------------------------------------
// end of functions
// --------------------------------------------------------------------------------------------------------------------------------------





if (parsed_VAHCO_OrderType2 == 1) then {
	[] call RGG_callVAHCO_MOVE_ORDERS;
};

if (parsed_VAHCO_OrderType2 == 2) then {
	[] call RGG_callVAHCO_OBJECTIVE_ORDERS;
};

execVM "voiceactivatedhighcommand\initialiseVAHCO.sqf";











/*

RGG_callVAHCO_MOVE_ORDERS = {

	_RGG_GRP_Num = RGG_GRP_Num select 0;

	if (RGG_Grp_Num == 1) then {

		// systemChat "Bravo 1 on the move..";
		_destination = leader groupBlu1 getPos [parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2];
		groupBlu1 move _destination;

		1 cutRsc ["C_L1_1","PLAIN"];
		waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
		_display = uiNameSpace getVariable "C_L1_1";
		_setText = _display displayCtrl 19001;
		_setText ctrlSetStructuredText (parseText format ["BRAVO 1 moving to: %1, (%2m at %3)", _destination, parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
	};

	if (RGG_Grp_Num == 2) then {

		// systemChat "Bravo 2 on the move..";
		_destination = leader groupBlu2 getPos [parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2];
		groupBlu2 move _destination;

		1 cutRsc ["C_L1_1","PLAIN"];
		waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
		_display = uiNameSpace getVariable "C_L1_1";
		_setText = _display displayCtrl 19001;
		_setText ctrlSetStructuredText (parseText format ["BRAVO 2 moving to: %1, (%2m at %3)", _destination, parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
	};

	if (RGG_Grp_Num == 3) then {

		// systemChat "Bravo 3 on the move..";
		_destination = leader groupBlu3 getPos [parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2];
		groupBlu3 move _destination;

		1 cutRsc ["C_L1_1","PLAIN"];
		waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
		_display = uiNameSpace getVariable "C_L1_1";
		_setText = _display displayCtrl 19001;
		_setText ctrlSetStructuredText (parseText format ["BRAVO 3 moving to: %1, (%2m at %3)", _destination, parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
	};

	if (RGG_Grp_Num == 4) then {

		// systemChat "Bravo 4 on the move..";
		_destination = leader groupBlu4 getPos [parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2];
		groupBlu4 move _destination;

		1 cutRsc ["C_L1_1","PLAIN"];
		waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
		_display = uiNameSpace getVariable "C_L1_1";
		_setText = _display displayCtrl 19001;
		_setText ctrlSetStructuredText (parseText format ["BRAVO 4 moving to: %1, (%2m at %3)", _destination, parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
	};

	if (RGG_Grp_Num == 5) then {

		// systemChat "Bravo 5 on the move..";
		_destination = leader groupBlu5 getPos [parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2];
		groupBlu5 move _destination;

		1 cutRsc ["C_L1_1","PLAIN"];
		waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
		_display = uiNameSpace getVariable "C_L1_1";
		_setText = _display displayCtrl 19001;
		_setText ctrlSetStructuredText (parseText format ["BRAVO 5 moving to: %1, (%2m at %3)", _destination, parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
	};
};

[] call RGG_callVAHCO_MOVE_ORDERS;
execVM "voiceactivatedhighcommand\initialiseVAHCO.sqf";


RGG_callVAHCO_MOVE_ORDERS = {

	_RGG_GRP_Num = RGG_GRP_Num select 0;

	if (_RGG_GRP_Num == 1) then {
		_parsedGrp = groupBlu1
	};
	if (_RGG_GRP_Num == 2) then {
		_parsedGrp = groupBlu2
	};
	if (_RGG_GRP_Num == 3) then {
		_parsedGrp = groupBlu3
	};
	if (_RGG_GRP_Num == 4) then {
		_parsedGrp = groupBlu4
	};
	if (_RGG_GRP_Num == 5) then {
		_parsedGrp = groupBlu5
	};

	if (RGG_Grp_Num == _RGG_GRP_Num) then {

		_destination = leader _parsedGrp getPos [parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2];
		_parsedGrp move _destination;

		1 cutRsc ["C_L1_1","PLAIN"];
		waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
		_display = uiNameSpace getVariable "C_L1_1";
		_setText = _display displayCtrl 19001;
		_setText ctrlSetStructuredText (parseText format ["BRAVO %1 moving to: %2, (%3m at %4)", _parsedGrp, _destination, parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
	};
};

[] call RGG_callVAHCO_MOVE_ORDERS;
execVM "voiceactivatedhighcommand\initialiseVAHCO.sqf"; // reset 





RGG_callVAHCO_MOVE_ORDERS = {

	RGG_GRP_Num = RGG_GRP_Num select 0;

	if (_RGG_GRP_Num == 1) then {
		_parsedGrp = groupBlu1;
	};
	if (_RGG_GRP_Num == 2) then {
		_parsedGrp = groupBlu2;
	};
	if (_RGG_GRP_Num == 3) then {
		_parsedGrp = groupBlu3;
	};
	if (_RGG_GRP_Num == 4) then {
		_parsedGrp = groupBlu4;
	};
	if (_RGG_GRP_Num == 5) then {
		_parsedGrp = groupBlu5;
	};

	_destination = leader _parsedGrp getPos [parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2];
	_parsedGrp move _destination;

	1 cutRsc ["C_L1_1","PLAIN"];
	waitUntil {!isNull (uiNameSpace getVariable "C_L1_1")};
	_display = uiNameSpace getVariable "C_L1_1";
	_setText = _display displayCtrl 19001;
	_setText ctrlSetStructuredText (parseText format ["BRAVO %1 moving to: %2, (%3m at %4)", _parsedGrp, _destination, parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2]);
	_setText ctrlSetBackgroundColor [0,0,0,0.5];
	
};

[] call RGG_callVAHCO_MOVE_ORDERS;
execVM "voiceactivatedhighcommand\initialiseVAHCO.sqf"; // reset 

// 02 September, I have attempted to reduce the repeated code by swapping below for the above ... delete if works!
// shit do i even need an ifThen here???






