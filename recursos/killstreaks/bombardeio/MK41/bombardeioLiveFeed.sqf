if (!isPipEnabled) exitWith {};
if (diag_fps < 30 ) exitWith {};

private _posCam = VLSMK41 getRelPos [15, 45];
private _posAlvo = getPosASLVisual VLSMK41;
private _altura = abs (getTerrainHeightASL _posCam);
private _muzzle = currentMuzzle (gunner VLSMK41);
private _turret = VLSMK41 unitTurret (gunner VLSMK41);

[
	[_posCam # 0, _posCam # 1, (_posCam # 2) + _altura + 20],
	[_posAlvo # 0, _posAlvo # 1, (_posAlvo # 2) + 6],
	player
] call BIS_fnc_liveFeed;

sleep 4;

[VLSMK41, _muzzle, _turret] call BIS_fnc_fire;
VLSMK41 setAmmo [_muzzle, 17];

sleep 5;

call BIS_fnc_liveFeedTerminate;