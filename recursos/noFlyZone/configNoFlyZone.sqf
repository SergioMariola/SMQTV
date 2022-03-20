if isDedicated exitWith {};
if (!hasInterface && !isDedicated) exitWith {};

private _trigger = createTrigger ["EmptyDetector", getPosASL _this, false];
_trigger setTriggerArea [36.784, 45.907, 316.148, false, 25];
private _act = triggerActivation _trigger;
_act set [2, true];
_trigger setTriggerActivation _act;
_trigger setTriggerStatements [
	"(vehicle player) inArea thisTrigger",
	"thisTrigger spawn SMQTV_fnc_noFlyZone",
	""
];
_trigger setTriggerInterval 1;