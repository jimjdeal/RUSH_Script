/*
from:
to:
purpose:
to set up initial options for mission generation 

notes:
first choice is to confirm types of enemy - infi only, vics only, air only or mixed - last two are TBD

infi 
S = 10 units 
M = 20 units 
L = 35 units 
XL = 50 units

vic
S = 3 units 
M = 6 units 
L = 10 units 
XL = 20 units

vicTypes
Light = technicals / LSV
Light Armour = MRAPS / IFVs 
Heavy Armour = MBTs etc 
Mixed = random based on SMLXL 

area size 
small = 500m radius 
medium = 1.5km radius 
large = 3km radius 
x large = 5km radius

placement
decides whether to spawn them randomly in battleArea, or in a much smaller cluster, positioned randomly

intel 
Gives the player an indication of enemies 
this could be a one-off, or based on proximity - ie opfor roughly this way at roughly half a click
1 = cluster - initial only (not effective if enemy is dist)
2 = cluster - always on (intel shows direction and distance of enemy cluster)


faction
options for enemy 

FR 
How often enemy forces are replenished after mission start / or conflict starts?

objective 
this sets whether the enemy will seek out the blu forces, or whether they will seek to defend their position  
defend = player needs to defent their position 
attack = plyer needs to attack the opfor forces 
O&D = optional with rules around arty maybe? not for v1.
get to the border is a special game type 
here, the player and any units have to reach a certain point, where blu RF are waiting. 
BluRF cannot come to your aid for political reasons, but they can hold their grouns and cover your escape 
Opfor will spawn both around you (light) and behind you (heavy) and always move to your position 
Can you escape back to the safety of the border?
*/

VAMG_numericalInputBool	= false;

VAMG_conflictType 		= [];		// 4 options - infi, vic, air, mixed
VAMG_conflictTypeBool	= false;

VAMG_conflictSize		= [];		// 4 options -  M L XL
VAMG_conflictSizeBool	= false;

VAMG_vicTypes			= []; 		// 5 options - confirmes types of spawned enemy vehicles
VAMG_vicTypesBool		= false;

VAMG_areaSize			= [];		// 4 options - immediate area, 1km 5km 10km
VAMG_areaSizeBool		= false;

VAMG_enemyPlacement		= []; 		// 2 options - clustered, distributed 
VAMG_enemyPlacementBool	= false;

VAMG_intel				= [];		// 4 options - how much assistance player has in finding the enemy
VAMG_intelBool			= false;

VAMG_enemyFaction		= [];		// 9 options - CSAT, VANILLA REBELS, RHS, PROJECT OPFOR
VAMG_enemyFactionBool	= false;

VAMG_enemyClass			= [];		// CSAT [1 CSAT Pacific, 2 CSAT Urban, 3 CSAT Recon, 4 CSAT Pacific Recon, 5 CSAT Viper, 6 CSAT Viper Pacific], FIA [??] RHS [??] 
VAMG_enemyClassBool		= false;

VAMG_enemyRF			= []; 		// 4 options - none, light once only, medium repeated twice, heavy repeated three times
VAMG_enemyRFBool		= false;

VAMG_conflictObj		= [];		// 2 options - Defend, attack, (observe & destroy, seek and destroy) get to the border 
VAMG_conflictObjBool	= false;

VAMG_confirm			= [];		// 2 options - create or cancel
VAMG_confirmBool		= false;

// ------------------------------------------------------------------ //
// key = "numpad 7 = 71"
RGG_VAMG_Activate = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((!VAMP) && (_this select 1 == 71)) then {
	vamp = true;
	systemChat 'Welcome to VAMG - Voice Activated Mission Generator';
	systemChat 'Confirm Misison Type';
	systemChat '1 = Create Infantry-Based Conflict';
	systemChat '2 = Create Vehicle-Based Conflict';
	systemChat '3 = Create Airbourne-Based Conflict (TBD)';
	systemChat '4 = Create Mixed-Element Conflict';
	_ehRemove1 = (findDisplay 46) displayRemoveEventHandler ['keyDown',RGG_VAMG_Activate];
	VAMG_numericalInputBool = true; 
	VAMG_conflictTypeBool = true;
	execVM 'voiceActivatedMissionGenerator\VAMG_keyDowns.sqf'; 
	execVM 'voiceActivatedMissionGenerator\VAMG_keyDownMonitor.sqf'; 	
}"];
// ------------------------------------------------------------------ //

