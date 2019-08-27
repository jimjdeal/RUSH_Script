// systemChat "markers running";

deleteMarker "Marker1";
_AO_Marker = player getPos [800, 180];
_AO_Marker = createMarker ["Marker1", _AO_Marker];
"Marker1" setMarkerSize [1000, 2000];
"Marker1" setMarkerShape "RECTANGLE";
"Marker1" setMarkerAlpha 0.5;
"Marker1" setMarkerColor "ColorBlack";

// create blufor AI group markers
deleteMarker "leftFlank";
_leftFlank = player getPos [50, 270];
_leftFlank = createMarker ["leftFlank", _leftFlank];
// "leftFlank" setMarkerSize [10, 10];
// "leftFlank" setMarkerShape "RECTANGLE";
// "leftFlank" setMarkerAlpha 0.9;
// "leftFlank" setMarkerColor "ColorRed";

deleteMarker "rightFlank";
_rightFlank = player getPos [50, 90];
_rightFlank = createMarker ["rightFlank", _rightFlank];
// "rightFlank" setMarkerSize [10, 10];
// "rightFlank" setMarkerShape "RECTANGLE";
// "rightFlank" setMarkerAlpha 0.9;
// "rightFlank" setMarkerColor "ColorRed";

// the next three are objective markers - three blue squares to dominate!
deleteMarker "rightFlankWP";
_blu1Waypoint = getMarkerPos "rightFlank";
_blu1Waypoint = _blu1Waypoint getPos [200,180];
_blu1Waypoint = createMarker ["rightFlankWP", _blu1Waypoint];
"rightFlankWP" setMarkerSize [30, 30];
"rightFlankWP" setMarkerShape "RECTANGLE";
"rightFlankWP" setMarkerAlpha 0.9;
"rightFlankWP" setMarkerColor "ColorBlue";

deleteMarker "leftFlankWP";
_blu2Waypoint = getMarkerPos "leftFlank";
_blu2Waypoint = _blu2Waypoint getPos [200,180];
_blu2Waypoint = createMarker ["leftFlankWP", _blu2Waypoint];
"leftFlankWP" setMarkerSize [30, 30];
"leftFlankWP" setMarkerShape "RECTANGLE";
"leftFlankWP" setMarkerAlpha 0.9;
"leftFlankWP" setMarkerColor "ColorBlue";

deleteMarker "playerWP";
_playerWaypoint = position Player;
_playerWaypoint = _playerWaypoint getPos [200,180];
_playerWaypoint = createMarker ["playerWP", _playerWaypoint];
"playerWP" setMarkerSize [30, 30];
"playerWP" setMarkerShape "RECTANGLE";
"playerWP" setMarkerAlpha 0.9;
"playerWP" setMarkerColor "ColorBlue";

// the following three markers are used for opfor gen, but are not needed visually 
deleteMarker "opRightWP";
_op1Waypoint = getMarkerPos "rightFlank";
_op1Waypoint = _op1Waypoint getPos [3000,180];
_op1Waypoint = createMarker ["opRightWP", _op1Waypoint];
// "opRightWP" setMarkerSize [30, 30];
// "opRightWP" setMarkerShape "RECTANGLE";
// "opRightWP" setMarkerAlpha 0.9;
// "opRightWP" setMarkerColor "ColorRed";

deleteMarker "opCenterWP";
_op2Waypoint = position Player;
_op2Waypoint = _op2Waypoint getPos [3000,180];
_op2Waypoint = createMarker ["opCenterWP", _op2Waypoint];
// "opCenterWP" setMarkerSize [30, 30];
// "opCenterWP" setMarkerShape "RECTANGLE";
// "opCenterWP" setMarkerAlpha 0.9;
// "opCenterWP" setMarkerColor "ColorRed";

// now create a new marker for the player to move to
deleteMarker "opLeftWP";
_op3Waypoint = getMarkerPos "leftFlank";
_op3Waypoint = _op3Waypoint getPos [3000,180];
_op3Waypoint = createMarker ["opLeftWP", _op3Waypoint];
// "opLeftWP" setMarkerSize [30, 30];
// "opLeftWP" setMarkerShape "RECTANGLE";
// "opLeftWP" setMarkerAlpha 0.9;
// "opLeftWP" setMarkerColor "ColorRed";

execVM "wave.sqf";