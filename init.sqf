
execVM "missionParams.sqf";

if (is3DEN) exitwith {};
if (isDedicated) exitWith {};
waituntil {!isNull findDisplay 46}; 
/*
from:		n/a
to:			voiceActivatedArty\VAA_Init.sqf
to:			voiceActivatedCoordFinder\VACF_init.sqf
to:			voiceActivatedHighCommandOrders\VAHCO_init.sqf
to:			voiceActivatedUnitSpawner\VAUS_init.sqf

purpose:
trigger relevant modules 

notes:
link all of these into one script, so just call one thing from here...
need to trigger config params from here too dont forget
understand how to better use preprocessFileLineNumbers across whole script!
*/

call compile preprocessFileLineNumbers "voiceActivatedArty\VAA_Init.sqf";
execVM "voiceActivatedCoordFinder\VACF_init.sqf";
execVM "voiceActivatedHighCommandOrders\VAHCO_init.sqf";
execVM "voiceActivatedUnitSpawner\VAUS_init.sqf";





