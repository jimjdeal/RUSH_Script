/*
from: 	voiceActivatedVehicleSpawner\VAVS_keyDownMonitor.sqf
to:		voiceActivatedVehicleSpawner\VAVS_clearKeyDowns.sqf
to:		voiceActivatedVehicleSpawner\initialiseVAVS.sqf

purpose:
this script actually does the 'creating' of vics 
if you want to add your own group configs (arrays of units), this is the place.

notes:
createVehicle [type, position, markers, placement, special]
Needs a safePos mechanic here!

02 september 07:16 - in trying to find the HC group disappear bug, I think this may be linked to my added HC group numbers too many times, below, in the HC section.
Next commit will attempt to clean up this inefficiency.
I have also cleaned uo the mechanic to limit groups to 5 - this was not working before, let's see if it is fixed now..
Here is a potential biggie - I use VAUS for both VAUS 'and' VAVS! Shouldn't VAVS have it's own var, and then add them together, or even use a common var for both?
Or, does this just work as-is?
Another thought - hc_grp = groupBlu1; this line means that hc_group can change, with that one var applied to ony one of the five groups, could this be conflicting in some way?


*/

_vicCat			= VAVS_vicType select 0; // DC or HC
_carType		= VAVS_carType select 0; // e.g. IFV, MBT etc 
_ifvType		= VAVS_IFV_Type select 0; // e.g. panther, cheetah
_mrapType		= VAVS_MRAP_Type select 0; // e.g. hunter
_lsvType		= VAVS_LSV_Type select 0; // e.g. Prowler
_mbtType		= VAVS_MBT_Type select 0; // e.g. scorcher
_hemmtType		= VAVS_HEMTT_Type select 0; // e.g. transport covered
_otherType		= VAVS_Other_Type select 0; // e.g. quad bike
_camoType		= VAVS_Basic_Camo select 0; // e.g. altis or tanoa
_exCamoType		= VAVS_Ext_Camo select 0; // e.g. altis, tanoa black etc 
_spawnPos		= player getRelPos [10, 0]; // 10m in front of where player is looking 

// DC
if (_vicCat == 1) then {

	// IFV
	if (_carType == 1) then {
		if (_ifvType == 1) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_APC_Tracked_01_rcws_F", _spawnPos];
				// [_spawnPos, 180, "B_APC_Tracked_01_rcws_F", WEST] call bis_fnc_spawnvehicle;
			} else {
				_vic = createVehicle ["B_T_APC_Tracked_01_rcws_F", _spawnPos];
			};
		};
		if (_ifvType == 2) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_APC_Tracked_01_AA_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_APC_Tracked_01_AA_F", _spawnPos];
			};
		};
		if (_ifvType == 3) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_APC_Tracked_01_CRV_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_APC_Tracked_01_CRV_F", _spawnPos];
			};
		};
		if (_ifvType == 4) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_APC_Wheeled_01_cannon_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_APC_Wheeled_01_cannon_F", _spawnPos];
			};
		};
		if (_ifvType == 5) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_APC_Wheeled_03_cannon_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_APC_Wheeled_03_cannon_F", _spawnPos];
			};
		};
	};

	// MRAP
	if (_carType == 2) then {
		if (_mrapType == 1) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_MRAP_01_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_MRAP_01_F", _spawnPos];
			};
		};
		if (_mrapType == 2) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_MRAP_01_gmg_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_MRAP_01_gmg_F", _spawnPos];
			};
		};
		if (_mrapType == 3) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_MRAP_01_hmg_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_MRAP_01_hmg_F", _spawnPos];
			};
		};
	};

	// LSV
	if (_carType == 3) then {
		if (_lsvType == 1) then {
			if (_exCamoType == 1) then {
				_vic = createVehicle ["B_LSV_01_unarmed_F", _spawnPos];
			};
			if (_exCamoType == 2) then {
				_vic = createVehicle ["B_T_LSV_01_unarmed_F", _spawnPos];
			};
			if (_exCamoType == 3) then {
				_vic = createVehicle ["B_T_LSV_01_unarmed_CTRG_F", _spawnPos];
			};
			if (_exCamoType == 4) then {
				_vic = createVehicle ["B_LSV_01_unarmed_black_F", _spawnPos];
			};
			if (_exCamoType == 5) then {
				_vic = createVehicle ["B_T_LSV_01_unarmed_black_F", _spawnPos];
			};
			if (_exCamoType == 6) then {
				_vic = createVehicle ["B_LSV_01_unarmed_olive_F", _spawnPos];
			};
			if (_exCamoType == 7) then {
				_vic = createVehicle ["B_T_LSV_01_unarmed_olive_F", _spawnPos];
			};
			if (_exCamoType == 8) then {
				_vic = createVehicle ["B_LSV_01_unarmed_sand_F", _spawnPos];
			};
			if (_exCamoType == 9) then {
				_vic = createVehicle ["B_T_LSV_01_unarmed_sand_F", _spawnPos];
			};
		};
		if (_lsvType == 2) then {
			if (_exCamoType == 1) then {
				_vic = createVehicle ["B_T_LSV_01_armed_F", _spawnPos];
			};
			if (_exCamoType == 2) then {
				_vic = createVehicle ["B_T_LSV_01_armed_CTRG_F", _spawnPos];
			};
			if (_exCamoType == 3) then {
				_vic = createVehicle ["B_LSV_01_armed_F", _spawnPos];
			};
			if (_exCamoType == 4) then {
				_vic = createVehicle ["B_LSV_01_armed_black_F", _spawnPos];
			};
			if (_exCamoType == 5) then {
				_vic = createVehicle ["B_T_LSV_01_armed_black_F", _spawnPos];
			};
			if (_exCamoType == 6) then {
				_vic = createVehicle ["B_LSV_01_armed_olive_F", _spawnPos];
			};
			if (_exCamoType == 7) then {
				_vic = createVehicle ["B_T_LSV_01_armed_olive_F", _spawnPos];
			};
			if (_exCamoType == 8) then {
				_vic = createVehicle ["B_LSV_01_armed_sand_F", _spawnPos];
			};
			if (_exCamoType == 9) then {
				_vic = createVehicle ["B_T_LSV_01_armed_sand_F", _spawnPos];
			};
		};
		if (_lsvType == 3) then {
			if (_exCamoType == 1) then {
				_vic = createVehicle ["B_T_LSV_01_AT_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_LSV_01_AT_F", _spawnPos];
			};
		};
		if (_lsvType == 4) then {
			if (_exCamoType == 1) then {
				_vic = createVehicle ["B_CTRG_LSV_01_light_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_CTRG_LSV_01_light_F", _spawnPos];
			};
		};
	};

	// MBT
	if (_carType == 4) then {
		if (_mbtType == 1) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_MBT_01_cannon_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_MBT_01_cannon_F", _spawnPos];
			};
		};
		if (_mbtType == 2) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_MBT_01_TUSK_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_MBT_01_TUSK_F", _spawnPos];
			};
		};
		if (_mbtType == 3) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_MBT_01_arty_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_MBT_01_arty_F", _spawnPos];
			};
		};
		if (_mbtType == 4) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_MBT_01_mlrs_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_MBT_01_mlrs_F", _spawnPos];
			};
		};
	};

	// hemmt
	if (_carType == 5) then {
		if (_hemmtType == 1) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_Truck_01_mover_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_Truck_01_mover_F", _spawnPos];
			};
		};
		if (_hemmtType == 2) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_Truck_01_box_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_Truck_01_box_F", _spawnPos];
			};
		};
		if (_hemmtType == 3) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_Truck_01_covered_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_Truck_01_covered_F", _spawnPos];
			};
		};
		if (_hemmtType == 4) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_Truck_01_transport_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_Truck_01_transport_F", _spawnPos];
			};
		};
		if (_hemmtType == 5) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_Truck_01_Repair_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_Truck_01_Repair_F", _spawnPos];
			};
		};
		if (_hemmtType == 6) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_Truck_01_ammo_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_Truck_01_ammo_F", _spawnPos];
			};
		};
		if (_hemmtType == 7) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_Truck_01_fuel_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_Truck_01_fuel_F", _spawnPos];
			};
		};
		if (_hemmtType == 8) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_Truck_01_medical_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_T_Truck_01_medical_F", _spawnPos];
			};
		};
	};

	// other
	if (_carType == 6) then {
		if (_otherType == 1) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_Quadbike_01_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_G_Quadbike_01_F", _spawnPos];
			};
		};
		if (_otherType == 2) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_G_Offroad_01_armed_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_G_Offroad_01_armed_F", _spawnPos];
			};
		};
		if (_otherType == 3) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_G_Offroad_01_AT_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_G_Offroad_01_AT_F", _spawnPos];
			};
		};
		if (_otherType == 4) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_G_Offroad_01_repair_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_G_Offroad_01_repair_F", _spawnPos];
			};
		};
		if (_otherType == 5) then {
			if (_camoType == 1) then {
				_vic = createVehicle ["B_G_Offroad_01_F", _spawnPos];
			} else {
				_vic = createVehicle ["B_GEN_Offroad_01_gen_F", _spawnPos];
			};
		};
	};
};


// HC
if (_vicCat == 2) then {

	if (VAUS_activeGroups < 5) then {
		// here I am trying to control / limit HC groups to 5 ... this affects both VAUS and VAVS 

		if (VAUS_activeGroups == 0) then {
			hc_grp = groupBlu1;
		};
		if (VAUS_activeGroups == 1) then {
			hc_grp = groupBlu2;
		};
		if (VAUS_activeGroups == 2) then {
			hc_grp = groupBlu3;
		};
		if (VAUS_activeGroups == 3) then {
			hc_grp = groupBlu4;
		};
		if (VAUS_activeGroups == 4) then {
			hc_grp = groupBlu5;
		};
		// if (VAUS_activeGroups == 5) then {
		// 	hint "no more allowed";
		// 	execVM "voiceActivatedVehicleSpawner\VAVS_clearKeyDowns.sqf";
		// 	execVM "voiceActivatedVehicleSpawner\initialiseVAVS.sqf";
		// };

		// below here is the copy from DC 
		// I need to add group controls here 

		// IFV
		if (_carType == 1) then {

			if (_ifvType == 1) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_APC_Tracked_01_rcws_F", hc_grp] call bis_fnc_spawnvehicle;
					// VAUS_activeGroups = VAUS_activeGroups + 1;
				} else {
					[_spawnPos, 180, "B_T_APC_Tracked_01_rcws_F", hc_grp] call bis_fnc_spawnvehicle;
					// VAUS_activeGroups = VAUS_activeGroups + 1;
				};
			};
			if (_ifvType == 2) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_APC_Tracked_01_AA_F", hc_grp] call bis_fnc_spawnvehicle;
					// VAUS_activeGroups = VAUS_activeGroups + 1;
				} else {
					[_spawnPos, 180, "B_T_APC_Tracked_01_AA_F", hc_grp] call bis_fnc_spawnvehicle;
					// VAUS_activeGroups = VAUS_activeGroups + 1;
				};
			};
			if (_ifvType == 3) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_APC_Tracked_01_CRV_F", hc_grp] call bis_fnc_spawnvehicle;
					// VAUS_activeGroups = VAUS_activeGroups + 1;
				} else {
					[_spawnPos, 180, "B_T_APC_Tracked_01_CRV_F", hc_grp] call bis_fnc_spawnvehicle;
					// VAUS_activeGroups = VAUS_activeGroups + 1;
				};
			};
			if (_ifvType == 4) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_APC_Wheeled_01_cannon_F", hc_grp] call bis_fnc_spawnvehicle;
					// VAUS_activeGroups = VAUS_activeGroups + 1;
				} else {
					[_spawnPos, 180, "B_T_APC_Wheeled_01_cannon_F", hc_grp] call bis_fnc_spawnvehicle;
					// VAUS_activeGroups = VAUS_activeGroups + 1;
				};
			};
			if (_ifvType == 5) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_APC_Wheeled_03_cannon_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_APC_Wheeled_03_cannon_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			
			// VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		// MRAP //
		if (_carType == 2) then {

			if (_mrapType == 1) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_MRAP_01_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_T_MRAP_01_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_mrapType == 2) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_MRAP_01_gmg_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_T_MRAP_01_gmg_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_mrapType == 3) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_MRAP_01_hmg_F", hc_grp] call bis_fnc_spawnvehicle;
					systemChat "hmg altis";
				} else {
					[_spawnPos, 180, "B_T_MRAP_01_hmg_F", hc_grp] call bis_fnc_spawnvehicle;
					systemChat "hmg tanoa";
				};
			};

			// VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		// LSV
		if (_carType == 3) then {

			if (_lsvType == 1) then {
				if (_exCamoType == 1) then {
					[_spawnPos, 180, "B_LSV_01_unarmed_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 2) then {
					[_spawnPos, 180, "B_T_LSV_01_unarmed_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 3) then {
					[_spawnPos, 180, "B_T_LSV_01_unarmed_CTRG_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 4) then {
					[_spawnPos, 180, "B_LSV_01_unarmed_black_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 5) then {
					[_spawnPos, 180, "B_T_LSV_01_unarmed_black_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 6) then {
					[_spawnPos, 180, "B_LSV_01_unarmed_olive_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 7) then {
					[_spawnPos, 180, "B_T_LSV_01_unarmed_olive_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 8) then {
					[_spawnPos, 180, "B_LSV_01_unarmed_sand_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 9) then {
					[_spawnPos, 180, "B_T_LSV_01_unarmed_sand_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_lsvType == 2) then {
				if (_exCamoType == 1) then {
					[_spawnPos, 180, "B_T_LSV_01_armed_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 2) then {
					[_spawnPos, 180, "B_T_LSV_01_armed_CTRG_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 3) then {
					[_spawnPos, 180, "B_LSV_01_armed_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 4) then {
					[_spawnPos, 180, "B_LSV_01_armed_black_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 5) then {
					[_spawnPos, 180, "B_T_LSV_01_armed_black_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 6) then {
					[_spawnPos, 180, "B_LSV_01_armed_olive_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 7) then {
					[_spawnPos, 180, "B_T_LSV_01_armed_olive_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 8) then {
					[_spawnPos, 180, "B_LSV_01_armed_sand_F", hc_grp] call bis_fnc_spawnvehicle;
				};
				if (_exCamoType == 9) then {
					[_spawnPos, 180, "B_T_LSV_01_armed_sand_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_lsvType == 3) then {
				if (_exCamoType == 1) then {
					[_spawnPos, 180, "B_T_LSV_01_AT_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_LSV_01_AT_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_lsvType == 4) then {
				if (_exCamoType == 1) then {
					[_spawnPos, 180, "B_CTRG_LSV_01_light_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_CTRG_LSV_01_light_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};

			// VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		// MBT
		if (_carType == 4) then {

			if (_mbtType == 1) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_MBT_01_cannon_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_T_MBT_01_cannon_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_mbtType == 2) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_MBT_01_TUSK_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_T_MBT_01_TUSK_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_mbtType == 3) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_MBT_01_arty_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_T_MBT_01_arty_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_mbtType == 4) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_MBT_01_mlrs_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_T_MBT_01_mlrs_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};

			// VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		// hemmt
		if (_carType == 5) then {

			if (_hemmtType == 1) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_Truck_01_mover_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_T_Truck_01_mover_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_hemmtType == 2) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_Truck_01_box_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_T_Truck_01_box_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_hemmtType == 3) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_Truck_01_covered_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_T_Truck_01_covered_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_hemmtType == 4) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_Truck_01_transport_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_T_Truck_01_transport_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_hemmtType == 5) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_Truck_01_Repair_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_T_Truck_01_Repair_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_hemmtType == 6) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_Truck_01_ammo_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_T_Truck_01_ammo_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_hemmtType == 7) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_Truck_01_fuel_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_T_Truck_01_fuel_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_hemmtType == 8) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_Truck_01_medical_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_T_Truck_01_medical_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};

			// VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		// other
		if (_carType == 6) then {

			if (_otherType == 1) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_Quadbike_01_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_G_Quadbike_01_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_otherType == 2) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_G_Offroad_01_armed_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_G_Offroad_01_armed_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_otherType == 3) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_G_Offroad_01_AT_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_G_Offroad_01_AT_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_otherType == 4) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_G_Offroad_01_repair_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_G_Offroad_01_repair_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};
			if (_otherType == 5) then {
				if (_camoType == 1) then {
					[_spawnPos, 180, "B_G_Offroad_01_F", hc_grp] call bis_fnc_spawnvehicle;
				} else {
					[_spawnPos, 180, "B_GEN_Offroad_01_gen_F", hc_grp] call bis_fnc_spawnvehicle;
				};
			};

			// VAUS_activeGroups = VAUS_activeGroups + 1;
		};

		// 02 September 07:38 
		// as with VAUS, let's try to run this addition only once  
		VAUS_activeGroups = VAUS_activeGroups + 1;

	} else {
		// i.e. there are 6 or more HC groups - so replace this with exitWith?
		if (VAUS_activeGroups == 5) then {
			hint "no more allowed";
			execVM "voiceActivatedVehicleSpawner\VAVS_clearKeyDowns.sqf";
			execVM "voiceActivatedVehicleSpawner\initialiseVAVS.sqf";
		};
	};
};

sleep 1;

execVM "voiceActivatedVehicleSpawner\initialiseVAVS.sqf";
execVM "voiceActivatedVehicleSpawner\VAVS_clearKeyDowns.sqf";
