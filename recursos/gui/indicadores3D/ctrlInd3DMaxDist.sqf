params ["_control", "_newValue"];

private _display = ctrlParent _control;
private _valorTxt = _display displayCtrl 1002;

SMQTV_maxDist3D = _newValue;
profileNamespace setVariable ["SMQTV_maxDist3D", _newValue];
_valorTxt ctrlSetText ([_newValue, 'm'] joinString "");