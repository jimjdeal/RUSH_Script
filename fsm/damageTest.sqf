_playerDamage = damage player;
systemChat str _playerDamage;
sleep 0.2;
player setDamage 0.6;
_playerDamage = damage player;
if (_playerDamage > 0.5) then {
	systemChat str _playerDamage;
	systemChat "player damage = >0.5";
};


