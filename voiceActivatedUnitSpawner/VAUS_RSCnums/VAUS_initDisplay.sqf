
// trying out this file as the main display for initialisation, but maybe also progression 

// header 
1 cutRsc ["B18_L1_1","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L1_1")};
_display = uiNameSpace getVariable "B18_L1_1";
_setText = _display displayCtrl 18001;
_setText ctrlSetStructuredText (parseText format ["WELCOME TO VAUS - VOICE ACTIVATED UNIT SPAWNER"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];


// sub headers 
2 cutRsc ["B18_L2_1","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L2_1")};
_display = uiNameSpace getVariable "B18_L2_1";
_setText = _display displayCtrl 18002;
_setText ctrlSetStructuredText (parseText format ["COMMAND TYPE"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

3 cutRsc ["B18_L2_2","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L2_2")};
_display = uiNameSpace getVariable "B18_L2_2";
_setText = _display displayCtrl 18003;
_setText ctrlSetStructuredText (parseText format ["GROUP"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

4 cutRsc ["B18_L2_3","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L2_3")};
_display = uiNameSpace getVariable "B18_L2_3";
_setText = _display displayCtrl 18004;
_setText ctrlSetStructuredText (parseText format ["DIVISION"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];


// body column 1
5 cutRsc ["B18_L3_1","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L3_1")};
_display = uiNameSpace getVariable "B18_L3_1";
_setText = _display displayCtrl 18005;
_setText ctrlSetStructuredText (parseText format ["DIRECT COMMAND"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

6 cutRsc ["B18_L4_1","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L3_1")};
_display = uiNameSpace getVariable "B18_L3_1";
_setText = _display displayCtrl 18012;
_setText ctrlSetStructuredText (parseText format ["HIGH COMMAND"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];


// body column 2
7 cutRsc ["B18_L3_2","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L3_1")};
_display = uiNameSpace getVariable "B18_L3_1";
_setText = _display displayCtrl 18007;
_setText ctrlSetStructuredText (parseText format ["FIRE TEAM"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

8 cutRsc ["B18_L4_2","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L3_1")};
_display = uiNameSpace getVariable "B18_L3_1";
_setText = _display displayCtrl 18013;
_setText ctrlSetStructuredText (parseText format ["AA TEAM"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];


// body column 3
9 cutRsc ["B18_L3_3","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L3_3")};
_display = uiNameSpace getVariable "B18_L3_3";
_setText = _display displayCtrl 18008;
_setText ctrlSetStructuredText (parseText format ["PLATOON"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

10 cutRsc ["B18_L4_3","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L4_3")};
_display = uiNameSpace getVariable "B18_L4_3";
_setText = _display displayCtrl 18014;
_setText ctrlSetStructuredText (parseText format ["ENG TEAM"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];


// body column 4
11 cutRsc ["B18_L3_4","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L3_4")};
_display = uiNameSpace getVariable "B18_L3_4";
_setText = _display displayCtrl 18009;
_setText ctrlSetStructuredText (parseText format ["SNIPER TEAM"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

12 cutRsc ["B18_L4_4","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L4_4")};
_display = uiNameSpace getVariable "B18_L4_4";
_setText = _display displayCtrl 18015;
_setText ctrlSetStructuredText (parseText format ["DEMO TEAM"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];


// body column 5
13 cutRsc ["B18_L3_5","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L3_5")};
_display = uiNameSpace getVariable "B18_L3_5";
_setText = _display displayCtrl 18010;
_setText ctrlSetStructuredText (parseText format ["AT TEAM"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

14 cutRsc ["B18_L4_5","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L4_5")};
_display = uiNameSpace getVariable "B18_L4_5";
_setText = _display displayCtrl 18015;
_setText ctrlSetStructuredText (parseText format ["MEDIC TEAM"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];


// body column 6
15 cutRsc ["B18_L3_5","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L3_5")};
_display = uiNameSpace getVariable "B18_L3_5";
_setText = _display displayCtrl 18011;
_setText ctrlSetStructuredText (parseText format ["WOODLAND"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

16 cutRsc ["B18_L4_5","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L4_5")};
_display = uiNameSpace getVariable "B18_L4_5";
_setText = _display displayCtrl 18016;
_setText ctrlSetStructuredText (parseText format ["DESERT"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];


// footer
17 cutRsc ["B18_L5_1","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L3_5")};
_display = uiNameSpace getVariable "B18_L3_5";
_setText = _display displayCtrl 18017;
_setText ctrlSetStructuredText (parseText format ["CONFIRM"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

18 cutRsc ["B18_L5_2","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "B18_L4_5")};
_display = uiNameSpace getVariable "B18_L4_5";
_setText = _display displayCtrl 18018;
_setText ctrlSetStructuredText (parseText format ["CANCEL"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];







// below here is the old stuff...




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

