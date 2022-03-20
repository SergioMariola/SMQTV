private _id = localNamespace getVariable ["SMQTV_idReparo", -1];
if (_id == -1) exitWith {};

private _uav = getConnectedUAV player;
private _papel = (UAVControl _uav) select 1;

if (_uav isNotEqualTo objNull && {_papel isNotEqualTo ""}) exitWith {
	{_x removeAction _id} forEach crew _uav;
};

player removeAction _id;