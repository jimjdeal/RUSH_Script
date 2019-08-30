/*
from:	voiceActivatedVehicleSpawner\VAVS_keyDownMonitor.sqf

purpose:
clears all currently assigned key down event handlers 
also clears down all rendered UI 
lastly, turns VAMP back to 'active (false)'

notes:
no cancel EH here, however you can cancel selection at the end...
*/
//
_ehVAVS_Remove0 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vavs_kd0];
_ehVAVS_Remove2 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vavs_kd1];
_ehVAVS_Remove3 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vavs_kd2];
_ehVAVS_Remove4 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vavs_kd3];
_ehVAVS_Remove5 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vavs_kd4];
_ehVAVS_Remove6 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vavs_kd5];
_ehVAVS_Remove7 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vavs_kd6];
_ehVAVS_Remove8 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vavs_kd7];
_ehVAVS_Remove9 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vavs_kd8];
_ehVAVS_Remove10 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vavs_kd9];

VAVS_numericalInputbool = false;
// 9 cutRsc ["default","PLAIN"];
// 10 cutRsc ["default","PLAIN"];
// 20 cutRsc ["default","PLAIN"];
// 30 cutRsc ["default","PLAIN"];
// 40 cutRsc ["default","PLAIN"];
// 50 cutRsc ["default","PLAIN"];
// 60 cutRsc ["default","PLAIN"];
// 70 cutRsc ["default","PLAIN"];
// 80 cutRsc ["default","PLAIN"];
// 90 cutRsc ["default","PLAIN"];
// 100 cutRsc ["default","PLAIN"];
// 110 cutRsc ["default","PLAIN"];
// 120 cutRsc ["default","PLAIN"];
// 130 cutRsc ["default","PLAIN"];
// 140 cutRsc ["default","PLAIN"];
// 150 cutRsc ["default","PLAIN"];
// 160 cutRsc ["default","PLAIN"];
// 170 cutRsc ["default","PLAIN"];
// 180 cutRsc ["default","PLAIN"];
// 200 cutRsc ["default","PLAIN"]; 
// 213 cutRsc ["default","PLAIN"]; // remove last prompt

vamp = false;