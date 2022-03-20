params ["_displayOrControl", ["_config", configNull]];

_texto = _displayOrControl displayCtrl 1000;
_pessoas = [];
_pessoasNum = 0;
_pessoasAnt = 0;
_plural = '';

_marker = createMarkerLocal ["areaTransp", [15170.2,17263.5]];
_marker setMarkerShapeLocal "RECTANGLE";
_marker setMarkerSizeLocal [97.460, 138.769];
_marker setMarkerDirLocal 45.849;

while {sleep 2; !isNull _displayOrControl} do {

	_pessoas = playableUnits select {_x inArea _marker && {typeOf _x isNotEqualTo "B_Helipilot_F"}};
	if (_pessoas isEqualTo []) then {
		_texto ctrlSetStructuredText parseText "Não há jogadores para transportar na base";
		_pessoasAnt = 0;
	} else {
		_pessoasNum = count _pessoas;
		if (_pessoasNum isNotEqualTo _pessoasAnt) then {_texto spawn SMQTV_fnc_hudVFX};
		if (_pessoasNum isEqualTo 1) then {_plural = " jogador "} else {_plural = " jogadores "};
		_texto ctrlSetStructuredText parseText (["Há <t color='#cc0000'>", _pessoasNum, _plural, "</t>na base (ajude com o transporte)"] joinString "");
		_pessoasAnt = _pessoasNum;
	};
};

deleteMarkerLocal _marker;