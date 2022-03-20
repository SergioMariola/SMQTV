//Inicializa
private _insignia = profileNamespace getVariable ["SMQTV_insignia", "Brasil"];
[_this, ""] call BIS_fnc_setUnitInsignia;
[_this, _insignia] call BIS_fnc_setUnitInsignia;

//Arsenal
[missionNamespace, "arsenalOpened", {
	private _insignia = profileNamespace getVariable ["SMQTV_insignia", "Brasil"];
	[player, ""] call BIS_fnc_setUnitInsignia;
	[player, _insignia] call BIS_fnc_setUnitInsignia;
}] call BIS_fnc_addScriptedEventHandler;

[missionNamespace, "arsenalClosed", {
	private _insignia = profileNamespace getVariable ["SMQTV_insignia", "Brasil"];
	[player, ""] call BIS_fnc_setUnitInsignia;
	[player, _insignia] call BIS_fnc_setUnitInsignia;
}] call BIS_fnc_addScriptedEventHandler;

//Respawn
_this addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	private _insignia = profileNamespace getVariable ["SMQTV_insignia", "Brasil"];
	[_unit, ""] call BIS_fnc_setUnitInsignia;
	[_unit, _insignia] call BIS_fnc_setUnitInsignia;
}];