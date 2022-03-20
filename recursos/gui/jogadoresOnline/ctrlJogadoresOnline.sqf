params ["_control", "_selectedIndex"];

private _uid = _control lbData _selectedIndex;
private _jogador = _uid call BIS_fnc_getUnitByUID;
private _dbInfo = [player, _jogador] spawn SMQTV_fnc_dbRequisitaJogador;

uiNamespace setVariable ["SMQTV_temp", _jogador];
waitUntil { scriptDone _dbInfo };

private _display = ctrlParent _control;
private _jogadorNome = _display displayCtrl 1002;
private _jogadorPapel = _display displayCtrl 1003;

_jogadorNome ctrlSetText (name _jogador);
_jogadorPapel ctrlSetText (roleDescription _jogador);

private _kills		= ["&KILLS"] call SMQTV_fnc_dbAtributoJogador;
private _mortes		= ["&MORTES"] call SMQTV_fnc_dbAtributoJogador;
private _loginVezes	= ["&VEZES_LOGIN"] call SMQTV_fnc_dbAtributoJogador;
private _colateral	= ["&COLATERAL"] call SMQTV_fnc_dbAtributoJogador;
private _halo		= ["&HALO"] call SMQTV_fnc_dbAtributoJogador;
private _saltoV		= ["&SALTO_VEICULO"] call SMQTV_fnc_dbAtributoJogador;
private _mandaChuva	= ["&MANDA_CHUVA"] call SMQTV_fnc_dbAtributoJogador;
private _gbu		= ["&GBU"] call SMQTV_fnc_dbAtributoJogador;
private _mk41		= ["&MK41"] call SMQTV_fnc_dbAtributoJogador;

private _textoKills		= _display displayCtrl 1013;
private _textoMortes	= _display displayCtrl 1014;
private _textoColateral	= _display displayCtrl 1015;
private _textoHALO		= _display displayCtrl 1016;
private _textoSaltoV	= _display displayCtrl 1017;
private _textoGBU		= _display displayCtrl 1018;
private _textoMK41		= _display displayCtrl 1019;
private _textoMC		= _display displayCtrl 1020;

_textoKills ctrlSetText str _kills;
_textoMortes ctrlSetText str _mortes;
_textoColateral ctrlSetText str _colateral;
_textoHALO ctrlSetText str _halo;
_textoSaltoV ctrlSetText str _saltoV;
_textoGBU ctrlSetText str _gbu;
_textoMK41 ctrlSetText str _mk41;
_textoMC ctrlSetText str _mandaChuva;

private _botaoKick = _display displayCtrl 1600;
private _botaoLoadout = _display displayCtrl 1602;

if (_jogador isEqualTo player) then {
	_botaoKick ctrlShow false;
	_botaoLoadout ctrlShow false;
} else {
	_botaoKick ctrlShow true;
	_botaoLoadout ctrlShow true;
};