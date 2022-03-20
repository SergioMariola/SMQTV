params ["_control", "_checked"];

private _somAmb = environmentEnabled select 1;
private _vidaAnimal = false;

switch (_checked) do {
	case 0 : {
		enableEnvironment [false, _somAmb];
	};
	case 1 : {
		enableEnvironment [true, _somAmb];
		_vidaAnimal = true;
	};
	default {};
};

profileNamespace setVariable ["SMQTV_vidaAnimal", _vidaAnimal];