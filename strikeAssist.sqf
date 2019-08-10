// will try to somehow locate exactr 10g coords for benefit of FO 







// process - enter 6grid, for the 100m square..
// once you have your 6-grid coord, you can gen 10m markers lan and lon 
// _playerRenderedPos = getPosVisual player;

// _AO_MarkerNorth = player getPos [250, 0];
// _AO_MarkerSouth = player getPos [250, 180];
// _AO_MarkerEast = player getPos [250, 90];
// _AO_MarkerWest = player getPos [250, 270];

// deleteMarker "AO_MarkerNorth";
// _AO_MarkerNorth = createMarker ["AO_MarkerNorth", _AO_MarkerNorth];
// "AO_MarkerNorth" setMarkerSize [10, 10];
// "AO_MarkerNorth" setMarkerShape "ELLIPSE";
// "AO_MarkerNorth" setMarkerColor "ColorGreen";

// deleteMarker "AO_MarkerSouth";
// _AO_MarkerSouth = createMarker ["AO_MarkerSouth", _AO_MarkerSouth];
// "AO_MarkerSouth" setMarkerSize [10, 10];
// "AO_MarkerSouth" setMarkerShape "ELLIPSE";
// "AO_MarkerSouth" setMarkerColor "ColorGreen";

// deleteMarker "AO_MarkerEast";
// _AO_MarkerEast = createMarker ["AO_MarkerEast", _AO_MarkerEast];
// "AO_MarkerEast" setMarkerSize [10, 10];
// "AO_MarkerEast" setMarkerShape "ELLIPSE";
// "AO_MarkerEast" setMarkerColor "ColorGreen";

// deleteMarker "AO_MarkerWest";
// _AO_MarkerWest = createMarker ["AO_MarkerWest", _AO_MarkerWest];
// "AO_MarkerWest" setMarkerSize [10, 10];
// "AO_MarkerWest" setMarkerShape "ELLIPSE";
// "AO_MarkerWest" setMarkerColor "ColorGreen";

// // the above gives you an origin to work with// next create line 

// _southAnchor = getMarkerPos "AO_MarkerSouth";
// _AO_MarkerSouth10 = _southAnchor getPos [10, 180];
// _AO_MarkerSouth20 = _southAnchor getPos [20, 180];
// _AO_MarkerSouth30 = _southAnchor getPos [30, 180];
// _AO_MarkerSouth40 = _southAnchor getPos [40, 180];
// _AO_MarkerSouth50 = _southAnchor getPos [50, 180];

// points
// deleteMarker "_AO_MarkerSouth10";
// _AO_MarkerSouth10 = createMarker ["_AO_MarkerSouth10", _AO_MarkerSouth10];
// "_AO_MarkerSouth10" setMarkerSize [300, 0.2];
// "_AO_MarkerSouth10" setMarkerShape "RECTANGLE";
// "_AO_MarkerSouth10" setMarkerColor "ColorGreen";

// deleteMarker "_AO_MarkerSouth20";
// _AO_MarkerSouth10 = createMarker ["_AO_MarkerSouth20", _AO_MarkerSouth20];
// "_AO_MarkerSouth20" setMarkerSize [300, 0.2];
// "_AO_MarkerSouth20" setMarkerShape "RECTANGLE";
// "_AO_MarkerSouth20" setMarkerColor "ColorGreen";

// deleteMarker "_AO_MarkerSouth30";
// _AO_MarkerSouth30 = createMarker ["_AO_MarkerSouth30", _AO_MarkerSouth30];
// "_AO_MarkerSouth30" setMarkerSize [300, 0.2];
// "_AO_MarkerSouth30" setMarkerShape "RECTANGLE";
// "_AO_MarkerSouth30" setMarkerColor "ColorGreen";

// deleteMarker "_AO_MarkerSouth40";
// _AO_MarkerSouth40 = createMarker ["_AO_MarkerSouth40", _AO_MarkerSouth40];
// "_AO_MarkerSouth40" setMarkerSize [300, 0.2];
// "_AO_MarkerSouth40" setMarkerShape "RECTANGLE";
// "_AO_MarkerSouth40" setMarkerColor "ColorGreen";

// deleteMarker "_AO_MarkerSouth50";
// _AO_MarkerSouth50 = createMarker ["_AO_MarkerSouth50", _AO_MarkerSouth50];
// "_AO_MarkerSouth50" setMarkerSize [300, 0.2];
// "_AO_MarkerSouth50" setMarkerShape "RECTANGLE";
// "_AO_MarkerSouth50" setMarkerColor "ColorGreen";

// lines
// deleteMarker "_AO_MarkerSouth10Line";
// createMarker ["_AO_MarkerSouth10Line", _AO_MarkerSouth10];
// "_AO_MarkerSouth10Line" setMarkerSize [100, 1];
// "_AO_MarkerSouth10Line" setMarkerShape "SQUARE";
// "_AO_MarkerSouth10Line" setMarkerColor "ColorGreen";

// deleteMarker "_AO_MarkerSouth20Line";
// createMarker ["_AO_MarkerSouth20Line", _AO_MarkerSouth20];
// "_AO_MarkerSouth20Line" setMarkerSize [100, 1];
// "_AO_MarkerSouth20Line" setMarkerShape "SQUARE";
// "_AO_MarkerSouth20Line" setMarkerColor "ColorGreen";

// deleteMarker "_AO_MarkerSouth30Line";
// createMarker ["_AO_MarkerSouth30Line", _AO_MarkerSouth30];
// "_AO_MarkerSouth30Line" setMarkerSize [100, 1];
// "_AO_MarkerSouth30Line" setMarkerShape "SQUARE";
// "_AO_MarkerSouth30Line" setMarkerColor "ColorGreen";

// deleteMarker "_AO_MarkerSouth40Line";
// createMarker ["_AO_MarkerSouth40Line", _AO_MarkerSouth40];
// "_AO_MarkerSouth40Line" setMarkerSize [100, 1];
// "_AO_MarkerSouth40Line" setMarkerShape "SQUARE";
// "_AO_MarkerSouth40Line" setMarkerColor "ColorGreen";

// deleteMarker "_AO_MarkerSouth50Line";
// createMarker ["_AO_MarkerSouth50Line", _AO_MarkerSouth50];
// "_AO_MarkerSouth50Line" setMarkerSize [100, 1];
// "_AO_MarkerSouth50Line" setMarkerShape "SQUARE";
// "_AO_MarkerSouth50Line" setMarkerColor "ColorGreen";