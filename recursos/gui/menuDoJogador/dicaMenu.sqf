private _sair = profileNamespace getVariable ["SMQTV_dicaMenu", 0];
if (_sair > 3) exitWith {};

_this addEventHandler ["GetInMan", {
	params ["_unit"];
	private _sair = profileNamespace getVariable ["SMQTV_dicaMenu", 0];
	profileNamespace setVariable ["SMQTV_dicaMenu", _sair + 1];
	[["Recursos", "MenuJogador"],nil,nil,nil,nil,true,true] call BIS_fnc_advHint;
	_unit removeEventHandler ["GetInMan", _thisEventHandler];
}];