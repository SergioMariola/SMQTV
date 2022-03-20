if (!isServer) exitWith {};

params ["_base", "_tipo"];

sleep 1;

private _pos = getPosATL _base;
private _dir = getDir _base;
_pos set [2, (_pos select 2) + 0.2];
if ((typeOf _base) isEqualTo "Land_Hangar_F") then {_dir = _dir - 180};

private _veiculo = createVehicle [_tipo, _pos, [], 0, "NONE"];
_veiculo setPosATL _pos;
_veiculo setDir _dir;
_veiculo setVariable ["SMQTV_respawnFlag", [_base, _tipo]];
_veiculo setVariable ["SMQTV_voltaPraBase", [_pos, _dir, 0]];

[_veiculo, _pos, _dir] spawn SMQTV_fnc_configVeiculo;