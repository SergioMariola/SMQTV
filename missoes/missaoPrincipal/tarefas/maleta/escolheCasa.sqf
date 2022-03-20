params ["_centro", "_raio"];

private _casas = _centro nearObjects ["House", _raio];
if (_casas isEqualTo []) exitWith {				//Sai por não ter casas na área
	_casas
};

_casas = _casas select { (_x buildingPos -1) isNotEqualTo [] };
if (_casas isEqualTo []) exitWith {				//Sai por não ter casas com posições
	_casas
};

selectRandom _casas