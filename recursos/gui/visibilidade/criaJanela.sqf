params ["_displayOrControl", ["_config", configNull]];

private _sliderFalso	= _displayOrControl displayCtrl 999;
private _cbFalso		= _displayOrControl displayCtrl 998;
private _textoFalso		= _displayOrControl displayCtrl 997;
private _valorFalso		= _displayOrControl displayCtrl 996;
_sliderFalso ctrlShow false;
_cbFalso ctrlShow false;
_textoFalso ctrlShow false;
_valorFalso ctrlShow false;

//--- Ambiente

private _env = environmentEnabled;

//Vida animal
private _chkVidaAnimal = _displayOrControl displayCtrl 2800;
if (_env select 0) then {_chkVidaAnimal cbSetChecked true} else {_chkVidaAnimal cbSetChecked false};

//Som ambiente

private _chkSomAmb = _displayOrControl displayCtrl 2801;
private _sliderAmbVol = _displayOrControl displayCtrl 1903;
_sliderAmbVol ctrlSetDisabledColor [1,1,1,0.1];
if (_env select 1) then {_chkSomAmb cbSetChecked true} else {
	_chkSomAmb cbSetChecked false;
	_sliderAmbVol ctrlEnable false;
};
_sliderAmbVol sliderSetRange [0, 1];
_sliderAmbVol sliderSetPosition (environmentVolume);
_sliderAmbVol sliderSetSpeed [0.1, 0.1, 0.1];

//---Terreno

//Slider 'Terreno'
private _sliderTerreno = _displayOrControl displayCtrl 1900;
private _valorTerreno = _displayOrControl displayCtrl 1002;
_sliderTerreno sliderSetRange [500, 12000];
_sliderTerreno sliderSetPosition viewDistance;
_sliderTerreno sliderSetSpeed [100, 100, 100];
_valorTerreno ctrlSetText format ["%1m", round viewDistance];

//Slider 'Objetos'
private _sliderObj = _displayOrControl displayCtrl 1901;
private _valorObj = _displayOrControl displayCtrl 1004;
private _objDist = getObjectViewDistance # 0;
_sliderObj sliderSetRange [500, 12000];
_sliderObj sliderSetPosition _objDist;
_sliderObj sliderSetSpeed [100, 100, 100];
_valorObj ctrlSetText format ["%1m", round _objDist];

//Slider 'Sombras'
private _sliderSombras = _displayOrControl displayCtrl 1902;
private _valorSombras = _displayOrControl displayCtrl 1006;
private _sombrasDist = getObjectViewDistance # 1;
_sliderSombras sliderSetRange [100, 1000];
_sliderSombras sliderSetPosition _sombrasDist;
_sliderSombras sliderSetSpeed [50, 50, 50];
_valorSombras ctrlSetText format ["%1m", round _sombrasDist];

//Combobox 'Grama'
private _cbGrama = _displayOrControl displayCtrl 2100;
{
	_cbGrama lbAdd _x;
} forEach ["Pouca", "Normal", "Muita"];
switch (getTerrainGrid) do {
	case 25: { _cbGrama lbSetCurSel 0 };
	case 12.5: { _cbGrama lbSetCurSel 1 };
	case 3.125: { _cbGrama lbSetCurSel 2 };
	default { };
};