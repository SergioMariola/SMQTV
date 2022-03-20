params ["_display", "_exitCode"];

private _camera = uiNamespace getVariable ["SMQTV_insigniaCam", objNull];
if (isNull _camera || isNil "_camera") exitWith {player allowDamage true};
_camera cameraEffect ["terminate", "back"];
camDestroy _camera;
uiNamespace setVariable ["SMQTV_insigniaCam", nil];

player allowDamage true;

private _pDisplay = displayParent _display;
private _insignia = _pDisplay displayCtrl 1201;
private _insigniaTexto 	= [player] call BIS_fnc_getUnitInsignia;

if (_insigniaTexto isEqualTo '') then {
	_insignia ctrlShow false;
} else {
	_caminho = getText (missionConfigFile >> "CfgUnitInsignia" >> _insigniaTexto >> "texture");
	if (_caminho isEqualTo '') then {
		_caminho = getText (configFile >> "CfgUnitInsignia" >> _insigniaTexto >> "texture");
	};
	_insignia ctrlSetText _caminho;
};