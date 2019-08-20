// VAUS - Voice Activated Unit Spawner //

// old script that did not work 

systemChat "keydown monitor activated";
/*
from:	voiceActivatedUnitSpawner\initialiseVAUS.sqf 
to:		voiceActivatedUnitSpawner\VAUS_create_DC_Units.sqf
to: 	voiceActivatedUnitSpawner\VAUS_create_HC_Units.sqf;
*/

/*
Managing these states and arrays:
VAUS_controlBool 	/ 		VAUS_control
VAUS_camoBool 		/ 		VAUS_camo
VAUS_groupBool 		/ 		VAUS_group
VAUS_confirmBool 	/ 		VAUS_confirm
*/

/*
Notes:
Build exit when reached 5 HC groups!
*/

// ------------------------------------------------------------------ //

while {VAUS_numericalInputbool} do {

	// input validators 
	// xxx_confirmedControl counts / validates that the correct numbers are held in each array
	VAUS_confirmedControl	= count VAUS_control; 	// should hold 1 value, specifying whether direct control or HC 
	VAUS_confirmedGroup		= count VAUS_group; 	// should hold 1 value, specifying type of team wanted 
	VAUS_confirmedCamo 		= count VAUS_camo; 		// should hold 1 value, specifying which colour camo is wanted 
	VAUS_confirmedConfirm	= count VAUS_confirm;	// should hold 1 value, spacifying whether player wants to create or cancel instruction

// ------------------------------------------------------------------ //

	// choose direct control or high command 
	if (VAUS_controlBool) then {

		if (VAUS_confirmedControl == 1) then {

			if (VAUS_control == 1) then {
				systemChat "you selected to have them under your direct control";
				// 5 cutRsc ["VAUS_CONTENT_n1","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n1")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n1";
				// _setText = _display displayCtrl 10004;
				// _setText ctrlSetStructuredText (parseText format ["DIRECT COMMAND"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};
			if (VAUS_control == 2) then {
				systemChat "you selected to have them as HC units";
				// 5 cutRsc ["VAUS_CONTENT_n1","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n1")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n1";
				// _setText = _display displayCtrl 10004;
				// _setText ctrlSetStructuredText (parseText format ["HIGH COMMAND"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];

				// _groupBlu1Count = count units group groupBlu1;
				// _groupBlu2Count = count units group groupBlu2;
				// _groupBlu3Count = count units group groupBlu3;
				// _groupBlu4Count = count units group groupBlu4;
				// _groupBlu5Count = count units group groupBlu5;
				// VAUS_activeGroups = _groupBlu1Count + _groupBlu2Count + _groupBlu3Count + _groupBlu4Count + _groupBlu5Count;

				if (VAUS_activeGroups == 5) then {
					systemChat "you have reached max groups, no more allowed";
					// need to build exit code here 
				};

			};

			systemChat "question 2 - what type of group do you want?";
			systemChat "1 = fire team x 4, 	2 = full platoon x 20, 	3 = sniper team x 2";
			systemChat "4 = at team x 3, 	5 = aa team x 3, 		6 = eng team x 2";
			systemChat "7 = demo team x 2, 	8 = medic team x 4";

			VAUS_controlBool = false;
			VAUS_groupBool = true;

		};
	};

	// choose type of squad 
	if (VAUS_groupBool) then {

		if (VAUS_confirmedGroup == 1) then {

			if (VAUS_group == 1) then {
				systemChat "you selected fire team";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["FIRE TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};
			if (VAUS_group == 2) then {
				systemChat "you selected full platoon";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["PLATOON"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};
			if (VAUS_group == 3) then {
				systemChat "you selected sniper team";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["SNIPER TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};
			if (VAUS_group == 4) then {
				systemChat "you selected AT team";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["AT TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};
			if (VAUS_group == 5) then {
				systemChat "you selected AA team";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["AA TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};
			if (VAUS_group == 6) then {
				systemChat "you selected eng team";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["ENGINEERING TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};
			if (VAUS_group == 7) then {
				systemChat "you selected demo team";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["DEMOLITION TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};
			if (VAUS_group == 8) then {
				systemChat "you selected medic team";
				// 6 cutRsc ["VAUS_CONTENT_n2","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n2")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n2";
				// _setText = _display displayCtrl 10005;
				// _setText ctrlSetStructuredText (parseText format ["MEDICAL TEAM"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};
			
			systemChat "question 3 - what camo is required?";
			systemChat "1 = vanilla camo, 2 = RHS Desert, 3 = Livonia Woodland";

			VAUS_groupBool = false;
			VAUS_camoBool = true;

		};
	};
	

	// choose camo - vanilla, desert or woodland 
	if (VAUS_camoBool) then {

		if (VAUS_confirmedCamo == 1) then {

			if (VAUS_camo == 1) then {
				systemChat "you selected vanilla camo";
				// 7 cutRsc ["VAUS_CONTENT_n3","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n3")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n3";
				// _setText = _display displayCtrl 10006;
				// _setText ctrlSetStructuredText (parseText format ["ALTIS"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};
			if (VAUS_camo == 2) then {
				systemChat "you selected RHS Desert";
				// 7 cutRsc ["VAUS_CONTENT_n3","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n3")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n3";
				// _setText = _display displayCtrl 10006;
				// _setText ctrlSetStructuredText (parseText format ["DESERT"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};
			if (VAUS_camo == 3) then {
				systemChat "you selected Livonian Woodland";
				// 7 cutRsc ["VAUS_CONTENT_n3","PLAIN"];
				// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONTENT_n3")};
				// _display = uiNameSpace getVariable "VAUS_CONTENT_n3";
				// _setText = _display displayCtrl 10006;
				// _setText ctrlSetStructuredText (parseText format ["WOODLAND"]);
				// _setText ctrlSetBackgroundColor [0,0,0,0.5];
			};

			sleep 1;

			VAUS_camoBool = false;
			VAUS_confirmBool = true;

			systemChat "review your selection and confirm / cancel";
			systemChat "1 = confirm, 2 = cancel";

		};
	};

	// confirm or cancel 
	if (VAUS_confirmBool) then {

		// 8 cutRsc ["VAUS_CONFIRMCANCEL","PLAIN"];
		// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONFIRMCANCEL")};
		// _display = uiNameSpace getVariable "VAUS_CONFIRMCANCEL";
		// _setText = _display displayCtrl 10007;
		// _setText ctrlSetStructuredText (parseText format ["CONFIRM / CANCEL"]);
		// _setText ctrlSetBackgroundColor [0,0,0,0.5];

		if (VAUS_confirmedConfirm == 1) then {
			
			// 8 cutRsc ["VAUS_CONFIRMCANCEL","PLAIN"];
			// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONFIRMCANCEL")};
			// _display = uiNameSpace getVariable "VAUS_CONFIRMCANCEL";
			// _setText = _display displayCtrl 10007;
			// _setText ctrlSetStructuredText (parseText format ["CONFIRMED"]);
			// _setText ctrlSetBackgroundColor [0,0,0,0.5];

			// [VAUS_control, VAUS_group, VAUS_camo] execVM voiceActivatedUnitSpawner\VAUS_createUnits.sqf;
		
		};

		if (VAUS_confirmedConfirm == 2) then {
			systemChat "selection has been cancelled - standing down";

			// 8 cutRsc ["VAUS_CONFIRMCANCEL","PLAIN"];
			// waitUntil {!isNull (uiNameSpace getVariable "VAUS_CONFIRMCANCEL")};
			// _display = uiNameSpace getVariable "VAUS_CONFIRMCANCEL";
			// _setText = _display displayCtrl 10007;
			// _setText ctrlSetStructuredText (parseText format ["CANCELLED"]);
			// _setText ctrlSetBackgroundColor [0,0,0,0.5];

			execVM "voiceActivatedUnitSpawner\VAUS_clearKeyDowns.sqf";
			execVM "voiceActivatedUnitSpawner\initialiseVAUS.sqf";
		};

	};

	sleep 1;
	systemChat "cyclke";
};

// I realise it is pointless to send globals as params when execVMing a script - this should remind me to swap out any globals to locals when i refactor 





	// VAUS_confirmedtype 		= count VAUS_type; 		// should hold 1 value, specifying whether units or vics 
	// VAUS_confirmedCrewed 	= count VAUS_crewed; 	// 
	// VAUS_confirmedVicType 	= count VAUS_vicType; 	//
	// VAUS_confirmedCarType 	= count VAUS_carType; 	//
	// VAUS_confirmedHeliType 	= count VAUS_heliType; 	//


	// level Root1 - choose units  
	// if (VAUS_controlBool) then {

	// 	if (VAUS_confirmedtype == 1) then {

	// 		if (VAUS_type == 1) then {
	// 			systemChat "you selected units";
	// 			systemChat "now confirm whether you want them in your own group or HC";
	// 			systemChat "1 = your own group, 2 = HC";
	// 			VAUS_typeBool = false;
	// 			VAUS_controlBool = true;
	// 		};

	// 		if (VAUS_type == 2) then {
	// 			systemChat "you selected vehicles";
	// 			systemChat "now confirm if you want it crewed or not";
	// 			systemChat "1 = crewed, 2 = empty";
	// 			VAUS_typeBool = false;
	// 			VAUS_crewedBool = false;
	// 		};

	// 	};
	// };



/*

									VAUS_typeBool
					VAUS_controlBool			VAUS_vicTypeBool
					VAUS_camoBool		VAUS_carTypeBool	VAUS_heliTypeBool
					VAUS_groupBool		VAUS_crewedBool		VAUS_crewedBool			
					VAUS_confirmBool	VAUS_confirmBool	VAUS_confirmBool
									VAUS_executeBool
*/




// should be moved to vic spawner:
// VAUS_typeBool 		/ 		VAUS_type
// VAUS_crewedBool 		/ 		VAUS_crewed
// VAUS_vicTypeBool 	/ 		VAUS_vicType
// VAUS_carTypeBool 	/ 		VAUS_carType
// VAUS_heliTypeBool 	/ 		VAUS_heliType














/*
delete 
		if (confirmedTypeSU == 1) then {

			if (confirmedLatDigits == 5) then {
				systemChat "5 digit latitude received...";
				systemChat str splashCoordsLat;
				systemChat "now enter longitude";
				
				latCoordInputBool = false;
				lonCoordInputBool = true;
			};

		} else {

			if (confirmedLatDigits == 4) then {

				splashCoordsLat pushback 0;
				systemChat "4 digit latitude received...";
				systemChat str splashCoordsLat;
				playSound "dangerClose3";
				systemChat "now enter longitude";
				latCoordInputBool = false;
				lonCoordInputBool = true;
			};
		};

*/


// ------------------------------------------------------------------ //


/*

// below is copied 
while {VACF_numericalInputbool} do {

	// counts / validates the correct numbers are held in each array
	confirmedHeading = count VACF_Heading; // should be 3 // actually this will now be 5 - i.e. adding two decimal places to the input to enhahnce accuracy
	confirmedDistance = count VACF_Distance; // should be 4 // 
	
	// Heading
	if (VACF_headingBool) then {
		if (confirmedHeading == 5) then {

			// systemChat "heading received...";
			// systemChat str VACF_Heading;
			// systemChat "now enter distance";
			VACF_headingBool = false;
			VACF_distanceBool = true;
		};
	};

	// distance (previous / works)
	if (VACF_distanceBool) then {
		if (confirmedDistance == 4) then {

			// systemChat "distance received...";
			// systemChat str VACF_Distance;
			systemChat "vacf processing...";
			VACF_distanceBool = false;
			VACF_showCoords = true;
		};
	};

	if (VACF_showCoords) then {
		execVM "voiceActivatedCoordFinder\VACF_prepareCoords.sqf";
		// systemChat "called prepareCoords";
		VACF_showCoords = false;
	};

	sleep 0.1;
};	
	