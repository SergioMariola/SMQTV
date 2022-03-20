params ["_displayOrControl", ["_config", configNull]];
uiNamespace setVariable ['SMQTV_earplugs', _displayOrControl];
private _ctrl = _displayOrControl displayCtrl 1000;
private _texto = _displayOrControl displayCtrl 1003;
private _barra = _displayOrControl displayCtrl 1200;

_texto ctrlShow false;
_barra ctrlShow false;

if (SMQTV_earplugs) then {
	_ctrl ctrlSetStructuredText parseText "Abafador [TAB]: <t color='#00cc66'>Ativado</t>";
} else {
	_ctrl ctrlSetStructuredText parseText "Abafador [TAB]: <t color='#ff4d4d'>Desativado</t>";
};