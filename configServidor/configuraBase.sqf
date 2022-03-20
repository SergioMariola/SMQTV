sleep 10;
private _objetos = nearestTerrainObjects [getMarkerPos "respawn_west", ["BUILDING", "WALL", "POWER LINES", "HOUSE", "FENCE", "BUSH", "TREE"], 200, false];
{
	_x allowDamage false;
} forEach _objetos;