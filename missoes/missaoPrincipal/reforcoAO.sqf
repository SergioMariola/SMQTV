params ["_centro"];

sleep 60;
private _qtd				= [inimigosAO] call SMQTV_fnc_contaVivos;
private _qtdAtual			= 0;
private _coef				= 0;
private _tipoSelecionado	= [];
sleep 10;

while {true} do
{
	_qtdAtual = [inimigosAO] call SMQTV_fnc_contaVivos;

	if (_qtdAtual <= (_qtd - 0.25 * _qtd)) then
	{
		_tipoSelecionado = selectRandom REFORCO_TIPOS;
		[1, _centro, east, _tipoSelecionado, "aoReforco"] spawn SMQTV_fnc_criaInimigos;
	};	
	sleep 360;
};