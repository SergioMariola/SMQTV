params ["_uid", "_name", "_owner"];

//Adiciona jogador à base
[SMQTV_db, [_uid]] call BIS_fnc_dbClassSet;
[SMQTV_db, [_uid, "NOME"], _name] call BIS_fnc_dbValueSet;
[SMQTV_db, [_uid, "VEZES_LOGIN"], 1] call BIS_fnc_dbValueSet;
[SMQTV_db, [_uid, "ATUAL_LOGIN"], systemTime] call BIS_fnc_dbValueSet;
[SMQTV_db, [_uid, "ULTIMO_LOGIN"], systemTime] call BIS_fnc_dbValueSet;
[SMQTV_db, [_uid, "KILLS"], 0] call BIS_fnc_dbValueSet;
[SMQTV_db, [_uid, "MORTES"], 0] call BIS_fnc_dbValueSet;
[SMQTV_db, [_uid, "COLATERAL"], 0] call BIS_fnc_dbValueSet;
[SMQTV_db, [_uid, "HALO"], 0] call BIS_fnc_dbValueSet;
[SMQTV_db, [_uid, "SALTO_VEICULO"], 0] call BIS_fnc_dbValueSet;
[SMQTV_db, [_uid, "MANDA_CHUVA"], 0] call BIS_fnc_dbValueSet;
[SMQTV_db, [_uid, "GBU"], 0] call BIS_fnc_dbValueSet;
[SMQTV_db, [_uid, "MK41"], 0] call BIS_fnc_dbValueSet;

//Envia informações para o computador do jogador
SMQTV_playerClass = [SMQTV_db, [_uid]] call BIS_fnc_dbClassReturn;
_owner publicVariableClient "SMQTV_playerClass";

//Salva DB
profileNamespace setVariable ["smqtv_db", SMQTV_db];