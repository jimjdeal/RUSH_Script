// systemChat "wave script running";
// this file holds group creation, spawning and movement orders 

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


// movement orders:

// move blu units to WPs 
groupBlu1 move getMarkerPos "rightFlankWP";
// systemChat "blu1 move orders issued";
sleep 2;
groupBlu2 move getMarkerPos "leftFlankWP";
// systemChat "blu2 move orders issued";

// move red units to WPs 
groupRed1 move getMarkerPos "rightFlankWP";
sleep 2;
groupRed3 move getMarkerPos "playerWP";
sleep 2;
groupRed2 move getMarkerPos "leftFlankWP";