// {_x moveInCargo _heli1} forEach groupBlu1;
// hint "hello";

// {
// 	switch ((side _x)) do
// 	{
// 		case EAST: { _x doMove (position player) };
// 		case WEST: {};
// 	};
// } forEach _units;

// GETIN = true;
// if (GETIN) then {
// 	_x doMove (position player);
// } forEach groupBlu1;

// bob moveInCargo [heli1, 1];

{
	[_x] orderGetIn true;
	_x assignAsCargoIndex [heli1, 3];
} forEach groupBlu1;


// unit1 moveInCargo [heli, 3];
// unit1 assignAsCargoIndex [heli, 3];