/*
from:	voiceActivatedUnitSpawner\VAUS_keyDowns.sqf
to:		display 

purpose:
sets out RSC layer allocation and initial display data for UI 

notes:
you can ofc change the text values here, and they will alter the text in the UI 
I am still to change this, the camo question does not make sense here, what is in fact a better design is that have the user 
set their own config for units, and by doing so can manage their own camo choices. 
This was for my own personal use, but is probably better to have left up to the user
*/

// ------------------------------------------------------------------ //

disableSerialization;


10 cutRsc ["B18_L1_1","PLAIN"]; // main title

20 cutRsc ["B18_L2_1","PLAIN"]; // command type
30 cutRsc ["B18_L2_2","PLAIN"]; // group
40 cutRsc ["B18_L2_3","PLAIN"]; // division

50 cutRsc ["B18_L3_1","PLAIN"]; // direct command
60 cutRsc ["B18_L4_1","PLAIN"]; // high command

70 cutRsc ["B18_L3_2","PLAIN"]; // eg fire team
80 cutRsc ["B18_L4_2","PLAIN"];
90 cutRsc ["B18_L3_3","PLAIN"]; 
100 cutRsc ["B18_L4_3","PLAIN"];
110 cutRsc ["B18_L3_4","PLAIN"];
120 cutRsc ["B18_L4_4","PLAIN"];
130 cutRsc ["B18_L3_5","PLAIN"];
140 cutRsc ["B18_L4_5","PLAIN"]; // eg medic team

150 cutRsc ["B18_L3_6","PLAIN"]; // woodland
160 cutRsc ["B18_L4_6","PLAIN"]; // desert

170 cutRsc ["B18_L5_1","PLAIN"]; // confirm 
180 cutRsc ["B18_L5_2","PLAIN"]; // cancel

09 cutRsc ["B18_BG","PLAIN"]; // bg 
200 cutRsc ["B18_TopLine","PLAIN"]; // top divider 
210 cutRsc ["B18_BottomLine1","PLAIN"]; // bottom divider 

// 211 cutRsc ["B18_BottomLine2","PLAIN"]; // bottom divider - unused
// 212 cutRsc ["B18_BottomLine2","PLAIN"]; // bottom divider - unused

waitUntil {!isNull (uiNameSpace getVariable "B18_BG")};


// header
_display = uiNameSpace getVariable "B18_L1_1";
_setText = _display displayCtrl 18001;
_setText ctrlSetStructuredText (parseText format ["WELCOME TO VAUS - VOICE ACTIVATED UNIT SPAWNER"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 1];


// BG 
_display = uiNameSpace getVariable "B18_BG";
_setText = _display displayCtrl 18020;
_setText ctrlSetBackgroundColor [0,0,0,0.6]; 
// _setText ctrlSetTextColor [0, 1, 0, 1];


// top line 
_display = uiNameSpace getVariable "B18_TopLine";
_setText = _display displayCtrl 18021;
_setText ctrlSetBackgroundColor [0,0,0,0.8];
// _setText ctrlSetTextColor [0, 1, 0, 1];


// first prompt 
_display = uiNameSpace getVariable "B18_BottomLine1";
_setText = _display displayCtrl 18022;
_setText ctrlSetBackgroundColor [0,1,0,0.8];
// _setText ctrlSetTextColor [0, 1, 0, 1];


// sub headers 
_display = uiNameSpace getVariable "B18_L2_1";
_setText = _display displayCtrl 18002;
_setText ctrlSetStructuredText (parseText format ["COMMAND TYPE"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 1];

_display = uiNameSpace getVariable "B18_L2_2";
_setText = _display displayCtrl 18003;
_setText ctrlSetStructuredText (parseText format ["GROUP"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 1];

_display = uiNameSpace getVariable "B18_L2_3";
_setText = _display displayCtrl 18004;
_setText ctrlSetStructuredText (parseText format ["DIVISION"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 1];


// body column 1
_display = uiNameSpace getVariable "B18_L3_1";
_setText = _display displayCtrl 18005;
_setText ctrlSetStructuredText (parseText format ["DIRECT COMMAND"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 0.5];

_display = uiNameSpace getVariable "B18_L4_1";
_setText = _display displayCtrl 18011;
_setText ctrlSetStructuredText (parseText format ["HIGH COMMAND"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 0.5];


// body column 2
_display = uiNameSpace getVariable "B18_L3_2";
_setText = _display displayCtrl 18006;
_setText ctrlSetStructuredText (parseText format ["FIRE TEAM"]); // change the text in quotes to whatever you want, if you want a different name in the UI
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 0.5];

_display = uiNameSpace getVariable "B18_L4_2";
_setText = _display displayCtrl 18012;
_setText ctrlSetStructuredText (parseText format ["AA TEAM"]); // change the text in quotes to whatever you want, if you want a different name in the UI
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 0.5];


// body column 3
_display = uiNameSpace getVariable "B18_L3_3";
_setText = _display displayCtrl 18007;
_setText ctrlSetStructuredText (parseText format ["PLATOON"]); // change the text in quotes to whatever you want, if you want a different name in the UI
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 0.5];

_display = uiNameSpace getVariable "B18_L4_3";
_setText = _display displayCtrl 18013;
_setText ctrlSetStructuredText (parseText format ["ENG TEAM"]); // change the text in quotes to whatever you want, if you want a different name in the UI
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 0.5];


// body column 4
_display = uiNameSpace getVariable "B18_L3_4";
_setText = _display displayCtrl 18008;
_setText ctrlSetStructuredText (parseText format ["SNIPER TEAM"]); // change the text in quotes to whatever you want, if you want a different name in the UI
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 0.5];

_display = uiNameSpace getVariable "B18_L4_4";
_setText = _display displayCtrl 18014;
_setText ctrlSetStructuredText (parseText format ["DEMO TEAM"]); // change the text in quotes to whatever you want, if you want a different name in the UI
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 0.5];


// body column 5
_display = uiNameSpace getVariable "B18_L3_5";
_setText = _display displayCtrl 18009;
_setText ctrlSetStructuredText (parseText format ["AT TEAM"]); // change the text in quotes to whatever you want, if you want a different name in the UI
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 0.5];

_display = uiNameSpace getVariable "B18_L4_5";
_setText = _display displayCtrl 18015;
_setText ctrlSetStructuredText (parseText format ["MEDIC TEAM"]); // change the text in quotes to whatever you want, if you want a different name in the UI
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 0.5];


// body column 6
_display = uiNameSpace getVariable "B18_L3_6";
_setText = _display displayCtrl 18010;
_setText ctrlSetStructuredText (parseText format ["WOODLAND"]); // I would leave these for now ... they gonna change
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 0.5];

_display = uiNameSpace getVariable "B18_L4_6";
_setText = _display displayCtrl 18016;
_setText ctrlSetStructuredText (parseText format ["DESERT"]); // I would leave these for now ... they gonna change
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 0.5];


// footer
_display = uiNameSpace getVariable "B18_L5_1";
_setText = _display displayCtrl 18017;
_setText ctrlSetStructuredText (parseText format ["CONFIRM"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 0.5];

_display = uiNameSpace getVariable "B18_L5_2";
_setText = _display displayCtrl 18018;
_setText ctrlSetStructuredText (parseText format ["CANCEL"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];
_setText ctrlSetTextColor [0, 1, 0, 0.5];

// ------------------------------------------------------------------ //





// below here is the old stuff... ignore

// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
// _setText = _display displayCtrl 10005;
// _setText ctrlSetStructuredText (parseText format ["PLATOON<BR />FIRE TEAM<BR />SNIPER TEAM<BR />AA TEAM<BR />AA TEAM<BR />ENGINEERING TEAM<BR />DEMOLITION TEAM<BR />MEDICAL TEAM"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];

// 7 cutRsc ["VAUS_CONTENT_n3","PLAIN"];
// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n3")};
// _display = uiNameSpace getVariable "VAUS_CONTENT_n3";
// _setText = _display displayCtrl 10006;
// _setText ctrlSetStructuredText (parseText format ["ALTIS<BR/>DESERT<BR/>WOODLAND"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];

// // footer 
// 8 cutRsc ["VAUS_CONFIRMCANCEL","PLAIN"];
// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONFIRMCANCEL")};
// _display = uiNameSpace getVariable "VAUS_CONFIRMCANCEL";
// _setText = _display displayCtrl 10007;
// _setText ctrlSetStructuredText (parseText format ["CONFIRM / CANCEL"]);
// _setText ctrlSetBackgroundColor [0,0,0,0.5];

