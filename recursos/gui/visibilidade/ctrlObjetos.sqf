params ["_control", "_newValue"];

private _display = ctrlParent _control;
private _valorObj = _display displayCtrl 1004;
if (viewDistance >= _newValue) then {
	setObjectViewDistance _newValue;
	_valorObj ctrlSetText format ["%1m", round _newValue];
} else {
	_valorObj ctrlSetText "Impossível ultrapassar a visibilidade de terreno";
	_control sliderSetPosition viewDistance;
};

profileNamespace setVariable ["SMQTV_objViewDistance", _newValue];