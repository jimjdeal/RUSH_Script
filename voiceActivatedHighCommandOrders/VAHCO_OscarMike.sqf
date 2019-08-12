hint "oscar mike running";
_parsed_VAHCO_GroupSelect	= VAHCO_groupSelect joinString "";
_parsed_VAHCO_OrderType		= VAHCO_orderSelect joinString "";
_parsed_VAHCO_MoveDistance	= VAHCO_distance joinString "";
_parsed_VAHCO_MoveDirection	= VAHCO_heading joinString "";

parsed_VAHCO_GroupSelect2 	= parseNumber _parsed_VAHCO_GroupSelect;
parsed_VAHCO_OrderType2	= parseNumber _parsed_VAHCO_OrderType;
parsed_VAHCO_MoveDistance2	= parseNumber _parsed_VAHCO_MoveDistance;
parsed_VAHCO_MoveDirection2= parseNumber _parsed_VAHCO_MoveDirection;

execVM "voiceActivatedHighCommandOrders\VAHCO_clearKeyDowns.sqf";
systemChat "processing VAHCO data...";
sleep 3;

RGG_callVAHCO_MOVE_ORDERS = {

	if (RGG_Grp_Num == 1) then {
		systemChat "Bravo 1 on the move..";
		_destination = leader groupBlu1 getPos [parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2];
		groupBlu1 move _destination;
	};
	if (RGG_Grp_Num == 2) then {
		systemChat "Bravo 2 on the move..";
		_destination = leader groupBlu2 getPos [parsed_VAHCO_MoveDistance2, parsed_VAHCO_MoveDirection2];
		groupBlu2 move _destination;
	};

};
[] call RGG_callVAHCO_MOVE_ORDERS;
	
execVM "voiceActivatedHighCommandOrders\initialiseVAHCO.sqf";














