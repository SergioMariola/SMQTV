if isServer exitWith {SMQTV_defusado = true};

params ["_target", "_caller", "_actionId", "_arguments"];

[_target, _actionId] call BIS_fnc_holdActionRemove;

_explosivo = _arguments select 1;
_efeito = "#particlesource" createVehicleLocal (_explosivo modelToWorld [0,0,0]);
_efeito setParticleClass "MineJumpEffect";
_efeito setDropInterval 0.1;
_efeito attachTo [_explosivo, [0,0,0]];

waitUntil { sleep 30; isNull _explosivo };

detach _efeito;
deleteVehicle _efeito;