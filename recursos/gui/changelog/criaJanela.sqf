params ["_displayOrControl", ["_config", configNull]];

private _ctrlLista = _displayOrControl displayCtrl 1500;
private _changelog = localNamespace getVariable ["SMQTV_changelog", []];

{
	_ctrlLista lbAdd (_changelog select _forEachIndex select 0);
} forEach _changelog;

private _tam = lbSize _ctrlLista;
_ctrlLista lbSetCurSel (_tam - 1);