params ["_requisitor", "_jogador"];

private _uid = if (isNull _jogador) then {getPlayerUID _requisitor} else {getPlayerUID _jogador};
private _owner = owner _requisitor;

SMQTV_playerClass = [SMQTV_db, [_uid]] call BIS_fnc_dbClassReturn;

_owner publicVariableClient "SMQTV_playerClass";