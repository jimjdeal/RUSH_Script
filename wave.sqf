systemChat "wave script running";
// this file now holds group creation, spawning and movement orders 

// spawn opfor 
groupRed1 = createGroup east;
groupRed2 = createGroup east;
groupRed3 = createGroup east;
for "_i" from 1 to 4 do { 
	"O_V_Soldier_TL_ghex_F" createUnit [getMarkerPos "opRightWP", groupRed1]; 
};
for "_i" from 1 to 4 do { 
	"O_V_Soldier_TL_ghex_F" createUnit [getMarkerPos "opCenterWP", groupRed2]; 
};
for "_i" from 1 to 4 do { 
	"O_V_Soldier_TL_ghex_F" createUnit [getMarkerPos "opLeftWP", groupRed3]; 
};


sleep 15;
// move blu units to new WPs 
groupBlu1 move getMarkerPos "rightFlankWP";
systemChat "blu1 move orders issued";
sleep 2;
groupBlu2 move getMarkerPos "leftFlankWP";
systemChat "blu2 move orders issued";

// now to move red units to new WPs 
groupRed1 move getMarkerPos "rightFlankWP";
groupRed3 move getMarkerPos "playerWP";
groupRed2 move getMarkerPos "leftFlankWP";