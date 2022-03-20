_this addEventHandler ["Killed", {
	params ["_unit"];
	[_unit, "MORTES"] remoteExecCall ["SMQTV_fnc_dbAddAtributo", 2];
}];