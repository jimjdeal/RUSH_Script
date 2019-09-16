/*
from:	voiceActivatedMissionGenerator\??.sqf
to:		voiceActivatedMissionGenerator\??.sqf
to:		voiceActivatedMissionGenerator\??.sqf
to: 	voiceActivatedMissionGenerator\??.sqf

purpose:
loop-listener that validates user input, and changes state at correct times 
when all entries have been made, the script will either progress to spawner, or cancel / reboot 

notes:
VAMG_conflictType 		= [];		// 4 options - infi, vic, air, mixed
VAMG_conflictTypeBool	= false;

VAMG_conflictSize		= [];		// 4 options -  S M L XL
VAMG_conflictSizeBool	= false;

VAMG_vicTypes			= []; 		// 5 options - confirmes types of spawned enemy vehicles
VAMG_vicTypesBool		= false;

VAMG_areaSize			= [];		// 4 options - immediate area, 1km 5km 10km
VAMG_areaSizeBool		= false;

VAMG_enemyPlacement		= []; 		// 2 options - clustered, distributed 
VAMG_enemyPlacementBool	= false;

VAMG_intel				= [];		// 4 options - how much assistance player has in finding the enemy
VAMG_intelBool			= false;

VAMG_enemyFaction		= [];		// 8 options - CSAT, FIA, RHS etc  
VAMG_enemyFactionBool	= false;

VAMG_enemyClass			= [];		// CSAT [1 CSAT Pacific, 2 CSAT Urban, 3 CSAT Recon, ..] etc 
VAMG_enemyClassBool		= false;

VAMG_enemyRF			= []; 		// 4 options - none, light once only, medium repeated twice, heavy repeated three times
VAMG_enemyRFBool		= false;

VAMG_conflictObj		= [];		// 2 options - Defend, attack, (observe & destroy, seek and destroy), get to the border 
VAMG_conflictObjBool	= false;

VAMG_confirm			= [];		// 2 options - create or cancel
VAMG_confirmBool		= false;
*/

// mission states 
MISSION_ATTACK 	= false;
MISSION_DEFEND 	= false;
MISSION_HUNT 	= false;
MISSION_RUN 	= false;


while {VAMG_numericalInputbool} do {

	_VAMG_val_conflictType 		= count VAMG_conflictType; 		
	_VAMG_val_conflictSize 		= count VAMG_conflictSize;		
	_VAMG_val_vicTypes 			= count VAMG_vicTypes;	
	_VAMG_val_areaSize 			= count VAMG_areaSize;		
	_VAMG_val_enemyPlacement 	= count VAMG_enemyPlacement;	
	_VAMG_val_intel 			= count VAMG_intel;			
	_VAMG_val_enemyFaction 		= count VAMG_enemyFaction;	
	_VAMG_val_enemyClass 		= count VAMG_enemyClass;	
	_VAMG_val_enemyRF 			= count VAMG_enemyRF;	
	_VAMG_val_conflictObj 		= count VAMG_conflictObj;
	_VAMG_val_confirm 			= count VAMG_confirm;		

	if (VAMG_conflictTypeBool) then {
		if (_VAMG_val_conflictType == 1) then {
			_VAMG_data = VAMG_conflictType select 0;
			// monday 16 test 
			switch (_VAMG_data) do {
				case 1: { systemChat "you selected infantry-based conflict"; systemChat "now confirm size of conflict"; systemChat "1 = Small, 2 = Medium, 3 = Large, 4 = X Large"; };
				case 2: { systemChat "you selected vehicle-based conflict"; systemChat "now confirm types of vehicles"; systemChat "1 = Light Vehicles, 2 = Medium Vehicles, 3 = Heavy Vehicles, 4 = Random"; };
				case 3: { systemChat "you selected air-based conflict (TBD)"; systemChat "now confirm size of conflict"; systemChat "1 = Small, 2 = Medium, 3 = Large, 4 = X Large"; };
				case 4: { systemChat "you selected mixed-element conflict (air TBD)"; systemChat "now confirm size of conflict"; systemChat "1 = Small, 2 = Medium, 3 = Large, 4 = X Large"; };
				default { systemChat "default" };
			};
			// end test 

			// if (_VAMG_data == 1) then {
			// 	systemChat "you selected infantry-based conflict";
			// 	systemChat "now confirm size of conflict";
			// 	systemChat "1 = Small, 2 = Medium, 3 = Large, 4 = X Large";
			// 	VAMG_conflictTypeBool = false;
			// 	VAMG_conflictSizeBool = true;
			// };
			// if (_VAMG_data == 2) then {
			// 	systemChat "you selected vehicle-based conflict";
			// 	systemChat "now confirm types of vehicles";
			// 	systemChat "1 = Light Vehicles, 2 = Medium Vehicles, 3 = Heavy Vehicles, 4 = Random";
			// 	VAMG_conflictTypeBool = false;
			// 	VAMG_vicTypesBool = true;
			// };
			// if (_VAMG_data == 3) then {
			// 	systemChat "you selected air-based conflict (TBD)";
			// 	systemChat "now confirm size of conflict";
			// 	systemChat "1 = Small, 2 = Medium, 3 = Large, 4 = X Large";
			// 	VAMG_conflictTypeBool = false;
			// 	VAMG_conflictSizeBool = true;
			// };
			// if (_VAMG_data == 4) then {
			// 	systemChat "you selected mixed-element conflict (air TBD)";
			// 	systemChat "now confirm size of conflict";
			// 	systemChat "1 = Small, 2 = Medium, 3 = Large, 4 = X Large";
			// 	VAMG_conflictTypeBool = false;
			// 	VAMG_conflictSizeBool = true;
			// };
		};
	};

	if (VAMG_vicTypesBool) then {
		if (_VAMG_val_vicTypes == 1) then {
			_VAMG_data = VAMG_vicTypes select 0;
			// monday 16 test 
			switch (_VAMG_data) do {
				case 1: { systemChat "you selected light-vehicles such as LSVs and Technicals"; };
				case 2: { systemChat "you selected medium-vehicles such as MRAPS and IFVs"; };
				case 3: { systemChat "you selected heavy-vehicles such as MBTs"; };
				case 4: { systemChat "you selected all types (randomised)"; };
				default { systemChat "default" };
			};
			// end test 
			// if (_VAMG_data == 1) then {
			// 	systemChat "you selected light-vehicles such as LSVs and Technicals";

			// };
			// if (_VAMG_data == 2) then {
			// 	systemChat "you selected medium-vehicles such as MRAPS and IFVs";

			// };
			// if (_VAMG_data == 3) then {
			// 	systemChat "you selected heavy-vehicles such as MBTs";

			// };
			// if (_VAMG_data == 4) then {
			// 	systemChat "you selected all types (randomised)";

			// };
			systemChat "now confirm size of conflict";
			systemChat "1 = Small, 2 = Medium, 3 = Large, 4 = X Large";
			VAMG_vicTypesBool = false;
			VAMG_conflictSizeBool = true;
		};
	};

	if (VAMG_conflictSizeBool) then {
		if (_VAMG_val_conflictSize == 1) then {
			_VAMG_data = VAMG_conflictSize select 0;
			// monday 16 test 
			switch (_VAMG_data) do {
				case 1: { systemChat "you selected small-scale conflict"; };
				case 2: { systemChat "you selected medium-scale conflict"; };
				case 3: { systemChat "you selected large-scale conflict"; };
				case 4: { systemChat "you selected epic-scale conflict"; };
				default { systemChat "default" };
			};
			// end test 

			// if (_VAMG_data == 1) then {
			// 	systemChat "you selected small-scale conflict";

			// };
			// if (_VAMG_data == 2) then {
			// 	systemChat "you selected medium-scale conflict";

			// };
			// if (_VAMG_data == 3) then {
			// 	systemChat "you selected large-scale conflict";

			// };
			// if (_VAMG_data == 4) then {
			// 	systemChat "you selected epic-scale conflict";

			// };
			systemChat "now confirm size of AO";
			systemChat "1 = Small, 2 = Medium, 3 = Large, 4 = Extensive";
			VAMG_conflictSizeBool = false;
			VAMG_areaSizeBool = true;
		};
	};

	if (VAMG_areaSizeBool) then {
		if (_VAMG_val_areaSize == 1) then {
			_VAMG_data = VAMG_areaSize select 0;
			// monday 16 test 
			switch (_VAMG_data) do {
				case 1: { systemChat "you selected Small Area (500m radius)"; };
				case 2: { systemChat "you selected Medium Area (1500m radius)"; };
				case 3: { systemChat "you selected Large Area (3000m radius)"; };
				case 4: { systemChat "you selected Extensive Area (5000m radius)"; };
				default { systemChat "default" };
			};
			// end test 
			// if (_VAMG_data == 1) then {
			// 	systemChat "you selected Small Area (500m radius)";

			// };
			// if (_VAMG_data == 2) then {
			// 	systemChat "you selected Medium Area (1500m radius)";

			// };
			// if (_VAMG_data == 3) then {
			// 	systemChat "you selected Large Area (3000m radius)";

			// };
			// if (_VAMG_data == 4) then {
			// 	systemChat "you selected Extensive Area (5000m radius)";

			// };
			systemChat "now confirm where to place the enemy";
			systemChat "1 = cluster, 2 = everywhere";
			VAMG_areaSizeBool = false;
			VAMG_enemyPlacementBool = true;
		};
	};

	if (VAMG_enemyPlacementBool) then {
		if (_VAMG_val_enemyPlacement == 1) then {
			_VAMG_data = VAMG_enemyPlacement select 0;
			// monday 16 test 
			switch (_VAMG_data) do {
				case 1: { systemChat "you selected to cluster the enemy in one area"; };
				case 2: { systemChat "you selected to place the enemy randomly, across the battle area"; };
				default { systemChat "default" };
			};
			// end test 
			// if (_VAMG_data == 1) then {
			// 	systemChat "you selected to cluster the enemy in one area";

			// };
			// if (_VAMG_data == 2) then {
			// 	systemChat "you selected to place the enemy randomly, across the battle area";

			// };
			systemChat "now confirm how to receive intel";
			systemChat "1 = once, 2 = periodic, 3 = never";
			VAMG_enemyPlacementBool = false;
			VAMG_intelBool = true;	
		};
	};

	// only works for placed / clustered enemy groups - random will skip
	if (VAMG_intelBool) then {
		if (_VAMG_val_intel == 1) then {
			_VAMG_data = VAMG_intel select 0;
			// mondy 16 test 
			switch (_VAMG_data) do {
				case 1: { systemChat "you selected to receive one initial notification of enemy location"; };
				case 2: { systemChat "you selected to receive periodic notifications of enemy location"; };
				case 3: { systemChat "you selected to receive no notifications of enemy location"; };
				default { systemChat "default" };
			};
			// end test 

			// if (_VAMG_data == 1) then {
			// 	systemChat "you selected to receive one initial notification of enemy location";

			// };
			// if (_VAMG_data == 2) then {
			// 	systemChat "you selected to receive periodic notifications of enemy location";

			// };
			// if (_VAMG_data == 3) then {
			// 	systemChat "you selected to receive no notifications of enemy location";

			// };
			systemChat "now confirm enemy faction";
			systemChat "1 = CSAT, 2 = IDF, 3 = RHS GREF";
			systemChat "4 = tbc, 5 = tbc, 6 = tbc";
			systemChat "7 = tbc, 8 = tbc,";
			VAMG_intelBool = false;
			VAMG_enemyFactionBool = true;	
		};
	};

	if (VAMG_enemyFactionBool) then {
		if (_VAMG_val_enemyFaction == 1) then {
			_VAMG_data = VAMG_enemyFaction select 0;
			// monday 16 test 
			switch (_VAMG_data) do {
				case 1: { systemChat "You selected CSAT"; systemChat "now confirm class of faction:"; systemChat "1 CSAT Standard, 2 CSAT Pacific, 3 CSAT Urban, 4 CSAT Recon, 5 CSAT Pacific Recon, 6 CSAT Viper, 7 CSAT Viper Pacific"; };
				case 2: { systemChat "You selected FIA"; };
				case 3: { systemChat "You selected RHS GREF"; };
				case 4: { systemChat "You selected TBC"; };
				case 5: { systemChat "You selected TBC"; };
				case 6: { systemChat "You selected TBC"; };
				case 7: { systemChat "You selected TBC"; };
				case 8: { systemChat "You selected TBC"; };
				default { systemChat "default" };
			};
			VAMG_enemyFactionBool = false;
			VAMG_enemyClassBool = true;
			// monday 16 end test 

			// if (_VAMG_data == 1) then {
			// 	systemChat "you selected CSAT";
			// 	systemChat "now confirm class of faction:";
			// 	systemChat "1 CSAT Standard, 2 CSAT Pacific, 3 CSAT Urban, 4 CSAT Recon, 5 CSAT Pacific Recon, 6 CSAT Viper, 7 CSAT Viper Pacific";
			// };
			// if (_VAMG_data == 2) then {
			// 	systemChat "you selected FIA";

			// };
			// if (_VAMG_data == 3) then {
			// 	systemChat "you selected RHS Russia";

			// };
			// if (_VAMG_data == 4) then {
			// 	systemChat "you selected TBC";

			// };
			// if (_VAMG_data == 5) then {
			// 	systemChat "you selected TBC";

			// };
			// if (_VAMG_data == 6) then {
			// 	systemChat "you selected TBC";

			// };
			// if (_VAMG_data == 7) then {
			// 	systemChat "you selected TBC";

			// };
			// if (_VAMG_data == 8) then {
			// 	systemChat "you selected TBC";

			// };
			// VAMG_enemyFactionBool = false;
			// VAMG_enemyClassBool = true;
			// systemChat "now confirm levels of enemy reinforcements";
			// systemChat "1 = no RF, 2 = single once, 3 = medium twice, 4 = heavy three times";
			// VAMG_enemyFactionBool = false;
			// VAMG_enemyRFBool = true;	
		};
	};

	// exp!
	if (VAMG_enemyClassBool) then {
		if (_VAMG_val_enemyClass == 1) then {
			_faction = VAMG_enemyFaction select 0;
			_class = VAMG_enemyClass select 0;
			if (_faction == 1) then {
				switch (_class) do {
					// case 1: { systemChat "You selected CSAT Standard"; systemChat "now confirm levels of enemy reinforcements"; VAMG_enemyClassBool = false, VAMG_enemyRFBool = true };
					// case 2: { systemChat "You selected CSAT Pacific"; systemChat "now confirm levels of enemy reinforcements"; VAMG_enemyClassBool = false, VAMG_enemyRFBool = true };
					// case 3: { systemChat "You selected CSAT Urban"; systemChat "now confirm levels of enemy reinforcements"; VAMG_enemyClassBool = false, VAMG_enemyRFBool = true };
					// case 4: { systemChat "You selected CSAT Recon"; systemChat "now confirm levels of enemy reinforcements"; VAMG_enemyClassBool = false, VAMG_enemyRFBool = true };
					// case 5: { systemChat "You selected CSAT Pacific Recon"; systemChat "now confirm levels of enemy reinforcements"; VAMG_enemyClassBool = false, VAMG_enemyRFBool = true };
					// case 6: { systemChat "You selected CSAT Viper"; systemChat "now confirm levels of enemy reinforcements"; VAMG_enemyClassBool = false, VAMG_enemyRFBool = true };
					// case 7: { systemChat "You selected CSAT Pacific Viper"; systemChat "now confirm levels of enemy reinforcements"; VAMG_enemyClassBool = false, VAMG_enemyRFBool = true };
					case 1: { systemChat "You selected CSAT Standard"; };
					case 2: { systemChat "You selected CSAT Pacific"; };
					case 3: { systemChat "You selected CSAT Urban"; };
					case 4: { systemChat "You selected CSAT Recon"; };
					case 5: { systemChat "You selected CSAT Pacific Recon"; };
					case 6: { systemChat "You selected CSAT Viper"; };
					case 7: { systemChat "You selected CSAT Pacific Viper"; };
					default { systemChat "default" };
				};	
			};
			// 16 sept test 
			// removed copied code from above, and try to use once, below
			systemChat "now confirm levels of enemy reinforcements"; 
			VAMG_enemyClassBool = false;
			VAMG_enemyRFBool = true;
		};
	};





	if (VAMG_enemyRFBool) then {
		if (_VAMG_val_enemyRF == 1) then {
			_VAMG_data = VAMG_enemyRF select 0;
			// monday 16 test 
			switch (_VAMG_data) do {
				case 1: { systemChat "you selected no enemy reinforcements"; };
				case 2: { systemChat "you selected single light enemy reinforcements"; };
				case 3: { systemChat "you selected two medium enemy reinforcements"; };
				case 4: { systemChat "you selected three heavy enemy reinforcements"; };
				default { systemChat "default" };
			};
			// VAMG_enemyFactionBool = false;
			// VAMG_enemyClassBool = true;
			// monday 16 end test 
			// if (_VAMG_data == 1) then {
			// 	systemChat "you selected no enemy reinforcements";

			// };
			// if (_VAMG_data == 2) then {
			// 	systemChat "you selected single light enemy reinforcements";

			// };
			// if (_VAMG_data == 3) then {
			// 	systemChat "you selected two medium enemy reinforcements";

			// };
			// if (_VAMG_data == 4) then {
			// 	systemChat "you selected three heavy enemy reinforcements";

			// };
			systemChat "now select mission type";
			systemChat "1 = you attack them, 2 = they attack you, 3 = you escape, 4 = they escape";
			VAMG_enemyRFBool = false;
			VAMG_conflictObjBool = true;	
		};
	};
// -------------- here VVVV ------------------ //
	if (VAMG_conflictObjBool) then {
		if (_VAMG_val_conflictObj == 1) then {
			_VAMG_data = VAMG_conflictObj select 0;
			// monday 16 test 
			switch (_VAMG_data) do {
				case 1: { systemChat "you chose to attack the enemy"; MISSION_ATTACK = true; };
				case 2: { systemChat "you chose to defend your position"; MISSION_DEFEND = true;};
				case 3: { systemChat "you chose the 'Get to the border - you escape they hunt' game type"; MISSION_HUNT = true; };
				case 4: { systemChat "you chose the 'Get to the border - they escape you hunt' game type"; MISSION_RUN = true;};
				default { systemChat "default" };
			};
			// if (_VAMG_data == 1) then {
			// 	systemChat "you chose to attack the enemy";
			// 	MISSION_ATTACK = true;
			// };
			// if (_VAMG_data == 2) then {
			// 	systemChat "you chose to defend your position";
			// 	MISSION_DEFEND = true;

			// };
			// if (_VAMG_data == 3) then {
			// 	systemChat "you chose the 'Get to the border - you escape they hunt' game type";
			// 	MISSION_HUNT = true;

			// };
			// if (_VAMG_data == 4) then {
			// 	systemChat "you chose the 'Get to the border - they escape you hunt' game type";
			// 	MISSION_RUN = true;
			// };
			systemChat "confirm or cancel";
			VAMG_conflictObjBool = false;
			VAMG_confirmBool = true;
		};
	};

	if (VAMG_confirmBool) then {
		if (_VAMG_val_confirm == 1) then {
			_VAMG_data = VAMG_confirm select 0;
			// monday 16 test 
			switch (_VAMG_data) do {
				case 1: { 
					systemChat "Confirmed! - Have Fun"; 
					execVM "voiceActivatedMissionGenerator\combatGen.sqf"; 
					VAMG_confirmBool = false;
					VAMG_numericalInputbool = false;
				};
				case 2: { 
					systemChat "Cancelled"; 
					execVM "voiceActivatedMissionGenerator\VAMG_init.sqf";
					execVM "voiceActivatedMissionGenerator\VAMG_clearKeyDowns.sqf";
				};
				default { systemChat "default" };
			// if (_VAMG_data == 1) then {
			// 	systemChat "Confirmed! - Have Fun";
			// 	execVM "voiceActivatedMissionGenerator\combatGen.sqf";
			// 	VAMG_confirmBool = false;
			// 	VAMG_numericalInputbool = false;
			// };
			// if (_VAMG_data == 2) then {
			// 	systemChat "Cancelled";
			// 	execVM "voiceActivatedMissionGenerator\VAMG_init.sqf";
			// 	execVM "voiceActivatedMissionGenerator\VAMG_clearKeyDowns.sqf";
			// };
		};
	};
};
