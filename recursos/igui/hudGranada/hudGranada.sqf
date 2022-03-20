params ["_displayOrControl", ["_config", configNull]];

private _ctrl = _displayOrControl displayCtrl 1000;
private _granada = uiNamespace getVariable ["SMQTV_granada", ""];

_posY = ctrlPosition _ctrl;
_ctrl ctrlSetText _granada;
_ctrl ctrlSetPositionY ((_posY select 1) - 0.05);
_ctrl ctrlCommit 0.3;