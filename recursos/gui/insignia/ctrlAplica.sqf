params ["_control"];

private _display = ctrlParent _control;
private _lista = _display displayCtrl 2100;
private _index = lbCurSel _lista;
private _insignia = _lista lbData _index;

if (_insignia isEqualTo "") exitWith {};

profileNamespace setVariable ["SMQTV_insignia", _insignia];
[player, ""] call BIS_fnc_setUnitInsignia;
if ( [player, _insignia] call BIS_fnc_setUnitInsignia ) then {
	[ ["Insignia alterada para '", _insignia, "'"] joinString "" ] spawn SMQTV_fnc_barraAviso;
} else {
	["Falha na alteração de insígnia", "vermelho"] spawn SMQTV_fnc_barraAviso;
};