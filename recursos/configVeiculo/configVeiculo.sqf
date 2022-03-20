params["_veiculo", "_pos", "_dir"];

//Configurações globais
clearItemCargoGlobal _veiculo;
clearWeaponCargoGlobal _veiculo;
clearBackpackCargoGlobal _veiculo;
clearMagazineCargoGlobal _veiculo;
zeus addCuratorEditableObjects [[_veiculo], true];

//Configurações cliente
[_veiculo, _pos, _dir] remoteExecCall ["SMQTV_fnc_vehConfigsRemotas", 0, _veiculo];

//Configurações servidor
if (unitIsUAV _veiculo) exitWith {};
if (_veiculo isKindOf "Helicopter") exitWith {_veiculo spawn SMQTV_fnc_configHeli};
if (_veiculo isKindOf "Plane") exitWith {_veiculo spawn SMQTV_fnc_configJato};