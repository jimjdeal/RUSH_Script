disableSerialization;

_lat = _this select 0;
_lon = _this select 1;

1 cutRsc ["VACF","PLAIN"];

waitUntil {!isNull (uiNameSpace getVariable "VACF")};
	
_display = uiNameSpace getVariable "VACF";
_setText = _display displayCtrl 1001;
_setText ctrlSetStructuredText (parseText format ["Lat: %1 / Lon: %2",_lat, _lon]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

// so I assume at this point ^^^ we have completed the VACF process, and have a confirmed coord we can play with 
// and this is now sitting in the bottom right of the screen 
// what would be nice, is to instead have this ^^ rendered in the center of the screen, with a new question...
// where would you like to store this coord?
// VAMP can store upto 5 separate coords, labelled by colour: Red Green Blue Yellow White 
// VAMP will automatically init a script called coordDisplay, which will have a placeholder for all 5 coords in bottom right of screen 
// this will be more discreet that the current storage (of one coord), and will be colour coded 
// once a coord is allocated to a colour, it also gets given a map marker of corresponding colour, to assist with navigation and mgmt of stored coords
// once a coord is stored in the library it can be used in a few different ways 
// you can send units to "Objective Red" 
// you can call in fire missions to "Objective Blue"
// you can generate waypoints "Bravo 1, sending waypoints" / "move to objective Red" / "(then) move to objective blue" 

/*
known challenges 

I need to be able to mark a coord location using my look drection, and intersects with ground! this way, I can look at a building 
lock the location, assign location to colour, and get units to move in 

Also, if a player is in the map, planning waypoint, they need to be able to use the system while in the map 
so does this mean we have a planning mode, where waypoints are designated within the map itself, and that this is different from VACF?

We also need to be able to enable a player to call in a strike through both coords, and objective Red 

so I thik this:
VACF gives the player a rendered coord, as it does now, and does not invite any further managegemt. But it lives on the screen as always the last gathered coord.
We can then also have placeholders for 'stored locations', where a player can open up a new module - stored locations - to create objectives or waypoint data 

so we need a brand new module, that enables the storage and display of upto 5 coords, labelled by colour.

so, "activate location manager"
PLEASE ENTER COORDS 
"12345" "35652"
PLEASE ASSIGN COLOUR 
"green"
THANK YOU - OBJECTIVE GREEN IS NOW STORED AND CAN BE USED FOR OPERATIONS 

now a coord is stored in the GREENARRAY, and can be called upon when:
ordering fire strikes, 
move orders 
waypoint orders 
