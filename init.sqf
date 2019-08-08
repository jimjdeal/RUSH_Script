execVM "markers.sqf";
execVM "missionParams.sqf";

sleep 3;

// spawn initial blufor 
for "_i" from 1 to 5 do { 
	"B_W_Soldier_CBRN_F" createUnit [position player, group player]; 
	sleep 0.2;
};
sleep 0.5;
for "_i" from 1 to 10 do { 
	"B_W_Soldier_CBRN_F" createUnit [getMarkerPos "rightFlank", groupBlu1]; 
	sleep 0.2;
};
sleep 0.5;
for "_i" from 1 to 10 do { 
	"B_W_Soldier_CBRN_F" createUnit [getMarkerPos "leftFlank", groupBlu2]; 
	sleep 0.2;
};

sleep 10;
execVM "counter.sqf";


















































// // init counter mechanism
// while {true} do {
// 	[_groupBlu1, _groupBlu2] execVM "counter.sqf";
// 	// [1000] execVM "counter.sqf";
// 	sleep 20;
// }


// _groupBlu1Count = count units group _groupBlu1;
// systemChat "Left Flank:";
// // systemChat str _parsedGroupBlu1;
// systemChat str _groupBlu1Count;



























