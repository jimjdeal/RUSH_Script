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
*/

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

/*
try this:
sleep 3;
execVM "voiceactivatedhighcommand\VAHCO_clearKeyDowns.sqf";
execVM "voiceactivatedhighcommand\initialiseVAHCO.sqf";

*/

};
[] call RGG_callVAHCO_MOVE_ORDERS;

execVM "voiceactivatedhighcommand\initialiseVAHCO.sqf";














