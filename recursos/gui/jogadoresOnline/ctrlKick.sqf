params ["_control"];

private _display = ctrlParent _control;
private _jogadorNome = _display displayCtrl 1002;
private _nome = ctrlText _jogadorNome;
serverCommand (format ["#vote kick %1", _nome]);