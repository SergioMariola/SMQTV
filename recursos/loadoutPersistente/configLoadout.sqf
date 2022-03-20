private _var = ["SMQTV_loadout", "_", typeOf _this] joinString "";
private _equip = profileNamespace getVariable [_var, []];

//Aplica loadout
if (_equip isNotEqualTo []) then {
	_this setUnitLoadout [_equip, true];
};

//Ao fechar Arsenal
[missionNamespace, "arsenalClosed", {
	_var = ["SMQTV_loadout", "_", typeOf player] joinString "";
	profileNamespace setVariable [_var, getUnitLoadout player];
	["Equipamento salvo", nil, 2] spawn SMQTV_fnc_barraAviso;
}] call BIS_fnc_addScriptedEventHandler;

//Ao ressurgir
_this addEventHandler ["Respawn", {
	params ["_unit"];
	_var = ["SMQTV_loadout", "_", typeOf _unit] joinString "";
	_equip = profileNamespace getVariable [_var, []];

	_unit setUnitLoadout [_equip, true];
}];