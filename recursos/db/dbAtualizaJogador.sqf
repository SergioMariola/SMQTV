params ["_uid", "_name", "_owner"];

//Atualiza login
private _vezesLogin = [SMQTV_db, [_uid, "VEZES_LOGIN"], 0] call BIS_fnc_dbValueReturn;
[SMQTV_db, [_uid, "VEZES_LOGIN"], _vezesLogin + 1] call BIS_fnc_dbValueSet;
[SMQTV_db, [_uid, "ATUAL_LOGIN"], systemTime] call BIS_fnc_dbValueSet;

//Compara nome atual do jogador com o da base
private _nameDB = [SMQTV_db, [_uid, "NOME"]] call BIS_fnc_dbValueReturn;
if (_name isNotEqualTo _nameDB) then {
	[SMQTV_db, [_uid, "NOME"], _name] call BIS_fnc_dbValueSet;
};

//Envia informações para o computador do jogador
SMQTV_playerClass = [SMQTV_db, [_uid]] call BIS_fnc_dbClassReturn;
_owner publicVariableClient "SMQTV_playerClass";

//Salva DB
profileNamespace setVariable ["smqtv_db", SMQTV_db];