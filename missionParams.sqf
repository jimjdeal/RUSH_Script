
// ------------------------------------------ //
// Script Settings 
// ------------------------------------------ //

// Ability to use modules is defined here 
// To turn off a module, change the value to false 
// you may also amend module values to suit, see comments below 


// ------------------------------------------ //

// general configs 
enableDebug = true;
// this enables systemChat messages 
// if UI is working, these shoud not be needed 
// 19 August - not in use 

// ------------------------------------------ //

vamp = false; // indicates that there are no VAMP modules running, and helps to avoid overlapping modules running at the same time

// ------------------------------------------ //



// ------------------------------------------ // VA Artillery  
VAA_Activate = true;
// I may add classes here, to enable user-customisation
// user customisation will also require a system to manage any labelling found in UI 
// initially my UI will be hard-coded, but if customisation is allowed, the user should also update vars that relate to UI rendering 
// this may be tricky, as there will probably be sound involved in the workflow 
// but we could potentially config the classes of explosions, or kill-zone-radius 

// drone strikes (surgical) 
// number of available GBU missles before having to rearm:
VAA_GBU_Limit = 2;
// time taken to resupply drone in seconds:
VAA_GBU_Reup = 600;
// trigger to manage reup (if true, then a countdown will occur before drone is back online):
VAA_GBU_Reup_Active = false;
// for now, do not change the above bool, and allow these from mission start

// artillery 
// number of shells available to mission:
VAA_HE_Ammo = 100;
// liklihood of service being unavailable
// 15% - not currently coded 
// time taken (in seconds) to reload all HE ammo 
VAA_HE_Ammo_Reload = 1200;
// trigger to manage reup (if true, then a countdown will occur before HE is back online):
VAA_HE_Reup_Active = false;
// for now, do not change the above bool, and allow these from mission start

// smoke 
// number of smoke shells available to mission 
VAA_SMK_Ammo = 20;
// time taken (in seconds) to reload all HE ammo 
VAA_SMK_Ammo_Reload = 1200;
// trigger to manage reup (if true, then a countdown will occur before HE is back online):
VAA_SMK_Reup_Active = false;
// for now, do not change the above bool, and allow these from mission start

// flares 
// number of smoke shells available to mission 
VAA_FLR_Ammo = 20;
// time taken (in seconds) to reload all HE ammo 
VAA_FLR_Ammo_Reload = 1200;
// trigger to manage reup (if true, then a countdown will occur before HE is back online):
VAA_FLR_Reup_Active = false;
// for now, do not change the above bool, and allow these from mission start


// ------------------------------------------ // VA Coord Finder //
VACF_Activate = true;


// ------------------------------------------ // VA Unit Spawner 
VAUS_activate = true;
// I may add classes here, to enable user-customisation
// user customisation will also require a system to manage any labelling found in UI 
// initially my UI will be hard-coded, but if customisation is allowed, the user should also update vars that relate to UI rendering 


// ------------------------------------------ // VA Asset Spawner 
VAAS_activate = true;
// I may add classes here, to enable user-customisation
// user customisation will also require a system to manage any labelling found in UI 
// initially my UI will be hard-coded, but if customisation is allowed, the user should also update vars that relate to UI rendering 


// ------------------------------------------ // VA High Command 
VAHC_activate = true;

// number of HC groups is limited to 3 - this is due to UI-related issues 

// HC group global vars
groupBlu1 = createGroup west;
groupBlu2 = createGroup west;
groupBlu3 = createGroup west;
groupBlu4 = createGroup west;
groupBlu5 = createGroup west;

// maybe we can add functionality to merge two HC group into one, say to manage some bad losses in one particular group 
// this way you can consolidate groups, freeing up slots to create new groups 


// ------------------------------------------ // VA Reinforcements
VARF_activate = true;

// number relative to blufor RF 
blu_RF = 5;
// note, not currently in use

// ------------------------------------------ // VA Mission Creator 


// ------------------------------------------ //

RGG_Grp_Num = 0;


