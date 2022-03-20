params ["_control", "_newValue"];

setViewDistance _newValue;
private _display = ctrlParent _control;
private _valorTerreno = _display displayCtrl 1002;
_valorTerreno ctrlSetText format ["%1m", round _newValue];

profileNamespace setVariable ["SMQTV_viewDistance", _newValue];