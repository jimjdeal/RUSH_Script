
// trying out this file as the main display for initialisation, but maybe also progression 

// header 
1 cutRsc ["VAUS_MAINTITLE","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VAUS_MAINTITLE")};
_display = uiNameSpace getVariable "VAUS_MAINTITLE";
_setText = _display displayCtrl 10000;
_setText ctrlSetStructuredText (parseText format ["WELCOME TO VAUS - VOICE ACTIVATED UNIT SPAWNER"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];


// sub headers 
2 cutRsc ["VAUS_SUBTITLE_n1","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VAUS_SUBTITLE_n1")};
_display = uiNameSpace getVariable "VAUS_SUBTITLE_n1";
_setText = _display displayCtrl 10001;
_setText ctrlSetStructuredText (parseText format ["COMMAND TYPE"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

3 cutRsc ["VAUS_SUBTITLE_n2","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VAUS_SUBTITLE_n2")};
_display = uiNameSpace getVariable "VAUS_SUBTITLE_n2";
_setText = _display displayCtrl 10002;
_setText ctrlSetStructuredText (parseText format ["GROUP"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

4 cutRsc ["VAUS_SUBTITLE_n3","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VAUS_SUBTITLE_n3")};
_display = uiNameSpace getVariable "VAUS_SUBTITLE_n3";
_setText = _display displayCtrl 10003;
_setText ctrlSetStructuredText (parseText format ["CAMO"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];


// body 
5 cutRsc ["VAUS_CONTENT_n1","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n1")};
_display = uiNameSpace getVariable "VAUS_CONTENT_n1";
_setText = _display displayCtrl 10004;
_setText ctrlSetStructuredText (parseText format ["DIRECT COMMAND<BR/>HIGH COMMAND"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
_display = uiNameSpace getVariable "VAUS_CONTENT_n2";
_setText = _display displayCtrl 10005;
_setText ctrlSetStructuredText (parseText format ["PLATOON<BR/>FIRE TEAM<BR/>SNIPER TEAM<BR/>AA TEAM<BR/>AA TEAM<BR/>ENGINEERING TEAM<BR/>DEMOLITION TEAM<BR/>MEDICAL TEAM"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

7 cutRsc ["VAUS_CONTENT_n3","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n3")};
_display = uiNameSpace getVariable "VAUS_CONTENT_n3";
_setText = _display displayCtrl 10006;
_setText ctrlSetStructuredText (parseText format ["ALTIS<BR/>DESERT<BR/>WOODLAND"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];


// footer 
8 cutRsc ["VAUS_CONFIRMCANCEL","PLAIN"];
waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONFIRMCANCEL")};
_display = uiNameSpace getVariable "VAUS_CONFIRMCANCEL";
_setText = _display displayCtrl 10007;
_setText ctrlSetStructuredText (parseText format ["CONFIRM / CANCEL"]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

