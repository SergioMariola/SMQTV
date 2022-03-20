if (!isServer) exitWith {};

params ["_veiculo"];

sleep 2;

private _respawnNome = param [1, ["Respawn Móvel ", (count (missionNamespace call BIS_fnc_getRespawnPositions)) + 1] joinString ""];
private _pos = getPosWorld _veiculo;
private _dir = getDir _veiculo;
private _tipo = typeOf _veiculo;
private _id = [missionNamespace, _veiculo, _respawnNome] call BIS_fnc_addRespawnPosition;
_veiculo setVariable ["SMQTV_respawnMovelFlag", true];

waitUntil {
	sleep 15;
	!alive _veiculo
};

_id call BIS_fnc_removeRespawnPosition;
sleep 60;
deleteVehicle _veiculo;
sleep 5;
private _veiculoNovo = createVehicle [_tipo, _pos, [], 0, "CAN_COLLIDE"];
waitUntil { !isNull _veiculoNovo };
_veiculoNovo setDir _dir;
_veiculoNovo setPosWorld _pos;

sleep 1;

[_veiculoNovo, _respawnNome] spawn SMQTV_fnc_respawnMovel;