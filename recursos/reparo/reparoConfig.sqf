//HC
if (!hasInterface && !isDedicated) exitWith {};

params ["_helipad"];

private _trigger = createTrigger ["EmptyDetector", _helipad, false];
_trigger setTriggerArea [6, 6, 0, false, 10];
_trigger setTriggerStatements [
	" player inArea thisTrigger || {(getConnectedUAV player) inArea thisTrigger} ",
	" thisTrigger call SMQTV_fnc_addReparo ",
	" call SMQTV_fnc_remReparo "
];
_trigger setTriggerInterval 1;