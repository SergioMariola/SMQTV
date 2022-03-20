_jogadorPos = _this getPos [selectRandom [2, 3, 5, 7, 9], random 360];
_altitude = 100;
_dist = 4000;

//Cria alvo
_alvo = createVehicle ["Land_HelipadEmpty_F", _jogadorPos, [], 0, "CAN_COLLIDE"];
_jogadorPosASL = AGLToASL _jogadorPos;
_indoor = lineIntersects [_jogadorPosASL, [_jogadorPosASL # 0, _jogadorPosASL # 1, 10]];
_fumaca = objNull;
if !_indoor then {
	_fumaca = createVehicle ["SmokeShellRed", _jogadorPos, [], 0, "CAN_COLLIDE"];
};
waitUntil { !isNull _alvo };

//Configura posição da aeronave
_jatoPos = _jogadorPos getPos [_dist, random 360];
_jatoPos set [2, _altitude];

//Direção da aeronave
_dir = _jatoPos getDir _alvo;

//Cria aeronave
_vehicleContainer	= [_jatoPos, _dir, selectRandom SMQTV_jatosInimigos, east] call BIS_fnc_spawnVehicle;
_vehicle 			= _vehicleContainer select 0;
_vehicleCrew		= _vehicleContainer select 1;
_vehicleGroup		= _vehicleContainer select 2;
{_x addCuratorEditableObjects [[_vehicle], false]} forEach allCurators;
_vehicle remoteExec ["SMQTV_fnc_efeitoFumacaJato", -2, _vehicle];

//O veículo deve ignorar os seus arredores
_vehicle disableAi "TARGET";
_vehicle disableAi "AUTOTARGET";
_vehicle setCaptive true;
_vehicleGroup allowFleeing 0;

//Configura altura de vôo
_vehicle flyInHeight _altitude;
_vehicle limitSpeed 400;

//Waypoint 1
_waypoint1 = _vehicleGroup addWaypoint [_alvo, 0];
_waypoint1 setWaypointType "MOVE";
_waypoint1 setWaypointBehaviour "CARELESS";
_waypoint1 setWaypointCombatMode "BLUE";
_waypoint1 setWaypointSpeed "NORMAL";
_waypoint1 setWaypointStatements ["true", ""];

//Waypoint 2
_wpFim = _vehicle getRelPos [20000, 0];
_waypoint2 = _vehicleGroup addWaypoint [_wpFim, 0];
_waypoint2 setWaypointStatements [
	"true",
	"private _group = group this; 
	if (local _group) then 
	{
		private _vehicle = vehicle this; 
		{ _vehicle deleteVehicleCrew _x } forEach crew _vehicle; 
		deleteVehicle _vehicle;
		{ deleteVehicle _x } forEach units _group;
		deleteGroup _group;
	}"
];

//Aguarda se aproximar do alvo
waitUntil { _vehicle distance2D _alvo <= 300 || !alive _vehicle};

if (!isNull _fumaca) then {deleteVehicle _fumaca};
if (!alive _vehicle) exitWith {
	{_vehicle deleteVehicleCrew _x} forEach _vehicleCrew;
	deleteVehicle _veiculo;
	deleteGroup _vehicleGroup;
};

//Cria GBU
_posGBU = getPosASL _vehicle;
[
	[_posGBU # 0, _posGBU # 1, (_posGBU # 2) - 10],
	"Bo_GBU12_LGB",
	_alvo,
	100,
	false,
	[0,0,0],
	100
] spawn SMQTV_fnc_criaProjetilAS;