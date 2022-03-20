params ["_caller", "_pos", "_target", "_is3D", "_id"];

//Certifica que somente este jogador usará o recurso no momento
missionNamespace setVariable ["SMQTV_mk41EmUso", true, true];

//Cria alvo
_alvoPos    = if (_pos isEqualTo []) then {getPosATL _target} else {_pos};
_alvo		= createVehicle ["Land_HelipadEmpty_F", _alvoPos, [], 0, "CAN_COLLIDE"];
waitUntil { !isNull _alvo };

//Dispara mensagens
_texto = format ["== %1 requisitou um bombardeio de um míssil Mk-41 VLS ==", name _caller];
_texto remoteExecCall ["systemChat"];
remoteExec ["SMQTV_fnc_bombardeioLiveFeed", _caller];
[_alvo, _alvoPos, _caller, _pos, _target, "MK41"] remoteExec ["SMQTV_fnc_bombardeioAviso", 0];

//Cria projétil
_posMissil = (position _caller) getPos [6000, (getDir _caller) - 180];
[
	_caller,
	[_posMissil # 0, _posMissil # 1, (_posMissil # 2) + 6000],
	"ammo_Missile_Cruise_01",
	_alvo,
	200,
	false,
	[0,0,0],
	100,
	"",
	false
] spawn SMQTV_fnc_criaProjetilKS;

//Registra ação no DB
[_caller, "MK41"] call SMQTV_fnc_dbAddAtributo;