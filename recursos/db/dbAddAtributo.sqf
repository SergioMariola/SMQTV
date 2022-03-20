params ["_jogador", "_atributo"];

private _uid = getPlayerUID _jogador;
private _valor = [SMQTV_db, [_uid, _atributo], -1] call BIS_fnc_dbValueReturn;

//Adiciona valor ou cria atributo caso este não exista
if (_valor > -1) then {
    [SMQTV_db, [_uid, _atributo], _valor + 1] call BIS_fnc_dbValueSet;    
} else {
    [SMQTV_db, [_uid, _atributo], 0] call BIS_fnc_dbValueSet;
};