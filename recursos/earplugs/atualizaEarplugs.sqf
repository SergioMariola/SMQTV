_display = uiNamespace getVariable ['SMQTV_earplugs', displayNull];
if (isNull _display) exitWith {};

_sair = localNamespace getVariable ["SMQTV_earplugsSFX", false];
if _sair exitWith {};

localNamespace setVariable ["SMQTV_earplugsSFX", true];

_ctrl = _display displayCtrl 1000;
_textoBarra	= _display displayCtrl 1003;
_barra		= _display displayCtrl 1200;
_texto		= "";
_posX		= (ctrlPosition _ctrl) select 0;

_textoBarra ctrlShow true;
_barra ctrlShow true;

_ctrl ctrlSetPositionX (_posX - 0.05);
_ctrl ctrlCommit 0.1;
waitUntil { ctrlCommitted _ctrl };

_handle = [_barra, _textoBarra, SMQTV_earplugs] spawn {

	params ["_barra", "_textoBarra", "_tipo"];
	_limite = 0;

	if (_tipo) then {

		_i = progressPosition _barra;
		_limite = 1;
		while {_i < _limite} do {
			_barra progressSetPosition _i;
			_i = _i + 0.02;
			sleep 0.001;
		};
	} else {

		_i = 1;
		_limite = 0.1;
		while {_i > _limite} do {
			_barra progressSetPosition _i;
			_i = _i - 0.02;
			sleep 0.001;
		};
	};

	_barra progressSetPosition _limite;
	sleep 1.5;
	_barra ctrlShow false;
	_textoBarra ctrlShow false;
	localNamespace setVariable ["SMQTV_earplugsSFX", nil];
};

if (SMQTV_earplugs) then {
	_texto = "Abafador [TAB]: <t color='#ff4d4d'>Desativado</t>";
	0.5 fadeSound SMQTV_volumeSom;
	0.5 fadeMusic SMQTV_volumeMusica;
} else {
	_texto = "Abafador [TAB]: <t color='#00cc66'>Ativado</t>";
	0.5 fadeSound (soundVolume * 0.1);
	0.5 fadeMusic (musicVolume * 0.1);
};

_ctrl ctrlSetStructuredText parseText _texto;
_ctrl ctrlSetPositionX _posX;
_ctrl ctrlCommit 0.5;
waitUntil { ctrlCommitted _ctrl && {scriptDone _handle} };
SMQTV_earplugs = !SMQTV_earplugs;