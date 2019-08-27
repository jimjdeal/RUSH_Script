
execVM "missionParams.sqf";

if (is3DEN) exitwith {};
if (isDedicated) exitWith {};
waituntil {!isNull findDisplay 46}; 

// link all of these into one script, so just call one thing from here...

call compile preprocessFileLineNumbers "voiceActivatedArty\VAA_Init.sqf";
execVM "voiceActivatedCoordFinder\VACF_init.sqf";
execVM "voiceActivatedHighCommandOrders\VAHCO_init.sqf";
execVM "voiceActivatedUnitSpawner\VAUS_init.sqf";





