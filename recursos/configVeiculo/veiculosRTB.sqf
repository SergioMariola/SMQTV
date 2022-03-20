_volta		= [];
_pos		= [];
_veiculos	= [];
_dir		= 0;
_veiculo	= objNull;

while {sleep 5; true} do {
	_veiculos = vehicles select {(_x getVariable ["SMQTV_voltaPraBase", []]) isNotEqualTo []};

	{
		if (!alive _x || {unitIsUAV _x}) then {continue};

		_volta = _x getVariable ["SMQTV_voltaPraBase", []];
		_pos = _volta select 0;

		if ( (_x distance _pos) > 10 && { (playableUnits inAreaArray [getPosATL _x, 100, 100]) isEqualTo [] } ) then {
			_volta set [2, (_volta select 2) + 1];
			_x setVariable ["SMQTV_voltaPraBase", _volta];
		} else {
			_volta set [2, 0];
			_x setVariable ["SMQTV_voltaPraBase", _volta];
		};

		if (_volta select 2 > 5) then {
			_veiculo = _x;
			{
				_veiculo setHitPointDamage [_x, 0];
			} forEach ((getAllHitPointsDamage _veiculo) select 0);
			_veiculo setDamage 0;
			_veiculo setFuel 1;
			_veiculo setVehicleAmmo 1;
			_dir = _volta select 1;
			_veiculo setDir _dir;
			_veiculo setPosATL _pos;
			_volta set [2, 0];
			_veiculo setVariable ["SMQTV_voltaPraBase", _volta];
		};
		sleep 1;
	} forEach _veiculos;
};