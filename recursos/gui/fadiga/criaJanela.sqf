params ["_displayOrControl", ["_config", configNull]];

//ComboBox 'Fadiga'
private _fadigaCB = _displayOrControl displayCtrl 2800;
if (isStaminaEnabled player) then {
	_fadigaCB cbSetChecked true;
};

//Slider 'Balanço da mira'
private _miraSlider	= _displayOrControl displayCtrl 1900;
private _miraValor	= _displayOrControl displayCtrl 1003;
private _aimCoef	= getCustomAimCoef player;

_miraSlider sliderSetRange [0, 1];
_miraSlider sliderSetPosition _aimCoef;
_miraSlider sliderSetSpeed [0.1, 0.1, 0.1];
_miraValor ctrlSetText (format ["%1", _aimCoef * 100] + "%");