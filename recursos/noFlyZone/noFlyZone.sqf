private _veiculo = objectParent player;
if (isNull _veiculo) exitWith {};
if ((driver _veiculo) isNotEqualTo player) exitWith {};
if (_veiculo isKindOf "Air") then {
	private _i = 15;
	private _texto = "";
	while {_veiculo inArea _this} do {
		_texto = format ["Área de restrição de vôo<br/>Remova o veículo em até %1 segundos", _i];
		["importante", _texto, 0.1] remoteExecCall ["SMQTV_fnc_cutText", crew _veiculo];
		_i = _i - 1;
		sleep 1;
		if (_i <= 0) exitWith {
			_veiculo setPosASL [0,0,0];
			_veiculo setDamage 1;
		};
	};
};