params ["_displayOrControl", ["_config", configNull]];

(_displayOrControl displayCtrl 123) ctrlShow false; //Apaga botão falso

waitUntil { !isNil "SMQTV_playerClass" };

execVM "recursos\gui\boasVindas\musicaIntro.sqf";

private _nome 			= ["&NOME"] call SMQTV_fnc_dbAtributoJogador;
private _kills 			= ["&KILLS"] call SMQTV_fnc_dbAtributoJogador;
private _mortes 		= ["&MORTES"] call SMQTV_fnc_dbAtributoJogador;
private _loginVezes 	= ["&VEZES_LOGIN"] call SMQTV_fnc_dbAtributoJogador;
private _loginAux		= ["&ULTIMO_LOGIN"] call SMQTV_fnc_dbAtributoJogador;
private _ultimoLogin	= format ["%1/%2/%3 às %4h%5m", _loginAux select 2, _loginAux select 1, _loginAux select 0, _loginAux select 3, _loginAux select 4];

//Texto principal
private _ctrlTexto		= _displayOrControl displayCtrl 1100;
private _texto			= parseText format ["<br/>
Bem-vindo, %3!
<br/>
Esta é a sua <t shadow='2' color='%1'>%6</t>ª visita.
<br/><br/>
Seu último login foi em <t shadow='2' color='%1'>%5</t>.
<br/>
Neste servidor você já eliminou <t shadow='2' color='%1'>%4</t> inimigos e foi morto <t shadow='2' color='%1'>%7</t> vezes.
<br/><br/>
Este servidor roda a missão <t shadow='2' color='%1'>Invade and Annex</t>, originalmente criada pelo grupo <t shadow='2' color='%2'>Ahoy World</t>, reconstruída do zero com código original, livre de bugs (servidor e cliente) e totalmente em PT-BR.
", COR_VERMELHO, "#3385ff", name player, _kills, _ultimoLogin, _loginVezes, _mortes];
_ctrlTexto ctrlSetStructuredText _texto;

//Lista de jogadores
private _ctrlListaTitulo 		= _displayOrControl displayCtrl 1001;
private _ctrlListaTituloTexto	= ctrlText _ctrlListaTitulo;
private _ctrlListaJogadores		= _displayOrControl displayCtrl 1500;
private _jogadores 				= [];

while {!isNull _displayOrControl} do {
	{ _jogadores pushBack [name _x, roleDescription _x] } forEach allPlayers;
	_jogadores sort true;
	{
		_ctrlListaJogadores lbAdd (_x # 0);
		_ctrlListaJogadores lbSetTooltip [_forEachIndex, _x # 1];
		if (_x # 0 isEqualTo (name player)) then {
			_ctrlListaJogadores lbSetText [_forEachIndex, (_ctrlListaJogadores lbText _forEachIndex) + " (Você)"];
			_ctrlListaJogadores lbSetColor [_forEachIndex, [1,0,0,1]];
		};
	} forEach (_jogadores);
	_ctrlListaTitulo ctrlSetText (format ["%1 (%2)", _ctrlListaTituloTexto, playersNumber west]);
	sleep 1;
	lbClear _ctrlListaJogadores;
	_jogadores resize 0;
};