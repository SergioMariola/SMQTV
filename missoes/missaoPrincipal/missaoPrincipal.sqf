private _marcadoresAO		= allMapMarkers select {"missao" in _x};
private _handleJato			= scriptNull;
private _handleReforco		= scriptNull;
private _handleTarefas		= scriptNull;
private _handleExtracao		= scriptNull;
private _handleExcluirMP	= scriptNull;
private _missaoPos			= [];
private _marcadorMissao		= "";
private _marcadorMissaoArea	= "";
private _sair				= false;

while {true} do
{
	_marcadorMissao = selectRandom _marcadoresAO;
	_missaoPos = getMarkerPos [_marcadorMissao, true];

	[_missaoPos] spawn SMQTV_fnc_inimigosAO;
	[_missaoPos] spawn SMQTV_fnc_aaAO;
	[_missaoPos, 10] spawn SMQTV_fnc_carroBomba;
	_handleCivis	= [_missaoPos] spawn SMQTV_fnc_civisAO;
	_handleReforco	= [_missaoPos] spawn SMQTV_fnc_reforcoAO;
	_handleJato		= [_missaoPos] spawn SMQTV_fnc_patrulhaJatoAO;

	sleep 30;

	_marcadorMissaoArea	= ["criarMP", _marcadorMissao] call SMQTV_fnc_criaMarcador;
	_handleTarefas		= [_missaoPos, _marcadorMissaoArea] spawn SMQTV_fnc_tarefas;

	waitUntil {
		sleep 5;
		scriptDone _handleTarefas
	};

	[inimigosAO] spawn SMQTV_fnc_excluiObjetos;
	[inimigosAA] spawn SMQTV_fnc_excluiObjetos;
	[civisAO] spawn SMQTV_fnc_excluiObjetos;
	terminate _handleJato;
	terminate _handleReforco;
	terminate _handleCivis;

	_handleExcluirMP = ["excluirMP", _marcadorMissao, _marcadoresAO] spawn SMQTV_fnc_criaMarcador;
	waitUntil {scriptDone _handleExcluirMP};

	if (_marcadoresAO isEqualTo []) exitWith {_sair = true; "EveryoneWon" call BIS_fnc_endMissionServer;};

	waitUntil { count inimigosAO == 0 && {count inimigosAA == 0 && {count civisAO == 0}} };
	sleep 5;
	if _sair exitWith {};
	sleep 5;
};