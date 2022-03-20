params ["_control", "_newValue"];

player setCustomAimCoef _newValue;
private _display = ctrlParent _control;
private _miraValor = _display displayCtrl 1003;
_miraValor ctrlSetText (format ["%1", _newValue * 100]) + "%";

profileNamespace setVariable ["SMQTV_wSway", _newValue];