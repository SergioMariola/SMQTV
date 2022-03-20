params ["_target", "", "_actionId", ""];

//Completa tarefa
if isServer exitWith {_target setDamage 1};

//HC
if (!hasInterface && !isDedicated) exitWith {};

_efeitos	= [];
_efeito		= objNull;

//Remove ação
[_target, _actionId] call BIS_fnc_holdActionRemove;

sleep 2;

//Cria efeito
{
	_efeito = "#particlesource" createVehicleLocal (_target modelToWorld [0,0,0.45]);
	_efeito setParticleClass _x;
	_efeitos pushBack _efeito;
} forEach [
	"FireSparks",
	"ExpSparksFire",
	"ExpSparksSmoke",
	"TrainingMine_FireSparks",
	"SmallFireFRefract",
	"SmallFireBarrel",
	"MediumDestructionSmoke"
];

//Aguarda exclusão do terminal
waitUntil {sleep 30; isNull _target};

//Exclui efeitos
{ deleteVehicle _x } forEach _efeitos;