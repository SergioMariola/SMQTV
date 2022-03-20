if (!isServer) exitWith {};
params ["_helipad", "_tipo"];

_caixa = createVehicle [_tipo, _helipad, [], 0, "CAN_COLLIDE"];
waitUntil { !isNull _caixa };

clearItemCargoGlobal _caixa;
clearWeaponCargoGlobal _caixa;
clearBackpackCargoGlobal _caixa;
clearMagazineCargoGlobal _caixa;
zeus addCuratorEditableObjects [[_caixa],true];

//Configurações remotas
_caixa remoteExecCall ["SMQTV_fnc_rearmaConfigsRemotas", 0, _caixa];

_z = 0;
waitUntil {
	sleep 10;
	_z = (getPosASL _caixa) select 2;
	!alive _caixa || round _z < 0;
};

sleep 60;

deleteVehicle _caixa;
[_helipad, _tipo] spawn SMQTV_fnc_caixaRearm;