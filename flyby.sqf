systemChat "flyby activated";
_start = player getPos [500,001];
_end = player getPos [5000,180];

_second = player getPos [500,005];
_secondEnd = player getPos [5000,180];

_third = player getPos [500,009];
_thirdEnd = player getPos [5000,180];
// the above is trying to get some sort of formation going here .. probably a much smarter way, but this sort of works

[[_start select 0, _start select 1, 300],[_end select 0, _end select 1, 300],300,"LIMITED","B_Plane_Transport_01_infantry_F",WEST] call BIS_fnc_ambientFlyby;
sleep 1;
[[_second select 0, _second select 1, 300],[_secondEnd select 0, _secondEnd select 1, 300],300,"LIMITED","B_Plane_Transport_01_infantry_F",WEST] call BIS_fnc_ambientFlyby;
sleep 1;
[[_third select 0, _third select 1, 300],[_thirdEnd select 0, _thirdEnd select 1, 300],300,"LIMITED","B_Plane_Transport_01_infantry_F",WEST] call BIS_fnc_ambientFlyby;















































// [[10027,10066,300],[11027,11066,300],300,"FULL","B_Plane_Transport_01_infantry_F",WEST] call BIS_fnc_ambientFlyby;


// [[10040,10525,300],[10040,00025,300],300,"LIMITED","B_Plane_Transport_01_infantry_F",WEST] call BIS_fnc_ambientFlyby;
// sleep 0.9;
// [[10060,10525,300],[10060,00025,300],300,"LIMITED","B_Plane_Transport_01_infantry_F",WEST] call BIS_fnc_ambientFlyby;
// sleep 0.9;
// [[10080,10525,300],[10080,00025,300],300,"LIMITED","B_Plane_Transport_01_infantry_F",WEST] call BIS_fnc_ambientFlyby;
// sleep 0.9;


// sleep 0.5;
// [[4700,3000,300],[4700,10000,300],300,"FULL","B_Plane_Transport_01_infantry_F",WEST] call BIS_fnc_ambientFlyby;
// // sleep 0.5;
// [[4800,3000,300],[4800,10000,300],300,"FULL","B_Plane_Transport_01_infantry_F",WEST] call BIS_fnc_ambientFlyby;