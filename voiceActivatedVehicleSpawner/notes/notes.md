Welcome to the VA Vehicle Spawner - random thoughts, visitors should not spend too much time here ;)

What do you require?

Car / Heli?

if car

Armed / Unarmed

// level Root1 - choose units or vehicles
// VAUS_type = []; // 1 = units (group) (2A), 2 = vehicles (2B)
// VAUS_typeBool = false;

// // level B2 - choose empty or crewed
// VAUS_crewed = []; // 1 = empty, 2 = crewed
// VAUS_crewedBool = false;

// // level B3 - choose type of vehicle - heli or car
// VAUS_vicType = []; // 1 = car, 2 = heli
// VAUS_vicTypeBool = false;

// // level BA4 - choose type of car  
// VAUS_carType = []; // 1 = HEMMT, 2 = Hunter, 3 = tank
// VAUS_carTypeBool = false;

// // level BB4 - choose type of car  
// VAUS_heliType = []; // 1 = MH6, 2 = AH6, 3 = Blackhawk, 4 = Chinook
// VAUS_heliTypeBool = false;

cutRsc list options

create something assigned to me "Create Group Element"
or
create an HC element "Create High Command Element"
or
create an empty vehicle "Create Empty Vehicle"
or
create a crewed vehicle "Create Crewed Vehicle"

ammo drops will be first attempt at flying shit in..

LEVEL 1 LEVEL 2 VAUS_Type LEVEL 3 LEVEL 4 LEVEL 5 LEVEL 6
Activate VAUS create group element direct control Standard Fire Team (x4) CONFIRM
high command Woodland Full Platoon (x20)
Desert Sniper Team (x2)  
AA Team (x2)
AT Team (x3)
Engineering Team (x3)
Demolition Team (x3)
Medic Group (x4)

    			create vehicle 			empty			hemmt covered
    									crewed			hemmt open
    													blackhawk
    													etc

disply all bt greyed out first then highlight as selected
groups direct control woodland full platoon confirm  
 high command

vehicles high command

if "Create Group Element" then choose
hand-pick team, or select pre-created group
cutRSC list options

if hand-picked group, then
Keep talking until you have enough in your direct group

if pre-created group, then
cutRSC list of group options

create single unit assigned to me  
create group assigned to me
create HC group

    	if (VAUS_typeBool) then {
    		VAUS_type pushback 0;
    	};

    	if (VAUS_crewedBool) then {
    		VAUS_crewed pushback 0;
    	};

    	if (VAUS_vicTypeBool) then {
    		VAUS_vicType pushback 0;
    	};

    	if (VAUS_carTypeBool) then {
    		VAUS_carType pushback 0;
    	};

    	if (VAUS_heliTypeBool) then {
    		VAUS_heliType pushback 0;
    	};



    	if (VAUS_crewedBool) then {
    		VAUS_crewed pushback 1;
    	};

    	if (VAUS_vicTypeBool) then {
    		VAUS_vicType pushback 1;
    	};

    	if (VAUS_carTypeBool) then {
    		VAUS_carType pushback 1;
    	};

    	if (VAUS_heliTypeBool) then {
    		VAUS_heliType pushback 1;
    	};
