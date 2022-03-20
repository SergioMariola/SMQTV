sleep 10;

_hc = missionNamespace getVariable ["SMQTV_hcPresente", -1];
if (_hc isEqualTo -1) exitWith {};

"Iniciando transferência de grupos para HC..." remoteExecCall ["systemChat", _hc];
_grupos = allGroups select {local _x};

{
	_x setGroupOwner _hc;
	sleep 1;
	_hc = missionNamespace getVariable ["SMQTV_hcPresente", -1];
	if (_hc isEqualTo -1) then {break};
} forEach _grupos;

sleep 1;

_hc = missionNamespace getVariable ["SMQTV_hcPresente", -1];
if (_hc > -1) then {
	"Grupos transferidos para HC" remoteExecCall ["systemChat", _hc];
};