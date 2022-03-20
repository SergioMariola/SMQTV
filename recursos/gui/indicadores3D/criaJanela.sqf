params ["_displayOrControl", ["_config", configNull]];

private _distSlider	= _displayOrControl displayCtrl 1900;
private	_distValor	= _displayOrControl displayCtrl 1002;
private	_nomeSlider	= _displayOrControl displayCtrl 1901;
private	_nomeValor	= _displayOrControl displayCtrl 1004;
private	_chkbox		= _displayOrControl displayCtrl 2800;

//Distância
private _vd = viewDistance;
_distSlider sliderSetRange [50, _vd];
if (SMQTV_maxDist3D > _vd) then {
	_distSlider sliderSetPosition _vd;
	_distValor ctrlSetText ([_vd, 'm'] joinString "");
} else {
	_distSlider sliderSetPosition SMQTV_maxDist3D;
	_distValor ctrlSetText ([SMQTV_maxDist3D, 'm'] joinString "");
};
_distSlider sliderSetSpeed [50, 50, 50];
_distSlider ctrlSetDisabledColor [1, 1, 1, 0.1];

//Nome
_nomeSlider sliderSetRange [0.01, 0.1];
_nomeSlider sliderSetPosition SMQTV_nomeTam3D;
_nomeSlider sliderSetSpeed [0.01, 0.01, 0.01];
_nomeSlider ctrlSetDisabledColor [1, 1, 1, 0.1];
_nomeValor ctrlSetText ([SMQTV_nomeTam3D * 1000, '%'] joinString "");

//Mostrar ícones
if (SMQTV_ind3DSair) then {
	_chkbox cbSetChecked false;
	_distSlider ctrlEnable false;
	_nomeSlider ctrlEnable false;
} else {
	_chkbox cbSetChecked true;
};