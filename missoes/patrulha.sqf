private ["_grp", "_pos", "_maxDist", "_modo", "_comportamento", "_velocidade"];

_grp			= _this select 0;
_pos			= _this select 1;
_maxDist		= _this select 2;
_modo			= param [3, "patrulha", [""]];
_comportamento	= "";
_velocidade		= "";

switch (_modo) do
{
	case "patrulha":
	{
		_comportamento	= "SAFE";
		_velocidade		= "LIMITED";
	};

	case "reforco":
	{
		_comportamento	= "AWARE";
		_velocidade		= "FULL";
	};
};

_grp setBehaviour _comportamento;

//Cria waypoints
for "_i" from 0 to 2 do
{
	private ["_wp", "_newPos"];
	_newPos = [_pos, 50, _maxDist, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;

	_wp = _grp addWaypoint [_newPos, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointCompletionRadius 20;

	//Configura primeiro waypoint
	if (_i == 0) then
	{
		_wp setWaypointSpeed _velocidade;
		_wp setWaypointFormation "STAG COLUMN";
	};
	sleep 1;
};

//Cria waypoint de ciclo
private _wp = _grp addWaypoint [_pos, 0];
_wp setWaypointType "CYCLE";
_wp setWaypointCompletionRadius 20;