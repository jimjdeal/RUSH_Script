/*
from:		executeSU.sqf 
to:

purpose:
to inflict more damage around the impact point, as the vanilla GBU does surprisingly little damage 

notes:
*/

_impact = _this select 0;

hint str _impact;
/*
// createMarker
deleteMarker "blast1";
_marker1 = createMarker ["blast1", _pos];
_marker1 setMarkerShapeLocal "ELLIPSE";
// _marker1 setMarkerColorLocal "ColorRed";
_marker1 setMarkerSizeLocal [100, 100];
_marker1 setMarkerAlphaLocal 0.1;

/*
all units inAreaArray
setDamage 1;
*/


// deleteMarker "blast1";
