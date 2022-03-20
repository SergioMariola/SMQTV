params ["_control", "_selectedIndex"];

private _display = ctrlParent _control;
private _lista = _display displayCtrl 2100;
private _foto = _display displayCtrl 1201;
private _listaData = _lista lbPicture _selectedIndex;

if (_listaData isEqualTo "") then {
	_foto ctrlSetText "";
} else {
	_foto ctrlSetText _listaData;
};