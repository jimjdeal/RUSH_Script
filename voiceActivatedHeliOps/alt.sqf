
_myHeli = vehicle player;

while {true} do {
	HELI1ATL1 = (getPosATL _myHeli) select 2;
	HELI1ATL2 = HELI1ATL1 - 1.19;
	HELI1ATL3 = round HELI1ATL2;
	systemChat str HELI1ATL3;
	sleep 3;
};