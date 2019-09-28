
_units = allUnits inAreaArray "healMe";
{
	_items = items _x;
	// systemChat str _items;
	// if ("FirstAidKit" in _items) then {
	// 	hint "A medic is nearby";
	// };
	if (typeOf _x == "B_medic_F") then {
		hint "medic is nearby";
	};
} forEach _units;	

// if (typeOf vehicle player == "B_Heli_Light_01_armed_F") then {hint "Player is in AH-9 Pawnee"};

_units = allUnits inAreaArray "healMe";
{
	if (typeOf _x == "B_medic_F") then {
		hint "medic is nearby";
	};
} forEach _units;	
  