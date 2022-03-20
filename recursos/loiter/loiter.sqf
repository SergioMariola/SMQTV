params ["_grupo", "_centro", "_raio"];

private _wp = _grupo addWaypoint [_centro, 0];
_wp setWaypointType "LOITER";
_wp setWaypointLoiterRadius _raio;
_wp setWaypointLoiterType "CIRCLE_L";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointForceBehaviour true;