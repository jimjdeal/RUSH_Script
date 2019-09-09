/*
from:	voiceActivatedUnitSpawner\VAUS_keyDownMonitor.sqf

purpose:
clears all currently assigned key down event handlers 
also clears down all rendered UI 
lastly, turns VAMP back to 'active (false)'

notes:
no cancel EH here, however you can cancel selection at the end...
*/

_ehVAUS_Remove0 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vaus_kd0];
_ehVAUS_Remove2 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vaus_kd1];
_ehVAUS_Remove3 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vaus_kd2];
_ehVAUS_Remove4 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vaus_kd3];
_ehVAUS_Remove5 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vaus_kd4];
_ehVAUS_Remove6 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vaus_kd5];
_ehVAUS_Remove7 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vaus_kd6];
_ehVAUS_Remove8 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vaus_kd7];
_ehVAUS_Remove9 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vaus_kd8];
_ehVAUS_Remove10 	= (findDisplay 46) displayRemoveEventHandler ["keyDown",rgg_vaus_kd9];

VAUS_numericalInputbool = false;
9 cutRsc ["default","PLAIN"];
10 cutRsc ["default","PLAIN"];
20 cutRsc ["default","PLAIN"];
30 cutRsc ["default","PLAIN"];
40 cutRsc ["default","PLAIN"];
50 cutRsc ["default","PLAIN"];
60 cutRsc ["default","PLAIN"];
70 cutRsc ["default","PLAIN"];
80 cutRsc ["default","PLAIN"];
90 cutRsc ["default","PLAIN"];
100 cutRsc ["default","PLAIN"];
110 cutRsc ["default","PLAIN"];
120 cutRsc ["default","PLAIN"];
130 cutRsc ["default","PLAIN"];
140 cutRsc ["default","PLAIN"];
150 cutRsc ["default","PLAIN"];
160 cutRsc ["default","PLAIN"];
170 cutRsc ["default","PLAIN"];
180 cutRsc ["default","PLAIN"];
200 cutRsc ["default","PLAIN"]; 
210 cutRsc ["default","PLAIN"]; 
211 cutRsc ["default","PLAIN"]; 
212 cutRsc ["default","PLAIN"]; 
213 cutRsc ["default","PLAIN"]; // remove last prompt //

vamp = false;

