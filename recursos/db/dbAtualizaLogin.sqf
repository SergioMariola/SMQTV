private _uid = _this select 0;
private _currentLogin = [SMQTV_db, [_uid, "ATUAL_LOGIN"]] call BIS_fnc_dbValueReturn;

[SMQTV_db, [_uid, "ULTIMO_LOGIN"], _currentLogin] call BIS_fnc_dbValueSet;

//Salva DB
profileNamespace setVariable ["smqtv_db", SMQTV_db];