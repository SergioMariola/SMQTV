params ["_veiculo"];

private _arma = _veiculo unitTurret player;
if (_arma isEqualTo []) exitWith {};

{
	_veiculo setMagazineTurretAmmo [_x # 0, 10000, _x # 1];
} forEach (magazinesAllTurrets _veiculo);
_veiculo setVehicleAmmoDef 1;
_veiculo setVehicleAmmo 1;