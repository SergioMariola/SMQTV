params ["_atributo"];

private _index = SMQTV_playerClass find _atributo;
if (_index > -1) then {
	private _resultado = SMQTV_playerClass select (_index + 1);
	_resultado
} else {0};