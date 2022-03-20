params ["_control", "_newValue"];

setObjectViewDistance [getObjectViewDistance # 0, _newValue];
private _display = ctrlParent _control;
private _valorSombras = _display displayCtrl 1006;
_valorSombras ctrlSetText format ["%1m", round _newValue];

profileNamespace setVariable ["SMQTV_sombra", _newValue];