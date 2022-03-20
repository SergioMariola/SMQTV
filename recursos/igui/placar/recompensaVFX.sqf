if ((typeOf player) in LISTA_PILOTOS) exitWith {};

params ["_display", "_ctrlKS"];

private _ctrl = _display displayCtrl 3202;
if !(ctrlCommitted _ctrl) exitWith {};

_pos = ctrlPosition _ctrl;
_posY = _pos select 1;
_ctrl ctrlSetFade 0;
_ctrl ctrlCommit 0.5;
_ctrl ctrlSetPositionY (_posY - 0.05);
_ctrl ctrlCommit 0.5;

waitUntil { ctrlCommitted _ctrl };

_ctrl ctrlSetFade 1;
_ctrl ctrlCommit 2;

waitUntil { ctrlCommitted _ctrl };

_ctrl ctrlSetPosition _pos;
_ctrl ctrlCommit 0;