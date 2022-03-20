params ["_control", "_selectedIndex"];

private _display = ctrlParent _control;
private _telaTexto = _display displayCtrl 1100;
private _changelog = localNamespace getVariable ["SMQTV_changelog", []];
_telaTexto ctrlSetStructuredText (parseText (_changelog select _selectedIndex select 1));