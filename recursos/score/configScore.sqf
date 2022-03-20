_this addEventHandler ["Killed", {
	params ["_unit"];
	_unit remoteExecCall ["SMQTV_fnc_remScore", 2];
}];

_this addEventHandler ["Respawn", {
	params ["_unit"];
	_unit remoteExecCall ["SMQTV_fnc_addScore", 2];
}];

_this remoteExecCall ["SMQTV_fnc_addScore", 2];