params ["_control", "_checked"];

private _display = ctrlParent _control;
private _sliderAmbVol = _display displayCtrl 1903;
private _vidaAnimal = environmentEnabled select 0;
private _somAmb = false;

switch (_checked) do {
	case 0 : {
		enableEnvironment [_vidaAnimal, false];		
		_sliderAmbVol ctrlEnable false;
	};
	case 1 : {
		enableEnvironment [_vidaAnimal, true];
		_sliderAmbVol ctrlEnable true;
		_somAmb = true;
	};
	default {};
};

profileNamespace setVariable ["SMQTV_somAmb", _somAmb];