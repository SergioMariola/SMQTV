params ["_veiculo", "_pos", "_dir"];

if (isEngineOn _veiculo) then {
	_veiculo engineOn false;
};
_veiculo setDir _dir;
_veiculo setPosATL [_pos select 0, _pos select 1, (_pos select 2) + 0.2];