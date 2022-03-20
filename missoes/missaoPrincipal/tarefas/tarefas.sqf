params ["_missaoPos", "_marcadorMissaoArea"];
_tarefaID = "missaoPrincipal_" + str incrementoMP;

["criaTarefa", _tarefaID, "descricaoPrincipal", "tipoPrincipal", true, _missaoPos] spawn SMQTV_fnc_trataTarefas;

sleep 5;

_tarefas 		= [];
_handleTorre	= [_missaoPos, _tarefaID] spawn SMQTV_fnc_torre;
_handleMaleta	= [_missaoPos, _tarefaID] spawn SMQTV_fnc_maleta;
_handleIgreja	= [_missaoPos, _tarefaID] spawn SMQTV_fnc_igreja;
_handleGasolina	= [_missaoPos, _tarefaID] spawn SMQTV_fnc_gasolina;
_handleDrone	= [_missaoPos, _tarefaID] spawn SMQTV_fnc_drone;
_handleAgua		= [_missaoPos, _tarefaID] spawn SMQTV_fnc_agua;
_handleTerminal	= [_missaoPos, _marcadorMissaoArea, _tarefaID] spawn SMQTV_fnc_terminal;
_handleEnergia	= [_missaoPos, _tarefaID] spawn SMQTV_fnc_energia;

_tarefas append [_handleTorre, _handleMaleta, _handleIgreja, _handleGasolina, _handleDrone, _handleAgua, _handleTerminal, _handleEnergia];

waitUntil {
	sleep 5;
	( { !scriptDone _x } count _tarefas ) isEqualTo 0
};

_handleExtIA	= [_missaoPos, _marcadorMissaoArea] spawn SMQTV_fnc_extracaoIA;
_jogadores		= [];

//Altera descrição de tarefa
[
	"alteraDescricaoTarefa",
	_tarefaID,
	"ATUALIZAÇÃO: Deixe a Área de Operações para finalizar a missão!"
] spawn SMQTV_fnc_trataTarefas;

//Completa a missão
["alteraEstadoTarefa", _tarefaID, "SUCCEEDED"] spawn SMQTV_fnc_trataTarefas;
_jogadores = playableUnits inAreaArray _marcadorMissaoArea;
if (_jogadores isNotEqualTo []) then {
	["Missão completa", "verde", 5] remoteExec ["SMQTV_fnc_barraAviso", _jogadores];
};

//Aguarda a área da missão estar limpa de jogadores
waitUntil {
	sleep 15;
	_jogadores = playableUnits inAreaArray _marcadorMissaoArea;
	if (_jogadores isNotEqualTo []) then {
		["Saia da área vermelha para completar a missão", nil, 10, [1,1,1,1]] remoteExec ["BIS_fnc_WLSmoothText", _jogadores];
	};
	_jogadores isEqualTo []
};

//Finaliza missão
["excluiTarefa", _tarefaID] spawn SMQTV_fnc_trataTarefas;
incrementoMP = incrementoMP + 1;