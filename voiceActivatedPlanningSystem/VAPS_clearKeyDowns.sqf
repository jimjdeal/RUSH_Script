/*
from:		

purpose:
clears all currently assigned key down event handlers 
(will) also clears down all rendered UI 
lastly, turns VAMP back to 'active (false)'

notes:
add CANCEL!
add RSC removals 
*/

_ehVAPS_Remove0 	= (findDisplay 12) displayRemoveEventHandler ["keyDown",rgg_vaps_kd0];
_ehVAPS_Remove2 	= (findDisplay 12) displayRemoveEventHandler ["keyDown",rgg_vaps_kd1];
_ehVAPS_Remove3 	= (findDisplay 12) displayRemoveEventHandler ["keyDown",rgg_vaps_kd2];
_ehVAPS_Remove4 	= (findDisplay 12) displayRemoveEventHandler ["keyDown",rgg_vaps_kd3];
_ehVAPS_Remove5 	= (findDisplay 12) displayRemoveEventHandler ["keyDown",rgg_vaps_kd4];
_ehVAPS_Remove6 	= (findDisplay 12) displayRemoveEventHandler ["keyDown",rgg_vaps_kd5];
_ehVAPS_Remove7 	= (findDisplay 12) displayRemoveEventHandler ["keyDown",rgg_vaps_kd6];
_ehVAPS_Remove8 	= (findDisplay 12) displayRemoveEventHandler ["keyDown",rgg_vaps_kd7];
_ehVAPS_Remove9 	= (findDisplay 12) displayRemoveEventHandler ["keyDown",rgg_vaps_kd8];
_ehVAPS_Remove10	= (findDisplay 12) displayRemoveEventHandler ["keyDown",rgg_vaps_kd9];

VAPS_numericalInputbool = false;

// sleep 3; // quick visual validation of accepted order 
// 1 cutRsc ["default","PLAIN"];

// sleep 0.5;
// systemChat "VAHCO RESET";

vamp = false;