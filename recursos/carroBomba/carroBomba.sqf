params ["_centro"];
private _qtd = param [1, 1];
private _estradas = _centro nearRoads 1000;
private _carros = [];

//Cria carros caso haja estradas disponíveis
for "_i" from 1 to _qtd do {
	if (_estradas isNotEqualTo []) then {
		private _estrada = selectRandom _estradas;
		private _pos = (getRoadInfo _estrada) select 6;
		private _carro = createVehicle [selectRandom LISTA_VEICULOS_CIVIS, _pos, [], 0, "CAN_COLLIDE"];
		waitUntil { !isNull _carro };

		private _i = 0.1;
		_pos = _carro getRelPos [_i, 90];

		while {isOnRoad _pos} do {
			_i = _i + 0.1;
			_pos = _carro getRelPos [_i, 90];
		};

		private _dir = _carro getDir ((getRoadInfo _estrada) select 7);
		_carro setDir _dir;
		_carro setPosATL _pos;

		private _index = _estradas findIf {_x isEqualTo _estrada};
		if (_index > -1) then {
			_estradas deleteAt _index;
		};

		_carros pushBack _carro;
		civisAO pushBack _carro;
	};
};

//Atribui bomba aleatoriamente (carro pode ou não ter bomba)
{
	if (random 1 >= 0.5) then {
		_x addEventHandler ["GetIn", {
			params ["_vehicle"];

			_vehicle removeEventHandler ["GetIn", _thisEventHandler];
			_vehicle remoteExec ["SMQTV_fnc_carroAlarme"];
			_vehicle spawn {
				sleep (selectRandom [10,15,20]);
				_this setDamage 1;
			};
		}];
	};
} forEach _carros;

//Adiciona ao Zeus
zeus addCuratorEditableObjects [_carros, true];