date params ["_ano", "_mes", "_dia", "_hora", "_minuto"];
private _texto1 = format ["%1h %2min", _hora, _minuto, _dia, _mes, _ano];
private _texto2 = format ["%1 / %2 / %3", _dia, _mes, _ano];

[_texto1, _texto2] spawn BIS_fnc_infoText;