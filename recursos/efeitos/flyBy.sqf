params [
	["_start", [0,0,0], [[]]],
	["_end", [100,100,100], [[]]],
	["_height", 100, [0]],
	["_speed", "NORMAL", [""]],
	["_class", "B_Heli_Light_01_F", [""]],
	["_side", WEST, [WEST]]
];

_start set [2, _height];
private _direction = [_start, _end] call BIS_fnc_dirTo;

private _vehicleContainer	= [_start, _direction, _class, _side] call BIS_fnc_spawnVehicle;
private _vehicle 			= _vehicleContainer select 0;
private _vehicleCrew		= _vehicleContainer select 1;
private _vehicleGroup		= _vehicleContainer select 2;

//Configura veículo para não mudar rota
_vehicle disableAi "TARGET";
_vehicle disableAi "AUTOTARGET";
_vehicle setCaptive true;
_vehicleGroup allowFleeing 0;
_vehicle flyInHeight _height;

//Waypoint
private _waypoint = _vehicleGroup addWaypoint [_end, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointSpeed _speed;
_waypoint setWaypointStatements [
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

_vehicle