params ["_displayOrControl", ["_config", configNull]];

private _botaoFalso = _displayOrControl displayCtrl 111;
private _textoCaixa = _displayOrControl displayCtrl 1100;
private _texto = "<t size='1.4'>Clique nos botões ao lado</t>";

_botaoFalso ctrlShow false;
_textoCaixa ctrlSetStructuredText (parseText _texto);