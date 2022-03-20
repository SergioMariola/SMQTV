params ["_control", "_newValue"];

private _display = ctrlParent _control;
private _valorTxt = _display displayCtrl 1004;

SMQTV_nomeTam3D = _newValue;
profileNamespace setVariable ["SMQTV_nomeTam3D", _newValue];
_valorTxt ctrlSetText ([_newValue * 1000, '%'] joinString "");