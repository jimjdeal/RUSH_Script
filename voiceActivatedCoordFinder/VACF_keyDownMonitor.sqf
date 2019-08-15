
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
	