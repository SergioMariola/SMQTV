//HC
if (!hasInterface && !isDedicated) exitWith {};

_efeito = objNull;
_efeitos = [];
{
	_efeito = "#particlesource" createVehicleLocal (getPosATL _this);
	_efeito setParticleClass _x;
	_efeito attachTo [_this];
	_efeitos pushBack _efeito;
} forEach ["SmokeTrails", "MineCircleDust"];

sleep 10;

{
	detach _x;
	deleteVehicle _x;
	sleep 0.1;
} forEach _efeitos;