params ["_grupo"];
private _lista		= units _grupo;
private _veiculo	= objectParent (_lista select 0);

sleep 2;

//Configura veículo
if !(isNull _veiculo) then
{
	[_veiculo] spawn SMQTV_fnc_monitoraCombustivel;

	_veiculo addEventHandler ["Killed", {
		params ["_unit"];
		_unit remoteExec ["SMQTV_fnc_efeitoDestruicaoVeic", -2];
	}];
	
	{_x addCuratorEditableObjects [[_veiculo], false]} forEach allCurators;
};

//Configura unidades
{
	_x addEventHandler ["Reloaded", {
		params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
		if ((_oldMagazine select 1) isEqualTo 0) then {
			_unit addItem (_oldMagazine select 0);
		};
	}];

	sleep 0.5;
} forEach _lista;
{_x addCuratorEditableObjects [_lista, false]} forEach allCurators;

sleep 5;

//Transfere para o HC
_grupo spawn SMQTV_fnc_transfereGrupo;