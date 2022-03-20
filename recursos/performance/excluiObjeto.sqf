params ["_objeto"];

sleep 60;

if (isNull _objeto) exitWith {};

private _pos = _objeto modelToWorld [0,0,0];
private _lista = [];
waitUntil {
	sleep 10;
	_lista = playableUnits inAreaArray [_pos, 10, 10, 0];
	_lista isEqualTo []
};

private _veiculo = objectParent _objeto;
private _vetorNome = _objeto getVariable ["SMQTV_vetorInimigo", ""];

if (_vetorNome isEqualTo "") exitWith {
	if (isNull _veiculo) then {
		deleteVehicle _objeto;
	} else {
		_veiculo deleteVehicleCrew _objeto;
	};
};

(missionNamespace getVariable _vetorNome) deleteAt ( (missionNamespace getVariable _vetorNome) findIf {_x isEqualTo _objeto} );

if (isNull _veiculo) then {
	deleteVehicle _objeto;
} else {
	_veiculo deleteVehicleCrew _objeto;
};