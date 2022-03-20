params ["_uid", "_name", "_owner"];

private _inRecord = [SMQTV_db, [_uid]] call BIS_fnc_dbClassCheck;

if _inRecord then {
	[_uid, _name, _owner] call SMQTV_fnc_dbAtualizaJogador;
} else {
	[_uid, _name, _owner] call SMQTV_fnc_dbAddJogador;
};