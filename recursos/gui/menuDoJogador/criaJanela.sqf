params ["_displayOrControl", ["_config", configNull]];

private _insigniaTexto 	= [player] call BIS_fnc_getUnitInsignia;
private _insignia		= _displayOrControl displayCtrl 1201;
private _nome			= _displayOrControl displayCtrl 1001;
private _papel			= _displayOrControl displayCtrl 1002;
private	_padrao			= _displayOrControl displayCtrl 999;

_padrao ctrlShow false;
if (_insigniaTexto isEqualTo '') then {
	_insignia ctrlShow false;
} else {
	_caminho = getText (missionConfigFile >> "CfgUnitInsignia" >> _insigniaTexto >> "texture");
	if (_caminho isEqualTo '') then {
		_caminho = getText (configFile >> "CfgUnitInsignia" >> _insigniaTexto >> "texture");
	};
	_insignia ctrlSetText _caminho;
};
_nome ctrlSetText (name player);
_papel ctrlSetText (roleDescription player);